Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AAD017DE034
	for <lists+xen-devel@lfdr.de>; Wed,  1 Nov 2023 12:14:38 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.626411.976668 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qy9B3-0005Kb-Jk; Wed, 01 Nov 2023 11:14:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 626411.976668; Wed, 01 Nov 2023 11:14:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qy9B3-0005I5-GV; Wed, 01 Nov 2023 11:14:25 +0000
Received: by outflank-mailman (input) for mailman id 626411;
 Wed, 01 Nov 2023 11:14:25 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1qy9B3-0005Hx-01
 for xen-devel@lists.xenproject.org; Wed, 01 Nov 2023 11:14:25 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qy9B2-0006x6-6x; Wed, 01 Nov 2023 11:14:24 +0000
Received: from [15.248.3.7] (helo=[10.24.67.31])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qy9B2-0003c8-1T; Wed, 01 Nov 2023 11:14:24 +0000
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
	bh=qx0Lq2J+fClUJ91224pUNqsSwM56O/nvfLM6zasqoj0=; b=G6P+GtKdZG7l88S6Alh1lVJZ1v
	gPdspEvXxlI4riucVO11Xc1EVbvyyvMVPCmg1OBSGyGhorL28N8t9qLaD34XxnwskR3ViNJRGEVri
	5RPdhF6zK19xZk8cbHs+8kZ7DW7Wiqz2oftoAG6i1zHWNeEredtAYzHcAOs9F8VVLRJc=;
Message-ID: <447ab760-3ec0-4fd2-83a0-3d44e4ac26ec@xen.org>
Date: Wed, 1 Nov 2023 11:14:22 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 18/29] tools/xenstored: rename xenbus_evtchn()
Content-Language: en-GB
To: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org
Cc: Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>
References: <20231101093325.30302-1-jgross@suse.com>
 <20231101093325.30302-19-jgross@suse.com>
 <0d94c15f-e65b-42cd-b57b-f524179520c7@xen.org>
 <7b3ce122-023a-4f6a-9de4-b40795957c50@suse.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <7b3ce122-023a-4f6a-9de4-b40795957c50@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Juergen,

On 01/11/2023 11:08, Juergen Gross wrote:
> On 01.11.23 11:44, Julien Grall wrote:
>> Hi Juergen,
>>
>> On 01/11/2023 09:33, Juergen Gross wrote:
>>> Rename the xenbus_evtchn() function to get_xenbus_evtchn() in order to
>>> avoid two externally visible symbols with the same name when Xenstore-
>>> stubdom is being built with a Mini-OS with CONFIG_XENBUS set.
>> This works right now, but what guarantee us that Mini-OS will not 
>> change other symbols and clash with the one provided by Xenstored again?
>>
>> Furthermore, technically, this is a problem for all the other software 
>> linked with Mini-OS. So wouldn't it be better to modify the Mini-OS 
>> build system to prefix all the symbols of the linked binary (here 
>> Xenstored)?
> 
> How would that work?
> 
>  From Mini-OS point of view libraries are not distinguishable from the
> linked application. This would mean the build system would prefix the
> library symbols as well, while the application would try to reference
> the the un-prefixed library symbols.

AFAICT, objcopy could rename symbols. So if you pre-process the 
libraries and application before hand, then you should still be able to 
link.

> 
> I think the only way to avoid this kind of problem would be to have a
> positive list of exported Mini-OS symbols and to hide all other symbols
> from linked libraries and the app.
> 
> I can look into this, but I'd like to do this work outside of this
> series in order not to block its development for an unknown amount of
> time.

I am ok with that:

Reviewed-by: Julien Grall <jgrall@amazon.com>

Cheers,

-- 
Julien Grall

