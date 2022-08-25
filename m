Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E79365A13B9
	for <lists+xen-devel@lfdr.de>; Thu, 25 Aug 2022 16:36:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.393463.632431 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oRDxw-00071r-IK; Thu, 25 Aug 2022 14:36:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 393463.632431; Thu, 25 Aug 2022 14:36:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oRDxw-0006yh-FH; Thu, 25 Aug 2022 14:36:16 +0000
Received: by outflank-mailman (input) for mailman id 393463;
 Thu, 25 Aug 2022 14:36:15 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1oRDxv-0006yV-5q
 for xen-devel@lists.xenproject.org; Thu, 25 Aug 2022 14:36:15 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1oRDxu-0008CF-VG; Thu, 25 Aug 2022 14:36:14 +0000
Received: from [54.239.6.188] (helo=[192.168.11.158])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1oRDxu-0002Yv-Pc; Thu, 25 Aug 2022 14:36:14 +0000
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
	bh=M7isopoYGEgRfjyflOyDCuw9v+/A4LACWVM/dnwf6pM=; b=pGCCF19/g9G7/wvp4gC82HLb1K
	qEvL64mRT35WTMt//23Ht0ZkpJN+A/9ME2Al3nHJGev2NX5pbaibaCU4p+rZQ3azLLxkn2wnMOC1g
	Z85/JuecMvICnLDPNa0lw7PUXsVedcGUs0edFgecGALkDNbktQgKcfg2VCDOivvZv0mQ=;
Message-ID: <2a520490-dd84-686e-ee1f-f84581314320@xen.org>
Date: Thu, 25 Aug 2022 15:36:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.2.0
Subject: Re: [PATCH v2] Arm32: correct string.h functions for "int" ->
 "unsigned char" conversion
Content-Language: en-US
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <volodymyr_babchuk@epam.com>,
 Bertrand Marquis <Bertrand.Marquis@arm.com>
References: <8e5df72f-2ed8-3bec-18ff-3da228ab9ee0@suse.com>
 <031ce9f6-ede4-f371-da04-ff8c2df209dc@suse.com>
 <43F406AE-988F-4429-B8CB-F47DBD599B43@arm.com>
 <6c14c923-0ab1-5a07-0e3b-4df2956d7ec4@xen.org>
 <4919c645-1724-e6af-1db9-33a3214a24f7@suse.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <4919c645-1724-e6af-1db9-33a3214a24f7@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Jan,

On 25/08/2022 15:34, Jan Beulich wrote:
> On 25.08.2022 16:31, Julien Grall wrote:
>> On 24/08/2022 13:44, Bertrand Marquis wrote:
>>>> On 24 Aug 2022, at 13:33, Jan Beulich <jbeulich@suse.com> wrote:
>>>>
>>>> While Arm64 does so uniformly, for Arm32 only strchr() currently handles
>>>> this properly. Add the necessary conversion also to strrchr(), memchr(),
>>>> and memset().
>>>>
>>>> As to the placement in memset(): Putting the new insn at the beginning
>>>> of the function is apparently deemed more "obvious". It could be placed
>>>> later, as the code reachable without ever making it to the "1" label
>>>> only ever does byte stores.
>>>>
>>>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>>> Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>
>>
>> It is now committed.
> 
> But then perhaps not pushed yet?

Yes. I tend to send the message just after I apply it. I will push when 
I am done with a batch (in this case, this is the only patch I pushed).

Cheers,

-- 
Julien Grall

