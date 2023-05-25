Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AD52A711070
	for <lists+xen-devel@lfdr.de>; Thu, 25 May 2023 18:07:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.539761.840946 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q2DUY-0000AW-ME; Thu, 25 May 2023 16:07:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 539761.840946; Thu, 25 May 2023 16:07:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q2DUY-00007U-J4; Thu, 25 May 2023 16:07:06 +0000
Received: by outflank-mailman (input) for mailman id 539761;
 Thu, 25 May 2023 16:07:05 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=trtu=BO=flex--seanjc.bounces.google.com=3pYdvZAYKCZwOA6JF8CKKCHA.8KITAJ-9ARAHHEOPO.TAJLNKFA8P.KNC@srs-se1.protection.inumbo.net>)
 id 1q2DUX-00007M-Fg
 for xen-devel@lists.xenproject.org; Thu, 25 May 2023 16:07:05 +0000
Received: from mail-yb1-xb49.google.com (mail-yb1-xb49.google.com
 [2607:f8b0:4864:20::b49])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2fac2890-fb16-11ed-8611-37d641c3527e;
 Thu, 25 May 2023 18:07:03 +0200 (CEST)
Received: by mail-yb1-xb49.google.com with SMTP id
 3f1490d57ef6-ba8cf175f5bso1669442276.0
 for <xen-devel@lists.xenproject.org>; Thu, 25 May 2023 09:07:03 -0700 (PDT)
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
X-Inumbo-ID: 2fac2890-fb16-11ed-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1685030822; x=1687622822;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=T8fhdJsa5NorDsEqTWIJQ5b4Ve27T8A/3D8mN23h+AM=;
        b=FEqq2WYT2bpFD+1TtSHkaFzNdRiEuyI2g6NACjIvhMwGd2nTXz/TFAkSgH9Ujas6q/
         vhfG2wZKYTJDUOpnLW2+ofbeXlQQzMc4kCX+fmSU72PlK4P1Bu6ChRJwig3K6o+kmK9V
         pCl4CF26O5Po2Isyv/JlTTvFCsfs3ZUrFwA7UHCTWbISgu9JRVShkNuOUaec2GLwo+qR
         9KOOx1CsOYaN5w2VTeTg1ACrMvUsp1nWuR5WaKwUiyP0rqYNcgG1cqc/7vdfOhawEkwt
         dDqOiNZlzeyBYZO39XTCtpGesfMZs3DSR4tffu8EiIq8HLxLRNoWCQV/DwcUzn5RT3NK
         ujWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685030822; x=1687622822;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=T8fhdJsa5NorDsEqTWIJQ5b4Ve27T8A/3D8mN23h+AM=;
        b=dzkee4sy1mcaRFeaLRw2hoC1W+iTFKBHxZI1k98RqtuMKfLxpg8oDY0daoKNo2Yhfi
         nZnrDoppSQtpV9YuJQSOUmOoeeLlSyRG3AUZO/YFy8NQAtHdbDWs47pRI6IYe7pjEK9H
         2Fdw109F/pHlTehPozVMBJeJ3zXtoJ6f3XZIXRFtqRYPter5xp6V2LBFwtllYxFBZgGa
         Zit8ehGnjzJe8cafC9KUgv2iItXhkxZL2O5369/ZGUY4pQCDmeUExD2+16XLWb4nNsg/
         nJaBVOwlyb7P9/IpHbW1hdhDDEMj8eo4M9tO06xmWzK+3MKbMVfk/4wCG/IbkdP/4gXj
         ooZQ==
X-Gm-Message-State: AC+VfDwc4ICx357/lauaOjBHiJVMOlym1Fx7tmMtfYkiRRCnkfX51N9k
	HPK7k+AThvRMTGtT4kxV1omVnaJdQBU=
X-Google-Smtp-Source: ACHHUZ6yBYNFZuYhfNGO52o3ys/I0sQ5pEx4h3FPL/IsVNBvdz1hiS3BsLpfaNj0iWMqAGXV//6VIasdS2w=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a25:6584:0:b0:ba8:381b:f764 with SMTP id
 z126-20020a256584000000b00ba8381bf764mr2233557ybb.3.1685030821985; Thu, 25
 May 2023 09:07:01 -0700 (PDT)
