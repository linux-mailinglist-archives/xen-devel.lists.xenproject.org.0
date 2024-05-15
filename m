Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B2298C6D4A
	for <lists+xen-devel@lfdr.de>; Wed, 15 May 2024 22:33:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.722610.1126736 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s7LId-0004zP-Ow; Wed, 15 May 2024 20:32:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 722610.1126736; Wed, 15 May 2024 20:32:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s7LId-0004wm-Lu; Wed, 15 May 2024 20:32:31 +0000
Received: by outflank-mailman (input) for mailman id 722610;
 Wed, 15 May 2024 20:32:30 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ex/G=MS=flex--seanjc.bounces.google.com=32RtFZgYKCV4OA6JF8CKKCHA.8KITAJ-9ARAHHEOPO.TAJLNKFA8P.KNC@srs-se1.protection.inumbo.net>)
 id 1s7LIc-0004wg-0a
 for xen-devel@lists.xenproject.org; Wed, 15 May 2024 20:32:30 +0000
Received: from mail-pf1-x449.google.com (mail-pf1-x449.google.com
 [2607:f8b0:4864:20::449])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3e67b601-12fa-11ef-b4bb-af5377834399;
 Wed, 15 May 2024 22:32:27 +0200 (CEST)
Received: by mail-pf1-x449.google.com with SMTP id
 d2e1a72fcca58-6f441afba80so8253764b3a.3
 for <xen-devel@lists.xenproject.org>; Wed, 15 May 2024 13:32:27 -0700 (PDT)
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
X-Inumbo-ID: 3e67b601-12fa-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1715805146; x=1716409946; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iyv87Dbnyu7gm4af/LI0TOX4gLeF6QvKnfsIZOOyrfc=;
        b=mrcMteNs1xZy+Mfqg7mll9bhPraNijLUC+A5TJ7HzRNIwOwvBWq5NvM9PLDnCYE5Uw
         l+ApH7DYFY3FjcEtBocjQ+RA/qHzQBG0v0gPTre7rLWhUlKaMdAQCvIwtdLOtuRzSr0G
         K4OS1Czmat9IitkR+05XH8PD6lQYBzmUW7ej7iOUG+UyvFyxAmjn0nbpiv99zP0iGY0e
         3fsc48AlQo8eOGoaVkYbUnF/8h8GLj/9NN9Jhn0RlMoOpN4CvB9tpdTvTPdB4oOSDxoS
         XUbHfYj50bd6TNiKgFmQuFZutEF/xTPCwgbGPB9N2jdxdBEYOH7Rx7yotFSSQc2yq5tF
         C5UA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715805146; x=1716409946;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=iyv87Dbnyu7gm4af/LI0TOX4gLeF6QvKnfsIZOOyrfc=;
        b=dbwg79EU+Te9TTlI3hiRA2gnpVrhO3nAAC/XlweMWJtOlE4ZBW2ecZoWZAjH/1iPnV
         P0VZm3Z3HeNZ18eayuw1dN7qnflvGJ1zSQPwWosCxP7TNuaQP/spMUTeQZQNnNVm6j+V
         yvUqFmhB3xT4V0NolzKVuuPF7aZUpfHlpekNHfkxYfManG1xSq09fn2LaF/b066V3YRf
         HbgHzTXcpUkL/hVXdVXgrZhL2m7cEc8UmPdUaep6HXSranTipixYTOf0qB1hgNmXN2Ps
         poShF+MWXgytFwr9itq6F0GpBsTd7GrGn+E08HDSMVWiKILhOyiaevdN8WbXnOEMAxpH
         FYzA==
X-Forwarded-Encrypted: i=1; AJvYcCW6lDIiPhQYMWm5ulzdm4221yPIWP1v9LfVnaNFD3a3UI+e5S/ZZ53P0CIbAWurjAnCNgKNgTVaDgly//FhnH32AbxkeMQR5T6g5iBwI+Y=
X-Gm-Message-State: AOJu0YxIAEsSlbzEgSZTuWpH11O26VNeu3dfuzcsIaz6jB65Jg5UXoEh
	B8LF+IHlsZPIa+fDrse8dxYgAdMdYNsPpcAEFol0SpzkX00Trh8qqAMW93KFuDOQFQ1KxfLj5MG
	TUQ==
