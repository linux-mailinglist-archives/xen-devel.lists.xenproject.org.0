Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 149B936DEF5
	for <lists+xen-devel@lfdr.de>; Wed, 28 Apr 2021 20:28:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.119539.226053 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lbouV-0001eq-9d; Wed, 28 Apr 2021 18:27:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 119539.226053; Wed, 28 Apr 2021 18:27:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lbouV-0001eT-6X; Wed, 28 Apr 2021 18:27:43 +0000
Received: by outflank-mailman (input) for mailman id 119539;
 Wed, 28 Apr 2021 18:27:42 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=mtt6=JZ=cs.pub.ro=costin.lupu@srs-us1.protection.inumbo.net>)
 id 1lbouU-0001eO-3r
 for xen-devel@lists.xenproject.org; Wed, 28 Apr 2021 18:27:42 +0000
Received: from mx.upb.ro (unknown [141.85.13.200])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id f1c280a2-84b6-4663-b8c0-2f6994f3e896;
 Wed, 28 Apr 2021 18:27:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by mx.upb.ro (Postfix) with ESMTP id 14D33B560061;
 Wed, 28 Apr 2021 21:27:39 +0300 (EEST)
Received: from mx.upb.ro ([127.0.0.1])
 by localhost (mx.upb.ro [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id MWgPoSrfEsNY; Wed, 28 Apr 2021 21:27:37 +0300 (EEST)
Received: from localhost (localhost [127.0.0.1])
 by mx.upb.ro (Postfix) with ESMTP id 1244DB56006C;
 Wed, 28 Apr 2021 21:27:37 +0300 (EEST)
Received: from mx.upb.ro ([127.0.0.1])
 by localhost (mx.upb.ro [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id c3xTvHpBNZob; Wed, 28 Apr 2021 21:27:36 +0300 (EEST)
Received: from [192.168.1.35] (unknown [188.25.174.245])
 by mx.upb.ro (Postfix) with ESMTPSA id 69AA1B560061;
 Wed, 28 Apr 2021 21:27:36 +0300 (EEST)
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
X-Inumbo-ID: f1c280a2-84b6-4663-b8c0-2f6994f3e896
X-Virus-Scanned: amavisd-new at upb.ro
Subject: Re: [PATCH 3/5] tools/libs/foreignmemory: Fix PAGE_SIZE redefinition
 error
To: Julien Grall <julien@xen.org>, xen-devel@lists.xenproject.org
Cc: Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>
References: <cover.1619524463.git.costin.lupu@cs.pub.ro>
 <b9a300edca034d44375d8b16d352110186657e75.1619524463.git.costin.lupu@cs.pub.ro>
 <8803561c-b3bd-4979-f9ef-3f58542af70b@xen.org>
From: Costin Lupu <costin.lupu@cs.pub.ro>
Message-ID: <7c465859-5af3-3d9f-81f4-2062b29e57f0@cs.pub.ro>
Date: Wed, 28 Apr 2021 21:27:36 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.0
MIME-Version: 1.0
In-Reply-To: <8803561c-b3bd-4979-f9ef-3f58542af70b@xen.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi Julien,

On 4/28/21 12:03 PM, Julien Grall wrote:
> Hi Costin,
>=20
> On 27/04/2021 13:05, Costin Lupu wrote:
>> =C2=A0 tools/libs/foreignmemory/private.h | 6 ++++--
>> =C2=A0 1 file changed, 4 insertions(+), 2 deletions(-)
>>
>> diff --git a/tools/libs/foreignmemory/private.h
>> b/tools/libs/foreignmemory/private.h
>> index 1ee3626dd2..f3c1ba2867 100644
>> --- a/tools/libs/foreignmemory/private.h
>> +++ b/tools/libs/foreignmemory/private.h
>> @@ -10,11 +10,13 @@
>> =C2=A0 #include <xen/xen.h>
>> =C2=A0 #include <xen/sys/privcmd.h>
>> =C2=A0 -#ifndef PAGE_SHIFT /* Mini-os, Yukk */
>> +#ifndef PAGE_SHIFT
>> =C2=A0 #define PAGE_SHIFT=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 12
>> =C2=A0 #endif
>> -#ifndef __MINIOS__ /* Yukk */
>> +#ifndef PAGE_SIZE
>> =C2=A0 #define PAGE_SIZE=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 (1UL << PAGE_SHIFT)
>> +#endif
>> +#ifndef PAGE_MASK
>> =C2=A0 #define PAGE_MASK=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 (~(PAGE_SIZE-1))
>> =C2=A0 #endif
>=20
> Looking at the usage, I believe PAGE_* are referring to the page
> granularity of Xen rather than the page granularity of the control
> domain itself.
>=20
> So it would be incorrect to use the domain's page granularity here and
> would break dom0 using 64KB page granularity on Arm.
>=20
> Instead, we should replace PAGE_* with XC_PAGE_*. If some of them are
> still referring to the control domain granularity, then we should use
> getpageshift() (Or equivalent) because the userspace shouldn't rely on =
a
> specific page granularity.

Yes, this makes sense. One thing I need to clarify: what does XC stand
for? I thought for some time it stands for Xen Control.

Thanks,
Costin

