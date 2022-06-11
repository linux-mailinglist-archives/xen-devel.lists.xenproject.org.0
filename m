Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 922CE54730C
	for <lists+xen-devel@lfdr.de>; Sat, 11 Jun 2022 11:09:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.347083.573188 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nzx6c-00038v-Di; Sat, 11 Jun 2022 09:08:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 347083.573188; Sat, 11 Jun 2022 09:08:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nzx6c-00035V-AO; Sat, 11 Jun 2022 09:08:30 +0000
Received: by outflank-mailman (input) for mailman id 347083;
 Sat, 11 Jun 2022 09:08:28 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1nzx6a-00035P-1G
 for xen-devel@lists.xenproject.org; Sat, 11 Jun 2022 09:08:28 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nzx6Z-0004vu-5f; Sat, 11 Jun 2022 09:08:27 +0000
Received: from home.octic.net ([81.187.162.82] helo=[10.0.1.102])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nzx6Y-00081I-Vg; Sat, 11 Jun 2022 09:08:27 +0000
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
	bh=EIq7MleFNgmsiSmj4MQas0eeu0D7BwA55LmsAQ6iBDs=; b=0i7l1/T9Drn3cNolEt9yi2Fpwc
	cEiLFcJciS8hmch59bf5fOcvHWe2VxPQr4iU5W7Wut4AOAWfmj4xnhsD1QCORcbCUs/oq8DlPW11q
	zQ9AOl1ggEodtu2NXLVCdaSjOIWSfv52dF2AroFTkfdHXlRp21wa4OuqvfuUoV14w+Wg=;
Message-ID: <f664f35b-2fec-38e4-3382-1fd14ba66e8d@xen.org>
Date: Sat, 11 Jun 2022 10:08:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.9.1
Subject: Re: [PATCH v2 2/2] xen/arm: add FF-A mediator
To: Stefano Stabellini <sstabellini@kernel.org>,
 Jens Wiklander <jens.wiklander@linaro.org>
Cc: xen-devel@lists.xenproject.org,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Bertrand.Marquis@arm.com
References: <20220609061812.422130-1-jens.wiklander@linaro.org>
 <20220609061812.422130-3-jens.wiklander@linaro.org>
 <alpine.DEB.2.22.394.2206101758030.756493@ubuntu-linux-20-04-desktop>
From: Julien Grall <julien@xen.org>
In-Reply-To: <alpine.DEB.2.22.394.2206101758030.756493@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 11/06/2022 02:23, Stefano Stabellini wrote:
>> +static uint32_t ffa_rxtx_map(register_t tx_addr, register_t rx_addr,
>> +                             uint32_t page_count)
>> +{
>> +    const struct arm_smccc_1_2_regs arg = {
>> +#ifdef CONFIG_ARM_64
>> +        .a0 = FFA_RXTX_MAP_64,
>> +#endif
> 
> This ifdef is unnecessary given that FFA depends on ARM64 and SMCCCv1.2
> is only implemented on ARM64. It also applies to all the other ifdefs in
> this file. You can remove the code under #ifdef CONFIG_ARM_32.

To me the #ifdef indicates that it would be possible to use FFA on 
arm32. So I think it is better to keep them rather than having to 
retrofitting them in the future.

Cheers,

-- 
Julien Grall

