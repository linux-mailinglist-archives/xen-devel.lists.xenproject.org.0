Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D93E9FBF56
	for <lists+xen-devel@lfdr.de>; Tue, 24 Dec 2024 15:52:27 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.863071.1274554 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tQ6GK-0003U1-0v; Tue, 24 Dec 2024 14:51:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 863071.1274554; Tue, 24 Dec 2024 14:51:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tQ6GJ-0003SY-UK; Tue, 24 Dec 2024 14:51:55 +0000
Received: by outflank-mailman (input) for mailman id 863071;
 Tue, 24 Dec 2024 14:51:55 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=XM6K=TR=eurecom.fr=Ariel.Otilibili-Anieli@srs-se1.protection.inumbo.net>)
 id 1tQ6GI-0003SP-JP
 for xen-devel@lists.xenproject.org; Tue, 24 Dec 2024 14:51:54 +0000
Received: from smtp.eurecom.fr (smtp.eurecom.fr [193.55.113.210])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9c41736c-c206-11ef-99a3-01e77a169b0f;
 Tue, 24 Dec 2024 15:51:52 +0100 (CET)
Received: from quovadis.eurecom.fr ([10.3.2.233])
 by drago1i.eurecom.fr with ESMTP; 24 Dec 2024 15:51:51 +0100
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
X-Inumbo-ID: 9c41736c-c206-11ef-99a3-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=eurecom.fr; i=@eurecom.fr; q=dns/txt; s=default;
  t=1735051912; x=1766587912;
  h=from:in-reply-to:references:date:cc:to:mime-version:
   message-id:subject:content-transfer-encoding;
  bh=rtYfxr4IOwDyWz8niZH2jULR0f21TW0CSSGmypmbacs=;
  b=EInCkmrKxWEL6cRlGwTkWKAuB0tVXrb5VMfyv1t1NkC4giJiFnO4dIXI
   jL//sS6jh7koYDdMBAeummiKsVTH6dPHZl7/Gg0bJzvva/WX56a670IFo
   aVyf3rubXzYGLAa2uYqE0CkoAEUvHhcAYoyZC80PCH1+r3x2gbvodGiK1
   k=;
X-CSE-ConnectionGUID: t0abkAKgSKq4AkF4hhYuTA==
X-CSE-MsgGUID: A7wwEnwnQCGTnZE91y98ww==
X-IronPort-AV: E=Sophos;i="6.12,260,1728943200"; 
   d="scan'208";a="28312345"
From: "Ariel Otilibili-Anieli" <Ariel.Otilibili-Anieli@eurecom.fr>
In-Reply-To: <c25666d7-f485-4cb3-9f30-d5f6ea58857a@suse.com>
Content-Type: text/plain; charset="utf-8"
X-Forward: 149.5.228.1
References: <20241220165837.937976-1-Ariel.Otilibili-Anieli@eurecom.fr>
 <20241220165837.937976-3-Ariel.Otilibili-Anieli@eurecom.fr> <c25666d7-f485-4cb3-9f30-d5f6ea58857a@suse.com>
Date: Tue, 24 Dec 2024 15:51:51 +0100
Cc: "Doug Goldstein" <cardoe@cardoe.com>, xen-devel@lists.xenproject.org
To: "Jan Beulich" <jbeulich@suse.com>
MIME-Version: 1.0
Message-ID: <2f7a8b-676aca80-518b-be99fc0@193695621>
Subject: =?utf-8?q?Re=3A?= [PATCH 2/2] =?utf-8?q?xen/tools=3A?= remove dead code
User-Agent: SOGoMail 5.11.1
Content-Transfer-Encoding: quoted-printable

On Tuesday, December 24, 2024 09:43 CET, Jan Beulich <jbeulich@suse.com=
> wrote:

> On 20.12.2024 17:55, Ariel Otilibili wrote:
> > Default switch case exits directly; these instructions are never re=
ached.
> >=20
> > The file was taken from Linux; the copies have diverged a lot since=
:
> >=20
> > ```
> > $ diff -u xen/xen/tools/kconfig/expr.c linux/scripts/kconfig/expr.c=
 | wc -l
> > 984
> > ```
> >=20
> > Therefore the change is only applied locally.
> >=20
> > Coverity-ID: 1458052
> > Fixes: 8c271b7584 ("build: import Kbuild/Kconfig from Linux 4.3")
> > Signed-off-by: Ariel Otilibili <Ariel.Otilibili-Anieli@eurecom.fr>
>=20
> As the title of the commit referenced already clarifies - this is onc=
e
> again code we took from elsewhere, so imo wants updating at the origi=
n
> first. Then import that commit into Xen.

Indeed, Jan; thanks for the feedback. I am pushing a new series for thi=
s hunk; it was fixed in Linux.
I think in commits dfe8e56fc604 ("kconfig: add fallthrough comments to =
expr=5Fcompare=5Ftype()"), & 9ad86d747c46 ("kconfig: remove unreachable=
 printf()").

```
$ diff -u xen/xen/tools/kconfig/expr.c linux/scripts/kconfig/expr.c | s=
ed -ne '/expr=5Fcompare=5Ftype/,/return 0/{N;p}'
 static int expr=5Fcompare=5Ftype(enum expr=5Ftype t1, enum expr=5Ftype=
 t2)
 {
        if (t1 =3D=3D t2)
@@ -1106,30 +999,27 @@
        case E=5FGTH:
                if (t2 =3D=3D E=5FEQUAL || t2 =3D=3D E=5FUNEQUAL)
                        return 1;
+               /* fallthrough */
        case E=5FEQUAL:
        case E=5FUNEQUAL:
                if (t2 =3D=3D E=5FNOT)
                        return 1;
+               /* fallthrough */
        case E=5FNOT:
                if (t2 =3D=3D E=5FAND)
                        return 1;
+               /* fallthrough */
        case E=5FAND:
                if (t2 =3D=3D E=5FOR)
                        return 1;
-       case E=5FOR:
-               if (t2 =3D=3D E=5FLIST)
-                       return 1;
-       case E=5FLIST:
-               if (t2 =3D=3D 0)
-                       return 1;
+               /* fallthrough */
        default:
-               return -1;
+               break;
        }
-       printf("[%dgt%d?]", t1, t2);
        return 0;
 }

$ cd linux/;=20
$ git log --oneline -1 --pretty=3D'%h ("%s")'
8155b4ef3466 ("Add linux-next specific files for 20241220")
$ git remote -v=20
next    git://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.g=
it (fetch)
next    git://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.g=
it (push)

$ cd ../xen/
$ git log --oneline -1 --pretty=3D'%h ("%s")'
6419020270 ("CHANGELOG: Mention LLC coloring feature on Arm")

$ git remote -v=20
up      git://xenbits.xen.org/xen.git (fetch)
up      git://xenbits.xen.org/xen.git (push)
```
>=20
> Jan


