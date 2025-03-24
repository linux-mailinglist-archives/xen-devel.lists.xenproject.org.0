Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AAF6CA6DBFB
	for <lists+xen-devel@lfdr.de>; Mon, 24 Mar 2025 14:47:55 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.925562.1328432 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1twi9a-0004ud-Bo; Mon, 24 Mar 2025 13:47:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 925562.1328432; Mon, 24 Mar 2025 13:47:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1twi9a-0004tA-8t; Mon, 24 Mar 2025 13:47:46 +0000
Received: by outflank-mailman (input) for mailman id 925562;
 Mon, 24 Mar 2025 13:47:44 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jtpT=WL=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1twi9Y-0004t4-RL
 for xen-devel@lists.xenproject.org; Mon, 24 Mar 2025 13:47:44 +0000
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com
 [2a00:1450:4864:20::631])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8f99153f-08b6-11f0-9ea2-5ba50f476ded;
 Mon, 24 Mar 2025 14:47:43 +0100 (CET)
Received: by mail-ej1-x631.google.com with SMTP id
 a640c23a62f3a-ac34257295dso918615866b.2
 for <xen-devel@lists.xenproject.org>; Mon, 24 Mar 2025 06:47:43 -0700 (PDT)
Received: from [10.81.43.157] ([46.149.103.11])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ac3ef868748sm682036366b.12.2025.03.24.06.47.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 24 Mar 2025 06:47:42 -0700 (PDT)
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
X-Inumbo-ID: 8f99153f-08b6-11f0-9ea2-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1742824063; x=1743428863; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=PYWhK+Ex47SMavhFpp9SRe6/vGCrKC7CP5C3EwJn098=;
        b=tGIxKJQki7lFK3SaZmtpp1PcnhUt4m+38VU+OWjyA833PWUM3Q0lRqOB5MZ3l0ZXIb
         VEYSK/+pJ2VVUUZF4irlqpaPQMDX0wCb6Q5kvbeuX0GuGi89O/WkWs6jqRUw9Qazc/uY
         rDbUiODFkDwi2khxOzMz4w0BjN4MzDmJ0z0GA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742824063; x=1743428863;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PYWhK+Ex47SMavhFpp9SRe6/vGCrKC7CP5C3EwJn098=;
        b=Nx3PLX2u00OlkLDXaH216s8UmFoAMkj8QSf5ka6RdzQEIBQifAlrf1AbShnDEknzMe
         AksWXMa4QmuyqlhLAGyHvinyIfEZwYnMR2OkN+GWExZ4lxUnjcbpHfr1QYMvcO55wyGY
         So0tHtdCRF/f7zbbEUQGMbZpVhI1Yge+JPeX9JrQAKYzlBfNFAmAtizXCdECpxdVGWYG
         CpKdsy73iYTN5dByHiLsV3ChWlp9KDMcIJRAmATQgDr5c8nuTiSH4Z68EBcBdGlQFET1
         byrKXkU+kLFaIIe/jNl/9HEVpmLf67u85fTHsnIwKp8RwCpyAzPFSjn111owihWNL0yq
         AP0A==
X-Forwarded-Encrypted: i=1; AJvYcCVRkeT2i4GVXsuF9A+85GyajXCHVSYL+Yll1Es/sLIPEvVV6D1uLATJW0t9aqgJ1btZbHlmOIgdZBc=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yz3wMmjFambJ6Ra2DdNkRavRa79JpRG2+i0V+V5fxmIncXalQMb
	aX1eeA9SBwnV8KeyFVA9qIKdHCb2tCdfd/kFfGkJfQIL+8lcRq7GJrkxPTAWO4w=
X-Gm-Gg: ASbGncv6sxG4UzBsOA8A5hXYYrdB+Skvh2BvSVos3PesjxNrqSk5Z5hI1ksZABS7FEX
	qWVsPocy3Co+phnPlemvMHcS2c2swvfEVfLJmw6DjClqFfUSu4FkUshQE+i0YO0IqVitFtp6zRz
	UeRAhy7CzVxYRNZ57Ipw3zTypSONociWkYpKa9bpyUbDTcHHblKdKCO28YpN1ZFYEVsiID5t5k/
	Qz8fHDR6XHWPZY9NytW+A26+wWdAwDulVu/0BnZHb4F1gQXGPmINW44MLTho0+TDpVXPY1V35mw
	BdclLjPiA5Smf/cg/o4I8xdns3SQhr5BPgTYV0BBNqE/Bo1f5IGmLms=
X-Google-Smtp-Source: AGHT+IGUl0xRjqL8zvc0uKfAn6rj4BEV2Ub+fmwIpt5dlvs/u4qz6AwK5wzrBQ1aD1jtI9qDWHc7ww==
X-Received: by 2002:a17:907:1c21:b0:abf:6389:6d19 with SMTP id a640c23a62f3a-ac3f226757amr1015698466b.15.1742824062971;
        Mon, 24 Mar 2025 06:47:42 -0700 (PDT)
Message-ID: <38d2e43d-8dd6-4e9b-9126-8eee5fefbe26@citrix.com>
Date: Mon, 24 Mar 2025 13:47:41 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] x86/irq: introduce APIC_VECTOR_VALID()
To: Jan Beulich <jbeulich@suse.com>, dmkhn@proton.me
Cc: anthony.perard@vates.tech, julien@xen.org, michal.orzel@amd.com,
 roger.pau@citrix.com, sstabellini@kernel.org, dmukhin@ford.com,
 xen-devel@lists.xenproject.org
References: <20250320230339.3897874-1-dmukhin@ford.com>
 <e24ec8f4-3320-4978-8deb-cefc3380a0ed@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <e24ec8f4-3320-4978-8deb-cefc3380a0ed@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 24/03/2025 12:36 pm, Jan Beulich wrote:
> On 21.03.2025 00:05, dmkhn@proton.me wrote:
>> Add new macro APIC_VECTOR_VALID() to validate the interrupt vector
>> range as per [1]. This macro replaces hardcoded checks against the
>> open-coded value 16 in LAPIC and virtual LAPIC code and simplifies
>> the code a bit.
>>
>> [1] Intel SDM volume 3A
>>     Chapter "ADVANCED PROGRAMMABLE INTERRUPT CONTROLLER"
>>     Section "Valid Interrupt Vectors"
>>
>> Signed-off-by: Denis Mukhin <dmukhin@ford.com>
> Reviewed-by: Jan Beulich <jbeulich@suse.com>
> with ...
>
>> --- a/xen/arch/x86/include/asm/apicdef.h
>> +++ b/xen/arch/x86/include/asm/apicdef.h
>> @@ -78,6 +78,7 @@
>>  #define			APIC_DM_STARTUP		0x00600
>>  #define			APIC_DM_EXTINT		0x00700
>>  #define			APIC_VECTOR_MASK	0x000FF
>> +#define			APIC_VECTOR_VALID(x)	(((x) & APIC_VECTOR_MASK) >= 16)
> ... line length restrictions respected here. I'll see about taking care of
> this while committing, provided other x86 maintainers wouldn't prefer this
> to not go in in the first place (so I'll also give it another day or two).

I'm ok with this change.  Unlike v1, it's meaningful in context.

~Andrew

