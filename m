Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 158867C913D
	for <lists+xen-devel@lfdr.de>; Sat, 14 Oct 2023 01:16:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.616931.959300 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qrROI-00038i-Hx; Fri, 13 Oct 2023 23:16:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 616931.959300; Fri, 13 Oct 2023 23:16:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qrROI-00036c-EK; Fri, 13 Oct 2023 23:16:22 +0000
Received: by outflank-mailman (input) for mailman id 616931;
 Fri, 13 Oct 2023 23:16:20 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=4sWS=F3=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1qrROG-00036W-KW
 for xen-devel@lists.xenproject.org; Fri, 13 Oct 2023 23:16:20 +0000
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8464713a-6a1e-11ee-98d4-6d05b1d4d9a1;
 Sat, 14 Oct 2023 01:16:19 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by ams.source.kernel.org (Postfix) with ESMTP id 38532B82C26;
 Fri, 13 Oct 2023 23:16:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8741FC433C7;
 Fri, 13 Oct 2023 23:16:17 +0000 (UTC)
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
X-Inumbo-ID: 8464713a-6a1e-11ee-98d4-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1697238978;
	bh=M303czI56qsf74+hRyGl5GbH+VNDYMPKt23eMUsxU2o=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=sjsArB+ELupp4bfyI1faGHIV2BT+ABNKaodWSvcPml0mETpRbvvDJrDx1r5pztl83
	 Zh/uuAvNbU+gLEmJN1ovK+90LR9B7aXXmbqU4/i22C8RvCmvdOpuxOXuCBp4Uqdk9z
	 GdtqVUS2ztjSAKE89j1e026Y5/962HVF3jEwkt9xNrYU4Cpd60P7Ki7KJeyQzoC7kr
	 UWP4Pr2GTYXEpQXS4+7S4ZPVN2q4NGavJKf+3Nd16eK/leVrF1O4a6pV/8UKE7xg0S
	 N9a9OO/+Ten6qDczzAPgSEqLb2v/nlKcpv9Dtu6RSNJTNFlqfEheoXiypkalb4kF/u
	 JsKSl+AuRB6sw==
Date: Fri, 13 Oct 2023 16:16:16 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Federico Serafini <federico.serafini@bugseng.com>
cc: xen-devel@lists.xenproject.org, consulting@bugseng.com, 
    Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
    Bertrand Marquis <bertrand.marquis@arm.com>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, 
    Henry Wang <henry.wang@arm.com>
Subject: Re: [XEN PATCH 04/10] arm/setup: address violations of MISRA C:2012
 Rule 8.2
In-Reply-To: <b71d8ef87be08e84360efebd7c5644521b3a6661.1697207038.git.federico.serafini@bugseng.com>
Message-ID: <alpine.DEB.2.22.394.2310131614160.965337@ubuntu-linux-20-04-desktop>
References: <cover.1697207038.git.federico.serafini@bugseng.com> <b71d8ef87be08e84360efebd7c5644521b3a6661.1697207038.git.federico.serafini@bugseng.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Fri, 13 Oct 2023, Federico Serafini wrote:
> Add missing parameter names, no functional change.
> 
> Signed-off-by: Federico Serafini <federico.serafini@bugseng.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>

