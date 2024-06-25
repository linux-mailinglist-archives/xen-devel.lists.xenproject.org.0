Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D8C5A915B38
	for <lists+xen-devel@lfdr.de>; Tue, 25 Jun 2024 02:52:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.747073.1154364 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sLuQQ-0003h1-IG; Tue, 25 Jun 2024 00:52:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 747073.1154364; Tue, 25 Jun 2024 00:52:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sLuQQ-0003fU-Fg; Tue, 25 Jun 2024 00:52:46 +0000
Received: by outflank-mailman (input) for mailman id 747073;
 Tue, 25 Jun 2024 00:52:45 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=cmkP=N3=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1sLuQP-0003UF-3e
 for xen-devel@lists.xenproject.org; Tue, 25 Jun 2024 00:52:45 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3b27082e-328d-11ef-90a3-e314d9c70b13;
 Tue, 25 Jun 2024 02:52:44 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 4E8F760B00;
 Tue, 25 Jun 2024 00:52:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3BFFFC2BBFC;
 Tue, 25 Jun 2024 00:52:42 +0000 (UTC)
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
X-Inumbo-ID: 3b27082e-328d-11ef-90a3-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719276763;
	bh=6siFbJ4X+nrgAxPqWslw3e+YY1OFlb3CIAc1mmesVy8=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=SWT7ZT36RYACf+vJaplXLxs9uPojd39ZvpDR8eaaZzjpVGJgnOlEwprdwHYBTeICO
	 1FO2demVxhtB+1y6NTG9Lh/DJEkLHoDKUHPQXWkUVN6iwsCf67ZPZvdi33s2xUhaRm
	 dde6Z0cMJleiNVLhqVSNJvIGOpEr8jiEaO29LXhfaO6/2E0gnCaevgmlzQlGlxkKIP
	 k5j97C/vRQdFw3ECLhkT3tGwvdbGdNxBXRv1WukTs8KO+8rThXcc2zG3rdvwZUucBt
	 QblDEm6QP+LJ2v2GuJIga99MxViNZwMLo2WdMkCrbjtaM1o/SBfMsR9wo4EFGC+3sc
	 c4IWdMPD9YglQ==
Date: Mon, 24 Jun 2024 17:52:40 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Federico Serafini <federico.serafini@bugseng.com>
cc: xen-devel@lists.xenproject.org, consulting@bugseng.com, 
    Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Subject: Re: [XEN PATCH v2 04/13] x86/vpmu: address violations of MISRA C
 Rule 16.3
In-Reply-To: <c45b27a08a1608de85e4bbae80763f8429d40ad5.1719218291.git.federico.serafini@bugseng.com>
Message-ID: <alpine.DEB.2.22.394.2406241752300.3870429@ubuntu-linux-20-04-desktop>
References: <cover.1719218291.git.federico.serafini@bugseng.com> <c45b27a08a1608de85e4bbae80763f8429d40ad5.1719218291.git.federico.serafini@bugseng.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 24 Jun 2024, Federico Serafini wrote:
> Add missing break statements to address violations of MISRA C Rule
> 16.3: "An unconditional `break' statement shall terminate every
> switch-clause".
> 
> No functional change.
> 
> Signed-off-by: Federico Serafini <federico.serafini@bugseng.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>


