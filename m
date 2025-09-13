Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9615BB563C0
	for <lists+xen-devel@lfdr.de>; Sun, 14 Sep 2025 01:25:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1123584.1466493 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uxZcP-0003XJ-Tk; Sat, 13 Sep 2025 23:25:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1123584.1466493; Sat, 13 Sep 2025 23:25:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uxZcP-0003VC-R4; Sat, 13 Sep 2025 23:25:21 +0000
Received: by outflank-mailman (input) for mailman id 1123584;
 Sat, 13 Sep 2025 23:25:20 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=vBAy=3Y=tklengyel.com=tamas@srs-se1.protection.inumbo.net>)
 id 1uxZcO-0003V6-Jx
 for xen-devel@lists.xenproject.org; Sat, 13 Sep 2025 23:25:20 +0000
Received: from sender4-op-o12.zoho.com (sender4-op-o12.zoho.com
 [136.143.188.12]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e5df4d67-90f8-11f0-9809-7dc792cee155;
 Sun, 14 Sep 2025 01:25:14 +0200 (CEST)
Received: by mx.zohomail.com with SMTPS id 1757805908972887.190284944816;
 Sat, 13 Sep 2025 16:25:08 -0700 (PDT)
Received: by mail-oa1-f54.google.com with SMTP id
 586e51a60fabf-30ccec59b4bso2285899fac.3
 for <xen-devel@lists.xenproject.org>; Sat, 13 Sep 2025 16:25:08 -0700 (PDT)
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
X-Inumbo-ID: e5df4d67-90f8-11f0-9809-7dc792cee155
ARC-Seal: i=1; a=rsa-sha256; t=1757805910; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=hD7aZLewRtGUr7hw6BjMEbX7QvOv6lryfzh6H1VScXizVmeaeEo2jdyqRKhMWAFB4PbXhozbJGZTRPPY5inAYntopEPRmSu7vRF/xYyGlMJlbTkcvboSGt5WMvxZ0V7rJkZlMIlqJ4DMVVdt/lMk7NxyD7l0sdhEPi6O09VuzN8=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1757805910; h=Content-Type:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=a/5O9EeoJbUrG3OVl131zn0jgiKjRVk3yZV5Cm7hIHE=; 
	b=FJEaJLafkoX4/tBw7fHP2iiWa8V8T0Zl8XGI8C0IBKz7lSSy7aJrd14GujetA+MLI5RkgYGe4yYtUuG5Hlbp5uSJ4/JZ2G3D7QBDVrSSzCoxk3Xn73k/ngpkjkDQUqGbM1z8omPRtXOP+1gGTqYyw02F+dLSTjKweTzOobnlkY8=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=tklengyel.com;
	spf=pass  smtp.mailfrom=tamas@tklengyel.com;
	dmarc=pass header.from=<tamas@tklengyel.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1757805910;
	s=zmail; d=tklengyel.com; i=tamas@tklengyel.com;
	h=MIME-Version:References:In-Reply-To:From:From:Date:Date:Message-ID:Subject:Subject:To:To:Cc:Cc:Content-Type:Message-Id:Reply-To;
	bh=a/5O9EeoJbUrG3OVl131zn0jgiKjRVk3yZV5Cm7hIHE=;
	b=kW5KX0x4aqE//kSw6tVZb3M/Tjr+SyG43kwc5ljcPiL6yolusIgzvRvJBeTBiVgh
	oEgcCuaU3cIJFMg1R+YFhl6x5AIu1j1KhPi4HMlTt5lxulVT2W8iisFr5eNU6z8K6NT
	m9xXFqMnFS8LMP92Qc3Xit6AoO28NP+xpo1TauPk=
X-Forwarded-Encrypted: i=1; AJvYcCXwk9U4woRW0/VhXVhAhpsVHJcFC26Q5vKs9nHhF3F181hrnPFy9wxfnKOdq2pHbJ+FuDHC5hLOHkU=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwZX97oz8czJNFcSpgzWn7uw+DgtNkWAI0tzz3B6uR0zA1TNJfF
	8Ux5LFeptXUdLSkkP3Wxc51muNiszXTt0ZmImsximloFPLr+O2bAO0Ve/W2V0i+mN3CMW8/sDau
	+/vl5IERUorir4/XF7wovbyT5ePHfick=
X-Google-Smtp-Source: AGHT+IHRn2u/fq9/Nn9tOEKtqarER85JsqKdfxExxlljbG7ZWgd2ih0ogxjJ/j0D1pBmpMlLC8krebfp4iTxRfKte/0=
X-Received: by 2002:a05:6870:f621:b0:30c:92a1:64e6 with SMTP id
 586e51a60fabf-32e566ca4f3mr3325385fac.42.1757805908248; Sat, 13 Sep 2025
 16:25:08 -0700 (PDT)
MIME-Version: 1.0
References: <20250912045254.3731398-1-Penny.Zheng@amd.com> <e29930b6-2f13-483b-a8ce-62a93550199d@suse.com>
In-Reply-To: <e29930b6-2f13-483b-a8ce-62a93550199d@suse.com>
From: Tamas K Lengyel <tamas@tklengyel.com>
Date: Sat, 13 Sep 2025 19:24:32 -0400
X-Gmail-Original-Message-ID: <CABfawhmB_WxfR0aL3F6kgo-jgVBJh8M6PLRZikboZPkPTF+hPA@mail.gmail.com>
X-Gm-Features: AS18NWAyf3GqyMFt6N-mqYMuzg6ud-cCCKqZMLzGdnrh3rNSL2n8O3cUx5Ea97Y
Message-ID: <CABfawhmB_WxfR0aL3F6kgo-jgVBJh8M6PLRZikboZPkPTF+hPA@mail.gmail.com>
Subject: Re: [PATCH] xen/vm_event: introduce vm_event_is_enabled()
To: Jan Beulich <jbeulich@suse.com>
Cc: Penny Zheng <Penny.Zheng@amd.com>, ray.huang@amd.com, 
	Andrew Cooper <andrew.cooper3@citrix.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
	Alexandru Isaila <aisaila@bitdefender.com>, Petre Pircalabu <ppircalabu@bitdefender.com>, 
	xen-devel@lists.xenproject.org, Oleksii Kurochko <oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset="UTF-8"

> > +static inline bool vm_event_is_enabled(struct vcpu *v)
> > +{
> > +#ifdef CONFIG_VM_EVENT
> > +    return v->arch.vm_event != NULL;
>
> Is "enabled" (in the function name) a good description of this condition, Tamas?

Sure, sounds fine to me.

Tamas

