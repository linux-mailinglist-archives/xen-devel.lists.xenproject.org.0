Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B1195B26FC6
	for <lists+xen-devel@lfdr.de>; Thu, 14 Aug 2025 21:37:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1082434.1442283 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1umdlB-0008FG-5E; Thu, 14 Aug 2025 19:37:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1082434.1442283; Thu, 14 Aug 2025 19:37:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1umdlB-0008D0-2M; Thu, 14 Aug 2025 19:37:13 +0000
Received: by outflank-mailman (input) for mailman id 1082434;
 Thu, 14 Aug 2025 19:37:11 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=QQqN=22=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1umdl9-0008Cs-7S
 for xen-devel@lists.xenproject.org; Thu, 14 Aug 2025 19:37:11 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 10a5f390-7946-11f0-b898-0df219b8e170;
 Thu, 14 Aug 2025 21:37:08 +0200 (CEST)
Received: from support.bugseng.com (support.bugseng.com [162.55.131.47])
 (Authenticated sender: nicola)
 by support.bugseng.com (Postfix) with ESMTPA id 205144EE3C04;
 Thu, 14 Aug 2025 21:37:07 +0200 (CEST)
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
X-Inumbo-ID: 10a5f390-7946-11f0-b898-0df219b8e170
Authentication-Results: bugseng.com; arc=none smtp.remote-ip=162.55.131.47
ARC-Seal: i=1; d=bugseng.com; s=openarc; a=rsa-sha256; cv=none; t=1755200227;
	b=VoehlsPTRNB/8vXLEW1Voa6kyf1wqS463teExrvejTltdPPrQ+L4Mdhar7uD5o+outlL
	 BTKEz4++reDQqiLyaI3ohvwEw6JJZPjPYETya6hFEhW/vWPNNQVzn18u1jSg6OaNxb52P
	 +LbJ2E1h+nOKj0QpW3Q1Uzq4aernLxG3+BvUgSAfX6WdWVyWIVnfuNRyePWzmc2p4XbYH
	 MZvSKN8YealOlmLjLH4X+UyPkLeY7xGP63VcfgtUgbe/dNhNLdHkZnWvN18Cd4j01dLis
	 Iw5IwJqK+0XPYRKe1TRPrO+YugEsm3JiLEHREMxTLpkxStxMPeo20vtkupK863aYtle52
	 s00lS5zQ80OY2z7ecmQO2bI/Z6i7JGEMkCH87H5s7TTIG0m0r/0H0Kt6p4SOEa2D4kB/s
	 K4hxDXwti3rje4NRXly4lYGzoOzq8VewZ4lQFN2NalnF7Eed/MIyVG2IqQI36HcqbcEwe
	 +/5heTQRAdSC+1TrtrbpiVqalcl2WiBTnBM4A6eswumIxrowSGwoqbTgS1lT2ghmQCVJc
	 zp62d9/zRQljpJZb+u4PuSZraP5FcWuBpFNklrTgYzetBUjxNrePgZ4ZxcFzZzE/UMFcK
	 IzGsMf8il0Tdpz+/b90sQoLGpb91OKdfUo413SGWCxngJCSiOpOuIhVFCHay+7E=
ARC-Message-Signature: i=1; d=bugseng.com; s=openarc; a=rsa-sha256;
	c=relaxed/relaxed; t=1755200227;
	h=DKIM-Signature:MIME-Version:Date:From:To:Cc:Subject:In-Reply-To:
	 References:Message-ID:X-Sender:Organization:Content-Type:
	 Content-Transfer-Encoding;
	bh=ph7jdZQ9NX/u8qetWLQ4Vkglvn/rONeb5m5p/5MafIo=;
	b=ibHsmJhqBIpZ28PUIqHVvCsky1kr9cmruwYB7TPA9Sdx7wOwhbHWdJEhieyTByeoRXBz
	 +QR5lreIf6WskOp7H/y7g5fD21t8/kUud5BCMVTXZ4Y6X1r/Y8zC8mi7qm4OS/NySHPte
	 Tb+0lVA4iWKTa6vhacrN4v3QkjvTY3CqyPrGNuHlyRtsJxAamRMIAnqx/NWntaTXiLWIi
	 hZK8I8x423l4ummytWs//4sMbCjZkfAJEGiRGz+i9fuJx3hldjNN6IuGk5ZFH3lk+y7Ju
	 7lLeZs8/xmKn23Zcmh4fA9yl1HYdDusSAckoOInkIzNZKt3jeGEL7enjb3MLBcQcFWWMd
	 KiYRLmPJr5Si58lvs8qSLfwtMF3JDNOz8oAptmyZv45VKfiJo+5c2uKQGztfhlkYsm43Q
	 3HLzwE4mOV6X/bnJooTDrDy1Wzlyd+zHzzn8/lB1Y/PHUmfKata33R6ClS3Q4Gp2LxxM7
	 nCbsuCv95iEif58wUOaey02P4pNqMZVR0gHHMAjPFrUb+6A/PJa1fubNFdnTJdYkyxHvT
	 W3xcfRKscUfWz/ChAZ6HpRpvdMt88BIqz8xpWirUd/62sDFw9AjOXNJpzzQUow3aDrTXj
	 VoxzdAsWGnoQLo3bHMWlTf4Icgrl1obkZu+y05FsFWzUmP7hyeavYEJOsVnJaso=
