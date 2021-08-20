Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BB5523F2B2A
	for <lists+xen-devel@lfdr.de>; Fri, 20 Aug 2021 13:24:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.169437.309517 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mH2dT-00010O-RG; Fri, 20 Aug 2021 11:24:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 169437.309517; Fri, 20 Aug 2021 11:24:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mH2dT-0000yD-Nv; Fri, 20 Aug 2021 11:24:31 +0000
Received: by outflank-mailman (input) for mailman id 169437;
 Fri, 20 Aug 2021 11:24:30 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1mH2dR-0000y3-V4
 for xen-devel@lists.xenproject.org; Fri, 20 Aug 2021 11:24:29 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1mH2dR-0000Zg-QG; Fri, 20 Aug 2021 11:24:29 +0000
Received: from [54.239.6.178] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1mH2dR-0006o0-KE; Fri, 20 Aug 2021 11:24:29 +0000
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
	MIME-Version:Date:Message-ID:From:References:Cc:To:Subject;
	bh=ll30wo+4e6oD6mjhRlwn499a0z9259KKTu5M4AJtpqw=; b=MOgD+EO+Ny57urievkEmFBaJkS
	mVaHgdKn+vJJux1nS3pD3aGkLq0h6P15ppB1PtxcWUnJygEBskzGExUDnPrdnNac6JLf9ga46XdMN
	7wmZvxHQt8oMrS8tJgaOvsU9MGBDwAB+/ZTdX5qXwUTatU/qDpWCbPIOMdrG288mTYAM=;
Subject: Re: [XEN RFC PATCH 07/40] xen/arm: use !CONFIG_NUMA to keep fake NUMA
 API
To: Wei Chen <Wei.Chen@arm.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 "sstabellini@kernel.org" <sstabellini@kernel.org>
Cc: Bertrand Marquis <Bertrand.Marquis@arm.com>
References: <20210811102423.28908-1-wei.chen@arm.com>
 <20210811102423.28908-8-wei.chen@arm.com>
 <e9a45fe3-e4b0-6533-8b41-ac3f10ef386a@xen.org>
 <DB9PR08MB6857D0004A59BC90866AE4C89EC19@DB9PR08MB6857.eurprd08.prod.outlook.com>
 <4de5b7ed-ada5-2114-2002-7f5e26a89417@xen.org>
 <DB9PR08MB6857B5CEDA012C10B192F3F19EC19@DB9PR08MB6857.eurprd08.prod.outlook.com>
From: Julien Grall <julien@xen.org>
Message-ID: <54707c92-3bda-60b8-4b36-1eae172cacb1@xen.org>
Date: Fri, 20 Aug 2021 12:24:28 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <DB9PR08MB6857B5CEDA012C10B192F3F19EC19@DB9PR08MB6857.eurprd08.prod.outlook.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 8bit



On 20/08/2021 11:24, Wei Chen wrote:
> Hi Julien,

Hi Wei,

> 
>> -----Original Message-----
>> From: Julien Grall <julien@xen.org>
>> Sent: 2021年8月20日 16:24
>> To: Wei Chen <Wei.Chen@arm.com>; xen-devel@lists.xenproject.org;
>> sstabellini@kernel.org; jbeulich@suse.com
>> Cc: Bertrand Marquis <Bertrand.Marquis@arm.com>
>> Subject: Re: [XEN RFC PATCH 07/40] xen/arm: use !CONFIG_NUMA to keep fake
>> NUMA API
>>
>>
>>
>> On 20/08/2021 03:08, Wei Chen wrote:
>>> Hi Julien,
>>
>> Hi Wei,
>>
>>>
>>>> -----Original Message-----
>>>> From: Julien Grall <julien@xen.org>
>>>> Sent: 2021年8月19日 21:34
>>>> To: Wei Chen <Wei.Chen@arm.com>; xen-devel@lists.xenproject.org;
>>>> sstabellini@kernel.org; jbeulich@suse.com
>>>> Cc: Bertrand Marquis <Bertrand.Marquis@arm.com>
>>>> Subject: Re: [XEN RFC PATCH 07/40] xen/arm: use !CONFIG_NUMA to keep
>> fake
>>>> NUMA API
>>>>
>>>> Hi Wei,
>>>>
>>>> On 11/08/2021 11:23, Wei Chen wrote:
>>>>> Only Arm64 supports NUMA, the CONFIG_NUMA could not be
>>>>> enabled for Arm32.
>>>>
>>>> What do you mean by "could not be enabled"?
>>>
>>> I have not seen any Arm32 hardware support NUMA, so I think
>>> we don't need to support Arm32 NUMA.
>>
>> I understand that there may not be 32-bit platform with NUMA. And that's
>> fine stating that in the commit message. However...
>>
>>> In this case, this Kconfig
>>> option could not be enabled on Arm32.
>>
>> ... you continue to say "couldn't be enabled" without clarifying whether
>> this mean that the build will break or this was just not tested because
>> you don't have any platform.
> 
> Ok, I understand your concern. Yes, my words would lead to mis-understanding.
> If we make CONFIG_NUMA enabled in Arm32, it need Arm32 to implement some
> code to support NUMA common code. Otherwise the Arm32 build will failed.

When I skimmed through the series, most of the code seems to be either 
in common, arm (bitness neutral). So I am not quite too sure why it 
would not build. Do you have more details?

> I have not tried to implement those code for Arm32. And I found there is
> no Arm32 machine support NUMA, so I wanted Arm32 to use fake NUMA API
> as before.
> 
>>
>> To put it differently, the code for NUMA looks bitness neutral. So I
>> cannot really what what prevent us to potentially use it on Arm 32-bit.
>>
> 
> Yes, you're right, it's neutral. But do we really need to add code to an
> ARCH that it may never use?

Technically you already added the code because arch/arm/ is common 
between arm32 and arm64. My only ask is to not make the new config 
depends on arm64. If you only build test it that fine because...

And how can we test this code?

I don't expect any of the code to be an issue on arm32 as the code 
should mostly be arch neutral.

Cheers,

-- 
Julien Grall

