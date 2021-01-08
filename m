Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D4A412EF183
	for <lists+xen-devel@lfdr.de>; Fri,  8 Jan 2021 12:41:06 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.63368.112518 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kxq8N-0003vy-8l; Fri, 08 Jan 2021 11:40:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 63368.112518; Fri, 08 Jan 2021 11:40:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kxq8N-0003vZ-5f; Fri, 08 Jan 2021 11:40:47 +0000
Received: by outflank-mailman (input) for mailman id 63368;
 Fri, 08 Jan 2021 11:40:45 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=w/qK=GL=gmail.com=xadimgnik@srs-us1.protection.inumbo.net>)
 id 1kxq8L-0003vU-7x
 for xen-devel@lists.xenproject.org; Fri, 08 Jan 2021 11:40:45 +0000
Received: from mail-wr1-x431.google.com (unknown [2a00:1450:4864:20::431])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 08cc096b-710d-425d-83ff-abb1abbdc81c;
 Fri, 08 Jan 2021 11:40:44 +0000 (UTC)
Received: by mail-wr1-x431.google.com with SMTP id r7so8688794wrc.5
 for <xen-devel@lists.xenproject.org>; Fri, 08 Jan 2021 03:40:44 -0800 (PST)
Received: from CBGR90WXYV0 (host86-165-42-133.range86-165.btcentralplus.com.
 [86.165.42.133])
 by smtp.gmail.com with ESMTPSA id k10sm12367935wrq.38.2021.01.08.03.40.42
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 08 Jan 2021 03:40:43 -0800 (PST)
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
X-Inumbo-ID: 08cc096b-710d-425d-83ff-abb1abbdc81c
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:reply-to:to:cc:references:in-reply-to:subject:date:message-id
         :mime-version:content-transfer-encoding:content-language
         :thread-index;
        bh=wx4rRMTQv/GFUHNtO2xLlGDua22QKTl/lDSIyor++LA=;
        b=aWlGx2B06yejb4y0oE+weA7cYlEIZyr53gpumDyr2yl839ukNiVbtCSeQHyMey/z1y
         rOkpEkYK8bSXIXr8r4f5ZgX57Xd7mmXaNrEE9P3ydT8jFiqgsnTNtExSZOtuG5M1yL9O
         HSPnO8Fj5SAQKJRzfj9UrY809rL6jod5Bxm34FEOeJNr/V/KIsXiTtG8TouF3Alo6Y1G
         uBhx+lopgWs3tIvs3k9UE86Bu/Vak5l5xQvvfyvt6Yh2JgSsb7+MhzmreBVWBnNkqhGu
         MQsHPfci2YmjwqC/5HjdvFKYvbVrQOUf0jUXEoPfqMBYSvrpGDY5Cg8eZNa6NppnqmFB
         bU6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:reply-to:to:cc:references:in-reply-to
         :subject:date:message-id:mime-version:content-transfer-encoding
         :content-language:thread-index;
        bh=wx4rRMTQv/GFUHNtO2xLlGDua22QKTl/lDSIyor++LA=;
        b=Q04lwVxYrd2lxHZapbYspCaU8g2dXJbZ/fvA/iK7XMn1hue1xao6Dqbz0W/nwARBqr
         bP9ebuUAd4RSOkYbb6R0UXtj6V+VveWDhgdW80TsQrHJfpuRc5kDSt7SIsDGxOhOICIC
         SWhDCUmzFIJluZ/rNjOpHJ72wwc5u5906FzYvKCetU5IIEy5GPwWkD8rv6GnY4xx0Dam
         bXZxljczIAYbeDY2yADP9xHXrbY/Im4ZkV4AD/v+YMKy6IOxVSHZXqlA18Vo9WMRG5fb
         bAdWPdao2YcrwLKUS/r3lhjZ4nTVAxG2P377ErjClTcQxVIVLsCiTohVPVfLG4E1VPay
         vGvw==
X-Gm-Message-State: AOAM530ye44kcCIQIU9QsNxNa7xhaDfq7EE0HAyZ5RdXSgZ+C7G7SqlN
	E6gf6EB3HjTdIJDGR6abPuQ=
X-Google-Smtp-Source: ABdhPJx55vjcOdSo46YBOQ/P4ScnU9jzo71i0UtpVtocs/VMQHcgvb6zNYpqQEM/tMezUuKfs3xcGA==
X-Received: by 2002:adf:80ae:: with SMTP id 43mr3290425wrl.50.1610106043508;
        Fri, 08 Jan 2021 03:40:43 -0800 (PST)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: "Paul Durrant" <paul@xen.org>
Reply-To: <paul@xen.org>
To: "'Igor Druzhinin'" <igor.druzhinin@citrix.com>,
	<xen-devel@lists.xenproject.org>