ARC-Authentication-Results: i=1; bugseng.com; arc=none smtp.remote-ip=162.55.131.47
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=bugseng.com; s=mail;
	t=1755200227; bh=QycrJWiuoyqqNf7RG1Xgq94L+aMciX+ilz5eWfCflKo=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=qMqdM5daQFbVpCbjawj/xxwXkYPPcV5+RW0dj7t+/4IPAN8D/N5Zc7v/7LVd/fYud
	 pMxTQaZipulpdwYWKYvaq0Iscpw0om1/ReS7246yY/JcNB7LL16nf7GHrZwj3btvpO
	 GKK7Dr3DxjUIu6GalYvTdwNMdjDRivvE8Gww/pRAgNDvOgOky1g3fER3N930ds5hXf
	 v9kZ0Cr7kZPqAIe8ynm0TwWwJPSFHfnFNkNzcBTGcoag/5mKcHXNMh8A9oGeKKvihx
	 Bee4B7uy/PM2pTDV/NySB56wNyAVLWc4W87z2if/K6oTY/w1J+vFFxdatCoW3ojeWW
	 BJG8rNExWJpdg==
MIME-Version: 1.0
Date: Thu, 14 Aug 2025 21:37:07 +0200
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Jan Beulich <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Xen-devel <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH 13/22] x86: FRED enumerations
In-Reply-To: <b058cb18-7a03-403d-b0c4-402fc0353da2@citrix.com>
References: <20250808202314.1045968-1-andrew.cooper3@citrix.com>
 <20250808202314.1045968-14-andrew.cooper3@citrix.com>
 <9b4da5b3-dd68-4052-92cc-fe322164eaa5@suse.com>
 <9cc46920-b1a6-4085-8481-abf0f1cd0aab@citrix.com>
 <c7e82bee-1b38-41e1-89c6-d1d3717087b2@suse.com>
 <b058cb18-7a03-403d-b0c4-402fc0353da2@citrix.com>
Message-ID: <e3416a404c78156ff33de829c7b4b664@bugseng.com>
X-Sender: nicola.vetrini@bugseng.com
Organization: BUGSENG s.r.l.
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: 8bit

On 2025-08-14 13:47, Andrew Cooper wrote:
> On 14/08/2025 12:44 pm, Jan Beulich wrote:
>> On 14.08.2025 13:42, Andrew Cooper wrote:
>>> On 14/08/2025 12:20 pm, Jan Beulich wrote:
>>>> On 08.08.2025 22:23, Andrew Cooper wrote:
>>>>> --- a/xen/arch/x86/include/asm/x86-defns.h
>>>>> +++ b/xen/arch/x86/include/asm/x86-defns.h
>>>>> @@ -75,6 +75,7 @@
>>>>>  #define X86_CR4_PKE        0x00400000 /* enable PKE */
>>>>>  #define X86_CR4_CET        0x00800000 /* Control-flow Enforcement 
>>>>> Technology */
>>>>>  #define X86_CR4_PKS        0x01000000 /* Protection Key Supervisor 
>>>>> */
>>>>> +#define X86_CR4_FRED      0x100000000 /* Fast Return and Event 
>>>>> Delivery */
>>>> ... a UL suffix added here for Misra.
>>> I was surprised, but Eclair is entirely fine with this.
>> And there is a use of the identifier in a monitored C file?
> 
> Yes.  traps-setup.c which definitely has not been added to an exclusion
> list.
> 

Might look into it before the end of the week, if time allows. Is [1] 
the right branch to look at?

[1] 
https://gitlab.com/xen-project/hardware/xen-staging/-/commits/andrew/fred

> ~Andrew

-- 
Nicola Vetrini, B.Sc.
Software Engineer
BUGSENG (https://bugseng.com)
LinkedIn: https://www.linkedin.com/in/nicola-vetrini-a42471253

