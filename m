Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 214F419A759
	for <lists+xen-devel@lfdr.de>; Wed,  1 Apr 2020 10:34:13 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jJYli-000854-Ew; Wed, 01 Apr 2020 08:30:38 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=46oD=5R=xen.org=julien@srs-us1.protection.inumbo.net>)
 id 1jJYlh-00084z-2l
 for xen-devel@lists.xenproject.org; Wed, 01 Apr 2020 08:30:37 +0000
X-Inumbo-ID: 0f952b78-73f3-11ea-b58d-bc764e2007e4
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 0f952b78-73f3-11ea-b58d-bc764e2007e4;
 Wed, 01 Apr 2020 08:30:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=W0SGaUpYB5rE1GPxdFDCD481TsxkiuXMZC7VUn6w8+k=; b=mKNvNpvjpJR/CLkq/LJFbXKPAj
 dmhj3qlIdDl1ieQCVG1a+cHLsCWFLMtqhkxD48tF92lSCNifGJ99daoKFrf7VYqn+1P2Oipwde1xw
 BJRcjWtuur4tgCWsAhAWKKk1q6uVVXEh6zIVkNKSF3UqgbpUAUfn45cL6LM+konEp2IM=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <julien@xen.org>)
 id 1jJYla-0005pM-4Y; Wed, 01 Apr 2020 08:30:30 +0000
Received: from cpc91226-cmbg18-2-0-cust12.5-4.cable.virginm.net ([82.0.29.13]
 helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.89)
 (envelope-from <julien@xen.org>)
 id 1jJYlZ-0006K5-UR; Wed, 01 Apr 2020 08:30:30 +0000
Subject: Re: [PATCH v2] xen/arm: implement GICD_I[S/C]ACTIVER reads
To: Stefano Stabellini <sstabellini@kernel.org>
References: <20200327023451.20271-1-sstabellini@kernel.org>
 <38f56c3e-8f7d-7aee-8216-73398f4543bb@xen.org>
 <alpine.DEB.2.21.2003300932430.4572@sstabellini-ThinkPad-T480s>
 <5deb3992-3cf5-2b00-8cef-af75ed83a1fd@xen.org>
 <alpine.DEB.2.21.2003311121120.4572@sstabellini-ThinkPad-T480s>
From: Julien Grall <julien@xen.org>
Message-ID: <2bb21703-8078-cd92-0463-bea049413f32@xen.org>
Date: Wed, 1 Apr 2020 09:30:27 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:68.0)
 Gecko/20100101 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <alpine.DEB.2.21.2003311121120.4572@sstabellini-ThinkPad-T480s>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: xen-devel@lists.xenproject.org, Peng Fan <peng.fan@nxp.com>,
 Stefano Stabellini <stefano.stabellini@xilinx.com>,
 Wei Xu <xuwei5@hisilicon.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>



On 01/04/2020 01:57, Stefano Stabellini wrote:
> On Mon, 30 Mar 2020, Julien Grall wrote:
>> Hi Stefano,
>>
>> On 30/03/2020 17:35, Stefano Stabellini wrote:
>>> On Sat, 28 Mar 2020, Julien Grall wrote:
>>>> qHi Stefano,
>>>>
>>>> On 27/03/2020 02:34, Stefano Stabellini wrote:
>>>>> This is a simple implementation of GICD_ICACTIVER / GICD_ISACTIVER
>>>>> reads. It doesn't take into account the latest state of interrupts on
>>>>> other vCPUs. Only the current vCPU is up-to-date. A full solution is
>>>>> not possible because it would require synchronization among all vCPUs,
>>>>> which would be very expensive in terms or latency.
>>>>
>>>> Your sentence suggests you have number showing that correctly emulating
>>>> the
>>>> registers would be too slow. Mind sharing them?
>>>
>>> No, I don't have any numbers. Would you prefer a different wording or a
>>> better explanation? I also realized there is a typo in there (or/of).
>> Let me start with I think correctness is more important than speed.
>> So I would have expected your commit message to contain some fact why
>> synchronization is going to be slow and why this is a problem.
>>
>> To give you a concrete example, the implementation of set/way instructions are
>> really slow (it could take a few seconds depending on the setup). However,
>> this was fine because not implementing them correctly would have a greater
>> impact on the guest (corruption) and they are not used often.
>>
>> I don't think the performance in our case will be in same order magnitude. It
>> is most likely to be in the range of milliseconds (if not less) which I think
>> is acceptable for emulation (particularly for the vGIC) and the current uses.
> 
> Writing on the mailing list some of our discussions today.
> 
> Correctness is not just in terms of compliance to a specification but it
> is also about not breaking guests. Introducing latency in the range of
> milliseconds, or hundreds of microseconds, would break any latency
> sensitive workloads. We don't have numbers so we don't know for certain
> the effect that your suggestion would have.

You missed part of the discussion. I don't disagree that latency is 
important. However, if an implementation is only 95% reliable, then it 
means 5% of the time your guest may break (corruption, crash, 
deadlock...). At which point the latency is the last of your concern.

> 
> It would be interesting to have those numbers, and I'll add to my TODO
> list to run the experiments you suggested, but I'll put it on the
> back-burner (from a Xilinx perspective it is low priority as no
> customers are affected.)

How about we get a correct implementation merge first and then discuss 
about optimization? This would allow the community to check whether 
there are actually noticeable latency in their workload.

Cheers,

-- 
Julien Grall

