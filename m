Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 46AD227D33A
	for <lists+xen-devel@lfdr.de>; Tue, 29 Sep 2020 17:59:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.295.801 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kNI1g-0003yu-GS; Tue, 29 Sep 2020 15:58:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 295.801; Tue, 29 Sep 2020 15:58:48 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kNI1g-0003yV-D5; Tue, 29 Sep 2020 15:58:48 +0000
Received: by outflank-mailman (input) for mailman id 295;
 Tue, 29 Sep 2020 15:58:47 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=6Xo+=DG=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kNI1f-0003yQ-3B
 for xen-devel@lists.xenproject.org; Tue, 29 Sep 2020 15:58:47 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 67ad91e6-0f7a-4aad-9de0-309b11201590;
 Tue, 29 Sep 2020 15:58:46 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 5D49EAC12;
 Tue, 29 Sep 2020 15:58:45 +0000 (UTC)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=6Xo+=DG=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
	id 1kNI1f-0003yQ-3B
	for xen-devel@lists.xenproject.org; Tue, 29 Sep 2020 15:58:47 +0000
X-Inumbo-ID: 67ad91e6-0f7a-4aad-9de0-309b11201590
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 67ad91e6-0f7a-4aad-9de0-309b11201590;
	Tue, 29 Sep 2020 15:58:46 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1601395125;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/l9BTQ7C7IVbJ37jj+0h9h54II2l5dsJf6Z3k3JX/XA=;
	b=U+cOrBJdj4VvUJPfxmXcx/E42R8smeVDCXDAXi5O1PwOvNlUaSTYhdTe2ILfXGcer4zy0+
	SFBeUXceP4h8z9WjEhO4rgv9OQlKVRKvw4Cx8ECRvzn8IlcXiyM01uZRq1d/XxkBv0rT8d
	Tyj0RTcbek+sy8HnaEAwS+/829FI3Ho=
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 5D49EAC12;
	Tue, 29 Sep 2020 15:58:45 +0000 (UTC)
Subject: Re: [PATCH 02/12] evtchn: avoid race in get_xen_consumer()
To: paul@xen.org
Cc: xen-devel@lists.xenproject.org,
 'Andrew Cooper' <andrew.cooper3@citrix.com>,
 'George Dunlap' <George.Dunlap@eu.citrix.com>,
 'Ian Jackson' <iwj@xenproject.org>, 'Julien Grall' <julien@xen.org>,
 'Wei Liu' <wl@xen.org>, 'Stefano Stabellini' <sstabellini@kernel.org>
References: <0d5ffc89-4b04-3e06-e950-f0cb171c7419@suse.com>
 <b8f87009-ba1a-dfaf-e130-03c5500f76c4@suse.com>
 <001f01d69677$6c03c7b0$440b5710$@xen.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <8a5f0a8c-7033-6601-af4c-1e077fbd1cc6@suse.com>
Date: Tue, 29 Sep 2020 17:58:43 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <001f01d69677$6c03c7b0$440b5710$@xen.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 29.09.2020 17:44, Paul Durrant wrote:
>> From: Xen-devel <xen-devel-bounces@lists.xenproject.org> On Behalf Of Jan Beulich
>> Sent: 28 September 2020 11:57
>>
>> @@ -81,7 +82,7 @@ static uint8_t get_xen_consumer(xen_even
>>      for ( i = 0; i < ARRAY_SIZE(xen_consumers); i++ )
>>      {
>>          if ( xen_consumers[i] == NULL )
>> -            xen_consumers[i] = fn;
>> +            (void)cmpxchg(&xen_consumers[i], NULL, fn);
>>          if ( xen_consumers[i] == fn )
> 
> Why not use the return from cmpxchg() to determine success and break
> out of the loop rather than re-accessing the global array?

That's an option, in which case I wouldn't be sure anymore whether
adding __read_mostly to the definition of xen_consumers[] is
appropriate. This way, otoh, the (LOCKed on x86) write isn't even
attempted when the slot already holds non-NULL.

Jan

