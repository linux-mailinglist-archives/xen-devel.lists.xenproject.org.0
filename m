Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8356BA05BA7
	for <lists+xen-devel@lfdr.de>; Wed,  8 Jan 2025 13:29:22 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.867233.1278681 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tVVBJ-00010V-CK; Wed, 08 Jan 2025 12:29:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 867233.1278681; Wed, 08 Jan 2025 12:29:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tVVBJ-0000y4-95; Wed, 08 Jan 2025 12:29:05 +0000
Received: by outflank-mailman (input) for mailman id 867233;
 Wed, 08 Jan 2025 12:29:04 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=UrZA=UA=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1tVVBH-0000xy-Un
 for xen-devel@lists.xenproject.org; Wed, 08 Jan 2025 12:29:03 +0000
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [2a00:1450:4864:20::342])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 23c5f708-cdbc-11ef-99a4-01e77a169b0f;
 Wed, 08 Jan 2025 13:29:02 +0100 (CET)
Received: by mail-wm1-x342.google.com with SMTP id
 5b1f17b1804b1-4361b6f9faeso5073175e9.1
 for <xen-devel@lists.xenproject.org>; Wed, 08 Jan 2025 04:29:01 -0800 (PST)
Received: from [192.168.1.10] (host-92-26-98-202.as13285.net. [92.26.98.202])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-436e2e89dfesm19241675e9.32.2025.01.08.04.28.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 08 Jan 2025 04:28:59 -0800 (PST)
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
X-Inumbo-ID: 23c5f708-cdbc-11ef-99a4-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1736339340; x=1736944140; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=5PxNIfQRmBZ6wb4IiRIM8vasBb8L45u3BgTYRBUPMNs=;
        b=QEcG1WHBaRZQKfm3KJEzxVnHvKO3haauL1Q3eaOnSvjRa75f4mn6PvgiNl08qlVxi5
         ma/6OL1ZGGmTQC282StHO9sAmGfdPmxL27uzg7IhyEp2xI2BeYHWOPma1UPQN8tWSf04
         56FtTRYh9SkIa9lybHL2HNe9xSt+3HvG52GCw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736339340; x=1736944140;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5PxNIfQRmBZ6wb4IiRIM8vasBb8L45u3BgTYRBUPMNs=;
        b=aMbkde0TUS/B8KWLiHJpk3deWyYMRS6Df/Ce5UOIwIzQh2Gf92WzIcQbR7voZ6auQi
         FybZye7zlCUz9OtqWsLAYfvnTzY/9inBHVaGYd6YT/e5qc+7Wxw6VUplwWntE/2L1NTK
         HppZcEGpsvZ9OWbCUZaMxd5hM/72jNDDlWN7jIvIWpBYMj9Gegg+ZzjObcKDz8kJkA65
         LLUE15sE2YqSOkIy8xl8hhTHUlznGmL5/swVt4aeEQSRW0wOz9/ENQ/0Kv7s5oHas/LT
         GYEY6nMEIMolY8gGpLp2oBki8yKe3oZtBWSYWyvfLVQqMaGLNyyAby2fr1W+wlTsKDs/
         CT+w==
X-Forwarded-Encrypted: i=1; AJvYcCXN1eBNb25tioNoZ/6MAfT1zczQ7eV1thHhC8o/6rRMhuSdcZv11wVN0t1Ti66Mxlhfw2C031z8QBg=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwjAzjgsMGqPK8MS+gEpMuFoP0IeF7CTqa747Kl5fflRk3ra6kM
	pEpBysyeWEaUxbB6L5HXC31cHPFsuzYKzc5JEDKbNLgroNK0a2DDv6C/JEuBXGvhCduEA/BzxFB
	cL2xvEMV/
X-Gm-Gg: ASbGncvVD/xf38C5k5OFBaZkgoYZ4H/8s/QHRCfej2rxRE4HJ8kWQPXiLToM+I8jKMq
	m38mzQ/SIwQA2gZERCwUXIdwL1UjS0/3dXttBz+MU8koTQGy7el/R2YygHOVBAW83qKIii4Oc2t
	kDTmNRN0PL2jrR1TWdMdG4g9WYjZBtifw/Ir/cGnZ4Ujyfw75dZNvW4jSWbjZRCoCr3ofz6gpoa
	PHMDEQkVFTcAYjhFm6lQ26yihncTKebkzuSiQgd7JykyuxgiNqKqbOiMUuVZxn/idfSm+gQ1qJt
	Y6Ps1ctMBRSAIxDhG/4v
X-Google-Smtp-Source: AGHT+IF6zkPCvXxzP7t94XGH8eF75liMG9LwnzDo96esU2GxiWQpyBBitNrQB5vdBWH2/lZCl8lsWg==
X-Received: by 2002:a05:600c:3b85:b0:434:fddf:5c06 with SMTP id 5b1f17b1804b1-436e1dcac5fmr23360885e9.1.1736339340361;
        Wed, 08 Jan 2025 04:29:00 -0800 (PST)
