Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 724707C9141
	for <lists+xen-devel@lfdr.de>; Sat, 14 Oct 2023 01:19:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.616941.959330 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qrRR0-0004qz-FJ; Fri, 13 Oct 2023 23:19:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 616941.959330; Fri, 13 Oct 2023 23:19:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qrRR0-0004pG-Cf; Fri, 13 Oct 2023 23:19:10 +0000
Received: by outflank-mailman (input) for mailman id 616941;
 Fri, 13 Oct 2023 23:19:09 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=4sWS=F3=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1qrRQz-0004p8-F0
 for xen-devel@lists.xenproject.org; Fri, 13 Oct 2023 23:19:09 +0000
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e838edea-6a1e-11ee-9b0e-b553b5be7939;
 Sat, 14 Oct 2023 01:19:07 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by ams.source.kernel.org (Postfix) with ESMTP id D105CB82C16;
 Fri, 13 Oct 2023 23:19:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3EA22C433C7;
 Fri, 13 Oct 2023 23:19:05 +0000 (UTC)
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
X-Inumbo-ID: e838edea-6a1e-11ee-9b0e-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1697239146;
	bh=YXrD7RxguoGKemOAbsD5zWRMjATYaPjRi4C5tjERld8=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=a/PA6bRhaho6UbW6lEoR9oqiL/1Y0FXkKIgUq+4vyCeDtiWNO7v7K8/W6b295/F13
	 +fvUKEoA1wmAwxPfMnvgzB8rA8rhe1SLRq7mHn8FNFbNZUJsTt1uuTKP6TghCV5z4W
	 c2AWh+p+PDg1V5VhQUBT6gnHtihkdfRmuGFcB0OLGXfVUCwhjE6zIvxUewNvaMZ40W
	 9UGoZgFtj33efcc+fouZwpONaxAhGOd6BBlM7W+hVpaJkE0hVBY/j0rJDqXobvNs2o
	 tK0zRJE65xgnh+AA7kikX8xwohNo/WZQkBoZbLEoNHKB6Qv51A98Y7KluOrxea3eux
	 3ME3TkBvBzW5Q==
Date: Fri, 13 Oct 2023 16:19:03 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Federico Serafini <federico.serafini@bugseng.com>
cc: xen-devel@lists.xenproject.org, consulting@bugseng.com, 
    Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
    Bertrand Marquis <bertrand.marquis@arm.com>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, 
    Henry Wang <henry.wang@arm.com>
Subject: Re: [XEN PATCH 07/10] arm/traps: address a violation of MISRA C:2012
 Rule 8.2
In-Reply-To: <dbc0e965cd9f93848d27e7ebf0ffcfca05499d58.1697207038.git.federico.serafini@bugseng.com>
Message-ID: <alpine.DEB.2.22.394.2310131618580.965337@ubuntu-linux-20-04-desktop>
References: <cover.1697207038.git.federico.serafini@bugseng.com> <dbc0e965cd9f93848d27e7ebf0ffcfca05499d58.1697207038.git.federico.serafini@bugseng.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Fri, 13 Oct 2023, Federico Serafini wrote:
> Add missing parameter name, no functional change.
> 
> Signed-off-by: Federico Serafini <federico.serafini@bugseng.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>

