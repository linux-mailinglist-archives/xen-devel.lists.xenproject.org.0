Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 04EFF919C16
	for <lists+xen-devel@lfdr.de>; Thu, 27 Jun 2024 02:50:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.749601.1157816 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sMdLI-00079D-0K; Thu, 27 Jun 2024 00:50:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 749601.1157816; Thu, 27 Jun 2024 00:50:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sMdLH-00077X-Tc; Thu, 27 Jun 2024 00:50:27 +0000
Received: by outflank-mailman (input) for mailman id 749601;
 Thu, 27 Jun 2024 00:50:25 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=iDhR=N5=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1sMdLF-00077R-PV
 for xen-devel@lists.xenproject.org; Thu, 27 Jun 2024 00:50:25 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3cc9a4df-341f-11ef-90a3-e314d9c70b13;
 Thu, 27 Jun 2024 02:50:24 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id A27F061D27;
 Thu, 27 Jun 2024 00:50:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 70A88C116B1;
 Thu, 27 Jun 2024 00:50:22 +0000 (UTC)
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
X-Inumbo-ID: 3cc9a4df-341f-11ef-90a3-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719449423;
	bh=BeUbIpNc9CmmlAN8M6hXMEyhR1Ce3IIVwr4J5xubekM=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=GAGYAfpZuvo+lIlWxNAZl17RBNBoh5BQAM1oel16OvAi5HOiHNA9wh6OPjGpSH8cD
	 0LCBCG3E6jFUz1rBuOFNP2lAX6p9Qu4mB8ANfZ8mUroQmWBrYyQzPnOQaV8Xz647o6
	 FqMWPqshN8GDDyp8MkQvyMd2rzDzt7l4taTrEGRYxitev3dXDojQzcwQhnhc2UXryJ
	 gFMUDwkr+wbEb5nKq7MwycqYSKrDkfNPKPacrgLOLE5asMtONJCBKfbnHephkv1VKM
	 lM13Lm89D8LH1/Wmt173zcsw+PWD4lIoH8BegQxdBfGGVQSx+toFhkLRKZyLddaT0e
	 G50seqMyOlmPQ==
Date: Wed, 26 Jun 2024 17:50:21 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Federico Serafini <federico.serafini@bugseng.com>
cc: xen-devel@lists.xenproject.org, consulting@bugseng.com, 
    Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Subject: Re: [XEN PATCH v3 04/12] x86/vpmu: address violations of MISRA C
 Rule 16.3
In-Reply-To: <b42004216d547e24f6537450a1c98176a821f704.1719383180.git.federico.serafini@bugseng.com>
Message-ID: <alpine.DEB.2.22.394.2406261750140.3635@ubuntu-linux-20-04-desktop>
References: <cover.1719383180.git.federico.serafini@bugseng.com> <b42004216d547e24f6537450a1c98176a821f704.1719383180.git.federico.serafini@bugseng.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 26 Jun 2024, Federico Serafini wrote:
> Add missing break statements to address violations of MISRA C Rule
> 16.3: "An unconditional `break' statement shall terminate every
> switch-clause".
> 
> No functional change.
> 
> Signed-off-by: Federico Serafini <federico.serafini@bugseng.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>


