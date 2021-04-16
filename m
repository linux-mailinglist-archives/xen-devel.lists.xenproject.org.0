Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 98B253623D3
	for <lists+xen-devel@lfdr.de>; Fri, 16 Apr 2021 17:23:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.111863.213910 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lXQJk-0004vy-8C; Fri, 16 Apr 2021 15:23:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 111863.213910; Fri, 16 Apr 2021 15:23:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lXQJk-0004vc-5B; Fri, 16 Apr 2021 15:23:36 +0000
Received: by outflank-mailman (input) for mailman id 111863;
 Fri, 16 Apr 2021 15:23:34 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1lXQJi-0004vU-Ru
 for xen-devel@lists.xenproject.org; Fri, 16 Apr 2021 15:23:34 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lXQJh-0000b6-ML; Fri, 16 Apr 2021 15:23:33 +0000
Received: from [54.239.6.185] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lXQJh-00041R-EI; Fri, 16 Apr 2021 15:23:33 +0000
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
	bh=id6bSkFigLGMm1fydDiXIgZj0L0d3um9KFzHEjDyr0o=; b=ss6a7HT/pHjPP3u2zU+LDCTMlA
	VXRyliwxTgnryzYysQlJqqzyQQQ2+6XdZAyN/jS4V+64EG1TWjIz5MLU8DJWYQmZ0L9wAEDgissht
	WRKnYIW2kxv2pnKixXm65ypres5lAjMIRSIEUoxFhThLaJYnL990oAJOTu4P8Lyfij2k=;
Subject: Re: [PATCH] xen/arm: smmuv1: Revert associating the group pointer
 with the S2CR
To: Rahul Singh <Rahul.Singh@arm.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>,
 Bertrand Marquis <Bertrand.Marquis@arm.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <d2e4ed0eaf25a6b581fdec63cd31a742f3182118.1618572178.git.rahul.singh@arm.com>
 <6e75d112-6cc1-4b7c-9751-4064b3250dbf@xen.org>
 <E2FE265F-B7A4-45C3-BA9C-3EF9109F8B5E@arm.com>
From: Julien Grall <julien@xen.org>
Message-ID: <8569c856-8838-e5d1-b653-e7eb476dacdc@xen.org>
Date: Fri, 16 Apr 2021 16:23:31 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.9.1
MIME-Version: 1.0
In-Reply-To: <E2FE265F-B7A4-45C3-BA9C-3EF9109F8B5E@arm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 8bit



On 16/04/2021 16:01, Rahul Singh wrote:
> Hi Julien,

Hi Rahul,

> 
>> On 16 Apr 2021, at 3:35 pm, Julien Grall <julien@xen.org> wrote:
>>
>> Hi,
>>
>> On 16/04/2021 12:25, Rahul Singh wrote:
>>> Revert the code that associates the group pointer with the S2CR as this
>>> code causing an issue when the SMMU device has more than one master
>>> device.
>>
>> It is not clear to me why this change was first added. Are we missing any feature when reverting it?
> 
> This feature was added when we backported the code from Linux to fix the stream match conflict issue
> as part of commit "xen/arm: smmuv1: Intelligent SMR allocation”.
> 
> This is an extra feature added to allocate IOMMU group based on stream-id. If two device has the
> same stream-id then we assign those devices to the same group. 

If we revert the patch, then it would not be possible to use the SMMU if 
two devices use the same stream-id. Is that correct?

> This code was removed from Linux
> later point in time when IOMMU group handling is done by Linux code not by a specific IOMMU driver.

Right.... But Linux still support that option. Is that correct?

> Therefore I think it is ok revert the code.

I am ok with the principle of (partially) reverting patch to unblock the 
situation. But I have to admit, I don't quite understand why this is 
reverted rather than fixed.

Cheers,

-- 
Julien Grall

