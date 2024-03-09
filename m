Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C3374876E79
	for <lists+xen-devel@lfdr.de>; Sat,  9 Mar 2024 02:20:39 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.690439.1076424 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rilNp-0006ov-GT; Sat, 09 Mar 2024 01:20:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 690439.1076424; Sat, 09 Mar 2024 01:20:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rilNp-0006ly-DN; Sat, 09 Mar 2024 01:20:17 +0000
Received: by outflank-mailman (input) for mailman id 690439;
 Sat, 09 Mar 2024 01:20:16 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=VWqy=KP=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1rilNo-0006lr-Gj
 for xen-devel@lists.xenproject.org; Sat, 09 Mar 2024 01:20:16 +0000
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2ddc47aa-ddb3-11ee-afdb-a90da7624cb6;
 Sat, 09 Mar 2024 02:20:15 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 801FDCE0FB5;
 Sat,  9 Mar 2024 01:20:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5FDFBC433F1;
 Sat,  9 Mar 2024 01:20:05 +0000 (UTC)
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
X-Inumbo-ID: 2ddc47aa-ddb3-11ee-afdb-a90da7624cb6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1709947206;
	bh=WTwP83cGz0XwSAiav32aPdOT6N9F7rICSXGaAvjCrPg=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=rTJ7yn0byvmRobP/aH1MmusZxIlPDU+2X+G5d7/e+JOOmrfMrL+ZWUnkACKmFuBhc
	 NMTRRpX16EspxMYlI92Q7M7vZKMj1CXC4I/++nac3r3F1phCnESZIrA+kMTL7q3sIl
	 ok1FAC2VDbgx/5NGbElVoEa2NNWeZ3IBfehGAvi7aXNy2lNLVrdjNfpX5pLhJYKi3/
	 LhM05yOYo/AZvFqTWFSTX7PFM8UnEDOKmLbsulNKgi2Ehz5iWbFTRuOYJjTQYxZ7Ga
	 XLp7FrXmRSL9ECPxjPZ7EBEJBIDb7/byzG0iELtZb5UEBA0XOLCRbd4VQviA5u5rGq
	 XtqncCE5reoPA==
Date: Fri, 8 Mar 2024 17:20:03 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Federico Serafini <federico.serafini@bugseng.com>
cc: xen-devel@lists.xenproject.org, consulting@bugseng.com, 
    Andrew Cooper <andrew.cooper3@citrix.com>, 
    George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>, 
    Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, 
    Wei Liu <wl@xen.org>
Subject: Re: [XEN PATCH] xen/evtchn: address violations of MISRA C:2012 Rules
 16.3 and 16.4
In-Reply-To: <3ec419e30227a8016c28e04524cd36a549aaddcf.1709898466.git.federico.serafini@bugseng.com>
Message-ID: <alpine.DEB.2.22.394.2403081719560.853156@ubuntu-linux-20-04-desktop>
References: <3ec419e30227a8016c28e04524cd36a549aaddcf.1709898466.git.federico.serafini@bugseng.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Fri, 8 Mar 2024, Federico Serafini wrote:
> Add missing break statements to address violations of MISRA C:2012
> Rule 16.3 ("An unconditional `break' statement shall terminate every
> switch-clause").
> 
> Add missing default cases to address violations of MISRA C:2012
> Rule 16.4 (Every `switch' statement shall have a `default' label).
> 
> No functional change.
> 
> Signed-off-by: Federico Serafini <federico.serafini@bugseng.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>


