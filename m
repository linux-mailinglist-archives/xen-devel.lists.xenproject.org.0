Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9022BA9DCD2
	for <lists+xen-devel@lfdr.de>; Sat, 26 Apr 2025 20:56:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.969320.1358480 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u8kh3-0003vr-BJ; Sat, 26 Apr 2025 18:56:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 969320.1358480; Sat, 26 Apr 2025 18:56:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u8kh3-0003tO-8M; Sat, 26 Apr 2025 18:56:05 +0000
Received: by outflank-mailman (input) for mailman id 969320;
 Sat, 26 Apr 2025 18:56:03 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=pqNG=XM=kernel.org=mingo@srs-se1.protection.inumbo.net>)
 id 1u8kh1-0003tI-GL
 for xen-devel@lists.xenproject.org; Sat, 26 Apr 2025 18:56:03 +0000
Received: from tor.source.kernel.org (tor.source.kernel.org
 [2600:3c04:e001:324:0:1991:8:25])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 167fe96f-22d0-11f0-9ffb-bf95429c2676;
 Sat, 26 Apr 2025 20:55:58 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id A4B2C6115D;
 Sat, 26 Apr 2025 18:55:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AAC84C4CEE2;
 Sat, 26 Apr 2025 18:55:52 +0000 (UTC)
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
X-Inumbo-ID: 167fe96f-22d0-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745693756;
	bh=F0vG+nDcCONKZs4e6RtOitQ9n8Mz1fjCVmRW/ho89E4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=C+3VZhA2rqQfpKTKP2m4yO0DolUCdMwEmkMYv15ph8vW2QWnr+dwsgrdPEDAa+XKU
	 cT+lBTivJUJbXq+YwDynrxuVGxxd7bxMoEAer2TcpR5Z/80KWu1DFGnJTMAWfaqwHp
	 Wt4Jx4tgNhuiLnQ6Uh2yFQ/qvjnnEMx6H4ogxz68sX4Wr+dcBgU5QN/U2h2Uj0/Z1G
	 PhGfSzqlUafQ7G0XaImHK804liJwS1k4ojK4L0zZghvVKYBfY33rV6LPviVBGb4Iu6
	 DYFyY1v4Quv3vP2Oe2ssiS64YmX/cVrSFbo0ye/YxMwYHLtMptqvYcMDxuiFBr260w
	 jjSeafo4hNDdA==
Date: Sat, 26 Apr 2025 20:55:50 +0200
From: Ingo Molnar <mingo@kernel.org>
To: "H. Peter Anvin" <hpa@zytor.com>
Cc: Arnd Bergmann <arnd@kernel.org>, Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
	Arnd Bergmann <arnd@arndb.de>, Juergen Gross <jgross@suse.com>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	Alexander Usyskin <alexander.usyskin@intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Mateusz =?utf-8?Q?Jo=C5=84czyk?= <mat.jonczyk@o2.pl>,
	"Mike Rapoport (Microsoft)" <rppt@kernel.org>,
	Ard Biesheuvel <ardb@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>, linux-kernel@vger.kernel.org,
	xen-devel@lists.xenproject.org,
	Linus Torvalds <torvalds@linux-foundation.org>
Subject: Re: [PATCH] [RFC] x86/cpu: rework instruction set selection
Message-ID: <aA0sNu0gcjlvhlDT@gmail.com>
References: <20250425141740.734030-1-arnd@kernel.org>
 <aAyiganPp_UsNlnZ@gmail.com>
 <E130C6F4-5602-44E6-ABB0-B87B389C0026@zytor.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <E130C6F4-5602-44E6-ABB0-B87B389C0026@zytor.com>


* H. Peter Anvin <hpa@zytor.com> wrote:

> Dropping CMOV would mean dropping P5 support.

Yeah, I think we should make the cutoff at the 686 level. Is there any 
strong reason not to do that? Stable kernels will still exist for a 
very long time for ancient boards.

	Ingo

