Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A242B93ACF4
	for <lists+xen-devel@lfdr.de>; Wed, 24 Jul 2024 09:07:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.763792.1174111 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sWW53-00016i-I7; Wed, 24 Jul 2024 07:06:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 763792.1174111; Wed, 24 Jul 2024 07:06:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sWW53-00014M-FC; Wed, 24 Jul 2024 07:06:33 +0000
Received: by outflank-mailman (input) for mailman id 763792;
 Wed, 24 Jul 2024 07:06:32 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=fJNX=OY=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1sWW52-0000xR-0p
 for xen-devel@lists.xenproject.org; Wed, 24 Jul 2024 07:06:32 +0000
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com
 [2a00:1450:4864:20::135])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4109fcc6-498b-11ef-bbfe-fd08da9f4363;
 Wed, 24 Jul 2024 09:06:31 +0200 (CEST)
Received: by mail-lf1-x135.google.com with SMTP id
 2adb3069b0e04-52f008aa351so4491512e87.0
 for <xen-devel@lists.xenproject.org>; Wed, 24 Jul 2024 00:06:31 -0700 (PDT)
Received: from [192.168.219.191] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-52ef5577d52sm1823355e87.265.2024.07.24.00.06.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Jul 2024 00:06:30 -0700 (PDT)
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
X-Inumbo-ID: 4109fcc6-498b-11ef-bbfe-fd08da9f4363
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1721804791; x=1722409591; darn=lists.xenproject.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2IO0MKH2II0ITzbYnlBtXjPa8IicTPbMr+KdzN69UtU=;
        b=nQVFBPPKKdHqnh/+YGym7qV9xHPsndeYKeb+GkLY4dx0wGL8Y6eWNA+F09Ly4DB8qR
         I6Hqx5grt3aRQH0Dpe33Umrdc+E55dmuz0+/mhLHSELFWIHm0QQNwlJuXeCXqG3AJBHN
         Fh/dqz0b4vDt3OMm2XvMg+7C7wFwTty08XhyX9iMk9CB21D5sMEe8A0Jjp6TTZFsfGC/
         LL/GK0rz9h7x4kpyfqTWpT6eA/4CmKfl91i/5EIUFeHw2wkT2iVksoQkvg8R1RxH0qip
         5KVJsx1/2z4JHmq++Nm4aF9LLNaaLhavVrGcJYsFlVNGK+wnhBhOrsWAJ/rRvRU5VVOG
         LzXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721804791; x=1722409591;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=2IO0MKH2II0ITzbYnlBtXjPa8IicTPbMr+KdzN69UtU=;
        b=p4H0ZOFg9se/Mw5uHV1p94HYH3bj+0nV8PTANVGLcXB9Wi5+Zty7Or20OvNj5LKAEx
         QgeCDyvKEGXtyJUU+Yh/hna8gJ7yCzsdFbMXM7kf8x6ahclfd0VoCghbD7gMLPMi4YBW
         Tr0jCMmdkXqi+izNPmy2y+t+RBPeI1OVQxi3LHOFQUbMW9t+4BaGJwa3Ruv9RzYo4T7z
         6abafNVXPAuk5/J89A2Y5XV8/M9+dD+BEF896wuLzckmhZ4NTXCGYAfxfb5DAhhqxeX0
         rEqG1PzUIOFgErc2MTiQVZz56BbJ4Siei6lOfuxXJHmnxhuTaNflU7pD+RiqWrIMfWO7
         PBhw==
X-Forwarded-Encrypted: i=1; AJvYcCVIECo3mDTjPJchF/By58L7khJYxRqkM6KtDlmxIJT9Px/M5qwgMyh+aBYYl5mX/YrrHZyBGkR72OzA3yROXNgXTe31SEzgDARRxwxNSMI=
X-Gm-Message-State: AOJu0YyFvR8vSJva9EXSpHtAtMdnogrz9tUMe55OOsAsV0crwcojqGlA
	0W/6IoTtd1zNt/RQuFn+7QzMSRpjRekWzCVBnp9RvoAReOitG3y025Yl0c30
X-Google-Smtp-Source: AGHT+IEujQQ6KaRitroyBBKWJ9VnWCVK8UDfK7IVzDlUzR7Mq1V16shu8M1t2bQK28vwEenMruOhBA==
X-Received: by 2002:a05:6512:1089:b0:52e:9ecd:3465 with SMTP id 2adb3069b0e04-52fcda6f4c3mr1172539e87.57.1721804790354;
        Wed, 24 Jul 2024 00:06:30 -0700 (PDT)
