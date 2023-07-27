Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 89752765DBC
	for <lists+xen-devel@lfdr.de>; Thu, 27 Jul 2023 23:08:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.571268.894714 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qP8D7-0004kb-3z; Thu, 27 Jul 2023 21:07:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 571268.894714; Thu, 27 Jul 2023 21:07:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qP8D7-0004ix-1M; Thu, 27 Jul 2023 21:07:49 +0000
Received: by outflank-mailman (input) for mailman id 571268;
 Thu, 27 Jul 2023 21:07:48 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1qP8D5-0004iq-Uo
 for xen-devel@lists.xenproject.org; Thu, 27 Jul 2023 21:07:48 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qP8D5-0008CT-9q; Thu, 27 Jul 2023 21:07:47 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.1.102])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qP8D5-0000eo-4T; Thu, 27 Jul 2023 21:07:47 +0000
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
	bh=LozQi8zVfwTWjcVUbnWNMACxcMcCv3StDITzOZTjumk=; b=QNSI/xpJIZDCKuLIvJxYH9Uvxj
	SpQr8v9iQJ5CKR3XgtxXTioyx8T2hZgh3FPSdCI1c7Rg2vrXgbDRl8iaqxGnrJ3zewyw0murpxjnn
	CeB6GRMoAWiCGVkc/h1Q06AZJVDUDggGgR2garONpuRCoI3d8QlRkyoIC6A7moExpvKk=;
Message-ID: <a1ac318d-ad3f-c533-d29d-0413af3072c2@xen.org>
Date: Thu, 27 Jul 2023 22:07:45 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.13.0
Subject: Re: [PATCH v3 11/25] tools/xenstore: drop use of tdb
To: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org
Cc: Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>
References: <20230724110247.10520-1-jgross@suse.com>
 <20230724110247.10520-12-jgross@suse.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20230724110247.10520-12-jgross@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Juergen,

On 24/07/2023 12:02, Juergen Gross wrote:
> Today all Xenstore nodes are stored in a TDB data base. This data base
> has several disadvantages:
> 
> - It is using a fixed sized hash table, resulting in high memory
>    overhead for small installations with only very few VMs, and a rather
>    large performance hit for systems with lots of VMs due to many
>    collisions.
>    The hash table size today is 7919 entries. This means that e.g. in
>    case of a simple desktop use case with 2 or 3 VMs probably far less
>    than 10% of the entries will be used (assuming roughly 100 nodes per
>    VM). OTOH a setup on a large server with 500 VMs would result in
>    heavy conflicts in the hash list with 5-10 nodes per hash table entry.
> 
> - TDB is using a single large memory area for storing the nodes. It
>    only ever increases this area and will never shrink it afterwards.
>    This will result in more memory usage than necessary after a peak of
>    Xenstore usage.
> 
> - Xenstore is only single-threaded, while TDB is designed to be fit
>    for multi-threaded use cases, resulting in much higher code
>    complexity than needed.
> 
> - Special use cases of Xenstore are not possible to implement with TDB
>    in an effective way, while an implementation of a data base tailored
>    for Xenstore could simplify some handling (e.g. transactions) a lot.
> 
> So drop using TDB and store the nodes directly in memory making them
> easily accessible. Use a hash-based lookup mechanism for fast lookup
> of nodes by their full path.
> 
> For now only replace TDB keeping the current access functions.
> 
> Signed-off-by: Juergen Gross <jgross@suse.com>

Reviewed-by: Julien Grall <jgrall@amazon.com>

Cheers,

-- 
Julien Grall

