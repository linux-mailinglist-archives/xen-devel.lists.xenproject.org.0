Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 63B2FD13C56
	for <lists+xen-devel@lfdr.de>; Mon, 12 Jan 2026 16:46:30 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1200617.1516486 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vfK7S-0004OS-1v; Mon, 12 Jan 2026 15:46:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1200617.1516486; Mon, 12 Jan 2026 15:46:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vfK7R-0004Mt-V2; Mon, 12 Jan 2026 15:46:13 +0000
Received: by outflank-mailman (input) for mailman id 1200617;
 Mon, 12 Jan 2026 15:46:12 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=g/6n=7R=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1vfK7Q-0004Mm-5Y
 for xen-devel@lists.xenproject.org; Mon, 12 Jan 2026 15:46:12 +0000
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com
 [2a00:1450:4864:20::532])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d1472330-efcd-11f0-b15e-2bf370ae4941;
 Mon, 12 Jan 2026 16:46:10 +0100 (CET)
Received: by mail-ed1-x532.google.com with SMTP id
 4fb4d7f45d1cf-6505d141d02so10526435a12.3
 for <xen-devel@lists.xenproject.org>; Mon, 12 Jan 2026 07:46:10 -0800 (PST)
Received: from [192.168.1.6] (user-109-243-67-101.play-internet.pl.
 [109.243.67.101]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b8701e1d467sm599212066b.70.2026.01.12.07.46.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 12 Jan 2026 07:46:09 -0800 (PST)
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
X-Inumbo-ID: d1472330-efcd-11f0-b15e-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768232770; x=1768837570; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ikEEWpfdYkg+GHrVMJZ0H5ltKeP8OLweL9QsXVCaoDs=;
        b=m5aTI7sJYGMLq4l0v9Ejlu+EWLuMM2VS4+S5UnI2ObGkmr4XZkmpDJFSn32BghchqO
         ZknSJft8nmjQmmHFrch+LXCdao48sjRo4lRA9ZZEUFK9EmJQ9qaPXa6SDOhxhRzasbyJ
         2WtbfYJp75I5hv9slVo0fiOgdP2XX5PkaNb3NvwWXDNVfPCBJto3WxL+dd/zQLYQrH4f
         4PBRvcd/wEP42aKdqoEcAPUVNDRdqz4H6lPgxTRjTsnENw1lf2XizIj152azWl21yXoM
         SH2M3ooLhuWROFfU5pGEReMtYE+nHFULRoH17ueXownDKlOC1EjLQ7t5io3FwJpozIWg
         bUsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768232770; x=1768837570;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ikEEWpfdYkg+GHrVMJZ0H5ltKeP8OLweL9QsXVCaoDs=;
        b=uFjvjU0/e0/9PSuY6Ekh/uiDog7KUgnpAGIQjg2bG5ruVUHlcVOBstIssURSTS+SFt
         /Yz8K5trUTcKwkws4I/oXN1XSkJdJ2r+3smWrGC8VrF8G+P71maFDrgOGaV5RBWJZTny
         Sr4oCgQQBNy5OIwgjLhPvhmZ4QkCFIo7MHgN5PUWysNE430xaj3/jj5luLmL30S8gdEC
         e6pRE9V4hOVTqK8WIfCzhDvpDyBiBjQkxNGsLFyNUEvbhjfuyOetYYWZhjCpCvdePYj5
         vLlTplxmOUAyKdAIRSLs+pOvB1jpk7KnqLRNuj7g0UFcQTeTwmwFq4Kmq3rFkQI2PS1h
         Z/DA==
X-Forwarded-Encrypted: i=1; AJvYcCXddYSzJZCLX+eTJWNSTpMJd4igd2YIa2Btbn3XijBKjNfjWlviz7vg5j2nHI2Q6lXO4/lUSMOAtPI=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwM5sB3XI4/we1K3qpgXnKBSqWJzoU+HObwIWdKsC3Xrg5YJr9z
	4PUT2tjNKmI2Ku2cN8I4cwixj+vPppQ/C4WOANcCKaxUbJR/vFAn+4QP
X-Gm-Gg: AY/fxX6hXh5kunvSar3ss+D7BtNEqC3WK1QM4av+ZN0NcnT+8gkter4ozBCXIOOyUkW
	kT6bjS0TlJfBf0PManzm+F3+xvnENGxlADj4E7Pd+hWHtMD5e9tw1cgHXOZZgB9MMuJRT4ywbkt
	S0aFn3cVjf8pLOe1Gq5o7ihQSaoy9VBbrARWodFpRQaDZcWXJHB/VEu3GzfhJ9ijf/0+khtNii8
	BXQwuoKZ/2CPmVE/JgGCAXv1k1MCoDQz/0wgqTwr372m5rlEaBqP0/0cGuzGyUMrU+nl7ZRf7vs
	2HvhX5MKDCD7uZX13Xrv9ysbU2/LOqgx02ecfCQ5ngiC23LhWd0Y/AOXWOl/tDDe14zhKrjs6iq
	vk6FE4cM9HWxHMDLdbaFowT7CosOgVUNywLsCx57iClPjyR0eGYqO2rSf7bVU0ENYPaktxg9YGa
	AaXatjb+BEpKXTYAiaLXXnZmEtrdQS/KFkU50X5nPew/WHrl3rjM7swGmxb4l6fj0=
X-Google-Smtp-Source: AGHT+IFlPxsMhO4uxy4cfaJlR6l6ZRYJlp94VG4eZlAASC2wRDVSMJsH3wWUMgI0XYBttQ4HtgFiEg==
X-Received: by 2002:a17:906:fe42:b0:b72:a899:169f with SMTP id a640c23a62f3a-b8444c3fad9mr1941439666b.4.1768232769967;
        Mon, 12 Jan 2026 07:46:09 -0800 (PST)
Message-ID: <988ba581-5503-45d4-a621-18cdc3b14cab@gmail.com>
Date: Mon, 12 Jan 2026 16:46:08 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 03/15] xen/riscv: implement vcpu_csr_init()
To: Jan Beulich <jbeulich@suse.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1766595589.git.oleksii.kurochko@gmail.com>
 <bf617d77bb9e75bbd2930614bb86ff83b80adcfc.1766595589.git.oleksii.kurochko@gmail.com>
 <dc24a8ea-9041-4097-bbe2-459c668e9e64@suse.com>
 <7ba4bcfe-59d3-43f3-adb4-207424dc1713@gmail.com>
 <f1beef63-1995-4e8d-bbdb-3be406ac414c@suse.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <f1beef63-1995-4e8d-bbdb-3be406ac414c@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On 1/12/26 3:28 PM, Jan Beulich wrote:
