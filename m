Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DFB74C6FCA
	for <lists+xen-devel@lfdr.de>; Mon, 28 Feb 2022 15:44:33 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.280613.478615 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nOhG2-0001Xg-AN; Mon, 28 Feb 2022 14:44:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 280613.478615; Mon, 28 Feb 2022 14:44:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nOhG2-0001UY-6n; Mon, 28 Feb 2022 14:44:14 +0000
Received: by outflank-mailman (input) for mailman id 280613;
 Mon, 28 Feb 2022 14:44:12 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1nOhG0-0001US-Nm
 for xen-devel@lists.xenproject.org; Mon, 28 Feb 2022 14:44:12 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nOhFy-0007Ib-4t; Mon, 28 Feb 2022 14:44:10 +0000
Received: from 54-240-197-230.amazon.com ([54.240.197.230]
 helo=[192.168.13.237]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nOhFx-0000wx-VN; Mon, 28 Feb 2022 14:44:10 +0000
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
	bh=/N0hQt8aoJ6emt33l98XsvOxjPlTQBPCJCiT8gs0f8M=; b=QtS1NGysuwsFAvZ1whI78XJxk6
	YfqKxmPcQUzP8zINYKqno1e/bwBqsHfMbs1xbLeJ43bAqQJC+90GOZ2Zk88hkTi4q/dOfUxhhR8uW
	C7QtvUU6VO6PeZqRxNSgEcNgQk80O9UFqb2oD8X6Zz5TI/b39PZjxSuZiNO32cBfQmZA=;
Message-ID: <4ef27101-9057-6667-e017-fd2d830c942b@xen.org>
Date: Mon, 28 Feb 2022 14:44:08 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.6.1
Subject: Re: [PATCH] docs: correct "gnttab=" documented default
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <3cc8bfca-be9e-cde8-c481-657ef33de7f2@suse.com>
 <4c087383-2f17-5af2-7c2f-77eb9aff9d3d@xen.org>
 <2025d913-acf9-d3f5-12ba-90b97e34eff2@suse.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <2025d913-acf9-d3f5-12ba-90b97e34eff2@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Jan,

On 28/02/2022 14:32, Jan Beulich wrote:
> On 28.02.2022 15:02, Julien Grall wrote:
>> On 28/02/2022 10:19, Jan Beulich wrote:
>>> Defaults differ for Arm and x86, not the least because of v2 not even
>>> being security supported on Arm.
>>>
>>> Also drop a bogus sentence from gnttab_max_maptrack_frames, which was
>>> presumably mistakenly cloned from gnttab_max_frames (albeit even there
>>> what is being said is neither very precise nor very useful imo).
>>>
>>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>>>
>>> --- a/docs/misc/xen-command-line.pandoc
>>> +++ b/docs/misc/xen-command-line.pandoc
>>> @@ -1177,7 +1177,8 @@ Specify which console gdbstub should use
>>>    ### gnttab
>>>    > `= List of [ max-ver:<integer>, transitive=<bool>, transfer=<bool> ]`
>>>    
>>> -> Default: `gnttab=max-ver:2,transitive,transfer`
>>> +> Default (Arm): `gnttab=max-ver:1`
>>> +> Default (x86): `gnttab=max-ver:2,transitive,transfer`
>>
>> AFAICT, the default would not be correct on x86 when CONFIG_PV=n because
>> transfer is not available.
> 
> I can certainly split it in two x86 lines, one for PV and one for HVM.
> I would not have thought I need to go that far, though.

I thought I would mention it because to me it feels odd to correct the 
default on Arm but keep the x86 one potentially inacurrate.

Anyway, I am ok if you prefer to keep it like that. This is already an 
improvement for Arm:

Acked-by: Julien Grall <jgrall@amazon.com>

Cheers,

-- 
Julien Grall

