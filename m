Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CD25368097
	for <lists+xen-devel@lfdr.de>; Thu, 22 Apr 2021 14:37:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.115390.220109 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lZYZr-0006qR-3j; Thu, 22 Apr 2021 12:37:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 115390.220109; Thu, 22 Apr 2021 12:37:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lZYZr-0006q2-0K; Thu, 22 Apr 2021 12:37:03 +0000
Received: by outflank-mailman (input) for mailman id 115390;
 Thu, 22 Apr 2021 12:37:01 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=uib8=JT=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lZYZp-0006pv-6r
 for xen-devel@lists.xenproject.org; Thu, 22 Apr 2021 12:37:01 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id f1e60ec0-32eb-4eb9-a3ee-c9add9ce69e1;
 Thu, 22 Apr 2021 12:37:00 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id ABE7BAFC2;
 Thu, 22 Apr 2021 12:36:59 +0000 (UTC)
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
X-Inumbo-ID: f1e60ec0-32eb-4eb9-a3ee-c9add9ce69e1
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1619095019; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Y3ropPHvuikAOL3Zx2BQj7HjojhJpHzsVY/WjBmU8+s=;
	b=KqTyH99OHPCAE9NSGOjha/3S6s2uQjuALmxiDT1WFSnlwAgIdzRXvBEX2Z6kpi6WjIzBQ6
	NHD/cdVvOlVZHWMIz5gTg3HHli0TFgQQqsbsN3y0QUBWplx4zoZx1/XTh6Hy/J8IMJvldy
	sR/uC/vb/zkRLZvQNSJl4SslMQW2cuI=
Subject: Re: Ping: [PATCH v3] x86/CPUID: shrink max_{,sub}leaf fields
 according to actual leaf contents
To: paul@xen.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Wei Liu <wl@xen.org>
References: <9ecd03b2-f8fa-2a8b-69ad-4b31920ea205@suse.com>
 <9a2058cc-d6af-d01a-8630-ab897a75ccbc@suse.com>
 <215292c9-79f6-4532-c051-0b7a0c53c138@xen.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <80b290da-1041-d080-6877-d450eddeb0a2@suse.com>
Date: Thu, 22 Apr 2021 14:36:59 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <215292c9-79f6-4532-c051-0b7a0c53c138@xen.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 22.04.2021 14:34, Paul Durrant wrote:
> On 22/04/2021 12:38, Jan Beulich wrote:
>> On 16.04.2021 15:16, Jan Beulich wrote:
>>> Zapping leaf data for out of range leaves is just one half of it: To
>>> avoid guests (bogusly or worse) inferring information from mere leaf
>>> presence, also shrink maximum indicators such that the respective
>>> trailing entry is not all blank (unless of course it's the initial
>>> subleaf of a leaf that's not the final one).
>>>
>>> This is also in preparation of bumping the maximum basic leaf we
>>> support, to ensure guests not getting exposed related features won't
>>> observe a change in behavior.
>>>
>>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>>
>> First of all - I'm sorry Paul, I forgot to Cc you on the original
>> submission.
>>
> 
> Ok. I did notice some discussion but wasn't really paying attention.
> 
>> May I ask for an ack or otherwise for the Viridian part of this?
>> Please be sure, however, that you have seen the earlier discussion,
>> also on v2, as Roger is questioning whether the Viridian change
>> here wouldn't better be dropped.
>>
> 
> I confess that I'm not a fan of the recursive calls and I do agree with 
> Roger that limiting the leaves simply because they have zero values is 
> probably not the right thing to do and it could lead to issues with 
> Windows. I think, to be on the safe side, it's best to leave the 
> viridian code as-is.

Okay. In which case I have all needed acks, and the remaining part of
the change can go in.

Jan

