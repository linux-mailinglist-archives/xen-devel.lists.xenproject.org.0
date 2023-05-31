Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 37C3F717DB4
	for <lists+xen-devel@lfdr.de>; Wed, 31 May 2023 13:08:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.541735.844782 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q4JgY-0004sK-0H; Wed, 31 May 2023 11:08:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 541735.844782; Wed, 31 May 2023 11:08:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q4JgX-0004pn-T3; Wed, 31 May 2023 11:08:09 +0000
Received: by outflank-mailman (input) for mailman id 541735;
 Wed, 31 May 2023 11:08:09 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=7qvw=BU=shutemov.name=kirill@srs-se1.protection.inumbo.net>)
 id 1q4JgW-0004ph-Oj
 for xen-devel@lists.xenproject.org; Wed, 31 May 2023 11:08:09 +0000
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6a5f8c89-ffa3-11ed-b231-6b7b168915f2;
 Wed, 31 May 2023 13:08:06 +0200 (CEST)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
 by mailout.nyi.internal (Postfix) with ESMTP id 4D0625C00F1;
 Wed, 31 May 2023 07:08:04 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute6.internal (MEProxy); Wed, 31 May 2023 07:08:04 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 31 May 2023 07:08:00 -0400 (EDT)
Received: by box.shutemov.name (Postfix, from userid 1000)
 id D69A310BD95; Wed, 31 May 2023 14:07:56 +0300 (+03)
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
X-Inumbo-ID: 6a5f8c89-ffa3-11ed-b231-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=shutemov.name;
	 h=cc:cc:content-type:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to; s=fm2; t=1685531284; x=
	1685617684; bh=aeL29fTibpX7OH1ns9iCpikawL6pyGgQIxFzUFIJ5mE=; b=x
	UDCGtesaL634GL9eXdFKoKL1s1Tz9Ll4uk1Af1BMnvQGH4j9+1PhPANaEaVE379R
	CdP85tpEg9YcUW2h5dFDnyNMAmMCkYWCYlWHtfBYAhuz7I36GZhVasYeXJhtrGKQ
	9Lrd5hHztASe4grn656Fm1LxjoNjOG1JM3Ad9/lCi0sHtpjyf+ptypYz5yGO613d
	qh8+Kv3Y5LpM1E1ielOLRn5Ok/JsogZMAHdTruPsKoySspbI4+TYmoxqI/VIiBEP
	9NSI/2t5My7odxwCZX0DKZDp9MOjZtjLzlE2tfb83C3rAyCOX0y3uoPoI2tB10/o
	jG1KAHIWcun/pGj4MxlRQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm1; t=1685531284; x=1685617684; bh=aeL29fTibpX7O
	H1ns9iCpikawL6pyGgQIxFzUFIJ5mE=; b=CKpieIWYKmOkyyCDiuZP8D+PUVECt
	T2ErndCGQJp98RFqZNoUkT/fLhMhJ/86fqOlgcQFwHL1AieUk9bVGqVQwn4r+E2W
	f0BdsMG0bUxMm93eQ9DkRhxUnn/i/uxmRKJyngDMg7NgPssfHdpcqc4Ji8JdwWKu
	KcmycyZC8ziSkBHUUx0EKF81JTIo9p1nky54jRBkScT+6/Vtg8YxhCTisfVZ1PtQ
	DxAb3nZ6wlHPyxA4NCng2CaUSohgQo62Msc4qWAgBMoDuT6fhd6tjX3xJipyPlE8
	6WncsmBPKzOXGkMG97UzW0dluJcZkHMNBSKLi7gH8TFXTIx7+dO3jVsvQ==
X-ME-Sender: <xms:kCp3ZGhTVDV0DVu7dmcXkuzxkpXwEA9IwCIFbDRZWqgyIv8wnEJkFQ>
    <xme:kCp3ZHAPrdO9QnDydIYpePwNPqTvQeT4rDLRRhSWppJUEyVQkKccYZjgigzReTWrC
    K0XSDatK5L73o__kNY>
X-ME-Received: <xmr:kCp3ZOGKLu-mTkNtzCsjRFXSA0mPL0O0V-GjwUeK0cpeJiwxiYZ1sNPmsq0FoVcs2JuCqQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrfeekledgfeehucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvfevuffkfhggtggujgesthdttddttddtvdenucfhrhhomhepfdfmihhr
    ihhllhcutedrucfuhhhuthgvmhhovhdfuceokhhirhhilhhlsehshhhuthgvmhhovhdrnh
    grmhgvqeenucggtffrrghtthgvrhhnpefhieeghfdtfeehtdeftdehgfehuddtvdeuheet
    tddtheejueekjeegueeivdektdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmh
    epmhgrihhlfhhrohhmpehkihhrihhllhesshhhuhhtvghmohhvrdhnrghmvg
