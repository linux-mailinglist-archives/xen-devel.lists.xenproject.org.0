Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BF7C337311
	for <lists+xen-devel@lfdr.de>; Thu, 11 Mar 2021 13:51:56 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.96505.182601 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lKKn4-0001c9-3u; Thu, 11 Mar 2021 12:51:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 96505.182601; Thu, 11 Mar 2021 12:51:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lKKn4-0001bk-0Y; Thu, 11 Mar 2021 12:51:46 +0000
Received: by outflank-mailman (input) for mailman id 96505;
 Thu, 11 Mar 2021 12:51:44 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=9Hah=IJ=alien8.de=bp@srs-us1.protection.inumbo.net>)
 id 1lKKn2-0001be-N9
 for xen-devel@lists.xenproject.org; Thu, 11 Mar 2021 12:51:44 +0000
Received: from mail.skyhub.de (unknown [5.9.137.197])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 25202adc-3f65-476c-b913-7477a525a103;
 Thu, 11 Mar 2021 12:51:42 +0000 (UTC)
Received: from zn.tnic (p200300ec2f0e1f0084acfb80b2ea2480.dip0.t-ipconnect.de
 [IPv6:2003:ec:2f0e:1f00:84ac:fb80:b2ea:2480])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.skyhub.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id F0EBC1EC04CB;
 Thu, 11 Mar 2021 13:51:41 +0100 (CET)
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
X-Inumbo-ID: 25202adc-3f65-476c-b913-7477a525a103
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=dkim;
	t=1615467102;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:in-reply-to:in-reply-to:  references:references;
	bh=04Q81L86Yi8VhtfgMy5DPhkMLlrDvgeVfznIwom2C0o=;
	b=F7I4zNkFealftdt3MSO2iENkOoJ7233iIBl0MIA2fExAwgTg9QWD88MEO8x3MFz8dHZN3+
	qEbWBRHl1mcXsYMgEMA1pRva0r+EgUrrobNzE1xqTPoZc3Vv+WQhSag3viC4Y2uSFgaf4T
	ID5ejVj1usJOEZ1VFcDtbCWF5MkzXrk=
Date: Thu, 11 Mar 2021 13:51:43 +0100
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
Message-ID: <20210311125143.GC5829@zn.tnic>
References: <20210309134813.23912-1-jgross@suse.com>
 <20210311125026.GB5829@zn.tnic>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20210311125026.GB5829@zn.tnic>

On Thu, Mar 11, 2021 at 01:50:26PM +0100, Borislav Petkov wrote:
> and move the cleanups patches 13 and 14 to the beginning of the set?

Yeah, 14 needs ALTERNATIVE_TERNARY so I guess after patch 5, that is.

Thx.

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette

