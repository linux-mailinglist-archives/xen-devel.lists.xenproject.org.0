Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CAA1F1BDA15
	for <lists+xen-devel@lfdr.de>; Wed, 29 Apr 2020 12:50:03 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jTkHV-0008IP-U2; Wed, 29 Apr 2020 10:49:33 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=fvgr=6N=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1jTkHV-0008IK-3x
 for xen-devel@lists.xenproject.org; Wed, 29 Apr 2020 10:49:33 +0000
X-Inumbo-ID: 1b6a55b6-8a07-11ea-ae69-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 1b6a55b6-8a07-11ea-ae69-bc764e2007e4;
 Wed, 29 Apr 2020 10:49:32 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 363C3ABAD;
 Wed, 29 Apr 2020 10:49:30 +0000 (UTC)
Subject: Re: [PATCH] tools/xenstore: don't store domU's mfn of ring page in
 xensotred
To: Igor Druzhinin <igor.druzhinin@citrix.com>, Julien Grall
 <julien@xen.org>, Julien Grall <julien.grall.oss@gmail.com>
References: <20200428155144.8253-1-jgross@suse.com>
 <CAJ=z9a0WfWQs+UJ-t4Kt6PGGdNnA2kMeK5p8bNnDT_eFcpDiiQ@mail.gmail.com>
 <d1c41bd7-676e-c50a-416d-c62efcbdd41d@suse.com>
 <76ed29d6-e2fc-cd48-6de7-e0032daaa2e9@xen.org>
 <3fd79cb1-e18f-1987-69ff-94f1bd15c66f@citrix.com>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <3dcbe001-c66c-13a6-7a28-ef24b05eefa0@suse.com>
Date: Wed, 29 Apr 2020 12:49:28 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <3fd79cb1-e18f-1987-69ff-94f1bd15c66f@citrix.com>
Content-Type: text/plain; charset=utf-8; format=flowed
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
Cc: xen-devel <xen-devel@lists.xenproject.org>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Wei Liu <wl@xen.org>,
 "andrew.cooper3@citrix.com" <andrew.cooper3@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 29.04.20 12:39, Igor Druzhinin wrote:
> On 29/04/2020 10:22, Julien Grall wrote:
>> Hi Juergen,
>>
>> On 29/04/2020 06:51, Jürgen Groß wrote:
>>>
>>> Recreating the event channel would be fine, but I don't see why it
>>> would ever be needed. And XS_INTRODUCE is called only at domain creation
>>> time today, so there is obviously no need for repeating this call.
>>>
>>> Maybe the idea was to do this after sending a XS_RESUME command, which
>>> isn't used anywhere in Xen and is another part of Xenstore which doesn't
>>> make any sense today.
>>
>> Commit f6cc37ea8ac71385b60507c034519f304da75f4c "tools/oxenstored: port XS_INTRODUCE evtchn rebind function from cxenstored" added the exact same behavior in the OCaml XenStored last year.
>>
>> This was introduced 12 years after C XenStored, so surely someone think this is useful. We should check why this was introduced in OCaml XenStored (I have CCed the author of the patch).
>>
>> If we still think this is not useful, then you should add an explanation in the commit message why the two implementations diverge and possibly update the spec.
> 
> Thanks for CC, Julien.
> 
> We indeed already use this functionality in our toolstack for guest kdump
> functions. It's not possible in XAPI to adopt libxl model where almost everything
> is restarted for a domain entering kdump, so we have to use this message to
> rebind xenstore evtchn after soft reset without shutting down backends and
> recreating the whole subtree (frontends reconnect fine after that).
> 
> We obviously only require it for now to be present in oxenstored only.
> Please don't remove this functionality if possible.

If I read handling in libxl correctly, in the soft reset case XS_RELEASE
is issued before doing another XS_INTRODUCE. XS_RELEASE will result in
xenstored throwing away its related struct domain, so XS_INTRODUCE will
be possible again.


Juergen

