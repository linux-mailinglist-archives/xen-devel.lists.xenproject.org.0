Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B69FE7FEF71
	for <lists+xen-devel@lfdr.de>; Thu, 30 Nov 2023 13:46:16 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.644653.1005983 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r8gQZ-0003oY-7T; Thu, 30 Nov 2023 12:45:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 644653.1005983; Thu, 30 Nov 2023 12:45:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r8gQZ-0003mm-3f; Thu, 30 Nov 2023 12:45:59 +0000
Received: by outflank-mailman (input) for mailman id 644653;
 Thu, 30 Nov 2023 12:45:58 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1r8gQY-0003mg-Bd
 for xen-devel@lists.xenproject.org; Thu, 30 Nov 2023 12:45:58 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1r8gQX-0005gO-M8; Thu, 30 Nov 2023 12:45:57 +0000
Received: from [15.248.2.159] (helo=[10.24.67.31])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1r8gQX-0006R0-GX; Thu, 30 Nov 2023 12:45:57 +0000
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID;
	bh=JXp0gOU6SnUTGAjIsT8TTnPAdP9pMKr3FuizY7+IneQ=; b=TEwoCS7/vU88MndBbmZwKcJ2c/
	RXfDP6WYzYH+rWgFCzcNLxSS1hPxPtPs7yPes4BgTGlNjbkiQaumCJpK4mdq0rhDc9/VndkDgbsQ/
	7joHKD660SC0U22m7ulhBmSEAv1U7Sn+csW7C6T/khJixd2ykaNX0n2PRYwRowCSBSkc=;
Message-ID: <5436bc00-ea19-4cb3-aa14-3de59434a88d@xen.org>
Date: Thu, 30 Nov 2023 12:45:55 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] xen/arm: Move static event channel feature to a
 separate module
Content-Language: en-GB
To: Michal Orzel <michal.orzel@amd.com>, xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20231130095757.11162-1-michal.orzel@amd.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20231130095757.11162-1-michal.orzel@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Michal,

On 30/11/2023 09:57, Michal Orzel wrote:
> Move static event channel feature related code to a separate module
> (static-evtchn.{c,h}) in the spirit of fine granular configuration, so
> that the feature can be disabled if not needed.
> 
> Introduce Kconfig option CONFIG_STATIC_EVTCHN, enabled by default (to
> keep the current behavior) dependent on CONFIG_DOM0LESS. While it could
> be possible to create a loopback connection for dom0 only, this use case
> does not really need this feature and all the docs and commit messages
> refer explicitly to the use in dom0less system.
> 
> The only function visible externally is alloc_static_evtchn(), so move
> the prototype to static-evtchn.h and provide a stub in case a feature
> is disabled. Guard static_evtchn_created in struct dt_device_node as
> well as its helpers.
> 
> Signed-off-by: Michal Orzel <michal.orzel@amd.com>

Acked-by: Julien Grall <jgrall@amazon.com>

Cheers,

-- 
Julien Grall

