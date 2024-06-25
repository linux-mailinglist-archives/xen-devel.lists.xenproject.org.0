Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B9604915B48
	for <lists+xen-devel@lfdr.de>; Tue, 25 Jun 2024 02:58:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.747097.1154403 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sLuVr-0006fP-SP; Tue, 25 Jun 2024 00:58:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 747097.1154403; Tue, 25 Jun 2024 00:58:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sLuVr-0006dv-Pe; Tue, 25 Jun 2024 00:58:23 +0000
Received: by outflank-mailman (input) for mailman id 747097;
 Tue, 25 Jun 2024 00:58:23 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=cmkP=N3=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1sLuVq-0006do-Uv
 for xen-devel@lists.xenproject.org; Tue, 25 Jun 2024 00:58:22 +0000
Received: from sin.source.kernel.org (sin.source.kernel.org
 [2604:1380:40e1:4800::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 02c21949-328e-11ef-b4bb-af5377834399;
 Tue, 25 Jun 2024 02:58:20 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id E4028CE0B3C;
 Tue, 25 Jun 2024 00:58:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7F088C2BBFC;
 Tue, 25 Jun 2024 00:58:14 +0000 (UTC)
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
X-Inumbo-ID: 02c21949-328e-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719277095;
	bh=vyty9uCC29Pd1HPx/z4nINLebrWE8/YCMSiORS1iNbs=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=PqSX/6dx8rhtt4wM9wKRoXlNQofVUEPQOwN+rPEt6v+OoyOjgaO1Be9lTr5ZkScHQ
	 qczSwN4HNu4Y4k15daqsu2XXZkkA0OIt06Pb6OV7DIQ/oP95W8ypYRw0dyoc0b5p7s
	 z9H3X4jYPUZmwpUE2XbgEaBQ/fcOcuxg/s7+jGmXBt4MYPNnctOMBQyQIsBoqVfOAz
	 N2OWA2CaOSs3+HWXntDQ0JS5PZPa8U+fvMbR8K5nEAFEax8/nhlk1zbCb/qG+myhCR
	 OwIqXmzG4OEw/6I/RbLNAns8cdDPLQWPDBQ3yRMrD+lzq8zYc3k6BQE4j5GML/oM9R
	 rs/3UGiPrT9Ww==
Date: Mon, 24 Jun 2024 17:58:13 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Federico Serafini <federico.serafini@bugseng.com>
cc: xen-devel@lists.xenproject.org, consulting@bugseng.com, 
    Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Subject: Re: [XEN PATCH v2 08/13] x86/vpt: address a violation of MISRA C
 Rule 16.3x
In-Reply-To: <e26de71af72b51abd425f2e75f30d794e0ba46a2.1719218291.git.federico.serafini@bugseng.com>
Message-ID: <alpine.DEB.2.22.394.2406241758050.3870429@ubuntu-linux-20-04-desktop>
References: <cover.1719218291.git.federico.serafini@bugseng.com> <e26de71af72b51abd425f2e75f30d794e0ba46a2.1719218291.git.federico.serafini@bugseng.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 24 Jun 2024, Federico Serafini wrote:
> Add pseudo keyword fallthrough to meet the requirements to deviate
> a violation of MISRA C Rule 16.3 ("An unconditional `break'
> statement shall terminate every switch-clause").
> 
> No functional change.
> 
> Signed-off-by: Federico Serafini <federico.serafini@bugseng.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>


