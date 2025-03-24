Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DEEEA6E735
	for <lists+xen-devel@lfdr.de>; Tue, 25 Mar 2025 00:33:44 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.926015.1328875 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1twrHc-0006QD-3S; Mon, 24 Mar 2025 23:32:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 926015.1328875; Mon, 24 Mar 2025 23:32:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1twrHb-0006On-Vj; Mon, 24 Mar 2025 23:32:39 +0000
Received: by outflank-mailman (input) for mailman id 926015;
 Mon, 24 Mar 2025 23:32:38 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=HmHk=WL=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1twrHa-0006Oh-RN
 for xen-devel@lists.xenproject.org; Mon, 24 Mar 2025 23:32:38 +0000
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3b24412c-0908-11f0-9ffa-bf95429c2676;
 Tue, 25 Mar 2025 00:32:21 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id CE95743518;
 Mon, 24 Mar 2025 23:32:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A195DC4CEDD;
 Mon, 24 Mar 2025 23:32:18 +0000 (UTC)
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
X-Inumbo-ID: 3b24412c-0908-11f0-9ffa-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742859139;
	bh=olrnjE6xYOTj+iHkhouKzIIXaJF85MK+mBjkChc+w20=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=DAy4+PMwWunv2vWitBnRJuSYUHQ8yDTaDUhpfqfKVIGk81wDa0FnBEHADjwlayxP8
	 Krm+4hmNWEkBjFHMtZT21IlGtOp1QYBCIfrQn5cIhndG4ht2aQroQyAUpRmin5eJUH
	 WEmrPCwfFoXkNJNR0MYkQgCYFM18clpJK/vVzDhTXPEjfhQbvA3NkEhLaK/EbxTTt4
	 Ti/kD5FM9CVe4bP6XX+z14SE+OpJozyU6ZdhRQUmXWs5mmwWjcautmR29gPgukvx4s
	 JWgvotSAInjfzrKuVmIJqSB3o3D9VfHINdXjzgF5dufmKW+Oq/vyElx6+3LISh4Uuw
	 6g4yjwekd1V2Q==
Date: Mon, 24 Mar 2025 16:32:17 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Denis Mukhin <dmkhn@proton.me>
cc: Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org, 
    anthony.perard@vates.tech, jbeulich@suse.com, julien@xen.org, 
    michal.orzel@amd.com, roger.pau@citrix.com, sstabellini@kernel.org, 
    dmukhin@ford.com
Subject: Re: [PATCH v2] x86/irq: introduce APIC_VECTOR_VALID()
In-Reply-To: <S3vHcnDhAQjiX22Mole-rMLN7kVyt0VJlMkbW8xjdR2IA-iisSKw2vpD5-_gZcxu0cn3UmyOgx8xchOuXUNx4SuhfvL5TrcWCyJOr46ueS8=@proton.me>
Message-ID: <alpine.DEB.2.22.394.2503241630590.2325679@ubuntu-linux-20-04-desktop>
References: <20250320230339.3897874-1-dmukhin@ford.com> <7b16c87d-f2af-451e-a58f-36461a697ad7@citrix.com> <S3vHcnDhAQjiX22Mole-rMLN7kVyt0VJlMkbW8xjdR2IA-iisSKw2vpD5-_gZcxu0cn3UmyOgx8xchOuXUNx4SuhfvL5TrcWCyJOr46ueS8=@proton.me>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 24 Mar 2025, Denis Mukhin wrote:
> On Monday, March 24th, 2025 at 6:51 AM, Andrew Cooper <andrew.cooper3@citrix.com> wrote:
> 
> > 
> > 
> > On 20/03/2025 11:05 pm, dmkhn@proton.me wrote:
> > 
> > > Add new macro APIC_VECTOR_VALID() to validate the interrupt vector
> > > range as per [1]. This macro replaces hardcoded checks against the
> > > open-coded value 16 in LAPIC and virtual LAPIC code and simplifies
> > > the code a bit.
> > > 
> > > [1] Intel SDM volume 3A
> > > Chapter "ADVANCED PROGRAMMABLE INTERRUPT CONTROLLER"
> > > Section "Valid Interrupt Vectors"
> > > 
> > > Signed-off-by: Denis Mukhin dmukhin@ford.com
> > 
> > 
> > Would it be possible to adjust your git configuration so committer is
> > set to Denis Mukhin dmukhin@ford.com ?
> > 
> > 
> > Right now, it takes manual fixup to prevent your commits going in as
> > authored by dmkhn@proton.me, and one already slipped through.
> > https://xenbits.xen.org/gitweb/?p=xen.git&a=search&h=refs%2Fheads%2Fstaging&st=author&s=dmkhn%40proton.me
> 
> I will fix my environment, sorry for inconvenience.
> Thanks!

Hi Denis,

FYI it is suffiecient to add:

From: Denis Mukhin <dmukhin@ford.com>

as part of the body of the email (first line), git will automatically
pick it up for the Author field. You don't necessarily need to change
your email setup.

