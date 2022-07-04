Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AE55A565017
	for <lists+xen-devel@lfdr.de>; Mon,  4 Jul 2022 10:55:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.359996.589329 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o8Hrd-0002RR-Kr; Mon, 04 Jul 2022 08:55:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 359996.589329; Mon, 04 Jul 2022 08:55:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o8Hrd-0002No-Hm; Mon, 04 Jul 2022 08:55:29 +0000
Received: by outflank-mailman (input) for mailman id 359996;
 Mon, 04 Jul 2022 08:55:28 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1o8Hrc-0002NF-Dh; Mon, 04 Jul 2022 08:55:28 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1o8HrY-0003Qe-Qo; Mon, 04 Jul 2022 08:55:24 +0000
Received: from [54.239.6.187] (helo=[192.168.26.128])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1o8HrY-0005ib-L4; Mon, 04 Jul 2022 08:55:24 +0000
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
	bh=zCd95P6ISsvOgWH8h20ho5lgpI/RNUaXzZAOU1iexfI=; b=erk+odNh4WRN1H+VNwHz2/iIMu
	ffrmUuXU41E3yPqH+VRZiHJ5qVHDjz3dPEQ6bgLeTSeRS6d7RLRIOT5YWeRPj8SJ30VgNKWkkTu7O
	HA3FFxTHyf3561ibLl89LxlFT/KdPLWrA9Tu3ujrb+Y+hfsYiz3mpi21pkDKVy7yZW9g=;
Message-ID: <bfe594da-dbc7-70c3-72f6-a1056e3a549d@xen.org>
Date: Mon, 4 Jul 2022 09:55:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.11.0
Subject: Re: [PATCH v3 0/4] mini-os: some memory map updates for PVH
To: Juergen Gross <jgross@suse.com>, minios-devel@lists.xenproject.org,
 xen-devel@lists.xenproject.org,
 "committers@xenproject.org" <committers@xenproject.org>
Cc: samuel.thibault@ens-lyon.org, wl@xen.org
References: <20220621072314.16382-1-jgross@suse.com>
 <3349c933-ed0d-3177-b494-ef4a6654d12d@suse.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <3349c933-ed0d-3177-b494-ef4a6654d12d@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Juergen,

On 04/07/2022 09:38, Juergen Gross wrote:
> On 21.06.22 09:23, Juergen Gross wrote:
>> Do some memory map related changes/fixes for PVH mode:
>>
>> - Prefer the memory map delivered via start-info over the one obtained
>>    from the hypervisor. This is a prerequisite for Xenstore-stubdom
>>    live-update with rising the memory limit.
>>
>> - Fix a bug related to ballooning in PVH mode: PVH Xenstore-stubdom
>>    can't read its target memory size from Xenstore, as this introduces
>>    a chicken-and-egg problem. The memory size read from the hypervisor
>>    OTOH includes additional "special" pages marked as reserved in the
>>    memory map. Those pages need to be subtracted from the read size.
>>
>> - Fix a bug in ballooning code in PVH mode when using memory beyond
>>    a RAM hole in the memory map
>>
>> Changes in V3:
>> - minor comment for patch 3 addressed
>>
>> Changes in V2:
>> - added patch 4
>> - addressed comment regarding patch 3
>>
>> Juergen Gross (4):
>>    mini-os: take newest version of arch-x86/hvm/start_info.h
>>    mini-os: prefer memory map via start_info for PVH
>>    mini-os: fix number of pages for PVH
>>    mini-os: fix bug in ballooning on PVH
>>
>>   arch/x86/mm.c                         | 23 ++++----
>>   balloon.c                             | 18 ++----
>>   e820.c                                | 83 ++++++++++++++++++++++++---
>>   include/e820.h                        |  6 ++
>>   include/x86/arch_mm.h                 |  2 +
>>   include/xen/arch-x86/hvm/start_info.h | 63 +++++++++++++++++++-
>>   6 files changed, 163 insertions(+), 32 deletions(-)
>>
> 
> Could someone please commit this series? 

Done.

> Samuel gave his R-b nearly 2 weeks
> ago.

xen-devel is quite high volume and I don't read all the e-mails. If you 
need someone to commit then please CC committers@ and this will land in 
my inbox.

Cheers,

-- 
Julien Grall

