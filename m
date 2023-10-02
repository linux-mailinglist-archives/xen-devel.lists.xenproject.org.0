Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B9C157B57FB
	for <lists+xen-devel@lfdr.de>; Mon,  2 Oct 2023 18:41:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.611737.951262 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qnLyE-0004XC-K5; Mon, 02 Oct 2023 16:40:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 611737.951262; Mon, 02 Oct 2023 16:40:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qnLyE-0004VF-HY; Mon, 02 Oct 2023 16:40:34 +0000
Received: by outflank-mailman (input) for mailman id 611737;
 Mon, 02 Oct 2023 16:40:33 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1qnLyD-0004Ut-43
 for xen-devel@lists.xenproject.org; Mon, 02 Oct 2023 16:40:33 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qnLyC-0002zn-IS; Mon, 02 Oct 2023 16:40:32 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.1.240])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qnLyC-0000sS-Ce; Mon, 02 Oct 2023 16:40:32 +0000
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
	bh=HJmPEzWyLSmPQr5xBmQXCbIO0QDDqMAOLEdSZ0IC2Cs=; b=3CMNEG9HgIda4LUnADHKbi4S6W
	Kjryn0ezNbIA8rodoyPtnJb0Be10uCtlcHXRrKXDPd4Z9jridvDs7WhYGlzt3MvWHA6n7r7tE1tps
	IZ8yXhdBbN5BpesC9yTPLRV6TisqI5Ev/pXzTBxYL+5iNV6GHWMfFGQj7R59YvLNqkUM=;
Message-ID: <e834181b-84ed-48a9-ba2c-688a71581d17@xen.org>
Date: Mon, 2 Oct 2023 17:40:30 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 07/10] domain: map/unmap GADDR based shared guest areas
Content-Language: en-GB
To: Roger Pau Monne <roger.pau@citrix.com>, xen-devel@lists.xenproject.org,
 henry.wang@arm.com
Cc: Jan Beulich <jbeulich@suse.com>, Andrew Cooper
 <andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
References: <20231002151127.71020-1-roger.pau@citrix.com>
 <20231002151127.71020-8-roger.pau@citrix.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20231002151127.71020-8-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 02/10/2023 16:11, Roger Pau Monne wrote:
> From: Jan Beulich <jbeulich@suse.com>
> 
> The registration by virtual/linear address has downsides: At least on
> x86 the access is expensive for HVM/PVH domains. Furthermore for 64-bit
> PV domains the areas are inaccessible (and hence cannot be updated by
> Xen) when in guest-user mode, and for HVM guests they may be
> inaccessible when Meltdown mitigations are in place. (There are yet
> more issues.)
> 
> In preparation of the introduction of new vCPU operations allowing to
> register the respective areas (one of the two is x86-specific) by
> guest-physical address, flesh out the map/unmap functions.
> 
> Noteworthy differences from map_vcpu_info():
> - areas can be registered more than once (and de-registered),
> - remote vCPU-s are paused rather than checked for being down (which in
>    principle can change right after the check),
> - the domain lock is taken for a much smaller region.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>

Reviewed-by: Julien Grall <jgrall@amazon.com>

Cheers,

-- 
Julien Grall

