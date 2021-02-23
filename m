Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 706CF32304E
	for <lists+xen-devel@lfdr.de>; Tue, 23 Feb 2021 19:11:09 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.89056.167488 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lEc97-0002vd-JL; Tue, 23 Feb 2021 18:10:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 89056.167488; Tue, 23 Feb 2021 18:10:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lEc97-0002vG-G8; Tue, 23 Feb 2021 18:10:53 +0000
Received: by outflank-mailman (input) for mailman id 89056;
 Tue, 23 Feb 2021 18:10:52 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=pXyS=HZ=gmail.com=bobbyeshleman@srs-us1.protection.inumbo.net>)
 id 1lEc96-0002vB-0Y
 for xen-devel@lists.xenproject.org; Tue, 23 Feb 2021 18:10:52 +0000
Received: from mail-pj1-x1034.google.com (unknown [2607:f8b0:4864:20::1034])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id c62899d2-6773-4d9e-96d4-ce2582f2dd9b;
 Tue, 23 Feb 2021 18:10:51 +0000 (UTC)
Received: by mail-pj1-x1034.google.com with SMTP id e9so2515950pjj.0
 for <xen-devel@lists.xenproject.org>; Tue, 23 Feb 2021 10:10:51 -0800 (PST)
Received: from ?IPv6:2601:1c2:4f80:d230::5? ([2601:1c2:4f80:d230::5])
 by smtp.gmail.com with ESMTPSA id i10sm15767282pfq.95.2021.02.23.10.10.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 23 Feb 2021 10:10:49 -0800 (PST)
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
X-Inumbo-ID: c62899d2-6773-4d9e-96d4-ce2582f2dd9b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:organization:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=Ryf0krA1u79pVJENjelYCbZuFAvQJ85HPmI2Z5SonOg=;
        b=NaU6a9d/zvFpR6cKQKM0Me+30l1VTKt99yxliuIJL9bmZqO05VF7NJJUn6/UeMRtVY
         9/b8zM5S1Iv+mi4mDNyZbLpu+5YsTCJVjvPYRRfEX7MQ8jNLmIcAz/0XRUceDneU7GTj
         TvR7c4haXRM9AecdyTeRF2bKrLZcF+G90ZfP0zRQZ0t7q8YDAERUZTvUBDhxXchzwUML
         MHObNemGRmRQkUJ9KRoPdY9NPa9E31lKpdzGJ1QiVa81QMKIChuEV6vubvxMEZ9nk5NN
         dQu/hpBBvX4p4hMkWjYVyMlu6YOKCaS2A3vXlCmiWxqvxwiJ7A/Kea3K5nwcLP5OPkWa
         uPKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:organization
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=Ryf0krA1u79pVJENjelYCbZuFAvQJ85HPmI2Z5SonOg=;
        b=Wd9Y7CHCv8GqdTOOIHUQ6XtIn42GwLEUmvAj/FOooY1FhOpkHqcEdP+CO4+YSiKSh9
         tVSbWQXuf6I7svkeUI/iblc0XT4zeDJQe99bm5B33ioaeA4Kic7dwg3cSemUVg1/aEH+
         lS9SXMh/5eMRTJxMnafJdX4a3Ias8nDnDx2IdY5LPgzn7p5N3TSlo+nLW2Etx0Bqf2sd
         amxP1xp+Auyth8a7bvwLFaAGqdem49DdhkSFvfD6dLveR+D5RV94kIw33enE4tmyb4C+
         913gpmgLqqcx0bpowRL/a7AJBY8TBn8ujvSw4LPqkKgHoCShtbIb73SCZ4idAoSr+/eo
         jH2w==
X-Gm-Message-State: AOAM530ZPJnSxeMn6kDUGICGq6qNwlY7bt+KGZZTklSTb5qY/z2t8los
	PsrJHu50hBT4ZAEOG8J3TbQ=
X-Google-Smtp-Source: ABdhPJyPWTY2ojVAxQL6iH2Y7r85BFjGkIh/0PiY9uLNrjDmTtPTUx2DqMF6GwZjmPXqJsW9XeVEfQ==
X-Received: by 2002:a17:902:6b87:b029:dc:3402:18af with SMTP id p7-20020a1709026b87b02900dc340218afmr29120302plk.29.1614103850197;
        Tue, 23 Feb 2021 10:10:50 -0800 (PST)
Subject: Re: [PATCH v3 4/5] xen/x86: add some addresses to the Multiboot2
 header
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
 Daniel Kiper <daniel.kiper@oracle.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Wei Liu <wl@xen.org>
References: <cover.1611273359.git.bobbyeshleman@gmail.com>
 <35ad940a3da56fc39c9f24e15c9f09ef74ad3448.1611273359.git.bobbyeshleman@gmail.com>
 <YDTFOD4jdE90fZ0/@Air-de-Roger>
From: Bob Eshleman <bobbyeshleman@gmail.com>
Organization: Vates SAS
Message-ID: <b17a562e-90d1-9704-d3e8-2be1b0c215cb@gmail.com>
Date: Tue, 23 Feb 2021 10:07:52 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <YDTFOD4jdE90fZ0/@Air-de-Roger>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 2/23/21 1:04 AM, Roger Pau Monné wrote:
> On Thu, Jan 21, 2021 at 04:51:43PM -0800, Bobby Eshleman wrote:
>> From: Daniel Kiper <daniel.kiper@oracle.com>
>>
>> In comparison to ELF the PE format is not supported by the Multiboot2
>> protocol. So, if we wish to load xen.mb.efi using this protocol we have
>> to add MULTIBOOT2_HEADER_TAG_ADDRESS and MULTIBOOT2_HEADER_TAG_ENTRY_ADDRESS
>> tags into Multiboot2 header.
>>
>> Additionally, put MULTIBOOT2_HEADER_TAG_ENTRY_ADDRESS and
>> MULTIBOOT2_HEADER_TAG_ENTRY_ADDRESS_EFI64 tags close to each
>> other to make the header more readable.
>>
>> The Multiboot2 protocol spec can be found at
>>   https://www.gnu.org/software/grub/manual/multiboot2/
>>
>> Signed-off-by: Daniel Kiper <daniel.kiper@oracle.com>
>> Signed-off-by: Bobby Eshleman <bobbyeshleman@gmail.com>
>> ---
>>  xen/arch/x86/boot/head.S | 19 +++++++++++++++----
>>  1 file changed, 15 insertions(+), 4 deletions(-)
>>
>> diff --git a/xen/arch/x86/boot/head.S b/xen/arch/x86/boot/head.S
>> index 189d91a872..f2edd182a5 100644
>> --- a/xen/arch/x86/boot/head.S
>> +++ b/xen/arch/x86/boot/head.S
>> @@ -94,6 +94,13 @@ multiboot2_header:
>>          /* Align modules at page boundry. */
>>          mb2ht_init MB2_HT(MODULE_ALIGN), MB2_HT(REQUIRED)
>>  
>> +        /* The address tag. */
>> +        mb2ht_init MB2_HT(ADDRESS), MB2_HT(REQUIRED), \
>> +                   sym_offs(multiboot2_header), /* header_addr */ \
>> +                   sym_offs(start),             /* load_addr */ \
>> +                   sym_offs(__bss_start),       /* load_end_addr */ \
>> +                   sym_offs(__2M_rwdata_end)    /* bss_end_addr */
> 
> Shouldn't this only be present when a PE binary is built?
> 
> You seem to unconditionally add this to the header, even when the
> resulting binary will be in ELF format?
> 
> According to the spec: "This information does not need to be provided
> if the kernel image is in ELF format", and hence Xen shouldn't require
> the loader to understand this tag unless it's strictly required, as
> the presence of the tag forces the bootloader to use the presented
> information in order to load the kernel, regardless of the underlying
> binary format.
> 
> Thanks, Roger.
> 

Ah yes, this is true.  It may have made more sense to do this with v2 trying
to step us in the direction of a single unified binary, but it certainly isn't
required with v3.

Thanks,
Bob

