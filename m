Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 577904CD2B4
	for <lists+xen-devel@lfdr.de>; Fri,  4 Mar 2022 11:46:58 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.284175.483364 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nQ5S0-0001JC-OK; Fri, 04 Mar 2022 10:46:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 284175.483364; Fri, 04 Mar 2022 10:46:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nQ5S0-0001GE-LN; Fri, 04 Mar 2022 10:46:20 +0000
Received: by outflank-mailman (input) for mailman id 284175;
 Fri, 04 Mar 2022 10:46:19 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1nQ5Rz-0001G8-99
 for xen-devel@lists.xenproject.org; Fri, 04 Mar 2022 10:46:19 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nQ5Ry-00084Q-K5; Fri, 04 Mar 2022 10:46:18 +0000
Received: from [54.239.6.187] (helo=[192.168.25.28])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nQ5Ry-00062Y-DA; Fri, 04 Mar 2022 10:46:18 +0000
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
	bh=nrXCoX8rYkFXLodM6ougi10YCLxb+BtxLh60QHMahjE=; b=Yng8v4iZ8zOjTAsgUhLKMOl7cr
	joGasSBqf101aH4mVL4Blh7EOxTIDuGJltgc4V2EmjaqB4dDMyquo2fhd0pLXFKWBFp22RXKwCZA0
	yKBu3V0KpSSTPQT/wLAEAcDuOTX19Iod1xjmyvK9I9jZ45D0AT8VqFbxm9BZnoQ+1uO8=;
Message-ID: <26ee167e-16ea-e358-f390-dc96961d3234@xen.org>
Date: Fri, 4 Mar 2022 10:46:15 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.6.1
Subject: Re: [XEN v9 4/4] xen/arm64: io: Handle data abort due to cache
 maintenance instructions
To: Ayan Kumar Halder <ayan.kumar.halder@xilinx.com>,
 xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org, stefanos@xilinx.com, Volodymyr_Babchuk@epam.com,
 bertrand.marquis@arm.com, andrew.cooper3@citrix.com,
 george.dunlap@citrix.com, jbeulich@suse.com, wl@xen.org, paul@xen.org,
 roger.pau@citrix.com, Ayan Kumar Halder <ayankuma@xilinx.com>
References: <20220301124022.10168-1-ayankuma@xilinx.com>
 <20220301124022.10168-5-ayankuma@xilinx.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20220301124022.10168-5-ayankuma@xilinx.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Ayan,

On 01/03/2022 12:40, Ayan Kumar Halder wrote:
> When the data abort is caused due to cache maintenance for an address,
> there are two scenarios:-
> 
> 1. Address belonging to a non emulated region - For this, Xen should
> set the corresponding bit in the translation table entry to valid and
> return to the guest to retry the instruction. This can happen sometimes
> as Xen need to set the translation table entry to invalid. (for eg
> 'Break-Before-Make' sequence).
> 
> 2. Address belongs to an emulated region - Xen should ignore the
> instruction (ie increment the PC) and return to the guest.

I would be explicit and say something along the lines:

"Xen doesn't cache data for emulated regions. So we can safely ignore them".

There is a third scenarios:

The address belongs to neither an emulated region nor has a valid 
mapping in the P2M.
> 
> We try to deal with scenario#1, by invoking check_p2m(). If this is
> unsuccessful, then we assume scenario#2.

This means that you will ignore cache maintenance on invalid region. I 
think we should send an abort to the guest rather than let them believe 
it worked.

Cheers,

-- 
Julien Grall

