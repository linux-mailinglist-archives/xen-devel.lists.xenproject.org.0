Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F08279D04FD
	for <lists+xen-devel@lfdr.de>; Sun, 17 Nov 2024 19:25:50 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.839033.1254848 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tCjxb-0007H6-Am; Sun, 17 Nov 2024 18:25:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 839033.1254848; Sun, 17 Nov 2024 18:25:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tCjxb-0007E6-73; Sun, 17 Nov 2024 18:25:23 +0000
Received: by outflank-mailman (input) for mailman id 839033;
 Sun, 17 Nov 2024 18:25:22 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1tCjxa-0007E0-9m
 for xen-devel@lists.xenproject.org; Sun, 17 Nov 2024 18:25:22 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1tCjxZ-009k9B-1w;
 Sun, 17 Nov 2024 18:25:21 +0000
Received: from [2a02:8012:3a1:0:dc92:b14d:2764:76ac]
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1tCjxZ-009XPX-28;
 Sun, 17 Nov 2024 18:25:21 +0000
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
	bh=RYXxfVrnviffLUBpfklNQDNwlGsgPjdG3RjZL9JPdW8=; b=sfdQ7/8KsATM9c6oVLMDPkOgN1
	MsDCEbcP0vTZRyvc63vLSa3pAi7aLmk0esg4v/2b2Rc8HaJ784vVJ+pgO3Ozs1zdG4el9qyRPKW8J
	H6uqlCPK2V3oF6h6UgZbeOGHBM07NjsXl/r6yJZXcd6UFaAxZJ/ekw+qXiLWV5gsgfBk=;
Message-ID: <3385e50f-6d60-4f59-a720-fb014d9722cb@xen.org>
Date: Sun, 17 Nov 2024 18:25:19 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 10/13] xen/arm: use domain memory to allocate p2m page
 tables
Content-Language: en-GB
To: Carlo Nonato <carlo.nonato@minervasys.tech>,
 xen-devel@lists.xenproject.org
Cc: andrea.bastoni@minervasys.tech,
 Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20241025095014.42376-1-carlo.nonato@minervasys.tech>
 <20241025095014.42376-11-carlo.nonato@minervasys.tech>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20241025095014.42376-11-carlo.nonato@minervasys.tech>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 25/10/2024 10:50, Carlo Nonato wrote:
> Cache colored domains can benefit from having p2m page tables allocated
> with the same coloring schema so that isolation can be achieved also for
> those kind of memory accesses.
> In order to do that, the domain struct is passed to the allocator and the
> MEMF_no_owner flag is used.
> 
> This will be useful also when NUMA will be supported on Arm.
> 
> Signed-off-by: Carlo Nonato <carlo.nonato@minervasys.tech>
> Acked-by: Julien Grall <julien@xen.org>

I have committed this patch because it seems to be standalone.

Cheers,

-- 
Julien Grall

