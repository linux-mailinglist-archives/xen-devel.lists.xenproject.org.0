Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B9DA71F71A
	for <lists+xen-devel@lfdr.de>; Fri,  2 Jun 2023 02:25:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.542783.847055 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q4saF-0006fP-P6; Fri, 02 Jun 2023 00:23:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 542783.847055; Fri, 02 Jun 2023 00:23:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q4saF-0006cV-M1; Fri, 02 Jun 2023 00:23:59 +0000
Received: by outflank-mailman (input) for mailman id 542783;
 Fri, 02 Jun 2023 00:23:58 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=r9Lj=BW=flex--seanjc.bounces.google.com=3mjZ5ZAYKCRcF1xA6z3BB381.zB9K1A-01I1885FGF.K1ACEB61zG.BE3@srs-se1.protection.inumbo.net>)
 id 1q4saE-0006cP-T1
 for xen-devel@lists.xenproject.org; Fri, 02 Jun 2023 00:23:58 +0000
Received: from mail-pg1-x54a.google.com (mail-pg1-x54a.google.com
 [2607:f8b0:4864:20::54a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c28905d3-00db-11ee-b231-6b7b168915f2;
 Fri, 02 Jun 2023 02:23:56 +0200 (CEST)
Received: by mail-pg1-x54a.google.com with SMTP id
 41be03b00d2f7-53f6e194e7bso1351740a12.1
 for <xen-devel@lists.xenproject.org>; Thu, 01 Jun 2023 17:23:56 -0700 (PDT)
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
X-Inumbo-ID: c28905d3-00db-11ee-b231-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1685665435; x=1688257435;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kfVTz/MFdf1BdTl2DJtaA5MVU5d+x7qUPBQRynuzbEs=;
        b=lsng6iSxrqz9R88Q59ewsOGcDaYkTH4vRqDXC5iFszzkH/L48SReX+ccLn2qqVohKu
         SqRTT3wIMGLiTNYWwIKvQpUQy1rlArmCydKGFHXCUSm4HDybF/yCCEi4ngNdiHPHHIAO
         IvE9MObzfShr0WlQx7CjRaOodhTuihevv7Kvb25V0NnX+aCj6e89Z3iKFeAL+lLhSweK
         djWxmTAZR53Gd6ZwAEJJraDzBmWjEDJjAVLEUoTCsaFeXmgf0aQGIJKaiMkaQzmwqMTm
         MDcuVqxl1ntCRLEQ+YYvdB2O6IC0xaDBz4EXjfHWwXcBoneakB4xjWXpWdEkTnS2DRwX
         Al0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685665435; x=1688257435;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=kfVTz/MFdf1BdTl2DJtaA5MVU5d+x7qUPBQRynuzbEs=;
        b=lBx3JCYvp8KO0YJ/yukRGgwqh/T0bLsKL5hLCBhdo2U84QzqjekKDIECcFsF/8zJ5D
         MIFX3jz+xxgNecia1wjOd1OJ2Yq2ex1pBeuTkGJWewxNZDAqLm+1Fy4NzDZxt6yb0aVp
         ETt61KEXFbH14u96hnQVZCPeYGS8SjN9v4NvcupFF0Rqqgx8M/oSorR0mHc7NJWN4zXq
         oYIrqXYfknlq4JQx/TVhGm1EAx3pAlu2VCHgIccoBOod5uH/1Tb0q2MXqG1UG7ZE6MT9
         rzb8fsSIXlBKs3GzkujidxyW97zV+27h152dQHrkf28oOezPnsEfBqNwnvetTq016caT
         K7Bg==
X-Gm-Message-State: AC+VfDyG7cl8p6UN/D+iZ6OM813pKDca75WcLmF7dxnLe9D/f7kfz6Ko
	sao3pVF8FSE4AFHc5NX5aGRrlOJcB6I=
X-Google-Smtp-Source: ACHHUZ4sKaezOgXXrB+dL2dh8BcQkqJaicrwtBGNqgWl2x1iGIzS7OMmnpETOlVJ/dFfp6qtQmgVV4r4kJ8=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a63:fd47:0:b0:53f:5067:64ec with SMTP id
 m7-20020a63fd47000000b0053f506764ecmr2104111pgj.0.1685665434956; Thu, 01 Jun
 2023 17:23:54 -0700 (PDT)
Date: Thu, 1 Jun 2023 17:23:53 -0700
In-Reply-To: <9a4edc66-a0a3-73e4-09c5-db68d4cfbb68@digikod.net>
Mime-Version: 1.0
References: <2f19f26e-20e5-8198-294e-27ea665b706f@redhat.com>
 <4142c8dc-5385-fb1d-4f8b-2a98bb3f99af@digikod.net> <9a4edc66-a0a3-73e4-09c5-db68d4cfbb68@digikod.net>
Message-ID: <ZHk2mVcBycjKCfGw@google.com>
Subject: Re: [ANNOUNCE] KVM Microconference at LPC 2023
From: Sean Christopherson <seanjc@google.com>
To: "=?iso-8859-1?Q?Micka=EBl_Sala=FCn?=" <mic@digikod.net>
Cc: Paolo Bonzini <pbonzini@redhat.com>, James Morris <jamorris@linux.microsoft.com>, 
	Marc Zyngier <maz@kernel.org>, Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, 
	"H . Peter Anvin" <hpa@zytor.com>, Ingo Molnar <mingo@redhat.com>, Kees Cook <keescook@chromium.org>, 
	Thomas Gleixner <tglx@linutronix.de>, Vitaly Kuznetsov <vkuznets@redhat.com>, 
	Wanpeng Li <wanpengli@tencent.com>, Alexander Graf <graf@amazon.com>, 
	Forrest Yuan Yu <yuanyu@google.com>, John Andersen <john.s.andersen@intel.com>, 
	Liran Alon <liran.alon@oracle.com>, 
	"Madhavan T . Venkataraman" <madvenka@linux.microsoft.com>, Marian Rotariu <marian.c.rotariu@gmail.com>, 
	"Mihai =?utf-8?B?RG9uyJt1?=" <mdontu@bitdefender.com>, 
	"=?utf-8?B?TmljdciZb3IgQ8OuyJt1?=" <nicu.citu@icloud.com>, Rick Edgecombe <rick.p.edgecombe@intel.com>, 
	Thara Gopinath <tgopinath@microsoft.com>, Will Deacon <will@kernel.org>, 
	Zahra Tarkhani <ztarkhani@microsoft.com>, 
	"=?utf-8?Q?=C8=98tefan_=C8=98icleru?=" <ssicleru@bitdefender.com>, dev@lists.cloudhypervisor.org, 
	kvm@vger.kernel.org, linux-hardening@vger.kernel.org, 
	linux-hyperv@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-security-module@vger.kernel.org, qemu-devel@nongnu.org, 
	virtualization@lists.linux-foundation.org, x86@kernel.org, 
	xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 01, 2023, Micka=EF=BF=BDl Sala=EF=BF=BDn wrote:
> Hi,
>=20
> What is the status of this microconference proposal? We'd be happy to tal=
k
> about Heki [1] and potentially other hypervisor supports.

Proposal submitted (deadline is/was today), now we wait :-)  IIUC, we shoul=
d find
out rather quickly whether or not the KVM MC is a go.

