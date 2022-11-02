Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B3C00615E5C
	for <lists+xen-devel@lfdr.de>; Wed,  2 Nov 2022 09:51:32 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.435654.689295 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oq9Su-0007x7-Ua; Wed, 02 Nov 2022 08:51:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 435654.689295; Wed, 02 Nov 2022 08:51:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oq9Su-0007vJ-Rs; Wed, 02 Nov 2022 08:51:16 +0000
Received: by outflank-mailman (input) for mailman id 435654;
 Wed, 02 Nov 2022 08:51:15 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1oq9St-0007vD-2O
 for xen-devel@lists.xenproject.org; Wed, 02 Nov 2022 08:51:15 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1oq9Ss-0005ia-JZ; Wed, 02 Nov 2022 08:51:14 +0000
Received: from 54-240-197-232.amazon.com ([54.240.197.232]
 helo=[192.168.26.173]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1oq9Ss-0007ye-DA; Wed, 02 Nov 2022 08:51:14 +0000
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
	bh=JckvhBMCGPKMErj4nJrjlog/hoTr01oVAsdjkU8D5Dc=; b=4X0ij574xV2FpI/+vScY+OqTKr
	3SxpOFnTlM+fuIkxSVBcAau2tCM1Gz30mE8EfbV2nyPJpa+LXbUMqpQ7Wdb8vfdLqWpbMQcRkL/96
	dgl9Abg6FijVF7o+r1dS7KvbdsK+XjokCmED2ZrKXhKrZ3X2nz4IvM+U3t2uxB//J3UI=;
Message-ID: <a9592b03-4a5b-90be-c780-a6a9c70cefc1@xen.org>
Date: Wed, 2 Nov 2022 08:51:12 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.4.1
Subject: Re: [XEN v2 01/12] xen/Arm: vGICv3: Sysreg emulation is applicable
 for Aarch64 only
Content-Language: en-US
To: Michal Orzel <michal.orzel@amd.com>, Ayan Kumar Halder
 <ayankuma@amd.com>, xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org, stefanos@xilinx.com, Volodymyr_Babchuk@epam.com,
 bertrand.marquis@arm.com, burzalodowa@gmail.com
References: <20221031151326.22634-1-ayankuma@amd.com>
 <20221031151326.22634-2-ayankuma@amd.com>
 <b6504f3b-00c1-db31-2c40-94796f8cf161@amd.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <b6504f3b-00c1-db31-2c40-94796f8cf161@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 31/10/2022 17:43, Michal Orzel wrote:
> Hi Ayan,
> 
> On 31/10/2022 16:13, Ayan Kumar Halder wrote:
>>
>>
>> Refer ARM DDI 0487G.b ID072021, EC==0b011000 is supported for Aarch64 state
> 
> I think when adding new code we should be taking the latest spec (which is I.a) as a base +
> you are lacking the information \wrt page number, table, whatever contains this information
> within ARM ARM.

+1.

> 
> Apart from that, wouldn't it be easier for those reading the commit to just write e.g.:
> "Sysreg emulation is 64-bit specific, so guard the calls to vgic_v3_emulate_sysreg
> as well as the function itself with #ifdef CONFIG_ARM_64."

This read better. What matter is the emulation is 64-bit specific, not 
that the EC doesn't exist on 32-bit (BTW, in theory 32-bit could have 
re-used it for a different purpose...).

Cheers,

-- 
Julien Grall

