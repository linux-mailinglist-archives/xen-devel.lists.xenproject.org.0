Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DCDDE7B3BA3
	for <lists+xen-devel@lfdr.de>; Fri, 29 Sep 2023 22:53:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.610718.950227 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qmKU2-0000eD-QM; Fri, 29 Sep 2023 20:53:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 610718.950227; Fri, 29 Sep 2023 20:53:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qmKU2-0000cU-NV; Fri, 29 Sep 2023 20:53:10 +0000
Received: by outflank-mailman (input) for mailman id 610718;
 Fri, 29 Sep 2023 20:53:09 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/xMB=FN=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1qmKU1-0000Ye-Dc
 for xen-devel@lists.xenproject.org; Fri, 29 Sep 2023 20:53:09 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [2604:1380:4641:c500::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 312197ce-5f0a-11ee-878c-cb3800f73035;
 Fri, 29 Sep 2023 22:53:08 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id EF91462029;
 Fri, 29 Sep 2023 20:53:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A9A27C433C7;
 Fri, 29 Sep 2023 20:53:05 +0000 (UTC)
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
X-Inumbo-ID: 312197ce-5f0a-11ee-878c-cb3800f73035
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1696020786;
	bh=BK0F8me+AI2nLgpcgCWv4RDpQHvjDWUGvi6Cmz0c1AI=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=oWDmDS6f7McMeNZX41oW+rXyL4/KZgoCYlRZUwsKjW8Z7O3m4SGhEFmBu7LcqIRV5
	 0RlIfRBpDgRmUfyF+1xrMqZZti5/Bp58N1H9uvIcPS3ex3Uu5YOmC+I9eGBI+xUY3h
	 F9zqUPEkpRVIDh0HAsoAgpRs38mgsSIPX5TUG4D+6365OXA4YITUvO39k70IsodrbL
	 O/lSWDURUj1CekHS5IlvS0NGO6zA9YthFSYfS3TYGSrbstJIIlba0AMPfjXL5e602y
	 EKyVhyvRPpzYoOrzY+u4vgHodpoq8wRfsadg7EGBsSOQWOUb4UMphclTt3wEgtkTl6
	 kBhmvi21lHiLw==
Date: Fri, 29 Sep 2023 13:53:04 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Federico Serafini <federico.serafini@bugseng.com>
cc: xen-devel@lists.xenproject.org, consulting@bugseng.com, 
    Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
    Wei Liu <wl@xen.org>, Henry Wang <henry.wang@arm.com>
Subject: Re: [XEN PATCH 2/4] x86/uaccess: address violations of MISRA C:2012
 Rule 8.3
In-Reply-To: <7e32d3b6c078a7692668a509d05c44175ad99310.1695972930.git.federico.serafini@bugseng.com>
Message-ID: <alpine.DEB.2.22.394.2309291352560.2348112@ubuntu-linux-20-04-desktop>
References: <cover.1695972930.git.federico.serafini@bugseng.com> <7e32d3b6c078a7692668a509d05c44175ad99310.1695972930.git.federico.serafini@bugseng.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Fri, 29 Sep 2023, Federico Serafini wrote:
> Make function declarations and definitions consistent.
> No functional change.
> 
> Signed-off-by: Federico Serafini <federico.serafini@bugseng.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>

