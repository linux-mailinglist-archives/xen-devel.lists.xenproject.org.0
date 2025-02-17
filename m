Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C83CBA38EBD
	for <lists+xen-devel@lfdr.de>; Mon, 17 Feb 2025 23:10:52 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.890932.1300054 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tk9K4-0004jQ-UH; Mon, 17 Feb 2025 22:10:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 890932.1300054; Mon, 17 Feb 2025 22:10:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tk9K4-0004hy-RV; Mon, 17 Feb 2025 22:10:40 +0000
Received: by outflank-mailman (input) for mailman id 890932;
 Mon, 17 Feb 2025 22:10:39 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=xGAw=VI=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1tk9K3-0004hs-Dp
 for xen-devel@lists.xenproject.org; Mon, 17 Feb 2025 22:10:39 +0000
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [2a00:1450:4864:20::42c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0225c0f0-ed7c-11ef-9896-31a8f345e629;
 Mon, 17 Feb 2025 23:10:34 +0100 (CET)
Received: by mail-wr1-x42c.google.com with SMTP id
 ffacd0b85a97d-38f2f783e4dso2483358f8f.3
 for <xen-devel@lists.xenproject.org>; Mon, 17 Feb 2025 14:10:34 -0800 (PST)
Received: from [192.168.1.10] (host-92-26-98-202.as13285.net. [92.26.98.202])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38f258b41b5sm13451214f8f.14.2025.02.17.14.10.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 17 Feb 2025 14:10:33 -0800 (PST)
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
X-Inumbo-ID: 0225c0f0-ed7c-11ef-9896-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1739830233; x=1740435033; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=EGhA3EGWvSrKiWHRBOjX9MafbPgT46PWiOECJGeGD2M=;
        b=DPkugvjcj3xWoF2JD9TWNFd7shQsgKARfiuii2P9rEiHrKqCSoKgahMFnKbYNQgHZ/
         hV9/uM/+KiE6FHsM6aWhqAMkdcU/7gxFxyXHuVZ3m99znTB7zOxkf4J+m441gqUORDE+
         /mUTOZvXSOaio059JPJvR4juZMfbiOGQ4Muko=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739830233; x=1740435033;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EGhA3EGWvSrKiWHRBOjX9MafbPgT46PWiOECJGeGD2M=;
        b=boeScc1HRRmth982JAyA6wYz/PlvyiBjOVcMVh0J4CtRCd4hWodIFrCXMJK6FegXTg
         81PmU5NUKUDXZIqDUaBxk13Qa/Ono3+1QbqXDIWF8QM8nU/RDJemMzu3BxWQWIxVHCFe
         55VFrDo9u2N9cJrfbfLzr9ne/uAGP77NYN5E45Huvu5cOP6Djc1nxO+g+LsdwDDZuKmV
         rOmnDreL6Uyn+XCiv0LrhG7THxsBgrZUo/NVte7vWucwLGWxcxmNFRN4baYj5Q2FCZCz
         HVCoq/H348sFASjU8jXmz53FDzVLs3+R2yT/vpWovkhBMICdl7KkcPzKAwX1Lb+aU8rJ
         OVFA==
X-Gm-Message-State: AOJu0Yz1Qmulj106Ki4dLYPTAZKsuit2Jg/EejjdLT9JDS5Fl/n6u+ml
	Y1TmCi/vwU6ap/Ve/AfZlzotQdQWeUD7BqmNm9L1wzuFQ0fpGjJdWbWpuaTNTig=
X-Gm-Gg: ASbGnctMyq2toZIyUd10A2kyvwea57d+NWkprqDj5DsXUOBnTc5db3A7Q+7hYlVe06B
	hFpdx1XfGvXfUg/+f2hngCgbCWca5GjXrKC865uhSiPUlp0FxETor/TQG7HgeldGfT4d2U05/cx
	zovVrvgEA+jKMFzm2KsevxKDPW0e345dGj58DrTLhdaMgFv94SMzQZRqOoQZI10tw4hY/6oCQZY
	GFeBYBetLlCb2ML9bFBuYpXUBymEZnpm+WFfYt6dpF34By7ceftCEu8xSsINBwzd45Q4hg1d4mL
	ulEF2v2XxhbxtkDS8WJv7h7dXFDDc6+HeCdMUTN+l+BgH1rtNi9DnB0=
X-Google-Smtp-Source: AGHT+IHD9N92LX7CaiF4nbi24HGZ4+hhX6Rx99Vll6/xoPw4IjCT9MK5HxujvMpfejMWMqq6OXruEw==
X-Received: by 2002:adf:f1ca:0:b0:38d:e304:7484 with SMTP id ffacd0b85a97d-38f33f1f8e5mr7205114f8f.12.1739830233499;
        Mon, 17 Feb 2025 14:10:33 -0800 (PST)
Message-ID: <87175acd-3bbe-4aa5-8925-ae2fc721a29f@citrix.com>
Date: Mon, 17 Feb 2025 22:10:32 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: early crash while loading dom0 kernel between git:19730dbb3f and
 git:414dde38b0
To: "Greg A. Woods" <woods.greg.a@gmail.com>, Jan Beulich <jbeulich@suse.com>
Cc: xen-devel@lists.xenproject.org,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>
References: <6CBF18F6-8AF8-4A22-A4EC-0D7F382FA815@gmail.com>
 <4be50b34-f4bf-46fd-b851-53db26272877@suse.com>
 <BB0FB055-42C1-4181-90C7-012A02387595@gmail.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <BB0FB055-42C1-4181-90C7-012A02387595@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 17/02/2025 10:02 pm, Greg A. Woods wrote:
> A quick reply, maybe more later...
>
> I thought I had done a fresh clean build as I ran "gmake clean" in the top
> level directory, however then when reading your's and Andrew's replies I
> realized I have been doing the Xen kernel build in a separate build directory,
> which the top-level makefile won't know about.  (I never build in the source
> tree of anything if at all possible.)
>
> So I cleaned everything out and started again, and voila!  It works!
>
> This is definitely annoying, but not a deal breaker!

Glad it's not a *different* weird breakage.  And at least now we've got
a stated repro of the issue.

> Note again my local patches do not change any actual code in the xen subdir.
>
> The "has no endbr64" messages are possibly due to the fact that I'm still
> using GCC-9.x on NetBSD, and as I understand it that compiler is too old
> to support ENDBR instructions.  I disabled the related build-time tests.
> I can build with GCC-10.5 on another host and try that too.

Can you attach your .config file from the build?  Those messages ought
to only show up in builds where ENDBR's are present, but it's possible
that something's out of sync with the various Kconfig controls involved.

> BTW, there is also another regression (since 4.13, I think) on some hardware
> that I've been trying to gather more data on, thus my testing from git.  That
> is that on two of my older machines both the dom0 and domUs (running NetBSD
> and FreeBSD) lose track of time after about 7.5 days.  The same code on a
> slightly newer server runs reliably with accurate time.  Others using NetBSD
> on Xen have reported similar problems.  Some claim running with 1 vCPU avoids
> the problem.  I'm guessing something in the Xen kernel loses track of TSC
> scaling when running on some CPUs.  This has been discussed in the port-xen
> list for the past few months:  https://mail-index.netbsd.org/port-xen/

Time handling is a known swamp.  I can believe something has changed
since 4.13, but I wouldn't say it was working back then either.

~Andrew

