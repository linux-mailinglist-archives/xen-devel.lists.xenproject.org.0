Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 946A2989F9D
	for <lists+xen-devel@lfdr.de>; Mon, 30 Sep 2024 12:43:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.807198.1218486 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1svDrm-0003Tm-6V; Mon, 30 Sep 2024 10:42:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 807198.1218486; Mon, 30 Sep 2024 10:42:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1svDrm-0003S6-2u; Mon, 30 Sep 2024 10:42:58 +0000
Received: by outflank-mailman (input) for mailman id 807198;
 Mon, 30 Sep 2024 10:42:56 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1svDrk-0003Rx-8i
 for xen-devel@lists.xenproject.org; Mon, 30 Sep 2024 10:42:56 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1svDrj-0001Yn-SB; Mon, 30 Sep 2024 10:42:55 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.0.211])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1svDrj-0007Jb-Kv; Mon, 30 Sep 2024 10:42:55 +0000
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
	bh=V9iq2P4gzct/C5aAY7FqexBBJlKEatWYnGG1B2iY9a4=; b=o/wjEFabTKVOdxcB04GsvhWgrZ
	6V70smmjOLJ/QKeVhd9u0pJn5gnS8ArhLSjkV1/SsZQflwzmrjUqGczzXRngAPWD2xTetX71hl8k5
	9AywZLkah59vH/z9bIwnua0RUox+4KuNCwFxp/Qsiy7JNL3az4PeMPkQ1MxmGVQ9gSYA=;
Message-ID: <3017e7e0-1eda-45b5-a231-46e7d2e12297@xen.org>
Date: Mon, 30 Sep 2024 11:42:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/4] dt-overlay: Remove ASSERT_UNREACHABLE from
 add_nodes()
Content-Language: en-GB
To: Michal Orzel <michal.orzel@amd.com>, xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>
References: <20240919104238.232704-1-michal.orzel@amd.com>
 <20240919104238.232704-4-michal.orzel@amd.com>
 <96c741b6-1938-4fdf-baf6-31c85ef0f323@xen.org>
 <590a7788-02ad-4876-bc3a-ec58d860c420@amd.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <590a7788-02ad-4876-bc3a-ec58d860c420@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 23/09/2024 11:44, Michal Orzel wrote:
> Hi Julien,
> 
> On 20/09/2024 10:35, Julien Grall wrote:
>>
>>
>> Hi Michal,
>>
>> On 19/09/2024 12:42, Michal Orzel wrote:
>>> The assumption stated in the comment that the code will never get there
>>> is incorrect. It's enough for the target-path to be incorrect (i.e. user
>>> error), which will lead to an incorrect overall node path and we will end
>>> up in this "unreachable" place causing a failure in debug builds.
>>
>> Looking at the caller, nodes_full_path contain path that was computed
>> from the overlay. So I would have assumed the path would be part of the
>> new DT. What did I miss?
> nodes_full_path contains paths to nodes by combining the name of the node with the target-path string.
> It's generated in overlay_get_nodes_info(). It's a simple <target-path> + '/' + <node-path> + '\0'. It does
> not have any dt logic as for paths. On the other hand libfdt contains advanced logic and can tweak the node
> path if needed. So for example if the target-path is "////" and node path is "foo@0", libfdt full path will be "/foo@0"
> (notice how it got rid of excessive slashes) but our nodes_full_path[foo] will be "////foo@0". The only place which can
> spot this difference is our check in add_nodes().

Thanks for the clarification. This reads as we want to get the list of 
nodes using the libfdt logic rather than re-inventing our own.

I would suggest to expand a bit more the commit message with the details 
you provided. With that:

Acked-by: Julien Grall <jgrall@amazon.com>

Cheers,

-- 
Julien Grall


