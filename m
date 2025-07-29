Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C294B154CE
	for <lists+xen-devel@lfdr.de>; Tue, 29 Jul 2025 23:48:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1063166.1428966 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ugsBc-00054Z-1q; Tue, 29 Jul 2025 21:48:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1063166.1428966; Tue, 29 Jul 2025 21:48:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ugsBb-00052w-UI; Tue, 29 Jul 2025 21:48:39 +0000
Received: by outflank-mailman (input) for mailman id 1063166;
 Tue, 29 Jul 2025 21:48:39 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/H3U=2K=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1ugsBa-00051P-Uk
 for xen-devel@lists.xenproject.org; Tue, 29 Jul 2025 21:48:38 +0000
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [2a00:1450:4864:20::332])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c80fd66b-6cc5-11f0-b895-0df219b8e170;
 Tue, 29 Jul 2025 23:48:37 +0200 (CEST)
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-455b00339c8so38612105e9.3
 for <xen-devel@lists.xenproject.org>; Tue, 29 Jul 2025 14:48:37 -0700 (PDT)
Received: from [192.168.1.183] (host-195-149-20-212.as13285.net.
 [195.149.20.212]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-458953eb7acsm1858645e9.28.2025.07.29.14.48.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 29 Jul 2025 14:48:35 -0700 (PDT)
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
X-Inumbo-ID: c80fd66b-6cc5-11f0-b895-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1753825716; x=1754430516; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=PnLwM09qil7NYqwf4IbkmNjN6Kdyn4YgY5jwBN7n9z4=;
        b=WYc6IHHmG+sxK/Ctc6Zbo5BS2IttR2I713oubNpHP7u7Lhvn2azaZbEys7ouMEzEvZ
         Sikn8OySHEYKCeg086uX1RYFm//VkSATbVUQfPIQr8WWkhewtj2q50Ah8pArDMLyUJvt
         uZKzJVJqs3dKF3bn/nkBRLsbcQwx5xIqAINvs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753825716; x=1754430516;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PnLwM09qil7NYqwf4IbkmNjN6Kdyn4YgY5jwBN7n9z4=;
        b=EwOoJC79IM11VSxcUalIGaXB12NF8hNxmoYkU4v3HeMEXlq1vpejg28TCyphdzPW1O
         kfM6tbsfkuJEqBskgCnhxhy3Tnpnym+W8KITbGXfxxP64TeD4zvykbcPDcZCQDDQ+I8q
         S6zEixLHDPKmves22VI3w9oJwjdTUfs/PxuuE3tet8MWQ/htJ72WQ6RZf+RsgqN/r5FG
         o/v1K42FQkf4rgVh3g+ER4EDXs0SUjZOuuD62+b76Vt9dtIHtHNpX/AxfLP2Wnkq8WaZ
         w2B6Y7S5QL9YtXQrAjqgj4y/BFWjTCyd9BVDSXTPIpUrM51EJqop+fN95fbZTD+u6MTN
         7AIQ==
X-Forwarded-Encrypted: i=1; AJvYcCUKurD0mpmeQ3iD3TK6QcS+Tgnwo6mSdSn7S8gMMhpyJWe0HNNo4iNbicSEsSsf2fkhjsrGpHFoQ/M=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzM3mJFtpG6aBIxvKkm+AxmT5AAwxsI96DCXYsRErBbTRcLga7+
	Qdg+oexQnwxIuX9OjVhRoj/Pb70HHmtoyetepoM/KNSPLSt0K/9E9S+1pb9IwK/196c=
X-Gm-Gg: ASbGncuVyXyGZ0r68Vp+RXsQVAAsC4hjD8jq3Qvbs7DMf5MfOYClp3Au4SctIx9B14w
	3G+Z7Aumh4x1Xaw26W9YS4LrVu2JTe7S0cQH2i0+kDcxJvctygMLFm1OzsmsAfTs7HfZ3huatmT
	IzGaJt2itl/5lTOMU01fn7nACMUOldZUvrcov+EdkbRy5w2NuH5KPWBibc0lZXkdkdODpcQeBQ5
	kErc1Ug5wYSCmwFfulch+ZFEHtM4Lg1muAm5xhTynAWq+yX28f68KFxbUHxmE1n0iDhBNFPDXIW
	/EN5aqNsgC0sC4KoZYUVBEcJHZ57m1qDs7n9uWaqP59Miw8HG23s9D1ckeIHkT/4wwbpgh9VjVY
	XYHMFrUht0UYCV0UQminZqoxO2O5TxK2KnpGykjwuznnWTh003BFvp3HIuQ9tFYqYGBhP
X-Google-Smtp-Source: AGHT+IH8GIPDDHB50ijyfmwC/ntg9TGb2GqnsSDzkLyRhEr1nWTMFFb9fuHUk3SuH2SU5bp7XV5Xkg==
X-Received: by 2002:a05:600c:8711:b0:456:2066:5747 with SMTP id 5b1f17b1804b1-45892b9c1femr13629665e9.10.1753825716477;
        Tue, 29 Jul 2025 14:48:36 -0700 (PDT)
Message-ID: <c641e58c-96e8-4fce-8bd9-5d00bf93157a@citrix.com>
Date: Tue, 29 Jul 2025 22:48:34 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 3/3] misra: address rule 5.5 bitops
To: Dmytro Prokopchuk1 <dmytro_prokopchuk1@epam.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Anthony PERARD <anthony.perard@vates.tech>, Jan Beulich <jbeulich@suse.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 Paul Durrant <paul@xen.org>, Tim Deegan <tim@xen.org>,
 Tamas K Lengyel <tamas@tklengyel.com>,
 Alexandru Isaila <aisaila@bitdefender.com>,
 Petre Pircalabu <ppircalabu@bitdefender.com>,
 "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>, Dario Faggioli <dfaggioli@suse.com>,
 Juergen Gross <jgross@suse.com>, George Dunlap <gwd@xenproject.org>,
 Meng Xu <mengxu@cis.upenn.edu>
