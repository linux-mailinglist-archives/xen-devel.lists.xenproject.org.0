Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 69A9039F6EC
	for <lists+xen-devel@lfdr.de>; Tue,  8 Jun 2021 14:38:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.138490.256385 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lqazV-0003qX-Jh; Tue, 08 Jun 2021 12:37:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 138490.256385; Tue, 08 Jun 2021 12:37:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lqazV-0003ob-GD; Tue, 08 Jun 2021 12:37:57 +0000
Received: by outflank-mailman (input) for mailman id 138490;
 Tue, 08 Jun 2021 12:37:55 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=GltA=LC=cs.pub.ro=costin.lupu@srs-us1.protection.inumbo.net>)
 id 1lqazT-0003oB-P2
 for xen-devel@lists.xenproject.org; Tue, 08 Jun 2021 12:37:55 +0000
Received: from mx.upb.ro (unknown [141.85.13.221])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id ff5b33d9-695c-4455-b6d7-e205e78257cc;
 Tue, 08 Jun 2021 12:37:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by mx.upb.ro (Postfix) with ESMTP id 44D03B560197;
 Tue,  8 Jun 2021 15:37:54 +0300 (EEST)
Received: from mx.upb.ro ([127.0.0.1])
 by localhost (mx.upb.ro [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id SbO3_Wf98SWC; Tue,  8 Jun 2021 15:37:52 +0300 (EEST)
Received: from localhost (localhost [127.0.0.1])
 by mx.upb.ro (Postfix) with ESMTP id 197E5B560192;
 Tue,  8 Jun 2021 15:37:52 +0300 (EEST)
Received: from mx.upb.ro ([127.0.0.1])
 by localhost (mx.upb.ro [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id BoNKilAcrpRR; Tue,  8 Jun 2021 15:37:52 +0300 (EEST)
Received: from [192.168.1.35] (unknown [188.25.174.245])
 by mx.upb.ro (Postfix) with ESMTPSA id AB7A9B56018F;
 Tue,  8 Jun 2021 15:37:51 +0300 (EEST)
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
X-Inumbo-ID: ff5b33d9-695c-4455-b6d7-e205e78257cc
X-Virus-Scanned: amavisd-new at upb.ro
Subject: Re: [PATCH v3 4/5] tools/libs/gnttab: Fix PAGE_SIZE redefinition
 error
To: Julien Grall <julien@xen.org>, xen-devel@lists.xenproject.org
Cc: Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>
References: <cover.1620633386.git.costin.lupu@cs.pub.ro>
 <b1e87eb24dfde3b1f11c5a14a4298531b4a308ad.1620633386.git.costin.lupu@cs.pub.ro>
 <5603464e-2ef5-9358-d039-cfb1f93340d3@xen.org>
From: Costin Lupu <costin.lupu@cs.pub.ro>
Message-ID: <61c4ad59-641a-f169-180b-7aeac1fc4a0b@cs.pub.ro>
Date: Tue, 8 Jun 2021 15:37:51 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <5603464e-2ef5-9358-d039-cfb1f93340d3@xen.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi Julien,

On 5/17/21 9:16 PM, Julien Grall wrote:
> Hi Costin,
>=20
> On 10/05/2021 09:35, Costin Lupu wrote:
>> If PAGE_SIZE is already defined in the system (e.g. in
>> /usr/include/limits.h
>> header) then gcc will trigger a redefinition error because of -Werror.
>> This
>> patch replaces usage of PAGE_* macros with XC_PAGE_* macros in order
>> to avoid
>> confusion between control domain page granularity (PAGE_* definitions)
>> and
>> guest domain page granularity (which is what we are dealing with here)=
.
>>
>> Signed-off-by: Costin Lupu <costin.lupu@cs.pub.ro>
>> ---
>> =C2=A0 tools/libs/gnttab/freebsd.c | 28 +++++++++++++---------------
>> =C2=A0 tools/libs/gnttab/linux.c=C2=A0=C2=A0 | 28 +++++++++++++-------=
--------
>> =C2=A0 tools/libs/gnttab/netbsd.c=C2=A0 | 23 ++++++++++-------------
>> =C2=A0 3 files changed, 36 insertions(+), 43 deletions(-)
>>
>> diff --git a/tools/libs/gnttab/freebsd.c b/tools/libs/gnttab/freebsd.c
>> index 768af701c6..e42ac3fbf3 100644
>> --- a/tools/libs/gnttab/freebsd.c
>> +++ b/tools/libs/gnttab/freebsd.c
>> @@ -30,14 +30,11 @@
>> =C2=A0 =C2=A0 #include <xen/sys/gntdev.h>
>> =C2=A0 +#include <xenctrl.h>
>> =C2=A0 #include <xen-tools/libs.h>
>> =C2=A0 =C2=A0 #include "private.h"
>> =C2=A0 -#define PAGE_SHIFT=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 12
>> -#define PAGE_SIZE=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 (1UL << PAGE_SHIFT)
>> -#define PAGE_MASK=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 (~(PAGE_SIZE-1))
>> -
>> =C2=A0 #define DEVXEN "/dev/xen/gntdev"
>> =C2=A0 =C2=A0 int osdep_gnttab_open(xengnttab_handle *xgt)
>> @@ -77,10 +74,11 @@ void *osdep_gnttab_grant_map(xengnttab_handle *xgt=
,
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 int domids_stride;
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 unsigned int refs_size =3D ROUNDUP(coun=
t *
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 sizeof(struct
>> ioctl_gntdev_grant_ref),
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
PAGE_SHIFT);
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
XC_PAGE_SHIFT);
>> +=C2=A0=C2=A0=C2=A0 int os_page_size =3D getpagesize();
>=20
> Same remark as for patch #4. This at least want to be explained in the
> commit message.

Done.


Thanks,
Costin

