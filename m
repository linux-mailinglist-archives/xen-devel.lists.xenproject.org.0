Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B2C3434E76D
	for <lists+xen-devel@lfdr.de>; Tue, 30 Mar 2021 14:22:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.103491.197399 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lRDO9-0000aX-F4; Tue, 30 Mar 2021 12:22:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 103491.197399; Tue, 30 Mar 2021 12:22:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lRDO9-0000aB-Bs; Tue, 30 Mar 2021 12:22:29 +0000
Received: by outflank-mailman (input) for mailman id 103491;
 Tue, 30 Mar 2021 12:22:27 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=2mYN=I4=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lRDO7-0000a5-Su
 for xen-devel@lists.xenproject.org; Tue, 30 Mar 2021 12:22:27 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 28b27e74-65d5-41cf-9fce-7c21755e646a;
 Tue, 30 Mar 2021 12:22:26 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id B6E44B2EE;
 Tue, 30 Mar 2021 12:22:25 +0000 (UTC)
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
X-Inumbo-ID: 28b27e74-65d5-41cf-9fce-7c21755e646a
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1617106945; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=li4m7mODyLbprHpdbk3kHygACurZtoEb8msRDSDta9Y=;
	b=geGUb3wiTWZBE/D52h5X7cFkxUBV2W2gLRHzSkAGHXRvxuaDQg50amYpcA4ggeZJuKM+oY
	EMecWRIMWwFe25e81sEkiJVI3lczTmE8omyWF7Yg+197SRzU7dAr9dcbBkP1iWqn7j/GJ8
	SqeefXqc78dEGaKIoAWVuP6O4qajIcY=
Subject: Re: [PATCH 0/4][4.15?] VT-d: mostly S3 related corrections
To: Ian Jackson <iwj@xenproject.org>
Cc: "Tian, Kevin" <kevin.tian@intel.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <c19fe2b5-b682-374c-d30f-83fb8b367286@suse.com>
 <MWHPR11MB1886A8DBD8B93A612A1B09958C649@MWHPR11MB1886.namprd11.prod.outlook.com>
 <35150558-6a4a-d6bb-b51a-4e2bf37e5ae5@suse.com>
 <24665.61184.783407.462294@mariner.uk.xensource.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <09dd3b00-100e-276c-837c-e66eabac4c68@suse.com>
Date: Tue, 30 Mar 2021 14:22:25 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.0
MIME-Version: 1.0
In-Reply-To: <24665.61184.783407.462294@mariner.uk.xensource.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 23.03.2021 14:37, Ian Jackson wrote:
> Jan Beulich writes ("Re: [PATCH 0/4][4.15?] VT-d: mostly S3 related corrections"):
>> Thanks Kevin. Ian - what are your thoughts here towards 4.15?
> 
> I looked at these four patches.
> 
> In general I am not sure of the implications.  There are two important
> sets of implications: (i) upside: what is the bug this fixes and how
> severe is that bug *in its actual impact on users of Xen* (ii) what
> possible problems might there be and how have we made sure that the
> patch is right ?
> 
> I want look at this not from the point of view of technical details
> but in terms of user impact.  User impact is harder to predict but it
> is what we actually care about.
> 
> For one of the patches it seemed obvious to me that there was very
> little downside risk and the upside is not corrupting something
> (perhaps something important).
> 
> For the others, all I could see, besides the general statement that
> these aren't regressions, there was a lot of intensive discussion in
> the commit messages of the specific technical details.  Frankly, that
> all went quite over my head.
> 
> I would be prepared to give a release ack for the others if I can be
> convinced of satisfactory answers to my questions (i) and (ii).  For
> an idea of what kind of answer I'm looking for, see the kind of thing
> Roger has been putting in his 4.15-targeted patches.  The more complex
> and to-me-impenetrable the underlying technical details the more
> sceptical I will be :-).
> 
> I hope that makes sense.

Of course it does, and I'm sorry that I get to replying only now. Since
I didn't think I could make points towards these patches being important
enough to take at this point, I didn't see a point in making this a high
priority. Nevertheless, to address your requests:

(i) Very hard to tell. Patch 4 at least very likely is no more than a
"just in case" fix. The other two patches address issues where after
resume IOMMU faults may not work correctly anymore or where, if there
were any faults to be delivered while resuming, those may not get
delivered / handled correctly ("unpredictable behavior" is probably the
best description I could come up with). Users (admins) therefore may
not become aware of there being issues on their system / with one or
more of the guests.

(ii) I've tested that things still work on a system where S3 halfway
works. Beyond that I'm afraid it really was staring at the code that
both made me notice the issues and makes me believe things at least
aren't worse with the patches in place.

I'm intending to commit these to staging now, but not to 4.15-staging.
I'll queue them for backporting, though, as indicated previously.

Jan

