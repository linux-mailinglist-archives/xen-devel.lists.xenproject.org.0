Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C0A473E1B7
	for <lists+xen-devel@lfdr.de>; Mon, 26 Jun 2023 16:14:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.555539.867384 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qDmz3-00086A-QA; Mon, 26 Jun 2023 14:14:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 555539.867384; Mon, 26 Jun 2023 14:14:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qDmz3-000836-M7; Mon, 26 Jun 2023 14:14:25 +0000
Received: by outflank-mailman (input) for mailman id 555539;
 Mon, 26 Jun 2023 14:14:24 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1qDmz2-00082u-Oq
 for xen-devel@lists.xenproject.org; Mon, 26 Jun 2023 14:14:24 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qDmz2-00032u-4h; Mon, 26 Jun 2023 14:14:24 +0000
Received: from [193.85.242.128] (helo=[192.168.148.103])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qDmz1-0005MQ-Vf; Mon, 26 Jun 2023 14:14:24 +0000
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
	bh=FEGRbh+dF/6L5N1zlI8iq4DyMhetv1WYKpNtg10lqGY=; b=4cS5crr9XgbLpCzJLIsdEkyj3a
	lrnzXKW6jJIwwXn5OJPBdlck8YV1ZssWPgwDArxJq+CLrBPBQM7u+gFy65psLTJ8FBczzPK7xLSlH
	wAiWBwXFBmqEfk44UKyOTL70uWKb5OuERynoQ0YHukYZmfFrIsLHvS/vEgFFhl/ObZLo=;
Message-ID: <5c9a625a-cdba-9793-b86a-c49f220aa22c@xen.org>
Date: Mon, 26 Jun 2023 15:14:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.12.0
Subject: Re: [XEN PATCH v3 4/6] xen/arm: vgic: change parameter name in 'init'
 and 'free' functions.
Content-Language: en-US
To: Federico Serafini <federico.serafini@bugseng.com>,
 xen-devel@lists.xenproject.org
Cc: consulting@bugseng.com, Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Xenia Ragiadakou <xenia.ragiadakou@amd.com>,
 Ayan Kumar Halder <ayan.kumar.halder@amd.com>
References: <cover.1687771796.git.federico.serafini@bugseng.com>
 <0332cf060e181d60e249a004182be011f93602a2.1687771796.git.federico.serafini@bugseng.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <0332cf060e181d60e249a004182be011f93602a2.1687771796.git.federico.serafini@bugseng.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 26/06/2023 10:52, Federico Serafini wrote:
> In the current versions of vcpu_vgic_init() and vcpu_vgic_free(),
> the declarations (correctly) use the parameter name 'v' while the
> corresponding definitions use the parameter name 'vcpu'.
> Since it is common to use 'v' to denote a vCPU, change the parameter
> name 'vcpu' of function definitions to 'v', thus fixing violations of
> MISRA C:2012 Rule 8.3.
> 
> Signed-off-by: Federico Serafini <federico.serafini@bugseng.com>

Reviewed-by: Julien Grall <jgrall@amazon.com>

Cheers,

-- 
Julien Grall

