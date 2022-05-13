Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 77287526BEB
	for <lists+xen-devel@lfdr.de>; Fri, 13 May 2022 22:53:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.328768.551890 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1npcGp-0002gC-TX; Fri, 13 May 2022 20:52:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 328768.551890; Fri, 13 May 2022 20:52:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1npcGp-0002eJ-Pf; Fri, 13 May 2022 20:52:19 +0000
Received: by outflank-mailman (input) for mailman id 328768;
 Fri, 13 May 2022 20:52:18 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=xcQv=VV=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1npcGo-0002eD-KQ
 for xen-devel@lists.xenproject.org; Fri, 13 May 2022 20:52:18 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 91a5242e-d2fe-11ec-b8b8-f95467ff1ed0;
 Fri, 13 May 2022 22:52:15 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 5A8A862295;
 Fri, 13 May 2022 20:52:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4E3E5C34100;
 Fri, 13 May 2022 20:52:13 +0000 (UTC)
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
X-Inumbo-ID: 91a5242e-d2fe-11ec-b8b8-f95467ff1ed0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1652475133;
	bh=zRHAu7LCFRODUtcqX4+HFakRv9d7XZ2sb1MkVOe9szM=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=FSSSve1swaqURhgjCGktQjzyo4oVu/fSGEEvefHowMzoX1Hfxs5lxN3ChTTilj8KF
	 qwYix8kB3XyT+QA8OORQzfFqLx+c2+oXQgzvXNn1QLC94ef6egFREFXPXGoh0hmwmL
	 jF51S84IVUuy7doAfGcQx683jV+/c+gsLpaKPTGAfk5Lj8nRoaokin7k71b/rPuq+E
	 5eoOMeFPB0h11WX4Fj8QIAZ2cgQcZXNv5KpGtrm3JshdIjEdvbdhKQkYXJPrLaa5jJ
	 U3nC9RjBnETlbGh2TyndnD4Kp4u13xZISUPSktO5XwbTWT3TBWjwalhR8i83ck91RB
	 EU91WvvEbwSAg==
Date: Fri, 13 May 2022 13:52:12 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Julien Grall <julien@xen.org>
cc: Stefano Stabellini <sstabellini@kernel.org>, 
    Bertrand Marquis <Bertrand.Marquis@arm.com>, 
    Rahul Singh <Rahul.Singh@arm.com>, 
    xen-devel <xen-devel@lists.xenproject.org>, 
    Juergen Gross <jgross@suse.com>, 
    "Volodymyr_Babchuk@epam.com" <Volodymyr_Babchuk@epam.com>, 
    Luca Miccio <lucmiccio@gmail.com>, 
    Stefano Stabellini <stefano.stabellini@xilinx.com>, 
    "jbeulich@suse.com" <jbeulich@suse.com>
Subject: Re: [PATCH v6 4/7] xen/arm: configure dom0less domain for enabling
 xenstore after boot
In-Reply-To: <7f89af03-66d2-9c59-a761-4c8a188570d9@xen.org>
Message-ID: <alpine.DEB.2.22.394.2205131349120.3842@ubuntu-linux-20-04-desktop>
References: <alpine.DEB.2.22.394.2205041715320.43560@ubuntu-linux-20-04-desktop> <20220505001656.395419-4-sstabellini@kernel.org> <8011EAE7-7DF6-4342-B0BF-F64190099BA0@arm.com> <eab9afec-b023-ef7a-dc09-1b579c7f36b4@xen.org> <37C437B0-BF87-41C0-8FF1-0BF193C667C4@arm.com>
 <0f39d464-5a2c-a8f6-04c8-f96da7340003@xen.org> <4BEDB555-12F4-4A91-8D16-D83DBB1BE3CC@arm.com> <34b790af-c56a-26c7-e218-7961023b8605@xen.org> <alpine.DEB.2.22.394.2205121823320.3842@ubuntu-linux-20-04-desktop> <7f89af03-66d2-9c59-a761-4c8a188570d9@xen.org>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Fri, 13 May 2022, Julien Grall wrote:
> On 13/05/2022 02:23, Stefano Stabellini wrote:
> > On Wed, 11 May 2022, Julien Grall wrote:
> > > > If dom0 is mandatory yes, we should still make sure that this code
> > > > cannot be
> > > > reached so an ASSERT would be nice here at least in case someone tries
> > > > to
> > > > activate this code without dom0 (which might happen when we will push
> > > > the
> > > > serie for static event channels).
> > > 
> > > I am fine with an ASSERT().
> > 
> > I added an ASSERT(hardware_domain).
> 
> Just to clarify and avoid a round trip. The ASSERT() is not sufficient here.
> We also need to forbid the user to set xen,enhanced when the HW domain is not
> NULL, at least until Rahul's pre-allocated event channel series.
> 
> This check would have to be done when parsing the configuration. The ASSERT()
> would be here to ensure that if someone is reworking the parsing, it would get
> caught nicely rather than a NULL dereference.

Thanks for avoiding a roundtrip. I added a check when parsing device
tree if xen,enhanced is specified but dom0 is missing. Initially I wrote
it as a "panic" but then I changed it as a regular printk. I am OK
either way in case you prefer otherwise.

