Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AF3067A0E0
	for <lists+xen-devel@lfdr.de>; Tue, 24 Jan 2023 19:08:13 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.483667.749965 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pKNh7-0001Kx-Bj; Tue, 24 Jan 2023 18:06:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 483667.749965; Tue, 24 Jan 2023 18:06:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pKNh7-0001JE-7Z; Tue, 24 Jan 2023 18:06:53 +0000
Received: by outflank-mailman (input) for mailman id 483667;
 Tue, 24 Jan 2023 18:06:51 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1pKNh5-0001J8-BB
 for xen-devel@lists.xenproject.org; Tue, 24 Jan 2023 18:06:51 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1pKNh4-00010X-9f; Tue, 24 Jan 2023 18:06:50 +0000
Received: from [54.239.6.189] (helo=[192.168.20.46])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1pKNh4-0007v2-2C; Tue, 24 Jan 2023 18:06:50 +0000
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
	bh=MtoYxdNXe+9/rcUSwzHrdCqqZexWYYTDy12Qbz3+P7w=; b=R3lo7Kh9Y9pEufOSLzj+4AYvsI
	NgK5EuK8E6y1VjzUYjNVgSPgDGAgrNz5l20uhcdDEjE7z4yYYLewPFBxJZVFlvINAuDkyanC2l317
	Z5XSE1aPZNuM+KEiWGfNY8ovHKIBM8P9yv8Qbhwt78uESAHi6gGEHzjjcNW8e+1tZwNM=;
Message-ID: <8995c20f-7d0d-5138-b802-d70c116b84e7@xen.org>
Date: Tue, 24 Jan 2023 18:06:47 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [PATCH 22/22] xen/arm64: Allow the admin to enable/disable the
 directmap
Content-Language: en-US
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: xen-devel@lists.xenproject.org, Julien Grall <jgrall@amazon.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Wei Liu <wl@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20221216114853.8227-1-julien@xen.org>
 <20221216114853.8227-23-julien@xen.org>
 <alpine.DEB.2.22.394.2301231437170.1978264@ubuntu-linux-20-04-desktop>
 <92c4daa2-d841-3109-c1ec-4bdb088d6670@xen.org>
 <alpine.DEB.2.22.394.2301231605291.1978264@ubuntu-linux-20-04-desktop>
From: Julien Grall <julien@xen.org>
In-Reply-To: <alpine.DEB.2.22.394.2301231605291.1978264@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Stefano,

On 24/01/2023 00:12, Stefano Stabellini wrote:
> On Mon, 23 Jan 2023, Julien Grall wrote:
> Ah yes! I see it now that we are relying on the same area
> (alloc_xenheap_pages calls page_to_virt() then map_pages_to_xen()).
> 
> map_pages_to_xen() is able to create pagetable entries at every level,
> but we need to make sure they are shared across per-cpu pagetables. To
> make that happen, we are pre-creating the L0/L1 entries here so that
> they become common across all per-cpu pagetables and then we let
> map_pages_to_xen() do its job.
> 
> Did I understand it right?

Your understanding is correct.

>> I can add summary in the commit message.
> 
> I would suggest to improve a bit the in-code comment on top of
> setup_directmap_mappings. I might also be able to help with the text
> once I am sure I understood what is going on :-)

-- 
Julien Grall

