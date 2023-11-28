Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BECBE7FB662
	for <lists+xen-devel@lfdr.de>; Tue, 28 Nov 2023 10:54:27 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.642858.1002618 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r7un5-0006qN-SF; Tue, 28 Nov 2023 09:54:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 642858.1002618; Tue, 28 Nov 2023 09:54:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r7un5-0006ny-Od; Tue, 28 Nov 2023 09:54:03 +0000
Received: by outflank-mailman (input) for mailman id 642858;
 Tue, 28 Nov 2023 09:54:02 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Oxj7=HJ=alien8.de=bp@srs-se1.protection.inumbo.net>)
 id 1r7un4-0006ns-HR
 for xen-devel@lists.xenproject.org; Tue, 28 Nov 2023 09:54:02 +0000
Received: from mail.alien8.de (mail.alien8.de [2a01:4f9:3051:3f93::2])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0d4eeead-8dd4-11ee-9b0e-b553b5be7939;
 Tue, 28 Nov 2023 10:53:59 +0100 (CET)
Received: from localhost (localhost.localdomain [127.0.0.1])
 by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id D8A4C40E01B1; 
 Tue, 28 Nov 2023 09:53:58 +0000 (UTC)
Received: from mail.alien8.de ([127.0.0.1])
 by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id bH8nQNUDPbpB; Tue, 28 Nov 2023 09:53:57 +0000 (UTC)
Received: from zn.tnic (pd95304da.dip0.t-ipconnect.de [217.83.4.218])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest
 SHA256) (No client certificate requested)
 by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 9763840E0195;
 Tue, 28 Nov 2023 09:53:34 +0000 (UTC)
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
X-Inumbo-ID: 0d4eeead-8dd4-11ee-9b0e-b553b5be7939
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=fail (4096-bit key)
	reason="fail (body has been altered)" header.d=alien8.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1701165236; bh=aoMnhTr7jFd65n5Bx4KqYKvZ0RjDqIT+i/qp/fJf9sY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=SDs4/28UNi7ssKZUpSxEQAK1JKNEFUDteBwUljeJdP1EjxfBr73XRShv17qhnE29j
	 Nf09IzxD+prQAm/Q4rOhBt85lPfBZiCTMRhQ9NoX5QIPwbFEix/+iBCG5+vxIOX98q
	 /NHeUoHAO18Of1mgtQH8/PuVEmf5Fb+rl0mDobbU5qiD7ptINcz2Eq73gPYwBCpH9C
	 qA9uASBrO9JaCtJT5E7ahhCs1Xie3EWLOLbdfWofmx5MGdX4g6Xwo2IHyGDRyw/So1
	 8UVeLkmc2VUZvqwlkbkNpjOoqkVxGhEcW7dgbGQtUoU+BaSRpcTEyZyFn58R0xAI7G
	 AjTaLWdZXbOi0lvAQE79lhCDmmqS+oLctYcxTJ82oWH0j5RPue1TUtCPisLSB3xEJZ
	 cMLZz3hOt6Np+xbUrFWqu3iZjOSrlFaxohNLV4uoAuto/1l8eJGgz9lFzdRTj+OdAT
	 FOHxijYdEySTKyj/1+Q/EKl3+WvDTXVazCchOy4n78gFYKZe8SiP7bmrdyIhdRcItk
	 DWXt4pwBXpMxosc56Zeo1QiMHBq5iDNcisNfkHf0Dk57xnhOlBt9kvuONbMGmiJ0RW
	 CEkO7XTK28htgUb78Jk8jfxji1wVzlYL7VOje+gqe5m1pSejuzet3rgDYLIblYpcfH
	 fFzIm7U20KE3ud/SyQRiGiIs=
Date: Tue, 28 Nov 2023 10:53:29 +0100
From: Borislav Petkov <bp@alien8.de>
To: Xin Li <xin3.li@intel.com>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-edac@vger.kernel.org, linux-hyperv@vger.kernel.org,
	kvm@vger.kernel.org, xen-devel@lists.xenproject.org,
	tglx@linutronix.de, mingo@redhat.com, dave.hansen@linux.intel.com,
	x86@kernel.org, hpa@zytor.com, luto@kernel.org, pbonzini@redhat.com,
	seanjc@google.com, peterz@infradead.org, jgross@suse.com,
	ravi.v.shankar@intel.com, mhiramat@kernel.org,
	andrew.cooper3@citrix.com, jiangshanlai@gmail.com,
	nik.borisov@suse.com
Subject: Re: [PATCH v12 20/37] x86/fred: Disallow the swapgs instruction when
 FRED is enabled
Message-ID: <20231128095329.GQZWW4mTdTdmhZ+wS4@fat_crate.local>
References: <20231003062458.23552-1-xin3.li@intel.com>
 <20231003062458.23552-21-xin3.li@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20231003062458.23552-21-xin3.li@intel.com>
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 02, 2023 at 11:24:41PM -0700, Xin Li wrote:
> +	 * Note, LKGS loads the GS base address into the IA32_KERNEL_GS_BASE
> +	 * MSR instead of the GS segment=E2=80=99s descriptor cache. As such,=
 the

:verify_diff: WARNING: Unicode char [=E2=80=99] (0x8217 in line: +     * =
MSR instead of the GS segment=E2=80=99s descriptor cache. As such, the

Just do a normal ' - char number 0x27.

--=20
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette

