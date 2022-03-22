Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EA7E74E442C
	for <lists+xen-devel@lfdr.de>; Tue, 22 Mar 2022 17:24:56 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.293591.498781 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nWhJR-0008Td-0j; Tue, 22 Mar 2022 16:24:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 293591.498781; Tue, 22 Mar 2022 16:24:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nWhJQ-0008RQ-TT; Tue, 22 Mar 2022 16:24:48 +0000
Received: by outflank-mailman (input) for mailman id 293591;
 Tue, 22 Mar 2022 16:24:47 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1nWhJP-0008RG-Ce
 for xen-devel@lists.xenproject.org; Tue, 22 Mar 2022 16:24:47 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nWhJO-0001nR-Ry; Tue, 22 Mar 2022 16:24:46 +0000
Received: from 54-240-197-225.amazon.com ([54.240.197.225]
 helo=[192.168.19.186]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nWhJO-0000tx-KJ; Tue, 22 Mar 2022 16:24:46 +0000
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
	bh=kjxz+iPbDMZueqwno7ME6ZF/nc5sSw6SG6ZDu+WUptc=; b=hNrOJH0zuYLp6Gm67FTlVDJyWl
	yGzI77bluCWgy5PT/QJ2bR9N2wus46FHQF+i7WZpV0aHOwmO4EMxDc505OVwmr3CdTxI/SdFYZoWE
	Awnqua92MZnznJZtwilB4TU/FTGa3Pnl8qjaDjr8T8yLo14niuSiwUudE424FxM1RNLA=;
Message-ID: <c51db4b3-9654-d8dc-a5b3-a9226f6d8e33@xen.org>
Date: Tue, 22 Mar 2022 16:24:43 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.7.0
Subject: Re: [PATCH v11 3/3] xen/arm64: io: Handle data abort due to cache
 maintenance instructions
To: Ayan Kumar Halder <ayan.kumar.halder@xilinx.com>,
 xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org, stefanos@xilinx.com, Volodymyr_Babchuk@epam.com,
 bertrand.marquis@arm.com, andrew.cooper3@citrix.com,
 george.dunlap@citrix.com, jbeulich@suse.com, wl@xen.org, paul@xen.org,
 roger.pau@citrix.com
References: <20220317140046.64563-1-ayankuma@xilinx.com>
 <20220317140046.64563-4-ayankuma@xilinx.com>
 <3d6a341d-712d-8701-caf2-49301ae1e01b@xen.org>
 <a6d6aa6f-7dcf-fbed-6400-bb5d028e045e@xilinx.com>
 <9bcab961-8ae1-9e9a-c6da-682aecf2a138@xilinx.com>
 <c7296ea0-5236-1a10-8ef1-74ec83456ce5@xen.org>
 <981cb69d-5bec-875f-a921-bc0fa0c11782@xilinx.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <981cb69d-5bec-875f-a921-bc0fa0c11782@xilinx.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi,

On 22/03/2022 16:16, Ayan Kumar Halder wrote:
> On 22/03/2022 13:22, Julien Grall wrote:
>> Furthermore, I think try_fwd_ioserv() need to be adapted because the 
>> function will use the fields SAS and SRT. From the Arm Arm they are 
>> RES0, so while they are 0 today, we should not rely on this.
>>
>> Therefore, to be fully compliant with the Arm, we want to reorder a 
>> bit the code:
>>
>>  * The field data could be set past ioreq_select_server().
>>  * The field size should be set to the cache line size.
> 
> I am assuming that we need to invoke  dcache_line_size() (from 
> xen/arch/arm/arm64/cache.S ) to get the cache line size.

You would want to use dcache_line_bytes.

> 
> I think the cache line may be 32 or 64 bytes. In which case, this cannot 
> be represented by SAS (as it can represent 1, 2, 4 and 8 bytes).

You are correct that this cannot be represented by SAS. However, I was 
referring to the field 'size' in the ioreq structure. It is a 32-bit 
integer and could therefore represent the size of the cache line.

> 
> Also, we are invoking ioreq_select_server() to determine if the address 
> is emulated or not. So, can we use an assumed size (= 1 byte) ?

I thought about this. This is technically incorrect but would be OK if 
we cannot find the correct size.

Per above, I think the correct size could be found.

Cheers,

-- 
Julien Grall

