Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 432217295B5
	for <lists+xen-devel@lfdr.de>; Fri,  9 Jun 2023 11:44:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.545772.852327 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q7Yeh-0000CU-Co; Fri, 09 Jun 2023 09:43:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 545772.852327; Fri, 09 Jun 2023 09:43:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q7Yeh-00009u-A4; Fri, 09 Jun 2023 09:43:39 +0000
Received: by outflank-mailman (input) for mailman id 545772;
 Fri, 09 Jun 2023 09:43:38 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1q7Yef-00009o-V9
 for xen-devel@lists.xenproject.org; Fri, 09 Jun 2023 09:43:37 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1q7Yea-0007gc-N7; Fri, 09 Jun 2023 09:43:32 +0000
Received: from 54-240-197-233.amazon.com ([54.240.197.233]
 helo=[192.168.17.204]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1q7Yea-0001HJ-Gc; Fri, 09 Jun 2023 09:43:32 +0000
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
	bh=FbHm2t5dbwS1ffW0/hJffqbSSP8AlGgyqCLMZcSxaZA=; b=d7xjs2u/YSetzuy0S26tQVBtg0
	HXQavlVEXPKldiliCzNkTB92Cb7LzSKjAYNH5c+ypPJniztnLIKPww41AIraOGW3YNoK44T3ivsv7
	NdIzYjPwmwSrbv3HwervpFOWVY0WTEp3bA/ouyOlFnbBIPiNeE9Tb8vkcuoWCJB6IvtY=;
Message-ID: <5003962a-11b0-af10-afc8-335e82fd4d41@xen.org>
Date: Fri, 9 Jun 2023 10:43:30 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.11.0
Subject: Re: [PATCH 2/3] xen/ppc: Implement early serial printk on
 PaPR/pseries
Content-Language: en-US
To: Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>
Cc: tpearson@raptorengineering.com, George Dunlap <george.dunlap@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Shawn Anastasio <shawnanastasio@raptorengineering.com>,
 xen-devel@lists.xenproject.org, Shawn Anastasio <shawn@anastas.io>
References: <cover.1686148363.git.shawn@anastas.io>
 <e9a4878544d264688578d7899867df7e8207aba5.1686148363.git.shawn@anastas.io>
 <0c0a19de-dde3-8b98-4354-6d3d2019179b@suse.com>
 <0b24d36b-adbc-9e7c-df6e-8754c269855d@citrix.com>
 <d0d9b1be-a9e2-fff9-d631-149086ea1dfe@suse.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <d0d9b1be-a9e2-fff9-d631-149086ea1dfe@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 09/06/2023 10:38, Jan Beulich wrote:
> On 09.06.2023 11:29, Andrew Cooper wrote:
>> On 09/06/2023 10:22 am, Jan Beulich wrote:
>>>> --- /dev/null
>>>> +++ b/xen/arch/ppc/boot_of.c
>>>> @@ -0,0 +1,122 @@
>>>> +/* SPDX-License-Identifier: GPL-2.0-or-later */
>>> By default we mean to use ...
>>>
>>>> --- /dev/null
>>>> +++ b/xen/arch/ppc/early_printk.c
>>>> @@ -0,0 +1,36 @@
>>>> +/* SPDX-License-Identifier: GPL-2.0 */
>>> ... the more modern form of this (GPL-2.0-only). Anything deviating from
>>> that may want justifying in the description.
>>
>> GPL-2.0-or-later is fine.
> 
> Hmm, I was merely following
> https://lists.xen.org/archives/html/xen-devel/2023-06/msg00415.html.
> The text at the top of ./COPYING looks to suggest -only, and I'm
> unaware of any other place where our default is actually written down.

We had several discussion in the past about using GPLv2+ license in Xen 
(see [1], [2]). It has always been unclear what is the impact on 
contribution with such license. So I think we should stick with GPL-2.0 
for new code unless there is a reason to diverge.

Cheers,

[1] 
https://patchwork.kernel.org/project/xen-devel/patch/1474985810-12289-1-git-send-email-lars.kurth@citrix.com/#19650817
[2] 
https://lore.kernel.org/all/alpine.DEB.2.22.394.2208231140140.15247@ubuntu-linux-20-04-desktop/

-- 
Julien Grall

