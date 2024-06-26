Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F1CDD91757D
	for <lists+xen-devel@lfdr.de>; Wed, 26 Jun 2024 03:19:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.748226.1155830 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sMHJO-0006Za-1m; Wed, 26 Jun 2024 01:19:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 748226.1155830; Wed, 26 Jun 2024 01:19:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sMHJN-0006XF-VD; Wed, 26 Jun 2024 01:19:01 +0000
Received: by outflank-mailman (input) for mailman id 748226;
 Wed, 26 Jun 2024 01:19:00 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=dBdT=N4=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1sMHJM-0006X9-SC
 for xen-devel@lists.xenproject.org; Wed, 26 Jun 2024 01:19:00 +0000
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0f545d9a-335a-11ef-b4bb-af5377834399;
 Wed, 26 Jun 2024 03:18:58 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 1158CCE1A8D;
 Wed, 26 Jun 2024 01:18:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5CE54C32781;
 Wed, 26 Jun 2024 01:18:52 +0000 (UTC)
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
X-Inumbo-ID: 0f545d9a-335a-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719364733;
	bh=GXxfSzn4lCB7+fTOy+8iKjcHuLw8SXgAhM2oZsYQQjM=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=RIccIQ9eXXZ9PCeE5vQ3cDJtV0Kr4Quh2y7D1DUWMsV3iTmYj5hsQE3t4kL366i8d
	 UjFulKM2NQ0YCaSQChpacZxJ/SY22s+AK/3chY7xl5rsXLsNczBmznlF3wMG7dZ31h
	 elxiLLjYCGnK0a6RARef8wrZoF4AX5ERH3IgzXPiaY7u50lO3iKD94UhOTeaLwu+fY
	 TBC6mCWuX+yU7sJ8WdNOHl0LpH3jozt1lRcIJEejcg53cp6rlJsYT1p3PAMxU1U2S+
	 SjJo0MHCs0NC8SzkBSVh1LntMQFUp5MS+x64ZA6q/JY+gIJsfnX2GsL/WlXUz8qIqH
	 ElyGwPTBk43FA==
Date: Tue, 25 Jun 2024 18:18:50 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Alessandro Zucchelli <alessandro.zucchelli@bugseng.com>
cc: xen-devel@lists.xenproject.org, consulting@bugseng.com, 
    Andrew Cooper <andrew.cooper3@citrix.com>, 
    George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>, 
    Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH 3/3] common/softirq: address violation of MISRA C Rule
 13.6
In-Reply-To: <ab8b527c775fbb7681a4658828d53e7e3419be10.1719308599.git.alessandro.zucchelli@bugseng.com>
Message-ID: <alpine.DEB.2.22.394.2406251818430.3635@ubuntu-linux-20-04-desktop>
References: <cover.1719308599.git.alessandro.zucchelli@bugseng.com> <ab8b527c775fbb7681a4658828d53e7e3419be10.1719308599.git.alessandro.zucchelli@bugseng.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Tue, 25 Jun 2024, Alessandro Zucchelli wrote:
> In the file common/softirq macro set_bit is called with argument
> smp_processor_id.
> Once expanded this set_bit's argument is used in sizeof operations
> and thus 'smp_processor_id', being a macro that expands to a
> function call with potential side effects, generates a violation.
> 
> To address this violation the value of smp_processor_id is therefore
> stored in a variable called 'cpu' before passing it to macro set_bit.
> 
> No functional change.
> 
> Signed-off-by: Alessandro Zucchelli <alessandro.zucchelli@bugseng.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>

