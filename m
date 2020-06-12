Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C9B1C1F7E0F
	for <lists+xen-devel@lfdr.de>; Fri, 12 Jun 2020 22:32:21 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jjqKv-00069c-Mq; Fri, 12 Jun 2020 20:31:37 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Kdnc=7Z=xen.org=julien@srs-us1.protection.inumbo.net>)
 id 1jjqKu-00069X-Mp
 for xen-devel@lists.xenproject.org; Fri, 12 Jun 2020 20:31:36 +0000
X-Inumbo-ID: b5f4b7d2-aceb-11ea-b611-12813bfff9fa
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id b5f4b7d2-aceb-11ea-b611-12813bfff9fa;
 Fri, 12 Jun 2020 20:31:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=e1TMIE54Q4kiscicTcg3pw4vezN+fiy5hFhuJp2uWD8=; b=wL2sirVTxrkfGr9uhdQXRoevnp
 14VY+18z3WkWVdzdCaOdB8UYG2S+QZ2FwJB5KVKtaSoiABPXWaXxUHPEQer+hCrP5BbotPLurb1vQ
 T/IhIRdSo4sedkfjVhJGVmDRBhXayCDKU358ppW5YlgPcXuIrq1T/YQqBc/jQqqRWsgc=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1jjqKp-000205-DD; Fri, 12 Jun 2020 20:31:31 +0000
Received: from [54.239.6.185] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1jjqKp-0001OC-5F; Fri, 12 Jun 2020 20:31:31 +0000
Subject: Re: [PATCH 1/2] xen/arm: Convert runstate address during hypcall
To: Bertrand Marquis <Bertrand.Marquis@arm.com>
References: <cover.1591806713.git.bertrand.marquis@arm.com>
 <8b450dddb2c855225c97741dce66453a80b9add2.1591806713.git.bertrand.marquis@arm.com>
 <974bf796-d410-9dd7-9e60-873987cd8434@xen.org>
 <71F7AE7B-BB12-4D3B-8337-3FA6040CA632@arm.com>
From: Julien Grall <julien@xen.org>
Message-ID: <2ea01884-a254-47c5-68a7-98ca77afc06b@xen.org>
Date: Fri, 12 Jun 2020 21:31:28 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
 Gecko/20100101 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <71F7AE7B-BB12-4D3B-8337-3FA6040CA632@arm.com>
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 xen-devel <xen-devel@lists.xenproject.org>, nd <nd@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>



On 12/06/2020 17:51, Bertrand Marquis wrote:

Hi,

>>> diff --git a/xen/include/asm-arm/domain.h b/xen/include/asm-arm/domain.h
>>> index 4e2f582006..3a7f53e13d 100644
>>> --- a/xen/include/asm-arm/domain.h
>>> +++ b/xen/include/asm-arm/domain.h
>>> @@ -11,6 +11,7 @@
>>>   #include <asm/vgic.h>
>>>   #include <asm/vpl011.h>
>>>   #include <public/hvm/params.h>
>>> +#include <public/vcpu.h>
>>
>> Why do you need to add this new include?
> 
> Sorry I forgot to answer to this one.
> This is needed to have the definition of vcpu_register_runstate_memory_area.

I might be missing something because nothing you have added this header 
seem to require vcpu_register_runstate_memory_area. So should the 
include be done in a different header?

Cheers,

-- 
Julien Grall

