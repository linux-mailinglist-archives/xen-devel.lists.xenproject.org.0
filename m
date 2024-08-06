Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 474CF9497A5
	for <lists+xen-devel@lfdr.de>; Tue,  6 Aug 2024 20:40:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.773066.1183520 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sbP6F-0007QG-W4; Tue, 06 Aug 2024 18:39:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 773066.1183520; Tue, 06 Aug 2024 18:39:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sbP6F-0007NG-SX; Tue, 06 Aug 2024 18:39:59 +0000
Received: by outflank-mailman (input) for mailman id 773066;
 Tue, 06 Aug 2024 18:39:58 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1sbP6E-0007Lj-4W
 for xen-devel@lists.xenproject.org; Tue, 06 Aug 2024 18:39:58 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1sbP6D-0003uL-No; Tue, 06 Aug 2024 18:39:57 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.0.211])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1sbP6D-0001eJ-Hr; Tue, 06 Aug 2024 18:39:57 +0000
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
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
	References:Cc:To:From:Subject:MIME-Version:Date:Message-ID;
	bh=+e5XHDTRAnazXZQtCWKKY19N0VD+F4o20nWqNjgGQic=; b=ShVj6OnT65oJs5Qjg8oJTGrS7a
	fVzM7hoVdRhbhTOWBJNNzbVVtHJovYJEkirM7XyYoQurIJey2HpsRKBd5+8XnuCtV2zqYzjYypydX
	ZBIvLDTPQgNYFPgS8Wq7NpecLq4AzIYlrBEmJndpGZcc0QAOz8a3/x7g+OLv2xw1EoAw=;
Message-ID: <1bac1646-0713-487e-9840-ea825bbc92e1@xen.org>
Date: Tue, 6 Aug 2024 19:39:56 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH for-4.20 v2] xen/arm: bootfdt: Fix device tree memory node
 probing
Content-Language: en-GB
From: Julien Grall <julien@xen.org>
To: Michal Orzel <michal.orzel@amd.com>, xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Luca Fancellu <luca.fancellu@arm.com>
References: <20240710112204.33542-1-michal.orzel@amd.com>
 <08ba090b-c7a6-4aaa-8bda-f7bce6389f86@xen.org>
In-Reply-To: <08ba090b-c7a6-4aaa-8bda-f7bce6389f86@xen.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 10/07/2024 22:11, Julien Grall wrote:
> Hi,
> 
> On 10/07/2024 12:22, Michal Orzel wrote:
>> Memory node probing is done as part of early_scan_node() that is called
>> for each node with depth >= 1 (root node is at depth 0). According to
>> Devicetree Specification v0.4, chapter 3.4, /memory node can only exists
>> as a top level node. However, Xen incorrectly considers all the nodes 
>> with
>> unit node name "memory" as RAM. This buggy behavior can result in a
>> failure if there are other nodes in the device tree (at depth >= 2) with
>> "memory" as unit node name. An example can be a "memory@xxx" node under
>> /reserved-memory. Fix it by introducing device_tree_is_memory_node() to
>> perform all the required checks to assess if a node is a proper /memory
>> node.
>>
>> Fixes: 3e99c95ba1c8 ("arm, device tree: parse the DTB for RAM location 
>> and size")
>> Signed-off-by: Michal Orzel <michal.orzel@amd.com>
>> Reviewed-by: Luca Fancellu <luca.fancellu@arm.com>
>> Tested-by: Luca Fancellu <luca.fancellu@arm.com>
> 
> Reviewed-by: Julien Grall <julien@xen.org>

This is now committed.

Cheers,

-- 
Julien Grall


