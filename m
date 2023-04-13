Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 68C956E157B
	for <lists+xen-devel@lfdr.de>; Thu, 13 Apr 2023 21:53:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.520926.809068 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pn30r-00069P-W6; Thu, 13 Apr 2023 19:53:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 520926.809068; Thu, 13 Apr 2023 19:53:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pn30r-00066V-TR; Thu, 13 Apr 2023 19:53:45 +0000
Received: by outflank-mailman (input) for mailman id 520926;
 Thu, 13 Apr 2023 19:53:44 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1pn30q-00066J-4M
 for xen-devel@lists.xenproject.org; Thu, 13 Apr 2023 19:53:44 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1pn30p-00043a-M0; Thu, 13 Apr 2023 19:53:43 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.1.102])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1pn30p-0003nc-FM; Thu, 13 Apr 2023 19:53:43 +0000
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
	bh=iMMxluHVcsuTLcFu23H9V+dhod04vKsQB3GqixWtHiY=; b=yf5wySg29qO11NYv26lmNzoDcI
	oLd7br1mPxMQeM3oO5kz9A1pFCCTlzG2Vf1+5dhNue9z+0EY7gIbkHvGlB7orr1Imu1Y0Ww7sdndX
	ueMYD91/zb/x9enHBjkSZVnyHtf+o3W4EaWudSYNbTitQ4CBDShtmZinIySBDKirGMZQ=;
Message-ID: <abb8f97e-02f3-774f-43e3-5fb1ccae806a@xen.org>
Date: Thu, 13 Apr 2023 20:53:41 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.9.0
Subject: Re: [PATCH v5 02/12] xen/arm: add SVE vector length field to the
 domain
To: Luca Fancellu <Luca.Fancellu@arm.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
 Bertrand Marquis <Bertrand.Marquis@arm.com>, Wei Chen <Wei.Chen@arm.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Wei Liu <wl@xen.org>
References: <20230412094938.2693890-1-luca.fancellu@arm.com>
 <20230412094938.2693890-3-luca.fancellu@arm.com>
 <72f38b2b-a391-fb7c-f8c0-cf3561470875@xen.org>
 <B3A82639-6D61-4DA2-B918-A92A421C75D3@arm.com>
 <e8075849-8bd5-7fd4-efaa-81e48c867635@xen.org>
 <4F5DC5EC-F538-42CE-A93F-2B5E3FAC13BB@arm.com>
 <92DA4B4F-7BB9-4CAC-9276-0B6A10550164@arm.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <92DA4B4F-7BB9-4CAC-9276-0B6A10550164@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Luca,

On 13/04/2023 17:10, Luca Fancellu wrote:
>>
>>
>>>
>>>>> Can we move this somewhere else to avoid adding extra padding? Also shouldn't this be protected with #ifdef CONFIG_ARM_64 to make clear this is not supported on Xen 32-bit?
>>>> Yes, I’ll move it and protect with CONFIG_ARM_64, is it ok for you if I move it after:
>>>> /* Monitor options */
>>>> struct {
>>>>     uint8_t privileged_call_enabled : 1;
>>>> } monitor;
>>>
>>> Please check the padding with "pahole". If possible, it would be better to re-use an existing one.
>>
>> Ok I’ll try to use the tool
> 
> I’ve managed to use the tool, the field seems already in a good spot:

ok. Thanks for checking.

Cheers,

-- 
Julien Grall