References: <cover.1753822074.git.dmytro_prokopchuk1@epam.com>
 <a9e8d00533d6707a7649a487dc8696c2302634f6.1753822074.git.dmytro_prokopchuk1@epam.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <a9e8d00533d6707a7649a487dc8696c2302634f6.1753822074.git.dmytro_prokopchuk1@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 29/07/2025 10:24 pm, Dmytro Prokopchuk1 wrote:
> Signed-off-by: Dmytro Prokopchuk <dmytro_prokopchuk1@epam.com>
> ---
>  xen/arch/arm/dm.c                          |  2 +-
>  xen/arch/arm/domctl.c                      |  2 +-
>  xen/arch/arm/gic-vgic.c                    | 26 +++++++++++-----------
>  xen/arch/arm/gic.c                         |  8 +++----
>  xen/arch/arm/include/asm/cpufeature.h      |  2 +-
>  xen/arch/arm/include/asm/gic.h             |  2 +-
>  xen/arch/arm/include/asm/guest_atomics.h   |  4 ++--
>  xen/arch/arm/irq.c                         | 16 ++++++-------
>  xen/arch/arm/tee/ffa_partinfo.c            |  2 +-
>  xen/arch/arm/tee/ffa_private.h             |  2 +-
>  xen/arch/arm/traps.c                       |  2 +-
>  xen/arch/arm/vgic-v3-its.c                 |  6 ++---
>  xen/arch/arm/vgic.c                        | 10 ++++-----
>  xen/arch/arm/vgic/vgic-mmio.c              |  2 +-
>  xen/arch/arm/vgic/vgic.c                   |  2 +-
>  xen/arch/arm/vpsci.c                       |  4 ++--
>  xen/arch/riscv/cpufeature.c                |  2 +-
>  xen/arch/riscv/include/asm/guest_atomics.h |  2 +-
>  xen/arch/x86/cpu-policy.c                  | 14 ++++++------
>  xen/arch/x86/cpu/amd.c                     |  2 +-
>  xen/arch/x86/cpu/common.c                  | 14 ++++++------
>  xen/arch/x86/cpu/mcheck/x86_mca.h          |  2 +-
>  xen/arch/x86/domain.c                      |  2 +-
>  xen/arch/x86/e820.c                        |  4 ++--
>  xen/arch/x86/guest/xen/xen.c               |  2 +-
>  xen/arch/x86/hvm/emulate.c                 |  2 +-
>  xen/arch/x86/hvm/hpet.c                    |  6 ++---
>  xen/arch/x86/hvm/irq.c                     | 12 +++++-----
>  xen/arch/x86/hvm/svm/nestedsvm.c           | 10 ++++-----
>  xen/arch/x86/hvm/svm/svm.c                 |  2 +-
>  xen/arch/x86/hvm/viridian/time.c           |  4 ++--
>  xen/arch/x86/hvm/vlapic.c                  |  2 +-
>  xen/arch/x86/hvm/vmx/vmcs.c                |  8 +++----
>  xen/arch/x86/hvm/vmx/vmx.c                 |  4 ++--
>  xen/arch/x86/include/asm/guest_atomics.h   |  2 +-
>  xen/arch/x86/include/asm/hvm/vlapic.h      |  2 +-
>  xen/arch/x86/include/asm/hvm/vmx/vmx.h     |  2 +-
>  xen/arch/x86/include/asm/mpspec.h          |  2 +-
>  xen/arch/x86/irq.c                         | 26 +++++++++++-----------
>  xen/arch/x86/mm.c                          |  8 +++----
>  xen/arch/x86/mm/hap/hap.c                  |  2 +-
>  xen/arch/x86/mm/paging.c                   |  4 ++--
>  xen/arch/x86/mm/shadow/common.c            |  2 +-
>  xen/arch/x86/mm/shadow/hvm.c               |  4 ++--
>  xen/arch/x86/monitor.c                     |  4 ++--
>  xen/arch/x86/msi.c                         |  2 +-
>  xen/arch/x86/psr.c                         |  2 +-
>  xen/arch/x86/pv/dom0_build.c               |  4 ++--
>  xen/arch/x86/pv/emul-priv-op.c             |  2 +-
>  xen/arch/x86/pv/shim.c                     |  2 +-
>  xen/arch/x86/traps.c                       |  2 +-
>  xen/arch/x86/x86_64/mm.c                   |  2 +-
>  xen/arch/x86/x86_64/mmconfig_64.c          |  2 +-
>  xen/arch/x86/xstate.c                      |  4 ++--
>  xen/common/domain.c                        |  4 ++--
>  xen/common/efi/runtime.c                   |  2 +-
>  xen/common/event_2l.c                      |  2 +-
>  xen/common/kexec.c                         | 16 ++++++-------
>  xen/common/keyhandler.c                    |  2 +-
>  xen/common/multicall.c                     |  2 +-
>  xen/common/numa.c                          |  4 ++--
>  xen/common/page_alloc.c                    |  4 ++--
>  xen/common/pdx.c                           |  2 +-
>  xen/common/sched/core.c                    | 12 +++++-----
>  xen/common/sched/credit.c                  | 12 +++++-----
>  xen/common/sched/credit2.c                 |  6 ++---
>  xen/common/sched/rt.c                      |  4 ++--
>  xen/common/vmap.c                          | 12 +++++-----
>  xen/drivers/passthrough/iommu.c            |  2 +-
>  xen/drivers/passthrough/vtd/dmar.c         |  4 ++--
>  xen/drivers/passthrough/vtd/iommu.c        |  4 ++--
>  xen/drivers/passthrough/x86/hvm.c          |  2 +-
>  xen/drivers/passthrough/x86/iommu.c        |  2 +-
>  xen/drivers/vpci/vpci.c                    |  4 ++--
>  xen/include/xen/bitops.h                   |  8 +++----
>  xen/include/xen/cpumask.h                  |  6 ++---
>  xen/include/xen/nodemask.h                 |  2 +-
>  xen/include/xen/sched.h                    |  4 ++--
>  78 files changed, 194 insertions(+), 194 deletions(-)

I'm sorry, but as Jan indicated, this is a non-starter.  Not least
because it's an API we've inherited from Linux, and want to keep for
familiarity.

Do whatever is necessary in the Eclair config to placate the check, and
at some point in the future I'll make the problem go away and delete the
deviation.

~Andrew

