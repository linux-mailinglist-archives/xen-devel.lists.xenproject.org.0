Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 07A3D821ECA
	for <lists+xen-devel@lfdr.de>; Tue,  2 Jan 2024 16:35:20 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.660736.1030307 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rKgnI-0007Hq-8d; Tue, 02 Jan 2024 15:35:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 660736.1030307; Tue, 02 Jan 2024 15:35:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rKgnI-0007F9-5J; Tue, 02 Jan 2024 15:35:04 +0000
Received: by outflank-mailman (input) for mailman id 660736;
 Tue, 02 Jan 2024 15:35:02 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=yTtD=IM=alien8.de=bp@srs-se1.protection.inumbo.net>)
 id 1rKgnF-0007Ez-VX
 for xen-devel@lists.xenproject.org; Tue, 02 Jan 2024 15:35:02 +0000
Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7d53a83c-a984-11ee-9b0f-b553b5be7939;
 Tue, 02 Jan 2024 16:35:00 +0100 (CET)
Received: from localhost (localhost.localdomain [127.0.0.1])
 by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id 8709340E0171; 
 Tue,  2 Jan 2024 15:34:57 +0000 (UTC)
Received: from mail.alien8.de ([127.0.0.1])
 by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id E4pJd0VlcEXb; Tue,  2 Jan 2024 15:34:55 +0000 (UTC)
Received: from zn.tnic (pd9530f8c.dip0.t-ipconnect.de [217.83.15.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest
 SHA256) (No client certificate requested)
 by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 661D840E0191;
 Tue,  2 Jan 2024 15:34:31 +0000 (UTC)
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
X-Inumbo-ID: 7d53a83c-a984-11ee-9b0f-b553b5be7939
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
	header.d=alien8.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1704209694; bh=AFlNAs1eTyy0BO95pQ2N7wyFVzTaEas2yI1v/Adat8k=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=d8TtmPOAiItQ4yR0tJO0GMvu0OoyPQwEUd5BFlrnpX8H7UdXl82/LACGiyqsrOsPP
	 HG4wHYqNoXUWPAZ02jeYSaysgqwVHotJBk4GL954LxUvMd8aty8Bx0Z18h+mQkFCom
	 WfqPrMr+rDCFaZjkU3Va3Ig0rdHwEe1FS/C/WURxOJZCnPNqcKeHB510oyqWEY1e1q
	 DF7uPwIfh8Qb7wnzAaGaWLRCgDetMJKMaeS71XEcFxH9eOwyYNH9XTn1YKCzzHKEVE
	 gicvKn8vIBGHvBCkU8aQ5IiHWdbSsUBym1NzBrExwAt3xxSi7PUvtP/e1KlMOhfeEg
	 cGD71cet6qH2D8gjTMdwtK3i29cI71MVQCa2P/F/hKf/KjhG9pYs51oai7RYWAcVLg
	 Jks2gnt/TFS17V/nUewsNAAbrepP0EZBfAmsoMopLzFQUdxsn6kAsRhb+mUI0rFp2y
	 T8ioePBl5ZQq0MkZS8KIb6b7acGAMzigjd9xu5x+P1/LCXGnfBS9vnDQBSPpygAWFZ
	 G8ywQ9Ez+SvCBQcHqYoBE4VxV1yYRd1nJktrtxaVPBpiaOY3p5wNRsi+bo33MuQnJd
	 VjGqKbCIrCBdsphTPg0PiCGge+AkwjuGqyujKUXD6Mk/1GqTjnUxre6DtuWbmZvusm
	 b6tfbgHO44zTLM5K+pBI+cvM=
Date: Tue, 2 Jan 2024 16:34:26 +0100
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
	nik.borisov@suse.com, shan.kang@intel.com
Subject: Re: [PATCH v13 01/35] x86/cpufeatures,opcode,msr: Add the WRMSRNS
 instruction support
Message-ID: <20240102153426.GBZZQtAiWSdGAgKoIL@fat_crate.local>
References: <20231205105030.8698-1-xin3.li@intel.com>
 <20231205105030.8698-2-xin3.li@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20231205105030.8698-2-xin3.li@intel.com>

On Tue, Dec 05, 2023 at 02:49:50AM -0800, Xin Li wrote:

> Subject: Re: [PATCH v13 01/35] x86/cpufeatures,opcode,msr: Add the WRMSRNS instruction support

Or simply "x86/fred: Add ... "

Other than that,

Acked-by: Borislav Petkov (AMD) <bp@alien8.de>

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette

