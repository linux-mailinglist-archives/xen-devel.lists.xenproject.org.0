Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6510BCD8A9B
	for <lists+xen-devel@lfdr.de>; Tue, 23 Dec 2025 10:56:07 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1192423.1511653 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vXz6k-0007mt-Hg; Tue, 23 Dec 2025 09:55:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1192423.1511653; Tue, 23 Dec 2025 09:55:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vXz6k-0007jz-E8; Tue, 23 Dec 2025 09:55:10 +0000
Received: by outflank-mailman (input) for mailman id 1192423;
 Tue, 23 Dec 2025 09:55:08 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=wtgv=65=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1vXz6i-0007jY-Hz
 for xen-devel@lists.xenproject.org; Tue, 23 Dec 2025 09:55:08 +0000
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com
 [2a00:1450:4864:20::630])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 74ea3a69-dfe5-11f0-9cce-f158ae23cfc8;
 Tue, 23 Dec 2025 10:55:05 +0100 (CET)
Received: by mail-ej1-x630.google.com with SMTP id
 a640c23a62f3a-b734fcbf1e3so933749666b.3
 for <xen-devel@lists.xenproject.org>; Tue, 23 Dec 2025 01:55:05 -0800 (PST)
Received: from [192.168.1.6] (user-109-243-71-38.play-internet.pl.
 [109.243.71.38]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b8037a604f5sm1379253366b.11.2025.12.23.01.55.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 23 Dec 2025 01:55:03 -0800 (PST)
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
X-Inumbo-ID: 74ea3a69-dfe5-11f0-9cce-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766483704; x=1767088504; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=anHanextag30yIC8WDobCeYSutZSF623UMGUnQGnAYY=;
        b=dTt7m1Fu5itUQ4dv46UXoZJ3RCUH1ahFzl3ZJMNRIpENgsP1X0ICwfqfz3Z058SpEL
         3c/wAcE8CAyyAJQAjUnSIXlRZVgNTMWbL5XFsTLY0pzUe+2Thew+17MlmOoHOezSaneC
         H2W7B9+ETjXjX6FKNhkUjAVg0/8OM+ewFfN1Tkaul+dzRudSi3myu9KN+bKCe/lA7xaZ
         Jy3xrIxbPMb1/Ef8DtiLvkz/RBg6AJI0MkfHfxRb7N4c3QUe0XTXoZC6sh6eOoHYCZjs
         LoanmvR59tQH2K+98qclqakG4CJJKZ3Ipb7s6Hd/Y70NbE50fReCK7sqPctcIhOlNALn
         EyBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766483704; x=1767088504;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=anHanextag30yIC8WDobCeYSutZSF623UMGUnQGnAYY=;
        b=rmEJ26Pu1SuMix+FRMvP1opsdB48JomNbsXl13A1aeT704+NaeC2vb6/h7IQPpYHkg
         rLgSTWiCHV/SCoKfJwizQ65C08MBHLZhqqpn+ks4ChW2q81Wyvop+4MiBPMTw8EW+nVA
         lsDsn4PsEuofPrOvmrpXPduN/sNvIDIorzeapM8cQ83FIs/BBZzVhqXqiidJ6HhEqOnb
         EUTwr22cotuw+lSFPSE55bd5a31rPZabiLaFeYOTjFz0+f8mD/UsxwQBsHjKu0Vt3vpl
         pIa0pzhuAsvGAV2OlGsG9nQvJjCIZ0mbnfnqW6gkRPoC8e3/jnoNUF47F9xVble8v0jb
         7Ryw==
X-Forwarded-Encrypted: i=1; AJvYcCVx6PYqkROhKUp0vE60LDBqUXs29FTiCyGOcW4tOylFxm9PqmVC4rxVZbpM2T7l2f79dHdOsmIS8Ls=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyqpchsBpn+mJt4Eusop3KEGCOd/Xg2bQkt7By/kHQUB5Rh4jyF
	vQ0Lon9GfZG8VQMmOgW3UAiX9xlv9XUjWrfDkbi56SOwJaxH8PtnPoum
X-Gm-Gg: AY/fxX4mjR6h2LF7+lcMApNme6QCblrNSmfOYWm00piJQpjQjXCmd4Je0Ai44p5UIEg
	jgfGHwMKZP7ycGd1PRmPKLycgnQC89O/0lR2yfOpfRiI1nqLGHefy15nwJ8YMppX8w8R4Y4y7Gg
	A6OJevJrbdqsF7oe7rKlNhY56eTCvVz0YXMzklomNYTbPala/kbtkAMtU5Op0eylESO4nlWb6jy
	YSMeVr51PwHiVAEV1WbPGKG3RdQoAfKkzk/wsN6RyG/Q2aQ92upy4a09hf5oXWj8eRdGW8zyZL1
	LpjDTBl6FGBinHVGpbBAQXyAoXbGhCGEKZUo54ZRgC6T9oeOVRjb/X+z0WZLjF7vhpwRe3X1+sr
	1DS42AkCqNWAQnZbjVy33QMYMvuzrbBq+iu9A7FCzjKsSb8YHLmqb/V5OeIq8akVTkB4r1tL7Fn
	hjOCJqMChPAPauHZU4nwPSYaeCEVLbgOQybvPqTk4y9+wFm1Lu8aHJb7W3GVmRRSvo
X-Google-Smtp-Source: AGHT+IHgvrBTy2D3IPETGrn1KiQGiNl9sbzZn5k8kgWFPMYqzmmcMmrGJFG/7A1iitPLOGOy/J3orQ==
X-Received: by 2002:a17:907:9810:b0:b70:be84:5186 with SMTP id a640c23a62f3a-b80371d66camr1470814466b.44.1766483704145;
        Tue, 23 Dec 2025 01:55:04 -0800 (PST)
Message-ID: <326de9f6-ee6f-4a02-b0c2-d0f45ef5339f@gmail.com>
Date: Tue, 23 Dec 2025 10:55:02 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] acpi/arm: relax MADT GICC entry length check to
 support newer ACPI revisions
