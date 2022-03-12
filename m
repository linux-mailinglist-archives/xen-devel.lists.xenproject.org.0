Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CBF5D4D7063
	for <lists+xen-devel@lfdr.de>; Sat, 12 Mar 2022 19:20:37 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.289507.491075 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nT6Ln-0003bU-5N; Sat, 12 Mar 2022 18:20:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 289507.491075; Sat, 12 Mar 2022 18:20:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nT6Ln-0003Zd-2S; Sat, 12 Mar 2022 18:20:23 +0000
Received: by outflank-mailman (input) for mailman id 289507;
 Sat, 12 Mar 2022 18:20:22 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1nT6Ll-0003ZX-Va
 for xen-devel@lists.xenproject.org; Sat, 12 Mar 2022 18:20:21 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nT6Ll-0008TZ-HM; Sat, 12 Mar 2022 18:20:21 +0000
Received: from gw1.octic.net ([81.187.162.82] helo=[10.0.1.102])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nT6Ll-0007Ed-Ay; Sat, 12 Mar 2022 18:20:21 +0000
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
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:Subject:
	From:References:Cc:To:MIME-Version:Date:Message-ID;
	bh=PfkFhvv6hBf53lCXse73H//zcpE2aUBJoYlgSJA8fQ4=; b=XwOXzdRZMyZXXyQlGBB+3jiWgg
	3Xzpfst6B2Agzt4wvSrLvjxNKqyJkYsUlLXWRkO3DHEK6rhvUVmQ1C7hwHd7qukvlRspsVh/7QvwX
	b32SvpaqPngIl7wik7OD8CxqY0vDrezOQk8Bx2pzhUzd6kX2Iq8dz1u0/2T+Msok7rzQ=;
Message-ID: <78cd8ea7-e37a-d3d9-d2d1-6686ca491925@xen.org>
Date: Sat, 12 Mar 2022 18:20:18 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.6.2
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: xen-devel@lists.xenproject.org, marco.solieri@minervasys.tech,
 lucmiccio@gmail.com, Julien Grall <jgrall@amazon.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20220309112048.17377-1-julien@xen.org>
 <20220309112048.17377-5-julien@xen.org>
 <alpine.DEB.2.22.394.2203111710300.3497@ubuntu-linux-20-04-desktop>
From: Julien Grall <julien@xen.org>
Subject: Re: [PATCH early-RFC 4/5] xen/arm: mm: Rework switch_ttbr()
In-Reply-To: <alpine.DEB.2.22.394.2203111710300.3497@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Stefano,

On 12/03/2022 01:17, Stefano Stabellini wrote:
> On Wed, 9 Mar 2022, Julien Grall wrote:
> As far as I can tell this should work for coloring too. In the case of
> coloring:
> 
>      /* running on the old mapping, same as non-coloring */
>      update_identity_mapping(true);
> 
>      /* jumping to the 1:1 mapping of the old Xen and switching to the
>       * new pagetable */
>      fn(ttbr);
> 
>      /* new pagetable is enabled, now we are back to addresses greater
>       * than XEN_VIRT_START, which correspond to new cache-colored Xen */
>      update_identity_mapping(false);
> 
> 
> The only doubt that I have is: are we sure than a single page of 1:1
> mapping is enough? What if:
> 
> virt_to_maddr(switch_ttbr_id) - virt_to_maddr(_start) > PAGE_SIZE

switch_ttbr_id() is placed before _end_boot (this needs to be renamed). 
We are veryfing a link time (see the check in xen.lds.S) that _end_boot 
- _start is always smaller than 4KB.

At the moment, the size is less than 2KB. So we have plenty of space to 
grow. Also, there are some code that is technically not used while using 
the ID map. So if necessary we can shrink the size to always fit in a 
PAGE_SIZE.

> We might have to do a 1:1 mapping of size = _end-_start. It would work
> with coloring too because we are doing a 1:1 mapping of the old copy of
> Xen which is non-colored and contiguous (not the new copy which is
> colored and fragmented).

I would like to keep the size of the ID mapping to the strict minimum. A 
PAGE_SIZE should be sufficient for most of what we need in Xen.

This would help to get rid of the old copy of Xen in case of the cache 
coloring. Otherwise, you technically have to keep it forever if you plan 
to support suspend/resume or even allow CPU hotplug.

Furthemore, if you keep the two copy around, it is more difficult to 
know which mapping is used and we increase the risk to use the wrong 
one. For instance, the current implementation of cache coloring is 
clearing the wrong set of boot pagetables.

Cheers,

-- 
Julien Grall

