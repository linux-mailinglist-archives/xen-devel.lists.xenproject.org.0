Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E962CB52677
	for <lists+xen-devel@lfdr.de>; Thu, 11 Sep 2025 04:30:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1119134.1464646 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uwX4k-0004up-Lr; Thu, 11 Sep 2025 02:30:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1119134.1464646; Thu, 11 Sep 2025 02:30:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uwX4k-0004sZ-Is; Thu, 11 Sep 2025 02:30:18 +0000
Received: by outflank-mailman (input) for mailman id 1119134;
 Thu, 11 Sep 2025 02:30:17 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5SW2=3W=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1uwX4j-0002uc-Bp
 for xen-devel@lists.xenproject.org; Thu, 11 Sep 2025 02:30:17 +0000
Received: from sea.source.kernel.org (sea.source.kernel.org
 [2600:3c0a:e001:78e:0:1991:8:25])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3f8bc46b-8eb7-11f0-9809-7dc792cee155;
 Thu, 11 Sep 2025 04:30:15 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 56BA5437BD;
 Thu, 11 Sep 2025 02:30:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ED048C4CEEB;
 Thu, 11 Sep 2025 02:30:11 +0000 (UTC)
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
X-Inumbo-ID: 3f8bc46b-8eb7-11f0-9809-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757557814;
	bh=Y04GJDVEX9t/myPrNQQRkZrf35AmYZ8p6chm2d9AThc=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=paiEP6q6MjdtbCml9YpNMj4UmVNNVBSlzwf39mp+Bi9PRIGc6JM0ZuPl7zTnyRNzM
	 KtQFWnfo71O9sroM4E8tQjVoUDsqZviNbW013EaLAHVD9a+W48g+fLWN6gcGTbhzO4
	 bTtL8SBxpUfNGOjOwAAMK0EVrLIvvyiH+HBkTZaHJB6qZd4EGqvNo6Ek7h7LCkw1WE
	 4XyzvNpslVxl44HDmD3oPeXTbLR0AJ6jDuiRABxnstpyF7Z3tzJ9shodByOwCZZdYh
	 QECpKQ1gRMY/6vB/lWAWHTXfb/qSdM2PoCv4O2h1k92aCOb905EAv/ZmJ7dTZLmw24
	 FRg8zuUhSGzNw==
Date: Wed, 10 Sep 2025 19:30:10 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Penny Zheng <Penny.Zheng@amd.com>
cc: xen-devel@lists.xenproject.org, xen-devel@dornerworks.com, 
    ray.huang@amd.com, Andrew Cooper <andrew.cooper3@citrix.com>, 
    Anthony PERARD <anthony.perard@vates.tech>, 
    Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>, 
    Julien Grall <julien@xen.org>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, 
    Nathan Studer <nathan.studer@dornerworks.com>, 
    Stewart Hildebrand <stewart@stew.dk>, Dario Faggioli <dfaggioli@suse.com>, 
    Juergen Gross <jgross@suse.com>, George Dunlap <gwd@xenproject.org>, 
    Meng Xu <mengxu@cis.upenn.edu>, 
    "Daniel P. Smith" <dpsmith@apertussolutions.com>
Subject: Re: [PATCH v2 13/26] xen/domctl: wrap sched_adjust() with
 CONFIG_MGMT_HYPERCALLS
In-Reply-To: <20250910073827.3622177-14-Penny.Zheng@amd.com>
Message-ID: <alpine.DEB.2.22.394.2509101930030.52703@ubuntu-linux-20-04-desktop>
References: <20250910073827.3622177-1-Penny.Zheng@amd.com> <20250910073827.3622177-14-Penny.Zheng@amd.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 10 Sep 2025, Penny Zheng wrote:
> Function sched_adjust() is responsible for XEN_DOMCTL_scheduler_op domctl-op,
> so it could be wrapped with CONFIG_MGMT_HYPERCALLS.
> Tracing its calling chain, the following functions shall be wrapped with
> CONFIG_MGMT_HYPERCALLS too:
> - sched_adjust_dom()
> - scheduler-specific .adjust() callback
> - xsm_sysctl_scheduler_op()
> Wrap XEN_DOMCTL_scheduler_op-case transiently with CONFIG_MGMT_HYPERCALLS,
> and it will be removed when introducing CONFIG_MGMT_HYPERCALLS on the
> common/domctl.c in the last.
> 
> Signed-off-by: Penny Zheng <Penny.Zheng@amd.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>

