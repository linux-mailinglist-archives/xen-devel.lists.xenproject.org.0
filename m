Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EEC8585B983
	for <lists+xen-devel@lfdr.de>; Tue, 20 Feb 2024 11:50:29 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.683396.1062890 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rcNhU-000790-0m; Tue, 20 Feb 2024 10:50:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 683396.1062890; Tue, 20 Feb 2024 10:50:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rcNhT-00077U-TC; Tue, 20 Feb 2024 10:50:11 +0000
Received: by outflank-mailman (input) for mailman id 683396;
 Tue, 20 Feb 2024 10:50:10 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1rcNhS-00077O-Pi
 for xen-devel@lists.xenproject.org; Tue, 20 Feb 2024 10:50:10 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1rcNhR-0008Ku-E5; Tue, 20 Feb 2024 10:50:09 +0000
Received: from [15.248.2.238] (helo=[10.24.67.30])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1rcNhR-0007Wl-53; Tue, 20 Feb 2024 10:50:09 +0000
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
	bh=HQ3snlpb44n8vXTacFp+yT86OWJqDU3WzFqVPtSdIvQ=; b=b2e6J3QYRhEVnOcLS9eicOBRyZ
	AAYWWPFxAZzU7KkO9o1cMYqYXWr8V+6etBxquVQYwhktrsfdrtpe51j+CjHQaG1WhzCANaY4tFKIP
	jtU0tRrwWjRI+biAEpgKA/Y41rfM/X+RtnL6BnAcsbOHdUzY8mXGNS4pWe31cjVvhT38=;
Message-ID: <4fa5953d-99b5-40fe-a15b-c58afc4a38cf@xen.org>
Date: Tue, 20 Feb 2024 10:50:06 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 7/7] xen/asm-generic: fold struct devarch into struct
 dev
Content-Language: en-GB
To: Oleksii <oleksii.kurochko@gmail.com>, xen-devel@lists.xenproject.org
Cc: Rahul Singh <rahul.singh@arm.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Wei Liu <wl@xen.org>
References: <cover.1708086091.git.oleksii.kurochko@gmail.com>
 <3a5bf394a9d95a28cecac996f6e0decb788c19fd.1708086092.git.oleksii.kurochko@gmail.com>
 <7a2ed74d-a773-4dc1-8331-a1ee28b17f4a@xen.org>
 <806552bc18430cdc9e6dae9fa3321e4f77b22317.camel@gmail.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <806552bc18430cdc9e6dae9fa3321e4f77b22317.camel@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Oleksii,

On 20/02/2024 10:45, Oleksii wrote:
> Hi Julien,
> 
> On Mon, 2024-02-19 at 19:00 +0000, Julien Grall wrote:
>> Hi,
>>
>> On 16/02/2024 12:39, Oleksii Kurochko wrote:
>>> The current patch is a follow-up to the patch titled:
>>>       xen/asm-generic: introduce generic device.h
>>> Also, a prerequisite for this patch is, without which a compilation
>>> error will occur:
>>>       xen/arm: switch Arm to use asm-generic/device.h
>>>
>>> The 'struct dev_archdata' is exclusively used within 'struct
>>> device',
>>> so it could be merged into 'struct device.'
>>>
>>> After the merger, it is necessary to update the 'dev_archdata()'
>>> macros and the comments above 'struct arm_smmu_xen_device' in
>>> drivers/passthrough/arm/smmu.c.
>>> Additionally, it is required to update instances of
>>> "dev->archdata->iommu" to "dev->iommu".
>>>
>>> Suggested-by: Julien Grall <julien@xen.org>
>>> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
>>> ---
>>>     This patch can be merged with patches 4 and 5 of this patch
>>> series.
>>
>> I am a bit puzzled with this comment. If this is the case, then why
>> was
>> it done in a separate patch?
>>
>> I know I suggested to create the separate patch but this was only in
>> the
>> case you decided to handle it after this series is merged. So this
>> should have been merged when sending. Maybe I should have been
>> clearer.
> I can submit a new version of the patch series in which this patch will
> be incorporated into patches 4 and 5, respectively.

AFAICT the series is fully acked. So no need to send a new version. But 
please keep the request in mind for future series.

Cheers,

-- 
Julien Grall

