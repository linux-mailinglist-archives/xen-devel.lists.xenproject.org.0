Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 913886008F9
	for <lists+xen-devel@lfdr.de>; Mon, 17 Oct 2022 10:44:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.424184.671431 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1okLjM-0006iV-U1; Mon, 17 Oct 2022 08:44:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 424184.671431; Mon, 17 Oct 2022 08:44:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1okLjM-0006fo-R2; Mon, 17 Oct 2022 08:44:16 +0000
Received: by outflank-mailman (input) for mailman id 424184;
 Mon, 17 Oct 2022 08:44:15 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1okLjL-0006fZ-H0
 for xen-devel@lists.xenproject.org; Mon, 17 Oct 2022 08:44:15 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1okLjL-0002eQ-1k; Mon, 17 Oct 2022 08:44:15 +0000
Received: from [15.248.2.148] (helo=[10.24.69.10])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1okLjK-0002ye-Rg; Mon, 17 Oct 2022 08:44:14 +0000
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
	bh=d9ifgK0FuIvjPrL8CGD0oqifqyGE2vSmVhEoda0/Fiw=; b=DLwVL08rjG26SIc2lOe/zQ38zI
	ugMua3epuF+6BS/yEqJNeJAAUbPIOaewbnxWpQeaalKweRIbhhVimpb2wcjiBKxtHfxFHttoQCZpc
	k0CwPlSu1Jk9TqHaYCWV8/exRNBfIS1NQadJM7v0Z9+H+obRN0KZlWxXk7cSRO67me8U=;
Message-ID: <b61624ad-f631-b09a-0e3e-598b8982a0ee@xen.org>
Date: Mon, 17 Oct 2022 09:44:12 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.3.3
Subject: Re: [PATCH 06/12] xen/common: add cache coloring allocator for
 domains
Content-Language: en-US
To: Michal Orzel <michal.orzel@amd.com>,
 Carlo Nonato <carlo.nonato@minervasys.tech>, xen-devel@lists.xenproject.org
Cc: andrew.cooper3@citrix.com, george.dunlap@citrix.com, jbeulich@suse.com,
 stefano.stabellini@amd.com, wl@xen.org, marco.solieri@unimore.it,
 andrea.bastoni@minervasys.tech, lucmiccio@gmail.com,
 Marco Solieri <marco.solieri@minervasys.tech>
References: <20220826125111.152261-1-carlo.nonato@minervasys.tech>
 <20220826125111.152261-7-carlo.nonato@minervasys.tech>
 <ff6a5e85-0867-2e22-e173-15805bfc7843@amd.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <ff6a5e85-0867-2e22-e173-15805bfc7843@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 17/10/2022 08:06, Michal Orzel wrote:
> On 26/08/2022 14:51, Carlo Nonato wrote:
> Apart from that, the memory coming from the buddy is of any color. Shouldn't it be that the memory
> allocated for domains comes from colored memory of the colors assigned to them and anything else
> should come from colors given to Xen? At the moment, the memory for e.g. allocating P2M tables comes
> from the buddy which means it can be of any color and might cause some cache interference.

Somewhat related. IIUC what you are saying, the P2M pool will still be 
allocated from the buddy. I would expect we want to instead allocate the 
P2M pool from the same color as the domain to prevent interference when 
the TLBs are loaded. Or is the interference negligible?

Cheers,

-- 
Julien Grall

