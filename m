Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EE40B93A91B
	for <lists+xen-devel@lfdr.de>; Wed, 24 Jul 2024 00:20:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.763591.1173863 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sWNrJ-00082U-4R; Tue, 23 Jul 2024 22:19:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 763591.1173863; Tue, 23 Jul 2024 22:19:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sWNrJ-00080K-1b; Tue, 23 Jul 2024 22:19:49 +0000
Received: by outflank-mailman (input) for mailman id 763591;
 Tue, 23 Jul 2024 22:19:48 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=zFMf=OX=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1sWNrI-00080E-68
 for xen-devel@lists.xenproject.org; Tue, 23 Jul 2024 22:19:48 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id aaf610d8-4941-11ef-bbfe-fd08da9f4363;
 Wed, 24 Jul 2024 00:19:47 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 5A18960E08;
 Tue, 23 Jul 2024 22:19:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A17CEC4AF0A;
 Tue, 23 Jul 2024 22:19:43 +0000 (UTC)
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
X-Inumbo-ID: aaf610d8-4941-11ef-bbfe-fd08da9f4363
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1721773185;
	bh=49fRrcI3HwdgXKJ2Im6gCqskI+yYpWFEjS/VhNE+ds8=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=ueU7EHuJ90LZWNQoXU2FUxjcmbBoremR7Q5GKfDiQmtYP4PIQKYfO2ky/bWjBj9bV
	 50+FNPO3eabgug/py8Wwv5YC8AQ5EZWThpY4/0VCj98LDpfGvt+yD9O7R94727N1Ql
	 zrf/ZplEfaKap6enoUIXnc8uNl0y21n6mokVURxiQZ4fvvVbR9375b66f2TdaQrPOx
	 y6w0TWBB9BWUg4HsxDWvjzwAO4V5cS0T9R5NyOTh58htcTzuWRwFQZgyKztkotgVgg
	 jty0sUqJtTuEwCu128Gw4qtpKqkF/8nxKD6KwgZx/IJhA0LmWVrxMdE9w7hghDL4NC
	 yrWEaR1OxRC8g==
Date: Tue, 23 Jul 2024 15:19:42 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Alessandro Zucchelli <alessandro.zucchelli@bugseng.com>
cc: xen-devel@lists.xenproject.org, consulting@bugseng.com, 
    Simone Ballarin <simone.ballarin@bugseng.com>, 
    Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich <jbeulich@suse.com>, 
    Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
    "Daniel P. Smith" <dpsmith@apertussolutions.com>, 
    =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
Subject: Re: [XEN PATCH v5 10/17] x86/asm: address violations of MISRA C:2012
 Directive 4.10
In-Reply-To: <20e1d32d9e384f9682fc25d9a55480edd11e344e.1721720583.git.alessandro.zucchelli@bugseng.com>
Message-ID: <alpine.DEB.2.22.394.2407231519340.4857@ubuntu-linux-20-04-desktop>
References: <cover.1721720583.git.alessandro.zucchelli@bugseng.com> <20e1d32d9e384f9682fc25d9a55480edd11e344e.1721720583.git.alessandro.zucchelli@bugseng.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Tue, 23 Jul 2024, Alessandro Zucchelli wrote:
> From: Simone Ballarin <simone.ballarin@bugseng.com>
> 
> Amend generation script, add inclusion guards to address violations
> of MISRA C:2012 Directive 4.10 ("Precautions shall be taken in order
> to prevent the contents of a header file being included more than
> once").
> 
> This patch amends the Makefile adding the required inclusion guards
> for xlat.h.
> 
> Add deviation comment for files intended for multiple inclusion.
> 
> Signed-off-by: Simone Ballarin <simone.ballarin@bugseng.com>
> Signed-off-by: Maria Celeste Cesario  <maria.celeste.cesario@bugseng.com>
> Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
> Signed-off-by: Alessandro Zucchelli <alessandro.zucchelli@bugseng.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>

