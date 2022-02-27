Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 21DC44C5E6B
	for <lists+xen-devel@lfdr.de>; Sun, 27 Feb 2022 20:27:03 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.280059.477882 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nOPB3-0003fa-Pj; Sun, 27 Feb 2022 19:25:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 280059.477882; Sun, 27 Feb 2022 19:25:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nOPB3-0003d6-Lj; Sun, 27 Feb 2022 19:25:53 +0000
Received: by outflank-mailman (input) for mailman id 280059;
 Sun, 27 Feb 2022 19:25:51 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1nOPB1-0003d0-OO
 for xen-devel@lists.xenproject.org; Sun, 27 Feb 2022 19:25:51 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nOPB0-0008Qi-PF; Sun, 27 Feb 2022 19:25:50 +0000
Received: from gw1.octic.net ([81.187.162.82] helo=[10.0.1.102])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nOPB0-0008Ce-J9; Sun, 27 Feb 2022 19:25:50 +0000
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
	bh=AEFCaeESzi1bLlReDDCWKKVEJvgcbOfE8sMNWaqZy50=; b=qnToenPE/Hke4O/oMnEfJZGL9d
	2DtM1qjQ8b2nbPaR8doGH970tFf3s62SwMH+q//s8Bw48v17dd1h4uo4O4f5+B3v/yMt/7oZybq2u
	fK7w3tZGC+El6F30YtTd1J2eVWFBk29bkj/pvCwcqfDJwaNFDTnVmI9TSha6mGkbBf3U=;
Message-ID: <c591a430-1cf8-bb27-a151-ba4125c4cec9@xen.org>
Date: Sun, 27 Feb 2022 19:25:47 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.6.1
Subject: Re: [PATCH v3 00/19] xen/arm: mm: Remove open-coding mappings
To: xen-devel@lists.xenproject.org
Cc: Julien Grall <jgrall@amazon.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <20220221102218.33785-1-julien@xen.org>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20220221102218.33785-1-julien@xen.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 21/02/2022 10:21, Julien Grall wrote:
> From: Julien Grall <jgrall@amazon.com>
> 
> Hi all,
> 
> This series was originally sent as "xen/arm: mm: Add limited support
> for superpages" [1] and finally has grown enough to remove most of
> the open-coding mappings in the boot code.
> 
> This will help to:
>      1) Get better compliance with the Arm memory model
>      2) Pave the way to support other page size (64KB, 16KB)
> 
> The previous version was spent a few months ago. So I have decided
> to remove all the acked-by/reviewed-by tags.
> 
> Cheers,
> 
> [1] <20201119190751.22345-1-julien@xen.org>
> [2] <PA4PR08MB6253F49C13ED56811BA5B64E92479@PA4PR08MB6253.eurprd08.prod.outlook.com>
> 
> Julien Grall (18):
>    xen/arm: lpae: Rename LPAE_ENTRIES_MASK_GS to LPAE_ENTRY_MASK_GS
>    xen/arm: lpae: Use the generic helpers to defined the Xen PT helpers
>    xen/arm: p2m: Replace level_{orders, masks} arrays with
>      XEN_PT_LEVEL_{ORDER, MASK}

The first 3 patches are fully reviewed. So I have committed them. The 
rest of the patches need review.

Cheers,

-- 
Julien Grall

