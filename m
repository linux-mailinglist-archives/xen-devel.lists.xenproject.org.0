Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D4B17A9CDDC
	for <lists+xen-devel@lfdr.de>; Fri, 25 Apr 2025 18:14:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.968372.1357989 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u8Lgf-0002as-L3; Fri, 25 Apr 2025 16:14:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 968372.1357989; Fri, 25 Apr 2025 16:14:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u8Lgf-0002YF-IQ; Fri, 25 Apr 2025 16:14:01 +0000
Received: by outflank-mailman (input) for mailman id 968372;
 Fri, 25 Apr 2025 16:14:00 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ScUV=XL=arndb.de=arnd@srs-se1.protection.inumbo.net>)
 id 1u8Lgd-0002Y9-Nb
 for xen-devel@lists.xenproject.org; Fri, 25 Apr 2025 16:14:00 +0000
Received: from fout-a3-smtp.messagingengine.com
 (fout-a3-smtp.messagingengine.com [103.168.172.146])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 491ae671-21f0-11f0-9ffb-bf95429c2676;
 Fri, 25 Apr 2025 18:13:55 +0200 (CEST)
Received: from phl-compute-05.internal (phl-compute-05.phl.internal
 [10.202.2.45])
 by mailfout.phl.internal (Postfix) with ESMTP id 87A6013803F8;
 Fri, 25 Apr 2025 12:13:54 -0400 (EDT)
Received: from phl-imap-11 ([10.202.2.101])
 by phl-compute-05.internal (MEProxy); Fri, 25 Apr 2025 12:13:54 -0400
Received: by mailuser.phl.internal (Postfix, from userid 501)
 id A08062220073; Fri, 25 Apr 2025 12:13:52 -0400 (EDT)
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
X-Inumbo-ID: 491ae671-21f0-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1745597634;
	 x=1745684034; bh=Yvg2W7pOPhvpDT95VcvdJxrIJY08qpA5cIKwqfTORTY=; b=
	Naad5GFeWYwQrTjdLfyOV77bbd2AkMddHFS2vgyO9i1KrLIGD/+LDdmVJbs0ASqm
	lDprKhuAOVbVNaIWeRqnYqJFjtMCESkrtWiHkQuY7CO6o5GVzBm133gLWtpYpG8/
	dpyEjvBa4/dARmhYiiiu35CJgVHruzBap+1J73pv3TsbUwjscNx+iJD4uIUpbuV9
	Y9FOw2Nt+KcNCls4py4oTDFo0cEjUsU2lhhxhVoTnNdvKx/8m5GS7TzU7w85t61y
	Or+klb2b6lp4/CJ9iiErJSO8CGah/I5mERH7s+z/ZfxVN2opGK/76chVJ/q+g2lA
	jLULe/s7RxKAFtYvaCFpHQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1745597634; x=
	1745684034; bh=Yvg2W7pOPhvpDT95VcvdJxrIJY08qpA5cIKwqfTORTY=; b=L
	p6aCUm/0PsRC5l8WdrWL3golhsxVaDBgp7c/rPDw9Q5q/NFWU0VdmlY5+jNt0QTu
	qdnY/QUzZvh3x1vEkhEY9slS8t8b3Zh4hluJIM+g70vk+tIw1ioFR2yR3eGZTShu
	Z/fCPeM9oU5zYeGsDrAW0YJFEmuVzAOKA3WZh41REcXoGOpJF57BtuxAKTYyfzZk
	G97qJl3UiwvvRFCOM2LAVHjYy1dqFCAw3/sIVrJVnNG5xa4jRRu+mT0JedQLdeWJ
	h5pT6B3KVj5cpOBJDEqMHVMSiCyOYAQaHulDmdCE8rfyKcluoGG275vS+78HfGyy
	bP8wo8G1/cwwia5SqXHXA==
