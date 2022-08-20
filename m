Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F50E59AD31
	for <lists+xen-devel@lfdr.de>; Sat, 20 Aug 2022 12:29:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.390759.628319 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oPLia-0002JU-W3; Sat, 20 Aug 2022 10:28:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 390759.628319; Sat, 20 Aug 2022 10:28:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oPLia-0002Gh-SR; Sat, 20 Aug 2022 10:28:40 +0000
Received: by outflank-mailman (input) for mailman id 390759;
 Sat, 20 Aug 2022 10:28:39 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=wiTl=YY=linuxfoundation.org=gregkh@srs-se1.protection.inumbo.net>)
 id 1oPLiZ-0002Gb-OX
 for xen-devel@lists.xenproject.org; Sat, 20 Aug 2022 10:28:39 +0000
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d9d951c2-2072-11ed-9250-1f966e50362f;
 Sat, 20 Aug 2022 12:28:37 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 6CD61B80B91;
 Sat, 20 Aug 2022 10:28:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 057D7C433D7;
 Sat, 20 Aug 2022 10:28:33 +0000 (UTC)
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
X-Inumbo-ID: d9d951c2-2072-11ed-9250-1f966e50362f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1660991315;
	bh=BfeRXrXK+kyAATA3rrD7DNtJBTOICyTG3ENmWC40kJw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=U2H3QtvFpVNEciH1WtySMYZsnaQJiuDNmwW3V8xZkYT0ZwMVQwgnWnt304CfGooPp
	 aTkiOPAOoJlTo1251krr6e2ou6u9aRZh9DGgCurLraTPBUEGpOnbRcf5PPZBrQc6Jo
	 fSRSefBXYORAQKflTiQq00j82dOzqK/iVSrPGuLc=
Date: Sat, 20 Aug 2022 12:28:42 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Juergen Gross <jgross@suse.com>
Cc: xen-devel@lists.xenproject.org, x86@kernel.org,
	linux-kernel@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"H. Peter Anvin" <hpa@zytor.com>, stable@vger.kernel.org
Subject: Re: [PATCH v2 01/10] x86/mtrr: fix MTRR fixup on APs
Message-ID: <YwC3Wmj2Fq11EWVg@kroah.com>
References: <20220820092533.29420-1-jgross@suse.com>
 <20220820092533.29420-2-jgross@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220820092533.29420-2-jgross@suse.com>

On Sat, Aug 20, 2022 at 11:25:24AM +0200, Juergen Gross wrote:
> When booting or resuming the system MTRR state is saved on the boot
> processor and then this state is loaded into MTRRs of all other cpus.
> During update of the MTRRs the MTRR mechanism needs to be disabled by
> writing the related MSR. The old contents of this MSR are saved in a
> set of static variables and later those static variables are used to
> restore the MSR.
> 
> In case the MSR contents need to be modified on a cpu due to the MSR
> not having been initialized properly by the BIOS, the related update
> function is modifying the static variables accordingly.
> 
> Unfortunately the MTRR state update is usually running on all cpus
> at the same time, so using just one set of static variables for all
> cpus is racy in case the MSR contents differ across cpus.
> 
> Fix that by using percpu variables for saving the MSR contents.
> 
> Cc: stable@vger.kernel.org
> Signed-off-by: Juergen Gross <jgross@suse.com>
> ---
> I thought adding a "Fixes:" tag for the kernel's initial git commit
> would maybe be entertaining, but without being really helpful.

So that means I will just do a "best guess" as to how far to backport
things.  Hopefully I guess well...

thanks,

greg k-h

