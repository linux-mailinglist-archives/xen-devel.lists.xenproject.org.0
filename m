Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EEBF4AB17EB
	for <lists+xen-devel@lfdr.de>; Fri,  9 May 2025 17:06:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.980101.1366575 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uDPHc-0007PF-8k; Fri, 09 May 2025 15:05:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 980101.1366575; Fri, 09 May 2025 15:05:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uDPHc-0007M7-5e; Fri, 09 May 2025 15:05:04 +0000
Received: by outflank-mailman (input) for mailman id 980101;
 Fri, 09 May 2025 15:05:02 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=SZc7=XZ=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1uDPHa-0007M1-TJ
 for xen-devel@lists.xenproject.org; Fri, 09 May 2025 15:05:02 +0000
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [2a00:1450:4864:20::32d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f33883bb-2ce6-11f0-9ffb-bf95429c2676;
 Fri, 09 May 2025 17:04:48 +0200 (CEST)
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-43cf3192f3bso21914005e9.1
 for <xen-devel@lists.xenproject.org>; Fri, 09 May 2025 08:04:48 -0700 (PDT)
Received: from [192.168.1.183] (host-92-26-98-202.as13285.net. [92.26.98.202])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3a1f57ddfbesm3567684f8f.10.2025.05.09.08.04.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 09 May 2025 08:04:47 -0700 (PDT)
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
X-Inumbo-ID: f33883bb-2ce6-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1746803088; x=1747407888; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=3Pp05axnEvIXhS9aw/LAwTaf5wYKSoDVSSbRDg50040=;
        b=Y785sNF7Xj92ghiisOrsobnZnvEONqz4KV/gRBV7lfJzwXj5UdKmmy2UGHXC/RLwKY
         NW46CY7gL8Q2zNVf9CqbDn44OiHmj1DVoJwJmvOPm5qJKk40KAqGVdRoW5AIU+6lWIaw
         4r9i2/NSAnnmqdKL4vDgbwFxnTCqhKpsCI6dg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746803088; x=1747407888;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3Pp05axnEvIXhS9aw/LAwTaf5wYKSoDVSSbRDg50040=;
        b=TNB0dOo9nP18tmNTRQ+4jpkkDLuWFoajhZgRDbjrt84mJQBF9hQNGO3TMl5T3so2jb
         n94V79M+cowDMbtrWoFZl5o92KcySE+Hvxw+WFql60kP+NMjRlQLb6aBSN42brzS+/dR
         9l88Q4a/qtQhnePTKhQJfRRjDTPaZo/TN7NY4ltX3uKvJiGCwGsxhg/SSSWoTVm0ZtHQ
         DbKStdhc7nCPCcWKg3jJf4ljtOLB/Pq0G3Z7Dp5UOFDJk3uImMK5LJ3z0UPGIJoTjtGZ
         4JbFqRB/cFiJh6pUXznvuUsKsdh7Q223qNO2TWrahS4BEJ9O7Ff4YBktYCbiqNka7VIn
         vCAQ==
X-Forwarded-Encrypted: i=1; AJvYcCWXa/Dw0kCYxiXfc49XvJQXM0Q7EVqVU6qT/lxikEf4Rq93XUl1NZ/VSGZ/Zik8SIIQWEh8Otl9vaw=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yyu/DEsAGObW7ad2TGucVkjoGcGftp1B0BdUPAccgi7RM9LVxcx
	mE8qaHy4uazmFBkJHPMsvvXBHWcTqPxbcfMNXoo9S42RBN89sBaaFQ+RiNsgebY=
X-Gm-Gg: ASbGncvt1HOYRS59xQEFlIOmuwHpXhPP3tYNK3SX7yVXu4tsk6D6yLjvrMB0BNg5UtC
	cNChsWbgQ2NDvsSfyOI7CUyw2908jshPH+FQsHf2AySng3jSxBMC/zIiqW8MHJqGSvq1rIsybc/
	ZntQnt0ey6KyaCwpXsOExjBrrP4Tl9eYDhrMH2mUV7X08g3+2GH+zM5J9S2+aVesDn1wK1QLZHi
	f193BSzYyH783khYtVi8Q7dSw+bvJ3vhgKNauUYG5y3pxsa9tpmbiJhz2a5UApmLRDekXqnLgIo
	Xfj9JXZCexY8IRIY6VnqLpoX8FhLW13KiCH3/Pi5Wy+3AnfoXy/W5g5ppBkwSAugeQkyrPyRhRz
	ygZGHnA==
X-Google-Smtp-Source: AGHT+IFbapsardf1+monZzUDobM3q/zFDCXxMT5SK/hfWNfP5ocX3lPsjlpBSfKsDFGlFdDc/bLP2A==
X-Received: by 2002:a05:6000:178e:b0:391:4889:5045 with SMTP id ffacd0b85a97d-3a1f649be24mr2759578f8f.36.1746803087685;
        Fri, 09 May 2025 08:04:47 -0700 (PDT)
Message-ID: <a197c145-1fc5-4482-bce9-12511a816a63@citrix.com>
Date: Fri, 9 May 2025 16:04:45 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/4] Allows Secure Boot for Kexec
To: Frediano Ziglio <freddy77@gmail.com>, xen-devel@lists.xenproject.org
Cc: Frediano Ziglio <frediano.ziglio@cloud.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>,
 Julien Grall <julien@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20250507094253.10395-1-freddy77@gmail.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <20250507094253.10395-1-freddy77@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 07/05/2025 10:42 am, Frediano Ziglio wrote:
> Ross Lagerwall (4):
>   xen/lib: Export additional sha256 functions
>   kexec: Include purgatory in Xen
>   kexec: Implement new EFI load types
>   kexec: Support non-page-aligned kexec segments

I realise a lot of this is coming from kexec-tools and/or Linux, but it
looks very very mad.

From patch 1, we're embedding this in Xen:

xen.git/xen/arch/x86/purgatory$ ls -lah purgatory.ro
-rw-r--r-- 1 andrew andrew 30K May  9 15:24 purgatory.ro

yet -Wa,--strip-local-absolute alone halves the size:

xen.git/xen/arch/x86/purgatory$ ls -lah purgatory.ro
-rw-r--r-- 1 andrew andrew 17K May  9 15:25 purgatory.ro

Looking at purgatory itself, we enter at purgatory_start, load a local
GDT, set up a local stack, call into C for the hashing (and nothing
else), then jmp to entry64...

... which loads a (different) local GDT, (different) local stack, loads
the GPRs and then jumps into the new kernel.

Combined with kexec_reloc(), that's 3x we change GDT and stack in
several hundred instructions.


Looking further at patch 2, we only set up 3 GPRs; %rip, %rsp and %rdi
pointing the parameter block.

Patch 2 also contains an a large amount of EFI-editing logic (all
vulnerable to XSA-25), which AFAICT exists only because purgatory is
built non-PIC and wants relocating.  I can't see any external
references, or anything that couldn't be resolved at link time for a PIC
build.


There are two things which purgatory does which Xen doesn't currently
cater for:

1) Setting up the GPRs in that manner
2) The digest checks

#1 is very easy to fix and can probably even be done on the current ABI
(older Kexecs using purgatory won't care), and #2 ought to be easy too
by extending machine_kexec().  We can do the digest checks
unconditionally (it's a sensible check irrespective).

I think that removes the majority of this series, with no loss in
functionality?

Given that we're leaving the signature check to the dom0 kernel (which
is TCB and therefore can in the UEFI-SB model), we just might be able to
get away without any hypercall changes at all?

Thoughts?

~Andrew

