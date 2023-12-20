Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D9587819613
	for <lists+xen-devel@lfdr.de>; Wed, 20 Dec 2023 02:04:03 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.657300.1026090 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rFkz4-0001pf-1y; Wed, 20 Dec 2023 01:02:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 657300.1026090; Wed, 20 Dec 2023 01:02:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rFkz3-0001mt-VK; Wed, 20 Dec 2023 01:02:49 +0000
Received: by outflank-mailman (input) for mailman id 657300;
 Wed, 20 Dec 2023 01:02:48 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=wrkk=H7=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1rFkz2-0001mj-A7
 for xen-devel@lists.xenproject.org; Wed, 20 Dec 2023 01:02:48 +0000
Received: from ams.source.kernel.org (ams.source.kernel.org
 [2604:1380:4601:e00::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7bffbfe0-9ed3-11ee-9b0f-b553b5be7939;
 Wed, 20 Dec 2023 02:02:45 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by ams.source.kernel.org (Postfix) with ESMTP id 6B50BB81A3E;
 Wed, 20 Dec 2023 01:02:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9F05DC433C8;
 Wed, 20 Dec 2023 01:02:42 +0000 (UTC)
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
X-Inumbo-ID: 7bffbfe0-9ed3-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1703034163;
	bh=BMCpIOUeP+9CO1CYEpPLCLdR+JBcmHOLaPvHsGjgVZs=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=aWeM4TCg5F9C7W3JfV6SNWBgjN6NLg7gIMGDQLiStTS13RCdbM/KM7qudk1+uMB0S
	 7SYXRw1aF8eN+QDaC/4ZS5W5dss4kB5iXqPihrS0ujOymMMZLnsZGJmJ+9zr6VQjsM
	 JO/eirSNM30FuQerrm8Wvhu+ngV8wX1x3jSQyZg1ne0f8sVCMjPnJyfQleNEiza926
	 iuoXICwc07Dby3tIv/+ALjbHvHOAyp8MQVlH7YY/fzwL84F3XNyCiqu40mnqsUxeyW
	 5tWRoNUWc5MMnnnLO/dmBtNPL3c33Hff2LI9uaRw+8pk/XlzrnWH9mpq/6ic5JvjtI
	 bNVo+1nkjazkQ==
Date: Tue, 19 Dec 2023 17:02:41 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Simone Ballarin <simone.ballarin@bugseng.com>
cc: xen-devel@lists.xenproject.org, consulting@bugseng.com, 
    Maria Celeste Cesario <maria.celeste.cesario@bugseng.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
    Bertrand Marquis <bertrand.marquis@arm.com>, 
    Michal Orzel <michal.orzel@amd.com>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH v2 1/6] xen/arm: address violations of MISRA C:2012 Rule
 11.8
In-Reply-To: <cb398c5819310d2dc3413c4ceee685ed23ec7cf3.1702982442.git.maria.celeste.cesario@bugseng.com>
Message-ID: <alpine.DEB.2.22.394.2312191702330.3175268@ubuntu-linux-20-04-desktop>
References: <cover.1702982442.git.maria.celeste.cesario@bugseng.com> <cb398c5819310d2dc3413c4ceee685ed23ec7cf3.1702982442.git.maria.celeste.cesario@bugseng.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Tue, 19 Dec 2023, Simone Ballarin wrote:
> From: Maria Celeste Cesario <maria.celeste.cesario@bugseng.com>
> 
> The xen sources contain violations of MISRA C:2012 Rule 11.8 whose
> headline states:
> "A conversion shall not remove any const, volatile or _Atomic qualification
> from the type pointed to by a pointer".
> 
> Add missing const qualifiers in casts.
> The variables are originally const-qualified.
> There's no reason to drop the qualifiers.
> 
> Drop redundant cast to preserve const qualifier.
> 
> No functional change.
> 
> Signed-off-by: Maria Celeste Cesario  <maria.celeste.cesario@bugseng.com>
> Signed-off-by: Simone Ballarin  <simone.ballarin@bugseng.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>

