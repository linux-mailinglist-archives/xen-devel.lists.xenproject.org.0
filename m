Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 57C8C80EACD
	for <lists+xen-devel@lfdr.de>; Tue, 12 Dec 2023 12:50:00 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.652978.1019200 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rD1Gm-00040G-St; Tue, 12 Dec 2023 11:49:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 652978.1019200; Tue, 12 Dec 2023 11:49:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rD1Gm-0003xn-Po; Tue, 12 Dec 2023 11:49:48 +0000
Received: by outflank-mailman (input) for mailman id 652978;
 Tue, 12 Dec 2023 11:49:47 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1rD1Gl-0003vy-Cy
 for xen-devel@lists.xenproject.org; Tue, 12 Dec 2023 11:49:47 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1rD1Gk-0005Xs-Na; Tue, 12 Dec 2023 11:49:46 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.1.240])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1rD1Gk-0006vL-I1; Tue, 12 Dec 2023 11:49:46 +0000
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
	bh=ZPOuZKwJwmad4Na8ydmsKVK8Vh9yP3C6c3O/x/4C7HA=; b=Jwm1Y3vGcYytKS1+BppiewjM/c
	RZNdidSRG376vsMr/bJ48Asgh9iaik/MhHh1aAhxYGaDzBt4o8DHXV9kj8vjzEQSAi7Ovp7AXlX0k
	M72d4Rv/Qx7Nwu3Jzcbw32RJ326a5+/gy65aVb2lke+1oZFyG60NRnak6jxA0ERpkcbQ=;
Message-ID: <170a19cb-7c79-4d48-8284-d5d4f9a98eca@xen.org>
Date: Tue, 12 Dec 2023 11:49:44 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH] xen/arm: smmu: move phys_addr_t definition to
 linux-compat.h
Content-Language: en-GB
To: Federico Serafini <federico.serafini@bugseng.com>,
 xen-devel@lists.xenproject.org
Cc: consulting@bugseng.com, Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Wei Liu <wl@xen.org>, Rahul Singh <rahul.singh@arm.com>
References: <e525cd0a2770743e052819b2e14f7df50f801a23.1702303903.git.federico.serafini@bugseng.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <e525cd0a2770743e052819b2e14f7df50f801a23.1702303903.git.federico.serafini@bugseng.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 11/12/2023 14:54, Federico Serafini wrote:
> Both smmu and smmu-v3 (ported from Linux) define the typedef name
> "phys_addr_t": move the type definition to the common header
> linux-compat.h to address violations of MISRA C:2012 Rule 5.6
> ("A typedef name shall be a unique identifier").
> No functional change.
> 
> Suggested-by: Jan Beulich <jbeulich@suse.com>
> Suggested-by: Julien Grall <julien@xen.org>
> Signed-off-by: Federico Serafini <federico.serafini@bugseng.com>

Regardless of Jan's comment:

Reviewed-by: Julien Grall <jgrall@amazon.com>

Cheers,

-- 
Julien Grall

