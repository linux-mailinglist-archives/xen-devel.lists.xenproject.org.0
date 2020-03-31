Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5858E199857
	for <lists+xen-devel@lfdr.de>; Tue, 31 Mar 2020 16:22:36 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jJHjC-0005F2-1p; Tue, 31 Mar 2020 14:18:54 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=DP+J=5Q=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jJHjA-0005Et-6r
 for xen-devel@lists.xenproject.org; Tue, 31 Mar 2020 14:18:52 +0000
X-Inumbo-ID: 8a9e2dff-735a-11ea-ba27-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 8a9e2dff-735a-11ea-ba27-12813bfff9fa;
 Tue, 31 Mar 2020 14:18:51 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 3C5E8AC92;
 Tue, 31 Mar 2020 14:18:50 +0000 (UTC)
Subject: Re: [PATCH v2 6/7] x86/ucode/intel: Clean up microcode_sanity_check()
To: Andrew Cooper <andrew.cooper3@citrix.com>
References: <20200327122901.11569-1-andrew.cooper3@citrix.com>
 <20200327122901.11569-7-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <e6b7cd41-3669-640f-71ad-e868e9fd513a@suse.com>
Date: Tue, 31 Mar 2020 16:18:48 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <20200327122901.11569-7-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 27.03.2020 13:29, Andrew Cooper wrote:
> @@ -160,93 +153,85 @@ static int collect_cpu_info(struct cpu_signature *csig)
>      return 0;
>  }
>  
> -static int microcode_sanity_check(const struct microcode_patch *mc)
> +/*
> + * Sanity check a blob which is expected to be a microcode patch.  The 48 byte
> + * header is of a known format, and together with totalsize are within the
> + * bounds of the container.  Everything else is unchecked.
> + */
> +static int microcode_sanity_check(const struct microcode_patch *patch)
>  {
> -    const struct microcode_header_intel *mc_header = &mc->hdr;
> -    const struct extended_sigtable *ext_header = NULL;
> -    const struct extended_signature *ext_sig;
> -    unsigned long total_size, data_size, ext_table_size;
> -    unsigned int ext_sigcount = 0, i;
> -    uint32_t sum, orig_sum;
> -
> -    total_size = get_totalsize(mc);
> -    data_size = get_datasize(mc);
> -    if ( (data_size + MC_HEADER_SIZE) > total_size )
> +    const struct extended_sigtable *ext;
> +    const uint32_t *ptr;
> +    unsigned int total_size = get_totalsize(patch);
> +    unsigned int data_size = get_datasize(patch);
> +    unsigned int i, ext_size;
> +    uint32_t sum;
> +
> +    /*
> +     * Total size must be a multiple of 1024 bytes.  Data size and the header
> +     * must fit within it.
> +     */
> +    if ( (total_size & 1023) ||
> +         data_size > (total_size - MC_HEADER_SIZE) )
>      {
> -        printk(KERN_ERR "microcode: error! "
> -               "Bad data size in microcode data file\n");
> +        printk(XENLOG_WARNING "microcode: Bad size\n");
>          return -EINVAL;
>      }
>  
> -    if ( (mc_header->ldrver != 1) || (mc_header->hdrver != 1) )
> -    {
> -        printk(KERN_ERR "microcode: error! "
> -               "Unknown microcode update format\n");
> +    /* Checksum the main header and data. */
> +    for ( sum = 0, ptr = (const uint32_t *)patch;
> +          ptr < (const uint32_t *)&patch->data[data_size]; ++ptr )
> +        sum += *ptr;
> +
> +    if ( sum != 0 )
>          return -EINVAL;

The error message for this looks to have been lost, or ...

> -    }
> -    ext_table_size = total_size - (MC_HEADER_SIZE + data_size);
> -    if ( ext_table_size )
> +
> +    /* Look to see if there is an extended signature table. */
> +    ext_size = total_size - data_size - MC_HEADER_SIZE;
> +
> +    /* No extended signature table?  All done. */
> +    if ( ext_size == 0 )
>      {
> -        if ( (ext_table_size < EXT_HEADER_SIZE) ||
> -             ((ext_table_size - EXT_HEADER_SIZE) % EXT_SIGNATURE_SIZE) )
> -        {
> -            printk(KERN_ERR "microcode: error! "
> -                   "Small exttable size in microcode data file\n");
> -            return -EINVAL;
> -        }
> -        ext_header = (void *)mc + MC_HEADER_SIZE + data_size;
> -        if ( ext_table_size != exttable_size(ext_header) )
> -        {
> -            printk(KERN_ERR "microcode: error! "
> -                   "Bad exttable size in microcode data file\n");
> -            return -EFAULT;
> -        }
> -        ext_sigcount = ext_header->count;
> +        printk(XENLOG_WARNING "microcode: Bad checksum\n");
> +        return 0;

... to have got mistakenly moved here. With this addressed
Reviewed-by: Jan Beulich <jbeulich@suse.com>

Jan

