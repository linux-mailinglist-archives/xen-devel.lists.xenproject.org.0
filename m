Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BE8177BA729
	for <lists+xen-devel@lfdr.de>; Thu,  5 Oct 2023 18:56:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.613085.953366 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qoRds-00055w-UG; Thu, 05 Oct 2023 16:56:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 613085.953366; Thu, 05 Oct 2023 16:56:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qoRds-00053w-RM; Thu, 05 Oct 2023 16:56:04 +0000
Received: by outflank-mailman (input) for mailman id 613085;
 Thu, 05 Oct 2023 16:56:03 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1qoRdr-00053q-UU
 for xen-devel@lists.xenproject.org; Thu, 05 Oct 2023 16:56:03 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qoRdr-0002YR-NV; Thu, 05 Oct 2023 16:56:03 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.1.240])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qoRdr-000304-Hs; Thu, 05 Oct 2023 16:56:03 +0000
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
	bh=48R8EGAEBg78nAR7TOfRWGnpSnHIZ4BMLeLlSKazeqo=; b=hV6d71tk/kANTJLuThEni/Vrjw
	9q0AcIVudi8bv1uwT1Vw6K53r62ctTVfRe2yqCOh1n0JqkuLUXZwO0BXIfjEF+G2K2LEYQivDG95h
	hhncLMiV2T7ckjBqOceDLq8yVUb1y6psStbrrlCxSvSgFP7lU+4QmCX7UvtED4ki9SHY=;
Message-ID: <721bdc52-92b2-4912-bde1-9fd317523294@xen.org>
Date: Thu, 5 Oct 2023 17:56:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Xen on AWS EC2 Graviton 2 metal instances (c6g.metal)
Content-Language: en-GB
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: "Driscoll, Dan" <dan.driscoll@siemens.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 "arvind.raghuraman@siemens.com" <arvind.raghuraman@siemens.com>,
 Bertrand Marquis <Bertrand.Marquis@arm.com>,
 "rahul.singh@arm.com" <rahul.singh@arm.com>,
 Luca Fancellu <Luca.Fancellu@arm.com>
References: <DM6PR07MB43168B0D4DEA80BF2474B9D89AC3A@DM6PR07MB4316.namprd07.prod.outlook.com>
 <ed3ea203-4244-4bbe-a9e0-ac8882ecc83c@xen.org>
 <DM6PR07MB4316E030CEF6D6E27ACD58819AC0A@DM6PR07MB4316.namprd07.prod.outlook.com>
 <alpine.DEB.2.22.394.2309291321570.2348112@ubuntu-linux-20-04-desktop>
 <c3cf8e91-cf68-410d-8640-09fce6d20e9b@xen.org>
 <alpine.DEB.2.22.394.2310021554520.2348112@ubuntu-linux-20-04-desktop>
From: Julien Grall <julien@xen.org>
In-Reply-To: <alpine.DEB.2.22.394.2310021554520.2348112@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 03/10/2023 00:03, Stefano Stabellini wrote:
> On Mon, 2 Oct 2023, Julien Grall wrote:
>> On 29/09/2023 21:29, Stefano Stabellini wrote:
>> Now regarding whether the PPI is used. AFAICT, the secure timer PPI is still
>> present in the firmware tables (ACPI and DT) passed to dom0. So strictly
>> speaking we want to ensure the PPI value is reserved.
>>
>> That said, the ACPI spec suggests that the value will be ignored by the guest.
>> The Device-Tree binding doesn't have such statement, but I suspect this may be
>> the same. So it should be ok to skip reserving the PPI and therefore allow the
>> event channel interrupt to use if it is not reserved by someone else.
> 
> You looked into this more deeply then I did. Your suggestion makes sense
> to me.

I have sent a patch [1]. This is not quite the same as I discussed 
before. See the commit message for more details.

Cheers,

[1] https://lore.kernel.org/20231005165454.18143-1-julien@xen.org

-- 
Julien Grall

