Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 65CCB7AA51C
	for <lists+xen-devel@lfdr.de>; Fri, 22 Sep 2023 00:34:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.606639.944616 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qjSFO-00087c-Bk; Thu, 21 Sep 2023 22:34:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 606639.944616; Thu, 21 Sep 2023 22:34:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qjSFO-00085w-8E; Thu, 21 Sep 2023 22:34:10 +0000
Received: by outflank-mailman (input) for mailman id 606639;
 Thu, 21 Sep 2023 22:34:09 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Fi77=FF=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1qjSFN-00085q-5w
 for xen-devel@lists.xenproject.org; Thu, 21 Sep 2023 22:34:09 +0000
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f883ec4d-58ce-11ee-878a-cb3800f73035;
 Fri, 22 Sep 2023 00:34:07 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by sin.source.kernel.org (Postfix) with ESMTPS id 6A0E3CE23FC;
 Thu, 21 Sep 2023 22:34:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 787B7C433C7;
 Thu, 21 Sep 2023 22:33:58 +0000 (UTC)
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
X-Inumbo-ID: f883ec4d-58ce-11ee-878a-cb3800f73035
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1695335639;
	bh=nvPQi+aXbm1W9s4tyXkynCBTnC7wlC91n2EXU+QCRBA=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=WKeNjoLKR/AX6Xn4UWGcQIJ8CScvimmbof9IFxsIdIzCmYBVAXgifwHfiTwfkmbtJ
	 3YKVnAmxH2OvK907jz61gzEGvoT3Bkh42oAwRSHh4wT/gnU4fyum97PKAaQ70oFkBD
	 QlSsYDEGZ49SkHo2KE8kgm2y/uFG00pfmXCTaIYdUmA47qAdXdJDxOjAxhah62gtie
	 qAkiA0cjCSa3+egsQCW86LOyM5ORhiUGJZt5ueTc9+2dqSpaVt+XN3VHpOxZ57RiVL
	 rVLDGFSagBjfoIPbrHzZDlxW0qGmsSUNyX7i4LnjhIzBkyW56met5dkzksPHmIdBXw
	 /zT762EhY8vbw==
Date: Thu, 21 Sep 2023 15:33:56 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Federico Serafini <federico.serafini@bugseng.com>
cc: xen-devel@lists.xenproject.org, consulting@bugseng.com, 
    Andrew Cooper <andrew.cooper3@citrix.com>, 
    George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>, 
    Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, 
    Wei Liu <wl@xen.org>
Subject: Re: [XEN PATCH v3] xen/hypercalls: address violations of MISRA C:2012
 Rule 8.3
In-Reply-To: <2c3e9469b3e59c7c4d0128320515f2b3df2b4c1c.1695297383.git.federico.serafini@bugseng.com>
Message-ID: <alpine.DEB.2.22.394.2309211533510.3563@ubuntu-linux-20-04-desktop>
References: <2c3e9469b3e59c7c4d0128320515f2b3df2b4c1c.1695297383.git.federico.serafini@bugseng.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 21 Sep 2023, Federico Serafini wrote:
> Make function declarations and definitions consistent.
> No functional change.
> 
> Signed-off-by: Federico Serafini <federico.serafini@bugseng.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>

