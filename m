Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E037973A41A
	for <lists+xen-devel@lfdr.de>; Thu, 22 Jun 2023 17:01:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.553661.864344 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qCLoU-00054s-Mp; Thu, 22 Jun 2023 15:01:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 553661.864344; Thu, 22 Jun 2023 15:01:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qCLoU-00052x-Jk; Thu, 22 Jun 2023 15:01:34 +0000
Received: by outflank-mailman (input) for mailman id 553661;
 Thu, 22 Jun 2023 15:01:32 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=yL9z=CK=raptorengineering.com=sanastasio@srs-se1.protection.inumbo.net>)
 id 1qCLoS-00052r-JB
 for xen-devel@lists.xenproject.org; Thu, 22 Jun 2023 15:01:32 +0000
Received: from raptorengineering.com (mail.raptorengineering.com
 [23.155.224.40]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id aadc6c0f-110d-11ee-b237-6b7b168915f2;
 Thu, 22 Jun 2023 17:01:30 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by mail.rptsys.com (Postfix) with ESMTP id 84FE2828522F;
 Thu, 22 Jun 2023 10:01:28 -0500 (CDT)
Received: from mail.rptsys.com ([127.0.0.1])
 by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id V0tCcT_M1YKN; Thu, 22 Jun 2023 10:01:27 -0500 (CDT)
Received: from localhost (localhost [127.0.0.1])
 by mail.rptsys.com (Postfix) with ESMTP id 8712A828595B;
 Thu, 22 Jun 2023 10:01:27 -0500 (CDT)
Received: from mail.rptsys.com ([127.0.0.1])
 by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id gXV4KVHAOc46; Thu, 22 Jun 2023 10:01:27 -0500 (CDT)
Received: from [10.11.0.2] (5.edge.rptsys.com [23.155.224.38])
 by mail.rptsys.com (Postfix) with ESMTPSA id 0F9D2828522F;
 Thu, 22 Jun 2023 10:01:26 -0500 (CDT)
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
X-Inumbo-ID: aadc6c0f-110d-11ee-b237-6b7b168915f2
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.rptsys.com 8712A828595B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=raptorengineering.com; s=B8E824E6-0BE2-11E6-931D-288C65937AAD;
	t=1687446087; bh=Y9A7M+/J3y7ZwyShecMfpHdNzK//yoeonPj7SAgm/Z8=;
	h=Message-ID:Date:MIME-Version:To:From;
	b=eLEJuk15anOo7rSBPq9NfG31ye6nbTFD0HwQ1ZFOYBgPKLVYIbjI0j1Kx2ZyOibCR
	 C4pfdSVjH6O4JQ7ODeGbUYbb0YcA0gtE177eoxX10rsI0Eb13uOzwh9fEuMJSGjY7W
	 Nh0byIYqgzLcXoLzTRxJkuVPbwJlWiFXh4jNJLxI=
X-Virus-Scanned: amavisd-new at rptsys.com
Message-ID: <1cfc72ee-4920-6b03-0654-85e9108edcdd@raptorengineering.com>
Date: Thu, 22 Jun 2023 10:01:26 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux ppc64le; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH 3/4] xen/ppc: Implement early serial printk on pseries
To: Jan Beulich <jbeulich@suse.com>
Cc: tpearson@raptorengineering.com, Andrew Cooper
 <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
References: <cover.1687366665.git.sanastasio@raptorengineering.com>
 <259298cdadf7cf1eba08cd35c636e9aca9e2182a.1687366665.git.sanastasio@raptorengineering.com>
 <692e2955-a85d-3c6c-7730-962956f6ebf6@citrix.com>
 <8ac54b2e-b074-18eb-38bf-1041a8109d7b@raptorengineering.com>
 <ec8a7bfa-025a-5f40-f4f2-a8969e8ccf55@suse.com>
Content-Language: en-US
From: Shawn Anastasio <sanastasio@raptorengineering.com>
In-Reply-To: <ec8a7bfa-025a-5f40-f4f2-a8969e8ccf55@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 6/22/23 3:03 AM, Jan Beulich wrote:
> On 21.06.2023 20:21, Shawn Anastasio wrote:
>> On 6/21/23 12:54 PM, Andrew Cooper wrote:
>>> Given:
>>>
>>> #define r0  0
>>>
>>> do the assemblers really not understand register names?  That seems mad.
>>
>> Yeah as surprising as it is, ppc64 assemblers don't handle register
>> names by default. I think at some point a flag was added to GAS (and
>> probably llvm? will have to check) to define them for you, but I'm not
>> sure which version introduced the flag.
> 
> Isn't it that you simply need to prefix them with %? That looks to be
> working for me without any special options in PPC code I maintain for
> an entirely different purpose.

Yes, this is the approach I'll go with. Originally I wanted to preserve
the non-prefixed syntax, but I discovered that the required flag
(-mregnames) is not supported by llvm.

> Jan

Thanks,
Shawn

