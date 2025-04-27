Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 669C6A9E242
	for <lists+xen-devel@lfdr.de>; Sun, 27 Apr 2025 11:50:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.969798.1358740 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u8yeK-00008i-4Z; Sun, 27 Apr 2025 09:50:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 969798.1358740; Sun, 27 Apr 2025 09:50:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u8yeK-00006o-0k; Sun, 27 Apr 2025 09:50:12 +0000
Received: by outflank-mailman (input) for mailman id 969798;
 Sun, 27 Apr 2025 09:50:10 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=mo7N=XN=kernel.org=mingo@srs-se1.protection.inumbo.net>)
 id 1u8yeI-0007cC-Dn
 for xen-devel@lists.xenproject.org; Sun, 27 Apr 2025 09:50:10 +0000
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 013f5cb5-234d-11f0-9eb3-5ba50f476ded;
 Sun, 27 Apr 2025 11:50:09 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 784E661157;
 Sun, 27 Apr 2025 09:49:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E2390C4CEE3;
 Sun, 27 Apr 2025 09:50:03 +0000 (UTC)
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
X-Inumbo-ID: 013f5cb5-234d-11f0-9eb3-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745747407;
	bh=8UYVrDmaKV6ZZ3qAklvl94/hVHJqh5GIwBuL4dIJJTU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=LNUFh+HV+LRgnlPShS8rXS7sdSbnkm7jbQkvCdQsHl+SntI9iCfZu/sITsPyhbxQP
	 VxVG7pCTFrxhj2lsgxbjty+QQQUfryr9eRA9koIa29U19wCpHAhZZUoMF3g6dNaziW
	 Nv9RG226Cx91ZCmPX1xL1EB7VB9OTb3sTaIPT+9QrLCaJAjylLeH4tqzse919IMCEn
	 dLPiARw0uHyg45zc9QUJBD/RbN4rIYBlZ+o/PxX55rbbFkJciSe3Jau7DINL50lONy
	 6UzTYjOH4/st87qenWg4Mdd8Qo7nZjJlMjKVAK2vsoz6KgS/EbnH/Ea/txXkSFrGSP
	 8Wt7G1FYKHkCQ==
Date: Sun, 27 Apr 2025 11:50:01 +0200
From: Ingo Molnar <mingo@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Arnd Bergmann <arnd@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>, Juergen Gross <jgross@suse.com>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	Alexander Usyskin <alexander.usyskin@intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Mateusz =?utf-8?Q?Jo=C5=84czyk?= <mat.jonczyk@o2.pl>,
	Mike Rapoport <rppt@kernel.org>, Ard Biesheuvel <ardb@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>, linux-kernel@vger.kernel.org,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH] [RFC] x86/cpu: rework instruction set selection
Message-ID: <aA39ydJ7Spw-K8_1@gmail.com>
References: <20250425141740.734030-1-arnd@kernel.org>
 <aAyiganPp_UsNlnZ@gmail.com>
 <d2b0e71c-e79b-40d6-8693-3202cd894d66@app.fastmail.com>
 <CAHk-=wh=TUsVv6xhtzYsWJwJggrjyOfYT3kBu+bHtoYLK0M9Xw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAHk-=wh=TUsVv6xhtzYsWJwJggrjyOfYT3kBu+bHtoYLK0M9Xw@mail.gmail.com>


* Linus Torvalds <torvalds@linux-foundation.org> wrote:

> On Sat, 26 Apr 2025 at 11:59, Arnd Bergmann <arnd@arndb.de> wrote:
> >
> > Right. With the current set of features, CMOV is almost the
> > same as 686. My reasoning was that support for CMOV has a
> > very clear definition, with the instruction either being
> > available or not.
> 
> Yeah, I don't think there's any reason to make CMOV a reason to drop support.
> 
> It has questionable performance impact - I doubt anybody can measure 
> it - and the "maintenance burden" is basically a single compiler 
> flag.
> 
> (And yes, one use in a x86 header file that is pretty questionable 
> too: I think the reason for the cmov is actually i486-only behavior 
> and we could probably unify the 32-bit and 64-bit implementation)
> 
> Let's not drop Pentium support due to something as insignificant as 
> that.

Agreed on that. Idea to require CMOV dropped.

Note that the outcome of 486 removal will likely be that the few 
remaining community distros that still offer x86-32 builds are either 
already 686-CMOV-only (Debian), or are going to drop their 486 builds 
and keep their 686-CMOV-only builds (Gentoo and Archlinux32) by way of 
simple inertia. (There's an off chance that they'll change their 486 
builds to 586, but I think dropping the extra complication and 
standardizing on 686 will be the most likely outcome.)

No commercial distro builds x86-32 with a modern v6.x series kernel 
AFAICS.

Anyway, I agree that the maintenance cost on the kernel side to build 
non-CMOV kernels is very low.

Thanks,

	Ingo

