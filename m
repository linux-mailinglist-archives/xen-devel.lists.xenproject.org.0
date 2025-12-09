Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3705BCAFAB2
	for <lists+xen-devel@lfdr.de>; Tue, 09 Dec 2025 11:41:04 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1181397.1504453 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vSv9I-0003Xa-4U; Tue, 09 Dec 2025 10:40:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1181397.1504453; Tue, 09 Dec 2025 10:40:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vSv9I-0003W5-1n; Tue, 09 Dec 2025 10:40:52 +0000
Received: by outflank-mailman (input) for mailman id 1181397;
 Tue, 09 Dec 2025 10:40:50 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=rCN0=6P=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1vSv9G-0003Vz-Ob
 for xen-devel@lists.xenproject.org; Tue, 09 Dec 2025 10:40:50 +0000
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com
 [2a00:1450:4864:20::62c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 86e27b58-d4eb-11f0-b15b-2bf370ae4941;
 Tue, 09 Dec 2025 11:40:49 +0100 (CET)
Received: by mail-ej1-x62c.google.com with SMTP id
 a640c23a62f3a-b7a02592efaso569721166b.1
 for <xen-devel@lists.xenproject.org>; Tue, 09 Dec 2025 02:40:49 -0800 (PST)
Received: from [192.168.1.6] (user-109-243-71-38.play-internet.pl.
 [109.243.71.38]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-647b368de06sm13790969a12.22.2025.12.09.02.40.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 09 Dec 2025 02:40:48 -0800 (PST)
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
X-Inumbo-ID: 86e27b58-d4eb-11f0-b15b-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765276849; x=1765881649; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=DP2dlhrpK3pDnGv20NqLPZ3PfkSkkFLUpE17TucmZPQ=;
        b=g63I3rOa2hJL6rthHOgB4vtEBt5Q3UTO4vhoefUWsRb6oS0VNwlwIr0smmJfDb2nGw
         xnclzQCXzYkgnrSOLVV4BfQWehstUCj7jsOrVmmBDFKJF7N4jFhFcY4p3XM5P9hLRwlt
         CEpqQw5y54M7NGUW2TQGdSD3BxChIU1YL/2y09MwvI3yjaiBs7nosrYsD/7l8mK/TPW4
         6vXOBOPrNTAD9U1+vvfSLNwmFewFIWQUfrMt2wOhIza6LIu+nDt1MmTWLzphdo0kirFQ
         w2wtRkNbi+6LwiVq1vA+zWXydASw2gcqsFLpvsDLcsVFmKmyJ4/S7JucMSzZHb6Wj1wH
         fO8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765276849; x=1765881649;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DP2dlhrpK3pDnGv20NqLPZ3PfkSkkFLUpE17TucmZPQ=;
        b=WNBst7VPwlLtihuSswqjoBgXq8rNtTB1rEDzuclBROBPBKkqR8d239UHEUWA2kw5ZD
         ur7hnabRVPACisKz8oMWtzm4OV18yt1L3pmYGc1Nnu4qZsLmRbDyUPGZS22m/ZCKnqvv
         tdyR3KsnRhPLzlV3mTZ1AgkGp09mCklNFi7LPE8jraqr9HUmyzlCMHVQhpJy7m1fd06j
         visGaG4v3XDDSH31vhr0ihlap28TBgL5RYO2A16b1BZOvDgAsIldpad8Lvhf0RurdPVG
         ivV19Ek0iubGqXmd9oz43x0R1Fh+eWICK6qFDXMUwzLt7B4LXdG5mVmG1CC2FiRku7tb
         lFRA==
X-Forwarded-Encrypted: i=1; AJvYcCVN7gCHTXBqwRQOUAXBMp40qBiQQa8hcYGy6CtLNaMNXT1qhFcNBBdOp5BY7dOvPwh7UiHJNdeK8KI=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxxAqIBBqVyS+MDS7xQECG6j1Fz44VQxA5FASGDhorJPG2SJfP0
	5Xgfk0PSC8+csLo8TZeoNAO5v/ycNt4drQaEhI9qgIsPP5BFhKYN8PcI
X-Gm-Gg: ASbGnct8/uJltG+PGlNGlSNeXuzkgikoUAqHgwdCFmqX/lkXiaibCSAxkAK+BodDUV3
	nOvaO2SMq8Byg22j2zdpNz2NFNGsUVD5fBU/xsX5mjKLj4q+vrEUtVg8642LAPHJCbKZFBc4ZXf
	q1QTIMSQX73GS2auTy34N4xrMuQvbD8IYEGeObUV/PEmHjrDLmY6oiZK6mU/CG1WlYg21i2r3Ux
	IigT68cpS9+ANtKV7U/XfP0brtt1Rw08VU1hGJnAJs2bujDEbeoFmpl6YE200bZwho1/E902+CX
	2s0HPgsGaZFN5WnYZ8gl3w0Vdhg+ZdWhC+/Yfc6IoxRwMdHMBEOu3L2EgzxqaFmYoPuh29NywEh
	mmgF6QDku9+PRjvpWtbR55kUg0AYTkptCjCZ6O7QnsH6v/KHdK7gjexLbOP8XE7TDxbNw3PDj5d
	K1T3lhGWrgtSkmF8BDv9wai5dCMa+17k3AiTxNT1AqHA0KMRTj5YSrxi2Ei6Bi
X-Google-Smtp-Source: AGHT+IH+gzq7akt0Z96nZn8xmJf/AR4xNq83zxi2wWOhS8ex+cBpwg7S8pHROIjvrqoqmeAEVjk0Uw==
X-Received: by 2002:a17:907:8e96:b0:b76:ece0:368e with SMTP id a640c23a62f3a-b7a247dc7d9mr1083973166b.47.1765276848906;
        Tue, 09 Dec 2025 02:40:48 -0800 (PST)
Message-ID: <f1d80a97-747c-486a-bba5-2657bcd974ce@gmail.com>
Date: Tue, 9 Dec 2025 11:40:47 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 03/19] xen/riscv: introduce VMID allocation and
 manegement
To: Teddy Astie <teddy.astie@vates.tech>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, xen-devel@lists.xenproject.org,
 Jan Beulich <jbeulich@suse.com>
References: <cover.1763986955.git.oleksii.kurochko@gmail.com>
 <7805662d530eca29c5b0d0afa05a3cd0aac963bb.1763986955.git.oleksii.kurochko@gmail.com>
 <debd3ec1-2836-4481-aea9-833f04601a7a@vates.tech>
 <11680d9e-bbe8-4457-a7cc-c73f649276e3@suse.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <11680d9e-bbe8-4457-a7cc-c73f649276e3@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On 12/9/25 8:51 AM, Jan Beulich wrote:
> On 08.12.2025 18:28, Teddy Astie wrote:
>> Le 24/11/2025 à 13:36, Oleksii Kurochko a écrit :
>>> diff --git a/docs/misc/xen-command-line.pandoc b/docs/misc/xen-command-line.pandoc
>>> index 34004ce282..6c4bfa3603 100644
>>> --- a/docs/misc/xen-command-line.pandoc
>>> +++ b/docs/misc/xen-command-line.pandoc
>>> @@ -3096,3 +3096,12 @@ the hypervisor was compiled with `CONFIG_XSM` enabled.
>>>    * `silo`: this will deny any unmediated communication channels between
>>>      unprivileged VMs.  To choose this, the separated option in kconfig must also
>>>      be enabled.
>>> +
>>> +### vmid (RISC-V)
>>> +> `= <boolean>`
>>> +
>>> +> Default: `true`
>>> +
>>> +Permit Xen to use Virtual Machine Identifiers. This is an optimisation which
>>> +tags the TLB entries with an ID per vcpu. This allows for guest TLB flushes
>>> +to be performed without the overhead of a complete TLB flush.
>> Should we regroup all asid/vpid/vmid (which are pretty much the same
>> thing with different names and for different arch) under a single
>> command-line option ?
> How would you name such an option, without losing it being recognized by people
> knowing the respective arch?

Teddy,

I would also like to note that, for RISC-V, both the terms ASID and VMID are used.
Therefore, I prefer to have separate command-line options and not overcomplicate
things. Furthermore, these options are used only in architecture-specific code,
so it would be best to follow the relevant architecture-specific documentation
and specifications.

~ Oleksii


