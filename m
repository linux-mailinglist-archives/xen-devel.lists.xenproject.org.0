Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ECFC57C9131
	for <lists+xen-devel@lfdr.de>; Sat, 14 Oct 2023 01:09:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.616921.959270 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qrRHm-00087z-CO; Fri, 13 Oct 2023 23:09:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 616921.959270; Fri, 13 Oct 2023 23:09:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qrRHm-00085b-9J; Fri, 13 Oct 2023 23:09:38 +0000
Received: by outflank-mailman (input) for mailman id 616921;
 Fri, 13 Oct 2023 23:09:37 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=4sWS=F3=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1qrRHl-00085V-AT
 for xen-devel@lists.xenproject.org; Fri, 13 Oct 2023 23:09:37 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 92b13edb-6a1d-11ee-9b0e-b553b5be7939;
 Sat, 14 Oct 2023 01:09:35 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 7CCCD621AE;
 Fri, 13 Oct 2023 23:09:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2B8E6C433C7;
 Fri, 13 Oct 2023 23:09:32 +0000 (UTC)
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
X-Inumbo-ID: 92b13edb-6a1d-11ee-9b0e-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1697238573;
	bh=M303czI56qsf74+hRyGl5GbH+VNDYMPKt23eMUsxU2o=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=LribqiXJa0uD+B0RQ2m3iWYRIpzp4WYfL4bezFxsILV0awmUbn0Ujv5MTvTCVCebY
	 jXBxDWxjlMLnZHhJ8zaTgliS54lXylvTqsLM/ZfTEI/tSZnhdjnGNS6zD0Fp6t3Xz8
	 g3x9b3EzFrvUj2Q8OtEw3MeRYl4vjVjzr0Ddnz3UjM2WnH0EfJiEpZnkW0tfj/7kXE
	 bOK2RwFEw6TZxo9G6xQ/qf1kXm3ybCQXdGxS+iisbTq0fq3a1rm3rPvVfvJZ7Oho8T
	 X5rsPhwlQJfDJUWJmzN/mKmohbCUhdAutX+ldOgD6nLDZyp/mRIvhZQDHWHwCjW0a1
	 SJuUMhguGHK0A==
Date: Fri, 13 Oct 2023 16:09:30 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Federico Serafini <federico.serafini@bugseng.com>
cc: xen-devel@lists.xenproject.org, consulting@bugseng.com, 
    Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
    Bertrand Marquis <bertrand.marquis@arm.com>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, 
    Henry Wang <henry.wang@arm.com>
Subject: Re: [XEN PATCH 01/10] arm/gic: address violations of MISRA C:2012
 Rule 8.2
In-Reply-To: <e55bfe55e0c34e96692f397ff69365bc0819fd90.1697207038.git.federico.serafini@bugseng.com>
Message-ID: <alpine.DEB.2.22.394.2310131609220.965337@ubuntu-linux-20-04-desktop>
References: <cover.1697207038.git.federico.serafini@bugseng.com> <e55bfe55e0c34e96692f397ff69365bc0819fd90.1697207038.git.federico.serafini@bugseng.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Fri, 13 Oct 2023, Federico Serafini wrote:
> Add missing parameter names, no functional change.
> 
> Signed-off-by: Federico Serafini <federico.serafini@bugseng.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>

