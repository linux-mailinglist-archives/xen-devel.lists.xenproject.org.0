Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AB07543638A
	for <lists+xen-devel@lfdr.de>; Thu, 21 Oct 2021 15:55:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.214426.372965 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mdYX2-00067S-Eu; Thu, 21 Oct 2021 13:54:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 214426.372965; Thu, 21 Oct 2021 13:54:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mdYX2-00064b-Bj; Thu, 21 Oct 2021 13:54:56 +0000
Received: by outflank-mailman (input) for mailman id 214426;
 Thu, 21 Oct 2021 13:54:54 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=IwRr=PJ=invisiblethingslab.com=marmarek@srs-us1.protection.inumbo.net>)
 id 1mdYX0-00064T-AJ
 for xen-devel@lists.xenproject.org; Thu, 21 Oct 2021 13:54:54 +0000
Received: from out3-smtp.messagingengine.com (unknown [66.111.4.27])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 7730691c-3276-11ec-8378-12813bfff9fa;
 Thu, 21 Oct 2021 13:54:52 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id BD10D5C01E1;
 Thu, 21 Oct 2021 09:54:52 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Thu, 21 Oct 2021 09:54:52 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 21 Oct 2021 09:54:51 -0400 (EDT)
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
X-Inumbo-ID: 7730691c-3276-11ec-8378-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to:x-me-proxy
	:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=8DfilE
	VkpFNcYiOfzwpg4aeBMtYvljaMPUNJ2ADgFkA=; b=a+ECN/TvPbf3yKz1/pizVF
	PXWCsF303artum+kRyNkZKLBST5f8vat710AnWHskPpjRFbFtn7IIHP5SmV7jhNN
	Qt7ssfcdzaj0c+0PmD+5pCUx4iTgeizaMeoj4wbQKoEWLszE3cHXWTSekBc0pueh
	VV0fiNCJS0sRBDjyu08DYuKEi4SQ+kE92RQEwK91LOl/c16dhFfdE7Yl6dFAh6fI
	LuEgo+C7JkabCzYiAOr+oBlosndkR0Fb3I4jDvLs/wn/5CTxDmIMNDa5cuzkLukx
	9UWUhLUBw2j5ZKvbu9rH/SrK0+zgRLWkT4KElasqo45ml820yxTJcxBEwXKRIJ+g
	==
X-ME-Sender: <xms:LHFxYRHId5V6447Wz3oxMi5ZrXDUWn1oNgwClwe--O9HvpQuOMfslA>
    <xme:LHFxYWWRYbdVfSr_ZY1zUuiHJDTgN8Zn7HU4teIg2OYeVJoivCDWDBI6GmwLsLHFU
    yetWdjzNN6S3A>
X-ME-Received: <xmr:LHFxYTL-p1Pr8k3M32caRg4jKlo32zEPhsvC1ljbUTLJDdoZtC5WJr15uEoFixUja0mKTtToNAONPlFHtuh3p3QnSxrDf7fp>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrvddviedgieelucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvffukfhfgggtuggjsehgtderredttdejnecuhfhrohhmpeforghrvghk
    ucforghrtgiihihkohifshhkihdqifpkrhgvtghkihcuoehmrghrmhgrrhgvkhesihhnvh
    hishhisghlvghthhhinhhgshhlrggsrdgtohhmqeenucggtffrrghtthgvrhhnpeetveff
    iefghfekhffggeeffffhgeevieektedthfehveeiheeiiedtudegfeetffenucevlhhush
    htvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrghrmhgrrhgvkhes
    ihhnvhhishhisghlvghthhhinhhgshhlrggsrdgtohhm
X-ME-Proxy: <xmx:LHFxYXGT44NRiCcA0v3v1pgBaCUWWvMq8wCJ0719vC3AvwjXIVd2rA>
    <xmx:LHFxYXURzcRwQ8pwHiy5QR5_0DxrUym_2Muj0afhdQTYS436dYzq7w>
    <xmx:LHFxYSMpwhdzy6SH_dMS6pdD_gc4FSi8JoDiKNDYy8uXHht0LFGoaw>
    <xmx:LHFxYeCrPmsh2F-ecnd274HcMu3F78pTY2CvWpY-zGCxcWDuua5Fug>
Date: Thu, 21 Oct 2021 15:54:48 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Juergen Gross <jgross@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: Tentative fix for "out of PoD memory" issue
Message-ID: <YXFxKC4shCATB913@mail-itl>
References: <912c7377-26f0-c14a-e3aa-f00a81ed5766@suse.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="N3tx0KCYiCI/3eVV"
Content-Disposition: inline
In-Reply-To: <912c7377-26f0-c14a-e3aa-f00a81ed5766@suse.com>


--N3tx0KCYiCI/3eVV
Content-Type: multipart/mixed; protected-headers=v1;
	boundary="QsU+wNDWzJA/oy32"
Content-Disposition: inline
Date: Thu, 21 Oct 2021 15:54:48 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Juergen Gross <jgross@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: Tentative fix for "out of PoD memory" issue


--QsU+wNDWzJA/oy32
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 21, 2021 at 01:53:06PM +0200, Juergen Gross wrote:
> Marek,
>=20
> could you please test whether the attached patch is fixing your
> problem?

Sure. In fact, I made a similar patch in the meantime (attached) to
experiment with this a bit.

> BTW, I don't think this couldn't happen before kernel 5.15. I guess
> my modification to use a kernel thread instead of a workqueue just
> made the issue more probable.

I think you are right here. But this all looks still a bit weird.

1. baseline: 5.10.61 (before using kernel thread - which was backported to
stable branches).

Here the startup completes successfully (no "out of PoD memory"
issue) with memory=3D270MB.=20

2. 5.10.61 with added boot delay patch:
The delay is about 18s and the guest boot successfully.

3. 5.10.71 with "xen/balloon: fix cancelled balloon action" but without
delay patch:
The domain is killed during startup (in the middle of fsck, I think)

4. 5.10.74 with delay patch:
The delay is about 19s and the guest boot successfully.

Now the weird part: with memory=3D270MB with the delay patch, the balloon
delay _fails_ - state=3DBP_ECANCELED, and credit is -19712 at that time.
In both thread and workqueue balloon variants. Yet, it isn't killed (*).
But with 5.10.61, even without the delay patch, the guest starts
successfully in the end.

Also, I think there was some implicit wait for initial balloon down
before. That was the main motivation for 197ecb3802c0 "xen/balloon: add
runtime control for scrubbing ballooned out pages" - because that
initial balloon down held the system startup for some long time. Sadly,
I can't find my notes from debugging that (especially if I had written
down a stacktrace _where_ exactly it was waiting)...

> I couldn't reproduce the crash you are seeing, but the introduced
> wait was 4.2 seconds on my test system (a PVH guest with 2 GB of
> memory, maxmem 6 GB).

I'm testing it on a much more aggressive setting:
 - memory: 270 MB (the minimal that is sufficient to boot the system)
 - maxmem: 4 GB

The default settings in Qubes are:
 - memory: 400 MB
 - maxmem: 4 GB

That should explains why it happens on Qubes way more often than
elsewhere.


(*) At some point during system boot, qubes memory manager kicks in and
the VM gets more memory. But it's rather late, and definitely after it is
killed with "out of PoD memory" in other cases.

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--QsU+wNDWzJA/oy32
Content-Type: text/plain; charset=utf-8
Content-Disposition: attachment; filename="balloon-wait-5.10.61.patch"
Content-Transfer-Encoding: quoted-printable

=46rom 947818c731094a952d4955e99a23ef336daf7ab9 Mon Sep 17 00:00:00 2001
=46rom: =3D?UTF-8?q?Marek=3D20Marczykowski-G=3DC3=3DB3recki?=3D
 <marmarek@invisiblethingslab.com>
Date: Thu, 21 Oct 2021 01:10:21 +0200
Subject: [PATCH] WIP: xen/balloon: wait for initial balloon down before
 starting userspace
MIME-Version: 1.0
Content-Type: text/plain; charset=3DUTF-8
Content-Transfer-Encoding: 8bit
Organization: Invisible Things Lab
Cc: Marek Marczykowski-G=C3=B3recki <marmarek@invisiblethingslab.com>

When HVM/PVH guest with maxmem > memory, a populate on demand feature is
used. This allows the guest to see up to 'maxmem' memory, but when it
tries to use more than 'memory', it is crashed. Balloon driver should
prevent that by ballooning down the guest before it tries to use too
much memory. Unfortunately, this was done asynchronously and it wasn't
really guaranteed to be quick enough. And indeed, with recent kernel
versions, the initial balloon down process is slower and guests with
small initial 'memory' are crashed frequently by Xen.

