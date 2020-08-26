Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E34B7252C54
	for <lists+xen-devel@lfdr.de>; Wed, 26 Aug 2020 13:18:57 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kAtQx-0003tY-Ss; Wed, 26 Aug 2020 11:17:39 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=vb2W=CE=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kAtQw-0003tT-Eb
 for xen-devel@lists.xenproject.org; Wed, 26 Aug 2020 11:17:38 +0000
X-Inumbo-ID: e253d914-5f07-46ee-a81f-48319aad57f7
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id e253d914-5f07-46ee-a81f-48319aad57f7;
 Wed, 26 Aug 2020 11:17:37 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 960A7B1BE;
 Wed, 26 Aug 2020 11:18:07 +0000 (UTC)
Subject: Re: [PATCH] libxl: avoid golang building without CONFIG_GOLANG=y
To: George Dunlap <George.Dunlap@citrix.com>
Cc: Nick Rosbrook <rosbrookn@gmail.com>, Wei Liu <wl@xen.org>,
 Anthony Perard <anthony.perard@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Ian Jackson <Ian.Jackson@citrix.com>
References: <e8dd70a7-bdde-e12a-3f4d-f52e58016234@suse.com>
 <20200804141639.k2tpoqy7jj34gcm6@liuwe-devbox-debian-v2>
 <CAEBZRSf4opmGw2fDOCOMZLTtjisFXaP=Oe9aD6E2fTfUs2YFQQ@mail.gmail.com>
 <0deed4c6-ca87-09d3-a19c-ac0c00003cb7@suse.com>
 <20200804155043.vq7aupbrvmmcgzlv@liuwe-devbox-debian-v2>
 <12790d2b-020d-b6fe-4924-2233a4e93d83@suse.com>
 <20200804155707.rrtzkksrle2nojbj@liuwe-devbox-debian-v2>
 <43f706e4-0292-5758-eb19-9fbb99b1337e@suse.com>
 <CAEBZRSc=xUjYq7ao9Rv-EEJsjiBkt5mio5QofvixErZj_SJUcw@mail.gmail.com>
 <289981a3-9baf-bf6a-abbd-e4d613709f2a@suse.com>
 <20200824145849.GA8275@FED-nrosbr-BE.crux.rad.ainfosec.com>
 <3e6858f4-bb63-5533-c523-cffd13503f2c@suse.com>
 <B99E1A82-FBE8-4EE3-943A-4384BA504184@citrix.com>
 <ea3ab742-84e0-1e98-87ad-2e38b2224917@suse.com>
 <E62153E8-5EA8-46E5-AA12-6629F480A6BA@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <dbc62371-e8b3-980f-183e-96d98f4827e5@suse.com>
Date: Wed, 26 Aug 2020 13:17:38 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <E62153E8-5EA8-46E5-AA12-6629F480A6BA@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
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
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 26.08.2020 12:33, George Dunlap wrote:
> 
> 
>> On Aug 26, 2020, at 8:41 AM, Jan Beulich <jbeulich@suse.com> wrote:
>>
>> On 25.08.2020 12:37, George Dunlap wrote:
>>> As an explanation, there are a combination of things. You proposed A (remove the dependency), Ian proposed B (use move-if-changed), but we’re hoping to do C (have an external tree) before the next release.  I haven’t had the time to look into either B or C (nor, unfortunately, to review Nick’s submissions to other parts of the code — sorry Nick!); but I’ve still been reluctant to go for A.
>>>
>>> I think basically, unless someone is ready to tackle B or C immediately, we should just check in Jan’s fix (or probably better, just revert the patch that introduced the dependency).  It will be annoying to have to potentially fix up the generated golang bindings, but that puts the incentives in the right place.
>>
>> One additional aspect to consider is that I ran into the issue actually
>> in a 4.14 tree (because it just so happened that the timestamps of the
>> involved files were "right" for the problem to be hit), i.e. whatever
>> we decide to do will also end up needing backporting. To me this looks
>> to make A less attractive.
> 
> I don’t understand why?

Because you and Nick made clear that it's not the right way to deal with
the situation, i.e. I only consider this a band aid.

>  If it’s a regression in 4.14 functionality, we have to backport something to fix it one way or another.

Oh, yes, something will need backporting. But perhaps a more permanent
and/or appropriate solution?

> If we were going to leave the functionality the way it is, it might make sense to make it so that the dependency was triggered only on staging/master; the goal, after all, was to make sure that the generated files were updated when libxl_types.idl was updated during development.
> 
> BTW, one way to prevent this from happening would be to add a version of the build to the Gitlab CI loop which would build out-of-tree and fail in a similar manner.  If there had been such a test, this change would have been reverted immediately.

Not sure about this. For one, the out-of-tree aspect has got nothing
to do with it, I think. It's instead the read-only-ness of the
source file which matters. IOW I assume things would have worked
fine if I didn't keep my original source trees r/o at almost all
times (and hence the symlinks, when followed, make the files be
viewed as r/o in the build tree, too).

And then the timestamps matter, too. On a fresh clone (which is what
osstest uses afaik, and I guess which is also what's done in gitlab
CI), the two files quite likely would have matching ones, in which
case no re-build attempt would occur.

Jan

