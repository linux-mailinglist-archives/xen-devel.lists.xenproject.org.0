Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1892A7B8638
	for <lists+xen-devel@lfdr.de>; Wed,  4 Oct 2023 19:16:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.612702.952756 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qo5Sp-0001qy-Sm; Wed, 04 Oct 2023 17:15:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 612702.952756; Wed, 04 Oct 2023 17:15:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qo5Sp-0001pJ-Pz; Wed, 04 Oct 2023 17:15:11 +0000
Received: by outflank-mailman (input) for mailman id 612702;
 Wed, 04 Oct 2023 17:15:10 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1qo5Sn-0001pD-UQ
 for xen-devel@lists.xenproject.org; Wed, 04 Oct 2023 17:15:09 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qo5Sn-00016E-FP; Wed, 04 Oct 2023 17:15:09 +0000
Received: from [15.248.2.150] (helo=[10.24.67.38])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qo5Sn-0002sa-9U; Wed, 04 Oct 2023 17:15:09 +0000
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
	bh=9SBaCJ5jmMLpQW724D91AuBwgkVyc7rEzdAGKM6wSI8=; b=Kq0yUUrxhSA/nZ0LIZ0S4Ty93s
	3BLrpeSizwmEkAiYW9WGvcLyW8XtEQoDu6FJXDXBzI2jH0CNghZycDGYKNA8DDUpGrJy12m1Zi519
	w4W/vTQN7DCXYLL3zio4q2xQJA3Ue+ui0SnchVZBxp924K3Co9M8qrnPvPehYf6GD+dc=;
Message-ID: <a1e321c9-0067-42db-9a4b-0caa507ea6d1@xen.org>
Date: Wed, 4 Oct 2023 18:15:06 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 10/10] common: convert vCPU info area registration
Content-Language: en-GB
To: Roger Pau Monne <roger.pau@citrix.com>, xen-devel@lists.xenproject.org,
 henry.wang@arm.com
Cc: Jan Beulich <jbeulich@suse.com>, Andrew Cooper
 <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 George Dunlap <george.dunlap@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Tamas K Lengyel <tamas@tklengyel.com>
References: <20231002151127.71020-1-roger.pau@citrix.com>
 <20231002151127.71020-11-roger.pau@citrix.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20231002151127.71020-11-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Roger,

On 02/10/2023 16:11, Roger Pau Monne wrote:
> From: Jan Beulich <jbeulich@suse.com>
> 
> Switch to using map_guest_area(). Noteworthy differences from
> map_vcpu_info():
> - remote vCPU-s are paused rather than checked for being down (which in
>    principle can change right after the check),
> - the domain lock is taken for a much smaller region,
> - the error code for an attempt to re-register the area is now -EBUSY,
> - we could in principle permit de-registration when no area was
>    previously registered (which would permit "probing", if necessary for
>    anything).
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>

Acked-by: Julien Grall <jgrall@amazon.com>

Cheers,

-- 
Julien Grall

