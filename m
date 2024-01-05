Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3050682597B
	for <lists+xen-devel@lfdr.de>; Fri,  5 Jan 2024 18:54:31 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.662292.1032361 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rLoOh-00067G-M7; Fri, 05 Jan 2024 17:54:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 662292.1032361; Fri, 05 Jan 2024 17:54:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rLoOh-00065E-JW; Fri, 05 Jan 2024 17:54:19 +0000
Received: by outflank-mailman (input) for mailman id 662292;
 Fri, 05 Jan 2024 17:54:18 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1rLoOf-000658-W7
 for xen-devel@lists.xenproject.org; Fri, 05 Jan 2024 17:54:17 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1rLoOf-0003wT-J4; Fri, 05 Jan 2024 17:54:17 +0000
Received: from [54.239.6.189] (helo=[192.168.15.166])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1rLoOf-0008HP-CP; Fri, 05 Jan 2024 17:54:17 +0000
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
	bh=S3vmpLQerDH02jHaHA5VMeyjerGjQU61velfKMZwFo0=; b=GEoOIBD0/7/wYxY37WG+9UO69Y
	FHfaLOKT+62pEkc/H8j7Gi+BnXh6IdQ8bGMJaz1cxzVaSgzahypyKE6l7jIj9AsKf6b/Da6hxRDro
	QW5yDGWjKmJFOjBH0yT44lteAuqzwda7DdToWBECf3v3DmKoEhHkNMCirMibWdABg8ec=;
Message-ID: <881bdea6-4d66-49ac-a22c-2142cf447fb6@xen.org>
Date: Fri, 5 Jan 2024 17:54:15 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 10/13] xen/arm: use domain memory to allocate p2m page
 tables
Content-Language: en-GB
To: Carlo Nonato <carlo.nonato@minervasys.tech>,
 xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Marco Solieri <marco.solieri@minervasys.tech>
References: <20240102095138.17933-1-carlo.nonato@minervasys.tech>
 <20240102095138.17933-11-carlo.nonato@minervasys.tech>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20240102095138.17933-11-carlo.nonato@minervasys.tech>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Carlo,

On 02/01/2024 09:51, Carlo Nonato wrote:
> Cache colored domains can benefit from having p2m page tables allocated
> with the same coloring schema so that isolation can be achieved also for
> those kind of memory accesses.
> In order to do that, the domain struct is passed to the allocator and the
> MEMF_no_owner flag is used.
> 
> This will be useful also when NUMA will be supported on Arm.
> 
> Signed-off-by: Carlo Nonato <carlo.nonato@minervasys.tech>
> Signed-off-by: Marco Solieri <marco.solieri@minervasys.tech>

Acked-by: Julien Grall <julien@xen.org>

Cheers,

-- 
Julien Grall

