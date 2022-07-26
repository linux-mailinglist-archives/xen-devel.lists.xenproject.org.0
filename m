Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EF2E0581871
	for <lists+xen-devel@lfdr.de>; Tue, 26 Jul 2022 19:36:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.375610.608043 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oGOTC-0003n4-Gd; Tue, 26 Jul 2022 17:35:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 375610.608043; Tue, 26 Jul 2022 17:35:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oGOTC-0003kM-DX; Tue, 26 Jul 2022 17:35:46 +0000
Received: by outflank-mailman (input) for mailman id 375610;
 Tue, 26 Jul 2022 17:35:44 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1oGOTA-0003kB-Ro
 for xen-devel@lists.xenproject.org; Tue, 26 Jul 2022 17:35:44 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1oGOT8-0005hZ-OT; Tue, 26 Jul 2022 17:35:42 +0000
Received: from 54-240-197-230.amazon.com ([54.240.197.230] helo=[10.7.237.34])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1oGOT8-0005ff-GN; Tue, 26 Jul 2022 17:35:42 +0000
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
	bh=6Z/NZ3KAbfhXFRA6u6VXMWJRceC17hHIFkndbGPG6Y8=; b=4CwgsNw5dXCOHD8Cmvr0ou7PXb
	5847YKHLIY/j8ybE/vCXmQjsubjPiXTUKfBoK5/l0h0iGdEQbo3Ey0fRSTv3Bw5GT+pP5PhBLTxzQ
	niynTWSWN9eibEcLjmGqBRpLoccglAEomdX/z10OtCuIBhvrH7mju9OVX/JbrStdUVDE=;
Message-ID: <53703921-12a2-90cc-55bd-94a4d86a5d70@xen.org>
Date: Tue, 26 Jul 2022 18:35:40 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.11.0
Subject: Re: [PATCH] xen/arm: smmuv1: remove iommu group when deassign a
 device
To: Rahul Singh <Rahul.Singh@arm.com>,
 Mykyta Poturai <mykyta.poturai@gmail.com>
Cc: Bertrand Marquis <Bertrand.Marquis@arm.com>,
 "Volodymyr_Babchuk@epam.com" <Volodymyr_Babchuk@epam.com>,
 "sstabellini@kernel.org" <sstabellini@kernel.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <0A58139F-CA6F-4E18-B44A-2066AEF0C8F6@arm.com>
 <20220628172338.1637121-1-mykyta_poturai@epam.com>
 <69C0FF69-98E3-440B-9CE7-3025EE5E0E4C@arm.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <69C0FF69-98E3-440B-9CE7-3025EE5E0E4C@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 21/07/2022 16:53, Rahul Singh wrote:
>> On 28 Jun 2022, at 6:23 pm, Mykyta Poturai <mykyta.poturai@gmail.com> wrote:
>> With this patch I get the same results, here is the error message:
>>
>> (XEN) smmu: /iommu@51400000: Unexpected global fault, this could be serious
>> (XEN) smmu: /iommu@51400000:    GFSR 0x00000001, GFSYNR0 0x00000004, GFSYNR1 0x00001055, GFSYNR2 0x00000000
>>
> 
> As you mentioned earlier, this fault is observed because GPU continues to access memory when the context is
> already invalidated, and therefore triggers the "Invalid context fault".  This is a different issue and is not related to this patch.
> 
> @Julien are you okay if I will send the below patch for official review as this issue pending for a long time?

I am OK in principle. I will do a proper review on you send a formal patch.

Cheers,

-- 
Julien Grall

