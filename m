Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 40E3F2A1879
	for <lists+xen-devel@lfdr.de>; Sat, 31 Oct 2020 16:14:46 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.16957.41742 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kYsaU-0006rI-H8; Sat, 31 Oct 2020 15:14:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 16957.41742; Sat, 31 Oct 2020 15:14:38 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kYsaU-0006qk-Cf; Sat, 31 Oct 2020 15:14:38 +0000
Received: by outflank-mailman (input) for mailman id 16957;
 Sat, 31 Oct 2020 15:14:36 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=b0cl=EG=qubes-os.org=frederic.pierret@srs-us1.protection.inumbo.net>)
 id 1kYsaS-0006qP-8L
 for xen-devel@lists.xenproject.org; Sat, 31 Oct 2020 15:14:36 +0000
Received: from sender4-of-o57.zoho.com (unknown [136.143.188.57])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 9fef08cc-86a5-415a-9c64-964aed3b21bb;
 Sat, 31 Oct 2020 15:14:35 +0000 (UTC)
Received: from localhost.localdomain (92.188.110.153 [92.188.110.153]) by
 mx.zohomail.com with SMTPS id 1604157261060530.2165278307001;
 Sat, 31 Oct 2020 08:14:21 -0700 (PDT)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=b0cl=EG=qubes-os.org=frederic.pierret@srs-us1.protection.inumbo.net>)
	id 1kYsaS-0006qP-8L
	for xen-devel@lists.xenproject.org; Sat, 31 Oct 2020 15:14:36 +0000
X-Inumbo-ID: 9fef08cc-86a5-415a-9c64-964aed3b21bb
Received: from sender4-of-o57.zoho.com (unknown [136.143.188.57])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 9fef08cc-86a5-415a-9c64-964aed3b21bb;
	Sat, 31 Oct 2020 15:14:35 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1604157262; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=SJzQFa6rplIFNlFuqeX6Mn2B8ZGQZ2MoLnjSvnQ0EFgZh5FBAXvqJ+YAf1QP3bYeRQ4Le1Ls6ndaxHAj98uUQIMGJ7qmZ1+g+V0wggv1HZhJ5MZ+WcBIKsgjWSiX0JmU02nAkwZ/CtRJ1f++B6M+QcS2NP9o9h532RBlLi5LvoI=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1604157262; h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To; 
	bh=9aLrfxdEKAfK4nVPDcKmv48q+Kbtqnpq+yQnWMhB+SE=; 
	b=Gmagl4JfeOcKxP1wPtLRBQwnluouqR74jLvOYhHEcAp+KGa3QSGxvFp8jtqi5nO9utvLA1DAlesL2H6iq84mPZ0yTxt4H4Nm7LFrUb40PofknnRWrV3lpZdelh4egvvcYo5Ml4TNfJP+hbE/b8XnxKcYxSyjKNbtKlw+jfbupts=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=qubes-os.org;
	spf=pass  smtp.mailfrom=frederic.pierret@qubes-os.org;
	dmarc=pass header.from=<frederic.pierret@qubes-os.org> header.from=<frederic.pierret@qubes-os.org>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1604157262;
	s=s; d=qubes-os.org; i=frederic.pierret@qubes-os.org;
	h=From:To:Cc:Message-ID:Subject:Date:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Content-Type;
	bh=9aLrfxdEKAfK4nVPDcKmv48q+Kbtqnpq+yQnWMhB+SE=;
	b=FcdcVBgkzFZnqlwgpGr1142jiaQxdjAaZWHK9eAx1TzzgEpwpu5hj4vlFaBhoAx3
	APEtfHXcRwR2bJvasLaDduK4OTvX0Fho8MaOVd//gBlEGHb2oB3DUFl6aBZ4f7Basli
	5P5MjbIwebpCu/QdaT1It7Upe5H0wy4b9cPspYHw=
Received: from localhost.localdomain (92.188.110.153 [92.188.110.153]) by mx.zohomail.com
	with SMTPS id 1604157261060530.2165278307001; Sat, 31 Oct 2020 08:14:21 -0700 (PDT)
From: =?UTF-8?q?Fr=C3=A9d=C3=A9ric=20Pierret=20=28fepitre=29?= <frederic.pierret@qubes-os.org>
To: xen-devel@lists.xenproject.org
Cc: =?UTF-8?q?Fr=C3=A9d=C3=A9ric=20Pierret=20=28fepitre=29?= <frederic.pierret@qubes-os.org>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>,
	Ian Jackson <iwj@xenproject.org>,
	George Dunlap <george.dunlap@citrix.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Message-ID: <57423c6627e00fbc3f41d3f6be6ba1e15abb96fc.1604156731.git.frederic.pierret@qubes-os.org>
Subject: [PATCH v1 1/2] Define build dates/time based on SOURCE_DATE_EPOCH
Date: Sat, 31 Oct 2020 16:14:07 +0100
X-Mailer: git-send-email 2.26.2
In-Reply-To: <cover.1604156731.git.frederic.pierret@qubes-os.org>
References: <cover.1604156731.git.frederic.pierret@qubes-os.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-ZohoMailClient: External
Content-Type: text/plain; charset=utf8

It improves reproducibility if SOURCE_DATE_EPOCH is
defined while building xen binary
---
 tools/firmware/hvmloader/Makefile | 4 ++++
 tools/firmware/vgabios/Makefile   | 4 ++++
 xen/Makefile                      | 5 +++++
 3 files changed, 13 insertions(+)

diff --git a/tools/firmware/hvmloader/Makefile b/tools/firmware/hvmloader/M=
akefile
index e980ce7c5f..923e3c8b9a 100644
--- a/tools/firmware/hvmloader/Makefile
+++ b/tools/firmware/hvmloader/Makefile
@@ -21,7 +21,11 @@ XEN_ROOT =3D $(CURDIR)/../../..
 include $(XEN_ROOT)/tools/firmware/Rules.mk
=20
 # SMBIOS spec requires format mm/dd/yyyy
+ifneq ($(SOURCE_DATE_EPOCH),)
+SMBIOS_REL_DATE ?=3D $(shell date -u -d "@$(SOURCE_DATE_EPOCH)" "+%m/%d/%Y=
" 2>/dev/null)
+else
 SMBIOS_REL_DATE ?=3D $(shell date +%m/%d/%Y)
+endif
=20
 CFLAGS +=3D $(CFLAGS_xeninclude)
=20
diff --git a/tools/firmware/vgabios/Makefile b/tools/firmware/vgabios/Makef=
ile
index 3284812fde..9b8b687a73 100644
--- a/tools/firmware/vgabios/Makefile
+++ b/tools/firmware/vgabios/Makefile
@@ -5,7 +5,11 @@ BCC =3D bcc
 AS86 =3D as86
=20
 RELEASE =3D `pwd | sed "s-.*/--"`
+ifneq ($(SOURCE_DATE_EPOCH),)
+VGABIOS_REL_DATE ?=3D $(shell date -u -d "@$(SOURCE_DATE_EPOCH)" "+%d %b %=
Y" 2>/dev/null)
+else
 VGABIOS_REL_DATE ?=3D `date '+%d %b %Y'`
+endif
 RELVERS =3D `pwd | sed "s-.*/--" | sed "s/vgabios//" | sed "s/-//"`
=20
 VGABIOS_DATE =3D "-DVGABIOS_DATE=3D\"$(VGABIOS_REL_DATE)\""
diff --git a/xen/Makefile b/xen/Makefile
index bf0c804d43..30b1847515 100644
--- a/xen/Makefile
+++ b/xen/Makefile
@@ -8,8 +8,13 @@ export XEN_FULLVERSION   =3D $(XEN_VERSION).$(XEN_SUBVERSI=
ON)$(XEN_EXTRAVERSION)
=20
 export XEN_WHOAMI=09?=3D $(USER)
 export XEN_DOMAIN=09?=3D $(shell ([ -x /bin/dnsdomainname ] && /bin/dnsdom=
ainname) || ([ -x /bin/domainname ] && /bin/domainname || echo [unknown]))
+ifneq ($(SOURCE_DATE_EPOCH),)
+export XEN_BUILD_DATE=09?=3D $(shell date -u -d "@$(SOURCE_DATE_EPOCH)" 2>=
/dev/null)
+export XEN_BUILD_TIME=09?=3D $(shell date -u -d "@$(SOURCE_DATE_EPOCH)" +%=
T 2>/dev/null)
+else
 export XEN_BUILD_DATE=09?=3D $(shell LC_ALL=3DC date)
 export XEN_BUILD_TIME=09?=3D $(shell LC_ALL=3DC date +%T)
+endif
 export XEN_BUILD_HOST=09?=3D $(shell hostname)
=20
 # Best effort attempt to find a python interpreter, defaulting to Python 3=
 if
--=20
2.26.2



