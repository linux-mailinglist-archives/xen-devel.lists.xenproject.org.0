Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 81F9D3EB44D
	for <lists+xen-devel@lfdr.de>; Fri, 13 Aug 2021 12:52:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.166738.304340 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mEUn2-0001TK-6I; Fri, 13 Aug 2021 10:51:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 166738.304340; Fri, 13 Aug 2021 10:51:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mEUn2-0001RU-2v; Fri, 13 Aug 2021 10:51:52 +0000
Received: by outflank-mailman (input) for mailman id 166738;
 Fri, 13 Aug 2021 10:51:50 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1mEUn0-0001RO-Oq
 for xen-devel@lists.xenproject.org; Fri, 13 Aug 2021 10:51:50 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1mEUmz-0003wt-Ni; Fri, 13 Aug 2021 10:51:49 +0000
Received: from 54-240-197-224.amazon.com ([54.240.197.224]
 helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1mEUmz-0006U2-HK; Fri, 13 Aug 2021 10:51:49 +0000
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
	bh=+tMzSgNzRjFy+PDaDtEDQ0moqHqk5fHbOx92koaUkrg=; b=dT0tjP8yR4hND1RbtKOQBWuX/O
	45yjlP1Aqpjud2ddzbOoVGUKgmLUcGY+Btl8JNh6RsoqVpNx4l4FgiRQ4nS8d3Yy82W2NXrN8KXow
	r4YuGiZMVFAuQQncRO6NJbF4qPPW7eDVa6kC90EFJ2ryriE9bM69lyAaSeEFwgovKAdA=;
Subject: Re: Disable swiotlb for Dom0
To: Roman Skakun <Roman_Skakun@epam.com>,
 "sstabellini@kernel.org" <sstabellini@kernel.org>
Cc: Bertrand Marquis <bertrand.marquis@arm.com>,
 Andrii Anisov <Andrii_Anisov@epam.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Oleksandr Tyshchenko <Oleksandr_Tyshchenko@epam.com>,
 Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Roman Skakun <rm.skakun@gmail.com>, Jan Beulich <jbeulich@suse.com>
References: <AM7PR03MB6593B4461B99297C8650CF1C85F79@AM7PR03MB6593.eurprd03.prod.outlook.com>
 <060b5741-922c-115c-7e8c-97d8aa5f46f4@xen.org>
 <AM7PR03MB65932619505158E3930D8E8785F89@AM7PR03MB6593.eurprd03.prod.outlook.com>
 <d616081a-8c60-dcda-ac54-58c5be0c21ce@xen.org>
 <AM7PR03MB6593834BA54AD8A126EF872185F89@AM7PR03MB6593.eurprd03.prod.outlook.com>
 <691e31db-c79b-9196-53e1-cbbdc9bd3a54@xen.org>
 <AM7PR03MB659376E041306352B583060185FA9@AM7PR03MB6593.eurprd03.prod.outlook.com>
From: Julien Grall <julien@xen.org>
Message-ID: <d77e3b8e-ebd5-b4de-e516-9c5c69626678@xen.org>
Date: Fri, 13 Aug 2021 11:51:47 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <AM7PR03MB659376E041306352B583060185FA9@AM7PR03MB6593.eurprd03.prod.outlook.com>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 8bit



On 13/08/2021 10:38, Roman Skakun wrote:
> Hi Julien,

Hi Roman,

>> So 0xb6000000 is most likely the GFN used to mapped the grant from the domU.
>>
>> swiotlb-xen on Arm will convert it to the MFN because it is not aware
>> whether the device is behind an IOMMU.
> 
> If I'm understand right, it seems like that swiotlb-xen is not ready to 
> work properly in case
> when we retrieved MFN instead of proper GFN mapped to Dom0 memory.
> Maybe you know some ideas to overcome this condition?

swiotlb-xen work as intended. You have a DMA buffer at an address that 
your device cannot deal with. So it will try to bounce it.

> 
>>  As the address is too high to be handled by the device, swiotlb will try
>>  to bounce it. I think it is correct to bounce the page but I am not sure
>>  why it can't. What the size of the DMA transaction?
> 
> The DMA map size is 3686400 bytes.

So that's a 3MB buffer. I am slightly confused because in an earlier 
message you wrote that the memory is coming from the guest. How did you 
map it?

> 
> I've added several logs to swiotlb map_single() and see:
> [  151.298455] <SWIOTLB> swiotlb_tbl_map_single() origin_addr: 
> 64af97000, needed: 708,
> avail: 7fc0, stride: 2, index: 4160

I am not sure how to read the logs... Are the number in hexadecimal or 
decimal? It might be useful if you post the diff of your changes.

[...]

> Swiotlb did not fit requested slots because the maximum slot size equals 
> IO_TLB_SEGSIZE=128 by default.

Ok. So it sounds like your problem is the have a DMA buffer that is too 
large for the default swiotlb. Did you try to bump the value from the 
command line?

> But I think, we cannot use64af97000 address in the swiotlb_bounce() 
> directly.

I am not sure to understand what you mean. Can you clarify?

Cheers,

[...]

-- 
Julien Grall

