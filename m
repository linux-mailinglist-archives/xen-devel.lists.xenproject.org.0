Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 96CBC337308
	for <lists+xen-devel@lfdr.de>; Thu, 11 Mar 2021 13:50:59 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.96502.182589 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lKKlw-0001Ug-PH; Thu, 11 Mar 2021 12:50:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 96502.182589; Thu, 11 Mar 2021 12:50:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lKKlw-0001UH-Lw; Thu, 11 Mar 2021 12:50:36 +0000
Received: by outflank-mailman (input) for mailman id 96502;
 Thu, 11 Mar 2021 12:50:35 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=9Hah=IJ=alien8.de=bp@srs-us1.protection.inumbo.net>)
 id 1lKKlu-0001UC-0V
 for xen-devel@lists.xenproject.org; Thu, 11 Mar 2021 12:50:35 +0000
Received: from mail.skyhub.de (unknown [5.9.137.197])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id c3c2bec7-f378-4a0e-a51a-db0aa51b48c9;
 Thu, 11 Mar 2021 12:50:31 +0000 (UTC)
Received: from zn.tnic (p200300ec2f0e1f0084acfb80b2ea2480.dip0.t-ipconnect.de
 [IPv6:2003:ec:2f0e:1f00:84ac:fb80:b2ea:2480])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.skyhub.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 570341EC04C0;
 Thu, 11 Mar 2021 13:50:30 +0100 (CET)
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
X-Inumbo-ID: c3c2bec7-f378-4a0e-a51a-db0aa51b48c9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=dkim;
	t=1615467030;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:in-reply-to:in-reply-to:  references:references;
	bh=YQoMnM+JalduchtvnnRdDi537/sQjYe69dpZBUUIePI=;
	b=oOGUaSre4XzUs+lxkz7FD2kSZBN8NksBkfckW/+qTHl8JbaxYlJ6NN8Mbc1R2n11m55CFf
	P73fj+xpCfOCQDtCPXJIYK1D6MwZPiXIwvgaAfFGUGzDJZaZCXkLGAHUC5DtKeJD/Osqtp
	IAS+CcgMs7OmmLqg6Q3uUtquB4Svgws=
Date: Thu, 11 Mar 2021 13:50:26 +0100
From: Borislav Petkov <bp@alien8.de>
To: Juergen Gross <jgross@suse.com>
Cc: xen-devel@lists.xenproject.org, linux-kernel@vger.kernel.org,
	x86@kernel.org, virtualization@lists.linux-foundation.org,
	linux-arm-kernel@lists.infradead.org, linux-hyperv@vger.kernel.org,
	kvm@vger.kernel.org, clang-built-linux@googlegroups.com,
	Peter Zijlstra <peterz@infradead.org>,
	Josh Poimboeuf <jpoimboe@redhat.com>,
	Jason Baron <jbaron@akamai.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Ard Biesheuvel <ardb@kernel.org>, Deep Shah <sdeep@vmware.com>,
	"VMware, Inc." <pv-drivers@vmware.com>,
	Russell King <linux@armlinux.org.uk>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>, "H. Peter Anvin" <hpa@zytor.com>,
	"K. Y. Srinivasan" <kys@microsoft.com>,
	Haiyang Zhang <haiyangz@microsoft.com>,
	Stephen Hemminger <sthemmin@microsoft.com>,
	Wei Liu <wei.liu@kernel.org>, Paolo Bonzini <pbonzini@redhat.com>,
	Sean Christopherson <seanjc@google.com>,
	Vitaly Kuznetsov <vkuznets@redhat.com>,
	Wanpeng Li <wanpengli@tencent.com>,
	Jim Mattson <jmattson@google.com>, Joerg Roedel <joro@8bytes.org>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Andy Lutomirski <luto@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>
Subject: Re: [PATCH v6 00/12] x86: major paravirt cleanup
Message-ID: <20210311125026.GB5829@zn.tnic>
References: <20210309134813.23912-1-jgross@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20210309134813.23912-1-jgross@suse.com>

On Tue, Mar 09, 2021 at 02:48:01PM +0100, Juergen Gross wrote:
> This is a major cleanup of the paravirt infrastructure aiming at
> eliminating all custom code patching via paravirt patching.
> 
> This is achieved by using ALTERNATIVE instead, leading to the ability
> to give objtool access to the patched in instructions.
> 
> In order to remove most of the 32-bit special handling from pvops the
> time related operations are switched to use static_call() instead.
> 
> At the end of this series all paravirt patching has to do is to
> replace indirect calls with direct ones. In a further step this could
> be switched to static_call(), too.
> 
> Changes in V6:
> - switched back to "not" bit in feature value for "not feature"
> - other minor comments addressed

Ok, looks real good, the simplification is amazing! :)

Can you please redo with the minor nits addressed ontop of the
tip:x86/alternatives branch:

https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git/log/?h=x86/alternatives

and move the cleanups patches 13 and 14 to the beginning of the set?

Thx.

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette

