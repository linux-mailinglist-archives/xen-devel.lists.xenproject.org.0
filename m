Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 22A4836DF01
	for <lists+xen-devel@lfdr.de>; Wed, 28 Apr 2021 20:37:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.119551.226078 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lbp44-0002hP-FY; Wed, 28 Apr 2021 18:37:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 119551.226078; Wed, 28 Apr 2021 18:37:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lbp44-0002h0-CH; Wed, 28 Apr 2021 18:37:36 +0000
Received: by outflank-mailman (input) for mailman id 119551;
 Wed, 28 Apr 2021 18:37:35 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=mtt6=JZ=cs.pub.ro=costin.lupu@srs-us1.protection.inumbo.net>)
 id 1lbp43-0002gu-E3
 for xen-devel@lists.xenproject.org; Wed, 28 Apr 2021 18:37:35 +0000
Received: from mx.upb.ro (unknown [141.85.13.220])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id a4a473da-f179-436f-a8c9-77c2d90ae833;
 Wed, 28 Apr 2021 18:37:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by mx.upb.ro (Postfix) with ESMTP id DFE4BB560061;
 Wed, 28 Apr 2021 21:37:33 +0300 (EEST)
Received: from mx.upb.ro ([127.0.0.1])
 by localhost (mx.upb.ro [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id A_siWEe2lhhp; Wed, 28 Apr 2021 21:37:32 +0300 (EEST)
Received: from localhost (localhost [127.0.0.1])
 by mx.upb.ro (Postfix) with ESMTP id E38A2B56006C;
 Wed, 28 Apr 2021 21:37:31 +0300 (EEST)
Received: from mx.upb.ro ([127.0.0.1])
 by localhost (mx.upb.ro [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id cRuVjwTr9jPD; Wed, 28 Apr 2021 21:37:31 +0300 (EEST)
Received: from [192.168.1.35] (unknown [188.25.174.245])
 by mx.upb.ro (Postfix) with ESMTPSA id F2E09B560061;
 Wed, 28 Apr 2021 21:37:30 +0300 (EEST)
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
X-Inumbo-ID: a4a473da-f179-436f-a8c9-77c2d90ae833
X-Virus-Scanned: amavisd-new at upb.ro
Subject: Re: [PATCH 0/5] Fix redefinition errors for toolstack libs
To: Christian Lindig <christian.lindig@citrix.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 "Tim (Xen.org)" <tim@xen.org>, Ian Jackson <iwj@xenproject.org>,
 Wei Liu <wl@xen.org>, David Scott <dave@recoil.org>
References: <cover.1619524463.git.costin.lupu@cs.pub.ro>
 <AE965271-FE62-4EA7-91CC-F6438C34962A@citrix.com>
From: Costin Lupu <costin.lupu@cs.pub.ro>
Message-ID: <0b82dc88-fe59-3074-471f-2e36ba3b840e@cs.pub.ro>
Date: Wed, 28 Apr 2021 21:37:30 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.0
MIME-Version: 1.0
In-Reply-To: <AE965271-FE62-4EA7-91CC-F6438C34962A@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

On 4/28/21 3:34 PM, Christian Lindig wrote:
>=20
>=20
>> On 27 Apr 2021, at 13:05, Costin Lupu <costin.lupu@cs.pub.ro
>> <mailto:costin.lupu@cs.pub.ro>> wrote:
>>
>> For replication I used gcc 10.3 on an Alpine system. In order to
>> replicate the
>> redefinition error for PAGE_SIZE one should install the 'fortify-heade=
rs'
>> package which will change the chain of included headers by indirectly
>> including
>> /usr/include/limits.h where PAGE_SIZE and PATH_MAX are defined.
>>
>> Costin Lupu (5):
>> =C2=A0tools/debugger: Fix PAGE_SIZE redefinition error
>> =C2=A0tools/libfsimage: Fix PATH_MAX redefinition error
>> =C2=A0tools/libs/foreignmemory: Fix PAGE_SIZE redefinition error
>> =C2=A0tools/libs/gnttab: Fix PAGE_SIZE redefinition error
>> =C2=A0tools/ocaml: Fix redefinition errors
>>
>> tools/debugger/kdd/kdd-xen.c =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0| 4 +++=
+
>> tools/debugger/kdd/kdd.c =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0| 4 ++++
>> tools/libfsimage/ext2fs/fsys_ext2fs.c =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0| 2 ++
>> tools/libfsimage/reiserfs/fsys_reiserfs.c =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
| 2 ++
>> tools/libs/foreignmemory/private.h =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0| 6 ++++--
>> tools/libs/gnttab/linux.c =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0| 6 ++++++
>> tools/ocaml/libs/xc/xenctrl_stubs.c =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0| 8 ++++++++
>> tools/ocaml/libs/xentoollog/xentoollog_stubs.c | 4 ++++
>> tools/ocaml/libs/xl/xenlight_stubs.c =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0| 4 ++++
>> 9 files changed, 38 insertions(+), 2 deletions(-)
>>
>> =E2=80=94
>> 2.20.1
>>
>=20
> For the OCaml bindings, this avoids redefinitions as you say. Looks goo=
d
> to me.
>=20
> Acked-by: Christian Lindig <christian.lindig@citrix.com
> <mailto:christian.lindig@citrix.com>>
>=20

Thanks, Christian, I'll add your ack on the Ocaml patch for the next
version of the series.

Cheers,
Costin

