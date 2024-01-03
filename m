Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F7FE822BDE
	for <lists+xen-devel@lfdr.de>; Wed,  3 Jan 2024 12:12:36 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.660937.1030632 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rKz9a-0000S8-H2; Wed, 03 Jan 2024 11:11:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 660937.1030632; Wed, 03 Jan 2024 11:11:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rKz9a-0000Q7-DP; Wed, 03 Jan 2024 11:11:18 +0000
Received: by outflank-mailman (input) for mailman id 660937;
 Wed, 03 Jan 2024 11:11:17 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=AhKI=IN=alien8.de=bp@srs-se1.protection.inumbo.net>)
 id 1rKz9Z-0000PF-MQ
 for xen-devel@lists.xenproject.org; Wed, 03 Jan 2024 11:11:17 +0000
Received: from mail.alien8.de (mail.alien8.de [2a01:4f9:3051:3f93::2])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id cd5e586d-aa28-11ee-98ef-6d05b1d4d9a1;
 Wed, 03 Jan 2024 12:11:14 +0100 (CET)
Received: from localhost (localhost.localdomain [127.0.0.1])
 by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id 3C69140E0198; 
 Wed,  3 Jan 2024 11:11:09 +0000 (UTC)
Received: from mail.alien8.de ([127.0.0.1])
 by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id r8QeUS3cq4S7; Wed,  3 Jan 2024 11:11:06 +0000 (UTC)
Received: from zn.tnic (pd9530f8c.dip0.t-ipconnect.de [217.83.15.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest
 SHA256) (No client certificate requested)
 by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 5A60640E01C5;
 Wed,  3 Jan 2024 11:10:42 +0000 (UTC)
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
X-Inumbo-ID: cd5e586d-aa28-11ee-98ef-6d05b1d4d9a1
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
	header.d=alien8.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1704280265; bh=EvFqA3G5zQt9g3fKMcrj1bE1ehqHXcw6mBCV4JtQWIw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=YKx6rgmbRhf22e3UsoUMcNKqmDR9RA/CD4yEkGpCYrErsbXxbT093dcqKmHSXdCxP
	 LkV5RQUGPWUCaejPCF3Kii2sVRFCL6Ife0SQcbk/8riaTljlOgWrHDozGPvhXuMQ2Z
	 yrL1E2HjpBrhuJW5FL4SxiSpRIYBOe6dJQaJKf6Ey/TH8I8ge5eK0TaF3DTcYUNhDt
	 oGb9rlDwR0GwE/5PPWN+Os+Yzo7r6DIJhAnt/Sekwu4ny/9UIsed3mK9aY7600geYW
	 i+seCwzXQuNGD3cYPWTyVS+XXc1d97MVR55ACNC+oaCH3PbfpIMTt+mG4Ijn9mYUnu
	 VUgjl6O1JRCSGUKJti7cgFoq5U2YRjpSppqv/Osyg6KRB5o2iCzjhDYQgGN7cCiSgZ
	 8E+iqSF4BwVsT+BC9K+6T9yBaHR1X5L+92QxzXJxMXUpG972F0wzoU58pOCYjAM+Pl
	 4NS3GqFoyhlzvGRpQld7IsAVbL7dRzLolISmTSe2nb4QprN3lUPKZfn4oQ8e0ArEVN
	 Z2IAapg2TGR72DOeBBkP3nEIrf13tLIWGJ+k0w6AwCMT+EwZbfpnVHR/ciaBsCsM1C
	 StHl+kOjaXHS/aeOEPojCmdVHu8iupHgvOTjK3mRe9BVvjET2p1qSAIXIOxXZsKQmK
	 2dRfDvvHVHlh3jHhVZQrvpkA=
Date: Wed, 3 Jan 2024 12:10:36 +0100
From: Borislav Petkov <bp@alien8.de>
To: "Li, Xin3" <xin3.li@intel.com>
Cc: "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-edac@vger.kernel.org" <linux-edac@vger.kernel.org>,
	"linux-hyperv@vger.kernel.org" <linux-hyperv@vger.kernel.org>,
	"kvm@vger.kernel.org" <kvm@vger.kernel.org>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	"tglx@linutronix.de" <tglx@linutronix.de>,
	"mingo@redhat.com" <mingo@redhat.com>,
	"dave.hansen@linux.intel.com" <dave.hansen@linux.intel.com>,
	"x86@kernel.org" <x86@kernel.org>, "hpa@zytor.com" <hpa@zytor.com>,
	"Lutomirski, Andy" <luto@kernel.org>,
	"pbonzini@redhat.com" <pbonzini@redhat.com>,
	"seanjc@google.com" <seanjc@google.com>,
	"peterz@infradead.org" <peterz@infradead.org>,
	"jgross@suse.com" <jgross@suse.com>,
	"Shankar, Ravi V" <ravi.v.shankar@intel.com>,
	"mhiramat@kernel.org" <mhiramat@kernel.org>,
	"andrew.cooper3@citrix.com" <andrew.cooper3@citrix.com>,
	"jiangshanlai@gmail.com" <jiangshanlai@gmail.com>,
	"nik.borisov@suse.com" <nik.borisov@suse.com>,
	"Kang, Shan" <shan.kang@intel.com>
Subject: Re: [PATCH v13 01/35] x86/cpufeatures,opcode,msr: Add the WRMSRNS
 instruction support
Message-ID: <20240103111036.GCZZVArGsoHdPauDFs@fat_crate.local>
References: <20231205105030.8698-1-xin3.li@intel.com>
 <20231205105030.8698-2-xin3.li@intel.com>
 <20240102153426.GBZZQtAiWSdGAgKoIL@fat_crate.local>
 <SA1PR11MB67348F79B44BE92FD2C8F12DA861A@SA1PR11MB6734.namprd11.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <SA1PR11MB67348F79B44BE92FD2C8F12DA861A@SA1PR11MB6734.namprd11.prod.outlook.com>

On Tue, Jan 02, 2024 at 10:06:27PM +0000, Li, Xin3 wrote:
> Do I need to send an updated patch?

> Or just leave it to the maintainer who is going to take care of it?

While waiting, please take a look at this:

https://kernel.org/doc/html/latest/process/submitting-patches.html#don-t-get-discouraged-or-impatient

Might want to read the whole doc too.

But to answer your question: you wait a few weeks and collect all
comments and review feedback that you've received and incorporate them
into the patchset.

Then, after the time passes you send a new revision and explain in the
0th message what has changed.

Ok?

Thx.

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette

