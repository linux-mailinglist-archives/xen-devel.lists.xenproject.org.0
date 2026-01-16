Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 83B44D3290E
	for <lists+xen-devel@lfdr.de>; Fri, 16 Jan 2026 15:25:37 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1206684.1520056 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vgklC-0007Da-0d; Fri, 16 Jan 2026 14:25:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1206684.1520056; Fri, 16 Jan 2026 14:25:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vgklB-0007Ah-UD; Fri, 16 Jan 2026 14:25:09 +0000
Received: by outflank-mailman (input) for mailman id 1206684;
 Fri, 16 Jan 2026 14:25:08 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=UO3W=7V=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1vgklA-0007Ab-3T
 for xen-devel@lists.xenproject.org; Fri, 16 Jan 2026 14:25:08 +0000
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com
 [2a00:1450:4864:20::530])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 272440c6-f2e7-11f0-9ccf-f158ae23cfc8;
 Fri, 16 Jan 2026 15:25:05 +0100 (CET)
Received: by mail-ed1-x530.google.com with SMTP id
 4fb4d7f45d1cf-64b9230f564so2804620a12.1
 for <xen-devel@lists.xenproject.org>; Fri, 16 Jan 2026 06:25:05 -0800 (PST)
Received: from [192.168.1.6] (user-109-243-67-101.play-internet.pl.
 [109.243.67.101]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b879513e9f3sm259137066b.10.2026.01.16.06.25.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 16 Jan 2026 06:25:04 -0800 (PST)
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
X-Inumbo-ID: 272440c6-f2e7-11f0-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768573505; x=1769178305; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=TfxQ1MkYSVozlt2Rs8/5hJDTJvj3zf64lUpUWQ+6jpg=;
        b=ndRj7MCthHTBGt69DKrsbMRHL+FncvtmQttq2tdotzPdyHDv9bv2Z3iuMQaNWcaOAM
         HykscA/y4BdWmhrnvcQgNk/TVH2y4J3sVq78cbXThhbl+jibh3xrzVEA9PceTlRXA+3B
         c0gUjDpWoxGZvMSnhdqZjYs6cvkdDO9bMTd3bXhKilBzkEBCLp3PjKR5Wbgq54CjvXSg
         S4BJClqJu0+nh2gCjOdQZxBFCfhLYaUnT2EB9p4zPubfgpCeciDV9OiIufenWqYD8v6S
         qSTcRLpE/7IVk8L9VZpjIkyL49QvR4dgwDAKEuwsGk7LzVcMUjVI3iiP1yLKxY1Yzhan
         UgCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768573505; x=1769178305;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TfxQ1MkYSVozlt2Rs8/5hJDTJvj3zf64lUpUWQ+6jpg=;
        b=X/ukVfNcwfFe/qvkWPMPPQAxwxDG45bqSnEdLJrD6/nDFyV6n6wp9beICsX45WITXO
         vSulkU95e0uheX1uHeTi/sB1y//nyBuZmMVChE3P2eUyjFE2iMPo8hcdlypW4rdXFMAe
         X95uUEBww61S+uxDfdfEwO3ca8YQf8ostGsK6lMB4I8uWw2/JaN0s6QA9Exprplmm0Gq
         RetI6Ao+z9Kru014IkGQRSjzSBtQAoAczelvhTAP1y6iJb3EokUg8bas9zUSAGgAxu9C
         5biqhFXlZczdzwBcU+2bgyDs3+RCsEkuOOHmj82P24ZHwJZYcaDNowbzvASCO7b4z+oE
         UnBQ==
X-Forwarded-Encrypted: i=1; AJvYcCUK96ER+Hsc3iNxJLg/iWiYlWVIUJpsuC51bariGCzdLNx4aj95QI3RcmIsMTImOzQCRk/YFJYbozU=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxAtmvOh+96gPxy3bQeDgXiqgwAUqdUbZhIRDoAP82K2WRMgZb+
	S4VdqXCKCisZOkfLCogRKCkPZgbnckKRX4y9kBQw7Vtz0XKhJE9tw2nP
X-Gm-Gg: AY/fxX4H2pO7DphrmyLH5jdtM/tqiwu5i+H5zm3aCQxcP5lRvOB7zwC7N+fPiVpiiQ3
	zrtWw9dwSeVYT5WHGcJ8FemQoDHjuIfqO7bNMzaInkwwlJxWykiLoKBoAzdddhdZqQbnwJkxhpm
	VXeBBK7nQuOvs+wwQ8+nTqmU8S1pdUszDn1uKo1rX3upn/Mq27TIW/X3Ck1TwzeJ7yJVNEBcCTZ
	V3iDNx/7ldZBJgxhiZmLcbsXoRROAE8MGNvel/aFFnYgJ81BffGEP2tDwPk/bmIZtKRL9zdI1H1
	YJ+9RRNgWqg4PXY2sHup+rQreeQsawWALvAjf9d82eNorui5K0R1lxjyHi5GI0wZIimdE5bjwA0
	eFYy914skIXaxn75gEsBRDWSPOlYvCWIOSW8H3Sh1iSA48T+xe8u3XnEbfj+4N22aVkvP+bdVgV
	sd8z//citzqYGLyhvjtNkXhBgAacYH7vkQblj1JEUc5RQxZABLMof8uHIbMsoCYew=
X-Received: by 2002:a17:907:94ce:b0:b87:1b2b:3312 with SMTP id a640c23a62f3a-b8792d65770mr268460266b.16.1768573505025;
        Fri, 16 Jan 2026 06:25:05 -0800 (PST)
Message-ID: <9212924e-8f3a-4797-8c3b-149ff7c4b03e@gmail.com>
Date: Fri, 16 Jan 2026 15:25:03 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 07/15] xen/riscv: introduce tracking of pending vCPU
 interrupts, part 1
To: Jan Beulich <jbeulich@suse.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1766595589.git.oleksii.kurochko@gmail.com>
 <c6bd40a9a40ae3194bcfcf90b9a71d4c190ab7f6.1766595589.git.oleksii.kurochko@gmail.com>
 <cdefd959-5700-4cdc-8563-d4954be1e91e@suse.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <cdefd959-5700-4cdc-8563-d4954be1e91e@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 1/7/26 5:28 PM, Jan Beulich wrote:
>> +
>> +    /*
>> +     * VCPU interrupts
>> +     *
>> +     * We have a lockless approach for tracking pending VCPU interrupts
>> +     * implemented using atomic bitops. The irqs_pending bitmap represent
>> +     * pending interrupts whereas irqs_pending_mask represent bits changed
>> +     * in irqs_pending.
> And hence a set immediately followed by an unset is then indistinguishable
> from just an unset (or the other way around). This may not be a problem, but
> if it isn't, I think this needs explaining.

I am still not sure that this is actually a problem, or what kind of explanation
is needed.
|unset| is called only when the guest makes such a request, and the guest will
make that request only after it has received an interrupt that was previously
set in the|irq_pending| bitmap and then flushed to the hardware HVIP.

If an interrupt is simply set and then unset without ever being flushed to the
hardware HVIP, it seems there would be no issue, since it would not affect the
guest. However, the question of why this happened at all would still remain.

Do I miss some corner cases which should be taken into account?
Should I still have to add some extra explanation to the comment or commit
message?

~ Oleksii


