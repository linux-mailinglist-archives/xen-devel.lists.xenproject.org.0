Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 31CAF57BDBC
	for <lists+xen-devel@lfdr.de>; Wed, 20 Jul 2022 20:27:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.372126.603943 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oEEPi-0007Hr-Ca; Wed, 20 Jul 2022 18:27:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 372126.603943; Wed, 20 Jul 2022 18:27:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oEEPi-0007Fo-94; Wed, 20 Jul 2022 18:27:14 +0000
Received: by outflank-mailman (input) for mailman id 372126;
 Wed, 20 Jul 2022 18:27:13 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1oEEPh-0007Fi-C7
 for xen-devel@lists.xenproject.org; Wed, 20 Jul 2022 18:27:13 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1oEEPd-0006n5-Kh; Wed, 20 Jul 2022 18:27:09 +0000
Received: from [54.239.6.185] (helo=[192.168.0.130])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1oEEPd-0001w4-Bu; Wed, 20 Jul 2022 18:27:09 +0000
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
	bh=lukKjgnuc7y0+9OBOaI2LWBRC0HjHZ+rW3x2gC55vKQ=; b=6UXGz+6lnU39C2ju7kQoAhnKrc
	7G2+jvWrPY/po8Yu4++rAUPxwE6DMLt3pxpjtEChLZj5vd3+IY1u5TB+3TRqtKoBA2IhPnaqKGLHN
	RdFw03TdVK/+4dA2sVqtKr/6LlXTFSomnOjVDicv2aGetla3USNijkCB8WkYXxtCt5M4=;
Message-ID: <a1c001b6-3a4a-a118-c343-f2c47a6e3d11@xen.org>
Date: Wed, 20 Jul 2022 19:27:07 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.11.0
Subject: Re: [PATCH v2 3/3] xen/heap: pass order to free_heap_pages() in heap
 init
To: Jan Beulich <jbeulich@suse.com>
Cc: Hongyan Xia <hongyxia@amazon.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Julien Grall <jgrall@amazon.com>, xen-devel@lists.xenproject.org
References: <20220715170312.13931-1-julien@xen.org>
 <20220715170312.13931-4-julien@xen.org>
 <0242a659-fcf9-74cc-102c-df775123b7ac@suse.com>
 <b8b84df4-4101-a78f-1cf1-1662500ee2c0@xen.org>
 <097e8634-0c5b-35ac-6ad6-5b83d9b29f64@suse.com>
 <a06eb29a-c5b3-3a97-7f39-ca25a051163d@xen.org>
 <4904ae1b-19ef-533c-fc2f-baec570bfcca@suse.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <4904ae1b-19ef-533c-fc2f-baec570bfcca@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Jan,

On 19/07/2022 07:01, Jan Beulich wrote:
> On 18.07.2022 19:39, Julien Grall wrote:
>> On 18/07/2022 12:02, Jan Beulich wrote:
>>> On 18.07.2022 12:24, Julien Grall wrote:
>>> 3)
>>>           unsigned int inc_order = min(MAX_ORDER, flsl(e - s) - 1);
>>>
>>>           if ( s )
>>>               inc_order = min(inc_order, ffsl(s) - 1U);
>>
>> I like this idea!
>>
>>>
>>> No compilation issues to expect here, afaict.
>>
>> Correct, GCC is happy with this approach. Assuming there are no other
>> comments, are you happy if I make the change on commit?
> 
> Sure - iirc I gave my R-b already.

You did. Just wanted to make sure your reviewed-by was valid with your 
proposal.

I have now committed the series.

Cheers,

-- 
Julien Grall

