Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C00155B7F3
	for <lists+xen-devel@lfdr.de>; Mon, 27 Jun 2022 08:37:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.356230.584324 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o5iMi-0005YI-8f; Mon, 27 Jun 2022 06:36:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 356230.584324; Mon, 27 Jun 2022 06:36:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o5iMi-0005Vp-5y; Mon, 27 Jun 2022 06:36:56 +0000
Received: by outflank-mailman (input) for mailman id 356230;
 Mon, 27 Jun 2022 06:36:54 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=vXPS=XC=arm.com=michal.orzel@srs-se1.protection.inumbo.net>)
 id 1o5iMg-0005Vg-7k
 for xen-devel@lists.xenproject.org; Mon, 27 Jun 2022 06:36:54 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTP
 id 877aa36c-f5e3-11ec-bd2d-47488cf2e6aa;
 Mon, 27 Jun 2022 08:36:52 +0200 (CEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 110221758;
 Sun, 26 Jun 2022 23:36:52 -0700 (PDT)
Received: from [10.57.42.186] (unknown [10.57.42.186])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 4FFE03F5A1;
 Sun, 26 Jun 2022 23:36:50 -0700 (PDT)
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
X-Inumbo-ID: 877aa36c-f5e3-11ec-bd2d-47488cf2e6aa
Message-ID: <d3a1f96d-328a-32c4-993c-7b4cd6cd662b@arm.com>
Date: Mon, 27 Jun 2022 08:36:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH 3/7] xen/arm: head: Add missing isb after writing to
 SCTLR_EL2/HSCTLR
Content-Language: en-US
To: Julien Grall <julien@xen.org>, xen-devel@lists.xenproject.org
Cc: Julien Grall <jgrall@amazon.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20220624091146.35716-1-julien@xen.org>
 <20220624091146.35716-4-julien@xen.org>
From: Michal Orzel <michal.orzel@arm.com>
In-Reply-To: <20220624091146.35716-4-julien@xen.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Julien,

On 24.06.2022 11:11, Julien Grall wrote:
> From: Julien Grall <jgrall@amazon.com>
> 
> Write to SCTLR_EL2/HSCTLR may not be visible until the next context
> synchronization. When initializing the CPU, we want the update to take
> effect right now. So add an isb afterwards.
> 
> Spec references:
>     - AArch64: D13.1.2 ARM DDI 0406C.d
>     - AArch32 v8: G8.1.2 ARM DDI 0406C.d
>     - AArch32 v7: B5.6.3 ARM DDI 0406C.d
> 
> Signed-off-by: Julien Grall <jgrall@amazon.com>
Reviewed-by: Michal Orzel <michal.orzel@arm.com>

Cheers,
Michal

