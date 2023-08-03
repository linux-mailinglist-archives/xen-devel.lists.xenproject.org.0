Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B363276E4DC
	for <lists+xen-devel@lfdr.de>; Thu,  3 Aug 2023 11:47:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.576148.901967 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qRUuS-00059v-RO; Thu, 03 Aug 2023 09:46:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 576148.901967; Thu, 03 Aug 2023 09:46:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qRUuS-00057a-Oc; Thu, 03 Aug 2023 09:46:20 +0000
Received: by outflank-mailman (input) for mailman id 576148;
 Thu, 03 Aug 2023 09:46:19 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1qRUuR-00057U-Gl
 for xen-devel@lists.xenproject.org; Thu, 03 Aug 2023 09:46:19 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qRUuR-00021n-1L; Thu, 03 Aug 2023 09:46:19 +0000
Received: from 54-240-197-234.amazon.com ([54.240.197.234]
 helo=[192.168.22.21]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qRUuQ-00058N-PS; Thu, 03 Aug 2023 09:46:18 +0000
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
	bh=uKQlEQh2f1FeMdUq8Ub6MJCuP8O/rZdEBeih/oP3A3E=; b=q8FONRsff89uU1OBGVDHOSB7Qu
	qVPHuQclpkcD41010jtrWAPOSR+SH6Pv1EkIutuFvgOzqOxykgoYeVcn3r68Bvy5JxthUVcz2rrFa
	1yW0tHlgeJ+cyrGkrNuMH68thdB88SzOpE0Tz1JBdxtB1kMOHOpd8U3XBXzPCMaesE3k=;
Message-ID: <15e52d9f-8d45-fd22-71bc-fbc71ff39470@xen.org>
Date: Thu, 3 Aug 2023 10:46:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH] arm/gicv2: make GICv2 driver and vGICv2 optional
Content-Language: en-GB
To: Luca Fancellu <Luca.Fancellu@arm.com>
Cc: Michal Orzel <michal.orzel@amd.com>,
 Xen-devel <xen-devel@lists.xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <Bertrand.Marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20230802135350.745251-1-luca.fancellu@arm.com>
 <17bc595a-dc30-9e76-4d31-aad62f9c9672@amd.com>
 <3ED442CB-0569-4C9C-9770-39D2FE4852A0@arm.com>
 <8c8f2564-935b-e3c8-ad15-348135140a53@amd.com>
 <92AE30B2-B2CE-465F-A6FC-A86961BED85A@arm.com>
 <9d40bd81-dc3a-0288-8f8a-1de62dc30d1d@xen.org>
 <1a364aa9-4549-80b9-4319-d91551f228bd@amd.com>
 <8516a6bb-8321-fc84-c7ce-10a7b41ecb59@xen.org>
 <33DCC5E2-7190-464C-B25A-68BC68CA4021@arm.com>
 <3942c22a-80e1-29bd-4bd8-15d4bc43d220@xen.org>
 <BD156163-5EA0-4497-9A44-F32CB257DA4C@arm.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <BD156163-5EA0-4497-9A44-F32CB257DA4C@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 03/08/2023 09:39, Luca Fancellu wrote:
> I would like to ask if you see this one going forwards or not (as it is), because I have a set of patches to isolate and Kconfig-out
> the dom0less code, that is depending on this one (for a small bit) and before sending them I need to understand if this one can
> see the light or not.

In principle, I have no issues with trying to disable some part of Xen 
code. I will still need to look at each one to confirm I am happy with 
the changes.

For this case, I will have a look in a bit.

Cheers,

-- 
Julien Grall

