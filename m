Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 774AFAEBDE3
	for <lists+xen-devel@lfdr.de>; Fri, 27 Jun 2025 18:55:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1027835.1402291 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uVCLn-0002fD-UB; Fri, 27 Jun 2025 16:54:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1027835.1402291; Fri, 27 Jun 2025 16:54:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uVCLn-0002eI-QB; Fri, 27 Jun 2025 16:54:55 +0000
Received: by outflank-mailman (input) for mailman id 1027835;
 Fri, 27 Jun 2025 16:54:54 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1uVCLm-0002eC-Qx
 for xen-devel@lists.xenproject.org; Fri, 27 Jun 2025 16:54:54 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1uVCLe-005NZ1-2C;
 Fri, 27 Jun 2025 16:54:46 +0000
Received: from [2a02:8012:3a1:0:e11a:3963:f51a:873d]
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1uVCLe-00Dmch-14;
 Fri, 27 Jun 2025 16:54:46 +0000
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
	bh=P8Whh5bb76iAe4fZ767BXfurQbS4qb59ahcZD15w1JE=; b=R8a8wMjyHeJGnLDSZ5gf8H9vNC
	V2pHwXy9IjynFvp5bIC1U2y+hTHtXMT5GiRfuExoWHoVwITDq3LHt5Eyyd3cmrvc9rD6WGD1lf3pO
	BNDRF8DXE4/Cw03bCo62U9zBKPyU0TCJZNpR912TKLp2+SQEV4HowFYWrs4T4MOt3pdE=;
Message-ID: <c444b8ff-13ab-4c54-8ba9-5cee72f0f155@xen.org>
Date: Fri, 27 Jun 2025 17:54:43 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/2] xen/console: unify printout behavior for UART
 emulators
To: Stefano Stabellini <sstabellini@kernel.org>,
 Jan Beulich <jbeulich@suse.com>
Cc: dmkhn@proton.me, andrew.cooper3@citrix.com, anthony.perard@vates.tech,
 michal.orzel@amd.com, roger.pau@citrix.com, dmukhin@ford.com,
 xen-devel@lists.xenproject.org
References: <20250606201102.2414022-1-dmukhin@ford.com>
 <20250606201102.2414022-3-dmukhin@ford.com>
 <bcb3d553-b8aa-42ab-a9c8-7abf6f5d02c3@suse.com> <aEjInVF3zaa+VVd2@kraken>
 <b27f7652-424f-479c-a4bc-ed2ecd46ccc8@suse.com>
 <alpine.DEB.2.22.394.2506111155400.542113@ubuntu-linux-20-04-desktop>
 <b9c263e0-3d8d-4966-8f54-611e58572118@suse.com>
 <alpine.DEB.2.22.394.2506171735440.1780597@ubuntu-linux-20-04-desktop>
 <2f726960-4bdc-4996-b204-722c0253e2ab@suse.com>
 <alpine.DEB.2.22.394.2506181742281.1780597@ubuntu-linux-20-04-desktop>
Content-Language: en-US
From: Julien Grall <julien@xen.org>
In-Reply-To: <alpine.DEB.2.22.394.2506181742281.1780597@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Stefano,

On 19/06/2025 01:45, Stefano Stabellini wrote:
> On Wed, 18 Jun 2025, Jan Beulich wrote:
>> On 18.06.2025 02:39, Stefano Stabellini wrote:
>>> On Thu, 12 Jun 2025, Jan Beulich wrote:
>>>> On 11.06.2025 21:07, Stefano Stabellini wrote:
>>>>> On Wed, 11 Jun 2025, Jan Beulich wrote:
>>>>>> On 11.06.2025 02:07, dmkhn@proton.me wrote:
>>>>>>> On Tue, Jun 10, 2025 at 10:21:40AM +0200, Jan Beulich wrote:
>>>>>>>> On 06.06.2025 22:11, dmkhn@proton.me wrote:
>>>>>>>>> From: Denis Mukhin <dmukhin@ford.com>
>>> If I understood correctly I like your proposal. Let me rephrase it to
>>> make sure we are aligned. You are suggesting that:
>>>
>>> - domains without input focus will print with a (d<N>) prefix
>>> - the domain with input focus will print without a (d<N>) prefix
>>> - this applies to both DomUs and Dom0
>>
>> Except in the non-dom0less case, at least up and until there's at least
>> one other domain. I.e. I'd like to keep Dom0 boot output as it is today,
>> regardless of the presence of e.g. "conswitch=".
> 
> In the non-dom0less case, since dom0 has focus, it would naturally be
> without (d<N>) prefix. Unless the user passes "conswitch=". Honestly, I
> wouldn't special-case conswitch= that way and would prefer keep things
> simple and consistent without corner cases. I don't think conswitch= is
> so widely used that it is worth the complexity to special-case it.

I am a bit confused with the wording. Before I can provide another 
opinion, I want to understand a bit more the concern.

 From my understanding the command line option "conswitch" is to allow 
the admin to change with key is used to switch between Dom0 and Xen. By 
default this is 'a'. So are you referring to the fact a trailing "x" (to 
not switch to dom0 console) can be added?

Cheers,

-- 
Julien Grall