Message-ID: <cc8ca0e4f3430f9f3ab91228ad6d332836da1929.camel@gmail.com>
Subject: Re: [PATCH for-4.19] hotplug: Restore block-tap phy compatibility
 (again)
From: oleksii.kurochko@gmail.com
To: Jason Andryuk <jason.andryuk@amd.com>, Andrew Cooper
	 <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
Date: Wed, 24 Jul 2024 09:06:29 +0200
In-Reply-To: <e5ee360d-d945-4807-a6ce-9a7b97b69bea@amd.com>
References: <20240715234631.4468-1-jandryuk@gmail.com>
	 <Zp/GcCUVPX/d/7qx@l14> <ac3d7bcd-6ed8-4ded-bb5d-ab9c228e9579@amd.com>
	 <8a185aeabe4b3928906036590affbec8658bf226.camel@gmail.com>
	 <eb096455-cc60-4c34-b7e4-fb0345086934@citrix.com>
	 <e5ee360d-d945-4807-a6ce-9a7b97b69bea@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.3 (3.52.3-1.fc40app2) 
MIME-Version: 1.0

On Tue, 2024-07-23 at 14:05 -0400, Jason Andryuk wrote:
> On 2024-07-23 13:34, Andrew Cooper wrote:
> > On 23/07/2024 6:31 pm, oleksii.kurochko@gmail.com=C2=A0wrote:
> > > On Tue, 2024-07-23 at 11:04 -0400, Jason Andryuk wrote:
> > > > On 2024-07-23 11:04, Anthony PERARD wrote:
> > > > > On Mon, Jul 15, 2024 at 07:46:31PM -0400, Jason Andryuk
> > > > > wrote:
> > > > > > "$dev" needs to be set correctly for backendtype=3Dphy as
> > > > > > well as
> > > > > > backendtype=3Dtap.=C2=A0 Move the setting into the conditional,=
 so
> > > > > > it
> > > > > > can be
> > > > > > handled properly for each.
> > > > > >=20
> > > > > > (dev could be captured during tap-ctl allocate for blktap
> > > > > > module,
> > > > > > but it
> > > > > > would not be set properly for the find_device case.=C2=A0 The
> > > > > > backendtype=3Dtap
> > > > > > case would need to be handled regardless.)
> > > > > >=20
> > > > > > Fixes: 6fcdc84927 ("hotplug: Restore block-tap phy
> > > > > > compatibility")
> > > > > Do you mean f16ac12bd418 ("hotplug: Restore block-tap phy
> > > > > compatibility") ?
> > > > Yes!=C2=A0 Thanks for checking that - I must have grabbed the hash
> > > > from a
> > > > local branch.
> > > >=20
> > > > > > Fixes: 76a484193d ("hotplug: Update block-tap")
> > > > > >=20
> > > > > > Signed-off-by: Jason Andryuk <jason.andryuk@amd.com>
> > > > > With the fixes tag fix:
> > > > > Reviewed-by: Anthony PERARD <anthony.perard@vates.tech>
> > > > Thanks again.
> > > >=20
> > > > Oleksii, this is a fix (for an incomplete fix) for 4.19.=C2=A0
> > > > 76a484193d
> > > > broke compatibility for block-tap with the blktap2 kernel model
> > > > (when
> > > > adding support for tapback).=C2=A0 This finishes restoring blktap2
> > > > support.
> > > >=20
> > > > I realize it's late in the release if you don't want to take
> > > > it.
> > > It's pretty late but I just wanted to clarify:
> > > 1. Is so critical that we should have this in 4.19?
> > > 2. If we won't take it now, then will it be backported anyway?
> >=20
> > 2) Yes it will get backported.=C2=A0 In fact I'm about to commit it to
> > staging.
> >=20
> > 1) It's a bug in a new feature for 4.19, so if we don't take this
> > bugfix
> > then we'll have to strip it from the release notes.
>=20
> It's a bug in the old feature.=C2=A0 The new feature - tapback daemon=20
> support, backendtype=3Dtap - works with what's in the 4.19 tree.=C2=A0 It=
's
> the=20
> old kernel module support - backendtype=3Dphy,script=3Dblock-tap - that
> was=20
> broken when adding tapback support.=C2=A0 This patch fixes the old
> support.
>=20
> The change is localized in the block-tap script and requires explicit
> configuration (script=3Dblock-tap) to use.=C2=A0 So it seems to me to be =
a=20
> lower risk to take it even though it is late in the cycle.
Agree, if it is by default is disabled then I think we can have this
patch in 4.19:
 Release-Acked-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>

~ Oleksii

