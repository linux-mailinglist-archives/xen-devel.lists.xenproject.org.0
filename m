Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 63F8585AE0D
	for <lists+xen-devel@lfdr.de>; Mon, 19 Feb 2024 22:51:17 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.683110.1062448 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rcBWb-0000js-LF; Mon, 19 Feb 2024 21:50:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 683110.1062448; Mon, 19 Feb 2024 21:50:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rcBWb-0000gp-IZ; Mon, 19 Feb 2024 21:50:09 +0000
Received: by outflank-mailman (input) for mailman id 683110;
 Mon, 19 Feb 2024 21:50:07 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1rcBWZ-0000gI-RM
 for xen-devel@lists.xenproject.org; Mon, 19 Feb 2024 21:50:07 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1rcBWY-0000Pl-Nh; Mon, 19 Feb 2024 21:50:06 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.1.193])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1rcBWY-0000ve-Gw; Mon, 19 Feb 2024 21:50:06 +0000
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
	bh=T+ua4vRYlqr9kVihPeu+zRr5UflKETSelYwOUFT1PQE=; b=sApXZCNR9vfCG6FWzEuB5SoqN1
	85NIGWIjIblv3m/aVJZxBqNfElg2w7aOsaXnfpWlH1h432qs1oCQqEwSznWiDziZStefkLL3fIa4A
	8Vy2qstyzcE0Gp37s2ply7uKI6ZigMCoM64CF4Qxa1+RLIjENJPd3PdO/OKwtAyFnL1g=;
Message-ID: <102e4fc2-2ced-42d9-9937-a900a79f4993@xen.org>
Date: Mon, 19 Feb 2024 21:50:04 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] gnttab: fully ignore zero-size copy requests
Content-Language: en-GB
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
References: <a0a7fa35-4615-4a9b-9887-569353f05e33@suse.com>
 <a73f9ba8-8914-4c41-be55-a57c93c571f0@suse.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <a73f9ba8-8914-4c41-be55-a57c93c571f0@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Jan,

On 05/02/2024 11:03, Jan Beulich wrote:
> Along the line with observations in the context of XSA-448, no field in
> struct gnttab_copy_ptr is relevant when no data is to be copied, much
> like e.g. the pointers passed to memcpy() are irrelevant (and would
> never be "validated") when the passed length is zero.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Reviewed-by: Julien Grall <jgrall@amazon.com>

Cheers,

-- 
Julien Grall

