Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 984D57F1AB6
	for <lists+xen-devel@lfdr.de>; Mon, 20 Nov 2023 18:38:32 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.637146.992902 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r58Dz-0006Gy-08; Mon, 20 Nov 2023 17:38:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 637146.992902; Mon, 20 Nov 2023 17:38:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r58Dy-0006F1-TV; Mon, 20 Nov 2023 17:38:18 +0000
Received: by outflank-mailman (input) for mailman id 637146;
 Mon, 20 Nov 2023 17:38:17 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=6jYu=HB=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1r58Dx-0006Et-FZ
 for xen-devel@lists.xenproject.org; Mon, 20 Nov 2023 17:38:17 +0000
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [2a00:1450:4864:20::331])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 964476c7-87cb-11ee-98e0-6d05b1d4d9a1;
 Mon, 20 Nov 2023 18:38:16 +0100 (CET)
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-40790b0a224so16806835e9.0
 for <xen-devel@lists.xenproject.org>; Mon, 20 Nov 2023 09:38:16 -0800 (PST)
Received: from [192.168.1.10] (host-92-26-107-252.as13285.net. [92.26.107.252])
 by smtp.gmail.com with ESMTPSA id
 f16-20020a05600c155000b003fe1fe56202sm14320824wmg.33.2023.11.20.09.38.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 20 Nov 2023 09:38:15 -0800 (PST)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
X-Inumbo-ID: 964476c7-87cb-11ee-98e0-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1700501896; x=1701106696; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=NSnj4Ir/BIyg7YqVMpipKz0H2y+awRGAO5bBiPXFF24=;
        b=nWRqB/ZJLQRjBKwRTBU92ulCIBhHgED+d0qIREP+vmUHe0sd68gxbPnBWM0npwV1v4
         IGrz9MeQ5W6Gf9kmScKMg/uYtp+ze0bIgeVT9wUfYCnKpaDNGewg8rQpYJ3ckVamqOHo
         oFugCq2JPb8cZt2ATrVwZxdwdNZst8CCgWArM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700501896; x=1701106696;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=NSnj4Ir/BIyg7YqVMpipKz0H2y+awRGAO5bBiPXFF24=;
        b=UUx14Yfzsnwi0TuVBxLR5TjF1fARkvebiLPhwvxTnDnTxXd4etZ5ActwnDHsi0FkgS
         h7AUk4rnvVJ75RCS3l3r2RalbeZ/h5vTF2aboiza0T4PrIQc1A5QteQPElgUM9Ec5MPH
         USNTCmhKmG3sOqDCbARfPvIuG5/JIMFOR/zXz9lR2VkxxwztJqHYICugZjSvXXsux7JN
         z2A4ThxwtYjT+r/eXkJlXfxOBh0YPL6YLb3+upyI8c8l9mQ/FcWgXcvA+4gBFH1C3GCE
         ODfG5EeE837X3kcPQSLHGNX2jazjcferkxLPKRZBWRhs18BHx9M5cFKUqMB6zJFWN/xc
         Im0w==
X-Gm-Message-State: AOJu0YyGlpG5JPSutFoyICIUtoC7DQ+TfA4peItiZGJrkYxV79eL02Ud
	3O1/HHeBcvOQ5uZDqeydkgbqWQ==
X-Google-Smtp-Source: AGHT+IET9orfASAPMQ6FezJGVO+rpzWc3i4up7r8RvcwCAsrHJlIN/DH1juSOlSBTAxUUFeASXp3sw==
X-Received: by 2002:a05:600c:1c8b:b0:3fe:f667:4e4c with SMTP id k11-20020a05600c1c8b00b003fef6674e4cmr7004730wms.12.1700501896033;
        Mon, 20 Nov 2023 09:38:16 -0800 (PST)
Message-ID: <39cf6dbc-e5c4-43a4-abf1-2e62d3c3925a@citrix.com>
Date: Mon, 20 Nov 2023 17:38:15 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/ioapic: Check 1k alignment for IO-APIC physical
 addresses
Content-Language: en-GB
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
 Jan Beulich <JBeulich@suse.com>, Wei Liu <wl@xen.org>
References: <20231120151006.168773-1-andrew.cooper3@citrix.com>
 <ZVuZBGcbyZK8CESL@macbook.local>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <ZVuZBGcbyZK8CESL@macbook.local>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 20/11/2023 5:36 pm, Roger Pau Monné wrote:
> On Mon, Nov 20, 2023 at 03:10:06PM +0000, Andrew Cooper wrote:
>> The MP spec requires a minimum of 1k alignment.  So too does Xen's use of a
>> single fixmap page to map the IO-APIC.
>>
>> Reject out-of-spec values so we don't end up in a position where a bad
>> firmware value causes Xen to use the wrong mapping.
>>
>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
>> ---
>> CC: Jan Beulich <JBeulich@suse.com>
>> CC: Wei Liu <wl@xen.org>
>> CC: Roger Pau Monné <roger.pau@citrix.com>
>> ---
>>  xen/arch/x86/io_apic.c | 5 +++--
>>  1 file changed, 3 insertions(+), 2 deletions(-)
>>
>> diff --git a/xen/arch/x86/io_apic.c b/xen/arch/x86/io_apic.c
>> index 0ef61fb2f167..db1ea6e2f2ca 100644
>> --- a/xen/arch/x86/io_apic.c
>> +++ b/xen/arch/x86/io_apic.c
>> @@ -2589,10 +2589,11 @@ static void __init ioapic_init_mappings(void)
>>          union IO_APIC_reg_01 reg_01;
>>          paddr_t ioapic_phys = mp_ioapics[i].mpc_apicaddr;
>>  
>> -        if ( !ioapic_phys )
>> +        if ( !ioapic_phys || (ioapic_phys & (KB(1) - 1)) )
> Might be clearer to use !IS_ALIGNED()

Hmm, yeah.  Will change.

> , otherwise:
>
> Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>

Thanks.

>
>>          {
>>              printk(KERN_ERR
>> -                   "WARNING: bogus zero IO-APIC address found in MPTABLE, disabling IO/APIC support!\n");
>> +                   "WARNING: bogus IO-APIC address %08lx found in MPTABLE, disabling IO/APIC support!\n",
> FWIW, I think the '!' at the end is not useful, and I would adjust
> the last 'IO/APIC' to 'IO-APIC' if already modifying the line.

Ok.  will do.

~Andrew

