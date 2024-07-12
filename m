Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DC71B930215
	for <lists+xen-devel@lfdr.de>; Sat, 13 Jul 2024 00:19:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.758334.1167781 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sSOcB-0006le-2F; Fri, 12 Jul 2024 22:19:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 758334.1167781; Fri, 12 Jul 2024 22:19:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sSOcA-0006iu-Vd; Fri, 12 Jul 2024 22:19:42 +0000
Received: by outflank-mailman (input) for mailman id 758334;
 Fri, 12 Jul 2024 22:19:41 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ilSY=OM=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1sSOc9-0006il-Nx
 for xen-devel@lists.xenproject.org; Fri, 12 Jul 2024 22:19:41 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [2604:1380:4641:c500::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d411ae67-409c-11ef-8776-851b0ebba9a2;
 Sat, 13 Jul 2024 00:19:39 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 2FA8C62022;
 Fri, 12 Jul 2024 22:19:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B22D8C4AF07;
 Fri, 12 Jul 2024 22:19:36 +0000 (UTC)
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
X-Inumbo-ID: d411ae67-409c-11ef-8776-851b0ebba9a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720822777;
	bh=xEi2tBm507czbxJbWsgqNuIyQr/uyg9bVeTRs5rcXoU=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=bll78CA6uZEAo6uYWkgas9o6RUGQg4WoP4KOiBiMAaPqBkHEBx1JXWFDzMOfdslpD
	 Y29j/A08DgIA76mgxYLGPey4KTjIKNey+IxAWOldDXwFQn9igS5uQ55MVAAkwaytAf
	 xpoYjPbrr5XjgfaTW1/VXLiErDcU81wbE63fK8bRN06BhAbKCutXWjq+T8r9aUF08j
	 0QU3pNQG0amwnHbn73QnXtdVyHL9IbWHRzx+bpB3PiQflb2J4T9DSa95OR8tp/nUzh
	 p9DyvpVKMojyOvRj3jAuffMSV1PjF8nO9jp7EwT07qOeh31jpf4vMRtETgpTAer+Wi
	 h2G3wPPd9nYLQ==
Date: Fri, 12 Jul 2024 15:19:35 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Alessandro Zucchelli <alessandro.zucchelli@bugseng.com>
cc: xen-devel@lists.xenproject.org, nicola.vetrini@bugseng.com, 
    consulting@bugseng.com, 
    Maria Celeste Cesario <maria.celeste.cesario@bugseng.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
    Bertrand Marquis <bertrand.marquis@arm.com>, 
    Michal Orzel <michal.orzel@amd.com>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH 11/17] xen/arm: address violations of MISRA C:2012
 Directive 4.10
In-Reply-To: <8e9fee0a3dac64c0c7e49489f55256a37cab7a76.1719829101.git.alessandro.zucchelli@bugseng.com>
Message-ID: <alpine.DEB.2.22.394.2407121518470.3635@ubuntu-linux-20-04-desktop>
References: <cover.1719829101.git.alessandro.zucchelli@bugseng.com> <8e9fee0a3dac64c0c7e49489f55256a37cab7a76.1719829101.git.alessandro.zucchelli@bugseng.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 1 Jul 2024, Alessandro Zucchelli wrote:
> From: Maria Celeste Cesario <maria.celeste.cesario@bugseng.com>
> 
> Add or modify inclusion guards to address violations of
> MISRA C:2012 Directive 4.10 ("Precautions shall be taken in order to
> prevent the contents of a header file being included more than once").
> Mechanical change.
> 
> Signed-off-by: Maria Celeste Cesario  <maria.celeste.cesario@bugseng.com>
> Signed-off-by: Simone Ballarin  <simone.ballarin@bugseng.com>
> Signed-off-by: Nicola Vetrini  <nicola.vetrini@bugseng.com>
> Signed-off-by: Alessandro Zucchelli <alessandro.zucchelli@bugseng.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>


