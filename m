Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 50E0BA01238
	for <lists+xen-devel@lfdr.de>; Sat,  4 Jan 2025 05:15:57 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.865286.1276582 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tTvZf-000450-K4; Sat, 04 Jan 2025 04:15:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 865286.1276582; Sat, 04 Jan 2025 04:15:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tTvZf-000435-Gv; Sat, 04 Jan 2025 04:15:43 +0000
Received: by outflank-mailman (input) for mailman id 865286;
 Sat, 04 Jan 2025 04:15:42 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=EL/b=T4=proton.me=dmkhn@srs-se1.protection.inumbo.net>)
 id 1tTvZe-000428-1G
 for xen-devel@lists.xenproject.org; Sat, 04 Jan 2025 04:15:42 +0000
Received: from mail-10629.protonmail.ch (mail-10629.protonmail.ch
 [79.135.106.29]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8f6bda59-ca52-11ef-a0de-8be0dac302b0;
 Sat, 04 Jan 2025 05:15:41 +0100 (CET)
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
X-Inumbo-ID: 8f6bda59-ca52-11ef-a0de-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=gt27evmqyrdrde547uucra7x34.protonmail; t=1735964140; x=1736223340;
	bh=onIM3lIsd21cJHm00Zd1RBK7g5C0E2/fBTfTWrr//HU=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector:List-Unsubscribe:List-Unsubscribe-Post;
	b=ELafeY9Ls1Ipvp/9TLa3d7TqQdIOahnAW7n7XUbc9GHyPlCGmIBF5oMibTIcg0t5I
	 JTE4HJN4UrNdlAkNuVuwcWTCWeClPs/tmk2htFzsT9U5999aaXWMK+HOEQjjD5kW0R
	 JknWEm4A6Qs32XqtV041NKs0UF1EA1v3qhRHI74uq6mqBlr+fdqMOBNQAUxCnW8xrH
	 WMT4gyEHxBK4pJbO8Wi4uOXRBo5WyhpvQwzX/K3/xiv+I+ESeNJwHw4fpSCqRfNimx
	 YrICQf6FI0gYMh3NIqR0/JR4NFT9AbMXDKpOtfEhCs9TJevsl36e60LA6tBPKi4IVM
	 KAc0udmNiZEvg==
Date: Sat, 04 Jan 2025 04:15:36 +0000
To: Jan Beulich <jbeulich@suse.com>
From: Denis Mukhin <dmkhn@proton.me>
Cc: dmukhin@ford.com, xen-devel@lists.xenproject.org, Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH v2 20/35] xen/console: introduce console_owner_domid()
Message-ID: <VJ9ivpkbNlqfKhBlb5dL6OuoPAXK9wqD4mhgO9Qt4f0qgmuow22qFv1C7L8DlbKYo7ytdKWeV1bLaYJvTAc2Yt7sEd06XREerWER5RPx4No=@proton.me>
In-Reply-To: <d55bf6a6-5861-4b72-88b5-2aaa28ae0290@suse.com>
References: <20241205-vuart-ns8250-v1-0-e9aa923127eb@ford.com> <20241205-vuart-ns8250-v1-20-e9aa923127eb@ford.com> <d55bf6a6-5861-4b72-88b5-2aaa28ae0290@suse.com>
Feedback-ID: 123220910:user:proton
X-Pm-Message-ID: 40ae3ea743449f53b34ca2c8e78067b0e599500f
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable


On Tuesday, December 10th, 2024 at 11:28 PM, Jan Beulich <jbeulich@suse.com=
> wrote:

>
>
> On 06.12.2024 05:41, Denis Mukhin via B4 Relay wrote:
>
> > From: Denis Mukhin dmukhin@ford.com
> >
> > console_owner_domid() is introduced to obtain the "console owner" domai=
n ID.
> >
> > The call is used in NS8250 emulator to identify the case when physical =
xen
> > console focus is owned by the domain w/ NS8250 emulator, in which case,
> > messages from guest OS are formatted w/o '(XEN)' prefix.
>
>
> Such messages ought to be processed through guest_printk(), which wants a
> domain pointer, not a domid_t anyway. Plus isn't that going to be
> current->domain anyway at the callsite, eliminating the need for such a
>
> helper altogether?

If the current domain is owning the physical console and printing, say, Lin=
ux
login prompt, there's no need to add "(XEN)" for every printout; adding tim=
estamps
can be disabled from Xen command line.

>
> Jan



