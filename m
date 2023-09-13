Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9703679DD8C
	for <lists+xen-devel@lfdr.de>; Wed, 13 Sep 2023 03:29:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.600924.936767 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qgEgZ-0002Uj-D9; Wed, 13 Sep 2023 01:28:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 600924.936767; Wed, 13 Sep 2023 01:28:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qgEgZ-0002Ru-AW; Wed, 13 Sep 2023 01:28:55 +0000
Received: by outflank-mailman (input) for mailman id 600924;
 Wed, 13 Sep 2023 01:28:54 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=VxlT=E5=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1qgEgY-0002Ro-TG
 for xen-devel@lists.xenproject.org; Wed, 13 Sep 2023 01:28:54 +0000
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e6498188-51d4-11ee-8786-cb3800f73035;
 Wed, 13 Sep 2023 03:28:53 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 1AD34B81E16;
 Wed, 13 Sep 2023 01:28:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 97017C433C7;
 Wed, 13 Sep 2023 01:28:50 +0000 (UTC)
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
X-Inumbo-ID: e6498188-51d4-11ee-8786-cb3800f73035
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1694568531;
	bh=r9wJKqQ6CVq4/n9sB6DY3jMGidNE8gSANBvSkExa0dg=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=olZ8aDmB/AfSA/fXW2aVePtMSukQ9VPke2fUMh3Fj/5Iwm49j+TY9R6DndH/eE8AV
	 DLrGPUP5B6PQ2loQMUvbhKixr13Jjy/s/Umf31TW9adw0RBiiXDOdiEhn7DCxMns2G
	 IJ6JQHxA0wbGdaMVQaIbwpOwS2eDgqKOkAIZyUE1iSH2kcXhYBBRjvQJsOTYpLUDaF
	 0VSMNfdpMa457ukX84/jpQ1zB916e1H0Sbj+u/CD1amR0FFFmsiezmXMI0u2+BAgy+
	 +wRewxDqHOjSSSHsKkIy9PU7VmAoOVyGG7Cp24Jr1kmO1k3Lv6ohBA9Xv0dDcnN0WN
	 f/3cxOezEtVig==
Date: Tue, 12 Sep 2023 18:28:48 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Simone Ballarin <simone.ballarin@bugseng.com>
cc: xen-devel@lists.xenproject.org, consulting@bugseng.com, 
    sstabellini@kernel.org, Jan Beulich <jbeulich@suse.com>, 
    Andrew Cooper <andrew.cooper3@citrix.com>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
    Wei Liu <wl@xen.org>, Gianluca Luparini <gianluca.luparini@bugseng.com>
Subject: Re: [XEN PATCH v6 2/7] x86/hvm: address violations of MISRA C:2012
 Rule 7.2
In-Reply-To: <1231f5eeebf6f2e30b91780e92dc4d6015cefdb7.1694532795.git.simone.ballarin@bugseng.com>
Message-ID: <alpine.DEB.2.22.394.2309121828400.2295162@ubuntu-linux-20-04-desktop>
References: <cover.1694532795.git.simone.ballarin@bugseng.com> <1231f5eeebf6f2e30b91780e92dc4d6015cefdb7.1694532795.git.simone.ballarin@bugseng.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Tue, 12 Sep 2023, Simone Ballarin wrote:
> The xen sources contains violations of MISRA C:2012 Rule 7.2 whose
> headline states:
> "A 'u' or 'U' suffix shall be applied to all integer constants
> that are represented in an unsigned type".
> 
> Add the 'U' suffix to integers literals with unsigned type.
> 
> For the sake of uniformity, the following change is made:
> - add 'U' suffixes to 'mask16' in 'stdvga.c'
> 
> Signed-off-by: Simone Ballarin <simone.ballarin@bugseng.com>
> Signed-off-by: Gianluca Luparini <gianluca.luparini@bugseng.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>


