Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BFA19809747
	for <lists+xen-devel@lfdr.de>; Fri,  8 Dec 2023 01:34:40 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.650271.1015616 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rBOp3-00075V-9y; Fri, 08 Dec 2023 00:34:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 650271.1015616; Fri, 08 Dec 2023 00:34:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rBOp3-00073B-6V; Fri, 08 Dec 2023 00:34:29 +0000
Received: by outflank-mailman (input) for mailman id 650271;
 Fri, 08 Dec 2023 00:34:28 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=RvmJ=HT=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1rBOp2-000733-H8
 for xen-devel@lists.xenproject.org; Fri, 08 Dec 2023 00:34:28 +0000
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8998739e-9561-11ee-9b0f-b553b5be7939;
 Fri, 08 Dec 2023 01:34:26 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id F3D07CE236D;
 Fri,  8 Dec 2023 00:34:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3DF81C433C7;
 Fri,  8 Dec 2023 00:34:19 +0000 (UTC)
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
X-Inumbo-ID: 8998739e-9561-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701995660;
	bh=OMiA2fe2ve3Hg2YLWwV9q1eCjNQfCu+KhtgqmkP6SAY=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=P74ZO1kOK426BQySA//nxXRIMzj9iNCOfAhMqPLoItLNUHI5jibHMTxhDeb7Q6fk9
	 VJ33n4VmnLhwGKoO/uGGworz4kGfiMyplPkzmyVZ8f5asZIl7xG7BpzRoV6dDOjlOc
	 ieJoUDpuIZCSQbJLTKnnIkuwF4IB6b3NJmNRrYUs3saopDi+K6wOOuvAli83UGq80u
	 UUU6eDSIcVpVbAn7Px3wGeQXeKm6BpXeV23Ma6kNVxMrAFRUpCSmXT57udZjM1xqve
	 CQdnj/OPOj/O0W3Ve3KENdEU32JnBZInVZbkN2FRJyuSe6JpU/rGKvJYKUgkTCmQA7
	 9q4MwLml7edog==
Date: Thu, 7 Dec 2023 16:34:17 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Federico Serafini <federico.serafini@bugseng.com>
cc: xen-devel@lists.xenproject.org, consulting@bugseng.com, 
    Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
    Wei Liu <wl@xen.org>, Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [XEN PATCH v2 3/5] x86/mm: remove compat_subarch_memory_op()
In-Reply-To: <285de0decf8ffe4277ce7e14a2561a693103f72b.1701936906.git.federico.serafini@bugseng.com>
Message-ID: <alpine.DEB.2.22.394.2312071634110.1265976@ubuntu-linux-20-04-desktop>
References: <cover.1701936906.git.federico.serafini@bugseng.com> <285de0decf8ffe4277ce7e14a2561a693103f72b.1701936906.git.federico.serafini@bugseng.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 7 Dec 2023, Federico Serafini wrote:
> Remove remove compat_subarch_memory_op() declaration: there is no
> definition and there are no calls to such function in the XEN project.
> 
> Signed-off-by: Federico Serafini <federico.serafini@bugseng.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>