X-Google-Smtp-Source: AGHT+IECDBDOitjYW0H0HtQ+B5fogjE5oB/VbBha173B4uff3BsqArnMeFZozd93oJEEJOGvPRJpNAKBnf4=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a05:6a00:1d26:b0:6ea:baf6:57a3 with SMTP id
 d2e1a72fcca58-6f4e0431a08mr1169393b3a.6.1715805145969; Wed, 15 May 2024
 13:32:25 -0700 (PDT)
Date: Wed, 15 May 2024 13:32:24 -0700
In-Reply-To: <20240514.mai3Ahdoo2qu@digikod.net>
Mime-Version: 1.0
References: <20240503131910.307630-1-mic@digikod.net> <20240503131910.307630-4-mic@digikod.net>
 <ZjTuqV-AxQQRWwUW@google.com> <20240506.ohwe7eewu0oB@digikod.net>
 <ZjmFPZd5q_hEBdBz@google.com> <20240507.ieghomae0UoC@digikod.net>
 <ZjpTxt-Bxia3bRwB@google.com> <D15VQ97L5M8J.1TDNQE6KLW6JO@amazon.com> <20240514.mai3Ahdoo2qu@digikod.net>
Message-ID: <ZkUb2IWj4Z9FziCb@google.com>
Subject: Re: [RFC PATCH v3 3/5] KVM: x86: Add notifications for Heki policy
 configuration and violation
From: Sean Christopherson <seanjc@google.com>
To: "=?utf-8?Q?Micka=C3=ABl_Sala=C3=BCn?=" <mic@digikod.net>
Cc: Nicolas Saenz Julienne <nsaenz@amazon.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, "H . Peter Anvin" <hpa@zytor.com>, 
	Ingo Molnar <mingo@redhat.com>, Kees Cook <keescook@chromium.org>, 
	Paolo Bonzini <pbonzini@redhat.com>, Thomas Gleixner <tglx@linutronix.de>, 
	Vitaly Kuznetsov <vkuznets@redhat.com>, Wanpeng Li <wanpengli@tencent.com>, 
	Rick P Edgecombe <rick.p.edgecombe@intel.com>, Alexander Graf <graf@amazon.com>, 
	Angelina Vu <angelinavu@linux.microsoft.com>, 
	Anna Trikalinou <atrikalinou@microsoft.com>, Chao Peng <chao.p.peng@linux.intel.com>, 
	Forrest Yuan Yu <yuanyu@google.com>, James Gowans <jgowans@amazon.com>, 
	James Morris <jamorris@linux.microsoft.com>, John Andersen <john.s.andersen@intel.com>, 
	"Madhavan T . Venkataraman" <madvenka@linux.microsoft.com>, Marian Rotariu <marian.c.rotariu@gmail.com>, 
	"Mihai =?utf-8?B?RG9uyJt1?=" <mdontu@bitdefender.com>, 
	"=?utf-8?B?TmljdciZb3IgQ8OuyJt1?=" <nicu.citu@icloud.com>, Thara Gopinath <tgopinath@microsoft.com>, 
	Trilok Soni <quic_tsoni@quicinc.com>, Wei Liu <wei.liu@kernel.org>, 
	Will Deacon <will@kernel.org>, Yu Zhang <yu.c.zhang@linux.intel.com>, 
	"=?utf-8?Q?=C8=98tefan_=C8=98icleru?=" <ssicleru@bitdefender.com>, dev@lists.cloudhypervisor.org, 
	kvm@vger.kernel.org, linux-hardening@vger.kernel.org, 
	linux-hyperv@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-security-module@vger.kernel.org, qemu-devel@nongnu.org, 
	virtualization@lists.linux-foundation.org, x86@kernel.org, 
	xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Tue, May 14, 2024, Micka=C3=ABl Sala=C3=BCn wrote:
> On Fri, May 10, 2024 at 10:07:00AM +0000, Nicolas Saenz Julienne wrote:
> > Development happens
> > https://github.com/vianpl/{linux,qemu,kvm-unit-tests} and the vsm-next
> > branch, but I'd advice against looking into it until we add some order
> > to the rework. Regardless, feel free to get in touch.
>=20
> Thanks for the update.
>=20
> Could we schedule a PUCK meeting to synchronize and help each other?
> What about June 12?

June 12th works on my end.

