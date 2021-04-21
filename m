Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 67104366F8F
	for <lists+xen-devel@lfdr.de>; Wed, 21 Apr 2021 17:57:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.114876.219008 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lZFD9-000790-U6; Wed, 21 Apr 2021 15:56:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 114876.219008; Wed, 21 Apr 2021 15:56:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lZFD9-00078b-Qq; Wed, 21 Apr 2021 15:56:19 +0000
Received: by outflank-mailman (input) for mailman id 114876;
 Wed, 21 Apr 2021 15:56:18 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1lZFD8-00078W-1b
 for xen-devel@lists.xenproject.org; Wed, 21 Apr 2021 15:56:18 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lZFD5-0002q1-9k; Wed, 21 Apr 2021 15:56:15 +0000
Received: from [54.239.6.186] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lZFD4-0004D5-Vj; Wed, 21 Apr 2021 15:56:15 +0000
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
	bh=4P4eHH7St1ljHqguZmGyBDps9m2r7Ig+Iau7pTta8Y8=; b=OStE9TUtzUJMcP5BDTkIk825Nf
	oLtokitnrNfUhcPr+bImmVgY8XH9+X5XGY8Xhaz25JDwf9K1+dNXnINHPBZPbBSwQPfkQzUEBtHnw
	vcW4/QZCyNpkdX3mSpIUpWyo/6OjnS1c8XlVeASi4jGc8s7geB7xLAgKf4IEZpPpHdOY=;
Subject: Re: Ping: [PATCH v5 0/6] evtchn: (not so) recent XSAs follow-on
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>, Ian Jackson
 <iwj@xenproject.org>, Wei Liu <wl@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>
References: <306e62e8-9070-2db9-c959-858465c50c1d@suse.com>
 <d29fa89b-ea0a-bdbd-04c9-02eff0854d47@suse.com>
From: Julien Grall <julien@xen.org>
Message-ID: <40e90456-90dc-7932-68ec-6f4d0941999f@xen.org>
Date: Wed, 21 Apr 2021 16:56:13 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.9.1
MIME-Version: 1.0
In-Reply-To: <d29fa89b-ea0a-bdbd-04c9-02eff0854d47@suse.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit



On 21/04/2021 16:23, Jan Beulich wrote:
> On 27.01.2021 09:13, Jan Beulich wrote:
>> These are grouped into a series largely because of their origin,
>> not so much because there are (heavy) dependencies among them.
>> The main change from v4 is the dropping of the two patches trying
>> to do away with the double event lock acquires in interdomain
>> channel handling. See also the individual patches.
>>
>> 1: use per-channel lock where possible
>> 2: convert domain event lock to an r/w one
>> 3: slightly defer lock acquire where possible
>> 4: add helper for port_is_valid() + evtchn_from_port()
>> 5: type adjustments
>> 6: drop acquiring of per-channel lock from send_guest_{global,vcpu}_virq()
> 
> Only patch 4 here has got an ack so far - may I ask for clear feedback
> as to at least some of these being acceptable (I can see the last one
> being controversial, and if this was the only one left I probably
> wouldn't even ping, despite thinking that it helps reduce unecessary
> overhead).

I left feedback for the series one the previous version (see [1]). It 
would have been nice is if it was mentionned somewhere as this is still 
unresolved.

The locking in the event channel is already quite fragile (see recent 
XSAs, follow-up bugs...). Even if the pattern is used somewhere (as you 
suggested), I don't think it is good idea to pertain it.

To be clear, I am not saying I don't care about performance. Instead I 
am trying to find a trade off between code maintenability and 
performance. So far, I didn't see any data justifying that the extra 
performance is worth the risk of making a code more fragile.

Cheers,

[1] <3c393170-09f9-6d31-c227-b599f8769e35@xen.org>

> 
> Jan
> 

-- 
Julien Grall

