Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8475691757B
	for <lists+xen-devel@lfdr.de>; Wed, 26 Jun 2024 03:17:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.748222.1155821 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sMHHK-0005zq-Ma; Wed, 26 Jun 2024 01:16:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 748222.1155821; Wed, 26 Jun 2024 01:16:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sMHHK-0005xk-Js; Wed, 26 Jun 2024 01:16:54 +0000
Received: by outflank-mailman (input) for mailman id 748222;
 Wed, 26 Jun 2024 01:16:53 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=dBdT=N4=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1sMHHJ-0005xc-Jl
 for xen-devel@lists.xenproject.org; Wed, 26 Jun 2024 01:16:53 +0000
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c33ba5fe-3359-11ef-90a3-e314d9c70b13;
 Wed, 26 Jun 2024 03:16:51 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 1F8A4CE1FF3;
 Wed, 26 Jun 2024 01:16:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 60774C32786;
 Wed, 26 Jun 2024 01:16:43 +0000 (UTC)
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
X-Inumbo-ID: c33ba5fe-3359-11ef-90a3-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719364604;
	bh=mYuIZGRRFgZSvymB2gMePHVyb38V4g5zhBo001tFvY4=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=UnLornJyoV+yChTwX8tIFST9Ny2rE+x/T+O0g05uTmctR/4w25SFrg3zo9tRALEiU
	 qm4pma2nK4E9Rq6+h3GW6GPSJSjlWBBpNBoeKEwRnhcHhjZw9SCwtIXgiKDGFifco2
	 NSpeRz5vzdgaXP1dBVUjJV+BWPRaI/9xcUWxpdYY1l+wE/zFAvki5vfGCgswGY6xhP
	 yHzW0i2k0IzUjBqGkqOin61XwdeY9mOhY60ClGZiKEMwVRS0tZPqn8m0M29at2rBWz
	 mhKcKO24xrgqFben49S/l5a+snZ3Dc9Z5vJ0jDLHONA9u8RoGnOB3bG8S0kfR3ZtL3
	 7C8zqb3+4dJVw==
Date: Tue, 25 Jun 2024 18:16:41 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Alessandro Zucchelli <alessandro.zucchelli@bugseng.com>
cc: xen-devel@lists.xenproject.org, consulting@bugseng.com, 
    Andrew Cooper <andrew.cooper3@citrix.com>, 
    George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>, 
    Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH 2/3] xen/event: address violation of MISRA C Rule 13.6
In-Reply-To: <d48b73a3c5c569f95da424fe9e14a7690b1c69f8.1719308599.git.alessandro.zucchelli@bugseng.com>
Message-ID: <alpine.DEB.2.22.394.2406251816350.3635@ubuntu-linux-20-04-desktop>
References: <cover.1719308599.git.alessandro.zucchelli@bugseng.com> <d48b73a3c5c569f95da424fe9e14a7690b1c69f8.1719308599.git.alessandro.zucchelli@bugseng.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Tue, 25 Jun 2024, Alessandro Zucchelli wrote:
> In the file include/xen/event.h macro set_bit is called with argument
> current->pause_flags.
> Once expanded this set_bit's argument is used in sizeof operations
> and thus 'current', being a macro that expands to a function
> call with potential side effects, generates a violation.
> 
> To address this violation the value of current is therefore stored in a
> variable called 'v' before passing it to macro set_bit.
> 
> No functional change.
> 
> Signed-off-by: Alessandro Zucchelli <alessandro.zucchelli@bugseng.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>


