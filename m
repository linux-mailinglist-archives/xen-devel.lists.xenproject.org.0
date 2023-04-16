Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 21D8D6E3A3F
	for <lists+xen-devel@lfdr.de>; Sun, 16 Apr 2023 18:17:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.521604.810408 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1po53S-0003Io-9F; Sun, 16 Apr 2023 16:16:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 521604.810408; Sun, 16 Apr 2023 16:16:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1po53S-0003GC-5c; Sun, 16 Apr 2023 16:16:42 +0000
Received: by outflank-mailman (input) for mailman id 521604;
 Sun, 16 Apr 2023 16:16:41 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1po53R-0003G1-0g
 for xen-devel@lists.xenproject.org; Sun, 16 Apr 2023 16:16:41 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1po53Q-0007hs-Nz; Sun, 16 Apr 2023 16:16:40 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.1.102])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1po53Q-0004fi-EN; Sun, 16 Apr 2023 16:16:40 +0000
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
	bh=lQOD+WhzpSlsqvtfD8RwiIWMGCfren1uyVBmyLyLngs=; b=Gm7wyK2W5EgL/uo1AXp63Yz6Yp
	vJvrNtaps9RlX4x/iBImmZ2x1j4CkPA4Dd1Ooehotl9QPcXVichuOJJPuxIqkLMgTtK+GVe3PWURg
	QCcF5WI7bM3a+L2trKAwff9EbK5xFu+Mqg8iJDn/Y4olqediBZFa95p5/GR0xJSqlaK8=;
Message-ID: <c412e3a5-9fce-6b25-640b-561b3c563cb3@xen.org>
Date: Sun, 16 Apr 2023 17:16:38 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.9.0
Subject: Re: [PATCH v3 0/4] P2M improvements for Arm
To: Henry Wang <Henry.Wang@arm.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <Bertrand.Marquis@arm.com>, Wei Chen <Wei.Chen@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20230328071334.2098429-1-Henry.Wang@arm.com>
 <7595ba77-899f-6aa2-a65c-64a0b34553ac@xen.org>
 <AS8PR08MB7991E697DBC2E12129FAA97C929F9@AS8PR08MB7991.eurprd08.prod.outlook.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <AS8PR08MB7991E697DBC2E12129FAA97C929F9@AS8PR08MB7991.eurprd08.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 16/04/2023 16:18, Henry Wang wrote:
> Hi Julien,

Hi Henry,

>> -----Original Message-----
>> From: Julien Grall <julien@xen.org>
>> Subject: Re: [PATCH v3 0/4] P2M improvements for Arm
>>
>> Hi Henry,
>>
>>> Henry Wang (4):
>>>     xen/arm: Reduce redundant clear root pages when teardown p2m
>>>     xen/arm: Rename vgic_cpu_base and vgic_dist_base for new vGIC
>>>     xen/arm: Defer GICv2 CPU interface mapping until the first access
>>>     xen/arm: Clean-up in p2m_init() and p2m_final_teardown()
>>
>> I have committed the series.
> 
> Many thanks for that! Also thanks for your review for the series.
> 
> While you are at this, I am wondering would you mind also taking a look
> at [1] since I believe I have fixed your comments which correctly pointed
> out about the format of "printk info" in v3 of that series.

Sorry this fell through the cracks. I will have a look at it now.

Cheers,

-- 
Julien Grall