Fix this by adding late init call that waits for the initial balloon
down to complete, before allowing any userspace to run. If that initial
balloon down fails, it is very likely that guest will be killed (as soon
as it will really use all the memory that something has allocated) -
print a message about that to aid diagnosing issues.

Signed-off-by: Marek Marczykowski-G=C3=B3recki <marmarek@invisiblethingslab=
=2Ecom>
(cherry picked from commit 9a226e669c918c98ee603ee30a1798da6434a423)
---
 drivers/xen/balloon.c | 27 ++++++++++++++++++++++++++-
 1 file changed, 26 insertions(+), 1 deletion(-)

diff --git a/drivers/xen/balloon.c b/drivers/xen/balloon.c
index b57b2067ecbf..c2a4e25a14dc 100644
--- a/drivers/xen/balloon.c
+++ b/drivers/xen/balloon.c
@@ -56,6 +56,7 @@
 #include <linux/percpu-defs.h>
 #include <linux/slab.h>
 #include <linux/sysctl.h>
+#include <linux/completion.h>
=20
 #include <asm/page.h>
 #include <asm/tlb.h>
@@ -136,6 +137,8 @@ static DEFINE_MUTEX(balloon_mutex);
 struct balloon_stats balloon_stats;
 EXPORT_SYMBOL_GPL(balloon_stats);
=20
+static DECLARE_COMPLETION(initial_balloon);
+
 /* We increase/decrease in batches which fit in a page */
 static xen_pfn_t frame_list[PAGE_SIZE / sizeof(xen_pfn_t)];
=20
@@ -501,7 +504,6 @@ static void balloon_process(struct work_struct *work)
 	enum bp_state state =3D BP_DONE;
 	long credit;
=20
-
 	do {
 		mutex_lock(&balloon_mutex);
=20
@@ -526,6 +528,15 @@ static void balloon_process(struct work_struct *work)
=20
 		state =3D update_schedule(state);
=20
+		if (credit >=3D 0)
+			complete(&initial_balloon);
+		else if (state =3D=3D BP_ECANCELED) {
+			if (!completion_done(&initial_balloon) && !xen_pv_domain())
+				pr_err("Initial balloon down failed, expect the domain to be killed wi=
th \"out of PoD memory\" error by Xen.\n");
+			complete(&initial_balloon);
+		}
+
+
 		mutex_unlock(&balloon_mutex);
=20
 		cond_resched();
@@ -677,6 +688,20 @@ static void __init balloon_add_region(unsigned long st=
art_pfn,
 }
 #endif
=20
+static int __init wait_for_initial_balloon_down(void)
+{
+	mutex_lock(&balloon_mutex);
+	/* optionally re-init completion after retrieving balloon target */
+	if (current_credit() < 0)
+		reinit_completion(&initial_balloon);
+	mutex_unlock(&balloon_mutex);
+	printk(KERN_INFO "waiting for initial balloon down %ld\n", current_credit=
());
+	wait_for_completion(&initial_balloon);
+	printk(KERN_INFO "done waiting for initial balloon down %ld\n", current_c=
redit());
+	return 0;
+}
+late_initcall(wait_for_initial_balloon_down);
+
 static int __init balloon_init(void)
 {
 	if (!xen_domain())
--=20
2.31.1


--QsU+wNDWzJA/oy32
Content-Type: text/plain; charset=utf-8
Content-Disposition: attachment; filename="balloon-wait-5.10.74.patch"
Content-Transfer-Encoding: quoted-printable

=46rom 9a226e669c918c98ee603ee30a1798da6434a423 Mon Sep 17 00:00:00 2001
=46rom: =3D?UTF-8?q?Marek=3D20Marczykowski-G=3DC3=3DB3recki?=3D
 <marmarek@invisiblethingslab.com>
Date: Thu, 21 Oct 2021 01:10:21 +0200
Subject: [PATCH] WIP: xen/balloon: wait for initial balloon down before
 starting userspace
MIME-Version: 1.0
Content-Type: text/plain; charset=3DUTF-8
Content-Transfer-Encoding: 8bit
Organization: Invisible Things Lab
Cc: Marek Marczykowski-G=C3=B3recki <marmarek@invisiblethingslab.com>

When HVM/PVH guest with maxmem > memory, a populate on demand feature is
used. This allows the guest to see up to 'maxmem' memory, but when it
tries to use more than 'memory', it is crashed. Balloon driver should
prevent that by ballooning down the guest before it tries to use too
much memory. Unfortunately, this was done asynchronously and it wasn't
really guaranteed to be quick enough. And indeed, with recent kernel
versions, the initial balloon down process is slower and guests with
small initial 'memory' are crashed frequently by Xen.

Fix this by adding late init call that waits for the initial balloon
down to complete, before allowing any userspace to run. If that initial
balloon down fails, it is very likely that guest will be killed (as soon
as it will really use all the memory that something has allocated) -
print a message about that to aid diagnosing issues.

Signed-off-by: Marek Marczykowski-G=C3=B3recki <marmarek@invisiblethingslab=
=2Ecom>
---
 drivers/xen/balloon.c | 25 +++++++++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/drivers/xen/balloon.c b/drivers/xen/balloon.c
index 1911a62a6d9c..a91d90f91c81 100644
--- a/drivers/xen/balloon.c
+++ b/drivers/xen/balloon.c
@@ -58,6 +58,7 @@
 #include <linux/percpu-defs.h>
 #include <linux/slab.h>
 #include <linux/sysctl.h>
+#include <linux/completion.h>
=20
 #include <asm/page.h>
 #include <asm/tlb.h>
@@ -140,6 +141,8 @@ static DEFINE_MUTEX(balloon_mutex);
 struct balloon_stats balloon_stats;
 EXPORT_SYMBOL_GPL(balloon_stats);
=20
+static DECLARE_COMPLETION(initial_balloon);
+
 /* We increase/decrease in batches which fit in a page */
 static xen_pfn_t frame_list[PAGE_SIZE / sizeof(xen_pfn_t)];
=20
@@ -531,6 +534,14 @@ static int balloon_thread(void *unused)
=20
 		credit =3D current_credit();
=20
+		if (credit >=3D 0)
+			complete(&initial_balloon);
+		else if (state =3D=3D BP_ECANCELED) {
+			if (!completion_done(&initial_balloon) && !xen_pv_domain())
+				pr_err("Initial balloon down failed, expect the domain to be killed wi=
th \"out of PoD memory\" error by Xen.\n");
+			complete(&initial_balloon);
+		}
+
 		wait_event_freezable_timeout(balloon_thread_wq,
 			balloon_thread_cond(state, credit), timeout);
=20
@@ -706,6 +717,20 @@ static void __init balloon_add_region(unsigned long st=
art_pfn,
 }
 #endif
=20
+static int __init wait_for_initial_balloon_down(void)
+{
+	mutex_lock(&balloon_mutex);
+	/* optionally re-init completion after retrieving balloon target */
+	if (current_credit() < 0)
+		reinit_completion(&initial_balloon);
+	mutex_unlock(&balloon_mutex);
+	printk(KERN_INFO "waiting for initial balloon down %ld\n", current_credit=
());
+	wait_for_completion(&initial_balloon);
+	printk(KERN_INFO "done waiting for initial balloon down %ld\n", current_c=
redit());
+	return 0;
+}
+late_initcall(wait_for_initial_balloon_down);
+
 static int __init balloon_init(void)
 {
 	struct task_struct *task;
--=20
2.31.1


--QsU+wNDWzJA/oy32--

--N3tx0KCYiCI/3eVV
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmFxcSkACgkQ24/THMrX
1yyjlgf8CDdkixL9JjLiXZvZzf+wK2mr+z3rJyl2EivviEYqXUiEcWUzXW7zRu5Q
fTUOzvj2yYGASrg3cC+to6+GTW9odK0Jc1tIuJWVxn2okgA+Yq3JlP7IORKeEO0T
E+/ZEwpEAA8ztCo8ZMDwlDAFNXM6q43TQh3u+ASHTXzQFFttK0MGwQaOHvQ2fzf7
GIul0UUBuekPFhlAyzeKfQm6pxq1MpQuGB/yBqWDThCnQ8yWQAx+ZQFMGQUY1wwO
BYp+fDIS9Tudrrm+t20Bb42J0DwwSSdQaRuOAwPsEahlzje7/PNtobvjvlPV0l1a
WAdVCvUTgIhXWFUGR0qpO80eiEiDOQ==
=yMm+
-----END PGP SIGNATURE-----

--N3tx0KCYiCI/3eVV--

