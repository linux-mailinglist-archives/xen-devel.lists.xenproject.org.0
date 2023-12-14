Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F47F813CA6
	for <lists+xen-devel@lfdr.de>; Thu, 14 Dec 2023 22:33:10 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.654753.1022066 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rDtKG-0000yP-LP; Thu, 14 Dec 2023 21:33:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 654753.1022066; Thu, 14 Dec 2023 21:33:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rDtKG-0000vk-I2; Thu, 14 Dec 2023 21:33:00 +0000
Received: by outflank-mailman (input) for mailman id 654753;
 Thu, 14 Dec 2023 21:32:59 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=fjLX=HZ=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1rDtKF-0000mX-75
 for xen-devel@lists.xenproject.org; Thu, 14 Dec 2023 21:32:59 +0000
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5941338d-9ac8-11ee-9b0f-b553b5be7939;
 Thu, 14 Dec 2023 22:32:57 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by ams.source.kernel.org (Postfix) with ESMTP id 535A2B8247A;
 Thu, 14 Dec 2023 21:32:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BC726C433C8;
 Thu, 14 Dec 2023 21:32:55 +0000 (UTC)
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
X-Inumbo-ID: 5941338d-9ac8-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1702589576;
	bh=RK5ArRgMYzm6Ya6ricxDIkR3W7N7vbW749156mq+Qxc=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=Eb/IzHmC+QQHAM66UTdKNJKa/U+V5ascqPhfTSLz68M2265GO6cG/5JcNrhDdPkMO
	 3qEra+0FGRzeLWHN9OtMNNzg3wFt6ME4x3vTVlZtbkcZi8JJWviFL9s6N5fOAc/wWp
	 sde/7G1iE3NXxp/whx2vMksXssewsfK+Lmv60Pnb8dmGPWhkAfoUoJdEzSjVpl7AEd
	 MA6hz7i9lCHm+1cCEZ2yOYfivaalcX9LL/WpfVeQwj9pUxVD1kwjAApk+ezxQciqw8
	 5thflhY2khDOw83jbxTIARSXRXnS37DfRwdft9a6xks0xMkXgCdM8ocFwN9oWD2Kg3
	 42lJR+YAhNLlw==
Date: Thu, 14 Dec 2023 13:32:54 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Nicola Vetrini <nicola.vetrini@bugseng.com>
cc: xen-devel@lists.xenproject.org, consulting@bugseng.com, 
    Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
    Wei Liu <wl@xen.org>
Subject: Re: [XEN PATCH 4/5] x86/hvm: dom0: use helper to get sizeof struct
 field
In-Reply-To: <17b01f14b89a5dba6935bbd8019ddf431d595890.1702553835.git.nicola.vetrini@bugseng.com>
Message-ID: <alpine.DEB.2.22.394.2312141332470.3175268@ubuntu-linux-20-04-desktop>
References: <cover.1702553835.git.nicola.vetrini@bugseng.com> <17b01f14b89a5dba6935bbd8019ddf431d595890.1702553835.git.nicola.vetrini@bugseng.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 14 Dec 2023, Nicola Vetrini wrote:
> Use of the proper helper macro also resolves a violation
> of MISRA C Rule 11.9.
> No functional change.
> 
> Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>

