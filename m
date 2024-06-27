Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CFF72919C2E
	for <lists+xen-devel@lfdr.de>; Thu, 27 Jun 2024 02:55:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.749612.1157836 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sMdQ7-0008Op-0k; Thu, 27 Jun 2024 00:55:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 749612.1157836; Thu, 27 Jun 2024 00:55:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sMdQ6-0008NL-Tm; Thu, 27 Jun 2024 00:55:26 +0000
Received: by outflank-mailman (input) for mailman id 749612;
 Thu, 27 Jun 2024 00:55:26 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=iDhR=N5=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1sMdQ6-0008NF-3U
 for xen-devel@lists.xenproject.org; Thu, 27 Jun 2024 00:55:26 +0000
Received: from sin.source.kernel.org (sin.source.kernel.org
 [2604:1380:40e1:4800::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ee33b6fd-341f-11ef-b4bb-af5377834399;
 Thu, 27 Jun 2024 02:55:23 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 0B77DCE222A;
 Thu, 27 Jun 2024 00:55:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7D62CC32789;
 Thu, 27 Jun 2024 00:55:19 +0000 (UTC)
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
X-Inumbo-ID: ee33b6fd-341f-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719449720;
	bh=zZnZwC46Z2xbYQdZe3lnTPq1ZWcb/3vtNaAOa5Zfxko=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=rrN1QaxJsfj2HKHxN76bmZ4rdwASn9oT4o72qFpg7d2xxwRMZ7a7d1mnoBBpmnmO6
	 /PBZQ6LMJj6MPufCzqmUWpEq6lK6S0BjnD7v7YBimalMrxJNBSe8CVA1i206AE5Jf6
	 lXicOBoch6yI0zcncgEMBQC/5Zpik3zaVNOkb5Puym4T0lJNK5LqV5jUN6oAkJKRY/
	 dDFcSue729Qi4Il8c188sfS/BU4f6uuBbHsoInUr/k00AZEYsvuhA+yc1S31Db5XCy
	 snBnAAnLPqtieg7M3VBgCnWRsrTrNegJu/4IUNAuMFx1Yo+ArQuwvXYdgsSfF2HJkj
	 X1GA30C7ADhvw==
Date: Wed, 26 Jun 2024 17:55:18 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Federico Serafini <federico.serafini@bugseng.com>
cc: xen-devel@lists.xenproject.org, consulting@bugseng.com, 
    Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Subject: Re: [XEN PATCH v3 07/12] x86/hvm: address violations of MISRA C Rule
 16.3
In-Reply-To: <87cfe4d3e75c3a7d4174393a31aaaf80e0e60633.1719383180.git.federico.serafini@bugseng.com>
Message-ID: <alpine.DEB.2.22.394.2406261754480.3635@ubuntu-linux-20-04-desktop>
References: <cover.1719383180.git.federico.serafini@bugseng.com> <87cfe4d3e75c3a7d4174393a31aaaf80e0e60633.1719383180.git.federico.serafini@bugseng.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 26 Jun 2024, Federico Serafini wrote:
> MISRA C Rule 16.3 states that "An unconditional `break' statement shall
> terminate every switch-clause".
> 
> Add pseudo keyword fallthrough or missing break statement
> to address violations of the rule.
> 
> As a defensive measure, return -EOPNOTSUPP in case an unreachable
> return statement is reached.
> 
> Signed-off-by: Federico Serafini <federico.serafini@bugseng.com>

Aside from the ASSERT_UNREACHABLE which is still under discussion:

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>


