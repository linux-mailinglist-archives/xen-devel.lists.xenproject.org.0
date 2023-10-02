Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DA57C7B57FC
	for <lists+xen-devel@lfdr.de>; Mon,  2 Oct 2023 18:43:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.611741.951272 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qnM0q-0006qF-0o; Mon, 02 Oct 2023 16:43:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 611741.951272; Mon, 02 Oct 2023 16:43:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qnM0p-0006o1-UI; Mon, 02 Oct 2023 16:43:15 +0000
Received: by outflank-mailman (input) for mailman id 611741;
 Mon, 02 Oct 2023 16:43:14 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1qnM0o-0006nv-4q
 for xen-devel@lists.xenproject.org; Mon, 02 Oct 2023 16:43:14 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qnM0n-00033f-T7; Mon, 02 Oct 2023 16:43:13 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.1.240])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qnM0n-0000x6-N7; Mon, 02 Oct 2023 16:43:13 +0000
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
	bh=8006YkH9ydsFANsTCBrc6SwYxgC2j8JtO6yokOppBGI=; b=oTI5icv6NUDfBMtYtNEe6sUhLu
	ikem5RYlQDK/Wa3MrLqtsvdlqy8G83ITPLAM9FGO6szuZCx8FagWrZbIu7yr7bxL9cZoGQQyye1uM
	OJaz+Czo+Df/ntw3A+zOXgjBgP70LkF4e5/8mz5zaDUvKmjdjfAb4gHOUGipshx7mOxU=;
Message-ID: <dce084ca-a5e7-4647-b651-13e1a118afe2@xen.org>
Date: Mon, 2 Oct 2023 17:43:12 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 08/10] domain: introduce GADDR based runstate area
 registration alternative
Content-Language: en-GB
To: Roger Pau Monne <roger.pau@citrix.com>, xen-devel@lists.xenproject.org,
 henry.wang@arm.com
Cc: Jan Beulich <jbeulich@suse.com>, Andrew Cooper
 <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 George Dunlap <george.dunlap@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>
References: <20231002151127.71020-1-roger.pau@citrix.com>
 <20231002151127.71020-9-roger.pau@citrix.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20231002151127.71020-9-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi,

On 02/10/2023 16:11, Roger Pau Monne wrote:
> From: Jan Beulich <jbeulich@suse.com>
> 
> The registration by virtual/linear address has downsides: At least on
> x86 the access is expensive for HVM/PVH domains. Furthermore for 64-bit
> PV domains the area is inaccessible (and hence cannot be updated by Xen)
> when in guest-user mode.
> 
> Introduce a new vCPU operation allowing to register the runstate area by
> guest-physical address.
> 
> An at least theoretical downside to using physically registered areas is
> that PV then won't see dirty (and perhaps also accessed) bits set in its
> respective page table entries.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>

Acked-by: Julien Grall <jgrall@amazon.com>

Cheers,

-- 
Julien Grall

