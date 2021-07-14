Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DA0A93C8D8C
	for <lists+xen-devel@lfdr.de>; Wed, 14 Jul 2021 21:43:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.156198.288230 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m3kmp-0002Du-1D; Wed, 14 Jul 2021 19:43:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 156198.288230; Wed, 14 Jul 2021 19:43:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m3kmo-0002BZ-So; Wed, 14 Jul 2021 19:43:14 +0000
Received: by outflank-mailman (input) for mailman id 156198;
 Wed, 14 Jul 2021 19:43:13 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1m3kmn-0002BR-Nj
 for xen-devel@lists.xenproject.org; Wed, 14 Jul 2021 19:43:13 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1m3kml-0004G9-3y; Wed, 14 Jul 2021 19:43:11 +0000
Received: from [54.239.6.185] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1m3kmk-0003O5-Tx; Wed, 14 Jul 2021 19:43:11 +0000
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
	bh=A7sJazuRwFikAxaPX2Thh0UgcHfGngxkrskJnNE3+qE=; b=4w9TCu0e+y4r11rE1qFGePTTtz
	dCkjHntToVExhteCDmOftPitwRpi/g3Pl2VALPxqTAEg1yXzxrxdQkpmB80pNy4M4juYEdylcwpiE
	FzBFM+zLyrsHwYc5XWRdTnBuTMcsTwbq0y8YyMiaEpLtAYCzV5mt6foEK8RZJXtPncH4=;
Subject: Re: [PATCH] SUPPORT.md: add Dom0less as Supported
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: xen-devel@lists.xenproject.org, andrew.cooper3@citrix.com,
 george.dunlap@citrix.com, jbeulich@suse.com, iwj@xenproject.org, wl@xen.org
References: <alpine.DEB.2.21.2107131734170.23286@sstabellini-ThinkPad-T480s>
 <47749630-ff78-e00f-63c0-8ff71a6a04c9@xen.org>
 <alpine.DEB.2.21.2107141224550.23286@sstabellini-ThinkPad-T480s>
From: Julien Grall <julien@xen.org>
Message-ID: <f443ca4f-a942-7765-a8c0-072d2844a0d9@xen.org>
Date: Wed, 14 Jul 2021 20:43:08 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <alpine.DEB.2.21.2107141224550.23286@sstabellini-ThinkPad-T480s>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

Hi Stefano,

On 14/07/2021 20:28, Stefano Stabellini wrote:
> On Wed, 14 Jul 2021, Julien Grall wrote:
>> Hi Stefano,
>>
>> On 14/07/2021 01:39, Stefano Stabellini wrote:
>>> Add Dom0less to SUPPORT.md to clarify its support status. The feature is
>>> mature enough and small enough to make it security supported.
>>>
>>> Signed-off-by: Stefano Stabellini <stefano.stabellini@xilinx.com>
>>>
>>> diff --git a/SUPPORT.md b/SUPPORT.md
>>> index 317392d8f3..c777f3da72 100644
>>> --- a/SUPPORT.md
>>> +++ b/SUPPORT.md
>>> @@ -832,6 +832,12 @@ OVMF firmware implements the UEFI boot protocol.
>>>          Status, qemu-xen: Supported
>>>    +## Dom0less
>>> +
>>> +Guest creation from the hypervisor at boot without Dom0 intervention.
>>> +
>>> +    Status, ARM: Supported
>>> +
>>
>> After XSA-372, we will not scrubbed memory assigned to dom0less DomU when
>> bootscrub=on.
> 
> Do you mean *before* XSA-372, right?

No, I really meant *after* XSA-372.

> I thought the XSA-372 patches take
> care of the problem?

It didn't. We have an open question for the bootscrub=on one. From the 
commit message of patch #1:

         2) The memory allocated for a domU will not be scrubbed anymore 
when an
         admin select bootscrub=on. This is not something we advertised, 
but if
         this is a concern we can introduce either force scrub for all 
domUs or
         a per-domain flag in the DT. The behavior for bootscrub=off and
         bootscrub=idle (default) has not changed.

>  >
>> Do we want to exclude this combination or mention that XSAs will
>> not be issued if the domU can read secret from unscrubbed memory?
> 
> I could say that if bootscrub=off then we won't issue XSAs for domUs reading
> secrets from unscrubbed memory. But it is kind of obvious anyway? I am
> happy to add it if you think it is good to clarify.

Right, it is pretty clear that bootscrub=off will not scrub the memory 
and the "problem" would not be specific to dom0less.

The one I asked to clarify is bootscrub=on because one may think the 
memory is scrubbed for dom0less domU for all the cases but bootscrub=off.

IIRC when we discussed about it on security@xen.org, we suggested that 
it would be fine to rely on the bootloader to scrub it. But I think this 
needs to be written down rather waiting for it to be re-discovered.

The other solution is to fix it properly.

Cheers,

-- 
Julien Grall