Message-ID: <ec27ede3-b911-4495-aabb-fee8399055ce@citrix.com>
Date: Wed, 8 Jan 2025 12:28:59 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Bug: Hyperlinks in generated documentation may point to the wrong
 architecture
To: Maximilian Engelhardt <maxi@daemonizer.de>, xen-devel@lists.xenproject.org
References: <2293976.iZASKD2KPV@localhost>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <2293976.iZASKD2KPV@localhost>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 30/12/2024 8:56 pm, Maximilian Engelhardt wrote:
> Hello,
>
> during working on packaging Xen in Debian I noticed the documentation becomes 
> non-reproducible as hyperlinks may point to the wrong architecture.
>
> Here an example as diff showing the problem:
>
> /usr/share/doc/xen/html/hypercall/arm/include,public,arch-arm.h.html
> @@ -313,15 +313,15 @@
>      uint64_t sctlr;
>      uint64_t ttbcr, ttbr0, ttbr1;
>  };
>  typedef <a href="include,public,arch-arm.h.html#Struct_vcpu_guest_context">struct vcpu_guest_context</a> <a  name="Typedef_vcpu_guest_context_t"><strong>vcpu_guest_context_t</strong></a>;
>  DEFINE_XEN_GUEST_HANDLE(<a href="include,public,arch-arm.h.html#Struct_vcpu_guest_context">vcpu_guest_context_t</a>);
>  
>  /*
> - * <a href="include,public,arch-arm.h.html#Struct_xen_arch_domainconfig">struct xen_arch_domainconfig</a>'s ABI is covered by
> + * <a href="include,public,arch-ppc.h.html#Struct_xen_arch_domainconfig">struct xen_arch_domainconfig</a>'s ABI is covered by
>   * XEN_DOMCTL_INTERFACE_VERSION.
>   */
>  #define XEN_DOMCTL_CONFIG_GIC_NATIVE    0
>  #define XEN_DOMCTL_CONFIG_GIC_V2        1
>  #define XEN_DOMCTL_CONFIG_GIC_V3        2
>  
>  #define XEN_DOMCTL_CONFIG_TEE_NONE      0
>
>
> As can be seen, the hyperlink in include,public,arch-arm.h.html points to 
> include,public,arch-ppc.h.html while it should point to include,public,arch-
> arm.h.html.
> A similar problem can be found in many more places and files.
>
> Corresponding to the problem described above, while building the documentation 
> many messages similar to the last lines below can be seen in the build log:
>
> /usr/bin/perl -w /build/reproducible-path/xen-4.19.1/docs/xen-headers -O html/hypercall/arm \
>         -T 'arch-arm - Xen public headers' \
>         -X arch-x86_32 -X arch-x86_64 \
>         -X xen-x86_32 -X xen-x86_64 \
>         -X arch-x86 \
>         /build/reproducible-path/xen-4.19.1/docs/../xen include/public include/xen/errno.h
> include/public/arch-ppc.h:91: multiple definitions of Typedef vcpu_guest_core_regs_t: include/public/arch-arm.h:300
> include/public/arch-ppc.h:91: multiple definitions of Typedef vcpu_guest_core_regs_t: include/public/arch-ppc.h:85
> include/public/arch-ppc.h:91: multiple definitions of Typedef vcpu_guest_core_regs_t: include/public/arch-arm.h:300
> include/public/arch-ppc.h:91: multiple definitions of Typedef vcpu_guest_core_regs_t: include/public/arch-ppc.h:85
> include/public/arch-ppc.h:95: multiple definitions of Struct vcpu_guest_context: include/public/arch-ppc.h:90
> include/public/arch-ppc.h:95: multiple definitions of Struct vcpu_guest_context: include/public/arch-arm.h:305
> include/public/arch-ppc.h:95: multiple definitions of Struct vcpu_guest_context: include/public/arch-ppc.h:90
> include/public/arch-ppc.h:95: multiple definitions of Struct vcpu_guest_context: include/public/arch-arm.h:305
> [...]
>
>
> In Debian we worked around the problem for now by adding ppc and riscv to 
> DOC_ARCHES in docs/Makefile as can be seen in [1]. This solves all the 
> described problems and makes the build reproducible again. I assume another 
> possible fix would be adding suitable ignore switches for ppc and riscv.
>
> I did not send this as a patch as I'm not sure what the preferred upstream 
> solution to this problem is, but can formally submit our fix as a patch if 
> that's desired.
>
> Thanks,
> Maxi
>
> [1] https://salsa.debian.org/xen-team/debian-xen/-/commit/d852c48d0df5c6ceba42d20652d1f9a05ad8989e 

This is a giant not-invented-here mess which needs filing in /dev/null.

The fact that you're the first to notice the incorrect linking (and only
via reproducible-build tooling) shows how many people read these docs.

I'm happy with that minimal fix, and it ought to be backported.  Please
submit it formally.

~Andrew

