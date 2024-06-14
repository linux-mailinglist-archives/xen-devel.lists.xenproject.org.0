Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A8288908805
	for <lists+xen-devel@lfdr.de>; Fri, 14 Jun 2024 11:47:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.740567.1147656 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sI3WD-0000Zf-Sn; Fri, 14 Jun 2024 09:46:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 740567.1147656; Fri, 14 Jun 2024 09:46:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sI3WD-0000Wm-Q1; Fri, 14 Jun 2024 09:46:49 +0000
Received: by outflank-mailman (input) for mailman id 740567;
 Fri, 14 Jun 2024 09:46:48 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1sI3WC-0000We-8E
 for xen-devel@lists.xenproject.org; Fri, 14 Jun 2024 09:46:48 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1sI3WB-0000yz-Oq; Fri, 14 Jun 2024 09:46:47 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.0.211])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1sI3WB-00010A-If; Fri, 14 Jun 2024 09:46:47 +0000
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
	bh=nE3GURDV+edZoPtQu7IG+u+8p2e0vOsmsHTgeOnPpno=; b=xqOwj7sRUpp62iDKNg0DF/dIhj
	cySir8qomt+x11KMmFEEyMSaeRAxYeRX/KXoFt3GmIaGNcK7p7QI/5+PRkCTYCkqwyifxDf7ZfIIc
	Ix/v11o0+pLfAbtlHoUq3osjdzT4zEn5a4qE31ZtLsu1ufupuyZzl9pcU9GGZxtqGSUU=;
Message-ID: <216fc5bb-e148-47d4-8946-75abd7f3251e@xen.org>
Date: Fri, 14 Jun 2024 10:46:45 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 0/7] Static shared memory followup v2 - pt2
Content-Language: en-GB
To: Luca Fancellu <Luca.Fancellu@arm.com>
Cc: Michal Orzel <michal.orzel@amd.com>,
 Xen-devel <xen-devel@lists.xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <Bertrand.Marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 Oleksandr Tyshchenko <olekstysh@gmail.com>
References: <20240524124055.3871399-1-luca.fancellu@arm.com>
 <3DDAAFF7-5E43-4B92-9D6B-6D8AFBA8496F@arm.com>
 <66e5d584-b326-4197-81d5-ec2b8233a3fa@amd.com>
 <502d0284-1ca2-478c-b4f4-fda5caff3723@xen.org>
 <92B10944-083B-4DB3-8257-ADD452FBFF69@arm.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <92B10944-083B-4DB3-8257-ADD452FBFF69@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 14/06/2024 08:54, Luca Fancellu wrote:
> Hi Julien,

Hi Luca,

>> On 13 Jun 2024, at 12:31, Julien Grall <julien@xen.org> wrote:
>>
>> Hi,
>>
>> On 11/06/2024 13:42, Michal Orzel wrote:
>>>> We would like this serie to be in Xen 4.19, there was a misunderstanding on our side because we thought
>>>> that since the serie was sent before the last posting date, it could have been a candidate for merging in the
>>>> new release, instead after speaking with Julien and Oleksii we are now aware that we need to provide a
>>>> justification for its presence.
>>>>
>>>> Pros to this serie is that we are closing the circle for static shared memory, allowing it to use memory from
>>>> the host or from Xen, it is also a feature that is not enabled by default, so it should not cause too much
>>>> disruption in case of any bugs that escaped the review, however we’ve tested many configurations for that
>>>> with/without enabling the feature if that can be an additional value.
>>>>
>>>> Cons: we are touching some common code related to p2m, but also there the impact should be minimal because
>>>> the new code is subject to l2 foreign mapping (to be confirmed maybe from a p2m expert like Julien).
>>>>
>>>> The comments on patch 3 of this serie are addressed by this patch:
>>>> https://patchwork.kernel.org/project/xen-devel/patch/20240528125603.2467640-1-luca.fancellu@arm.com/
>>>> And the serie is fully reviewed.
>>>>
>>>> So our request is to allow this serie in 4.19, Oleksii, ARM maintainers, do you agree on that?
>>> As a main reviewer of this series I'm ok to have this series in. It is nicely encapsulated and the feature itself
>>> is still in unsupported state. I don't foresee any issues with it.
>>
>> There are changes in the p2m code and the memory allocation for boot domains. So is it really encapsulated?
>>
>> For me there are two risks:
>> * p2m (already mentioned by Luca): We modify the code to put foreign mapping. The worse that can happen if we don't release the foreign mapping. This would mean the page will not be freed. AFAIK, we don't exercise this path in the CI.
>> * domain allocation: This mainly look like refactoring. And the path is exercised in the CI.
>>
>> So I am not concerned with the domain allocation one. @Luca, would it be possible to detail how did you test the foreign pages were properly removed?
> 
> So at first we tested the code, with/without the static shared memory feature enabled, creating/destroying guest from Dom0 and checking that everything
> was ok.

Just to details a bit more for the other. In a normal setup, guest would 
be using PV block/network which are based on grant table. To exercise 
the foreing mapping path, you would need a backend that map using the 
GFN directly.

This is the case for virtio MMIO. Other users are IIRC XenFB, IOREQ (if 
you emulate a device).

> 
> After a chat on Matrix with Julien he suggested that using a virtio-mmio disk was better to stress out the foreign mapping looking for
> regressions.
> 
> Luckily I’ve found this slide deck from @Oleksandr: https://static.linaro.org/connect/lvc21/presentations/lvc21-314.pdf
> 
> So I did a setup using fvp-base, having a disk with two partitions containing Dom0 rootfs and DomU rootfs, Dom0 sees
> this disk using VirtIO block.

Thanks for the testing! I am satisfied with the result. I have committed 
the series.

Cheers,

-- 
Julien Grall