X-ME-Sender: <xms:wLQLaHp2tb94smK6g90t71KWpC6jZx2bDxPng9mKqywhqdxDC-nw6Q>
    <xme:wLQLaBoqI_UZqWP1YDLAa4zTp3rx6Qs_G2MinX485YfeaV2dL48ka7WuuughkAmuQ
    5ud796Q1yfgs6ZK_Nk>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvhedvjeelucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggv
    pdfurfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpih
    gvnhhtshculddquddttddmnecujfgurhepofggfffhvfevkfgjfhfutgfgsehtjeertder
    tddtnecuhfhrohhmpedftehrnhguuceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnug
    gsrdguvgeqnecuggftrfgrthhtvghrnhephfdthfdvtdefhedukeetgefggffhjeeggeet
    fefggfevudegudevledvkefhvdeinecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrg
    hmpehmrghilhhfrhhomheprghrnhgusegrrhhnuggsrdguvgdpnhgspghrtghpthhtohep
    udejpdhmohguvgepshhmthhpohhuthdprhgtphhtthhopegsphesrghlihgvnhekrdguvg
    dprhgtphhtthhopehpvghtvghriiesihhnfhhrrgguvggrugdrohhrghdprhgtphhtthho
    pegrlhgvgigrnhguvghrrdhushihshhkihhnsehinhhtvghlrdgtohhmpdhrtghpthhtoh
    eprghruggssehkvghrnhgvlhdrohhrghdprhgtphhtthhopegrrhhnugeskhgvrhhnvghl
    rdhorhhgpdhrtghpthhtoheprhhpphhtsehkvghrnhgvlhdrohhrghdprhgtphhtthhope
    igkeeisehkvghrnhgvlhdrohhrghdprhgtphhtthhopehtghhlgieslhhinhhuthhrohhn
    ihigrdguvgdprhgtphhtthhopegurghvvgdrhhgrnhhsvghnsehlihhnuhigrdhinhhtvg
    hlrdgtohhm
X-ME-Proxy: <xmx:wLQLaEOhJEv0oYYsVYfyzmYUSp9pAhgUhKJ2Ri2uYxyOFqLYX4bM4Q>
    <xmx:wLQLaK5HIvDo_c-bsOw4b-cSc-jjR7kfO-CPlpDbHW-o9cebCPLPqA>
    <xmx:wLQLaG6dqj8QzvQpBZRwzX5_KhFyy6YmgAENRQv-2M-16qCk0ECsjA>
    <xmx:wLQLaCh4ZGvLeTwKKeSXf_0llKg28o3D8ev4AHtW93IuQmmMeFFDIg>
    <xmx:wrQLaHfI90MILvt6A9aWTPE1_R_OExpxtVSaC1qUMNPKYNP5eKO0tR1R>
Feedback-ID: i56a14606:Fastmail
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
X-ThreadId: T6ef4c78fde3bfaf8
Date: Fri, 25 Apr 2025 18:13:31 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "H. Peter Anvin" <hpa@zytor.com>, "Arnd Bergmann" <arnd@kernel.org>,
 "Thomas Gleixner" <tglx@linutronix.de>, "Ingo Molnar" <mingo@redhat.com>,
 "Borislav Petkov" <bp@alien8.de>,
 "Dave Hansen" <dave.hansen@linux.intel.com>, x86@kernel.org
Cc: "Juergen Gross" <jgross@suse.com>,
 "Boris Ostrovsky" <boris.ostrovsky@oracle.com>,
 "Alexander Usyskin" <alexander.usyskin@intel.com>,
 "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>,
 =?UTF-8?Q?Mateusz_Jo=C5=84czyk?= <mat.jonczyk@o2.pl>,
 "Mike Rapoport" <rppt@kernel.org>, "Ard Biesheuvel" <ardb@kernel.org>,
 "Peter Zijlstra" <peterz@infradead.org>, linux-kernel@vger.kernel.org,
 xen-devel@lists.xenproject.org
Message-Id: <09e26f91-9a62-45c8-b94e-eddb307251f4@app.fastmail.com>
In-Reply-To: <7CEE8E85-D7B1-4066-AD4D-747CA4340F65@zytor.com>
References: <20250425141740.734030-1-arnd@kernel.org>
 <7CEE8E85-D7B1-4066-AD4D-747CA4340F65@zytor.com>
Subject: Re: [PATCH] [RFC] x86/cpu: rework instruction set selection
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Fri, Apr 25, 2025, at 17:34, H. Peter Anvin wrote:
> On April 25, 2025 7:15:15 AM PDT, Arnd Bergmann <arnd@kernel.org> wrote:
>
> I really don't like testing an unrelated feature (CMOV for PAE); 

How about a new symbol with the opposite polarity, e.g. CONFIG_CPU_586?
In that case, X86_HAVE_PAE and X86_CMOV could both depend on that
not being set.

I only picked the X86_CMOV symbol because it already exists in .config
files, but that is not the important bit here.

> furthermore, at least some old hypervisors were known to have
> broken PAE.

I'm not following. What does that have to do with my patch?

     Arnd

