Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E556634838
	for <lists+xen-devel@lfdr.de>; Tue, 22 Nov 2022 21:32:15 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.447303.703387 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oxZw0-0007i6-Ps; Tue, 22 Nov 2022 20:32:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 447303.703387; Tue, 22 Nov 2022 20:32:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oxZw0-0007fA-Mg; Tue, 22 Nov 2022 20:32:00 +0000
Received: by outflank-mailman (input) for mailman id 447303;
 Tue, 22 Nov 2022 20:31:59 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1oxZvz-0007ez-Ds
 for xen-devel@lists.xenproject.org; Tue, 22 Nov 2022 20:31:59 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1oxZvz-00081x-2O; Tue, 22 Nov 2022 20:31:59 +0000
Received: from [54.239.6.190] (helo=[192.168.0.48])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1oxZvy-00043h-RM; Tue, 22 Nov 2022 20:31:58 +0000
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
	bh=DcQKRdEotdvsrK9aa5y6z2WHO71mRyHJqy/Jgv4i8Jg=; b=B0RO2+/qD51ZitPZPbnEckru6Q
	u+4ODD+NN9I1Bmim+dlb1vGvp5Qt+WAa4bbCFnPchqp9hw48k1pQ/LwWyIA+8J8h90jm6EkzxKwgl
	WNoCv+XaGpthWLhKW3coNFkBDT5d+jWRsFhWN51VspKNYGhwtPPYojl8Erqadf30WjIo=;
Message-ID: <4045f91a-620a-98b0-d3c7-28af1b0ba4a8@xen.org>
Date: Tue, 22 Nov 2022 21:31:56 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.5.0
Subject: Re: [XEN v3 02/12] xen/Arm: GICv3: Adapt access to VMPIDR register
 for AArch32
Content-Language: en-US
To: Michal Orzel <michal.orzel@amd.com>,
 Ayan Kumar Halder <ayan.kumar.halder@amd.com>, xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org, stefanos@xilinx.com, Volodymyr_Babchuk@epam.com,
 bertrand.marquis@arm.com, jgrall@amazon.com, burzalodowa@gmail.com
References: <20221111141739.2872-1-ayan.kumar.halder@amd.com>
 <20221111141739.2872-3-ayan.kumar.halder@amd.com>
 <8086e3ac-445b-17a1-bba3-078024ab2579@amd.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <8086e3ac-445b-17a1-bba3-078024ab2579@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 17/11/2022 13:39, Michal Orzel wrote:
> Hi Ayan,
> 
> On 11/11/2022 15:17, Ayan Kumar Halder wrote:
>> Refer ARM DDI 0487I.a ID081822, G8-9817, G8.2.169
>> Affinity level 3 is not present in AArch32.
>> Also, refer ARM DDI 0406C.d ID040418, B4-1644, B4.1.106,
>> Affinity level 3 is not present in Armv7 (ie arm32).
>> Thus, any access to affinity level 3 needs to be guarded within
>> "ifdef CONFIG_ARM_64".
>>
>> Signed-off-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
> Reviewed-by: Michal Orzel <michal.orzel@amd.com>
> 
> although, IMO the commit msg does not reflect the change (i.e. you do nothing
> related to accessing MPIDR, but instead you are just not taking the Aff3 into account for AArch32).
> Also, I'm not sure why you used VMPIDR and not MPIDR.

+1. Can one of you propose an improved commit message/title?

I would be happy to update the patch on commit if there are nothing else 
to update in this series.

Cheers,

-- 
Julien Grall

