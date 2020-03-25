Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 59D3B192ACE
	for <lists+xen-devel@lfdr.de>; Wed, 25 Mar 2020 15:09:56 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jH6hJ-00060p-Hc; Wed, 25 Mar 2020 14:07:57 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=grKZ=5K=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jH6hH-00060i-Bd
 for xen-devel@lists.xenproject.org; Wed, 25 Mar 2020 14:07:55 +0000
X-Inumbo-ID: 04b92be2-6ea2-11ea-bec1-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 04b92be2-6ea2-11ea-bec1-bc764e2007e4;
 Wed, 25 Mar 2020 14:07:53 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id D58ADAC6C;
 Wed, 25 Mar 2020 14:07:52 +0000 (UTC)
To: Andrew Cooper <andrew.cooper3@citrix.com>
References: <20200323101724.15655-1-andrew.cooper3@citrix.com>
 <20200323101724.15655-7-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <d6c9685b-e3a1-2837-3123-8fded5418856@suse.com>
Date: Wed, 25 Mar 2020 15:07:48 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <20200323101724.15655-7-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Subject: Re: [Xen-devel] [PATCH 6/7] x86/ucode/intel: Clean up
 microcode_sanity_check()
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

On 23.03.2020 11:17, Andrew Cooper wrote:
> Rewrite the size checks in a way which which doesn't depend on Xen being
> compiled as 64bit.

One too many "which"?

> Introduce a check missing from the old code, that total_size is a multiple of
> 1024 bytes,

Where is this documented? The rather brief section in SDM vol 3 doesn't
mention anything like this.

> and drop unnecessarily defines/macros/structures.

unnecessary?

> @@ -160,93 +153,69 @@ static int collect_cpu_info(struct cpu_signature *csig)
>      return 0;
>  }
>  
> +/*
> + * Sanity check a blob which is expected to be a microcode patch.  The 48 byte
> + * header is of a known format, and together with totalsize are within the
> + * bounds of the container.  Everything else is unchecked.
> + */
>  static int microcode_sanity_check(const struct microcode_intel *mc)
>  {
> -    const struct microcode_header_intel *mc_header = &mc->hdr;
> -    const struct extended_sigtable *ext_header = NULL;
> -    const struct extended_signature *ext_sig;
> -    unsigned long total_size, data_size, ext_table_size;
> -    unsigned int ext_sigcount = 0, i;
> -    uint32_t sum, orig_sum;
> -
> -    total_size = get_totalsize(mc_header);
> -    data_size = get_datasize(mc_header);
> -    if ( (data_size + MC_HEADER_SIZE) > total_size )
> -    {
> -        printk(KERN_ERR "microcode: error! "
> -               "Bad data size in microcode data file\n");
> +    const struct extended_sigtable *ext;
> +    unsigned int total_size = get_totalsize(&mc->hdr);
> +    unsigned int data_size = get_datasize(&mc->hdr);
> +    unsigned int i, ext_size;
> +    uint32_t sum, *ptr;
> +
> +    /*
> +     * Total size must be a multiple of 1024 bytes.  Data size and the header
> +     * must fit within it.
> +     */
> +    if ( (total_size & 1023) ||

Personally I'd fine a hex number easier to recognize in cases like
this.

> +         data_size > (total_size - MC_HEADER_SIZE) )
>          return -EINVAL;
> -    }
>  
> -    if ( (mc_header->ldrver != 1) || (mc_header->hdrver != 1) )
> -    {

Ah - you're dropping this check here altogether. As said on the
earlier patch, I think this may more logically go there.

> -        printk(KERN_ERR "microcode: error! "
> -               "Unknown microcode update format\n");

While this printk() was already suggested to be moved, I'm not
convinced dropping others further down is helpful in case of
issues. We'd see just -EINVAL with no further indication of
what was (deemed) wrong.

> +    /* Checksum the main header and data. */
> +    for ( sum = 0, ptr = (uint32_t *)mc;
> +          ptr < (uint32_t *)&mc->data[data_size]; ++ptr )

You're casting away constness here which future compilers may
(legitimately) warn about. (Similarly again further down.)

Jan

