Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A72F7B1BDB
	for <lists+xen-devel@lfdr.de>; Thu, 28 Sep 2023 14:15:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.609618.948734 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qlpv7-00013Q-NR; Thu, 28 Sep 2023 12:15:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 609618.948734; Thu, 28 Sep 2023 12:15:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qlpv7-00010w-Ko; Thu, 28 Sep 2023 12:15:05 +0000
Received: by outflank-mailman (input) for mailman id 609618;
 Thu, 28 Sep 2023 12:15:04 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1qlpv6-00010g-61
 for xen-devel@lists.xenproject.org; Thu, 28 Sep 2023 12:15:04 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qlpv5-0004fA-3L; Thu, 28 Sep 2023 12:15:03 +0000
Received: from [15.248.3.2] (helo=[10.24.67.34])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qlpv4-0004FW-QH; Thu, 28 Sep 2023 12:15:02 +0000
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
	bh=hcNBIAS9gBqjOWcbxMvlCAKf2weIDKo5xudiBl9DnyE=; b=4Q4BabDPmCSIdgWVVt9qfoDNMs
	+T32fJzTc1ldn59pURtX7kc/XlDcMNhal6FMznJcI8YGr1Pp6tsBLPxn1unCj5inSzvVewtEB7ZUJ
	8FESFJfHljeF3+GKxgQnJG8xX1vXRmmnc9KRyx46YL5CRYH16IoG76bQenXQ07mr7Lcc=;
Message-ID: <9ccd719a-ad1e-4ab0-b15f-056ae629c071@xen.org>
Date: Thu, 28 Sep 2023 13:15:00 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/9] domain: update GADDR based runstate guest area
Content-Language: en-GB
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Henry Wang <Henry.Wang@arm.com>
References: <3ba59868-101d-b68a-d8b7-767ee94910ec@suse.com>
 <fedb0869-a26f-8080-4e3c-7d8f55db00ed@suse.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <fedb0869-a26f-8080-4e3c-7d8f55db00ed@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Jan,

On 28/09/2023 08:15, Jan Beulich wrote:
> Before adding a new vCPU operation to register the runstate area by
> guest-physical address, add code to actually keep such areas up-to-date.
> 
> Note that updating of the area will be done exclusively following the
> model enabled by VMASST_TYPE_runstate_update_flag for virtual-address
> based registered areas.
> 
> Note further that pages aren't marked dirty when written to (matching
> the handling of space mapped by map_vcpu_info()), on the basis that the
> registrations are lost anyway across migration (or would need re-
> populating at the target for transparent migration). Plus the contents
> of the areas in question have to be deemed volatile in the first place
> (so saving a "most recent" value is pretty meaningless even for e.g.
> snapshotting).
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>

Reviewed-by: Julien Grall <jgrall@amazon.com>

Cheers,

-- 
Julien Grall

