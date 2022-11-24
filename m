Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DC05637F51
	for <lists+xen-devel@lfdr.de>; Thu, 24 Nov 2022 19:51:11 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.448017.704783 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oyHIx-0004Oe-En; Thu, 24 Nov 2022 18:50:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 448017.704783; Thu, 24 Nov 2022 18:50:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oyHIx-0004MT-Bb; Thu, 24 Nov 2022 18:50:35 +0000
Received: by outflank-mailman (input) for mailman id 448017;
 Thu, 24 Nov 2022 18:50:33 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1oyHIv-0004MN-JU
 for xen-devel@lists.xenproject.org; Thu, 24 Nov 2022 18:50:33 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1oyHIv-0003OX-6L; Thu, 24 Nov 2022 18:50:33 +0000
Received: from [54.239.6.186] (helo=[192.168.1.238])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1oyHIu-0006DP-W7; Thu, 24 Nov 2022 18:50:33 +0000
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
	bh=quuE02vogMuiDZiAXQUyR695Sh6wYPgHfrStJ3fHoo8=; b=ZaCDEi9/ZnMDe2wGmyGbW63DPc
	G58vOtqatJabvoLduBvGhfmLoFo1YWgwY/n1r2UDYsCn5W/DiJqMhNnTrMlHLSm4Je/NQUgvqA7vJ
	a4s24EZrKcjmWKi+UewCKHgEzjdzWX8VOBR02UcX+GLiEiB9zFPsPzne2qxjy80mS2pw=;
Message-ID: <dc892c8b-1c6d-4ac9-d587-88cab3aaed45@xen.org>
Date: Thu, 24 Nov 2022 19:50:31 +0100
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
 <4045f91a-620a-98b0-d3c7-28af1b0ba4a8@xen.org>
 <d6a8b31b-8622-8c6e-0495-9619f38cf18d@amd.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <d6a8b31b-8622-8c6e-0495-9619f38cf18d@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 23/11/2022 10:35, Michal Orzel wrote:
> Hi Julien,
> 
> On 22/11/2022 21:31, Julien Grall wrote:
>>
>>
>> On 17/11/2022 13:39, Michal Orzel wrote:
>>> Hi Ayan,
>>>
>>> On 11/11/2022 15:17, Ayan Kumar Halder wrote:
>>>> Refer ARM DDI 0487I.a ID081822, G8-9817, G8.2.169
>>>> Affinity level 3 is not present in AArch32.
>>>> Also, refer ARM DDI 0406C.d ID040418, B4-1644, B4.1.106,
>>>> Affinity level 3 is not present in Armv7 (ie arm32).
>>>> Thus, any access to affinity level 3 needs to be guarded within
>>>> "ifdef CONFIG_ARM_64".
>>>>
>>>> Signed-off-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
>>> Reviewed-by: Michal Orzel <michal.orzel@amd.com>
>>>
>>> although, IMO the commit msg does not reflect the change (i.e. you do nothing
>>> related to accessing MPIDR, but instead you are just not taking the Aff3 into account for AArch32).
>>> Also, I'm not sure why you used VMPIDR and not MPIDR.
>>
>> +1. Can one of you propose an improved commit message/title?
> Title: "Do not calculate affinity level 3 for AArch32"

Sounds good to me.

> 
> I think the commit message can stay as it is.
>>
>> I would be happy to update the patch on commit if there are nothing else
>> to update in this series.
> The series requires re-spinning anyway so no need to update the patch on commit.

Fine with that.

Cheers,

-- 
Julien Grall

