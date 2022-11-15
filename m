Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E40C62AF54
	for <lists+xen-devel@lfdr.de>; Wed, 16 Nov 2022 00:16:41 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.444081.698897 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ov59t-00015c-Co; Tue, 15 Nov 2022 23:16:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 444081.698897; Tue, 15 Nov 2022 23:16:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ov59t-00012d-AA; Tue, 15 Nov 2022 23:16:01 +0000
Received: by outflank-mailman (input) for mailman id 444081;
 Tue, 15 Nov 2022 23:15:59 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1ov59r-00012X-Oj
 for xen-devel@lists.xenproject.org; Tue, 15 Nov 2022 23:15:59 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1ov59r-0001ko-BL; Tue, 15 Nov 2022 23:15:59 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.1.102])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1ov59r-00068T-4m; Tue, 15 Nov 2022 23:15:59 +0000
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
	bh=ALaSgubVJlg+buTFa1b/+W8ptdoAfRjPbE2PkHujuuE=; b=TFFKUYfd5VyelQwCmN0H9oaQDq
	zi48Ng8C2cy+zBOtAHMTdttO+M3uZLIMV95EBHndrG+axrbbUhxCZb6xuKU/GkGQ6P6BcHoSAYrfY
	zi/4qhDcW9+EEMPQEeBelBKJfGdc5K07274JysO0UC9epUNAikF3vLciO4/TjGKw9Quo=;
Message-ID: <e4cf6bfb-3fcd-d542-564b-6347f5d09809@xen.org>
Date: Tue, 15 Nov 2022 23:15:57 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.4.2
Subject: Re: [XEN v3 01/13] GICv3: Emulate GICD_IGRPMODR as RAZ / WI
To: Bertrand Marquis <Bertrand.Marquis@arm.com>,
 Ayan Kumar Halder <ayankuma@amd.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
 "sstabellini@kernel.org" <sstabellini@kernel.org>,
 "stefanos@xilinx.com" <stefanos@xilinx.com>,
 "Volodymyr_Babchuk@epam.com" <Volodymyr_Babchuk@epam.com>,
 "michalo@amd.com" <michalo@amd.com>
References: <20221024182518.65002-1-ayankuma@amd.com>
 <54C7F6D2-98C9-4976-92E4-3B46F82CCA20@arm.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <54C7F6D2-98C9-4976-92E4-3B46F82CCA20@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 25/10/2022 08:36, Bertrand Marquis wrote:
>> On 24 Oct 2022, at 19:25, Ayan Kumar Halder <ayankuma@amd.com> wrote:
>>
>> Refer GIC v3 specification (Arm IHI 0069H ID020922), IGRPMODR is emulated
>> as RAZ / WI for the guests as "GICD_CTLR.ARE_S==0" is true.
>> Xen is currently supported to run in non-secure mode, so guests will run in
>> non-secure mode only.
>>
>> Also, if Xen was supposed to run in secure mode with guests, the programming
>> of the interrupts (ie whether it belongs to secure/non secure and group 0/1)
>> will be done by Xen only. The guests will not be allowed to change this.
> 
> Thanks a lot this description is a lot better.
> 
>>
>> Signed-off-by: Ayan Kumar Halder <ayankuma@amd.com>
> Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>
> 
> I do not think this is something for 4.17 so it will need to be on hold until staging reopens unless someone thinks otherwise ?

I have pushed the patch to my branch for-next/4.18. I will merge it once 
the tree is re-opened.

Cheers,

-- 
Julien Grall

