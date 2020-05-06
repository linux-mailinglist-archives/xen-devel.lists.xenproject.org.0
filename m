Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AB1B41C6DA1
	for <lists+xen-devel@lfdr.de>; Wed,  6 May 2020 11:51:54 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jWGiN-0001EO-38; Wed, 06 May 2020 09:51:43 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=C64T=6U=xen.org=julien@srs-us1.protection.inumbo.net>)
 id 1jWGiK-0001EJ-TY
 for xen-devel@lists.xenproject.org; Wed, 06 May 2020 09:51:40 +0000
X-Inumbo-ID: 2f2b09ec-8f7f-11ea-ae69-bc764e2007e4
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 2f2b09ec-8f7f-11ea-ae69-bc764e2007e4;
 Wed, 06 May 2020 09:51:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=J6qrzWUYkk4A0UVI37gtnTDXBKm8T2IKX9n7JBeYnYU=; b=f8DISzF0GgL1R1L0Otj/Tnudpj
 DgyVf9dQOM4O2N91YDUDZNqLAXlhM/QLD+XUYl5ma4XHzfoyx2Fz4mM7Y4tfpyXalWGHhar0ngQH1
 m/QEQyQ0RINTgbOrEjd4ohTlCErEc/kV0kjfu0lJ0ec++7DpKKKw2dystVybYQJES/sk=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1jWGiJ-00015u-UO; Wed, 06 May 2020 09:51:39 +0000
Received: from [54.239.6.186] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.89)
 (envelope-from <julien@xen.org>)
 id 1jWGiJ-0000nR-OE; Wed, 06 May 2020 09:51:39 +0000
Subject: Re: [PATCH 1/2] xen/Kconfig: define EXPERT a bool rather than a string
To: Jan Beulich <jbeulich@suse.com>
References: <20200430124343.29886-1-julien@xen.org>
 <20200430124343.29886-2-julien@xen.org>
 <d069d81b-24bf-1aac-3009-63e90a45af4b@suse.com>
From: Julien Grall <julien@xen.org>
Message-ID: <4a0e868f-ce85-db62-ae22-1bde2aa11be2@xen.org>
Date: Wed, 6 May 2020 10:51:38 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:68.0)
 Gecko/20100101 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <d069d81b-24bf-1aac-3009-63e90a45af4b@suse.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: xen-devel@lists.xenproject.org, Julien Grall <jgrall@amazon.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Hi Jan,

On 30/04/2020 15:32, Jan Beulich wrote:
> On 30.04.2020 14:43, Julien Grall wrote:
>> From: Julien Grall <jgrall@amazon.com>
>>
>> Since commit f80fe2b34f08 "xen: Update Kconfig to Linux v5.4" EXPERT
>> can only have two values (enabled or disabled). So switch from a string
>> to a bool.
>>
>> Take the opportunity to replace all "EXPERT = y" to "EXPERT".
>>
>> Signed-off-by: Julien Grall <jgrall@amazon.com>
> 
> Acked-by: Jan Beulich <jbeulich@suse.com>
> with a remark:
> 
>> --- a/xen/arch/arm/Kconfig
>> +++ b/xen/arch/arm/Kconfig
>> @@ -33,7 +33,7 @@ source "arch/Kconfig"
>>   
>>   config ACPI
>>   	bool
>> -	prompt "ACPI (Advanced Configuration and Power Interface) Support" if EXPERT = "y"
>> +	prompt "ACPI (Advanced Configuration and Power Interface) Support" if EXPERT
>>   	depends on ARM_64
>>   	---help---
>>   
>> @@ -51,7 +51,7 @@ config GICV3
>>   
>>   config HAS_ITS
>>           bool
>> -        prompt "GICv3 ITS MSI controller support" if EXPERT = "y"
>> +        prompt "GICv3 ITS MSI controller support" if EXPERT
>>           depends on GICV3 && !NEW_VGIC
> 
> Could I talk you info switching ones like the above (looks like
> there aren't further ones) to ...
> 
>> @@ -81,7 +81,7 @@ config SBSA_VUART_CONSOLE
>>   	  SBSA Generic UART implements a subset of ARM PL011 UART.
>>   
>>   config ARM_SSBD
>> -	bool "Speculative Store Bypass Disable" if EXPERT = "y"
>> +	bool "Speculative Store Bypass Disable" if EXPERT
> 
> ... this more compact form on this occasion?

I will do the switch on commit if there are no more comment.

Cheers,

-- 
Julien Grall

