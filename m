Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C9424747895
	for <lists+xen-devel@lfdr.de>; Tue,  4 Jul 2023 21:14:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.558648.872957 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qGlTL-0007od-R6; Tue, 04 Jul 2023 19:13:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 558648.872957; Tue, 04 Jul 2023 19:13:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qGlTL-0007mv-Mp; Tue, 04 Jul 2023 19:13:59 +0000
Received: by outflank-mailman (input) for mailman id 558648;
 Tue, 04 Jul 2023 19:13:58 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1qGlTK-0007mn-QE
 for xen-devel@lists.xenproject.org; Tue, 04 Jul 2023 19:13:58 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qGlTK-0000I5-H8; Tue, 04 Jul 2023 19:13:58 +0000
Received: from 54-240-197-234.amazon.com ([54.240.197.234] helo=[192.168.9.70])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qGlTK-0001cz-BK; Tue, 04 Jul 2023 19:13:58 +0000
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
	bh=Xs1smoJMXuCWOquXZvNmoX+dE513cj31vy6ax5mM30Y=; b=uipi49CC6h2LZaF8Oi329z9Qjc
	HvSArffSWP/iDoKY7tOt+9roxomOq3X6D5vC75On/FPGgp7bW9pSPdxs9f+MrGUtLleNstY4vDpqa
	RC9Gc8eOpBlcvwbg6KT4hu378SOXcSoWNw9e9VnuGZi/UoGtySWA/m3UVZThEq30glIo=;
Message-ID: <54ab8fa3-423c-0947-8b52-480db28afbf6@xen.org>
Date: Tue, 4 Jul 2023 20:13:56 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.12.0
Subject: Re: [PATCH] xen/arm: vgic: Add missing 'U' in VGIC_ICFG_MASK for
 shifted constant
Content-Language: en-US
To: Stefano Stabellini <sstabellini@kernel.org>,
 Henry Wang <Henry.Wang@arm.com>
Cc: xen-devel@lists.xenproject.org,
 Bertrand Marquis <bertrand.marquis@arm.com>, Wei Chen <wei.chen@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20230629221800.1478182-1-Henry.Wang@arm.com>
 <alpine.DEB.2.22.394.2306291603010.3936094@ubuntu-linux-20-04-desktop>
From: Julien Grall <julien@xen.org>
In-Reply-To: <alpine.DEB.2.22.394.2306291603010.3936094@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 30/06/2023 00:03, Stefano Stabellini wrote:
> On Fri, 30 Jun 2023, Henry Wang wrote:
>> With UBSAN on some arm64 platforms, e.g. FVP_Base_RevC-2xAEMvA, the
>> following splat will be printed while Dom0 is booting:
>> ```
>> (XEN) ==================================================================
>> (XEN) UBSAN: Undefined behaviour in arch/arm/vgic.c:372:15
>> (XEN) left shift of 1 by 31 places cannot be represented in type 'int'
>> (XEN) Xen WARN at common/ubsan/ubsan.c:172
>> (XEN) ----[ Xen-4.18-unstable  arm64  debug=y ubsan=y  Not tainted ]----
>> ```
>>
>> This is because there is a device node in the device tree with 0xf
>> as the interrupts property. Example of the device tree node is shown
>> below:
>> ```
>> ethernet@202000000 {
>>      compatible = "smsc,lan91c111";
>>      reg = <0x2 0x2000000 0x10000>;
>>      interrupts = <0xf>;
>> };
>> ```
>> and this value is passed to vgic_get_virq_type() as "index" then "intr"
>> in VGIC_ICFG_MASK.
>>
>> Add the missing 'U' in VGIC_ICFG_MASK as a fix, and this should also
>> addressing MISRA Rule 7.2:
>>
>>      A "u" or "U" suffix shall be applied to all integer constants that
>>      are represented in an unsigned type
>>
>> Signed-off-by: Henry Wang <Henry.Wang@arm.com>
> 
> Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>

It is now committed.

Cheers,

-- 
Julien Grall

