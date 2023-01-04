Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A867065D1F7
	for <lists+xen-devel@lfdr.de>; Wed,  4 Jan 2023 13:00:24 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.471137.730866 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pD2QE-0003W8-U0; Wed, 04 Jan 2023 11:59:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 471137.730866; Wed, 04 Jan 2023 11:59:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pD2QE-0003UJ-Qr; Wed, 04 Jan 2023 11:59:06 +0000
Received: by outflank-mailman (input) for mailman id 471137;
 Wed, 04 Jan 2023 11:59:05 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=LX0w=5B=alien8.de=bp@srs-se1.protection.inumbo.net>)
 id 1pD2Q3-0003UA-HG
 for xen-devel@lists.xenproject.org; Wed, 04 Jan 2023 11:59:05 +0000
Received: from mail.skyhub.de (mail.skyhub.de [5.9.137.197])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 285a2951-8c27-11ed-b8d0-410ff93cb8f0;
 Wed, 04 Jan 2023 12:58:53 +0100 (CET)
Received: from zn.tnic (p5de8e9fe.dip0.t-ipconnect.de [93.232.233.254])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.skyhub.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 18EC91EC008F;
 Wed,  4 Jan 2023 12:58:52 +0100 (CET)
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
X-Inumbo-ID: 285a2951-8c27-11ed-b8d0-410ff93cb8f0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=dkim;
	t=1672833532;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:in-reply-to:in-reply-to:  references:references;
	bh=UKl/CVF+4GJS0LDdyX728sU1J1aGkocy2OklfcAdRtI=;
	b=VcttLkPNy9K1xNdWfFV7Yz0KEUwXXic9v2XG1jbmKgXxKVSo4wcHOiMPPS/Y09Wr2p5SCF
	2pmDtdw/423IjVUdnSQ/yOxlJdQFacJj5lXUfKDExPe/KfWSxHLfgoaUswfq1pSyDkPKwR
	+8kZx8fwKmnCVLzKEVBMtns1UtQy+9g=
Date: Wed, 4 Jan 2023 12:58:48 +0100
From: Borislav Petkov <bp@alien8.de>
To: Dave Hansen <dave.hansen@intel.com>
Cc: Ross Philipson <ross.philipson@oracle.com>,
	linux-kernel@vger.kernel.org, x86@kernel.org,
	dpsmith@apertussolutions.com, tglx@linutronix.de, mingo@redhat.com,
	hpa@zytor.com, luto@amacapital.net, dave.hansen@linux.intel.com,
	kanth.ghatraju@oracle.com, trenchboot-devel@googlegroups.com,
	jailhouse-dev@googlegroups.com, jan.kiszka@siemens.com,
	xen-devel@lists.xenproject.org, jgross@suse.com,
	boris.ostrovsky@oracle.com, andrew.cooper3@citrix.com
Subject: Re: [PATCH v2 1/2] x86: Check return values from early_memremap calls
Message-ID: <Y7Vp+EPq5wkGr5mi@zn.tnic>
References: <20221110154521.613472-1-ross.philipson@oracle.com>
 <20221110154521.613472-2-ross.philipson@oracle.com>
 <8e62a029-f2fa-0627-1f71-4850a68ec6b6@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <8e62a029-f2fa-0627-1f71-4850a68ec6b6@intel.com>

On Thu, Nov 10, 2022 at 08:07:53AM -0800, Dave Hansen wrote:
> On 11/10/22 07:45, Ross Philipson wrote:
> >  	dt = early_memremap(initial_dtb, map_len);
> > +	if (!dt) {
> > +		pr_warn("failed to memremap initial dtb\n");
> > +		return;
> > +	}
> 
> Are all of these new pr_warn/err()'s really adding much value?  They all
> look pretty generic.  It makes me wonder if we should just spit out a
> generic message in early_memremap() and save all the callers the trouble.

Well, let's see.

early_memremap() calls __early_ioremap() and that one already warns befofe each
NULL return. So I guess we don't need the error messages as we will know where
it starts failing.

I guess we still need the error handling though.

I.e., this above should be:

    dt = early_memremap(initial_dtb, map_len);
+   if (!dt)
+           return;

so that we don't go off into the weeds with a NULL ptr.

Or?

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette

