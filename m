Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A9B363C7170
	for <lists+xen-devel@lfdr.de>; Tue, 13 Jul 2021 15:47:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.155378.286815 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m3Ik4-0004f2-AN; Tue, 13 Jul 2021 13:46:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 155378.286815; Tue, 13 Jul 2021 13:46:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m3Ik4-0004cb-6n; Tue, 13 Jul 2021 13:46:32 +0000
Received: by outflank-mailman (input) for mailman id 155378;
 Tue, 13 Jul 2021 13:46:30 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ZPIt=MF=cs.pub.ro=costin.lupu@srs-us1.protection.inumbo.net>)
 id 1m3Ik2-0004cV-HW
 for xen-devel@lists.xenproject.org; Tue, 13 Jul 2021 13:46:30 +0000
Received: from mx.upb.ro (unknown [141.85.13.231])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id b8da5cea-e3e0-11eb-875d-12813bfff9fa;
 Tue, 13 Jul 2021 13:46:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by mx.upb.ro (Postfix) with ESMTP id 6D530B560070;
 Tue, 13 Jul 2021 16:46:27 +0300 (EEST)
Received: from mx.upb.ro ([127.0.0.1])
 by localhost (mx.upb.ro [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id vdXjRt43a79H; Tue, 13 Jul 2021 16:46:24 +0300 (EEST)
Received: from localhost (localhost [127.0.0.1])
 by mx.upb.ro (Postfix) with ESMTP id BA062B56009C;
 Tue, 13 Jul 2021 16:46:24 +0300 (EEST)
Received: from mx.upb.ro ([127.0.0.1])
 by localhost (mx.upb.ro [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id zM1_ZrPGeOW0; Tue, 13 Jul 2021 16:46:24 +0300 (EEST)
Received: from [192.168.1.35] (unknown [82.78.48.206])
 by mx.upb.ro (Postfix) with ESMTPSA id 7252DB560070;
 Tue, 13 Jul 2021 16:46:23 +0300 (EEST)
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
X-Inumbo-ID: b8da5cea-e3e0-11eb-875d-12813bfff9fa
X-Virus-Scanned: amavisd-new at upb.ro
Subject: Re: [PATCH] stubdom: foreignmemory: Fix build after 0dbb4be739c5
To: Julien Grall <julien@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org
Cc: Julien Grall <jgrall@amazon.com>, Ian Jackson <iwj@xenproject.org>,
 Wei Liu <wl@xen.org>, Jan Beulich <jbeulich@suse.com>
References: <20210713092019.7379-1-julien@xen.org>
 <0698e4b1-8fb9-919e-e9a2-1b135a808e3e@suse.com>
 <d84bb0ca-ff51-2def-3826-c0a921ec1835@citrix.com>
 <fb6cc1b7-37b4-1819-6f6f-ebf96aefe00e@xen.org>
 <756ba923-17a6-0889-cc7e-bcd43a5eb258@citrix.com>
 <3505f2da-4c41-f5ca-d775-814d038d5bad@xen.org>
 <badec201-6719-844e-2a07-6508e891ca3e@citrix.com>
 <3c819563-b354-5527-050d-f698324d6021@xen.org>
From: Costin Lupu <costin.lupu@cs.pub.ro>
Message-ID: <c299355b-c031-3efd-ef97-671bd102809b@cs.pub.ro>
Date: Tue, 13 Jul 2021 16:46:23 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <3c819563-b354-5527-050d-f698324d6021@xen.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi guys,

On 7/13/21 4:00 PM, Julien Grall wrote:
>=20
>=20
> On 13/07/2021 13:39, Andrew Cooper wrote:
>> On 13/07/2021 12:53, Julien Grall wrote:
>>> Hi Andrew,
>>>
>>> On 13/07/2021 12:23, Andrew Cooper wrote:
>>>> On 13/07/2021 12:21, Julien Grall wrote:
>>>>> Hi Andrew,
>>>>>
>>>>> On 13/07/2021 10:35, Andrew Cooper wrote:
>>>>>> On 13/07/2021 10:27, Juergen Gross wrote:
>>>>>>> On 13.07.21 11:20, Julien Grall wrote:
>>>>>>>> From: Julien Grall <jgrall@amazon.com>
>>>>>>>>
>>>>>>>> Commit 0dbb4be739c5 add the inclusion of xenctrl.h from private.=
h
>>>>>>>> and
>>>>>>>> wreck the build in an interesting way:
>>>>>>>>
>>>>>>>> In file included from xen/stubdom/include/xen/domctl.h:39:0,
>>>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 from xen/tools/inc=
lude/xenctrl.h:36,
>>>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 from private.h:4,
>>>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 from minios.c:29:
>>>>>>>> xen/include/public/memory.h:407:5: error: expected
>>>>>>>> specifier-qualifier-list before =E2=80=98XEN_GUEST_HANDLE_64=E2=80=
=99
>>>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 XEN_GUEST_HANDL=
E_64(const_uint8) buffer;
>>>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ^~~~~~~~~~~~~~~=
~~~~
>>>>>>>>
>>>>>>>> This is happening because xenctrl.h defines __XEN_TOOLS__ and
>>>>>>>> therefore
>>>>>>>> the public headers will start to expose the non-stable ABI.
>>>>>>>> However,
>>>>>>>> xen.h has already been included by a mini-OS header before hand.=
 So
>>>>>>>> there is a mismatch in the way the headers are included.
>>>>>>>>
>>>>>>>> For now solve it in a very simple (and gross) way by including
>>>>>>>> xenctrl.h before the mini-os headers.
>>>>>>>>
>>>>>>>> Fixes: 0dbb4be739c5 ("tools/libs/foreignmemory: Fix PAGE_SIZE
>>>>>>>> redefinition error")
>>>>>>>> Signed-off-by: Julien Grall <jgrall@amazon.com>
>>>>>>>>
>>>>>>>> ---
>>>>>>>>
>>>>>>>> Cc: Andrew Cooper <andrew.cooper3@citrix.com>
>>>>>>>>
>>>>>>>> I couldn't find a better way with would not result to revert the
>>>>>>>> patch
>>>>>>>> (and break build on some system) or involve a longer rework of t=
he
>>>>>>>> headers.
>>>>>>>
>>>>>>> Just adding a "#define __XEN_TOOLS__" before the #include stateme=
nts
>>>>>>> doesn't work?
>>>>>>
>>>>>> Not really, no.
>>>>>>
>>>>>> libxenforeignmem has nothing at all to do with any Xen unstable
>>>>>> interfaces.=C2=A0 Including xenctrl.h in the first place was wrong=
,
>>>>>> because
>>>>>> it is an unstable library.=C2=A0 By extension, the use of XC_PAGE_=
SIZE is
>>>>>> also wrong.
>>>>>
>>>>> Well... Previously we were using PAGE_SIZE which is just plain wron=
g
>>>>> on Arm.
>>>>>
>>>>> At the moment, we don't have a way to query the page granularity of
>>>>> the hypervisor. But we know it can't change because of the way the
>>>>> current ABI was designed. Hence why using XC_PAGE_SIZE is the best =
of
>>>>> option we had until we go to ABIv2.
>>>>
>>>> Still doesn't mean that XC_PAGE_SIZE was ok to use.
>>>
>>> Note that I wrote "best of the option". The series has been sitting
>>> for ages with no-one answering... You could have provided your option
>>> back then if you thought it wasn't a good use...
>>
>> On a series I wasn't even CC'd on?
>=20
> You had the link on IRC because we discussed it.
>=20
>>
>> And noone had even bothered to compile test?
>=20
> Well, that was a mistake. At the same time, if it compiled the "issue"
> you describe would have gone unnoticed. ;)
>=20
>>>
>>>>
>>>> Sounds like the constant needs moving into the Xen public headers, a=
nd
>>>> the inclusions of xenctrl.h into stable libraries needs reverting.
>>>
>>> This could work. Are you planning to work on it?
>>
>> No.=C2=A0 I don't have enough time to do my own work thanks to all the=
 CI
>> breakage and regressions being committed.
>> This needs fixing, or the original series reverting for 4.16 because t=
he
>> current form (with or without this emergency build fix) isn't acceptab=
le
>> to release with.
> I disagree with this caracterization. Yes, this is including a
> non-stable header but it doesn't link with non-stable library.
>=20
> In fact, reverting the series will bring back two issues:
> =C2=A0 1) Xen tools will not build on all the distros
> =C2=A0 2) Using PAGE_{SIZE, SHIFT} break arm tools because the userspac=
e is
> not meant to rely on a given kernel page granularity.
>=20
> So this doesn't look like a priority for 4.16. Although, it would be a
> nice clean-up to have so the libraries are more compliant.

First of all, sorry for breaking the build.

As Jan already suggested on a different thread, we can fix this by
isolating the XC_PAGE_* definitions of the toolstack in a header of
their own. I'm open to suggestions regarding the name of the header (my
suggestion would be xenctrl_page.h) and path (I guess it should be in
tools/include, right?). Also, should we change the names of the macros
from XC_PAGE_* to something else in order to reflect that they are
toolstack related instead of xenctrl specific?

@Andrew: Can you please tell me why XC_PAGE_SIZE wasn't ok to use? I'm
asking this in order to fully understand the issue.


Cheers,
Costin

