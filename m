Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 37A757C913F
	for <lists+xen-devel@lfdr.de>; Sat, 14 Oct 2023 01:17:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.616935.959310 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qrROm-0003er-Tf; Fri, 13 Oct 2023 23:16:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 616935.959310; Fri, 13 Oct 2023 23:16:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qrROm-0003bi-QI; Fri, 13 Oct 2023 23:16:52 +0000
Received: by outflank-mailman (input) for mailman id 616935;
 Fri, 13 Oct 2023 23:16:51 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=4sWS=F3=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1qrROl-00036W-HU
 for xen-devel@lists.xenproject.org; Fri, 13 Oct 2023 23:16:51 +0000
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 96f5e701-6a1e-11ee-98d4-6d05b1d4d9a1;
 Sat, 14 Oct 2023 01:16:51 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by ams.source.kernel.org (Postfix) with ESMTP id B5D85B82C26;
 Fri, 13 Oct 2023 23:16:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2191DC433C8;
 Fri, 13 Oct 2023 23:16:49 +0000 (UTC)
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
X-Inumbo-ID: 96f5e701-6a1e-11ee-98d4-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1697239010;
	bh=YXrD7RxguoGKemOAbsD5zWRMjATYaPjRi4C5tjERld8=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=i6veIUmvH91j3yih9Vd5TQtBmkDyMbCTVivuWVDlauY7QjI3LZoqXYGLJLMO+fsj4
	 3ElOXE1h8I1zQ3mtelNY0doihPOARzQUi5KpZ4BahHVxVUd5ddPOvS7SUnDg6fuYMi
	 DEku3x67ZaGHcksah5HnW37mvyHweDHKAY6ktV3BJyX8/woIC5ViY8Kh0WrscINmvz
	 Eew97OabACxbgP6GqpHlp8N/jWbmynIaQaBAQDMr+Bk5uX3CdYhnAhcTmX11sRLVYI
	 O53YrgU2GQCOylynFQsZdSNxDXw5TriUJjduJR8gG9EezuP0rZurj/bP1DumxNv0xF
	 J7LHtohKzuk8Q==
Date: Fri, 13 Oct 2023 16:16:47 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Federico Serafini <federico.serafini@bugseng.com>
cc: xen-devel@lists.xenproject.org, consulting@bugseng.com, 
    Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
    Bertrand Marquis <bertrand.marquis@arm.com>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, 
    Henry Wang <henry.wang@arm.com>
Subject: Re: [XEN PATCH 05/10] arm/p2m: address a violation of MISRA C:2012
 Rule 8.2
In-Reply-To: <b8dcbbbe9e6546f03ecc6e6a0c617cf98da9786a.1697207038.git.federico.serafini@bugseng.com>
Message-ID: <alpine.DEB.2.22.394.2310131616420.965337@ubuntu-linux-20-04-desktop>
References: <cover.1697207038.git.federico.serafini@bugseng.com> <b8dcbbbe9e6546f03ecc6e6a0c617cf98da9786a.1697207038.git.federico.serafini@bugseng.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Fri, 13 Oct 2023, Federico Serafini wrote:
> Add missing parameter name, no functional change.
> 
> Signed-off-by: Federico Serafini <federico.serafini@bugseng.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>


