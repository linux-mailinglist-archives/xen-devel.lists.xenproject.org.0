Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CB9D425E0F1
	for <lists+xen-devel@lfdr.de>; Fri,  4 Sep 2020 19:36:14 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kEFcy-0006BA-GM; Fri, 04 Sep 2020 17:35:56 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=pQwi=CN=xen.org=julien@srs-us1.protection.inumbo.net>)
 id 1kEFcx-0006B5-56
 for xen-devel@lists.xenproject.org; Fri, 04 Sep 2020 17:35:55 +0000
X-Inumbo-ID: 55b444e8-a037-4a09-ad0b-34df3e4e8fe4
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 55b444e8-a037-4a09-ad0b-34df3e4e8fe4;
 Fri, 04 Sep 2020 17:35:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject;
 bh=/bsvq4VEnpw2RlksXl3dcylAE88+TYGSqwV4LVf3ZLw=; b=uTmaJz5Y5RHdeuhmtxfNZsyAZz
 gIH3kqwii/VLeXwgFEEy2qj9pb2Vo8tcVFYmlVABE3GKUaipQP+KySSyvMHRja/joJHoK3G/OlsL4
 wK/jcqXRnIZyz7gsxDhnVJioarv1TwJH9oREiMGYTB9C/swxfHsIHNxMxKDzjNYxHP/o=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1kEFcw-0002gS-3x; Fri, 04 Sep 2020 17:35:54 +0000
Received: from 54-240-197-232.amazon.com ([54.240.197.232]
 helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1kEFcv-0003o7-TI; Fri, 04 Sep 2020 17:35:54 +0000
Subject: Re: [PATCH] EFI: Enable booting unified hypervisor/kernel/initrd
 images
To: Trammell Hudson <hudson@trmm.net>
Cc: Xen-devel <xen-devel@lists.xenproject.org>
References: <EGZ7EZE5F-c5YJVD9p0TtccTz06ZsdMcL21-BcB64dk9V3x8eKrB3dSDsLbGL4peCaENcp55uRsnWUONZYvrRaQh0tToALcaHRr-QMYNsH0=@trmm.net>
 <96966138-552f-c86a-2d14-85b2f7af50e6@xen.org>
 <kxO4Q0LRhrdqHcPTtg_JQYmf2jaNOF-nUvckzLF_IhHTicunRP3-_CWWMDw2Jg7_-RSg56X_4ULzsL5rU84eIjWV9apUH9sRnu2rVf-6_Mk=@trmm.net>
From: Julien Grall <julien@xen.org>
Message-ID: <c629d643-6275-4fc0-b36b-9da5b8ce88e9@xen.org>
Date: Fri, 4 Sep 2020 18:35:52 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
 Gecko/20100101 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <kxO4Q0LRhrdqHcPTtg_JQYmf2jaNOF-nUvckzLF_IhHTicunRP3-_CWWMDw2Jg7_-RSg56X_4ULzsL5rU84eIjWV9apUH9sRnu2rVf-6_Mk=@trmm.net>
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
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Hi Trammell,

On 04/09/2020 11:06, Trammell Hudson wrote:
> On Friday, September 4, 2020 5:29 AM, Julien Grall <julien@xen.org> wrote:
> 
>> On 28/08/2020 12:51, Trammell Hudson wrote:
>>
>>> -   /* PE32+ Subsystem type */
>>>      +#if defined(ARM)
>>>
>>
>> Shouldn't this be defined(aarch64) ?
> 
> To be honest I'm not sure and don't have a way to check if
> this code works on ARM.

The code looks generic enough. I will give a try to build it.

> Does an Xen EFI build on ARM even
> use the PE32+ format?

So far, we only support EFI and AArch64. This is built using PE32+ format.

Looking at the rest of the UEFI code, we are using CONFIG_ARM. But I 
think, in this particular instance, we want to use CONFIG_ARM_64.

Cheers,

-- 
Julien Grall

