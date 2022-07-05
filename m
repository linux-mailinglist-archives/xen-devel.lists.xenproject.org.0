Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DAFB85679E1
	for <lists+xen-devel@lfdr.de>; Wed,  6 Jul 2022 00:03:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.361646.591277 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o8qdd-0002xQ-SM; Tue, 05 Jul 2022 22:03:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 361646.591277; Tue, 05 Jul 2022 22:03:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o8qdd-0002uT-Ok; Tue, 05 Jul 2022 22:03:21 +0000
Received: by outflank-mailman (input) for mailman id 361646;
 Tue, 05 Jul 2022 22:03:20 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1o8qdb-0002tB-Vc
 for xen-devel@lists.xenproject.org; Tue, 05 Jul 2022 22:03:19 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1o8qdb-0006kw-P0; Tue, 05 Jul 2022 22:03:19 +0000
Received: from home.octic.net ([81.187.162.82] helo=[10.0.1.102])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1o8qdb-0008AR-Jo; Tue, 05 Jul 2022 22:03:19 +0000
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
	bh=M5+FvbEjnB1nQJ63M1p3GgPFPP7HPP8FjeLNywJGX0Y=; b=jJeJ/GbKobQjWVNDJ6WlUgjcJk
	JTcF9h/BrssoCyi8rtL8E7/NkSLN6qoB3/kOiHw9/ZBPu7ev2HW22QmDJqjlQpcVkjps1AhZHbAjO
	44g/4DUOy7ODDOzRYkNS6gXxU0ZOdYJGQhgKCjZeki+ouIRbEccD8ADwJBZlsUV9Wfbg=;
Message-ID: <cec16922-e6d7-869e-3b4d-ed00c6c9722f@xen.org>
Date: Tue, 5 Jul 2022 23:03:18 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.11.0
Subject: Re: [PATCH v3] xen/arm: avoid overflow when setting vtimer in context
 switch
To: Jiamei Xie <Jiamei.Xie@arm.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <Bertrand.Marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Wei Chen <Wei.Chen@arm.com>
References: <20220630015336.3040355-1-jiamei.xie@arm.com>
 <AS8PR08MB769671FD067374347EF976CE92BA9@AS8PR08MB7696.eurprd08.prod.outlook.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <AS8PR08MB769671FD067374347EF976CE92BA9@AS8PR08MB7696.eurprd08.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 30/06/2022 06:20, Jiamei Xie wrote:
> Hi,

Hi Jiamei,

>> -----Original Message-----
>> From: Jiamei Xie <jiamei.xie@arm.com>
>> Sent: 2022年6月30日 9:54
>> To: xen-devel@lists.xenproject.org
>> Cc: Jiamei Xie <Jiamei.Xie@arm.com>; Stefano Stabellini
>> <sstabellini@kernel.org>; Julien Grall <julien@xen.org>; Bertrand Marquis
>> <Bertrand.Marquis@arm.com>; Volodymyr Babchuk
>> <Volodymyr_Babchuk@epam.com>; Wei Chen <Wei.Chen@arm.com>
>> Subject: [PATCH v3] xen/arm: avoid overflow when setting vtimer in context
>> switch
>>
>> virt_vtimer_save is calculating the new time for the vtimer in:
>> "v->arch.virt_timer.cval + v->domain->arch.virt_timer_base.offset
>> - boot_count".
>> In this formula, "cval + offset" might cause uint64_t overflow.
>> Changing it to "ticks_to_ns(v->domain->arch.virt_timer_base.offset -
>> boot_count) + ticks_to_ns(v->arch.virt_timer.cval)" can avoid overflow,
>> and "ticks_to_ns(arch.virt_timer_base.offset - boot_count)" will be
>> always the same, which has been caculated in domain_vtimer_init.
>> Introduce a new field virt_timer_base.nanoseconds to store this value
>> for arm in struct arch_domain, so we can use it directly.
>>
>> Signed-off-by: Jiamei Xie <jiamei.xie@arm.com>
>> Change-Id: Ib80cee51eaf844661e6f92154a0339ad2a652f9b
> 
> I am sorry I forget to remove the Change-Id.

No worries. This can be dropped on commit (if no other changes are 
requested).

Cheers,

-- 
Julien Grall

