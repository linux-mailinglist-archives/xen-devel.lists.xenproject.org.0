Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D2ED6813CF0
	for <lists+xen-devel@lfdr.de>; Thu, 14 Dec 2023 22:50:39 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.654775.1022125 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rDtbB-0007Av-A2; Thu, 14 Dec 2023 21:50:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 654775.1022125; Thu, 14 Dec 2023 21:50:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rDtbB-00078i-7I; Thu, 14 Dec 2023 21:50:29 +0000
Received: by outflank-mailman (input) for mailman id 654775;
 Thu, 14 Dec 2023 21:50:28 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=fjLX=HZ=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1rDtbA-00074p-08
 for xen-devel@lists.xenproject.org; Thu, 14 Dec 2023 21:50:28 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [2604:1380:4641:c500::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c9aca467-9aca-11ee-9b0f-b553b5be7939;
 Thu, 14 Dec 2023 22:50:26 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 9418562237;
 Thu, 14 Dec 2023 21:50:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4D36FC433C7;
 Thu, 14 Dec 2023 21:50:23 +0000 (UTC)
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
X-Inumbo-ID: c9aca467-9aca-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1702590624;
	bh=kjVDvz/CbrFM6q6FXiu3J4Rma/Bq/NM1oBIi3H5dDXs=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=fPpl+lRj3iY5HtrErGCrR1PalY0fpJzob/cYNEVSdwtWOLsUJmgD2VGxRyO9Y7m0e
	 gyLQjOu+WGBxYWCLHt+36fqLpBWpkngXlETlwtEy1aNGnJFlmcnIzRDc1q/wpIU6s8
	 25SMLsVQzBb7yMddrsL0Fmu7JjHGNYzZtu3B/yk0XzFVF/3QYaVZM1cuzon3ioejpH
	 DehRUL15ohl9R2NOK64Zp6r7fZKDxnOVdS3ra8TosqP+Tw0PDtthm2AfVoJ/ehYsP0
	 mMOedIlLsLVVNl9g2eRW5iQjQIMlIUkQqamoq9KCoGoef4eFD3eYKyN/qWjwqG23KD
	 hnP9mRhRnYtfw==
Date: Thu, 14 Dec 2023 13:50:21 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Simone Ballarin <simone.ballarin@bugseng.com>
cc: xen-devel@lists.xenproject.org, consulting@bugseng.com, 
    Maria Celeste Cesario <maria.celeste.cesario@bugseng.com>, 
    Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
    Wei Liu <wl@xen.org>
Subject: Re: [PATCH 5/9] xen/x86: address violations of MISRA C:2012 Rule
 11.8
In-Reply-To: <68e28c7631f1233df1527674cfc27cf3f44797a7.1702555387.git.maria.celeste.cesario@bugseng.com>
Message-ID: <alpine.DEB.2.22.394.2312141350150.3175268@ubuntu-linux-20-04-desktop>
References: <cover.1702555386.git.maria.celeste.cesario@bugseng.com> <68e28c7631f1233df1527674cfc27cf3f44797a7.1702555387.git.maria.celeste.cesario@bugseng.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 14 Dec 2023, Simone Ballarin wrote:
> From: Maria Celeste Cesario <maria.celeste.cesario@bugseng.com>
> 
> The xen sources contain violations of MISRA C:2012 Rule 11.8 whose
> headline states:
> "A conversion shall not remove any const, volatile or _Atomic qualification
> from the type pointed to by a pointer".
> 
> Add missing const qualifiers in casts.
> 
> Macro get_mb2_data returns values that are const-qualified.
> The results are stored in const struct pointers, hence
> there's no need to cast away the const qualifiers.
> 
> Signed-off-by: Maria Celeste Cesario  <maria.celeste.cesario@bugseng.com>
> Signed-off-by: Simone Ballarin  <simone.ballarin@bugseng.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>