> On 12.01.2026 13:59, Oleksii Kurochko wrote:
>> On 1/7/26 9:46 AM, Jan Beulich wrote:
>>> Also, wouldn't you better keep internal state in line with what hardware
>>> actually supports? CSRIND may be read-only-zero in the real register, in
>>> which case having the bit set in the "cached" copy can be misleading.
>> [...]
>>
>>> (This may similarly apply to at least hedeleg and hideleg, btw.)
>> Regarding the previous bits, I can understand that it would be an issue:
>> if SSAIA isn’t supported, then it is incorrect to update the corresponding
>> bits of|hstateen0|.
>>
>> However, I’m not really sure I understand what the issue is with|h{i,e}deleg|.
>> All writable bits there don’t depend on hardware support. Am I missing something?
> My reading of the doc was that any of the bits can be r/o 0, with - yes -
> no dependencies on particular extensions.

Just to be sure that I get your idea correctly.

Based on the priv. spec:
   Each bit of hedeleg shall be either writable or read-only zero. Many bits of
   hedeleg are required specifically to be writable or zero, as enumerated in
   Table 29.

Now let’s take hedeleg.bit1, which is marked as writable according to Table 29.
Your point is that even though hedeleg.bit1 is defined as writable, it could still
be read-only zero, right?

In general, I agree with that. It is possible that M-mode software decides, for
some reason (for example, because the implementation does not support delegation
of bit1 to a lower mode), not to delegate medeleg.bit1 to HS-mode. In that case,
hedeleg.bit1 would always be read-only zero.

>   In which case you'd need to do
> the delegation in software. For which it might be helpful to know what
> the two registers are actually set to in hardware (i.e. the cached values
> wanting to match the real ones).

Does it make sense then to have the following
   	...
	v->arch.hedeleg = hedeleg;
   	vcpu->arch.hedeleg = csr_read(CSR_HEDELEG);
in arch_vcpu_create()?

Or I can just add the comment that it will be sync-ed with the corresponding
hardware CSR later as ,actually, there is some h{i,e}deleg synchronization
happening during context_switch() (this code is at the moment in downstream),
because restore_csr_regs() is executed and re-reads CSR_H{I,E}DELEG:
   static void restore_csr_regs(struct vcpu *vcpu)
   {
       csr_write(CSR_HEDELEG, vcpu->arch.hedeleg);
       csr_write(CSR_HIDELEG, vcpu->arch.hideleg);
       ...
As a result, vcpu->arch.h{I,E}deleg is kept in sync with the corresponding
hardware CSR.

~ Oleksii


