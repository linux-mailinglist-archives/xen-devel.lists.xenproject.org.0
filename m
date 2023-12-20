Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AD2C4819615
	for <lists+xen-devel@lfdr.de>; Wed, 20 Dec 2023 02:05:06 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.657303.1026100 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rFl16-0002i8-Eh; Wed, 20 Dec 2023 01:04:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 657303.1026100; Wed, 20 Dec 2023 01:04:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rFl16-0002fs-Bw; Wed, 20 Dec 2023 01:04:56 +0000
Received: by outflank-mailman (input) for mailman id 657303;
 Wed, 20 Dec 2023 01:04:54 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=wrkk=H7=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1rFl14-0002fk-UQ
 for xen-devel@lists.xenproject.org; Wed, 20 Dec 2023 01:04:54 +0000
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c7ada677-9ed3-11ee-98eb-6d05b1d4d9a1;
 Wed, 20 Dec 2023 02:04:53 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 1149ECE173B;
 Wed, 20 Dec 2023 01:04:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EB94DC433C7;
 Wed, 20 Dec 2023 01:04:46 +0000 (UTC)
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
X-Inumbo-ID: c7ada677-9ed3-11ee-98eb-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1703034288;
	bh=ZARb1ie99bVjEed3N8JeJZyrEwjxFxxRkjCnJUE2XfQ=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=etX/IXPTz/k+y6xdfid+4mauYCoktkwRJ2iy34zJvJzHMXRbbthoaWJkSJaNh95QN
	 Jd723ptA6TCcUW06ivnIPudnOOuI5wKDlQVa6jbNC8Zc9uob9zl0S6q8b6OxkCh1UU
	 p22mIM3dmKp1Hd8jfmZYdC56evxZSzjYYM8fYF14NOpW8irKkxEFHL43VjnNz8EZQ5
	 iB5BEqriOkYCSRMMcpeFbtxwPieSByMJcwmOUbwIaY+pfWKzvwcnb0CyQEl8a8uVxE
	 X9NNVT0rd47cIcFStNC/+rZi46KvwRzd5cSPJ18KYsYM+fTEkR/AiPFcv8RFo4bxMv
	 HtiEhxJ29hOBA==
Date: Tue, 19 Dec 2023 17:04:45 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Simone Ballarin <simone.ballarin@bugseng.com>
cc: xen-devel@lists.xenproject.org, consulting@bugseng.com, 
    Maria Celeste Cesario <maria.celeste.cesario@bugseng.com>, 
    Doug Goldstein <cardoe@cardoe.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, 
    Andrew Cooper <andrew.cooper3@citrix.com>, 
    George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>, 
    Julien Grall <julien@xen.org>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH v2 3/6] xen: add deviations for Rule 11.8
In-Reply-To: <04cdbf21db915634acd49108edab7d6331df35eb.1702982442.git.maria.celeste.cesario@bugseng.com>
Message-ID: <alpine.DEB.2.22.394.2312191704370.3175268@ubuntu-linux-20-04-desktop>
References: <cover.1702982442.git.maria.celeste.cesario@bugseng.com> <04cdbf21db915634acd49108edab7d6331df35eb.1702982442.git.maria.celeste.cesario@bugseng.com>
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
> The macro 'container_of' violates the Rule because it casts away any
> qualifier to do pointer arithmetic, but making the macro definition compliant
> would add additional complexity, therefore a deviation is introduced.
> 
> Signed-off-by: Maria Celeste Cesario  <maria.celeste.cesario@bugseng.com>
> Signed-off-by: Simone Ballarin  <simone.ballarin@bugseng.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>

