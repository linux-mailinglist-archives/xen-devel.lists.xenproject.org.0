Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4708B303773
	for <lists+xen-devel@lfdr.de>; Tue, 26 Jan 2021 08:47:25 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.74644.134148 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l4J4A-0004Lt-2Z; Tue, 26 Jan 2021 07:47:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 74644.134148; Tue, 26 Jan 2021 07:47:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l4J49-0004LU-VW; Tue, 26 Jan 2021 07:47:09 +0000
Received: by outflank-mailman (input) for mailman id 74644;
 Tue, 26 Jan 2021 07:47:09 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ElsB=G5=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1l4J49-0004LP-4q
 for xen-devel@lists.xenproject.org; Tue, 26 Jan 2021 07:47:09 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 98550fd1-130f-4720-911b-ec4d34664f43;
 Tue, 26 Jan 2021 07:47:08 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 24A9AADD6;
 Tue, 26 Jan 2021 07:47:07 +0000 (UTC)
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
X-Inumbo-ID: 98550fd1-130f-4720-911b-ec4d34664f43
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1611647227; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=05TI/LbH1TkAQncD73H4V2pFWpEiY3ytCnf759tyVOc=;
	b=eLN0ZyBKkhuM/QmgUOn7MoC2FSkPrECgL53xf3ZaT/l7jVNVLMMAi5JyZbipyIlz98VPV1
	KHlblwC6JrQ4HXX1ZtJmjJmpFviPvUFpkVxLtk+Cv7S86Hxc6rftXVTqmZJNTFDYwsDpSv
	G8pVhWHVEcqPHKPkFYDS0eJjkJWCK+I=
Subject: Re: [PATCH v2.5 1/5] libxenguest: support zstd compressed kernels
To: Ian Jackson <iwj@xenproject.org>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 M A Young <m.a.young@durham.ac.uk>
References: <aab9e3e6-5125-6b0a-6cd4-960fd783b1b2@suse.com>
 <f23d219f-ea52-e472-b95f-2a7e359d44cc@suse.com>
 <24590.44019.51460.33930@mariner.uk.xensource.com>
 <d541007c-9537-ba53-02f7-8ea90e9c89cf@suse.com>
 <24590.52459.194044.857442@mariner.uk.xensource.com>
 <6895299a-f2fd-7090-d0fa-dc7b2e54d1ba@suse.com>
 <24590.56183.458644.60628@mariner.uk.xensource.com>
 <6e988e9e-f8c2-13cb-79a4-1d8ae4e8a403@suse.com>
 <24590.61205.393750.544294@mariner.uk.xensource.com>
 <cd06d04f-f1c4-0087-b46e-34648585fb5a@suse.com>
 <24591.49.238509.216726@mariner.uk.xensource.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <9f2e20ae-ab61-329e-9894-7c6b964edfbf@suse.com>
Date: Tue, 26 Jan 2021 08:47:07 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <24591.49.238509.216726@mariner.uk.xensource.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 25.01.2021 18:30, Ian Jackson wrote:
> Jan Beulich writes ("Re: [PATCH v2.5 1/5] libxenguest: support zstd compressed kernels"):
>> On 25.01.2021 17:17, Ian Jackson wrote:
>>> I think we had concluded not to print a warning ?
>>
>> Yes. Even in the projected new form of using the construct I
>> don't intend to change the description's wording, as the
>> intended use of [true] still looks like that can't be intended
>> usage. IOW my remark extended beyond the warning; I'm sorry if
>> this did end up confusing because you were referring to just
>> the warning.
> 
> I'm afraid I don't understand what you mean.  In particular, what you
> mean by "the intended use of [true] still looks like that can't be
> intended usage".
> 
>   the intended {by whom for what puropose?} use of [true] still looks
>   like that {what?} can't be intended {by whom?} usage
> 
> I have the feeling that I have totally failed to grasp your mental
> model, which naturally underlies your comments.
> 
> Do you mean that with "true" for the 4th argument, the printed output
> is not correct, in the failure case ?  Maybe it needs a call to AC_MSG
> or something (but AIUI most of these PKG_* macros ought to do that for
> us).  I'm just guessing at your meaing here...

Well, I'm afraid I'm ending up confusing you because I'm confused
about the possible intentions here. My initial attempt to avoid
configure failing was to specify [] as the 4th argument. This, to
me, would have felt the half-way natural indication that I don't
mean anything to be done in the failure case, neither autoconf's
default nor anything else. [true], otoh, already feels like a
workaround for some shortcoming.

Anyway - I guess we should continue from v3, which I hope to post
later this morning.

Jan

