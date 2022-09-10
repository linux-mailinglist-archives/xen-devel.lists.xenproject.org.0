Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B89665B473D
	for <lists+xen-devel@lfdr.de>; Sat, 10 Sep 2022 17:13:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.404775.647355 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oX29b-00060G-Rc; Sat, 10 Sep 2022 15:12:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 404775.647355; Sat, 10 Sep 2022 15:12:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oX29b-0005yT-OS; Sat, 10 Sep 2022 15:12:19 +0000
Received: by outflank-mailman (input) for mailman id 404775;
 Sat, 10 Sep 2022 15:12:18 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1oX29a-0005yN-9I
 for xen-devel@lists.xenproject.org; Sat, 10 Sep 2022 15:12:18 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1oX29Z-0006Bk-LX; Sat, 10 Sep 2022 15:12:17 +0000
Received: from home.octic.net ([81.187.162.82] helo=[10.0.1.102])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1oX29Z-0007CG-Ey; Sat, 10 Sep 2022 15:12:17 +0000
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
	bh=coysem2E7p4X/oqTQYB6UNY9yBkvc9J+W5qwCElr7vw=; b=YuQr+p1n7Wae/Hr6zrYD0GCGMX
	eV6chw/QqAedWj2/ESaZPSyx+8y9E8VJIVMTvcNM5FbK3oTJJMls9RzPMYun/TkmEegmiq8Azu5si
	iVGGxP4A6OiAxWZ711Z9kea9HFF+9wwclQ6MdMEYpYSwvoWpdIiJZJzc5VbfQZww3JZc=;
Message-ID: <ec492136-53c2-8cdb-ad01-b3b232d3bc85@xen.org>
Date: Sat, 10 Sep 2022 16:12:14 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.13.0
Subject: Re: [PATCH 00/12] Arm cache coloring
To: Carlo Nonato <carlo.nonato@minervasys.tech>,
 xen-devel@lists.xenproject.org
Cc: andrew.cooper3@citrix.com, george.dunlap@citrix.com, jbeulich@suse.com,
 stefano.stabellini@amd.com, wl@xen.org, marco.solieri@unimore.it,
 andrea.bastoni@minervasys.tech, lucmiccio@gmail.com
References: <20220826125111.152261-1-carlo.nonato@minervasys.tech>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20220826125111.152261-1-carlo.nonato@minervasys.tech>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Carlo,

On 26/08/2022 13:50, Carlo Nonato wrote:
> Shared caches in multi-core CPU architectures represent a problem for
> predictability of memory access latency. This jeopardizes applicability
> of many Arm platform in real-time critical and mixed-criticality
> scenarios. We introduce support for cache partitioning with page
> coloring, a transparent software technique that enables isolation
> between domains and Xen, and thus avoids cache interference.
> 
> When creating a domain, a simple syntax (e.g. `0-3` or `4-11`) allows
> the user to define assignments of cache partitions ids, called colors,
> where assigning different colors guarantees no mutual eviction on cache
> will ever happen. This instructs the Xen memory allocator to provide
> the i-th color assignee only with pages that maps to color i, i.e. that
> are indexed in the i-th cache partition.
> 
> The proposed implementation supports the dom0less feature.
> The solution has been tested in several scenarios, including Xilinx Zynq
> MPSoCs.
> 
> Overview of implementation and commits structure
> ------------------------------------------------
> 
> - [1-3] Coloring initialization, cache layout auto-probing and coloring
>    data for domains are added.
> - [4-5] xl and Device Tree support for coloring is addedd.
> - [6-7] A new page allocator for domain memory that implement the cache
>    coloring mechanism is introduced.
> - [8-12] Coloring support is added for Xen .text region.
> 
> Changes in v2
> -------------
> 
> Lot of things changed between the two versions, mainly I tried to follow
> all the comments left by the maintainers after the previous version review.
> Here is a brief list of the major points (even if, imho, it's easier to
> repeat all the review process):

The series doesn't build on Arm64 without cache coloring. Please make 
sure to compile and check that Xen still boot on system after your 
series with cache coloring disabled.

Cheers,

-- 
Julien Grall

