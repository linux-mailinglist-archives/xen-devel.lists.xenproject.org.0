Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D98C6B563C2
	for <lists+xen-devel@lfdr.de>; Sun, 14 Sep 2025 01:32:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1123595.1466502 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uxZjT-0005Fh-Jo; Sat, 13 Sep 2025 23:32:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1123595.1466502; Sat, 13 Sep 2025 23:32:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uxZjT-0005DB-Gx; Sat, 13 Sep 2025 23:32:39 +0000
Received: by outflank-mailman (input) for mailman id 1123595;
 Sat, 13 Sep 2025 23:32:38 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=vBAy=3Y=tklengyel.com=tamas@srs-se1.protection.inumbo.net>)
 id 1uxZjS-0005D3-B1
 for xen-devel@lists.xenproject.org; Sat, 13 Sep 2025 23:32:38 +0000
Received: from sender4-op-o12.zoho.com (sender4-op-o12.zoho.com
 [136.143.188.12]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ed068204-90f9-11f0-9809-7dc792cee155;
 Sun, 14 Sep 2025 01:32:36 +0200 (CEST)
Received: by mx.zohomail.com with SMTPS id 1757806350589923.8464784861359;
 Sat, 13 Sep 2025 16:32:30 -0700 (PDT)
Received: by mail-ot1-f50.google.com with SMTP id
 46e09a7af769-75763558ae1so40992a34.3
 for <xen-devel@lists.xenproject.org>; Sat, 13 Sep 2025 16:32:30 -0700 (PDT)
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
X-Inumbo-ID: ed068204-90f9-11f0-9809-7dc792cee155
ARC-Seal: i=1; a=rsa-sha256; t=1757806353; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=Qz2icy26nm6llYXSsafgH0grImK2yFuKCNY9uvnmXJL3Zj10H30wYXwEnbpRJHV/2zDgC3lVzb2FK1KCzE+N75/aXqaH0aJ8ZON9eNczBlI0z3SFPH1iorQpq4edVzTWaTfCP/o7bAjvz2Wf1eCP3WNepz1ntDKzsaB86D02fMg=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1757806353; h=Content-Type:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=H7Z7rEemNPwWDOk4xlNKyvzqspj59iltoaOmQWtea20=; 
	b=dMfoxIlPxxrIVVNA3bof+lUhv7XSjl54picbkzyByJwpKb/POQ0k6D77Upse0w8vrPrnHx92MF2mEzBVbwdvp8utwsGNIdC3uERYkNi0Yh265mVUIsTJae2VJ9wc2l416iRwtylRcGX2aLYY9W2Rbixxdr8a0Kmv4ZaBynbpvBI=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=tklengyel.com;
	spf=pass  smtp.mailfrom=tamas@tklengyel.com;
	dmarc=pass header.from=<tamas@tklengyel.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1757806353;
	s=zmail; d=tklengyel.com; i=tamas@tklengyel.com;
	h=MIME-Version:References:In-Reply-To:From:From:Date:Date:Message-ID:Subject:Subject:To:To:Cc:Cc:Content-Type:Message-Id:Reply-To;
	bh=H7Z7rEemNPwWDOk4xlNKyvzqspj59iltoaOmQWtea20=;
	b=KKvL4aqxlpBXRgP9NFJUWWvmtIA/zrhIalzqMY87HtOOxxl0tyoLc3K3nToexuTn
	BKlom/hfWHgJrLFrJpU5/jZUV6abS9KXMI5xREjuhZgL31s4GlkPKMvqE/1Qxf7BlYJ
	ovM4+wmqApGianqWyUXZofc7RtpkT03BvkPXYOWU=
X-Forwarded-Encrypted: i=1; AJvYcCUZo1228+UCT/KQVX70KnfMczQDFoCv8/icr78AOrHfCvH7TumSPyF0ds+u+NaH42UWcqCb5wfhvrc=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzhKfEwyNneFxTy31RIEndquEzCH+8uED4LhbL38E3M75fXxSne
	3Toajrw64GhSLs8Eu8yeo2b9aIEOoIKgH1G+tBhOgn6L2G6s0+2os43hINXNqi1L41zdBC75n3K
	+LpZB/qzkHnyLfAUiNMMf8haAd3MLwXQ=
X-Google-Smtp-Source: AGHT+IFHPAqfDMV/ymtAwKnQp7aSUpnqca2vS3dSVIkd1YZZgoqqdnoUZCK1qHQeF1RG5jgAN0GgGhggcd3FkHKFJ0w=
X-Received: by 2002:a05:6870:a911:b0:321:2ad1:941a with SMTP id
 586e51a60fabf-32e56db5a93mr4345013fac.45.1757806349786; Sat, 13 Sep 2025
 16:32:29 -0700 (PDT)
MIME-Version: 1.0
References: <20250910073827.3622177-1-Penny.Zheng@amd.com> <20250910073827.3622177-5-Penny.Zheng@amd.com>
 <b8430631-f857-426a-a144-c6b8fbf94ee9@suse.com>
In-Reply-To: <b8430631-f857-426a-a144-c6b8fbf94ee9@suse.com>
From: Tamas K Lengyel <tamas@tklengyel.com>
Date: Sat, 13 Sep 2025 19:31:53 -0400
X-Gmail-Original-Message-ID: <CABfawhnzoDwo7vbFNN8wAnmEELoQND6snSE8m_VZnS0LWErMGQ@mail.gmail.com>
X-Gm-Features: Ac12FXxraQlC8wGhFxor6fgXwEN5wSiV9aH4hp0P885Ol2IrkFyqHun1vcZDFS4
Message-ID: <CABfawhnzoDwo7vbFNN8wAnmEELoQND6snSE8m_VZnS0LWErMGQ@mail.gmail.com>
Subject: Re: [PATCH v2 04/26] xen: consolidate CONFIG_VM_EVENT
To: Jan Beulich <jbeulich@suse.com>
Cc: Penny Zheng <Penny.Zheng@amd.com>, ray.huang@amd.com, 
	Andrew Cooper <andrew.cooper3@citrix.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
	Alexandru Isaila <aisaila@bitdefender.com>, Petre Pircalabu <ppircalabu@bitdefender.com>, 
	"Daniel P. Smith" <dpsmith@apertussolutions.com>, xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="UTF-8"

> > @@ -99,10 +98,40 @@ long p2m_set_mem_access_multi(struct domain *d,
> >  int p2m_get_mem_access(struct domain *d, gfn_t gfn, xenmem_access_t *access,
> >                         unsigned int altp2m_idx);
> >
> > -#ifdef CONFIG_VM_EVENT
> >  int mem_access_memop(unsigned long cmd,
> >                       XEN_GUEST_HANDLE_PARAM(xen_mem_access_op_t) arg);
> >  #else
> > +static inline bool xenmem_access_to_p2m_access(const struct p2m_domain *p2m,
> > +                                               xenmem_access_t xaccess,
> > +                                               p2m_access_t *paccess)
> > +{
> > +    return false;
> > +}
>
> So this is needed when VM_EVENT=n and ALTP2M=y. Tamas, is this a configuration
> which makes sense?

Yes, altp2m should be functional without vm_event being enabled. There
could very well be in-guest only use of altp2m via #VE. This function
is used in p2m_init_next_altp2m which means it being stubbed out like
this when vm_event is disabled breaks altp2m.

Tamas

