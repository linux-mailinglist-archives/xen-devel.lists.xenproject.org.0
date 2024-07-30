Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2110D9411B9
	for <lists+xen-devel@lfdr.de>; Tue, 30 Jul 2024 14:21:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.767720.1178415 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sYlrA-0005UO-Sg; Tue, 30 Jul 2024 12:21:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 767720.1178415; Tue, 30 Jul 2024 12:21:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sYlrA-0005SE-Q5; Tue, 30 Jul 2024 12:21:32 +0000
Received: by outflank-mailman (input) for mailman id 767720;
 Tue, 30 Jul 2024 12:21:31 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=3jiA=O6=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1sYlr9-0005Rn-AV
 for xen-devel@lists.xenproject.org; Tue, 30 Jul 2024 12:21:31 +0000
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com
 [2a00:1450:4864:20::52d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 40580386-4e6e-11ef-bc01-fd08da9f4363;
 Tue, 30 Jul 2024 14:21:30 +0200 (CEST)
Received: by mail-ed1-x52d.google.com with SMTP id
 4fb4d7f45d1cf-5a108354819so7136950a12.0
 for <xen-devel@lists.xenproject.org>; Tue, 30 Jul 2024 05:21:30 -0700 (PDT)
Received: from [10.125.226.166] ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5ac631b049csm7252148a12.3.2024.07.30.05.21.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 30 Jul 2024 05:21:29 -0700 (PDT)
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
X-Inumbo-ID: 40580386-4e6e-11ef-bc01-fd08da9f4363
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1722342090; x=1722946890; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=daQtbC861zDhab2VCchVoqloxVaFpiYgIz1BrsKnUwE=;
        b=K5tL21iI3790dNW6zQSo1GLk38D9crH+b3HSAFj7b8EChQRv1i0aMBO3jIzzvK1f5i
         oddqwwbTb2M4SOJjyvkdDOFkDIdXpv7J158fvCK5GmuZ6GpPtkLqkz6f//ZPfNRQPmI+
         3YgUkvScfmUxpGaOjHpsz94aY3av0XIoc1Qmg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722342090; x=1722946890;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=daQtbC861zDhab2VCchVoqloxVaFpiYgIz1BrsKnUwE=;
        b=LMwb/Pw3Pe9jDgmAt2H+JDYA4Mo7lLiNzhh25bRPqQ/kjuoZVnP5EMjs7lambk+Ghi
         m9AiVrlhrAmMQ+JSXOd//STLpF6EkFQMftmQ0H4DRswLzwYLNE1YeMtL/GPQVetRuMFk
         OF07vkfm4TtjBIVhOXXVYEs7pqSEL5P79qVXPTzYK8RCZAD5QdLEWzLw5dF/XnhnLaPH
         Mtg+y1Do+Mrb6EYEZnbQxK4CgTrtb4TvmFk3UDmFnsa4RTnGPhcy03Y5+gp8xnsedVwJ
         tQyp0kI6UkUgAoK/gbX8ZDnP2CYoKGhsRTzUFqdJymjV9VDXSXbnAoqzE7BHtTvhGkve
         I7DQ==
X-Forwarded-Encrypted: i=1; AJvYcCXb5Vomv5sE+cg2eXTiL6JLN1lJSAp4AcqaKQEpXSNPEcseugR1T1g29e0xuRO8Qv9/B2bLY8pShYBSYWa18g1FCuxMPDEmH3IybHnxVR8=
X-Gm-Message-State: AOJu0YyKsMvA6dFFcwzQh3nDrOQMM17/8di7NKqtKo8HESNcq3YP1cqp
	1R1hxZRju35Nl2uUVoNJceoMYce002chjT+dtclPqmicCTGCTye8zLs+gDjN7EM=
X-Google-Smtp-Source: AGHT+IEgeogyKEHQhFnnoMswHrOdz6J9JGG0QHdKUty2/GfRTa2ALFEGTQLo9CVwDBxwtxVSKMdI0w==
X-Received: by 2002:a05:6402:34c5:b0:57c:9da5:fc09 with SMTP id 4fb4d7f45d1cf-5b021d22dc9mr7739445a12.23.1722342089854;
        Tue, 30 Jul 2024 05:21:29 -0700 (PDT)
Message-ID: <cecd7f69-d9bd-4930-9662-14454ccea674@citrix.com>
Date: Tue, 30 Jul 2024 13:21:27 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/APIC: Drop APIC_BASE and use fix_to_virt()
To: Jan Beulich <jbeulich@suse.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20240730121749.637879-1-andrew.cooper3@citrix.com>
 <404275f0-b7f7-4303-b6b9-88af9ccddc57@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <404275f0-b7f7-4303-b6b9-88af9ccddc57@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 30/07/2024 1:20 pm, Jan Beulich wrote:
> On 30.07.2024 14:17, Andrew Cooper wrote:
>> Right now the apic_mem_*() helpers only compile because sizeof(void *) ==
>> sizeof(long long).  Switch to using fix_to_virt() which is a void *type.
>>
>> Also adjust the two places where the APIC/IO-APIC virtual address is rendered
>> in a printk().
>>
>> No functional change.
>>
>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> Reviewed-by: Jan Beulich <jbeulich@suse.com>
> ideally ...
>
>> --- a/xen/arch/x86/include/asm/apic.h
>> +++ b/xen/arch/x86/include/asm/apic.h
>> @@ -51,12 +51,16 @@ const struct genapic *apic_x2apic_probe(void);
>>  
>>  static inline void apic_mem_write(unsigned int reg, uint32_t v)
>>  {
>> -	*((volatile u32 *)(APIC_BASE+reg)) = v;
>> +    volatile uint32_t *addr = fix_to_virt(FIX_APIC_BASE) + reg;
>> +
>> +    *addr = v;
>>  }
>>  
>> -static inline u32 apic_mem_read(unsigned int reg)
>> +static inline uint32_t apic_mem_read(unsigned int reg)
>>  {
>> -	return *((volatile u32 *)(APIC_BASE+reg));
>> +    volatile uint32_t *addr = fix_to_virt(FIX_APIC_BASE) + reg;
> ... with const added here.

Oops yes.  Will fix.  Thanks.

~Andrew

