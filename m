Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 352E02EF151
	for <lists+xen-devel@lfdr.de>; Fri,  8 Jan 2021 12:34:28 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.63357.112494 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kxq1q-0002md-BS; Fri, 08 Jan 2021 11:34:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 63357.112494; Fri, 08 Jan 2021 11:34:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kxq1q-0002mE-7y; Fri, 08 Jan 2021 11:34:02 +0000
Received: by outflank-mailman (input) for mailman id 63357;
 Fri, 08 Jan 2021 11:34:00 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=w/qK=GL=gmail.com=xadimgnik@srs-us1.protection.inumbo.net>)
 id 1kxq1o-0002m9-L5
 for xen-devel@lists.xenproject.org; Fri, 08 Jan 2021 11:34:00 +0000
Received: from mail-wr1-x435.google.com (unknown [2a00:1450:4864:20::435])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 104bf7db-5748-49e8-9b3c-4aeda9ebd49a;
 Fri, 08 Jan 2021 11:33:59 +0000 (UTC)
Received: by mail-wr1-x435.google.com with SMTP id c5so8656720wrp.6
 for <xen-devel@lists.xenproject.org>; Fri, 08 Jan 2021 03:33:59 -0800 (PST)
Received: from CBGR90WXYV0 (host86-165-42-133.range86-165.btcentralplus.com.
 [86.165.42.133])
 by smtp.gmail.com with ESMTPSA id b9sm13731353wmd.32.2021.01.08.03.33.57
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 08 Jan 2021 03:33:58 -0800 (PST)
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
X-Inumbo-ID: 104bf7db-5748-49e8-9b3c-4aeda9ebd49a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:reply-to:to:cc:references:in-reply-to:subject:date:message-id
         :mime-version:content-transfer-encoding:content-language
         :thread-index;
        bh=T5VnWk3JtgIl1kDrDNlFwgNbBbmI3MBD3aA0me1f7G8=;
        b=VxFD9XjT/nFpWlB71pwCYgqYDxRD5mz/rzUANHeYDqTwRSR7AnLmM7lfcJJ/mPTxkP
         NwEEDLoXcOVurr6kvHmDA6Y3UCUc3sJccbNEqayYR/1dGaMrxCqA3rE/bsUjboRatJIk
         8/C5Ri8VZezTOIx3+VJZrpMYEldA2rquE18OrTibEOWGVba21aOVdcfq8vTc9ovB1HVv
         UzAUfHBMQ8O03cATTJH5apMxU/ezraixC3MB3ecG6lklGHioA2JY32ohDCHx2x3xc7SG
         +1JHzCCWRJptLIv0W1Xfi60XsNKxuEwJebLjk2fIj+UohNDrplQoMjj0az1x7AzmMCXS
         XZfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:reply-to:to:cc:references:in-reply-to
         :subject:date:message-id:mime-version:content-transfer-encoding
         :content-language:thread-index;
        bh=T5VnWk3JtgIl1kDrDNlFwgNbBbmI3MBD3aA0me1f7G8=;
        b=jnqSNF5p6wZ0FFtuiVgPg/ow1vUP7/TIqgXVeYTj26SxVFVQ1az7chy09by8ajjgGJ
         E0tIdsqTPDnyHYDfNK2dPm+nYH8L0H/45Xj5q7RjPEQ8/c9RBQttt/PnVeQHfRf3vCd7
         cf2Yb/r0h0SR/21aCeH/s943Hj6R56J+6gIPvEtdBJXClpRTO4xMBXcxqI8v0VZFr5a2
         MQikbpAU1/IxQY4aKRPjilXpkI63HOcog+YRgSgKBwixfxJ+IPZkyzjfUjgeyvuKytiJ
         sqRFuAkqI5miBAQ/3LTZoq274xalqoNYikGj5oSLa/dgUP7ncH4FUjacEJJK4gFv3Yq1
         W02A==
