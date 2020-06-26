Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DC5EC20B783
	for <lists+xen-devel@lfdr.de>; Fri, 26 Jun 2020 19:47:08 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1josQh-0001rW-RE; Fri, 26 Jun 2020 17:46:23 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=FAa2=AH=xen.org=julien@srs-us1.protection.inumbo.net>)
 id 1josQg-0001rP-4I
 for xen-devel@lists.xenproject.org; Fri, 26 Jun 2020 17:46:22 +0000
X-Inumbo-ID: f24575ca-b7d4-11ea-bb8b-bc764e2007e4
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id f24575ca-b7d4-11ea-bb8b-bc764e2007e4;
 Fri, 26 Jun 2020 17:46:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=jt4yZmJG7KXUCRdT6sM646MFKXBc143aigS0EWKAcCw=; b=aEVIYnOCu7+qUj+0Ji7n3Y1OxN
 aQWQKi8N4hudQQRVKHs+pzMSvT2JbKJLvaRRzh6Csxelgs4IMQvMUt5c53gCW/RXxVIetzJHRn7UR
 UCrBiwEEwJy951V7a5UueEqqKlI9+dRE7mk3j+s6zQd9AhTcfIdxCRkrPwCWLaefXapg=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1josQZ-0001Ud-Ex; Fri, 26 Jun 2020 17:46:15 +0000
Received: from [54.239.6.185] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1josQZ-0002LT-7a; Fri, 26 Jun 2020 17:46:15 +0000
Subject: Re: [PATCH v3 for-4.14] pvcalls: Document correctly and explicitely
 the padding for all arches
To: Ian Jackson <ian.jackson@citrix.com>
References: <20200613184132.11880-1-julien@xen.org>
 <alpine.DEB.2.21.2006151343430.9074@sstabellini-ThinkPad-T480s>
 <35c8373f-b691-d95e-17de-021c72faf216@xen.org>
 <alpine.DEB.2.21.2006161322210.24982@sstabellini-ThinkPad-T480s>
 <CAJ=z9a2cnMUiYBz+hA2_hjf5ShVh66tUwE9kbjqSM-H0TkTbyw@mail.gmail.com>
 <alpine.DEB.2.21.2006171146510.14005@sstabellini-ThinkPad-T480s>
 <cefe0cc7-5b1c-4ae2-a160-3857cc131a3d@xen.org>
 <24307.16713.764272.855818@mariner.uk.xensource.com>
From: Julien Grall <julien@xen.org>
Message-ID: <8335fa07-7610-2a40-36fc-49d6f900026c@xen.org>
Date: Fri, 26 Jun 2020 18:46:12 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
 Gecko/20100101 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <24307.16713.764272.855818@mariner.uk.xensource.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Juergen Gross <jgross@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Paul Durrant <paul@xen.org>, Andrew Cooper <Andrew.Cooper3@citrix.com>,
 Julien Grall <jgrall@amazon.com>, George Dunlap <George.Dunlap@citrix.com>,
 "committers@xenproject.org" <committers@xenproject.org>,
 Jan Beulich <jbeulich@suse.com>, xen-devel <xen-devel@lists.xenproject.org>,
 Roger Pau Monne <roger.pau@citrix.com>,
 Julien Grall <julien.grall.oss@gmail.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Hi Ian,

Thank you for your input!

On 24/06/2020 13:04, Ian Jackson wrote:
> Julien Grall writes ("Re: [PATCH v3 for-4.14] pvcalls: Document correctly and explicitely the padding for all arches"):
>> (+ Committers)
> ...
>> As Jan and you disagree on the approach, I would like to get more input.
>>
>> To summarize the discussion, the document for PV calls and the public
>> headers don't match when describing the padding. There is a disagreement
>> on which of the two are the authority and therefore which one to fix.
>>
>> Does anyone else have a preference on the approach?
> 
> Hi.
> 
>> [Jan:]
>>> I am leaning towards the header as authoritative because this has
>>> always been the case in the past and nothing in xen.git says
>>> otherwise. However I am not a user of pvcalls, so I don't really have
>>> any big incentive to go either way.
> 
> I think the practice of using headers as protocol specs is not a
> particularly good one.  Certainly my expectations anywhere outside the
> Xen Project is that if there's a doc, that is at the very least on par
> with any header file.  Of course there are possible compatibility
> implications:
> 
>> Yeah, we are risking breaking one set of users either way :-/
>> In reality, we are using pvcalls on arm64 in a new project (but it is
>> still very green). I am not aware of anybody using pvcalls on x86
>> (especially x86_32).
>>
>> I would prefer to honor the pvcalls.pandoc specification because that is
>> what it was meant to be, and also leads to a better protocol
>> specification.
> 
> pvcalls in Linux is Tech Preview / Experimental AFAICT ?  I think that
> means we can de jure change things like this.

SUPPORT.md suggests this is a Tech Preview, so I agree that we could 
still change the interface.

> 
> And it seems that we don't think there are any actual users who would
> experience compatibility problems.

Right, that's what Stefano suggested.

> 
> So I don't think the compatibility concerns are a reason not to change
> the header rather than the document.
> 
> So I think my conclusion is the same as Julien's: we should change the
> header to match the doc.

Ok, so you are on the same page as Stefano. I will revert to the v1 
change and rework the commit message then.

> 
>>>> For the future, I would highly suggest writing down the support
>>>> decision in xen.git. This would avoid such debate on what is the
>>>> authority...
>>>
>>> Yes that's the way to go
> 
> Maybe it would be worth putting a note somewhere in the headers saying
> the headers are provided for convenience but that the ABIs and
> protocols are as specified in the docs (at least where docs exist).

I will write a patch for it.

Cheers,

-- 
Julien Grall

