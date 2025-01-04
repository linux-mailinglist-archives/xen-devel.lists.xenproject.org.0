Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CCD1A01211
	for <lists+xen-devel@lfdr.de>; Sat,  4 Jan 2025 04:20:46 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.865111.1276392 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tTui7-0001h7-Cu; Sat, 04 Jan 2025 03:20:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 865111.1276392; Sat, 04 Jan 2025 03:20:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tTui7-0001eP-9p; Sat, 04 Jan 2025 03:20:23 +0000
Received: by outflank-mailman (input) for mailman id 865111;
 Sat, 04 Jan 2025 03:20:22 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=EL/b=T4=proton.me=dmkhn@srs-se1.protection.inumbo.net>)
 id 1tTui6-0001eJ-1Z
 for xen-devel@lists.xenproject.org; Sat, 04 Jan 2025 03:20:22 +0000
Received: from mail-4316.protonmail.ch (mail-4316.protonmail.ch [185.70.43.16])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d3a5fefa-ca4a-11ef-99a4-01e77a169b0f;
 Sat, 04 Jan 2025 04:20:20 +0100 (CET)
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
X-Inumbo-ID: d3a5fefa-ca4a-11ef-99a4-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=kafcvoyzdvfdxbldp7omazadba.protonmail; t=1735960819; x=1736220019;
	bh=ihGJ95yurdl3a7kTBGElK3kbwYrkKC1BWLX+mbqQQQY=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector:List-Unsubscribe:List-Unsubscribe-Post;
	b=U8FECD9EwUBBzXTiiIfvxLPT6Unme+ZXf16q4+ZmpbQZIEOIUYw9rgZ4CBO/ihO+q
	 /U+aMG29p5khuY9uikTBmiJ3/RGf4Rdfi7ZECSH/7wFUzqwcLUxxn1Tm0+Yg+L3G9H
	 edymumO5Cft8gTfYKSthT5z/Kv7GpGKfSw3hArBEnIh6pOhZmbyBhPZvSChAQq5dmx
	 z7QiS5lKC9zmOD/Oqh24XXYqN0picRL7/YC83cwrdLfzYy5zINvTDcu/0x693UeI31
	 fRgpr8ln8t+ENu5FNvSBVumEVFZOLtzqusz98CjwcnsWk+5FyBbspev0uX1hRcnuL3
	 0ZdOyxt/+1V8A==
Date: Sat, 04 Jan 2025 03:20:14 +0000
To: =?utf-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
From: Denis Mukhin <dmkhn@proton.me>
Cc: dmukhin@ford.com, xen-devel@lists.xenproject.org, Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH v2 15/35] xen/console: rename console_rx to console_owner
Message-ID: <HnZWfX88Uh_W5-10yEQRV4vfLrfLW6URZX7Yl7cKAh3XQIBrY-3UJR57dErrwKOJYdN57thD_lawLrY-cq4hZvL0F4t41bQQLk00Lxr-n0Q=@proton.me>
In-Reply-To: <Z1qlt5YLzxwawXq_@macbook.local>
References: <20241205-vuart-ns8250-v1-0-e9aa923127eb@ford.com> <20241205-vuart-ns8250-v1-15-e9aa923127eb@ford.com> <Z1qlt5YLzxwawXq_@macbook.local>
Feedback-ID: 123220910:user:proton
X-Pm-Message-ID: 7057af3659e9bbea3e7b19401a03b7c67a52600f
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Thursday, December 12th, 2024 at 12:58 AM, Roger Pau Monn=C3=A9 <roger.p=
au@citrix.com> wrote:

>
>
> On Thu, Dec 05, 2024 at 08:41:45PM -0800, Denis Mukhin via B4 Relay wrote=
:
>
> > From: Denis Mukhin dmukhin@ford.com
> >
> > Preparation for the follow on change to switch console_owner to
> > domid_t address space.
>
>
> I'm a bit confused, is the plan to assign the console (so both RX and
> TX) exclusively to a domain?

The name change is because semantics of console_rx will be changed.
It will be pointing to domain ID instead of an integer number mapped
to domain ID.
I think "console owner" should be easier to follow.

>
> Otherwise this would better be named console_input_target or similar,
> if you think console_rx is not clear enough (FWIW, I'm OK with the
> name given the current usage).
>
> Thanks, Roger.



