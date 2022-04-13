Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 06C404FF42E
	for <lists+xen-devel@lfdr.de>; Wed, 13 Apr 2022 11:52:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.304009.518506 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1neZf4-00015L-Nk; Wed, 13 Apr 2022 09:51:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 304009.518506; Wed, 13 Apr 2022 09:51:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1neZf4-00012B-JH; Wed, 13 Apr 2022 09:51:42 +0000
Received: by outflank-mailman (input) for mailman id 304009;
 Wed, 13 Apr 2022 09:51:41 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1neZf3-000125-BV
 for xen-devel@lists.xenproject.org; Wed, 13 Apr 2022 09:51:41 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1neZf2-00077i-Ba; Wed, 13 Apr 2022 09:51:40 +0000
Received: from 54-240-197-227.amazon.com ([54.240.197.227] helo=[10.7.236.29])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1neZf2-0006ji-5C; Wed, 13 Apr 2022 09:51:40 +0000
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
	bh=0JT6rkxBRasIQr52TMS506loTlmaQnKyglnW//h1bvo=; b=PcNuxt+3Gs8Y1LrBppE0CCT819
	XZXR/Trn0NTJbSZirC7kXSH5Fmrl2jqsMdwRaPxO2EOqcPsnWgjd6WM+lHqM3/JZrwJGr/B9ZVYbd
	KvgAzTyrTtKIfY4NM96E9hFrLqjmYA8XQIopuf2ai8cUqqHkoijAt7lkTV73XGSVC8PY=;
Message-ID: <77630661-9ce1-9dff-b050-4676f4845ce7@xen.org>
Date: Wed, 13 Apr 2022 10:51:37 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.8.0
Subject: Re: [PATCH] xen/evtchn: Add design for static event channel signaling
 for domUs..
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: Rahul Singh <rahul.singh@arm.com>, xen-devel@lists.xenproject.org,
 bertrand.marquis@arm.com, Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Wei Liu <wl@xen.org>
References: <4836304496e6fbbea41348ed8cc9fcf6b0f3e893.1648049827.git.rahul.singh@arm.com>
 <alpine.DEB.2.22.394.2204081649370.3066615@ubuntu-linux-20-04-desktop>
 <0210f3c6-0f06-4ff5-9f66-8410fd540171@xen.org>
 <alpine.DEB.2.22.394.2204121332460.3066615@ubuntu-linux-20-04-desktop>
From: Julien Grall <julien@xen.org>
In-Reply-To: <alpine.DEB.2.22.394.2204121332460.3066615@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Stefano,

On 12/04/2022 21:39, Stefano Stabellini wrote:
>>> I should mention that it would be also possible to use sub-nodes to
>>> express this information:
>>>
>>> 2)
>>>           domU1: domU1 {
>>>               ...
>>>               /* one sub-node per local event channel */
>>>               ec1: evtchn@a {
>>>                   compatible = "xen,evtchn-v1";
>>>                   /* local-evtchn link-to-foreign-evtchn */
>>>                   xen,evtchn = <0xa &ec3>
>>>               };
>>>               ec2: evtchn@c {
>>>                   compatible = "xen,evtchn-v1";
>>>                   xen,evtchn = <0xc &ec4>
>>>               };
>>>           };
>>>
>>>           domU2: domU2 {
>>>               ...
>>>               ec3: evtchn@b {
>>>                   compatible = "xen,evtchn-v1";
>>>                   xen,evtchn = <0xb &ec1>
>>>               };
>>>               ec4: evtchn@d {
>>>                   compatible = "xen,evtchn-v1";
>>>                   xen,evtchn = <0xd &ec2>
>>>               };
>>>           };
>>>       };
>>
>> As for 1), you could combine all the ports in one node.
> 
> I thought about it but I couldn't come up with a way to do that which
> retains the simplicity of this example. The problem is that in device
> tree you can only link to nodes, not to individual properties. So I
> think we would have to have separate nodes for each event channel so
> that we could separately link to them.

Ah yes. I overlooked it when making the suggestion. That said, I think 
my point in my previous e-mail stands.

If this is too verbose, then we could provide macro to generate the 
event channel node.

> 
> Otherwise, we would have to add the foreign event channel number in
> addition to the link to be able to distinguish them. And that would
> result in duplicated information. E.g.:

This is not indeed not great.

> 
>         domU1: domU1 {
>             ...
>             /* one sub-node per local event channel */
>             ec1: evtchn@a {
>                 compatible = "xen,evtchn-v1";
>                 /* local-evtchn link-to-foreign foreign-evtchn */
>                 xen,evtchn = <0xa &ec2 0xa 0xc &ec2 0xd>
>             };
>         };
> 
>         domU2: domU2 {
>             ...
>             ec2: evtchn@b {
>                 compatible = "xen,evtchn-v1";
>                 xen,evtchn = <0xb &ec1 0xa 0xd &ec1 0xc>
>             };
>         };

Cheers,

-- 
Julien Grall