To: Julien Grall <julien@xen.org>, xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Yann Dirson <yann.dirson@vates.tech>,
 Yann Sionneau <yann.sionneau@vates.tech>
References: <929f7a0fb8f92112d445015726db30122a05eb9f.1766060265.git.oleksii.kurochko@gmail.com>
 <36b89039-97e2-464c-8c1a-25981171b32f@xen.org>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <36b89039-97e2-464c-8c1a-25981171b32f@xen.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hello Julien,

On 12/21/25 11:28 AM, Julien Grall wrote:
>> --- a/xen/arch/arm/gic.c
>> +++ b/xen/arch/arm/gic.c
>> @@ -418,8 +418,18 @@ unsigned long gic_get_hwdom_madt_size(const 
>> struct domain *d)
>>   {
>>       unsigned long madt_size;
>>   +    struct acpi_subtable_header *header;
>> +    struct acpi_madt_generic_interrupt *host_gicc;
>
> For both variables, you don't seem to modify the content. So I think 
> they should be const.

Only|host_gicc| can be made|const|. If|header| is also declared as|const|, we get a compilation error:
   arch/arm/gic.c: In function ‘gic_get_hwdom_madt_size’:
   ./include/xen/kernel.h:20:46: error: initialization discards ‘const’ qualifier from pointer target type [-Werror=discarded-qualifiers]
      20 |         typeof_field(type, member) *__mptr = (ptr);             \
         |                                              ^
   arch/arm/gic.c:428:17: note: in expansion of macro ‘container_of’
     428 |     host_gicc = container_of(header, struct acpi_madt_generic_interrupt,

It is probably better to leave|header| non-const here, rather than introducing a cast such as:
   host_gicc = container_of((struct acpi_subtable_header *)header, ...)

Thanks.

~ Oleksii

>
>> +
>> +    header = 
>> acpi_table_get_entry_madt(ACPI_MADT_TYPE_GENERIC_INTERRUPT, 0);
>> +    if ( !header )
>> +        panic("Can't get GICC entry");
>> +
>> +    host_gicc = container_of(header, struct 
>> acpi_madt_generic_interrupt,
>> +                             header);
>> +
>>       madt_size = sizeof(struct acpi_table_madt)
>> -                + ACPI_MADT_GICC_LENGTH * d->max_vcpus
>> +                + host_gicc->header.length * d->max_vcpus
>>                   + sizeof(struct acpi_madt_generic_distributor)
>>                   + gic_hw_ops->get_hwdom_extra_madt_size(d); 

