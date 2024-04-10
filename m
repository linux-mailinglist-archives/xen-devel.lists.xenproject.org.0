Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 46AAC8A031F
	for <lists+xen-devel@lfdr.de>; Thu, 11 Apr 2024 00:16:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.703670.1099466 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rugEk-0007be-OD; Wed, 10 Apr 2024 22:16:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 703670.1099466; Wed, 10 Apr 2024 22:16:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rugEk-0007ZL-LK; Wed, 10 Apr 2024 22:16:10 +0000
Received: by outflank-mailman (input) for mailman id 703670;
 Wed, 10 Apr 2024 22:16:09 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=rcYN=LP=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1rugEj-0007YI-7l
 for xen-devel@lists.xenproject.org; Wed, 10 Apr 2024 22:16:09 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [2604:1380:4641:c500::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ed80821b-f787-11ee-b908-491648fe20b8;
 Thu, 11 Apr 2024 00:16:08 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id E8F2261D0F;
 Wed, 10 Apr 2024 22:16:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 86AA8C433F1;
 Wed, 10 Apr 2024 22:16:05 +0000 (UTC)
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
X-Inumbo-ID: ed80821b-f787-11ee-b908-491648fe20b8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1712787366;
	bh=46IkWD+AwYLdXm+T3R5SOQtm9GRT7B94y+pScVw/Hoc=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=CGcMFCflZX1AHYYt7tTki8sZAU1GhJ5e2GPrSOgixX7zKVJ6a+OYhdO4rYCb1ShPn
	 r+7QBRIMl4czauDb/mksfwmmyusiR04dd/EEsap9N9zXz2qVeRGgEHiWYX+X1vQ5ED
	 TcO45zfze17vkBKW3j8/+9m8z4E0yH2J9uHyNur+kGzefT0vyOM3Y5OGC2JcJ6T9/6
	 +7zYqu3FUImznldI8z3A6NmrQ7wsUqK6GixAZcpn58tWJNLLo9CPIbYNR+BhDZ2aMM
	 1K8QaT0eiMNc+hRlEjxdkUw+FrbrMAXYED0v+hsUsf4zFFtEhGwzm1MaZnSBt3rYhw
	 kMItsFemiTYtg==
Date: Wed, 10 Apr 2024 15:16:04 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Andrew Cooper <andrew.cooper3@citrix.com>
cc: Xen-devel <xen-devel@lists.xenproject.org>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, 
    "consulting @ bugseng . com" <consulting@bugseng.com>, 
    Roberto Bagnara <roberto.bagnara@bugseng.com>, 
    Federico Serafini <federico.serafini@bugseng.com>, 
    Nicola Vetrini <nicola.vetrini@bugseng.com>
Subject: Re: [PATCH] xen/vPCI: Remove shadowed variable
In-Reply-To: <20240410193348.1492018-1-andrew.cooper3@citrix.com>
Message-ID: <alpine.DEB.2.22.394.2404101515580.711344@ubuntu-linux-20-04-desktop>
References: <20240410193348.1492018-1-andrew.cooper3@citrix.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 10 Apr 2024, Andrew Cooper wrote:
> Resolves a MISRA R5.3 violation.
> 
> Fixes: 622bdd962822 ("vpci/header: handle p2m range sets per BAR")
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>

