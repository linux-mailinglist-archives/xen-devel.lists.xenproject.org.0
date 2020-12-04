Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BF4E2CEA3B
	for <lists+xen-devel@lfdr.de>; Fri,  4 Dec 2020 09:53:08 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.44148.79147 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kl6pI-0006D6-L0; Fri, 04 Dec 2020 08:52:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 44148.79147; Fri, 04 Dec 2020 08:52:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kl6pI-0006Ch-HR; Fri, 04 Dec 2020 08:52:28 +0000
Received: by outflank-mailman (input) for mailman id 44148;
 Fri, 04 Dec 2020 08:52:27 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1kl6pH-0006Cc-GP
 for xen-devel@lists.xenproject.org; Fri, 04 Dec 2020 08:52:27 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1kl6pG-00047b-AA; Fri, 04 Dec 2020 08:52:26 +0000
Received: from [54.239.6.186] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1kl6pG-00080R-22; Fri, 04 Dec 2020 08:52:26 +0000
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
	bh=rA7cUkEhzOwYWHpkZlKG9tDLVRXBLDbhvxlPgKDSKcE=; b=se5/V9eA0JPLOii9tZzHK6ikeX
	ze3PtCW1c+Bo1Vg+QxrtkT+/pWMvFu8dWOnwKiVW1jTjXP08VBpwiC+pEch0PSx9J9KER7eholhaP
	MZA55J7w7T0GeBjAOkF1jQJ3pLCfGtAMXoIteP39J8QKnXVwH1HMKG3bUU/ryjWwNOqY=;
Subject: Re: [PATCH v2 3/8] xen/arm: revert patch related to XArray
To: Rahul Singh <Rahul.Singh@arm.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Bertrand Marquis <Bertrand.Marquis@arm.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <cover.1606406359.git.rahul.singh@arm.com>
 <612c1adabc1c26a539abf0dc05ea20b51e66e85f.1606406359.git.rahul.singh@arm.com>
 <266b918c-b9c4-e067-b8dc-4e879c913af5@xen.org>
 <2B1A7090-F07C-4DF9-BDEC-6E5A2D715DB4@arm.com>
From: Julien Grall <julien@xen.org>
Message-ID: <0f59af9e-b639-5a79-2227-bb6d18270fcd@xen.org>
Date: Fri, 4 Dec 2020 08:52:24 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.5.1
MIME-Version: 1.0
In-Reply-To: <2B1A7090-F07C-4DF9-BDEC-6E5A2D715DB4@arm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit



On 03/12/2020 12:57, Rahul Singh wrote:
> Hello Julien,

Hi,

>> On 2 Dec 2020, at 1:46 pm, Julien Grall <julien@xen.org> wrote:
>>
>> Hi Rahul,
>>
>> On 26/11/2020 17:02, Rahul Singh wrote:
>>> XArray is not implemented in XEN revert the patch that introduce the
>>> XArray code in SMMUv3 driver.
>>
>> Similar to the atomic revert, you are explaining why the revert but not the consequences. I think this is quite important to have them outline in the commit message as it looks like it means the SMMU driver would not scale.
> 
> Ok I will add.
>>
>>> Once XArray is implemented in XEN this patch can be added in XEN.
>>
>> What's the plan for that?
> 
> As of now there is no plan for Xarray from our side.
> Do we have requirement for Xarray implementation in XEN ?

That's going to depend on the consequence of reverting this patch.

Cheers,

-- 
Julien Grall

