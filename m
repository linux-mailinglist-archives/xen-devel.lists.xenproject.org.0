Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 43654729FA2
	for <lists+xen-devel@lfdr.de>; Fri,  9 Jun 2023 18:07:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.546202.852889 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q7eds-0001n9-31; Fri, 09 Jun 2023 16:07:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 546202.852889; Fri, 09 Jun 2023 16:07:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q7edr-0001ki-Vs; Fri, 09 Jun 2023 16:07:11 +0000
Received: by outflank-mailman (input) for mailman id 546202;
 Fri, 09 Jun 2023 16:07:10 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1q7edq-0001kc-OQ
 for xen-devel@lists.xenproject.org; Fri, 09 Jun 2023 16:07:10 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1q7edm-0000JL-10; Fri, 09 Jun 2023 16:07:06 +0000
Received: from 54-240-197-233.amazon.com ([54.240.197.233]
 helo=[192.168.17.204]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1q7edl-0000UH-Pg; Fri, 09 Jun 2023 16:07:05 +0000
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
	bh=0xJ057tmt/AEnszx2hqXIeW8lH72i5cQZkIkhCrAf5Q=; b=J0cGQ70uqbKbTtROrWE+NP2Ys9
	oZP4PuoR9fpR+7hhse6IDePxhCZmZcQ/X57iWMH2LPnPnLSn9Na+77wQMWILmCFfLvJdGi0JKEowa
	N2YKEf7ihuCicRsE9yesXWftFLvmkjnESMT47WZZdhFb86EMJ7FAya4FBAUwm04MyjE8=;
Message-ID: <3a7eca41-0ecf-4bf1-1daf-9d66f4aa6400@xen.org>
Date: Fri, 9 Jun 2023 17:07:03 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.11.2
Subject: Re: [PATCH 2/3] xen/ppc: Implement early serial printk on
 PaPR/pseries
Content-Language: en-US
To: Shawn Anastasio <shawn@anastas.io>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich <jbeulich@suse.com>
Cc: tpearson@raptorengineering.com, George Dunlap <george.dunlap@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Shawn Anastasio <shawnanastasio@raptorengineering.com>,
 xen-devel@lists.xenproject.org
References: <cover.1686148363.git.shawn@anastas.io>
 <e9a4878544d264688578d7899867df7e8207aba5.1686148363.git.shawn@anastas.io>
 <0c0a19de-dde3-8b98-4354-6d3d2019179b@suse.com>
 <0b24d36b-adbc-9e7c-df6e-8754c269855d@citrix.com>
 <d0d9b1be-a9e2-fff9-d631-149086ea1dfe@suse.com>
 <d52feaa7-4217-973e-19fe-9ec027eed5fc@citrix.com>
 <1c35f696-5a65-06da-8af5-685b8ad2e849@xen.org>
 <e16bcfa1-2b40-6bf0-57c9-5045ae1fdf80@citrix.com>
 <bcbab76d-ca8c-0772-3a9f-59fef3a2b5f5@xen.org>
 <CT87KSPVSBUG.2C4SWW2EDTA5Z@Shawns-Mac-mini.lan>
From: Julien Grall <julien@xen.org>
In-Reply-To: <CT87KSPVSBUG.2C4SWW2EDTA5Z@Shawns-Mac-mini.lan>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Shawn,

On 09/06/2023 16:01, Shawn Anastasio wrote:
> On Fri Jun 9, 2023 at 5:12 AM CDT, Julien Grall wrote:
>> Strictly speaking we can refuse any code. That count for license as
>> well. Anyway, I didn't request a change here. I merely pointed out that
>> any use of GPLv2+ should be justified because on Arm most of the people
>> don't pay attention on the license and pick the one from an existing file.
> 
> Hi Julien,
> 
> The choice of GPLv2+ for many of the files in this patchset was indeed
> inherited from old IBM-written Xen code that the files in question were
> derived from. I did not realize it was permissible or even desirable to
> relicense those to GPLv2-only.
> 
> As for the new files, GPLv2+ was chosen to remain consistent and to open
> the door for future derivations from GPLv2+ licensed code, either from
> the older Xen tree or from the Linux ppc tree, much of which is also
> licensed as GPLv2+. If it would reduce friction, these files could be
> relicensed to GPLv2-only.

(Before someone points out, I know this is already a problem on other 
part of Xen. But it would be ideal if we avoid spreading this mess on 
new architectures :).

Thanks for the explanations. To clarify, are you saying that all the 
files will be GPLv2+ or just some?

If the latter, then my concern would be that if you need to import 
GPLv2-only code, then you may need to write your code in a different 
file. This may become messy to handle and some developer may end up to 
be confused.

I am not a lawyer though, so you may want to check the implications here.

Cheers,

-- 
Julien Grall

