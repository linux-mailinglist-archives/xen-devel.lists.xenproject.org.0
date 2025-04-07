Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 14019A7DF2B
	for <lists+xen-devel@lfdr.de>; Mon,  7 Apr 2025 15:29:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.940149.1340017 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u1mXL-0005Xv-GP; Mon, 07 Apr 2025 13:29:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 940149.1340017; Mon, 07 Apr 2025 13:29:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u1mXL-0005Vx-Ce; Mon, 07 Apr 2025 13:29:15 +0000
Received: by outflank-mailman (input) for mailman id 940149;
 Mon, 07 Apr 2025 13:29:13 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ZxXC=WZ=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1u1mXJ-0005Vr-GG
 for xen-devel@lists.xenproject.org; Mon, 07 Apr 2025 13:29:13 +0000
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [2a00:1450:4864:20::32f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4aecdd2c-13b4-11f0-9eaa-5ba50f476ded;
 Mon, 07 Apr 2025 15:29:12 +0200 (CEST)
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-43cebe06e9eso28494605e9.3
 for <xen-devel@lists.xenproject.org>; Mon, 07 Apr 2025 06:29:12 -0700 (PDT)
Received: from [192.168.1.183] (host-92-26-98-202.as13285.net. [92.26.98.202])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43ec1660bcesm132514105e9.10.2025.04.07.06.29.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 07 Apr 2025 06:29:11 -0700 (PDT)
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
X-Inumbo-ID: 4aecdd2c-13b4-11f0-9eaa-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1744032551; x=1744637351; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=qaQHixNC8CKlwNwDP5YrDlwPW9p/Kd1pkYmE4vTsjl8=;
        b=NQDdKYqkrWvLM2luxi56aHWtZsi0Ntrc49Desz0zOS1RNXBaVMa/g+fpxv33G1weAO
         LLCLg5YEgO6BIIcH5zxhimako/uym0pHfKFKGAZG+hiHqLK6RD2VYEDfasZXvboHU6ny
         Q3qCtaatQUMv2+/THkyyF/8b5nDa5XAkKvKnA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744032551; x=1744637351;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qaQHixNC8CKlwNwDP5YrDlwPW9p/Kd1pkYmE4vTsjl8=;
        b=gKd9ims5137XC8bsBF1UFbaIAmMs/W5VaDmsG8ZAEq2idIYMs4tKHjil7aaqlQfpFd
         jWYI90rCakXgvP+9LniqEGafEygJjqepUKMRMObrirXiHOYl5zwEIbWPi2LtWFSdATwJ
         xe4ovkBhu4peOQfP5C1QG7bL4hkNRc02r9tePPowYZFtH6McEWntfzzJP30LsAxwPoxU
         EeyMiszgOmUx9yWqqtQOxVubQa+d5/Kk6D1YIuKOuMUL73rwYK7t86PfrT28HVGN9mTL
         /EEfwl66qYz+PJCPpNdmswLDZ/SMHlfrzEolGS7C+BSRXMlyrIaEnv3URieiX4NPuX55
         6Y5g==
X-Forwarded-Encrypted: i=1; AJvYcCXccEzQCRiBQG+J7YbNY0PosDryqnU0EhrOwNDQHzUK+2nulZgqb5EWgUzAIpY0aO2pokEhr3dfZSU=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yx/pcOP+4HkRqe0YGCfajVMyOWfmcp5yzR2oCBpt7PhzaCIpvc8
	1RHC2/8rOGkzsLom0yosVEH2kn7X7zQt+nG1amHx4CS3IkK2+qTqILY/a0L63cU=
X-Gm-Gg: ASbGncsYVN4xfDpV55EEGddNZ6Bess/akytsClqYfaaETQqQky2lRw3o0EO4L7M8hQG
	mxFM3SG0ez0hW4JsMWXdqP+I2YI8L6M2QmAozSZvys8XSPWW3Bp2kgU4gBW91MRTMQ9rekb++FB
	3zJlz+wu7r3KuFZ/LtisCKvBgNa+J/gnABQw/I7olHGxqtQdLmyGvANoS4HHCioBX2sGHotMig5
	XUy47n52b6C+ocUyEUqMfWlt9G9NyQWis76KNl+V/kEEdAEH43LkDhpKOkN94C2Nn60TSivlIFy
	V75qjxSkJdmEkSnpCem7ApssjWFLMGvVt41Y1o+a17AHZCn4DCd8jfJNr3uzP9oKrsx5YNpmwsM
	QS31K9D49Wg==
X-Google-Smtp-Source: AGHT+IHMpy1XKIbNbdUoLoU/U6+HQky82jTKA10X140wr9uX2Q2DdeqpEhqD7LDRl3/ff24vCr/zEQ==
X-Received: by 2002:a05:600c:4705:b0:43d:53c:1ad6 with SMTP id 5b1f17b1804b1-43ecfa02754mr83517745e9.26.1744032551647;
        Mon, 07 Apr 2025 06:29:11 -0700 (PDT)
Message-ID: <45d415b1-2b7b-44ae-81d7-8047b2c9554a@citrix.com>
Date: Mon, 7 Apr 2025 14:29:10 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/cpu: Validate CPUID leaf 0x2 EDX output
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <190ea0fe-887b-44dc-bf05-db154f26a03d@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <190ea0fe-887b-44dc-bf05-db154f26a03d@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 19/03/2025 11:24 am, Jan Beulich wrote:
> From: Ahmed S. Darwish <darwi@linutronix.de>
>
> CPUID leaf 0x2 emits one-byte descriptors in its four output registers
> EAX, EBX, ECX, and EDX.  For these descriptors to be valid, the most
> significant bit (MSB) of each register must be clear.
>
> Leaf 0x2 parsing at intel.c only validated the MSBs of EAX, EBX, and
> ECX, but left EDX unchecked.
>
> Validate EDX's most-significant bit as well.
>
> Fixes: 1aa6feb63bfd ("Port CPU setup code from Linux 2.6")
> Signed-off-by: Ahmed S. Darwish <darwi@linutronix.de>
> Signed-off-by: Ingo Molnar <mingo@kernel.org>
> Link: https://lore.kernel.org/r/20250304085152.51092-3-darwi@linutronix.de
>
> Use ARRAY_SIZE() though.
>
> Origin: git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git 1881148215c6
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>

> ---
> I wasn't really convinced that we strictly need f6bdaab79ee4 ("x86/cpu:
> Properly parse CPUID leaf 0x2 TLB descriptor 0x63") as well. Thoughts?

I don't think we need it either.

