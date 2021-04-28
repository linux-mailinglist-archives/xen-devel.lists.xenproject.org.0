Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 21FDD36DF00
	for <lists+xen-devel@lfdr.de>; Wed, 28 Apr 2021 20:36:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.119547.226066 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lbp2S-0002Yx-3q; Wed, 28 Apr 2021 18:35:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 119547.226066; Wed, 28 Apr 2021 18:35:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lbp2S-0002YY-0a; Wed, 28 Apr 2021 18:35:56 +0000
Received: by outflank-mailman (input) for mailman id 119547;
 Wed, 28 Apr 2021 18:35:55 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=mtt6=JZ=cs.pub.ro=costin.lupu@srs-us1.protection.inumbo.net>)
 id 1lbp2R-0002YT-0s
 for xen-devel@lists.xenproject.org; Wed, 28 Apr 2021 18:35:55 +0000
Received: from mx.upb.ro (unknown [141.85.13.5])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 560b810f-7a01-423d-87a8-a7a95b815aa4;
 Wed, 28 Apr 2021 18:35:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by mx.upb.ro (Postfix) with ESMTP id 163B9B560070;
 Wed, 28 Apr 2021 21:35:53 +0300 (EEST)
Received: from mx.upb.ro ([127.0.0.1])
 by localhost (mx.upb.ro [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id sCoWxJG2UuUp; Wed, 28 Apr 2021 21:35:50 +0300 (EEST)
Received: from localhost (localhost [127.0.0.1])
 by mx.upb.ro (Postfix) with ESMTP id 7B5DBB56006C;
 Wed, 28 Apr 2021 21:35:50 +0300 (EEST)
Received: from mx.upb.ro ([127.0.0.1])
 by localhost (mx.upb.ro [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id gFPh4Dzn5c1F; Wed, 28 Apr 2021 21:35:50 +0300 (EEST)
Received: from [192.168.1.35] (unknown [188.25.174.245])
 by mx.upb.ro (Postfix) with ESMTPSA id 131CBB560061;
 Wed, 28 Apr 2021 21:35:49 +0300 (EEST)
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
X-Inumbo-ID: 560b810f-7a01-423d-87a8-a7a95b815aa4
X-Virus-Scanned: amavisd-new at upb.ro
Subject: Re: [PATCH 2/5] tools/libfsimage: Fix PATH_MAX redefinition error
To: Julien Grall <julien@xen.org>, xen-devel@lists.xenproject.org
Cc: Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>
References: <cover.1619524463.git.costin.lupu@cs.pub.ro>
 <e44209c8981a68604a34f3066d53989f84ce8f49.1619524463.git.costin.lupu@cs.pub.ro>
 <9ef85c5b-b757-bbaa-be23-4ceb1d45cddd@xen.org>
From: Costin Lupu <costin.lupu@cs.pub.ro>
Message-ID: <d29a7d0a-d83e-a437-d38f-d142a2f0d1a7@cs.pub.ro>
Date: Wed, 28 Apr 2021 21:35:49 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.0
MIME-Version: 1.0
In-Reply-To: <9ef85c5b-b757-bbaa-be23-4ceb1d45cddd@xen.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

On 4/28/21 12:04 PM, Julien Grall wrote:
>=20
>=20
> On 27/04/2021 13:05, Costin Lupu wrote:
>> If PATH_MAX is already defined in the system (e.g. in
>> /usr/include/limits.h
>> header) then gcc will trigger a redefinition error because of -Werror.
>>
>> Signed-off-by: Costin Lupu <costin.lupu@cs.pub.ro>
>> ---
>> =C2=A0 tools/libfsimage/ext2fs/fsys_ext2fs.c=C2=A0=C2=A0=C2=A0=C2=A0 |=
 2 ++
>> =C2=A0 tools/libfsimage/reiserfs/fsys_reiserfs.c | 2 ++
>> =C2=A0 2 files changed, 4 insertions(+)
>>
>> diff --git a/tools/libfsimage/ext2fs/fsys_ext2fs.c
>> b/tools/libfsimage/ext2fs/fsys_ext2fs.c
>> index a4ed10419c..5ed8fce90e 100644
>> --- a/tools/libfsimage/ext2fs/fsys_ext2fs.c
>> +++ b/tools/libfsimage/ext2fs/fsys_ext2fs.c
>> @@ -278,7 +278,9 @@ struct ext4_extent_header {
>> =C2=A0 =C2=A0 #define EXT2_SUPER_MAGIC=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0=
xEF53=C2=A0=C2=A0=C2=A0 /* include/linux/ext2_fs.h */
>> =C2=A0 #define EXT2_ROOT_INO=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 2=C2=A0=C2=A0=C2=A0 /* include/linux=
/ext2_fs.h */
>> +#ifndef PATH_MAX
>> =C2=A0 #define PATH_MAX=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1024=C2=A0=C2=A0=C2=A0 /* incl=
ude/linux/limits.h */
>> +#endif
>=20
> Can we drop it completely and just rely on limits.h?
>=20

One problem here is that the system limits.h header doesn't necessarily
include linux/limits.h, which would mean we would have to include
linux/limits.h. But this is problematic for other systems such as BSD.

I had a look on a FreeBSD source tree to see how this is done there. It
seems that there are lots of submodules, apps and libs that redefine
PATH_MAX in case it wasn't defined before so the changes introduced by
the current patch seem to be very popular. Another clean approach I saw
was for jemalloc [1] which includes unistd.h. They redefine PATH_MAX
only for MS C compiler, but AFAIK we don't need that.

So IMHO the current changes seem to be the most portable, but I'm open
to any suggestions.

[1]
https://github.com/jemalloc/jemalloc/blob/dev/include/jemalloc/internal/j=
emalloc_internal_decls.h#L76


>> =C2=A0 #define MAX_LINK_COUNT=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 5=C2=A0=C2=A0=C2=A0 /* number of symbolic =
links
>> to follow */
>> =C2=A0 =C2=A0 /* made up, these are pointers into FSYS_BUF */
>> diff --git a/tools/libfsimage/reiserfs/fsys_reiserfs.c
>> b/tools/libfsimage/reiserfs/fsys_reiserfs.c
>> index 916eb15292..10ca657476 100644
>> --- a/tools/libfsimage/reiserfs/fsys_reiserfs.c
>> +++ b/tools/libfsimage/reiserfs/fsys_reiserfs.c
>> @@ -284,7 +284,9 @@ struct reiserfs_de_head
>> =C2=A0 #define S_ISDIR(mode) (((mode) & 0170000) =3D=3D 0040000)
>> =C2=A0 #define S_ISLNK(mode) (((mode) & 0170000) =3D=3D 0120000)
>> =C2=A0 +#ifndef PATH_MAX
>> =C2=A0 #define PATH_MAX=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1024=C2=A0=
=C2=A0=C2=A0 /* include/linux/limits.h */
>> +#endif
>> =C2=A0 #define MAX_LINK_COUNT=C2=A0=C2=A0=C2=A0 5=C2=A0=C2=A0=C2=A0 /*=
 number of symbolic links to follow */
>> =C2=A0 =C2=A0 /* The size of the node cache */
>>
>=20

