Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B0A74905092
	for <lists+xen-devel@lfdr.de>; Wed, 12 Jun 2024 12:42:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.739166.1146127 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sHLQF-00050Q-BA; Wed, 12 Jun 2024 10:41:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 739166.1146127; Wed, 12 Jun 2024 10:41:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sHLQF-0004yv-7c; Wed, 12 Jun 2024 10:41:43 +0000
Received: by outflank-mailman (input) for mailman id 739166;
 Wed, 12 Jun 2024 10:41:41 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=kV4F=NO=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1sHLQD-0004yn-T7
 for xen-devel@lists.xenproject.org; Wed, 12 Jun 2024 10:41:41 +0000
Received: from mail-qv1-xf35.google.com (mail-qv1-xf35.google.com
 [2607:f8b0:4864:20::f35])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 597832fc-28a8-11ef-b4bb-af5377834399;
 Wed, 12 Jun 2024 12:41:39 +0200 (CEST)
Received: by mail-qv1-xf35.google.com with SMTP id
 6a1803df08f44-6b064c4857dso22538616d6.2
 for <xen-devel@lists.xenproject.org>; Wed, 12 Jun 2024 03:41:39 -0700 (PDT)
Received: from localhost ([213.195.124.163]) by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-6b0869d137csm22361186d6.64.2024.06.12.03.41.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 12 Jun 2024 03:41:38 -0700 (PDT)
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
X-Inumbo-ID: 597832fc-28a8-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1718188899; x=1718793699; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=sxBUTZtUrBR9oLNSLJrCyYDuywgJfnwRaLYKvWAuEUA=;
        b=W+wk6baIIVT5ckkxoMuu1EOvWtVfjJe3LsMAL/nncasZ6WifLWiXSR2z4+lntkwPrI
         L+HZbsL9TycmEjamhNWA9v7KdX5do7xrEoI52Wt3C6YB2ayjTYlobNBkW4omSjgdyb4+
         yjdjF/Zy4VD8wkpNkE7hIISLSoUJHEqfZRm4s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718188899; x=1718793699;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=sxBUTZtUrBR9oLNSLJrCyYDuywgJfnwRaLYKvWAuEUA=;
        b=k7Ryy7tQSWAdoWuiiCuKxbXRMDvI+1S1cGexZFoF0GbstbqNkK8wGkMcFSbwV1mn3T
         OAPGAbBPNJ0Rt3shao7Lf8uhEx6KXJy9yWgRma/++QF0z7YwkG98OujPhy3N+26AdqmS
         CtQ8E7STYhU2bi5ZIvcspwY7zUrY3JUNpoUBzP+HUDkZmSaCgtDu5TL7ntDFK2XNAY9S
         Y+QJ/aRf//FFzM2k5pQ7OrnRU6/iMF9carZwP8Yz/dLhvQd19CTphnYb64+MJaRzP7a+
         WSz0cb8p/zKh+uXB2c5UTAOfkoCn/5chvrmkhPI/hWOto13pXfeooiMrhn8m0aB1SRGO
         KPfg==
X-Forwarded-Encrypted: i=1; AJvYcCXaBAwEqfPUnaLJgjzC0PpaqtD/P2Mf3y6BZfwUfuEq/MKQadBeSCHztvGZCqqkvvB2O9DGmxrVErNN/mW6OLVANjzEBLVyPTUPMwLmC+c=
X-Gm-Message-State: AOJu0YygYhL3hEKyZbjfXw6wJ4nceXYzokhqcft5mtjlepMGvXMn5Cd7
	zeLpxSokkgHI+OwiaimLybBfpHlutr2EjQCciXyTTKIfmMhdrh9SJt5nuWW+XdMVvHPBeZJYd0a
	Z
X-Google-Smtp-Source: AGHT+IFH+t+/Ba3CG1G2Do5S9eB+BcBKKgtyDOH6DpWOJq6+Js8xCX7B/WFzB3D7f5R2edoJtATA2Q==
X-Received: by 2002:a05:6214:5990:b0:6b0:7db4:42b9 with SMTP id 6a1803df08f44-6b1a7ad485amr11868286d6.65.1718188898788;
        Wed, 12 Jun 2024 03:41:38 -0700 (PDT)
Date: Wed, 12 Jun 2024 12:41:36 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH v2 5/7] x86/irq: deal with old_cpu_mask for interrupts in
 movement in fixup_irqs()
Message-ID: <Zml7YIzY86E248mt@macbook>
References: <20240610142043.11924-1-roger.pau@citrix.com>
 <20240610142043.11924-6-roger.pau@citrix.com>
 <66fc06cc-f1f6-4f12-83d4-a3b9788bffba@suse.com>
 <Zmlgp9C2ryFtT65B@macbook>
 <ddef2b3d-9766-4697-ac15-4105a0592090@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ddef2b3d-9766-4697-ac15-4105a0592090@suse.com>

On Wed, Jun 12, 2024 at 11:04:26AM +0200, Jan Beulich wrote:
> On 12.06.2024 10:47, Roger Pau Monné wrote:
> > On Tue, Jun 11, 2024 at 02:45:09PM +0200, Jan Beulich wrote:
> >> On 10.06.2024 16:20, Roger Pau Monne wrote:
> >>> Given the current logic it's possible for ->arch.old_cpu_mask to get out of
> >>> sync: if a CPU set in old_cpu_mask is offlined and then onlined
> >>> again without old_cpu_mask having been updated the data in the mask will no
> >>> longer be accurate, as when brought back online the CPU will no longer have
> >>> old_vector configured to handle the old interrupt source.
> >>>
> >>> If there's an interrupt movement in progress, and the to be offlined CPU (which
> >>> is the call context) is in the old_cpu_mask clear it and update the mask, so it
> >>> doesn't contain stale data.
> >>
> >> This imo is too __cpu_disable()-centric. In the code you cover the
> >> smp_send_stop() case afaict, where it's all _other_ CPUs which are being
> >> offlined. As we're not meaning to bring CPUs online again in that case,
> >> dealing with the situation likely isn't needed. Yet the description should
> >> imo at least make clear that the case was considered.
> > 
> > What about adding the following paragraph:
> 
> Sounds good, just maybe one small adjustment:
> 
> > Note that when the system is going down fixup_irqs() will be called by
> > smp_send_stop() from CPU 0 with a mask with only CPU 0 on it,
> > effectively asking to move all interrupts to the current caller (CPU
> > 0) which is the only CPU online.  In that case we don't care to
> 
> "... the only CPU to remain online."

Right, that's better.

Thanks, Roger.

