Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 37DBA2B9607
	for <lists+xen-devel@lfdr.de>; Thu, 19 Nov 2020 16:25:05 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.30960.61180 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kflns-0001X2-F1; Thu, 19 Nov 2020 15:24:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 30960.61180; Thu, 19 Nov 2020 15:24:56 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kflns-0001Wd-Bk; Thu, 19 Nov 2020 15:24:56 +0000
Received: by outflank-mailman (input) for mailman id 30960;
 Thu, 19 Nov 2020 15:24:54 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1kflnq-0001WS-R3
 for xen-devel@lists.xenproject.org; Thu, 19 Nov 2020 15:24:54 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1kflno-0006ca-Gz; Thu, 19 Nov 2020 15:24:52 +0000
Received: from [54.239.6.186] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1kflno-0005ws-8C; Thu, 19 Nov 2020 15:24:52 +0000
Received: from mail.xenproject.org ([104.130.215.37])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <julien@xen.org>)
	id 1kflnq-0001WS-R3
	for xen-devel@lists.xenproject.org; Thu, 19 Nov 2020 15:24:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
	MIME-Version:Date:Message-ID:From:References:Cc:To:Subject;
	bh=t84XUouGwlIH7LwczZmanbryowdld/KVoT3Q9H8MYOE=; b=6wcCjBgCD0p6kRW8ZGbbs1ZKmJ
	MqMuEgQGOb3otin9OY02Xmj+b/Y/OGq30KGv1FQbVAW+H9nR4CHh9h533BYA4CoF2nuOXPv1IULvO
	2e505t1X1wDoCLtGg6GJh/5Mv0lB6OAU/lzmVnOGhrP6hC8W1oGGkUHCxPu4VC3MeV58=;
Received: from xenbits.xenproject.org ([104.239.192.120])
	by mail.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <julien@xen.org>)
	id 1kflno-0006ca-Gz; Thu, 19 Nov 2020 15:24:52 +0000
Received: from [54.239.6.186] (helo=a483e7b01a66.ant.amazon.com)
	by xenbits.xenproject.org with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.92)
	(envelope-from <julien@xen.org>)
	id 1kflno-0005ws-8C; Thu, 19 Nov 2020 15:24:52 +0000
Subject: Re: [PATCH v3 1/2] xen/arm: gic: acpi: Use the correct length for the
 GICC structure
To: Bertrand Marquis <Bertrand.Marquis@arm.com>
Cc: "open list:X86" <xen-devel@lists.xenproject.org>,
 "alex.bennee@linaro.org" <alex.bennee@linaro.org>,
 Andre Przywara <Andre.Przywara@arm.com>, Rahul Singh <Rahul.Singh@arm.com>,
 Julien Grall <Julien.Grall@arm.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Julien Grall <jgrall@amazon.com>
References: <20201119121347.27139-1-julien@xen.org>
 <20201119121347.27139-2-julien@xen.org>
 <890D41B9-D3F3-498F-89E4-8BB997B45D6F@arm.com>
From: Julien Grall <julien@xen.org>
Message-ID: <1dfe3afc-55de-77ec-1f21-448c193909b4@xen.org>
Date: Thu, 19 Nov 2020 15:24:50 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.4.3
MIME-Version: 1.0
In-Reply-To: <890D41B9-D3F3-498F-89E4-8BB997B45D6F@arm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 8bit



On 19/11/2020 15:22, Bertrand Marquis wrote:
> Hi Julien,

Hi Bertrand,

> 
>> On 19 Nov 2020, at 12:13, Julien Grall <julien@xen.org> wrote:
>>
>> From: Julien Grall <julien.grall@arm.com>
>>
>> The length of the GICC structure in the MADT ACPI table differs between
>> version 5.1 and 6.0, although there are no other relevant differences.
>>
>> Use the BAD_MADT_GICC_ENTRY macro, which was specifically designed to
>> overcome this issue.
>>
> 
> The serie is braking the build on arm64 if ACPI is not activated:
> arch/arm/gic.c:456: undefined reference to `acpi_gbl_FADT’

:(. Sorry for that. I usually test with and without ACPI enabled but 
forgot to do for this series.

Cheers,

-- 
Julien Grall

