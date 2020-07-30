Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8137923395E
	for <lists+xen-devel@lfdr.de>; Thu, 30 Jul 2020 21:53:42 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k1EcA-00051D-Eg; Thu, 30 Jul 2020 19:53:18 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=HZLI=BJ=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1k1Ec9-000516-0i
 for xen-devel@lists.xenproject.org; Thu, 30 Jul 2020 19:53:17 +0000
X-Inumbo-ID: 4e29fdaa-d29e-11ea-ab1a-12813bfff9fa
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 4e29fdaa-d29e-11ea-ab1a-12813bfff9fa;
 Thu, 30 Jul 2020 19:53:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1596138794;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=wf+fhMOVf1vvOkTyouZrdEt+26wjL/aBc/DrRpUDK0Y=;
 b=SYnhJ+ltlbHuyml+l2f+lUg5RFJOTpIyuDlNqIm+D/ZnNbThxxQ+xGgr
 f7iwbKzHnb+hWUyK7hg7UE/+jrrtuEAYF2KfKDdb3IYKAWGRa0DfB5H34
 EVTg9Jy87L7PJJ8p1y2j2P+H/laGCHZDcJPSR8gZMfnf0b9LMCmO76IbW I=;
Authentication-Results: esa5.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: nqnJxs+Xpx7NxZTh8AWiEtTmjTO27dOHGkZygQHHS0P+9CUccpL9tymdiTLvS2RxAmEKPWgHwW
 OR/ZZyOWQcfS1V13EAlyEiEJK6mqkNB3xNckX4+oOkqJQaKMXFduBL5YCOenhpW8UvlIWH/wOs
 XauWjqJ6VY3BQxDBtZfKN0FXVIQTyBejEbTWIBnmsKf0vzBaqWI3Ut0LwQUtbYBgTOQNuX62j/
 PtbyKXmyF4iQ6TZkWNCMa6A0oi6sM5T/sGvKjdH6V7hexG5BYffX5yMX5IwnIz8QIWxvUJA4uy
 Iek=
X-SBRS: 2.7
X-MesageID: 23761758
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.75,415,1589256000"; d="scan'208";a="23761758"
Subject: Re: [PATCH 4/5] xen/memory: Fix acquire_resource size semantics
To: Julien Grall <julien@xen.org>, <paul@xen.org>, 'Xen-devel'
 <xen-devel@lists.xenproject.org>
References: <20200728113712.22966-1-andrew.cooper3@citrix.com>
 <20200728113712.22966-5-andrew.cooper3@citrix.com>
 <002b01d6664b$c7eb5f40$57c21dc0$@xen.org>
 <d0c00a30-2f72-036e-d574-a82e96ea79ea@xen.org>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <7b7aae0d-35d8-8bfa-7352-8e3c58873964@citrix.com>
Date: Thu, 30 Jul 2020 20:53:10 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <d0c00a30-2f72-036e-d574-a82e96ea79ea@xen.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
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
Cc: 'Stefano Stabellini' <sstabellini@kernel.org>,
 'Hubert Jasudowicz' <hubert.jasudowicz@cert.pl>, 'Wei Liu' <wl@xen.org>,
 'Konrad Rzeszutek Wilk' <konrad.wilk@oracle.com>,
 'George Dunlap' <George.Dunlap@eu.citrix.com>,
 =?UTF-8?B?J01pY2hhxYIgTGVzemN6ecWEc2tpJw==?= <michal.leszczynski@cert.pl>,
 'Jan Beulich' <JBeulich@suse.com>, 'Ian Jackson' <ian.jackson@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 30/07/2020 13:54, Julien Grall wrote:
> Hi Paul,
>
> On 30/07/2020 09:31, Paul Durrant wrote:
>>> diff --git a/xen/common/memory.c b/xen/common/memory.c
>>> index dc3a7248e3..21edabf9cc 100644
>>> --- a/xen/common/memory.c
>>> +++ b/xen/common/memory.c
>>> @@ -1007,6 +1007,26 @@ static long xatp_permission_check(struct
>>> domain *d, unsigned int space)
>>>       return xsm_add_to_physmap(XSM_TARGET, current->domain, d);
>>>   }
>>>
>>> +/*
>>> + * Return 0 on any kind of error.  Caller converts to -EINVAL.
>>> + *
>>> + * All nonzero values should be repeatable (i.e. derived from some
>>> fixed
>>> + * proerty of the domain), and describe the full resource (i.e.
>>> mapping the
>>
>> s/property/property
>>
>>> + * result of this call will be the entire resource).
>>
>> This precludes dynamically adding a resource to a running domain. Do
>> we really want to bake in that restriction?
>
> AFAICT, this restriction is not documented in the ABI. In particular,
> it is written:
>
> "
> The size of a resource will never be zero, but a nonzero result doesn't
> guarentee that a subsequent mapping request will be successful.  There
> are further type/id specific constraints which may change between the
> two calls.
> "
>
> So I think a domain couldn't rely on this behavior. Although, it might
> be good to clarify in the comment on top of resource_max_frames that
> this an implementation decision and not part of the ABI.

There are two aspects here.

First, yes - I deliberately didn't state it in the ABI, just in case we
might want to use it in the future.  I could theoretically foresee using
-EBUSY for the purpose.

That said however, we are currently deliberately taking dynamic
resources out of Xen, because they've proved to be unnecessary in
practice and a fertile source of complexity and security bugs.

I don't foresee accepting new dynamic resources, but that's not to say
that someone can't theoretically come up with a sufficiently compelling
counterexample.

~Andrew

