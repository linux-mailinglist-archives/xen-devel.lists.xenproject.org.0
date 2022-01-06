Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9812B48664D
	for <lists+xen-devel@lfdr.de>; Thu,  6 Jan 2022 15:49:12 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.254084.435597 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n5U4S-0004U0-TQ; Thu, 06 Jan 2022 14:48:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 254084.435597; Thu, 06 Jan 2022 14:48:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n5U4S-0004Rx-QR; Thu, 06 Jan 2022 14:48:52 +0000
Received: by outflank-mailman (input) for mailman id 254084;
 Thu, 06 Jan 2022 14:48:51 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gOnR=RW=tklengyel.com=tamas@srs-se1.protection.inumbo.net>)
 id 1n5U4R-0004Rq-2c
 for xen-devel@lists.xenproject.org; Thu, 06 Jan 2022 14:48:51 +0000
Received: from MTA-15-3.privateemail.com (mta-15-3.privateemail.com
 [198.54.122.111]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c172c2dd-6eff-11ec-9ce5-af14b9085ebd;
 Thu, 06 Jan 2022 15:48:49 +0100 (CET)
Received: from mta-15.privateemail.com (localhost [127.0.0.1])
 by mta-15.privateemail.com (Postfix) with ESMTP id 94FCC18000A3
 for <xen-devel@lists.xenproject.org>; Thu,  6 Jan 2022 09:48:47 -0500 (EST)
Received: from mail-yb1-f177.google.com (unknown [10.20.151.191])
 by mta-15.privateemail.com (Postfix) with ESMTPA id 6FF8018000A2
 for <xen-devel@lists.xenproject.org>; Thu,  6 Jan 2022 09:48:47 -0500 (EST)
Received: by mail-yb1-f177.google.com with SMTP id j83so8111829ybg.2
 for <xen-devel@lists.xenproject.org>; Thu, 06 Jan 2022 06:48:47 -0800 (PST)
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
X-Inumbo-ID: c172c2dd-6eff-11ec-9ce5-af14b9085ebd
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=tklengyel.com;
	s=default; t=1641480527;
	bh=1qsAsDI5cJUjBCdost7fvUykvkacmQpLkJpaiGVN2Io=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=o5vERlokd4N2JNcVaaLR3D+smNURIu0+dkU3Fnmi3Bc3gL0q6/brJPUaSkFsP6yCW
	 7pc2Hju87Dp2i/p9Mcku5Nuqwnn10xkpdPYpWHAJzNzD3ZxJAXLaL5KuTR/tI1Wep1
	 b9xmnLm20TIagNKrmhrDyrSzyIiyjHzhZhk68eEpUxdU1ar00j78QIulT6QmYLrQI9
	 YOGS8BXwGvBKp70j0ldx5YqPOrA8Tz6aDUw9hCP0Y55lcb46GKL3rTe9WudkEXVT04
	 nO7XUUlpOknv6XUYr1YPRPcONUM2o4hrH20fZRpb/26sZH0G67Vm9EttpNgVBGB2bI
	 rpoY1y7JvOQog==
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=tklengyel.com;
	s=default; t=1641480527;
	bh=1qsAsDI5cJUjBCdost7fvUykvkacmQpLkJpaiGVN2Io=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=o5vERlokd4N2JNcVaaLR3D+smNURIu0+dkU3Fnmi3Bc3gL0q6/brJPUaSkFsP6yCW
	 7pc2Hju87Dp2i/p9Mcku5Nuqwnn10xkpdPYpWHAJzNzD3ZxJAXLaL5KuTR/tI1Wep1
	 b9xmnLm20TIagNKrmhrDyrSzyIiyjHzhZhk68eEpUxdU1ar00j78QIulT6QmYLrQI9
	 YOGS8BXwGvBKp70j0ldx5YqPOrA8Tz6aDUw9hCP0Y55lcb46GKL3rTe9WudkEXVT04
	 nO7XUUlpOknv6XUYr1YPRPcONUM2o4hrH20fZRpb/26sZH0G67Vm9EttpNgVBGB2bI
	 rpoY1y7JvOQog==
X-Gm-Message-State: AOAM531NC2kF1b0H+pnlnES5Kd/F6T0zMdNYuNDfOSKmcAloRDURUitz
	l5xzP/Lzksr1T/gs1lwXIZPlrFFeVvhqoSCS08U=
X-Google-Smtp-Source: ABdhPJy6fv5mMO/noJLKzMzEB+tNcMWz24XsBBOWM2WSyq3xp0dXzgjkcY0xY3IXuiGPO/QjYkWnv2BRWkoBOo7tSg8=
X-Received: by 2002:a5b:94b:: with SMTP id x11mr55537938ybq.344.1641480522655;
 Thu, 06 Jan 2022 06:48:42 -0800 (PST)
MIME-Version: 1.0
References: <e9257e96-ede9-2809-9a77-fd4dc206badc@suse.com>
 <d1b6aede-2c0a-df7a-7815-73ad4d795899@suse.com> <CABfawhmGxHBEC1M2=zo11K11Yr_TdWFkkVpDpVimy_uvD4nxyQ@mail.gmail.com>
 <f13f983f-9190-99d4-7a6d-c73be651896d@suse.com> <CABfawhnNv+KpSm+ZGaRFvkNrooU0_E0TEijs0_WBNtrZ0-y1Jg@mail.gmail.com>
 <35ed148d-c525-5fdb-ad83-d0a1c9432b11@suse.com>
In-Reply-To: <35ed148d-c525-5fdb-ad83-d0a1c9432b11@suse.com>
From: Tamas K Lengyel <tamas@tklengyel.com>
Date: Thu, 6 Jan 2022 09:48:07 -0500
X-Gmail-Original-Message-ID: <CABfawhmf4WSxRHaE-hJdt+g-WCHJjD0y8t2JcVDHHdcpMhtsmw@mail.gmail.com>
Message-ID: <CABfawhmf4WSxRHaE-hJdt+g-WCHJjD0y8t2JcVDHHdcpMhtsmw@mail.gmail.com>
Subject: Re: [PATCH RFC v2 3/3] x86/altp2m: p2m_altp2m_propagate_change()
 should honor present page order
To: Jan Beulich <JBeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, 
	Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>, 
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
	George Dunlap <george.dunlap@citrix.com>, Alexandru Isaila <aisaila@bitdefender.com>, 
	Petre Pircalabu <ppircalabu@bitdefender.com>
Content-Type: text/plain; charset="UTF-8"
X-Virus-Scanned: ClamAV using ClamSMTP

> Hmm, I continue to be puzzled. Let's take the XSA-304 workaround as an
> example. Suppose an introspection agent has removed X from a 4k page
> in an altp2m of a guest. Suppose one of the vCPU-s of this guest runs
> on the host p2m. If this vCPU hits the (presumably) 2M or 1G mapping
> covering said 4k page for an insn fetch, the page will be shattered
> and the removed X in one (or more) of the altp2m-s will, afaict, be
> lost. This looks like a bug to me.

Yeap, that can happen if you are using large pages and allow execution
on the hosp2m. We explicitly disable large pages when we use altp2m's
though so it's not an issue for us. Someone implementing an
introspection solution where they keep large pages would have to
pre-shatter all the large pages in the hostp2m and only then apply the
altp2m changes. Or have a separate altp2m view that's used only for
execution and the hostp2m is never used. So the way things are can
certainly be worked with and it's not a show-stopper, it's just
convoluted and you can certainly have bugs if you do it wrong that
would be hard to figure out.

As I said, I don't see much upside in why the current propagation
mechanism is in place and we don't use it, so if someone wants to
switch it because of preference or because it's less error-prone, I
wouldn't object.

Tamas