X-ME-Proxy: <xmx:kCp3ZPSz5hGKt8pyGe8Ue_MUxG7I7-LMRL0S8Maei_bY-CtDzDeDqg>
    <xmx:kCp3ZDybG56imlj3lotFSk424EAyO4S3ZalWSFbkTcroWC2CEkq-8g>
    <xmx:kCp3ZN6cb8NiInnM6MmJJINWLXlxFmXCECS2-MdbyVDlBUBQ7WTXsw>
    <xmx:lCp3ZIQZa_9Yhyap2wMrdMHayAKX3jfVOiYwSdewsO8ergavPjSuDQ>
Feedback-ID: ie3994620:Fastmail
Date: Wed, 31 May 2023 14:07:56 +0300
From: "Kirill A. Shutemov" <kirill@shutemov.name>
To: Thomas Gleixner <tglx@linutronix.de>
Cc: Tom Lendacky <thomas.lendacky@amd.com>,
	Sean Christopherson <seanjc@google.com>,
	LKML <linux-kernel@vger.kernel.org>, x86@kernel.org,
	David Woodhouse <dwmw2@infradead.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Brian Gerst <brgerst@gmail.com>,
	Arjan van de Veen <arjan@linux.intel.com>,
	Paolo Bonzini <pbonzini@redhat.com>,	Paul McKenney <paulmck@kernel.org>,
	Oleksandr Natalenko <oleksandr@natalenko.name>,
	Paul Menzel <pmenzel@molgen.mpg.de>,
	"Guilherme G. Piccoli" <gpiccoli@igalia.com>,
	Piotr Gorski <lucjan.lucjanov@gmail.com>,
	Usama Arif <usama.arif@bytedance.com>,	Juergen Gross <jgross@suse.com>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	xen-devel@lists.xenproject.org,	Russell King <linux@armlinux.org.uk>,
 Arnd Bergmann <arnd@arndb.de>,	linux-arm-kernel@lists.infradead.org,
	Catalin Marinas <catalin.marinas@arm.com>,	Will Deacon <will@kernel.org>,
 Guo Ren <guoren@kernel.org>,	linux-csky@vger.kernel.org,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	linux-mips@vger.kernel.org,
	"James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
	Helge Deller <deller@gmx.de>, linux-parisc@vger.kernel.org,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,	linux-riscv@lists.infradead.org,
	Mark Rutland <mark.rutland@arm.com>,	Sabin Rapan <sabrapan@amazon.com>,
	"Michael Kelley (LINUX)" <mikelley@microsoft.com>,
	Dave Hansen <dave.hansen@linux.intel.com>
Subject: Re: [patch] x86/smpboot: Fix the parallel bringup decision
Message-ID: <20230531110756.g4cz2tjnc7ypskre@box.shutemov.name>
References: <87jzwqjeey.ffs@tglx>
 <87cz2ija1e.ffs@tglx>
 <20230530122951.2wu5rwcu26ofov6f@box.shutemov.name>
 <87wn0pizbl.ffs@tglx>
 <ZHYqwsCURnrFdsVm@google.com>
 <87leh5iom8.ffs@tglx>
 <8751e955-e975-c6d4-630c-02912b9ef9da@amd.com>
 <871qiximen.ffs@tglx>
 <b6323987-059e-5396-20b9-8b6a1687e289@amd.com>
 <87ilc9gd2d.ffs@tglx>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87ilc9gd2d.ffs@tglx>

On Wed, May 31, 2023 at 09:44:26AM +0200, Thomas Gleixner wrote:
> The decision to allow parallel bringup of secondary CPUs checks
> CC_ATTR_GUEST_STATE_ENCRYPT to detect encrypted guests. Those cannot use
> parallel bootup because accessing the local APIC is intercepted and raises
> a #VC or #VE, which cannot be handled at that point.
> 
> The check works correctly, but only for AMD encrypted guests. TDX does not
> set that flag.
> 
> As there is no real connection between CC attributes and the inability to
> support parallel bringup, replace this with a generic control flag in
> x86_cpuinit and let SEV-ES and TDX init code disable it.
> 
> Fixes: 0c7ffa32dbd6 ("x86/smpboot/64: Implement arch_cpuhp_init_parallel_bringup() and enable it")
> Reported-by: Kirill A. Shutemov <kirill.shutemov@linux.intel.com>
> Signed-off-by: Thomas Gleixner <tglx@linutronix.de>

Tested-by: Kirill A. Shutemov <kirill.shutemov@linux.intel.com>

-- 
  Kiryl Shutsemau / Kirill A. Shutemov

