Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F24B4ABEB9A
	for <lists+xen-devel@lfdr.de>; Wed, 21 May 2025 08:02:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.991454.1375305 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uHcWB-0007n3-Ky; Wed, 21 May 2025 06:01:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 991454.1375305; Wed, 21 May 2025 06:01:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uHcWB-0007k4-Hb; Wed, 21 May 2025 06:01:31 +0000
Received: by outflank-mailman (input) for mailman id 991454;
 Wed, 21 May 2025 06:01:30 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=TwEK=YF=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uHcWA-0007jy-G7
 for xen-devel@lists.xenproject.org; Wed, 21 May 2025 06:01:30 +0000
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com
 [2a00:1450:4864:20::533])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0918a957-3609-11f0-b892-0df219b8e170;
 Wed, 21 May 2025 08:01:28 +0200 (CEST)
Received: by mail-ed1-x533.google.com with SMTP id
 4fb4d7f45d1cf-6023cf146d3so388140a12.3
 for <xen-devel@lists.xenproject.org>; Tue, 20 May 2025 23:01:28 -0700 (PDT)
Received: from [10.1.248.227] ([80.188.125.198])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-6005ac32b53sm8405916a12.64.2025.05.20.23.01.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 20 May 2025 23:01:27 -0700 (PDT)
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
X-Inumbo-ID: 0918a957-3609-11f0-b892-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1747807288; x=1748412088; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Te2sl41BRq4UiezfN4tMFVEh0KPl7+0T5eL3YugtMtI=;
        b=Kz8CBAAIa4WBcMg0eraZcZXrW47WAxWHtlFL++9uqJ7/nnqBBp5bv/JZaUh3gATBY5
         y343aFhtxKA7IKhEP2vk7Bbn4pPjMDxvYzymXzwPtB2fkDIFOAfaKx8frBIqrICiTggu
         UVmAmqJaZ6Nbmra9FZRYWUviUdMsYGYtukBo/PXSuxEcD/Ty2Dt3Fr/8RFtXtaE9Bcqp
         y88JNjBwqe5dKAhlMsP3/SZOV2NDhCGNVHbcD/6jHpiqpiLCYfrlDmm77MDDrqZG2J/m
         HR9fV+N3beR1+RzRk6IkPRsodTriJZcGimaw0PSOuulwYnqNdmABoaj6b8K2gDokvKMj
         iD1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747807288; x=1748412088;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Te2sl41BRq4UiezfN4tMFVEh0KPl7+0T5eL3YugtMtI=;
        b=rtLMEGsG6rbSP73tU65+X6xuSRHq5HX0acVNi/0bi/JPI0I+nbWCDkyQcCux/gl4JP
         ApFRpLGZIAzKv/fiWp6w8HbWnDb1+K36f2vK5HbXqSiHHmveqdKc3Wh4aGFqlWYk+nSZ
         fTWvSY/vfm/CTV2UxJOH5Zc9Qvavl3ZGAHeydEmLBddWKkRXkbZaC28J4X+KkLrvQQaz
         Zw5flTif72iARgBrCwu9HNYf4/bsYPHUdo2DUF1b69Ylf4fzbZxl7vdprqvJEExnf0OP
         uzCHTIiNd7yMRaPsWZW7uA9fHqTjwm9oDo+aZnvSfayZAg9JhLJrAtu2D5IeOTMM4uPf
         x/Dg==
X-Forwarded-Encrypted: i=1; AJvYcCWCFwwOsTZeFu27XUlEJY1/JYzLXbvockroC5JpSj+rD5QuIxN38KeatnEhh53HWqA7nLeOtyboEnc=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzDavHj2J2kHscBTi+2ODInZuogvnMqPaRVdZHyvqcrQ5F9N7q2
	NjNGio1b+nRRxWDM1BikXKlpAGeiu+42rN3CmiM8vGzRkNrUeDZMCIrtCawNroVrRA==
X-Gm-Gg: ASbGncuMX21TjkBwsb46IDMwMQNPXma//uTCLe1TEvz0u7G0u+/ofOTOeF/1lMqm7qx
	vc0cCR1ab8kMxBZi8VXMnrouJd5U29VCyVxTDtGH7QpwmD0MJyIB+QngUN/BtF40uI16B9lEpk/
	RGIgBlKpTW9fzhJKmIgpJfjwEKHrsbDGguAgbLZBzFXq6PM5R7v6EC3v996Zu5qG6pY1oRZ+ZRh
	tUyxgS9WlY4JsXCtZbpLzLbq1rYn1nwOwkmuMj5AMvEDxg5fu7CsAYPSmkUTkvicnX1i5U9xbzr
	Eh0Mn3c0VXOb0/h48fCK9V5X88iwOEhZMXRx7aV9sw6I8n63Sh7wtQI5fYEmJQ==
X-Google-Smtp-Source: AGHT+IECjA4FzHP6SkF5YsYa4dMsmwyb8lt71O/LEjxP1/fj24w539FHWdIfFSMD1cM1tUnPujD/DA==
X-Received: by 2002:a05:6402:13d2:b0:601:fb61:a0dc with SMTP id 4fb4d7f45d1cf-601fb61a890mr7053941a12.4.1747807287957;
        Tue, 20 May 2025 23:01:27 -0700 (PDT)
Message-ID: <57036af6-3841-4676-968d-c3e318e5daa5@suse.com>
Date: Wed, 21 May 2025 08:01:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] xen/domain: introduce non-x86 hardware emulation
 flags
To: dmkhn@proton.me
Cc: andrew.cooper3@citrix.com, anthony.perard@vates.tech, julien@xen.org,
 michal.orzel@amd.com, roger.pau@citrix.com, sstabellini@kernel.org,
 dmukhin@ford.com, xen-devel@lists.xenproject.org
References: <20250516022855.1146121-1-dmukhin@ford.com>
 <20250516022855.1146121-2-dmukhin@ford.com>
 <effb68bc-003c-4db2-b05e-5138142e5ec5@suse.com> <aCz2giS9E7FEmhxK@kraken>
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <aCz2giS9E7FEmhxK@kraken>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 20.05.2025 23:39, dmkhn@proton.me wrote:
> On Tue, May 20, 2025 at 05:21:06PM +0200, Jan Beulich wrote:
>> On 16.05.2025 04:29, dmkhn@proton.me wrote:
>>> From: Denis Mukhin <dmukhin@ford.com>
>>>
>>> Define per-architecture emulation_flags for configuring domain emulation
>>> features.
>>>
>>> Print d->arch.emulation_flags from 'q' keyhandler for better traceability
>>> while debugging.
>>>
>>> Signed-off-by: Denis Mukhin <dmukhin@ford.com>
>>> ---
>>> Changes since v1:
>>> - dropped comments
>>> ---
>>>  xen/arch/arm/include/asm/domain.h   | 1 +
>>>  xen/arch/ppc/include/asm/domain.h   | 1 +
>>>  xen/arch/riscv/include/asm/domain.h | 1 +
>>>  xen/common/keyhandler.c             | 1 +
>>>  4 files changed, 4 insertions(+)
>>
>> If every arch gains identical fields, accessed from common code, why would
>> those need to live in struct arch_domain?
> 
> I did it this way to keep the diff smaller, but I agree such property
> makes sense to put in common domain struct. Will update in v3.

Provided there's arch maintainer buy-off on generalizing this. There's (at
least) a 3rd option, after all: Have arch-specific and (separate) common
emulation flags.

Jan