Cc: <wl@xen.org>,
	<iwj@xenproject.org>,
	<anthony.perard@citrix.com>,
	<andrew.cooper3@citrix.com>,
	<george.dunlap@citrix.com>,
	<jbeulich@suse.com>,
	<julien@xen.org>,
	<sstabellini@kernel.org>,
	<roger.pau@citrix.com>
References: <1610066796-17266-1-git-send-email-igor.druzhinin@citrix.com> <1610066796-17266-2-git-send-email-igor.druzhinin@citrix.com> <00a001d6e599$a07c8380$e1758a80$@xen.org> <c09f1304-c08f-1f18-319d-62aa518a89d1@citrix.com> <00a101d6e5b2$276b2140$764163c0$@xen.org> <e24a438e-3705-d035-2dd6-34fd4f558898@citrix.com>
In-Reply-To: <e24a438e-3705-d035-2dd6-34fd4f558898@citrix.com>
Subject: RE: [PATCH 2/2] viridian: allow vCPU hotplug for Windows VMs
Date: Fri, 8 Jan 2021 11:40:42 -0000
Message-ID: <00a201d6e5b3$18ad0ff0$4a072fd0$@xen.org>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Content-Language: en-gb
Thread-Index: AQIZObzvX1fStk6d0If1Grmzp4ChNQGw5HmOAetIvREB3+9hzAIndkP3AVj957ypUQ1UYA==

> -----Original Message-----
> From: Igor Druzhinin <igor.druzhinin@citrix.com>
> Sent: 08 January 2021 11:36
> To: paul@xen.org; xen-devel@lists.xenproject.org
> Cc: wl@xen.org; iwj@xenproject.org; anthony.perard@citrix.com; =
andrew.cooper3@citrix.com;
> george.dunlap@citrix.com; jbeulich@suse.com; julien@xen.org; =
sstabellini@kernel.org;
> roger.pau@citrix.com
> Subject: Re: [PATCH 2/2] viridian: allow vCPU hotplug for Windows VMs
>=20
> On 08/01/2021 11:33, Paul Durrant wrote:
> >> -----Original Message-----
> >> From: Igor Druzhinin <igor.druzhinin@citrix.com>
> >> Sent: 08 January 2021 11:30
> >> To: paul@xen.org; xen-devel@lists.xenproject.org
> >> Cc: wl@xen.org; iwj@xenproject.org; anthony.perard@citrix.com; =
andrew.cooper3@citrix.com;
> >> george.dunlap@citrix.com; jbeulich@suse.com; julien@xen.org; =
sstabellini@kernel.org;
> >> roger.pau@citrix.com
> >> Subject: Re: [PATCH 2/2] viridian: allow vCPU hotplug for Windows =
VMs
> >>
> >> On 08/01/2021 08:38, Paul Durrant wrote:
> >>>> -----Original Message-----
> >>>> From: Igor Druzhinin <igor.druzhinin@citrix.com>
> >>>> Sent: 08 January 2021 00:47
> >>>> To: xen-devel@lists.xenproject.org
> >>>> Cc: paul@xen.org; wl@xen.org; iwj@xenproject.org; =
anthony.perard@citrix.com;
> >>>> andrew.cooper3@citrix.com; george.dunlap@citrix.com; =
jbeulich@suse.com; julien@xen.org;
> >>>> sstabellini@kernel.org; roger.pau@citrix.com; Igor Druzhinin =
<igor.druzhinin@citrix.com>
> >>>> Subject: [PATCH 2/2] viridian: allow vCPU hotplug for Windows VMs
> >>>>
> >>>> If Viridian extensions are enabled, Windows wouldn't currently =
allow
> >>>> a hotplugged vCPU to be brought up dynamically. We need to expose =
a special
> >>>> bit to let the guest know we allow it. It appears we can just =
start exposing
> >>>> it without worrying too much about compatibility - see relevant =
QEMU
> >>>> discussion here:
> >>>>
> >>>> =
https://patchwork.kernel.org/project/qemu-devel/patch/1455364815-19586-1-=
git-send-email-
> >>>> den@openvz.org/
> >>>
> >>> I don't think that discussion really confirmed it was safe... just =
that empirically it appeared to
> >> be so. I think we should err on
> >>> the side of caution and have this behind a feature flag (but I'm =
happy for it to default to on).
> >>
> >> QEMU was having this code since 2016 and nobody complained is good
> >> enough for me - but if you insist we need an option - ok, I will =
add one.
> >>
> >
> > Given that it has not yet been in a release, perhaps you could just =
guard this and the
> implementation of leaf 0x40000005 using HVMPV_ex_processor_masks?
>=20
> That looks sloppy and confusing to me - let's have a separate option =
instead.
>=20

Yes, for this I guess it is really a separate thing. Using =
HVMPV_ex_processor_masks to control the presence of leaf 0x40000005 =
seems reasonable (since it's all about being able to use >64 vcpus). =
Perhaps a new HVMPV_cpu_hotplug for this one?

  Paul

> Igor


