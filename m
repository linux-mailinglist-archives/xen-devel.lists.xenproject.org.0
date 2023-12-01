Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DF9E88001A8
	for <lists+xen-devel@lfdr.de>; Fri,  1 Dec 2023 03:34:28 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.645230.1007256 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r8tMC-0001LB-OH; Fri, 01 Dec 2023 02:34:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 645230.1007256; Fri, 01 Dec 2023 02:34:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r8tMC-0001JC-Le; Fri, 01 Dec 2023 02:34:20 +0000
Received: by outflank-mailman (input) for mailman id 645230;
 Fri, 01 Dec 2023 02:34:19 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=QmaB=HM=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1r8tMA-0001B4-Uq
 for xen-devel@lists.xenproject.org; Fri, 01 Dec 2023 02:34:18 +0000
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1f3c914f-8ff2-11ee-98e5-6d05b1d4d9a1;
 Fri, 01 Dec 2023 03:34:18 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 7A83CCE23DB;
 Fri,  1 Dec 2023 02:34:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AB501C433C8;
 Fri,  1 Dec 2023 02:34:13 +0000 (UTC)
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
X-Inumbo-ID: 1f3c914f-8ff2-11ee-98e5-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701398054;
	bh=x8mxYECTLAVxDVNbxafphEwTpQfKejz4k9Fd/a+Mdm4=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=aHSwDkSTvV/XrRHB66ltBK4VFVBf40ZN+Bw2r/JWinOt6EgB8VcxiG7FxwIzDOpDZ
	 VAy2IbSmStA8um7bpj3khjJ+s0q19EUROlFpxE9Iq7iGdbrgGdNv6i0raskG1isBva
	 1RCs0UFP2NB9Z966H0GM2ElxsKLB/dLVZ3KNl/QhCL9OK71M+gE6x9lMdEnWezrVTi
	 1gCDpwhnYVQPDbPKQpQ+HhOdfFt4jlBV/mwXJW5jxXSPT4V9MCk+pQ9a3ihPmrqy0f
	 BxUpAdoQUo7FWkj5q3pcx0LgF1rO5rZmWLPWct7yzexr2InfXQW3cj1zatnuOJ7tlJ
	 umlhH+fo/Gtrg==
Date: Thu, 30 Nov 2023 18:34:12 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Federico Serafini <federico.serafini@bugseng.com>
cc: xen-devel@lists.xenproject.org, consulting@bugseng.com, 
    Andrew Cooper <andrew.cooper3@citrix.com>, 
    George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>, 
    Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, 
    Wei Liu <wl@xen.org>
Subject: Re: [XEN PATCH 11/11] xen/serial: address a violation of MISRA C:2012
 Rule 8.2
In-Reply-To: <4f831a5441ac699b50783fb0559daabaa37b8e50.1700832962.git.federico.serafini@bugseng.com>
Message-ID: <alpine.DEB.2.22.394.2311301834040.110490@ubuntu-linux-20-04-desktop>
References: <cover.1700832962.git.federico.serafini@bugseng.com> <4f831a5441ac699b50783fb0559daabaa37b8e50.1700832962.git.federico.serafini@bugseng.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Fri, 24 Nov 2023, Federico Serafini wrote:
> Add missing parameter name. No functional change.
> 
> Signed-off-by: Federico Serafini <federico.serafini@bugseng.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>

