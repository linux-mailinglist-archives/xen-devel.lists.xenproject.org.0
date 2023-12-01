Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D5E978001A4
	for <lists+xen-devel@lfdr.de>; Fri,  1 Dec 2023 03:33:15 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.645225.1007236 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r8tKz-0000JM-7x; Fri, 01 Dec 2023 02:33:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 645225.1007236; Fri, 01 Dec 2023 02:33:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r8tKz-0000Fb-59; Fri, 01 Dec 2023 02:33:05 +0000
Received: by outflank-mailman (input) for mailman id 645225;
 Fri, 01 Dec 2023 02:33:04 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=QmaB=HM=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1r8tKy-0000FV-20
 for xen-devel@lists.xenproject.org; Fri, 01 Dec 2023 02:33:04 +0000
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f37cba53-8ff1-11ee-98e5-6d05b1d4d9a1;
 Fri, 01 Dec 2023 03:33:03 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by ams.source.kernel.org (Postfix) with ESMTP id A981CB842F8;
 Fri,  1 Dec 2023 02:33:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 30575C433C9;
 Fri,  1 Dec 2023 02:33:00 +0000 (UTC)
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
X-Inumbo-ID: f37cba53-8ff1-11ee-98e5-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701397981;
	bh=x8mxYECTLAVxDVNbxafphEwTpQfKejz4k9Fd/a+Mdm4=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=MkMADVuQ3cABT6fOko323wyPBVJsnnc2WLZBVOncj6J138i18a/7DqPNSDrsyx+LN
	 RY7mGXDjTCr8R+ZLBQCX0dp7URNFpNDfDyiBm9SJNdPS2lU0aR9EMb36Y6Uho+ZqBC
	 LO5aj1QZj/80DCWCMVTASd8BoICuoZgeyc37qFJZRL5Ur2KiBxccQ90ON+J1+JBhKI
	 DTQlOuPhWMMLadm84/WglyIao4y4T2mLbPaclMKKSwevhSYlVGH/VtbY53FEm7dvzF
	 cyMC4fYCu5r37vxwdyUVDe+/oF2n20zEEp1vVXPd4mFgJdrSzU8E3Kh6vN0luPPCYc
	 EocZWycr0DlnQ==
Date: Thu, 30 Nov 2023 18:32:58 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Federico Serafini <federico.serafini@bugseng.com>
cc: xen-devel@lists.xenproject.org, consulting@bugseng.com, 
    Andrew Cooper <andrew.cooper3@citrix.com>, 
    George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>, 
    Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, 
    Wei Liu <wl@xen.org>
Subject: Re: [XEN PATCH 09/11] xen/param: address a violation of MISRA C:2012
 Rule 8.2
In-Reply-To: <2ef34f3beec85dac126a89c6da1bbbdfaa00727d.1700832962.git.federico.serafini@bugseng.com>
Message-ID: <alpine.DEB.2.22.394.2311301832540.110490@ubuntu-linux-20-04-desktop>
References: <cover.1700832962.git.federico.serafini@bugseng.com> <2ef34f3beec85dac126a89c6da1bbbdfaa00727d.1700832962.git.federico.serafini@bugseng.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Fri, 24 Nov 2023, Federico Serafini wrote:
> Add missing parameter name. No functional change.
> 
> Signed-off-by: Federico Serafini <federico.serafini@bugseng.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>

