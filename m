Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 12DEA6755A7
	for <lists+xen-devel@lfdr.de>; Fri, 20 Jan 2023 14:21:36 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.481769.746880 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pIrKT-0005s3-MH; Fri, 20 Jan 2023 13:21:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 481769.746880; Fri, 20 Jan 2023 13:21:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pIrKT-0005on-JC; Fri, 20 Jan 2023 13:21:13 +0000
Received: by outflank-mailman (input) for mailman id 481769;
 Fri, 20 Jan 2023 13:21:12 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=JBPl=5R=8bytes.org=joro@srs-se1.protection.inumbo.net>)
 id 1pIrKS-0005od-Ad
 for xen-devel@lists.xenproject.org; Fri, 20 Jan 2023 13:21:12 +0000
Received: from mail.8bytes.org (mail.8bytes.org [85.214.250.239])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTP
 id 4b99257b-98c5-11ed-b8d1-410ff93cb8f0;
 Fri, 20 Jan 2023 14:21:06 +0100 (CET)
Received: from 8bytes.org
 (p200300c27714bc0086ad4f9d2505dd0d.dip0.t-ipconnect.de
 [IPv6:2003:c2:7714:bc00:86ad:4f9d:2505:dd0d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.8bytes.org (Postfix) with ESMTPSA id 583BB262AD8;
 Fri, 20 Jan 2023 13:43:51 +0100 (CET)
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
X-Inumbo-ID: 4b99257b-98c5-11ed-b8d1-410ff93cb8f0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=8bytes.org;
	s=default; t=1674218631;
	bh=sZNmqKbvZoiovCzlI6WBiaIn/1uSYIe/nS6jVFFARMs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=IPQE8Zu4cQksOFQUyswavYY4LJUrlMt8lxJm+3ahDYd+mZFXwGtyKeIQiaTg9xx6t
	 XoR/R4zuZsPcWpd9otIOIqrWFKbf0GyoVlPAjf7IhQpqGh1zw08+91/R5sFqDlxF36
	 6X3Iigbgw0xZG1NFBkWTE/fIj3zY1tK+FSVOC7yBrZtGOWxNW+nsLLmSbs+C4H1kP3
	 mk9MA5YIesE4zA1Aabvkey/nokvwF4sQaoft0Cm4GSIXGJ1MS3iEJ2sPjAATJGGzkB
	 SZ5XVMlEyaoXBpIi4mwhOn4QXQHrOE8MkL0RbA3pDV9iCa5bFlLis+fL7yqLWrCJNZ
	 IVfun9JOL6CwQ==
Date: Fri, 20 Jan 2023 13:43:50 +0100
From: =?iso-8859-1?Q?J=F6rg_R=F6del?= <joro@8bytes.org>
To: Borislav Petkov <bp@alien8.de>
Cc: Peter Zijlstra <peterz@infradead.org>, x86@kernel.org,
	Joan Bruguera <joanbrugueram@gmail.com>,
	linux-kernel@vger.kernel.org, Juergen Gross <jgross@suse.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	xen-devel <xen-devel@lists.xenproject.org>,
	Jan Beulich <jbeulich@suse.com>,
	Roger Pau Monne <roger.pau@citrix.com>,
	Kees Cook <keescook@chromium.org>, mark.rutland@arm.com,
	Andrew Cooper <Andrew.Cooper3@citrix.com>,
	"H. Peter Anvin" <hpa@zytor.com>
Subject: Re: [PATCH v2 2/7] x86/boot: Delay sev_verify_cbit() a bit
Message-ID: <Y8qMhhEOA6MuGMxm@8bytes.org>
References: <20230116142533.905102512@infradead.org>
 <20230116143645.649204101@infradead.org>
 <Y8lDN73cNOmNuciV@zn.tnic>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y8lDN73cNOmNuciV@zn.tnic>

On Thu, Jan 19, 2023 at 02:18:47PM +0100, Borislav Petkov wrote:
> So, can we do that C-bit verification once on the BSP, *in C* which would be a
> lot easier, and be done with it?
> 
> Once it is verified there, the bit is the same on all APs so all good.

Yes, I think this is safe to do. The page-table the APs will use to boot
already has the correct C-bit set, and the position is verified on the
BSP. Further, the C-bit position is a hardware capability and there is
no chance the APs will have it at a different position than the BSP.

Even if the HV is lying to the VM by faking CPUID on the APs it wouldn't
matter, because the position is not read again on the APs.

Regards,

	Joerg

