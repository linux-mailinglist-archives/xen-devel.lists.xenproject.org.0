Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E7E552C8249
	for <lists+xen-devel@lfdr.de>; Mon, 30 Nov 2020 11:36:17 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.40865.73879 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kjgXT-0001rb-8o; Mon, 30 Nov 2020 10:36:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 40865.73879; Mon, 30 Nov 2020 10:36:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kjgXT-0001rD-4r; Mon, 30 Nov 2020 10:36:11 +0000
Received: by outflank-mailman (input) for mailman id 40865;
 Mon, 30 Nov 2020 10:36:09 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Tpvk=FE=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1kjgXR-0001qk-81
 for xen-devel@lists.xenproject.org; Mon, 30 Nov 2020 10:36:09 +0000
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 8c33855f-a6d8-433f-8c86-0789e278baae;
 Mon, 30 Nov 2020 10:36:08 +0000 (UTC)
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
X-Inumbo-ID: 8c33855f-a6d8-433f-8c86-0789e278baae
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1606732568;
  h=subject:to:cc:references:from:message-id:date:
   mime-version:in-reply-to:content-transfer-encoding;
  bh=xYuuqM4xf95GM/STRHtKgAhRRJqwGwniaSpMW1mPr+c=;
  b=I5eYtfomRssSz/S7+0cukW0nfwG8N7JPCX/87WGflksLxydKe9alJ3tG
   wfSHxXu8p2XMz/QO9H2tUdeqim6SvSKwHuEK00P7W1UEmHlAcIfpB1J/C
   FNWM6lIY0TPxkYTtqBUSbITK7bhMe1M390ZRaJL7LkM4ziE8uNAS8gasW
   c=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: dhz8Jn0D8gv4lolQ1ZeDeZxVzM9XxeJsU54cEe7YQ+XHeH/5cAD2g1f/JAVphwAeJWNwt6ELwN
 dFWdAmnLDK7wf+j/QMKTQWxiFx76WTYJsn9mTIYrVJ7KLfVl8EiLHpPjUR4Lu0Kj+REDydlX54
 K1gpWF0RCcrjPFXGB2lrB4zLiWxNwxJ9MbYeh7Uy90rGIUihN/gQldgDOBkyTa4e+7FA5JfjfO
 ksjtRlAgJ+aAKkR7Sme3UQXVHu18kjLvABlxT7pXuaTIH4WXlVbVJH713rk111+VitqN9Xn/5o
 El8=
X-SBRS: None
X-MesageID: 32488046
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.78,381,1599537600"; 
   d="scan'208";a="32488046"
Subject: Re: [PATCH 0/7] xen/arm: Emulate ID registers
To: Bertrand Marquis <Bertrand.Marquis@arm.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>
References: <cover.1606151462.git.bertrand.marquis@arm.com>
 <45b8aac3-75a6-670f-d6f2-b427c497ee2d@citrix.com>
 <1BAAADF6-9E29-4BE5-857D-A8B51EB80712@arm.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <e119d6ff-dc61-0fd7-6da5-3e4e1b51839c@citrix.com>
Date: Mon, 30 Nov 2020 10:36:00 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <1BAAADF6-9E29-4BE5-857D-A8B51EB80712@arm.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 FTLPEX02CL04.citrite.net (10.13.108.177)

On 30/11/2020 10:20, Bertrand Marquis wrote:
> Hi Andrew,
>
>> On 27 Nov 2020, at 20:07, Andrew Cooper <andrew.cooper3@citrix.com> wrote:
>>
>> On 26/11/2020 15:51, Bertrand Marquis wrote:
>>> The goal of this serie is to emulate coprocessor ID registers so that
>>> Xen only publish to guest features that are supported by Xen and can
>>> actually be used by guests.
>>> One practical example where this is required are SVE support which is
>>> forbidden by Xen as it is not supported, but if Linux is compiled with
>>> it, it will crash on boot. An other one is AMU which is also forbidden
>>> by Xen but one Linux compiled with it would crash if the platform
>>> supports it.
>>>
>>> To be able to emulate the coprocessor registers defining what features
>>> are supported by the hardware, the TID3 bit of HCR must be disabled and
>>> Xen must emulated the values of those registers when an exception is
>>> catched when a guest is accessing it.
>>>
>>> This serie is first creating a guest cpuinfo structure which will
>>> contain the values that we want to publish to the guests and then
>>> provides the proper emulationg for those registers when Xen is getting
>>> an exception due to an access to any of those registers.
>>>
>>> This is a first simple implementation to solve the problem and the way
>>> to define the values that we provide to guests and which features are
>>> disabled will be in a future patchset enhance so that we could decide
>>> per guest what can be used or not and depending on this deduce the bits
>>> to activate in HCR and the values that we must publish on ID registers.
>>>
>>> Bertrand Marquis (7):
>>>  xen/arm: Add ID registers and complete cpufinfo
>>>  xen/arm: Add arm64 ID registers definitions
>>>  xen/arm: create a cpuinfo structure for guest
>>>  xen/arm: Add handler for ID registers on arm64
>>>  xen/arm: Add handler for cp15 ID registers
>>>  xen/arm: Add CP10 exception support to handle VMFR
>>>  xen/arm: Activate TID3 in HCR_EL2
>> CI found an ARM randconfig failure against this series.
>>
>> https://gitlab.com/xen-project/patchew/xen/-/pipelines/221798884
>>
>> I have admit that I can't spot an obvious connection so it might be
>> collateral damage from elsewhere, but does need looking at irrespective.
> This absolutely right, there is a bug in my code and i will send a V2 to fix it.
>
> Very nice finding, i am wondering why my tests did not point this out.

Its randconfig, so every time the test runs, it picks a new random
Kconfig configuration.

Sadly, it is non-deterministic, and not necessarily the fault of change
the test ran against.  We're probably going to have to tweak how we run
these tests before the CI goes too much further.

~Andrew

