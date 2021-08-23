Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C1DE03F4A61
	for <lists+xen-devel@lfdr.de>; Mon, 23 Aug 2021 14:10:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.170381.311189 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mI8mL-00025G-B5; Mon, 23 Aug 2021 12:10:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 170381.311189; Mon, 23 Aug 2021 12:10:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mI8mL-00022V-7y; Mon, 23 Aug 2021 12:10:13 +0000
Received: by outflank-mailman (input) for mailman id 170381;
 Mon, 23 Aug 2021 12:10:11 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1mI8mJ-00022N-Os
 for xen-devel@lists.xenproject.org; Mon, 23 Aug 2021 12:10:11 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1mI8mE-00023T-3b; Mon, 23 Aug 2021 12:10:06 +0000
Received: from [54.239.6.188] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1mI8mD-0004bE-SB; Mon, 23 Aug 2021 12:10:06 +0000
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
	MIME-Version:Date:Message-ID:From:References:Cc:To:Subject;
	bh=c0LI5Dat8k0q7n2GlAf5ZsEOEaSxvFiRGZFBd3ySrC8=; b=1oZbxemtA24CSMeJWz2z5b51Re
	KJsKN+yncNfhLpdolCacdR7HmEBZahC61zUJwxY6Ohz2c8WLBHJvoG+TL0ep+Gi16ReAWFSzivK3W
	PPjLd87K7SfBrFOqKXwCFP2xWSHim9qt/ic0Zp6BCnrCol6sVd6InODDhaSw2xAR+2A8=;
Subject: Re: [PATCH v2 0/7] xen/arm: Sanitize cpuinfo
To: Bertrand Marquis <bertrand.marquis@arm.com>,
 xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Jan Beulich <jbeulich@suse.com>, Wei Liu <wl@xen.org>
References: <cover.1629713932.git.bertrand.marquis@arm.com>
From: Julien Grall <julien@xen.org>
Message-ID: <30ad3be3-b8b2-b83f-e061-5a428175e3f4@xen.org>
Date: Mon, 23 Aug 2021 13:10:03 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <cover.1629713932.git.bertrand.marquis@arm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

Hi Bertrand,

On 23/08/2021 11:32, Bertrand Marquis wrote:
> On arm architecture we might have heterogeneous platforms with different
> types of cores. As a guest can potentialy run on any of those cores we
> have to present them cpu features which are compatible with all cores
> and discard the features which are only available on some cores.

Sanitizing the CPU info is important for Xen so it can correctly size 
the P2M, flush the cache... However, I don't think this is going to be 
sufficient to be able to move a vCPU between different type of pCPU.

The main hurdle I can see so far is errata handling. Not all the errata 
can be fully handled in Xen so some of them are left to the guest to 
mitigate.

The errata are usually detected based on the MIDR while the OS is 
booting. IOW, a guest will not be able to know that it needs to handle 
an errata for pCPU B if it only runs on pCPU A.

I don't know yet how this can be solved, but errata are not that 
uncommon on Arm. So until this addressed, we will still need to make 
sure that vCPUs are not migrated between pCPUs with at least a different 
MIDR.

This prevention can be either done manually by pinning the vCPUs or 
implementing the proposal that Dario sent a few years ago (see [1]).

Cheers,

[1] 
https://lists.xenproject.org/archives/html/xen-devel/2016-12/msg00826.html

-- 
Julien Grall

