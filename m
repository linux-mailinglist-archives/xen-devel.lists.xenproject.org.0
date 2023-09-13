Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ABA8179F2E4
	for <lists+xen-devel@lfdr.de>; Wed, 13 Sep 2023 22:31:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.601609.937719 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qgWWa-0003CM-W3; Wed, 13 Sep 2023 20:31:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 601609.937719; Wed, 13 Sep 2023 20:31:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qgWWa-00039x-SO; Wed, 13 Sep 2023 20:31:48 +0000
Received: by outflank-mailman (input) for mailman id 601609;
 Wed, 13 Sep 2023 20:31:46 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=qJZS=E5=linutronix.de=tglx@srs-se1.protection.inumbo.net>)
 id 1qgWWY-00036K-Dz
 for xen-devel@lists.xenproject.org; Wed, 13 Sep 2023 20:31:46 +0000
Received: from galois.linutronix.de (galois.linutronix.de
 [2a0a:51c0:0:12e:550::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8dcdadda-5274-11ee-9b0d-b553b5be7939;
 Wed, 13 Sep 2023 22:31:44 +0200 (CEST)
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
X-Inumbo-ID: 8dcdadda-5274-11ee-9b0d-b553b5be7939
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1694637103;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=QvkOsN1rW+cp52e2+U4Pd+r05FQCQ6lhz8OcOV4VJRg=;
	b=C6R/MqGX0vKqtOvLU3C+zB1Ud6qHIXTZENaw6i8p6l71u60mxd8dlKBzHfonNFw3slv6hk
	/un+sL9MS5Hpo1Ry3zGP58xwRyGilAKfe4gTKGOTjbO8Yz450mHvTShaRsKfwtZ1fVSipe
	sadVgwt4pQJlGVgPbIkL9kDrgU35Gy+yxJnCIrQWdoIH0JWqTQAHj+8EqeU0I9WFnsnmcE
	T9gV38fWLcZ/QAu3GYxKy0yqIinywKACLqP8t3ET8dkhUvSU5k/JSJiLL2DPFaQBBRo9hz
	JZDPEPIFkjeKbyAK4BOaxjRIPXwnChK6aBGw6XR9zdhrpvl/c2V5+ptX7fNsew==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1694637103;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=QvkOsN1rW+cp52e2+U4Pd+r05FQCQ6lhz8OcOV4VJRg=;
	b=TKsu/hjOD1gx9+yb7ULkLNunmTjskubueADGLHtmCtevMFV3bUBtbtKEsvX0XDVbeuf2Xb
	zKVD0Jx6oGfA82Ag==
To: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich <jbeulich@suse.com>
Cc: Wei Liu <wl@xen.org>, solene@openbsd.org, Marek =?utf-8?Q?Marczykowski?=
 =?utf-8?Q?-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>, Demi Marie Obenour
 <demi@invisiblethingslab.com>, Roger Pau Monne <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org, the arch/x86 maintainers <x86@kernel.org>
Subject: Re: [Xen PATCH] x86/amd: do not expose HWCR.TscFreqSel to guests
In-Reply-To: <fca202a8-2716-6ed1-c2ce-707deeddb3ab@citrix.com>
References: <20230912162305.34339-1-roger.pau@citrix.com>
 <fc91c802-5f71-4ec9-8c11-68fd2c4ae672@citrix.com>
 <2cfcda8f-bd51-085b-997a-0ff31434d460@suse.com>
 <fca202a8-2716-6ed1-c2ce-707deeddb3ab@citrix.com>
Date: Wed, 13 Sep 2023 22:31:43 +0200
Message-ID: <87sf7hzufk.ffs@tglx>
MIME-Version: 1.0
Content-Type: text/plain

On Wed, Sep 13 2023 at 12:02, Andrew Cooper wrote:
> The PSTATE MSRs are entirely model specific, fully read/write, and the
> Enable bit is not an enable bit; its a "not valid yet" bit that firmware
> is required to adjust to be consistent across the coherency fabric.
>
> Linux is simply wrong with it's printk() under virt, and wants adjusting.

No objections from my side.

Thanks,

        tglx

