Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A254A9E34A
	for <lists+xen-devel@lfdr.de>; Sun, 27 Apr 2025 15:26:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.969862.1358761 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u920e-0001EX-QT; Sun, 27 Apr 2025 13:25:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 969862.1358761; Sun, 27 Apr 2025 13:25:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u920e-0001BP-N2; Sun, 27 Apr 2025 13:25:28 +0000
Received: by outflank-mailman (input) for mailman id 969862;
 Sun, 27 Apr 2025 13:25:28 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=uP8M=XN=arndb.de=arnd@srs-se1.protection.inumbo.net>)
 id 1u920d-0001BJ-MP
 for xen-devel@lists.xenproject.org; Sun, 27 Apr 2025 13:25:27 +0000
Received: from fout-a6-smtp.messagingengine.com
 (fout-a6-smtp.messagingengine.com [103.168.172.149])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 12929f05-236b-11f0-9ffb-bf95429c2676;
 Sun, 27 Apr 2025 15:25:23 +0200 (CEST)
Received: from phl-compute-05.internal (phl-compute-05.phl.internal
 [10.202.2.45])
 by mailfout.phl.internal (Postfix) with ESMTP id 345AE1380159;
 Sun, 27 Apr 2025 09:25:22 -0400 (EDT)
Received: from phl-imap-11 ([10.202.2.101])
 by phl-compute-05.internal (MEProxy); Sun, 27 Apr 2025 09:25:22 -0400
Received: by mailuser.phl.internal (Postfix, from userid 501)
 id 809422220073; Sun, 27 Apr 2025 09:25:20 -0400 (EDT)
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
X-Inumbo-ID: 12929f05-236b-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1745760322;
	 x=1745846722; bh=rcRIwwGikN6rDFL8XQvl8eUL9IKcyXAXoLoaTF31pRE=; b=
	ji8UYBzOvICDLf9fpCKIsb9LzcCvjC1nYyB77xrxzQWv5eP+e2Wra8/TrMsOsOQv
	2HrbgZ86o0QF18nSXhGDAEPoVSsLMhs58A40fBb+VS51Y+rwZFEDlGbsnvAg13Fv
	Qmb+3ZRbNZWfswT50q/3A5g0ojmPZx3P8vL0AGVQmLVoPyyCq3L4Al/pqQXC+Yo+
	oLwIl+38FwHe22s64LwVrehIOQ3EYPf8neA0LBOB70U7ZAIg0xJmnxEy5KoxBjPF
	nxi+0k3UDHUSDX1tsLV3dV2D6Rt02FLAAqQ0ByZCuUNs+XonBdfgJKPFas7g9d8B
	dSLpRL4HpHk0et1YEqdp1Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1745760322; x=
	1745846722; bh=rcRIwwGikN6rDFL8XQvl8eUL9IKcyXAXoLoaTF31pRE=; b=p
	MNJ8qqe/h6wW7u+WICSImTekmwwgxS/BucapRnnhPUofEj6IWDjBGVQV3Mcw3UOc
	AwaaQeAXiJ5jlPX+qT5GwJFAantkZL7+LpipA7PC2Wx6Aom1dOCdyO8RQV0oz5w5
	V5KGV4Kz8DUhhEeGF+UHhAN6gxRfc17tVrE2AmkJU3mlqB28wZ5FIzp4WjXsGIlH
	8uc/XmLIBwMHwkVBL6zrVDroBy56pxpEbhkOhQOzrSdT2/hdMYyw8twKbGN7el1D
	pTRWlpBH47Cb3gQxc+D8NwTyka64EWMvivzC3ljrEXMggR81oMW99PNlppinpZJ0
	eSbGbRYhBEo0f35BoSUPA==
X-ME-Sender: <xms:QDAOaBfjyDbrjOq4KTgaAqG76tfcTDTOnfyQXgrGjCAU9ToSLQ3jCg>
    <xme:QDAOaPN2uWKOyqxn3SmGnBQ7wVIpuxqr1K9NdFi1_YCCqWVTnrd_8s8LTZc-yih_E
    bXjbJOfSCHVgwn11Hk>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvheekudekucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggv
    pdfurfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpih
    gvnhhtshculddquddttddmnecujfgurhepofggfffhvfevkfgjfhfutgfgsehtjeertder
    tddtnecuhfhrohhmpedftehrnhguuceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnug
    gsrdguvgeqnecuggftrfgrthhtvghrnhephfdthfdvtdefhedukeetgefggffhjeeggeet
    fefggfevudegudevledvkefhvdeinecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrg
    hmpehmrghilhhfrhhomheprghrnhgusegrrhhnuggsrdguvgdpnhgspghrtghpthhtohep
    udelpdhmohguvgepshhmthhpohhuthdprhgtphhtthhopegsphesrghlihgvnhekrdguvg
    dprhgtphhtthhopehpvghtvghriiesihhnfhhrrgguvggrugdrohhrghdprhgtphhtthho
    pegrlhgvgigrnhguvghrrdhushihshhkihhnsehinhhtvghlrdgtohhmpdhrtghpthhtoh
    eprghruggssehkvghrnhgvlhdrohhrghdprhgtphhtthhopegrrhhnugeskhgvrhhnvghl
    rdhorhhgpdhrtghpthhtohepmhhinhhgoheskhgvrhhnvghlrdhorhhgpdhrtghpthhtoh
    eprhhpphhtsehkvghrnhgvlhdrohhrghdprhgtphhtthhopeigkeeisehkvghrnhgvlhdr
    ohhrghdprhgtphhtthhopehtghhlgieslhhinhhuthhrohhnihigrdguvg
X-ME-Proxy: <xmx:QDAOaKhPOgPU1cF7kXRj0K6BAV-NjYqPt2QC12cEFNKNXIZe45CaGg>
    <xmx:QDAOaK9GKCccyIXPuB1h8Kf6b9dVf7RBSBdYEuul3tGFRfjrCQlnJA>
    <xmx:QDAOaNsWPwNpJaqiq9ePfoQ5KndvyQyRCrxF3OLtM6a0kbHMnOLZfQ>
    <xmx:QDAOaJEZMI136cXoIF5aYkZ7hn8NjHqwJWDMBmNR788DGx1BNTk9sg>
    <xmx:QjAOaJ6NussH3fWrDag9b8dt8QSa-PFtZFBcVuJ8G-i4rKHsw1OehSpN>
Feedback-ID: i56a14606:Fastmail
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
X-ThreadId: T6ef4c78fde3bfaf8
Date: Sun, 27 Apr 2025 15:24:59 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Ingo Molnar" <mingo@kernel.org>
Cc: "Arnd Bergmann" <arnd@kernel.org>, "Thomas Gleixner" <tglx@linutronix.de>,
 "Ingo Molnar" <mingo@redhat.com>, "Borislav Petkov" <bp@alien8.de>,
 "Dave Hansen" <dave.hansen@linux.intel.com>, x86@kernel.org,
 "H. Peter Anvin" <hpa@zytor.com>, "Juergen Gross" <jgross@suse.com>,
 "Boris Ostrovsky" <boris.ostrovsky@oracle.com>,
 "Alexander Usyskin" <alexander.usyskin@intel.com>,
 "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>,
 =?UTF-8?Q?Mateusz_Jo=C5=84czyk?= <mat.jonczyk@o2.pl>,
 "Mike Rapoport" <rppt@kernel.org>, "Ard Biesheuvel" <ardb@kernel.org>,
 "Peter Zijlstra" <peterz@infradead.org>, linux-kernel@vger.kernel.org,
 xen-devel@lists.xenproject.org,
 "Linus Torvalds" <torvalds@linux-foundation.org>
Message-Id: <0fc64201-03cc-4c3e-af86-7ef11c3505a0@app.fastmail.com>
In-Reply-To: <aA0vft1cPuvzdZvJ@gmail.com>
References: <20250425141740.734030-1-arnd@kernel.org>
 <aAyiganPp_UsNlnZ@gmail.com>
 <d2b0e71c-e79b-40d6-8693-3202cd894d66@app.fastmail.com>
 <aA0vft1cPuvzdZvJ@gmail.com>
Subject: Re: [PATCH] [RFC] x86/cpu: rework instruction set selection
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Sat, Apr 26, 2025, at 21:09, Ingo Molnar wrote:
> * Arnd Bergmann <arnd@arndb.de> wrote:
>
>> CMOV is missing not just on old Socket 5/7 CPUs (Pentium MMX, AMD K6, 
>> Cyrix MII) but also newer embedded Via C3, Geode GX and 
>> Vortex86DX/MX/EX/DX2. The replacement Nehemiah (2003), GeodeLX (2005) 
>> and Vortex86DX3/EX2 (2015!) have CMOV, but the old ones were sold 
>> alongside them for years, and some of the 586-class Vortex86 products 
>> are still commercially available.
>
> Very few (if any) of the commercially available products will run 
> modern 6.16+ kernels, right?

No, at least not in absolute numbers. As far as I can tell, the RDC
SoC family is the only one that is still around, after Quark, Geode
and Eden were all discontinued around 2019.

There are multiple known RDC licensees (DM&P/Vortex86, xlichip) and
probably a few more with custom chips. They lag behind Intel and AMD
by about one patent expiration time, and maybe a decade behind Arm
SoCs, so they only just arrived at quad-core SMP, LPDDR4, and SSSE3
instructions and have announced upcoming 64-bit chips.

They do have super-long support cycles, and there are a few markets
that absolutely require kernel updates for many years, so I would
still consider the 586-class embedded chips more relevant for future
kernels than 30 year old PCs, and the 686-class embedded chips
more relevant than 20 year old laptops.

> Note that the real danger the 32-bit x86 kernel is going to be facing 
> in 2-5 years is total removal due to lack of development interest, but 
> I think we can support 686+ reasonably far into the future, and can 
> keep it tested reasonably - while covering like 99%+ of the currently 
> available 32-bit-only x86 products on the market. The fewer variants, 
> the better.

I agree that this is the endgame for x86-32 and that eventually
the while thing will be remove, and every simplification helps, but
I still don't think that removing 586 earlier helps enough to
outweigh the cost here.

The situation is similar on 32-bit Arm, where we currently support
armv4, armv4t, armv5, armv6, armv6k, armv7, armv7ve and armv8-aarch32.
Removing armv3 a few years ago helped a lot, removing the extremely
rare armv6 will help as well, but there is little value in dropping
CPU support for v4 and v4t as long as v5 is there, or v6k and v7
as long as we have v7ve and v8-aarch32. My guess would be that we
can remove armv4/v4t/v5 at the same time as i586/i686 and
some other 32-bit targets, followed by armv7/v7ve/v8-aarch32
much later.

       Arnd

