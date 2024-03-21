Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A31D886158
	for <lists+xen-devel@lfdr.de>; Thu, 21 Mar 2024 20:55:29 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.696588.1087650 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rnOUu-00074z-KT; Thu, 21 Mar 2024 19:54:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 696588.1087650; Thu, 21 Mar 2024 19:54:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rnOUu-00072j-Hm; Thu, 21 Mar 2024 19:54:44 +0000
Received: by outflank-mailman (input) for mailman id 696588;
 Thu, 21 Mar 2024 19:54:42 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=GHKb=K3=gmail.com=mingo.kernel.org@srs-se1.protection.inumbo.net>)
 id 1rnOUs-00072d-It
 for xen-devel@lists.xenproject.org; Thu, 21 Mar 2024 19:54:42 +0000
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [2a00:1450:4864:20::435])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id daee05f8-e7bc-11ee-afe0-a90da7624cb6;
 Thu, 21 Mar 2024 20:54:41 +0100 (CET)
Received: by mail-wr1-x435.google.com with SMTP id
 ffacd0b85a97d-33ec7e38b84so849526f8f.1
 for <xen-devel@lists.xenproject.org>; Thu, 21 Mar 2024 12:54:41 -0700 (PDT)
Received: from gmail.com (1F2EF04C.nat.pool.telekom.hu. [31.46.240.76])
 by smtp.gmail.com with ESMTPSA id
 r29-20020adfa15d000000b0033e79eca6dfsm355492wrr.50.2024.03.21.12.54.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Mar 2024 12:54:39 -0700 (PDT)
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
X-Inumbo-ID: daee05f8-e7bc-11ee-afe0-a90da7624cb6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1711050880; x=1711655680; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:sender
         :from:to:cc:subject:date:message-id:reply-to;
        bh=jDZlJEtHFIm6Gl+7kSgG5qWF5bEblRoSU2T4MYJXNV8=;
        b=EW8rarvBglu1xrwkE7mqrjqX4R7kZJzdboMynl0sedgyabvnpqltSBY4fQ/nb2pCRu
         9Bg2ttev4zemXxO+Ds1Kq3odpdoeTAT4AAG11RHECHaACGKCCPNs03+4D6Mk/KGBOsO5
         cb8jq+9Td0Qhhv1yZo9rjiRgomkteMxqCYB7AmJcDewzgA7aOUP04IPZjaTw1ejC3Fiw
         QnR/SdrSGi2S0sKM13inW4SDrHubWXxruBeA0u7upCoxSFTZmZoSt1hildFlOTWWazNc
         foExE6PsxCYwOu2lU7FDptO0yTMB6JYK/emqc+J1cCKfR58jCPDT3Bf14y8DYHeQOzon
         uH/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711050880; x=1711655680;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:sender
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jDZlJEtHFIm6Gl+7kSgG5qWF5bEblRoSU2T4MYJXNV8=;
        b=HlayWdz5M/Zy/SuDAZshvyxnZxzJ0uujz1QdKp17H0IhQHDNkck3tr6XhD7BWA9BBy
         YRRZvRy0venIl7cKa8ZP1929eVse+ie0ISYntnWdg6sSf7RA3/8yUobRAoWHtGca0C/w
         fZ9G66s3E0o1i+5CIaS409ZFX6NyZ35dAkZ2ihz4hZ9lW/Pou4VYQKa5AmbKbdMqOCUu
         L5JwIZ+VtW8SP4Lhckq+qEKDtxpn/wsLMbBfon3epIXXNX9Ks27mki3cY2oDd+Osag9a
         vx0rjAAcPFAh9Fruh503tDkqyhonlJdSD/hGLYFVF+0iBzYQ5ONsyN/MmfQOQRwuVtD2
         eaew==
X-Forwarded-Encrypted: i=1; AJvYcCUtsXRZkmj4zlyKpe90ob1Mh1tA9aSW/WGIDV2U/72GGGFqr2jCN+ge/wcCkXc0QwJkI4JR2pPG0VUrjt9QdQSZjx6o3kfA+ZrW/wUg92g=
X-Gm-Message-State: AOJu0Yx0ZNPfDVKqzl6yK3QvCviLtvSHZb8eh3Y0Ipp10ooHN9i0WHxM
	lLiMVGc0rOiM/N3q+/rL30E7VwJje8gJDNpqk8alrp63H8cJWq8n
X-Google-Smtp-Source: AGHT+IEOclJy/CKjgZg3kBSaqvyZWV4BNEYGoWmUbWBMk90pFzsmw4VkSdit7UdC6gAJ/ZWAiox1gg==
X-Received: by 2002:a05:6000:1843:b0:33d:c657:6ae3 with SMTP id c3-20020a056000184300b0033dc6576ae3mr125312wri.7.1711050879879;
        Thu, 21 Mar 2024 12:54:39 -0700 (PDT)
Sender: Ingo Molnar <mingo.kernel.org@gmail.com>
Date: Thu, 21 Mar 2024 20:54:37 +0100
From: Ingo Molnar <mingo@kernel.org>
To: "Xin Li (Intel)" <xin@zytor.com>
Cc: linux-kernel@vger.kernel.org, xen-devel@lists.xenproject.org,
	linux-arch@vger.kernel.org, tglx@linutronix.de, mingo@redhat.com,
	bp@alien8.de, dave.hansen@linux.intel.com, x86@kernel.org,
	hpa@zytor.com, jgross@suse.com, boris.ostrovsky@oracle.com,
	arnd@arndb.de, Brian Gerst <brgerst@gmail.com>
Subject: Re: [PATCH v2 1/1] x86: Rename __{start,end}_init_task to
 __{start,end}_init_stack
Message-ID: <ZfyQfQrluph6GxLS@gmail.com>
References: <20240318071429.910454-1-xin@zytor.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240318071429.910454-1-xin@zytor.com>


* Xin Li (Intel) <xin@zytor.com> wrote:

> The stack of a task has been separated from the memory of a task_struct
> struture for a long time on x86, as a result __{start,end}_init_task no
> longer mark the start and end of the init_task structure, but its stack
> only.
> 
> Rename __{start,end}_init_task to __{start,end}_init_stack.
> 
> Note other architectures are not affected because __{start,end}_init_task
> are used on x86 only.
> 
> Signed-off-by: Xin Li (Intel) <xin@zytor.com>
> ---
> 
> Change since v1:
> * Revert an accident insane change, init_task to init_stack (Jürgen Groß).
> ---
>  arch/x86/include/asm/processor.h  | 4 ++--
>  arch/x86/kernel/head_64.S         | 2 +-
>  arch/x86/xen/xen-head.S           | 2 +-
>  include/asm-generic/vmlinux.lds.h | 6 +++---
>  4 files changed, 7 insertions(+), 7 deletions(-)

Note that this is now in conflict with this cleanup by Brian Gerst:

   2cb16181a1d1 x86/boot: Simplify boot stack setup

... which removed __end_init_task[] entirely.

Thanks,

	Ingo