Date: Thu, 25 May 2023 09:07:00 -0700
In-Reply-To: <7cb6c4c28c077bb9f866c2d795e918610e77d49f.camel@intel.com>
Mime-Version: 1.0
References: <20230505152046.6575-1-mic@digikod.net> <93726a7b9498ec66db21c5792079996d5fed5453.camel@intel.com>
 <facfd178-3157-80b4-243b-a5c8dabadbfb@digikod.net> <7cb6c4c28c077bb9f866c2d795e918610e77d49f.camel@intel.com>
Message-ID: <ZG+HpFjIuSWvyo+B@google.com>
Subject: Re: [RFC PATCH v1 0/9] Hypervisor-Enforced Kernel Integrity
From: Sean Christopherson <seanjc@google.com>
To: Rick P Edgecombe <rick.p.edgecombe@intel.com>
Cc: "mic@digikod.net" <mic@digikod.net>, 
	"dave.hansen@linux.intel.com" <dave.hansen@linux.intel.com>, "bp@alien8.de" <bp@alien8.de>, 
	"keescook@chromium.org" <keescook@chromium.org>, "hpa@zytor.com" <hpa@zytor.com>, 
	"mingo@redhat.com" <mingo@redhat.com>, "tglx@linutronix.de" <tglx@linutronix.de>, 
	"pbonzini@redhat.com" <pbonzini@redhat.com>, "wanpengli@tencent.com" <wanpengli@tencent.com>, 
	"vkuznets@redhat.com" <vkuznets@redhat.com>, "kvm@vger.kernel.org" <kvm@vger.kernel.org>, 
	"qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, "liran.alon@oracle.com" <liran.alon@oracle.com>, 
	"marian.c.rotariu@gmail.com" <marian.c.rotariu@gmail.com>, Alexander Graf <graf@amazon.com>, 
	John S Andersen <john.s.andersen@intel.com>, 
	"madvenka@linux.microsoft.com" <madvenka@linux.microsoft.com>, 
	"ssicleru@bitdefender.com" <ssicleru@bitdefender.com>, "yuanyu@google.com" <yuanyu@google.com>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"tgopinath@microsoft.com" <tgopinath@microsoft.com>, 
	"jamorris@linux.microsoft.com" <jamorris@linux.microsoft.com>, 
	"linux-security-module@vger.kernel.org" <linux-security-module@vger.kernel.org>, 
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, "will@kernel.org" <will@kernel.org>, 
	"dev@lists.cloudhypervisor.org" <dev@lists.cloudhypervisor.org>, 
	"mdontu@bitdefender.com" <mdontu@bitdefender.com>, 
	"linux-hardening@vger.kernel.org" <linux-hardening@vger.kernel.org>, 
	"linux-hyperv@vger.kernel.org" <linux-hyperv@vger.kernel.org>, 
	"virtualization@lists.linux-foundation.org" <virtualization@lists.linux-foundation.org>, 
	"nicu.citu@icloud.com" <nicu.citu@icloud.com>, "ztarkhani@microsoft.com" <ztarkhani@microsoft.com>, 
	"x86@kernel.org" <x86@kernel.org>
Content-Type: text/plain; charset="us-ascii"

On Thu, May 25, 2023, Rick P Edgecombe wrote:
> I wonder if it might be a good idea to POC the guest side before
> settling on the KVM interface. Then you can also look at the whole
> thing and judge how much usage it would get for the different options
> of restrictions.

As I said earlier[*], IMO the control plane logic needs to live in host userspace.
I think any attempt to have KVM providen anything but the low level plumbing will
suffer the same fate as CR4 pinning and XO memory.  Iterating on an imperfect
solution to incremently improve security is far, far easier to do in userspace,
and far more likely to get merged.

[*] https://lore.kernel.org/all/ZFUyhPuhtMbYdJ76@google.com

