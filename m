Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 03674AC1336
	for <lists+xen-devel@lfdr.de>; Thu, 22 May 2025 20:23:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.994559.1377507 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uIAZ9-00047M-EY; Thu, 22 May 2025 18:22:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 994559.1377507; Thu, 22 May 2025 18:22:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uIAZ9-00044F-BZ; Thu, 22 May 2025 18:22:51 +0000
Received: by outflank-mailman (input) for mailman id 994559;
 Thu, 22 May 2025 18:22:50 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=45pF=YG=proton.me=dmkhn@srs-se1.protection.inumbo.net>)
 id 1uIAZ8-000449-DX
 for xen-devel@lists.xenproject.org; Thu, 22 May 2025 18:22:50 +0000
Received: from mail-4322.protonmail.ch (mail-4322.protonmail.ch [185.70.43.22])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c3781cbe-3739-11f0-b892-0df219b8e170;
 Thu, 22 May 2025 20:22:48 +0200 (CEST)
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
X-Inumbo-ID: c3781cbe-3739-11f0-b892-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=cczqkjxgnne2rjpo5wnagi35ae.protonmail; t=1747938167; x=1748197367;
	bh=DFX322PTsMIiiFiKx2+gLa3uC8B6hzAOkAv30kk+U3U=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector:List-Unsubscribe:List-Unsubscribe-Post;
	b=RmqQh7wGFRfREnGxXq647m6MLXiqKNZOKFgXx8C0XxF4iO4ccapGt8otQ3QZGHiVa
	 HijYM/3doHO6gccoEW/H3rihaKfI9Yabm01nPWjtfTwvNFWR//UpeUM2tRqWzI/46b
	 99P1KaqVVS15kfFYO+Qyw8aL9ZWy9/vFtanGNjki3R7D+E9GdEfdzKnceUHAfaK3Ze
	 NE389u+wRDbp7Sw7MWnm24+43Aow8yvLflVMPPoYEmQDeWuSjlwYN/UiY2tQiQMGF5
	 R+uVzVskB+dhosPZ7Dzoic3NRwAPyAll0pp3QG8GIzhYD7Yn4iPBJ/1CLZ02o52RcG
	 TkMaLjKqToWdA==
Date: Thu, 22 May 2025 18:22:41 +0000
To: Andrew Cooper <andrew.cooper3@citrix.com>
From: dmkhn@proton.me
Cc: xen-devel@lists.xenproject.org, christopher.w.clark@gmail.com, dpsmith@apertussolutions.com, michal.orzel@amd.com, persaur@gmail.com, dmukhin@ford.com
Subject: Re: [XTF PATCH v2 2/2] tests/argo: use event channel to get own domain ID
Message-ID: <aC9rbByD7BaRCvV4@kraken>
In-Reply-To: <850d4bf8-3e98-4aee-9d41-e298be34893a@citrix.com>
References: <20250521211742.2997890-1-dmukhin@ford.com> <20250521211742.2997890-3-dmukhin@ford.com> <850d4bf8-3e98-4aee-9d41-e298be34893a@citrix.com>
Feedback-ID: 123220910:user:proton
X-Pm-Message-ID: 73a3e0eba0f3f41e2f7f2277a65217da46c5ac34
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Wed, May 21, 2025 at 10:37:40PM +0100, Andrew Cooper wrote:
> On 21/05/2025 10:18 pm, dmkhn@proton.me wrote:
> > From: Denis Mukhin <dmukhin@ford.com>
> >
> > The existing argo test depends on xenstore to retrieve the domain ID.
> >
> > Also, test does not perform peer-to-peer communication using Argo hyper=
call, it
> > communicates with itself.
> >
> > Since xenstore currently runs in dom0, xenstore adds unnecessary depend=
ency on
> > dom0 for the test in x86 QEMU environment.
> >
> > Use event channel to identify the domain ID which eliminates dom0 depen=
dency
> > for the test.
> >
> > Signed-off-by: Denis Mukhin <dmukhin@ford.com>
> > ---
> > Changes since v1:
> > - dropped hack of hardcoding test's own domain ID to 0, reworked gettin=
g own
> >   domain ID by relying on message channel.
> >
> > Thanks to Michal Orzel and Andrew Cooper for helping with that.
>=20
> Thanks, although this needs integrating into the pending series I've
> already got.=C2=A0 Notably, we want to use the CPUID if it's available.
>=20
> It also needs to be ahead of the argo test to avoid a bisection hazard.
>=20
> I'll pick this up and sort things out.

Thank you!

>=20
> ~Andrew


