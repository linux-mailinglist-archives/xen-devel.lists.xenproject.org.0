Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 76EE1915B59
	for <lists+xen-devel@lfdr.de>; Tue, 25 Jun 2024 03:00:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.747116.1154443 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sLuXq-0001mE-Oh; Tue, 25 Jun 2024 01:00:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 747116.1154443; Tue, 25 Jun 2024 01:00:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sLuXq-0001ib-MA; Tue, 25 Jun 2024 01:00:26 +0000
Received: by outflank-mailman (input) for mailman id 747116;
 Tue, 25 Jun 2024 01:00:25 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=cmkP=N3=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1sLuXp-00015h-6j
 for xen-devel@lists.xenproject.org; Tue, 25 Jun 2024 01:00:25 +0000
Received: from sin.source.kernel.org (sin.source.kernel.org
 [2604:1380:40e1:4800::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4b87f191-328e-11ef-b4bb-af5377834399;
 Tue, 25 Jun 2024 03:00:22 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id E8408CE171F;
 Tue, 25 Jun 2024 01:00:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 64832C32786;
 Tue, 25 Jun 2024 01:00:18 +0000 (UTC)
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
X-Inumbo-ID: 4b87f191-328e-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719277219;
	bh=yZRv4I1j+Yh0zi1aEJXlacr6CoXERhyV6nWJ7oMqjtw=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=Xa8lK4zPzLSZxHBPAbg9p+4pShZRfFYoi0+SQbPja2c4DujG+P01Mq70DMYOFReV8
	 IDsUeIN1vPu2SUh4YWeupjab0Xh+ORvyyrXNh8mv8NkCa6Ha+PBs9J31ks6SSFVNUn
	 t29kcrDTTF9DBTx4CRfQFy/mmESViz+zN48xlYfHiORNyrEtzQmnMbNvD5h7yxdy3j
	 1NLkeqHm+OXzr0O/mN/PJIk48EklvEF4lAYp3nInbQKKx9/8X8DQxAYosvWQO9zsPv
	 OkHxsDwjhaDAzr0lxoyP5/3QVmUdXA5TG17TmxSpDG9dT4rHC33L8LnrytTpqbq1wr
	 mKoMB6KMiub9g==
Date: Mon, 24 Jun 2024 18:00:17 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Federico Serafini <federico.serafini@bugseng.com>
cc: xen-devel@lists.xenproject.org, consulting@bugseng.com, 
    Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Subject: Re: [XEN PATCH v2 12/13] x86/vPIC: address a violation of MISRA C
 Rule 16.3
In-Reply-To: <bf0f2ac1c8e9443b2c4f8ae6f02659927d5f7dea.1719218291.git.federico.serafini@bugseng.com>
Message-ID: <alpine.DEB.2.22.394.2406241800080.3870429@ubuntu-linux-20-04-desktop>
References: <cover.1719218291.git.federico.serafini@bugseng.com> <bf0f2ac1c8e9443b2c4f8ae6f02659927d5f7dea.1719218291.git.federico.serafini@bugseng.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 24 Jun 2024, Federico Serafini wrote:
> Add pseudokeyword fallthrough to meet the requirements to deviate
> a violation of MISRA C Rul 16.3: "An unconditional `break' statement
> shall terminate every switch-clause".
> 
> No functional change.
> 
> Signed-off-by: Federico Serafini <federico.serafini@bugseng.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>

