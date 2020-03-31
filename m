Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E50E199875
	for <lists+xen-devel@lfdr.de>; Tue, 31 Mar 2020 16:30:01 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jJHqp-0006AJ-5q; Tue, 31 Mar 2020 14:26:47 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=fshn=5Q=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1jJHqn-0006AE-D6
 for xen-devel@lists.xenproject.org; Tue, 31 Mar 2020 14:26:45 +0000
X-Inumbo-ID: a556c218-735b-11ea-ba27-12813bfff9fa
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id a556c218-735b-11ea-ba27-12813bfff9fa;
 Tue, 31 Mar 2020 14:26:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1585664804;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=rrTJH7ldLo5iCGxHST0YAJVb2MPlxfVU47cJmwfxjwc=;
 b=Wm8L5aqynOyzSks9vNDRYwPz9fd42xoVShEwl6wWEuKGqzHfnj2dsVQo
 1SFZRH9HULtOzHT3KOpJtQnvaVaNDQ5d9tZphx9t/I3LCZSh5+T/gQlOj
 myiE75UqTuNpgJhZocK/F+o7jgWWxlJFgBXdW/XJ6G4tIuDeN5pT3f5pt c=;
Authentication-Results: esa4.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=andrew.cooper3@citrix.com;
 spf=Pass smtp.mailfrom=Andrew.Cooper3@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 andrew.cooper3@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="andrew.cooper3@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa4.hc3370-68.iphmx.com: domain of
 Andrew.Cooper3@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="Andrew.Cooper3@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: hhC1UTujVSifC70GjSmvrCkCM41Icy2+3QNuGZBRDZF+fnSnIHvyK6walrmKJMGSXhLOzExCDs
 MXzmCvlJgw7C9dNntBzxRG7BpzPFvJ6Pmo7dJPgd8KBTMKsC2bAxamgN1G8DCqvufBj3BYEmjh
 iISG/OL8C3xun4yLmPtQjHuPsY1RlHEAi5GGLQdVtV0UsD9MmRZzNMO6Dp2uARUq8b2JpsBI21
 t9nUlTrDMP41eLxM+m2aBu10vdkP1H4spe47+CE9aiu9+yOdfMNGUfyb3oPIkLKgsi8YpH2eeR
 cDY=
X-SBRS: 2.7
X-MesageID: 15589968
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.72,328,1580792400"; d="scan'208";a="15589968"
Subject: Re: [PATCH v2 6/7] x86/ucode/intel: Clean up microcode_sanity_check()
To: Jan Beulich <jbeulich@suse.com>
References: <20200327122901.11569-1-andrew.cooper3@citrix.com>
 <20200327122901.11569-7-andrew.cooper3@citrix.com>
 <e6b7cd41-3669-640f-71ad-e868e9fd513a@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <2e740576-99a0-2010-2d8f-bc10ec556dc6@citrix.com>
Date: Tue, 31 Mar 2020 15:26:40 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <e6b7cd41-3669-640f-71ad-e868e9fd513a@suse.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
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

On 31/03/2020 15:18, Jan Beulich wrote:
> On 27.03.2020 13:29, Andrew Cooper wrote:
>> @@ -160,93 +153,85 @@ static int collect_cpu_info(struct cpu_signature *csig)
>>      return 0;
>>  }
>>  
>> -static int microcode_sanity_check(const struct microcode_patch *mc)
>> +/*
>> + * Sanity check a blob which is expected to be a microcode patch.  The 48 byte
>> + * header is of a known format, and together with totalsize are within the
>> + * bounds of the container.  Everything else is unchecked.
>> + */
>> +static int microcode_sanity_check(const struct microcode_patch *patch)
>>  {
>> -    const struct microcode_header_intel *mc_header = &mc->hdr;
>> -    const struct extended_sigtable *ext_header = NULL;
>> -    const struct extended_signature *ext_sig;
>> -    unsigned long total_size, data_size, ext_table_size;
>> -    unsigned int ext_sigcount = 0, i;
>> -    uint32_t sum, orig_sum;
>> -
>> -    total_size = get_totalsize(mc);
>> -    data_size = get_datasize(mc);
>> -    if ( (data_size + MC_HEADER_SIZE) > total_size )
>> +    const struct extended_sigtable *ext;
>> +    const uint32_t *ptr;
>> +    unsigned int total_size = get_totalsize(patch);
>> +    unsigned int data_size = get_datasize(patch);
>> +    unsigned int i, ext_size;
>> +    uint32_t sum;
>> +
>> +    /*
>> +     * Total size must be a multiple of 1024 bytes.  Data size and the header
>> +     * must fit within it.
>> +     */
>> +    if ( (total_size & 1023) ||
>> +         data_size > (total_size - MC_HEADER_SIZE) )
>>      {
>> -        printk(KERN_ERR "microcode: error! "
>> -               "Bad data size in microcode data file\n");
>> +        printk(XENLOG_WARNING "microcode: Bad size\n");
>>          return -EINVAL;
>>      }
>>  
>> -    if ( (mc_header->ldrver != 1) || (mc_header->hdrver != 1) )
>> -    {
>> -        printk(KERN_ERR "microcode: error! "
>> -               "Unknown microcode update format\n");
>> +    /* Checksum the main header and data. */
>> +    for ( sum = 0, ptr = (const uint32_t *)patch;
>> +          ptr < (const uint32_t *)&patch->data[data_size]; ++ptr )
>> +        sum += *ptr;
>> +
>> +    if ( sum != 0 )
>>          return -EINVAL;
> The error message for this looks to have been lost, or ...
>
>> -    }
>> -    ext_table_size = total_size - (MC_HEADER_SIZE + data_size);
>> -    if ( ext_table_size )
>> +
>> +    /* Look to see if there is an extended signature table. */
>> +    ext_size = total_size - data_size - MC_HEADER_SIZE;
>> +
>> +    /* No extended signature table?  All done. */
>> +    if ( ext_size == 0 )
>>      {
>> -        if ( (ext_table_size < EXT_HEADER_SIZE) ||
>> -             ((ext_table_size - EXT_HEADER_SIZE) % EXT_SIGNATURE_SIZE) )
>> -        {
>> -            printk(KERN_ERR "microcode: error! "
>> -                   "Small exttable size in microcode data file\n");
>> -            return -EINVAL;
>> -        }
>> -        ext_header = (void *)mc + MC_HEADER_SIZE + data_size;
>> -        if ( ext_table_size != exttable_size(ext_header) )
>> -        {
>> -            printk(KERN_ERR "microcode: error! "
>> -                   "Bad exttable size in microcode data file\n");
>> -            return -EFAULT;
>> -        }
>> -        ext_sigcount = ext_header->count;
>> +        printk(XENLOG_WARNING "microcode: Bad checksum\n");
>> +        return 0;
> ... to have got mistakenly moved here.

It was mistakenly moved.  I found and fixed that at some point after
sending this series.

>  With this addressed
> Reviewed-by: Jan Beulich <jbeulich@suse.com>

Thanks,

~Andrew