X-Gm-Message-State: AOAM530mbNHvx/MIjbGy1ge2yl3kFGsc/XwGx/eNTCCLoOhjs9drbcd4
	IA/rlc0c/QUgCoBX3LVjvnU=
X-Google-Smtp-Source: ABdhPJwPkGIoDY1b2ylqW8onMzNWaLOJXxgRq5yxxOd+NGY6MAJZGsjubmSC+jcwYcDc13Dyd3sOBw==
X-Received: by 2002:adf:9467:: with SMTP id 94mr3298742wrq.235.1610105638775;
        Fri, 08 Jan 2021 03:33:58 -0800 (PST)
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
References: <1610066796-17266-1-git-send-email-igor.druzhinin@citrix.com> <1610066796-17266-2-git-send-email-igor.druzhinin@citrix.com> <00a001d6e599$a07c8380$e1758a80$@xen.org> <c09f1304-c08f-1f18-319d-62aa518a89d1@citrix.com>
In-Reply-To: <c09f1304-c08f-1f18-319d-62aa518a89d1@citrix.com>
Subject: RE: [PATCH 2/2] viridian: allow vCPU hotplug for Windows VMs
Date: Fri, 8 Jan 2021 11:33:57 -0000
Message-ID: <00a101d6e5b2$276b2140$764163c0$@xen.org>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Content-Language: en-gb
Thread-Index: AQIZObzvX1fStk6d0If1Grmzp4ChNQGw5HmOAetIvREB3+9hzKltDykg

> -----Original Message-----
> From: Igor Druzhinin <igor.druzhinin@citrix.com>
> Sent: 08 January 2021 11:30
> To: paul@xen.org; xen-devel@lists.xenproject.org
> Cc: wl@xen.org; iwj@xenproject.org; anthony.perard@citrix.com; =
andrew.cooper3@citrix.com;
> george.dunlap@citrix.com; jbeulich@suse.com; julien@xen.org; =
sstabellini@kernel.org;
> roger.pau@citrix.com
> Subject: Re: [PATCH 2/2] viridian: allow vCPU hotplug for Windows VMs
>=20
> On 08/01/2021 08:38, Paul Durrant wrote:
> >> -----Original Message-----
> >> From: Igor Druzhinin <igor.druzhinin@citrix.com>
> >> Sent: 08 January 2021 00:47
> >> To: xen-devel@lists.xenproject.org
> >> Cc: paul@xen.org; wl@xen.org; iwj@xenproject.org; =
anthony.perard@citrix.com;
> >> andrew.cooper3@citrix.com; george.dunlap@citrix.com; =
jbeulich@suse.com; julien@xen.org;
> >> sstabellini@kernel.org; roger.pau@citrix.com; Igor Druzhinin =
<igor.druzhinin@citrix.com>
> >> Subject: [PATCH 2/2] viridian: allow vCPU hotplug for Windows VMs
> >>
> >> If Viridian extensions are enabled, Windows wouldn't currently =
allow
> >> a hotplugged vCPU to be brought up dynamically. We need to expose a =
special
> >> bit to let the guest know we allow it. It appears we can just start =
exposing
> >> it without worrying too much about compatibility - see relevant =
QEMU
> >> discussion here:
> >>
> >> =
https://patchwork.kernel.org/project/qemu-devel/patch/1455364815-19586-1-=
git-send-email-
> >> den@openvz.org/
> >
> > I don't think that discussion really confirmed it was safe... just =
that empirically it appeared to
> be so. I think we should err on
> > the side of caution and have this behind a feature flag (but I'm =
happy for it to default to on).
>=20
> QEMU was having this code since 2016 and nobody complained is good
> enough for me - but if you insist we need an option - ok, I will add =
one.
>=20

Given that it has not yet been in a release, perhaps you could just =
guard this and the implementation of leaf 0x40000005 using =
HVMPV_ex_processor_masks?

  Paul

> Igor


