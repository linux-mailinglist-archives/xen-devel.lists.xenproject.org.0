Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F03BA05B7C
	for <lists+xen-devel@lfdr.de>; Wed,  8 Jan 2025 13:24:40 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.867225.1278671 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tVV5w-0000Ls-Q8; Wed, 08 Jan 2025 12:23:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 867225.1278671; Wed, 08 Jan 2025 12:23:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tVV5w-0000KU-MU; Wed, 08 Jan 2025 12:23:32 +0000
Received: by outflank-mailman (input) for mailman id 867225;
 Wed, 08 Jan 2025 12:23:31 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=UrZA=UA=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1tVV5v-0000K3-N5
 for xen-devel@lists.xenproject.org; Wed, 08 Jan 2025 12:23:31 +0000
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [2a00:1450:4864:20::42b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5e86ca36-cdbb-11ef-a0df-8be0dac302b0;
 Wed, 08 Jan 2025 13:23:30 +0100 (CET)
Received: by mail-wr1-x42b.google.com with SMTP id
 ffacd0b85a97d-385e87b25f0so507047f8f.0
 for <xen-devel@lists.xenproject.org>; Wed, 08 Jan 2025 04:23:30 -0800 (PST)
Received: from [192.168.1.10] (host-92-26-98-202.as13285.net. [92.26.98.202])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38a1c8a6e19sm52551601f8f.100.2025.01.08.04.23.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 08 Jan 2025 04:23:29 -0800 (PST)
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
X-Inumbo-ID: 5e86ca36-cdbb-11ef-a0df-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1736339009; x=1736943809; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=kK/jXtI+dJe56Qsa42MyiZmxNk7xm2jG5SaoTFrk4s0=;
        b=g+YUD1yAb6hEVoW5Zfy6nYXWaLSNitRJGK+J9n+ViU3lG07hlf3RLB7S0BcaC3YvVL
         xwQnb2eqJrg8OyDhJwaTt7eY8OtysZ4g0mvS8naqmYyg+bkSIFi3DvHR8/RR2PP9WaDY
         0H4IUfhY/IomtP78cu2/ryumdumsZl9ckHI2g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736339009; x=1736943809;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kK/jXtI+dJe56Qsa42MyiZmxNk7xm2jG5SaoTFrk4s0=;
        b=amvoIquOM7T/0N19fQirB2GACN5XGPfjfkcxFWyg6WlBU3EFVSVDpUAUO5U9HQz7kv
         A0PmQXJmM/JBggxzD238904LWf1ujppPXg6mILpeD7PcSjsi1abtX1755CR9kdpadv2q
         0TI7bQOEMF83tublp/GMskcZY6k7VNxf0e3CBDFqGTzRLefsJB8DwDB2+ARbqC0nGg6X
         D/Uj7cBxjMEPNTM6sKwZ2JOvNNNG+iE3br9/yYIg0CN/szdgpzuInBaUiQkDFRBIiut4
         3AzAFNuwPKzYqm2hsFxkIhUUf7zFbY9Dp1voMJSzvihYUX8c+upOWtTDeOAhKBFKz709
         e6aQ==
X-Forwarded-Encrypted: i=1; AJvYcCXIFm5jEIc53Tq49s04qCwpnTbj52z+k1iTCoWqTx0Ju3cavGcLuSR0kQ+ezzcfhUrSLEURDoJLrbk=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxPMTPocv4S9xlLtdAzdTGSzWw3OQkpj8nuKprAcZisI0NibNpx
	bct/QqFO+oRhtWDI0A3R/dwmZEyRKs0RHz8sg9GQHtYz7SvrCORTOTYxXfUIjGc=
X-Gm-Gg: ASbGnctfHMMNbIwXWnY7Yy8Fec/HaeozfClFMHJsyy6mrb7jBlEL7DqYDI06gwvVMvR
	x9SPk467e90h787fkhevpT6IxjDXCIm4faJzzvz2P5EtMu9MXMKlvt2FlMzH/2gzOAVSMtJPzeE
	3S6vdYO6KYVUuW0eumZg06NtzicSO6sNjqFZ/kxcBNg9PJ6dbgMOe5aOLF8R6qR/e+TVGMOIDE1
	dCR40DA6IHOGCJQ9q0U0FbvNDneU3cS9/bzAOvZV5OnylHu5LBrEAKBU5VoSIG0rjyigrp8Ncg8
	wRidY8man+mR5GDP960C
X-Google-Smtp-Source: AGHT+IHsD7vWiO1k+NKZ9jB1PotOEbzLvSxqQh3NBC+XZRPwF3nhNpzQi7XrOH40DRKATuo8cE2kQQ==
X-Received: by 2002:a05:6000:1446:b0:388:cacf:24b0 with SMTP id ffacd0b85a97d-38a791253dbmr5017895f8f.2.1736339009621;
        Wed, 08 Jan 2025 04:23:29 -0800 (PST)
Message-ID: <00662cf8-7bff-4963-8b52-5df2e6a75132@citrix.com>
Date: Wed, 8 Jan 2025 12:23:28 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/2] x86: Add Support for Paging-Write Feature
To: Jan Beulich <jbeulich@suse.com>, =?UTF-8?Q?Petr_Bene=C5=A1?=
 <w1benny@gmail.com>
Cc: Tamas K Lengyel <tamas@tklengyel.com>,
 Alexandru Isaila <aisaila@bitdefender.com>,
 Petre Pircalabu <ppircalabu@bitdefender.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <cover.1735837806.git.w1benny@gmail.com>
 <31a1ff2d5d1e17bb73231e008f1e47c501bb3ce8.1735837806.git.w1benny@gmail.com>
 <d6eb70a7-5895-4471-95b3-609f133fa457@suse.com>
 <CAKBKdXjJm5194Wa=gy=DikiUEsevrB2Xn-idr+vgfgJMBrfZ-w@mail.gmail.com>
 <b182555c-555e-4efc-94a0-5f383f7d8689@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <b182555c-555e-4efc-94a0-5f383f7d8689@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 08/01/2025 7:16 am, Jan Beulich wrote:
> On 07.01.2025 18:18, Petr Beneš wrote:
>> On Tue, Jan 7, 2025 at 5:46 PM Jan Beulich <jbeulich@suse.com> wrote:
>>> Hmm ... Instead of you touching the bit in every one of the case blocks,
>>> I was expecting you to clear the bit ahead of the switch(), accepting a
>>> double update in the p2m_access_r_pw case.
>> I did consider it, but ultimately didn't like the double-update.
>> Similarly, the switch-case above does also set each bit in the
>> "case-s" individually. But I understand it's more justified there.
> Right - it's setting them to all different combinations each time.
>
>> However, if you insist, I'll fix it.
> Please do; it helps readability quite a bit in this case, imo.

I agree.

These "writes" are just bit operations on a single register.  The
compiler is pretty good at rearranging such logic.

Seeing as this is the only issue, I'm happy to fix on commit?

~Andrew

