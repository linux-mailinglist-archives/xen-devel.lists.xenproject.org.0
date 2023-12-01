Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 808D3800195
	for <lists+xen-devel@lfdr.de>; Fri,  1 Dec 2023 03:30:49 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.645219.1007227 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r8tId-000815-Md; Fri, 01 Dec 2023 02:30:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 645219.1007227; Fri, 01 Dec 2023 02:30:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r8tId-0007xt-Jm; Fri, 01 Dec 2023 02:30:39 +0000
Received: by outflank-mailman (input) for mailman id 645219;
 Fri, 01 Dec 2023 02:30:39 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=QmaB=HM=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1r8tId-0007xf-10
 for xen-devel@lists.xenproject.org; Fri, 01 Dec 2023 02:30:39 +0000
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9bd9f496-8ff1-11ee-98e5-6d05b1d4d9a1;
 Fri, 01 Dec 2023 03:30:37 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 9588CCE2572;
 Fri,  1 Dec 2023 02:30:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CD33FC433C7;
 Fri,  1 Dec 2023 02:30:29 +0000 (UTC)
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
X-Inumbo-ID: 9bd9f496-8ff1-11ee-98e5-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701397830;
	bh=x8mxYECTLAVxDVNbxafphEwTpQfKejz4k9Fd/a+Mdm4=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=EoQ3+7RSbKhXrnxw0SRKXnAhdL8NCGMAuJcxdcNy69dNGgvmb8IlaH/yH0lPr5vZd
	 js6qC1iorVyI9lRUgOkVjUyXRgjUP47VoM5YSeZPTeI7ob2eb6YEsONFevdBxoRWYa
	 GUah78qYME3QwkdNb0VYwrkgNpAxojdTvkP4rNC703ZvJojVMvj4Vr4i4j9Gr5BqX0
	 p1pAlymmCwBdDU9hu9PO647VGSo/FLxk0ANphuPg3vqr8C6Mwnu2BwgK+XsUeNU1gJ
	 0OHu/653lDbrDFHd+V/B7JDDHbYvTqLrbiYfJ6GF13O3ZcgOcYjtAmWFqB00HhsDVT
	 UVf+fB5jtl16g==
Date: Thu, 30 Nov 2023 18:30:28 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Federico Serafini <federico.serafini@bugseng.com>
cc: xen-devel@lists.xenproject.org, consulting@bugseng.com, 
    Andrew Cooper <andrew.cooper3@citrix.com>, 
    George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>, 
    Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, 
    Wei Liu <wl@xen.org>
Subject: Re: [XEN PATCH 08/11] xen/kernel: address a violation of MISRA C:2012
 Rule 8.2
In-Reply-To: <2f551139ef5a26b203c6c089947ca4bc5bd29d5a.1700832962.git.federico.serafini@bugseng.com>
Message-ID: <alpine.DEB.2.22.394.2311301830230.110490@ubuntu-linux-20-04-desktop>
References: <cover.1700832962.git.federico.serafini@bugseng.com> <2f551139ef5a26b203c6c089947ca4bc5bd29d5a.1700832962.git.federico.serafini@bugseng.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Fri, 24 Nov 2023, Federico Serafini wrote:
> Add missing parameter name. No functional change.
> 
> Signed-off-by: Federico Serafini <federico.serafini@bugseng.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>

