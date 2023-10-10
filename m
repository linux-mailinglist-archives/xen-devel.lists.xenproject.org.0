Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C15E87BFF8F
	for <lists+xen-devel@lfdr.de>; Tue, 10 Oct 2023 16:48:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.615083.956263 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qqE1l-0001x9-No; Tue, 10 Oct 2023 14:48:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 615083.956263; Tue, 10 Oct 2023 14:48:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qqE1l-0001un-Kz; Tue, 10 Oct 2023 14:48:05 +0000
Received: by outflank-mailman (input) for mailman id 615083;
 Tue, 10 Oct 2023 14:48:04 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1qqE1k-0001tL-Qk
 for xen-devel@lists.xenproject.org; Tue, 10 Oct 2023 14:48:04 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qqE1k-0003m0-FK; Tue, 10 Oct 2023 14:48:04 +0000
Received: from 54-240-197-231.amazon.com ([54.240.197.231]
 helo=[10.95.104.160]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qqE1k-0007ns-98; Tue, 10 Oct 2023 14:48:04 +0000
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
	References:Cc:To:From:Subject:MIME-Version:Date:Message-ID;
	bh=RVmbal3jyL4QGGCUAZHhC5+aj9yI6a+eoQxd4HidfUQ=; b=Zbawy6HoSkam7/6YUhB/T7MtbE
	63HYpH4+8V3ZGvoydgFs3XBNoV2nyvkABK1NEWU4VWH/mdO2n/OaRN2DEjqfRFqp1p6M8YdpPuyBV
	hIqu9twtVO1N1B6r4SptesH2alZ4zqtr9QOnoZh/McUa0xT0RIcqFnCotlQlcPfWDCiE=;
Message-ID: <4894d46e-97ab-434f-b637-d516db6564ea@xen.org>
Date: Tue, 10 Oct 2023 15:48:02 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen/arm: Validate generic timer frequency
Content-Language: en-GB
From: Julien Grall <julien@xen.org>
To: Michal Orzel <michal.orzel@amd.com>, xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Henry Wang <Henry.Wang@arm.com>
References: <20230928123435.2802-1-michal.orzel@amd.com>
 <d406c4c6-07f7-442f-8bef-8ba42308ae93@xen.org>
In-Reply-To: <d406c4c6-07f7-442f-8bef-8ba42308ae93@xen.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

(+ Henry)

Hi Michal,

On 29/09/2023 08:38, Julien Grall wrote:
> Hi Michal,
> 
> On 28/09/2023 13:34, Michal Orzel wrote:
>> Generic timer dt node property "clock-frequency" (refer Linux dt binding
>> Documentation/devicetree/bindings/timer/arm,arch_timer.yaml) is used to
>> override the incorrect value set by firmware in CNTFRQ_EL0. If the value
>> of this property is 0 (i.e. by mistake), Xen would continue to work and
>> use the value from the sysreg instead. The logic is thus incorrect and
>> results in inconsistency when creating timer node for domUs:
>>   - libxl domUs: clock_frequency member of struct xen_arch_domainconfig
>>     is set to 0 and libxl ignores setting the "clock-frequency" property,
>>   - dom0less domUs: "clock-frequency" property is taken from dt_host and
>>     thus set to 0.
>>
>> Property "clock-frequency" is used to override the value from sysreg,
>> so if it is also invalid, there is nothing we can do and we shall panic
>> to let user know about incorrect setting. Going even further, we operate
>> under assumption that the frequency must be at least 1KHz (i.e. cpu_khz
>> not 0) in order for Xen to boot. Therefore, introduce a new helper
>> validate_timer_frequency() to verify this assumption and use it to check
>> the frequency obtained either from dt property or from sysreg.
>>
>> Signed-off-by: Michal Orzel <michal.orzel@amd.com>
> 
> Acked-by: Julien Grall <jgrall@amazon.com>

Going through the list of pending patches, I noticed Henry wasn't CCed. 
Is this patch intended for Xen 4.18? If so, can you provide some 
reasoning why would want it?

Cheers,

-- 
Julien Grall

