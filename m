Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D8E047C9138
	for <lists+xen-devel@lfdr.de>; Sat, 14 Oct 2023 01:13:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.616928.959289 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qrRL7-0001f9-33; Fri, 13 Oct 2023 23:13:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 616928.959289; Fri, 13 Oct 2023 23:13:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qrRL7-0001cF-0R; Fri, 13 Oct 2023 23:13:05 +0000
Received: by outflank-mailman (input) for mailman id 616928;
 Fri, 13 Oct 2023 23:13:03 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=4sWS=F3=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1qrRL5-0001T4-6n
 for xen-devel@lists.xenproject.org; Fri, 13 Oct 2023 23:13:03 +0000
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0d124045-6a1e-11ee-9b0e-b553b5be7939;
 Sat, 14 Oct 2023 01:13:01 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 6E36FCE31DF;
 Fri, 13 Oct 2023 23:12:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4B0A5C433C8;
 Fri, 13 Oct 2023 23:12:56 +0000 (UTC)
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
X-Inumbo-ID: 0d124045-6a1e-11ee-9b0e-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1697238777;
	bh=YXrD7RxguoGKemOAbsD5zWRMjATYaPjRi4C5tjERld8=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=aWia2eXv622IrEKJrp3oIR0QOh8lITlP+2zwjbVUBEEiCiAV7CKfyrBsGJNore2rC
	 hhrHj/bn8GtoSm3vu6mhQxaZHBKBSpHB2CJqO4qk8T8YVIOGgd3Kjm5Avdqy5h16xK
	 ETRxXMpc26gheB9X3LRQ5kdOBZrxNJP/I9UENgAC5SMyLyrY02AO3qZzvrDVxw3WCu
	 Y5xT4QcQUsO698kTksqYeZKNCfiwWXHywtuAKBRwLsrX/7kcstzaQLwCZ9VL+viwHY
	 RSoD3TQYMc5amSUMXGk0JhEDffMHnx+bGQ9Hc8lJQ5b0nClR/CYSrp0GiM+tRcVkUj
	 3lDWjgHfFNFdQ==
Date: Fri, 13 Oct 2023 16:12:54 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Federico Serafini <federico.serafini@bugseng.com>
cc: xen-devel@lists.xenproject.org, consulting@bugseng.com, 
    Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
    Bertrand Marquis <bertrand.marquis@arm.com>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, 
    Henry Wang <henry.wang@arm.com>
Subject: Re: [XEN PATCH 03/10] arm/smpboot: address violations of MISRA C:2012
 Rule 8.2
In-Reply-To: <9ff244730ac8a69598699acf663c086a5272ac82.1697207038.git.federico.serafini@bugseng.com>
Message-ID: <alpine.DEB.2.22.394.2310131612480.965337@ubuntu-linux-20-04-desktop>
References: <cover.1697207038.git.federico.serafini@bugseng.com> <9ff244730ac8a69598699acf663c086a5272ac82.1697207038.git.federico.serafini@bugseng.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Fri, 13 Oct 2023, Federico Serafini wrote:
> Add missing parameter name, no functional change.
> 
> Signed-off-by: Federico Serafini <federico.serafini@bugseng.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>


