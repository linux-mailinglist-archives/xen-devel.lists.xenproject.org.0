Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B3736C8DCD
	for <lists+xen-devel@lfdr.de>; Sat, 25 Mar 2023 13:05:34 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.514602.796979 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pg2dE-0006MZ-Ci; Sat, 25 Mar 2023 12:04:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 514602.796979; Sat, 25 Mar 2023 12:04:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pg2dE-0006JM-98; Sat, 25 Mar 2023 12:04:24 +0000
Received: by outflank-mailman (input) for mailman id 514602;
 Sat, 25 Mar 2023 12:04:22 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1pg2dC-0006JG-En
 for xen-devel@lists.xenproject.org; Sat, 25 Mar 2023 12:04:22 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1pg2dC-000197-6x; Sat, 25 Mar 2023 12:04:22 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.1.102])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1pg2dC-0005E5-1Z; Sat, 25 Mar 2023 12:04:22 +0000
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
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:Subject:
	From:References:Cc:To:MIME-Version:Date:Message-ID;
	bh=kXK8sCJIOq238awB5+0R30S3PMyVdWcvMgyiP6HErzI=; b=LN8AH+wQzIMyGQd6DSGfGtd7hJ
	VtZ5wvmKHTaqr583UZDZo/8zIEXADA9O5QJOgiKg7p4UQXE46wt5CHTf+bhJjh0p/3mTSQw3zPfd2
	s8oe+4TOpRxS+kO13TL6Mh4OWYu2WZagGvFgM9mTM5XX8QCspdsqSIORO5zdEldkkJAE=;
Message-ID: <fd9453c5-e60e-c63a-3bf3-f19a4fe30501@xen.org>
Date: Sat, 25 Mar 2023 12:04:20 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.9.0
To: Bertrand Marquis <Bertrand.Marquis@arm.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
 Luca Fancellu <Luca.Fancellu@arm.com>,
 "michal.orzel@amd.com" <michal.orzel@amd.com>,
 Julien Grall <jgrall@amazon.com>
References: <20230302145916.44035-1-julien@xen.org>
 <20230302145916.44035-4-julien@xen.org>
 <8BCE9C06-D081-4627-8057-1FF3D59390C6@arm.com>
From: Julien Grall <julien@xen.org>
Subject: Re: [PATCH v6 3/5] xen/arm64: mm: Introduce helpers to
 prepare/enable/disable the identity mapping
In-Reply-To: <8BCE9C06-D081-4627-8057-1FF3D59390C6@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Bertrand,

On 03/03/2023 10:35, Bertrand Marquis wrote:
> Hi Julien,
> 
>> On 2 Mar 2023, at 15:59, Julien Grall <julien@xen.org> wrote:
>>
>> From: Julien Grall <jgrall@amazon.com>
>>
>> In follow-up patches we will need to have part of Xen identity mapped in
>> order to safely switch the TTBR.
>>
>> On some platform, the identity mapping may have to start at 0. If we always
>> keep the identity region mapped, NULL pointer dereference would lead to
>> access to valid mapping.
>>
>> It would be possible to relocate Xen to avoid clashing with address 0.
>> However the identity mapping is only meant to be used in very limited
>> places. Therefore it would be better to keep the identity region invalid
>> for most of the time.
>>
>> Two new external helpers are introduced:
>>     - arch_setup_page_tables() will setup the page-tables so it is
>>       easy to create the mapping afterwards.
>>     - update_identity_mapping() will create/remove the identity mapping
>>
>> Signed-off-by: Julien Grall <jgrall@amazon.com>
> 
> In Arm internal CI this patch (or maybe an other in the serie) made one
> of our test crash on qemu-arm64.

Thanks for the report. I managed  to reproduce it by tweaking the QEMU 
command line option I was using:

42sh> qemu/build/qemu-system-aarch64 -machine virt,gic-version=3 
-machine virtualization=true -cpu cortex-a57 -smp 4 -m 2048 -serial 
mon:stdio -serial null -nographic -kernel xen/xen/xen

The problem is in patch #2 because I didn't adjust the address of the 
vmap/frametable areas. So they effectively are still right in the middle 
of the reserved region for identity mapping.

I will update patch #2. I am also thinking to add a check in 
xen_pt_update() to ensure no-one can create a non 1:1 mapping in the 
reserved area for identity mapping.

Cheers,

-- 
Julien Grall

