Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 423D5915B5D
	for <lists+xen-devel@lfdr.de>; Tue, 25 Jun 2024 03:01:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.747121.1154454 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sLuYI-0003ls-1f; Tue, 25 Jun 2024 01:00:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 747121.1154454; Tue, 25 Jun 2024 01:00:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sLuYH-0003j1-Ti; Tue, 25 Jun 2024 01:00:53 +0000
Received: by outflank-mailman (input) for mailman id 747121;
 Tue, 25 Jun 2024 01:00:52 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=cmkP=N3=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1sLuYG-0003Ar-Ot
 for xen-devel@lists.xenproject.org; Tue, 25 Jun 2024 01:00:52 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5da33bca-328e-11ef-90a3-e314d9c70b13;
 Tue, 25 Jun 2024 03:00:51 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id A58C160F39;
 Tue, 25 Jun 2024 01:00:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 99B5BC2BBFC;
 Tue, 25 Jun 2024 01:00:49 +0000 (UTC)
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
X-Inumbo-ID: 5da33bca-328e-11ef-90a3-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719277250;
	bh=qDwmdPFMex1cv54FgKNuXf1rt30UOjdd9eHj+hHj77w=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=TnzOP2a5PKPNAFGU8w7W9OVGLL7xwJ97zZDszr/Dcke7gliWHEVzUlebi8ekGKGlr
	 BCFebHBcIaVrMa6VA7UI+VoVgcRzCz8NtZa9zx1tmYSaotV0Cpr3RFgrGDrMDWrJqN
	 1NGmjjV28VLLImYSYiLt9136jpCRMfrwYSi28shfpIWbJl7B9JJKfqbWRRbVGDR/tr
	 Oqw0MhtdmEpZRABE79h9SvLGhlDF8YaVs6nPRiIDOoDTfAmGbQFb2/KLaUirYHaAlS
	 TimABDbj+Hk79yFkQ9o1ibKNk6cmOTzmY7GoSCks/3tBRzyBnCP5NKdF2hBY5Z1s1b
	 8xMw/yp1/ZMhA==
Date: Mon, 24 Jun 2024 18:00:48 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Federico Serafini <federico.serafini@bugseng.com>
cc: xen-devel@lists.xenproject.org, consulting@bugseng.com, 
    Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Subject: Re: [XEN PATCH v2 13/13] x86/vlapic: address a violation of MISRA
 C Rule 16.3
In-Reply-To: <0aa39166696e46b6bb45a0f7b5ac06bfd9fdda8e.1719218291.git.federico.serafini@bugseng.com>
Message-ID: <alpine.DEB.2.22.394.2406241800420.3870429@ubuntu-linux-20-04-desktop>
References: <cover.1719218291.git.federico.serafini@bugseng.com> <0aa39166696e46b6bb45a0f7b5ac06bfd9fdda8e.1719218291.git.federico.serafini@bugseng.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 24 Jun 2024, Federico Serafini wrote:
> Add missing break statement to address a violation of MISRA C
> Rule 16.3: "An unconditional `break' statement shall terminate every
> switch-clause".
> 
> No functional change.
> 
> Signed-off-by: Federico Serafini <federico.serafini@bugseng.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>

