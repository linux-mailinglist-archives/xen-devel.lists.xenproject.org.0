Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AD174B3EC0E
	for <lists+xen-devel@lfdr.de>; Mon,  1 Sep 2025 18:16:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1105200.1456152 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ut7D4-0007A7-3H; Mon, 01 Sep 2025 16:16:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1105200.1456152; Mon, 01 Sep 2025 16:16:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ut7D4-00077k-0A; Mon, 01 Sep 2025 16:16:46 +0000
Received: by outflank-mailman (input) for mailman id 1105200;
 Mon, 01 Sep 2025 16:16:44 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1ut7D2-00077e-Hj
 for xen-devel@lists.xenproject.org; Mon, 01 Sep 2025 16:16:44 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1ut7D1-001F0a-03;
 Mon, 01 Sep 2025 16:16:43 +0000
Received: from [2a02:8012:3a1:0:e5e9:9db0:73a2:cd65]
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1ut7D1-00C2vz-07;
 Mon, 01 Sep 2025 16:16:43 +0000
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
	bh=784FlA7NSyJ0bdLjMwAPjShNutqQit3xLCgXDKwaExw=; b=urKYFlyBzPHuGTejPkUH1g2CTH
	Yjq9aaeVh69fwqGQsq/YTrv39CuGh4pCLIXcvO75YfLdSuyDJFf08RtUsOXzLhj3kzeriLr4tLJXE
	Y0pP8npmY/UUziqsYjmnUvf0N27Sl+sjRk/py5h3R6F3KVI9v6Xt+ZmydWmAzYHU8Jck=;
Message-ID: <14f057e5-eb1e-4d10-87f9-98619fc30eb1@xen.org>
Date: Mon, 1 Sep 2025 17:16:38 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 04/12] xen/arm/irq: add handling for IRQs in the eSPI
 range
Content-Language: en-GB
To: Leonid Komarianskyi <Leonid_Komarianskyi@epam.com>,
 Oleksandr Tyshchenko <olekstysh@gmail.com>
Cc: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>
References: <cover.1756481577.git.leonid_komarianskyi@epam.com>
 <e0f76a1533332cef68bfaacbdf57fd05f27764a6.1756481577.git.leonid_komarianskyi@epam.com>
 <87tt1pykqz.fsf@epam.com> <c21ff32a-fc9d-4980-8d26-a3d6c1f2548c@gmail.com>
 <399bdb41-7938-4ed3-887a-c9bf6e0636ec@epam.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <399bdb41-7938-4ed3-887a-c9bf6e0636ec@epam.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi,

On 01/09/2025 15:42, Leonid Komarianskyi wrote:
>>> Taking into account that with CONFIG_GICV3_ESPI=n we should never have
>>> "irq" in eSPI range, do you really need this #ifdef? I think that
>>> ASSERT_UNREACHABLE in espi_to_desc() is sufficient guard.
>>>
>>> Also, IRQ line number belongs to eSPI range regardless of
>>> CONFIG_GICV3_ESPI,
>>> value, so in my opinion is_espi() should always return correct value for
>>> a given "irq".
>>
>>    ... I agree with Volodymyr's suggestion for is_espi() to always return
>> correct value for a given "irq".
>>
>>
> 
> I will fix that in V6.

I am not sure about this. If is_espi() is not returning false with 
CONFIG_GICV3_EPSI, then the compiler would not be able to optimize code 
like:

if (is_espi(...)) {
    return espi_to_desc(irq);
}

return &irq_desc[irq-NR_LOCAL_IRQS];

irq_to_desc() is called fairly often, so I would like to keep the code 
fairly optimized. An alternative would be to use #ifdef CONFIG_*. I 
don't like it, but it could be a compromise if Oleksandr and Volodymyr 
wants to push to remove #ifdef from CONFIG_IS_ESPI.

Cheers,

-- 
Julien Grall


