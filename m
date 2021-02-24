Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 810C6323D95
	for <lists+xen-devel@lfdr.de>; Wed, 24 Feb 2021 14:18:47 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.89344.168195 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lEu3i-0000u2-0L; Wed, 24 Feb 2021 13:18:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 89344.168195; Wed, 24 Feb 2021 13:18:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lEu3h-0000td-Rz; Wed, 24 Feb 2021 13:18:29 +0000
Received: by outflank-mailman (input) for mailman id 89344;
 Wed, 24 Feb 2021 13:18:28 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=F+xl=H2=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lEu3g-0000tY-8b
 for xen-devel@lists.xenproject.org; Wed, 24 Feb 2021 13:18:28 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 9adaf885-4109-4620-b347-ead4e3489e27;
 Wed, 24 Feb 2021 13:18:27 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 73DBDAD5C;
 Wed, 24 Feb 2021 13:18:26 +0000 (UTC)
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
X-Inumbo-ID: 9adaf885-4109-4620-b347-ead4e3489e27
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1614172706; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=5LadqBTx+fAQ0EzrCO+T9ATM2OUQsGoXznpJ3/ie3Qo=;
	b=CvsvUe6X6cy/nJcp/qBEl8CpJUzGN0wE+eaDzTaBA/enr+olVRfLlKnszYAmeHrB9NKUiu
	k2PT5xm+jetGruhCLcMnqVCqD8RKWYDl+RnuCQtYV72guQgMep9bpkzz49pgJI6BLI3YZs
	KASoajUZffZLwQPUGL9UrOVB6IGBjVs=
Subject: Re: [PATCH v2 0/8] x86/PV: avoid speculation abuse through guest
 accessors
To: Ian Jackson <iwj@xenproject.org>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>
References: <b466a19e-e547-3c7c-e39b-1a4c848a053a@suse.com>
 <24623.56913.290437.499946@mariner.uk.xensource.com>
 <ce93bd48-7ef3-cdb1-9429-ccd894895e9e@suse.com>
 <24630.20427.917602.787877@mariner.uk.xensource.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <c7fe2872-626c-1bd9-02f2-572ce81eabbe@suse.com>
Date: Wed, 24 Feb 2021 14:18:25 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <24630.20427.917602.787877@mariner.uk.xensource.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 24.02.2021 14:08, Ian Jackson wrote:
> Jan Beulich writes ("Re: [PATCH v2 0/8] x86/PV: avoid speculation abuse through guest accessors"):
>> On 19.02.2021 16:50, Ian Jackson wrote:
>>> Jan Beulich writes ("[PATCH v2 0/8] x86/PV: avoid speculation abuse through guest accessors"):
>>>> 4: rename {get,put}_user() to {get,put}_guest()
>>>> 5: gdbsx: convert "user" to "guest" accesses
>>>> 6: rename copy_{from,to}_user() to copy_{from,to}_guest_pv()
>>>> 7: move stac()/clac() from {get,put}_unsafe_asm() ...
>>>> 8: PV: use get_unsafe() instead of copy_from_unsafe()
>>>
>>> These have not got a maintainer review yet.  To grant a release-ack
>>> I'd like an explanation of the downsides and upsides of taking this
>>> series in 4.15 ?
>>>
>>> You say "consistency" but in practical terms, what will happen if the
>>> code is not "conxistent" in this sense ?
>>>
>>> I'd also like to hear from aother hypervisor maintainer.
>>
>> Meanwhile they have been reviewed by Roger. Are you willing to
>> give them, perhaps with the exception of 7, a release ack as
>> well?
> 
> Sorry, yes.
> 
> I found these explanations convincing  Thank you.
> 
> For all except 7,
> Release-Acked-by: Ian Jackson <iwj@xenproject.org>

Thanks.

> For 7, I remember what I think was an IRC conversation where someone
> (you, I think) said you had examined the generated asm and it was
> unchanged.

It was in email, and I've inspected only some example of the
generated asm, not all instances. I would hope that was
sufficient, but since I'm not entirely certain ...

> If I have remembered that correctly, then for 7 as well:
> Release-Acked-by: Ian Jackson <iwj@xenproject.org>

... I'll better wait for explicit confirmation of this.

Jan

