Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 60B247C9143
	for <lists+xen-devel@lfdr.de>; Sat, 14 Oct 2023 01:21:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.616947.959350 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qrRSh-0006ni-1Q; Fri, 13 Oct 2023 23:20:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 616947.959350; Fri, 13 Oct 2023 23:20:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qrRSg-0006l6-Uz; Fri, 13 Oct 2023 23:20:54 +0000
Received: by outflank-mailman (input) for mailman id 616947;
 Fri, 13 Oct 2023 23:20:53 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=4sWS=F3=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1qrRSf-0006ko-FN
 for xen-devel@lists.xenproject.org; Fri, 13 Oct 2023 23:20:53 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [2604:1380:4641:c500::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 25bd2fb7-6a1f-11ee-9b0e-b553b5be7939;
 Sat, 14 Oct 2023 01:20:51 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 0A0A46220E;
 Fri, 13 Oct 2023 23:20:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5B49FC433C8;
 Fri, 13 Oct 2023 23:20:48 +0000 (UTC)
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
X-Inumbo-ID: 25bd2fb7-6a1f-11ee-9b0e-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1697239249;
	bh=9Tjm6p7ILBYhSzdzMpdp8tiUSJQnyt4VygEsY5DEOqE=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=sRclEnQaVJ6xr9UN0nz7v/ETLowxEuh/62iEht074BigxFHDD/OhQmNAvGTMCtNa2
	 wLMvwyQ9toIBZJCNUr9nUD1Pf+pV8W0ZyDk5PI8Z7k7PCnC/mraW09CY7EOkJbtO9g
	 cIBNcpwX1CnjI3Om0txpmtAU4lsHGXZj5oJjBCEd1gj2vLptZOiOXDU2APsmPmqRs9
	 8aqwr72CR7SDY7FZst7AznWGSmDXY5yIw0TKo1y1dWT4ELi6Kz5tqqTg9Sj6alcej8
	 U4HnSfg1kDHM0X6zVCMGZu4NQ9Hw/jhmbMvXnYY6jztBno7CM2iyUNxFNLH1mKh9mL
	 I0P3EvzuA4DHA==
Date: Fri, 13 Oct 2023 16:20:47 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Federico Serafini <federico.serafini@bugseng.com>
cc: xen-devel@lists.xenproject.org, consulting@bugseng.com, 
    Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
    Bertrand Marquis <bertrand.marquis@arm.com>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, 
    Henry Wang <henry.wang@arm.com>
Subject: Re: [XEN PATCH 09/10] arm/domain: address violations of MISRA C:2012
 Rule 8.2
In-Reply-To: <8bf0994b7796ecca215f73a6a1f5acc892bd2a97.1697207038.git.federico.serafini@bugseng.com>
Message-ID: <alpine.DEB.2.22.394.2310131620400.965337@ubuntu-linux-20-04-desktop>
References: <cover.1697207038.git.federico.serafini@bugseng.com> <8bf0994b7796ecca215f73a6a1f5acc892bd2a97.1697207038.git.federico.serafini@bugseng.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Fri, 13 Oct 2023, Federico Serafini wrote:
> Add missing parameter names, no funtional change.
> 
> Signed-off-by: Federico Serafini <federico.serafini@bugseng.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>


