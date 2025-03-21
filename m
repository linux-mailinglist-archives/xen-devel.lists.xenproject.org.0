Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D17AA6BE72
	for <lists+xen-devel@lfdr.de>; Fri, 21 Mar 2025 16:43:08 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.924220.1327520 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tveWL-0003fw-Eq; Fri, 21 Mar 2025 15:42:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 924220.1327520; Fri, 21 Mar 2025 15:42:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tveWL-0003dG-BO; Fri, 21 Mar 2025 15:42:53 +0000
Received: by outflank-mailman (input) for mailman id 924220;
 Fri, 21 Mar 2025 15:42:51 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=8bxS=WI=cloud.com=alejandro.vallejo@srs-se1.protection.inumbo.net>)
 id 1tveWJ-0003dA-II
 for xen-devel@lists.xenproject.org; Fri, 21 Mar 2025 15:42:51 +0000
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com
 [2a00:1450:4864:20::52e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 25447b30-066b-11f0-9ea1-5ba50f476ded;
 Fri, 21 Mar 2025 16:42:50 +0100 (CET)
Received: by mail-ed1-x52e.google.com with SMTP id
 4fb4d7f45d1cf-5e5e0caa151so3811670a12.0
 for <xen-devel@lists.xenproject.org>; Fri, 21 Mar 2025 08:42:50 -0700 (PDT)
Received: from localhost ([46.149.103.9]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5ebccfb4471sm1551224a12.47.2025.03.21.08.42.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 21 Mar 2025 08:42:49 -0700 (PDT)
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
X-Inumbo-ID: 25447b30-066b-11f0-9ea1-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1742571770; x=1743176570; darn=lists.xenproject.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lQvIRktyYN6oVJCsrYOSH6lUWnRK6aeopscc7p29yME=;
        b=gP43JAp52wfiYk4eMhqUDk7uUI3bN075E1jjjtw5QL5mDbV2ibaIuQzfLdzMZNSYQU
         ZJnrH9vEDot04xEhmsmk1NLjqNsnB4Q0KV7Mq2n+G0nDNoygp6F05obs4FCQICUcEtzr
         xxHRexmHei+dD3cw6Y+QnhwEnz0TONbMa+Ht0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742571770; x=1743176570;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=lQvIRktyYN6oVJCsrYOSH6lUWnRK6aeopscc7p29yME=;
        b=mbaqZQN4M4NUgMVac2Xh72TyG0ra7S5vUgRBIGn8ajOARDWgkdGnJDxjiDE+g32Yw8
         2tHZlPKwExdaPMkDM4w1ukckM4zFgX4RHRu1LQqw3lgqtvTNK9rn0+B1LExcvK7Ofomv
         d/fDwyploMs8TXmA4I9HYpJTVA3vqnmZ0OYpETgLrnpJAerwazLmeRKucAToFDuvmNh9
         dZcaeVy2otoN4QQVSl0NSELErQBEueeUhflf9q7FXmZEM8W+wtn6tj1wFJlq0zWSSHwi
         GIJmAqaYaAXyxWLdjtMt1QvYzrAsS6kL6p2whikrYfZDECHhyRRyF+9vxHJoEf/IMWzp
         GEtw==
X-Forwarded-Encrypted: i=1; AJvYcCUazLwslY24KyARe7GtjzH6Dle4sZRM8oRZRpjZN/CI+tk64OUx0i46YRyIuOInNPyHUqVRK7VPAGk=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yy54RAK252eO5Z3Df33/WSwJqqJNAAD6hwP5QWPYl6A/78Jz1ls
	z2gVCr6GpXSVzx/JXUoHNQmgKL3NN0evGXOYZseg8tEmsi6bkBI49GI7hId8dxI=
X-Gm-Gg: ASbGncuBEjJbqNA3JImevF+zWfPEqBo313kInn6GEf9JQ0/03TYzHozA4wwjk4P7g6T
	a8S3qlZieXvFsePDPO62RO3/o9chYD0MWUT3LdmKZDDLwftfVBGsoEl84Gt3/fUogXjJeB948DK
	fixF5t6ZiqNIOM3cJ+N4Ei0ymGbyi9uO/tczBK0ZIjM0GSu/eFvDPfKeNjW0lrRASJu3kj7/aN2
	rEGz6APzXNYikvHear3XklLBRm9AFDtb+ONp3KI5B1MAdEi5Bu8tekuapAXKfcs9H5eB4zcRvpL
	6YgXEfxa/gjkHyjcoofwVV3UVSkbwMHTCXY6t0xwu4OKgOnMvQ==
X-Google-Smtp-Source: AGHT+IE3LssJUi3eBMUbpDVwoxineXRzMe85h4Sq7JEjQg4BCU6PkDneddy/aEufk2AljjTXgGD1mw==
X-Received: by 2002:a05:6402:84c:b0:5e7:b02b:381f with SMTP id 4fb4d7f45d1cf-5ebcd51c877mr3495417a12.30.1742571769955;
        Fri, 21 Mar 2025 08:42:49 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 21 Mar 2025 15:42:48 +0000
Message-Id: <D8M24Z6JQHJ1.3R31PJELOWSG6@cloud.com>
Cc: "Andrew Cooper" <andrew.cooper3@citrix.com>,
 =?utf-8?q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, "Stefano
 Stabellini" <sstabellini@kernel.org>, "Jan Beulich" <jbeulich@suse.com>
Subject: Re: [PATCH v2] x86: make Viridian support optional
From: "Alejandro Vallejo" <alejandro.vallejo@cloud.com>
To: "Sergiy Kibrik" <Sergiy_Kibrik@epam.com>,
 <xen-devel@lists.xenproject.org>
X-Mailer: aerc 0.18.2
References: <20250321092633.3982645-1-Sergiy_Kibrik@epam.com>
In-Reply-To: <20250321092633.3982645-1-Sergiy_Kibrik@epam.com>

On Fri Mar 21, 2025 at 9:26 AM GMT, Sergiy Kibrik wrote:
> Add config option HVM_VIRIDIAN that covers viridian code within HVM.
> Calls to viridian functions guarded by is_viridian_domain() and related m=
acros.
> Having this option may be beneficial by reducing code footprint for syste=
ms
> that are not using Hyper-V.
>
> Signed-off-by: Sergiy Kibrik <Sergiy_Kibrik@epam.com>
> CC: Alejandro Vallejo <alejandro.vallejo@cloud.com>
> CC: Jan Beulich <jbeulich@suse.com>
> ---
> changes in v2:
>  - changed title in Kconfig & add help text
>  - moved Kconfig changes to arch/x86/hvm/Kconfig
>  - address review comments
> ---
>  xen/arch/x86/hvm/Kconfig              | 10 ++++++++++
>  xen/arch/x86/hvm/Makefile             |  2 +-
>  xen/arch/x86/hvm/hvm.c                | 27 ++++++++++++++++++---------
>  xen/arch/x86/hvm/vlapic.c             | 11 +++++++----
>  xen/arch/x86/include/asm/hvm/domain.h |  2 ++
>  xen/arch/x86/include/asm/hvm/hvm.h    |  3 ++-
>  xen/arch/x86/include/asm/hvm/vcpu.h   |  2 ++
>  7 files changed, 42 insertions(+), 15 deletions(-)

LGTM

  Reviewed-by: Alejandro Vallejo <alejandro.vallejo@cloud.com>

Cheers,
Alejandro

