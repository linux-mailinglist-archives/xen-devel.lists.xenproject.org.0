Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BE7DF4E2441
	for <lists+xen-devel@lfdr.de>; Mon, 21 Mar 2022 11:24:08 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.292887.497397 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nWFC9-0007YV-Jc; Mon, 21 Mar 2022 10:23:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 292887.497397; Mon, 21 Mar 2022 10:23:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nWFC9-0007W4-Fe; Mon, 21 Mar 2022 10:23:25 +0000
Received: by outflank-mailman (input) for mailman id 292887;
 Mon, 21 Mar 2022 10:23:24 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1nWFC7-0007Vx-US
 for xen-devel@lists.xenproject.org; Mon, 21 Mar 2022 10:23:23 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nWFC6-0004Ok-10; Mon, 21 Mar 2022 10:23:22 +0000
Received: from [54.239.6.185] (helo=[192.168.25.135])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nWFC5-0006vi-QJ; Mon, 21 Mar 2022 10:23:21 +0000
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
	bh=I1pRnKKlcORHb6nTEjd2Xi+hBJv1i0X5+kGKQ7/x3JI=; b=BjLFMd57Bv0PuZrRK3BEw21OG4
	MavyLgT5GsnlUmxZdFOiMZK7H7JtlKOxOfd3axMX0ls/IJmveAUPnr4wCPAA2i2SYGdDtXWszT+Zv
	7uVFKyy83EdJU1+lWKApFyJlqfMCKtvcRZ5jzNnScUnLLR1/BaSNGE7/ZwY3QpeMYliI=;
Message-ID: <78cb45b2-eb1b-91b4-864e-816b4902ee7a@xen.org>
Date: Mon, 21 Mar 2022 10:23:19 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.7.0
Subject: Re: [XEN PATCH] evtchn/fifo: Don't set PENDING bit if guest
 misbehaves
To: Andrew Cooper <amc96@srcf.net>, Raphael Ning <raphning@gmail.com>,
 xen-devel@lists.xenproject.org
Cc: Raphael Ning <raphning@amazon.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 David Vrabel <dvrabel@amazon.co.uk>
References: <6b84a20b2753130cc62406a0fd14d2708f6f504b.1647455219.git.raphning@amazon.com>
 <e07d0eda-c117-c83e-227e-7a934585f265@srcf.net>
From: Julien Grall <julien@xen.org>
In-Reply-To: <e07d0eda-c117-c83e-227e-7a934585f265@srcf.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Andrew,

On 16/03/2022 18:58, Andrew Cooper wrote:
>> diff --git a/xen/common/event_fifo.c b/xen/common/event_fifo.c
>> index ed4d3beb10f3..6c74ccebebb7 100644
>> --- a/xen/common/event_fifo.c
>> +++ b/xen/common/event_fifo.c
>> @@ -165,7 +165,7 @@ static void cf_check evtchn_fifo_set_pending(
>>       unsigned int port;
>>       event_word_t *word;
>>       unsigned long flags;
>> -    bool_t was_pending;
>> +    bool_t check_pollers = false;
> 
> Considering your commit message, did you intend to change this to bool?
> 
> Can be fixed on commit.  Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>

So far, tools like b4 [1] are not able to find your tag on lore.kernel.org:

42sh> b4 am 
6b84a20b2753130cc62406a0fd14d2708f6f504b.1647455219.git.raphning@amazon.com

Looking up 
https://lore.kernel.org/r/6b84a20b2753130cc62406a0fd14d2708f6f504b.1647455219.git.raphning%40amazon.com
Analyzing 8 messages in the thread
Checking attestation on all messages, may take a moment...
---
   ✓ [PATCH] evtchn/fifo: Don't set PENDING bit if guest misbehaves
     + Reviewed-by: David Vrabel <dvrabel@amazon.co.uk>
     + Tested-by: Luca Fancellu <luca.fancellu@arm.com> (✓ 
DKIM/armh.onmicrosoft.com)
   ---
   ✓ Signed: DKIM/gmail.com
---
Total patches: 1
---
  Link: 
https://lore.kernel.org/r/6b84a20b2753130cc62406a0fd14d2708f6f504b.1647455219.git.raphning@amazon.com
  Base: not specified
        git am 
./20220316_raphning_evtchn_fifo_don_t_set_pending_bit_if_guest_misbehaves.mbx

This is because they are not at the start of the line. In the future, 
would you mind write the tag on a separate line?

Cheers,

[1] 
https://people.kernel.org/monsieuricon/introducing-b4-and-patch-attestation

-- 
Julien Grall

