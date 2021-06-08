Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 31CE939F6EA
	for <lists+xen-devel@lfdr.de>; Tue,  8 Jun 2021 14:37:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.138487.256372 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lqaz3-0003F3-AZ; Tue, 08 Jun 2021 12:37:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 138487.256372; Tue, 08 Jun 2021 12:37:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lqaz3-0003Co-7e; Tue, 08 Jun 2021 12:37:29 +0000
Received: by outflank-mailman (input) for mailman id 138487;
 Tue, 08 Jun 2021 12:37:28 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=GltA=LC=cs.pub.ro=costin.lupu@srs-us1.protection.inumbo.net>)
 id 1lqaz2-0003Cd-4b
 for xen-devel@lists.xenproject.org; Tue, 08 Jun 2021 12:37:28 +0000
Received: from mx.upb.ro (unknown [141.85.13.211])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 92a664cf-c692-4b73-9b62-066090222f5d;
 Tue, 08 Jun 2021 12:37:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by mx.upb.ro (Postfix) with ESMTP id 7F514B56018F;
 Tue,  8 Jun 2021 15:37:26 +0300 (EEST)
Received: from mx.upb.ro ([127.0.0.1])
 by localhost (mx.upb.ro [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id 9WbonbmMFQbw; Tue,  8 Jun 2021 15:37:24 +0300 (EEST)
Received: from localhost (localhost [127.0.0.1])
 by mx.upb.ro (Postfix) with ESMTP id 5F02EB560197;
 Tue,  8 Jun 2021 15:37:24 +0300 (EEST)
Received: from mx.upb.ro ([127.0.0.1])
 by localhost (mx.upb.ro [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id smpOXGdvXI_i; Tue,  8 Jun 2021 15:37:24 +0300 (EEST)
Received: from [192.168.1.35] (unknown [188.25.174.245])
 by mx.upb.ro (Postfix) with ESMTPSA id 02BFAB560196;
 Tue,  8 Jun 2021 15:37:23 +0300 (EEST)
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
X-Inumbo-ID: 92a664cf-c692-4b73-9b62-066090222f5d
X-Virus-Scanned: amavisd-new at upb.ro
Subject: Re: [PATCH v3 3/5] tools/libs/foreignmemory: Fix PAGE_SIZE
 redefinition error
To: Julien Grall <julien@xen.org>, xen-devel@lists.xenproject.org
Cc: Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>
References: <cover.1620633386.git.costin.lupu@cs.pub.ro>
 <2040286fc39b7e1d46376a8e75ac59d8d3be5aff.1620633386.git.costin.lupu@cs.pub.ro>
 <690806fb-e6e2-f61f-d7d6-a17efa6329d9@xen.org>
From: Costin Lupu <costin.lupu@cs.pub.ro>
Message-ID: <153d38e4-b5fe-3530-138e-ad116a7c4c4c@cs.pub.ro>
Date: Tue, 8 Jun 2021 15:37:23 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <690806fb-e6e2-f61f-d7d6-a17efa6329d9@xen.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi Julien,

On 5/17/21 9:12 PM, Julien Grall wrote:
> Hi Costin,
>=20
> On 10/05/2021 09:35, Costin Lupu wrote:
>> @@ -168,7 +168,7 @@ void
>> *osdep_xenforeignmemory_map(xenforeignmemory_handle *fmem,
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 size_t i;
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 int rc;
>> =C2=A0 -=C2=A0=C2=A0=C2=A0 addr =3D mmap(addr, num << PAGE_SHIFT, prot=
, flags | MAP_SHARED,
>> +=C2=A0=C2=A0=C2=A0 addr =3D mmap(addr, num << XC_PAGE_SHIFT, prot, fl=
ags | MAP_SHARED,
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 fd, 0);
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if ( addr =3D=3D MAP_FAILED )
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return NULL;
>> @@ -198,9 +198,10 @@ void
>> *osdep_xenforeignmemory_map(xenforeignmemory_handle *fmem,
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 */
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 privcmd_mmapbat=
ch_t ioctlx;
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 xen_pfn_t *pfn;
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 unsigned int pfn_arr_size =
=3D ROUNDUP((num * sizeof(*pfn)),
>> PAGE_SHIFT);
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 unsigned int pfn_arr_size =
=3D ROUNDUP((num * sizeof(*pfn)),
>> XC_PAGE_SHIFT);
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 int os_page_size =3D getpa=
gesize();
>=20
> Hmmm... Sorry I only realized now that the manpage suggests that
> getpagesize() is legacy:
>=20
> =C2=A0=C2=A0 SVr4, 4.4BSD, SUSv2.=C2=A0 In SUSv2 the getpagesize() call=
 is labeled
> LEGACY, and in POSIX.1-2001 it has been dropped; HP-UX does not have
> this call.
>=20
> And then:
>=20
> =C2=A0 Portable applications should employ sysconf(_SC_PAGESIZE) instea=
d of
> getpagesize():
>=20
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 #include <unistd=
.h>
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 long sz =3D sysc=
onf(_SC_PAGESIZE);
>=20
> As this is only used by Linux, it is not clear to me whether this is
> important. Ian, what do you think?
>=20

I think it would be safer to follow the man page indication. I've just
sent a v4.

>> =C2=A0 -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if ( pfn_arr_size <=
=3D PAGE_SIZE )
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if ( pfn_arr_size <=3D os_=
page_size )
>=20
> Your commit message suggests we are only s/PAGE_SHIFT/XC_PAGE_SHIFT/ bu=
t
> this is using getpagesize() instead. I agree it should be using the OS
> size. However, this should be clarified in the commit message.
>=20

Done.

> The rest of the patch looks fine to me .

Thanks,
Costin

