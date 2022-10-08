Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 98D605F85C5
	for <lists+xen-devel@lfdr.de>; Sat,  8 Oct 2022 17:13:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.418557.663402 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ohBVR-0000cS-T5; Sat, 08 Oct 2022 15:12:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 418557.663402; Sat, 08 Oct 2022 15:12:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ohBVR-0000ZH-Q1; Sat, 08 Oct 2022 15:12:49 +0000
Received: by outflank-mailman (input) for mailman id 418557;
 Sat, 08 Oct 2022 15:12:48 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=x/cu=2J=alien8.de=bp@srs-se1.protection.inumbo.net>)
 id 1ohBVG-0000Yd-5T
 for xen-devel@lists.xenproject.org; Sat, 08 Oct 2022 15:12:48 +0000
Received: from mail.skyhub.de (mail.skyhub.de [5.9.137.197])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a3910ff0-471b-11ed-964a-05401a9f4f97;
 Sat, 08 Oct 2022 17:12:35 +0200 (CEST)
Received: from nazgul.tnic (unknown [46.183.103.8])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.skyhub.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 4DFE01EC05B0;
 Sat,  8 Oct 2022 17:12:30 +0200 (CEST)
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
X-Inumbo-ID: a3910ff0-471b-11ed-964a-05401a9f4f97
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=dkim;
	t=1665241950;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:in-reply-to:in-reply-to:  references:references;
	bh=DYgRImUlP5sBAB0m+Fi/O5fIFHatVYNoMS9h40YOHco=;
	b=NkOfR/aWMdEV1z9XGZ2/WEYAky35KX2YfStKR//x78sVUpXeyC+sGuu3T9Zh09vBWI1C/X
	A9AOyivIJDLtZgMOzooIcg120y6SnGXYZoWlzlWjzrevFMtmpWkjC/S7u2OSXlig/PKlIe
	DfUmPNUpd3yffSBvtxuHwT3ZtoOVU2E=
Date: Sat, 8 Oct 2022 17:12:35 +0200
From: Borislav Petkov <bp@alien8.de>
To: Ross Philipson <ross.philipson@oracle.com>
Cc: linux-kernel@vger.kernel.org, x86@kernel.org,
	dpsmith@apertussolutions.com, tglx@linutronix.de, mingo@redhat.com,
	hpa@zytor.com, luto@amacapital.net, dave.hansen@linux.intel.com,
	kanth.ghatraju@oracle.com, trenchboot-devel@googlegroups.com,
	Jan Kiszka <jan.kiszka@siemens.com>, jailhouse-dev@googlegroups.com,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH 1/2] x86: Check return values from early_memremap calls
Message-ID: <Y0GTUg1ACpKZYMHY@nazgul.tnic>
References: <1650035401-22855-1-git-send-email-ross.philipson@oracle.com>
 <1650035401-22855-2-git-send-email-ross.philipson@oracle.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <1650035401-22855-2-git-send-email-ross.philipson@oracle.com>

Adding Xen and Jailhouse people and MLs to Cc.

Folks, thread starts here:

https://lore.kernel.org/r/1650035401-22855-1-git-send-email-ross.philipson@oracle.com

On Fri, Apr 15, 2022 at 11:10:00AM -0400, Ross Philipson wrote:
> There are a number of places where early_memremap is called
> but the return pointer is not checked for NULL. The call
> can result in a NULL being returned so the checks must
> be added.
> 
> Signed-off-by: Ross Philipson <ross.philipson@oracle.com>
> ---
>  arch/x86/kernel/devicetree.c | 10 ++++++++++
>  arch/x86/kernel/e820.c       |  5 +++++
>  arch/x86/kernel/jailhouse.c  |  6 ++++++
>  arch/x86/kernel/mpparse.c    | 23 +++++++++++++++++++++++
>  arch/x86/kernel/setup.c      |  5 +++++
>  arch/x86/xen/enlighten_hvm.c |  2 ++
>  arch/x86/xen/mmu_pv.c        |  8 ++++++++
>  arch/x86/xen/setup.c         |  2 ++
>  8 files changed, 61 insertions(+)

Ok, a couple of notes:

1. the pr_*("<prefix>:" ... )

thing is done using pr_fmt() - grep the tree for examples.

2. I think you should not panic() the machine but issue a the
warning/error and let the machine die a painful death anyway. But Xen
folks will know better what would be the optimal thing to do.

Thx.

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette

