Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B343A9DCD4
	for <lists+xen-devel@lfdr.de>; Sat, 26 Apr 2025 20:59:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.969334.1358490 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u8kkU-0004TQ-Pn; Sat, 26 Apr 2025 18:59:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 969334.1358490; Sat, 26 Apr 2025 18:59:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u8kkU-0004RP-MM; Sat, 26 Apr 2025 18:59:38 +0000
Received: by outflank-mailman (input) for mailman id 969334;
 Sat, 26 Apr 2025 18:59:36 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Sv0y=XM=arndb.de=arnd@srs-se1.protection.inumbo.net>)
 id 1u8kkS-0004RF-Al
 for xen-devel@lists.xenproject.org; Sat, 26 Apr 2025 18:59:36 +0000
Received: from fout-b2-smtp.messagingengine.com
 (fout-b2-smtp.messagingengine.com [202.12.124.145])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 96b0e867-22d0-11f0-9ffb-bf95429c2676;
 Sat, 26 Apr 2025 20:59:33 +0200 (CEST)
Received: from phl-compute-05.internal (phl-compute-05.phl.internal
 [10.202.2.45])
 by mailfout.stl.internal (Postfix) with ESMTP id 6BBA61140176;
 Sat, 26 Apr 2025 14:59:31 -0400 (EDT)
Received: from phl-imap-11 ([10.202.2.101])
 by phl-compute-05.internal (MEProxy); Sat, 26 Apr 2025 14:59:31 -0400
Received: by mailuser.phl.internal (Postfix, from userid 501)
 id 835D42220073; Sat, 26 Apr 2025 14:59:29 -0400 (EDT)
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
X-Inumbo-ID: 96b0e867-22d0-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1745693971;
	 x=1745780371; bh=mEbM75b63b21fscrrKo8cY3IJYbVbEu6bJnC3sagJKU=; b=
	wLdLhHk9Qc/YVQ/LRpLy085dWwtnwfRkOL+RFJQzt0DALjXlCUyTfwJagoQ0hC9j
	q96aw+v6wloMZrw/5TK48KRJwfVZJPSWY8WenRIkC8fn77WtXRPCCVV9G7H1emu3
	MX5N+p4I7i4uArO3P2WHAnaDt0sJV02gXOIC6OlB0WNDCAS/i6ZwvYa/YO64kh5C
	Sk6gcXm6awBg2zQ7C+KrhCxB9UCR9wlKx8XuAd3ohtVZ54s5/ZPyyzLQLKF19CVw
	VUfYJoUk44qmcE0kneu/R4RbLhbNUzJ925AvGEAQIkfH3LxzP+FBofBt9CxpJ91L
	C+Lr+6FXGrVkbs72AoJvHg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1745693971; x=
	1745780371; bh=mEbM75b63b21fscrrKo8cY3IJYbVbEu6bJnC3sagJKU=; b=c
	3gKUK/oYYU/xDCnCuX5xOv4Bm5TOJtFWPKLeQ0Sax5GGVJk8WK70LpoXhoZhFyth
	k4oUVMJrVF+APNynOeX3KxzwELSYFBNpCYDa46RZB0rGFPvC93jdLeExi0CuS56g
	/WGGcJF2tu3BbP7F/gzK3KqyRpOrF8YiWAVaEXNrxhbjGhESgs2TT+fyjHdxePlU
	mL2KrZr6Hxsg3ggQ9cFiLMR3u368RKx6C53w+N2ipJGzKRvRK+nv8GJkyYNhbLvx
	S2atg76dAYXbZAfBuJYqngIro1GCgVrG2cSxVdpVzID44U8RZEX2pz0/NweKpxfZ
	vQwkUe5lWe5X2yz0F6EBQ==
X-ME-Sender: <xms:ES0NaP-DXIPy1r8Rhpuma8P2vshaQilKA_cnY9l_PND_EolcZZWjmQ>
    <xme:ES0NaLtpBSbpRCo8pOsHdK6wejQgIeauuNsdHdYNr0J6v-U9jIsHsT6H9xwYCtccL
    8lbBFpoRIS9iaPpr8g>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvheehleekucetufdoteggodetrf
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
X-ME-Proxy: <xmx:ES0NaNBeEKd0jec5yISSD9Q-uu9etGx1vwBKZ21jl4BMia77snVMBg>
    <xmx:ES0NaLeqyuNfkRQkv0vjERgVE973evWx3TaoQsn-F1qhBY-PHw2q4A>
    <xmx:ES0NaEPeomFD0FA824OTf3ZVX-xa1ooV371pZaJIiHJWfdL3gCaH1w>
    <xmx:ES0NaNlws2bH0MGanfOUbi8KFsRDyDFOIZ9ENqO2ZktogfDEYa5nKw>
    <xmx:Ey0NaAa8_vG03KGmkbKsDc9W0ff8iLcfzDomNo-IETQLfVCDLn1KMyyi>
Feedback-ID: i56a14606:Fastmail
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
X-ThreadId: T6ef4c78fde3bfaf8
Date: Sat, 26 Apr 2025 20:58:59 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Ingo Molnar" <mingo@kernel.org>, "Arnd Bergmann" <arnd@kernel.org>
Cc: "Thomas Gleixner" <tglx@linutronix.de>, "Ingo Molnar" <mingo@redhat.com>,
 "Borislav Petkov" <bp@alien8.de>,
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
Message-Id: <d2b0e71c-e79b-40d6-8693-3202cd894d66@app.fastmail.com>
In-Reply-To: <aAyiganPp_UsNlnZ@gmail.com>
References: <20250425141740.734030-1-arnd@kernel.org>
 <aAyiganPp_UsNlnZ@gmail.com>
Subject: Re: [PATCH] [RFC] x86/cpu: rework instruction set selection
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Sat, Apr 26, 2025, at 11:08, Ingo Molnar wrote:
> * Arnd Bergmann <arnd@kernel.org> wrote:
>
> While the simplification is nice on its face, this looks messy:
>
>>  
>>  config X86_PAE
>>  	bool "PAE (Physical Address Extension) Support"
>> -	depends on X86_32 && X86_HAVE_PAE
>> +	depends on X86_32 && X86_CMOV
>
> Coupling CMOV to PAE ... :-/

Right. With the current set of features, CMOV is almost the
same as 686. My reasoning was that support for CMOV has a
very clear definition, with the instruction either being
available or not.

When the M686/MPENTIUMII/MK6/... options are just optimization
levels rather than selecting an instruction set, X86_PAE
can't depend on those any more. An easy answer here would be
to not have X86_PAE depend on anything, but instead make it
force X86_MINIMUM_CPU_FAMILY=6.

>> +config X86_CMOV
>> +	bool "Require 686-class CMOV instructions" if X86_32
>> +	default y
>>  	help
>> -	  This is the processor type of your CPU. This information is
>> -	  used for optimizing purposes. In order to compile a kernel
>> -	  that can run on all supported x86 CPU types (albeit not
>> -	  optimally fast), you can specify "586" here.
>> +	  Most x86-32 processor implementations are compatible with
>> +	  the the CMOV instruction originally added in the Pentium Pro,
>> +	  and they perform much better when using it.
>> +
>> +	  Disable this option to build for 586-class CPUs without this
>> +	  instruction. This is only required for the original Intel
>> +	  Pentium (P5, P54, P55), AMD K6/K6-II/K6-3D, Geode GX1 and Via
>> +	  CyrixIII/C3 CPUs.
>
> Very few users will know anything about CMOV.
>
> I'd argue the right path forward is to just bite the bullet and remove 
> non-CMOV support as well, that would be the outcome *anyway* in a few 
> years. That would allow basically a single 'modern' 32-bit kernel that 
> is supposed to boot on every supported CPU. People might even end up 
> testing it ... ;-)

That would be a much more drastic change than requiring CX8
and TSC, which were present on almost all Socket 7 CPUs and
all embedded cores other than Elan and Vortex86SX.

CMOV is missing not just on old Socket 5/7 CPUs (Pentium
MMX, AMD K6, Cyrix MII) but also newer embedded Via C3, Geode GX
and Vortex86DX/MX/EX/DX2. The replacement Nehemiah (2003), GeodeLX
(2005) and Vortex86DX3/EX2 (2015!) have CMOV, but the old ones
were sold alongside them for years, and some of the 586-class
Vortex86 products are still commercially available.

There is a good chance that we could just not use CMOV and only
build 586-compatible kernels without anyone caring about the
performance difference. There is not much to gain here either
though, as the cost of supporting both 586-class and 686-class
builds is rather small: there is a compiler flag, a boot time
check and microoptimziation in ffs/fls.

     Arnd

