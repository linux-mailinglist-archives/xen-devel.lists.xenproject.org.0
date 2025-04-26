Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F4E5A9DCDD
	for <lists+xen-devel@lfdr.de>; Sat, 26 Apr 2025 21:10:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.969372.1358500 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u8kuX-0006dW-L6; Sat, 26 Apr 2025 19:10:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 969372.1358500; Sat, 26 Apr 2025 19:10:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u8kuX-0006b7-I5; Sat, 26 Apr 2025 19:10:01 +0000
Received: by outflank-mailman (input) for mailman id 969372;
 Sat, 26 Apr 2025 19:09:59 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=pqNG=XM=kernel.org=mingo@srs-se1.protection.inumbo.net>)
 id 1u8kuV-0006b1-8U
 for xen-devel@lists.xenproject.org; Sat, 26 Apr 2025 19:09:59 +0000
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0b2568ef-22d2-11f0-9eb3-5ba50f476ded;
 Sat, 26 Apr 2025 21:09:58 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 98CDB6115D;
 Sat, 26 Apr 2025 19:09:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 92973C4CEE2;
 Sat, 26 Apr 2025 19:09:52 +0000 (UTC)
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
X-Inumbo-ID: 0b2568ef-22d2-11f0-9eb3-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745694596;
	bh=07l3WctL9NqhfdN89XZmqkm5zTdk90Q/ztrcy/DErjg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=NVfY67VWhCVqlpe7m2m9BJZW2pOZWxvq9m7gF6cpOJC+vZijOXds7YNWbZ8+8wBvK
	 v0gjXTJEl6up/BuqExzotOfQNrcXc/iSM12njyAUxBde+8Eggt3fT+zKp8fTm6tuJg
	 PqZcKEa/R/OEzNXAO+yXnU6NhDVPIpDthVGKhEvfVRk+4pGzH/5SzmMqyuTgw06Net
	 2QKbaK8Jk0J2yQtumpT3m2LmZs6und/oVXYc2A3uUnU4wd5IXdmNpOFcvbYSDKcFti
	 t0C5fSSHVbnxYk09jk/DjG8CzVR9FPjIaAhbJGXXFKVxVxysfDBpTOKlMWy2bDoXHd
	 +ZfFc3/gEW3qQ==
Date: Sat, 26 Apr 2025 21:09:50 +0200
From: Ingo Molnar <mingo@kernel.org>
To: Arnd Bergmann <arnd@arndb.de>
Cc: Arnd Bergmann <arnd@kernel.org>, Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>, Juergen Gross <jgross@suse.com>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	Alexander Usyskin <alexander.usyskin@intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Mateusz =?utf-8?Q?Jo=C5=84czyk?= <mat.jonczyk@o2.pl>,
	Mike Rapoport <rppt@kernel.org>, Ard Biesheuvel <ardb@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>, linux-kernel@vger.kernel.org,
	xen-devel@lists.xenproject.org,
	Linus Torvalds <torvalds@linux-foundation.org>
Subject: Re: [PATCH] [RFC] x86/cpu: rework instruction set selection
Message-ID: <aA0vft1cPuvzdZvJ@gmail.com>
References: <20250425141740.734030-1-arnd@kernel.org>
 <aAyiganPp_UsNlnZ@gmail.com>
 <d2b0e71c-e79b-40d6-8693-3202cd894d66@app.fastmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d2b0e71c-e79b-40d6-8693-3202cd894d66@app.fastmail.com>


* Arnd Bergmann <arnd@arndb.de> wrote:

> CMOV is missing not just on old Socket 5/7 CPUs (Pentium MMX, AMD K6, 
> Cyrix MII) but also newer embedded Via C3, Geode GX and 
> Vortex86DX/MX/EX/DX2. The replacement Nehemiah (2003), GeodeLX (2005) 
> and Vortex86DX3/EX2 (2015!) have CMOV, but the old ones were sold 
> alongside them for years, and some of the 586-class Vortex86 products 
> are still commercially available.

Very few (if any) of the commercially available products will run 
modern 6.16+ kernels, right?

Note that the real danger the 32-bit x86 kernel is going to be facing 
in 2-5 years is total removal due to lack of development interest, but 
I think we can support 686+ reasonably far into the future, and can 
keep it tested reasonably - while covering like 99%+ of the currently 
available 32-bit-only x86 products on the market. The fewer variants, 
the better.

Thanks,

	Ingo

