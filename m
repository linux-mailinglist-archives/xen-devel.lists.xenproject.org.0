Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 90D932A187B
	for <lists+xen-devel@lfdr.de>; Sat, 31 Oct 2020 16:14:58 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.16958.41754 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kYsae-0006w5-Oq; Sat, 31 Oct 2020 15:14:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 16958.41754; Sat, 31 Oct 2020 15:14:48 +0000
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
	id 1kYsae-0006vb-LN; Sat, 31 Oct 2020 15:14:48 +0000
Received: by outflank-mailman (input) for mailman id 16958;
 Sat, 31 Oct 2020 15:14:47 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=b0cl=EG=qubes-os.org=frederic.pierret@srs-us1.protection.inumbo.net>)
 id 1kYsac-0006vA-Uf
 for xen-devel@lists.xenproject.org; Sat, 31 Oct 2020 15:14:46 +0000
Received: from sender4-of-o57.zoho.com (unknown [136.143.188.57])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 1c9269b7-80f8-46b8-8a0b-7a8097915c17;
 Sat, 31 Oct 2020 15:14:46 +0000 (UTC)
Received: from localhost.localdomain (92.188.110.153 [92.188.110.153]) by
 mx.zohomail.com with SMTPS id 1604157264126690.3989801319432;
 Sat, 31 Oct 2020 08:14:24 -0700 (PDT)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=b0cl=EG=qubes-os.org=frederic.pierret@srs-us1.protection.inumbo.net>)
	id 1kYsac-0006vA-Uf
	for xen-devel@lists.xenproject.org; Sat, 31 Oct 2020 15:14:46 +0000
X-Inumbo-ID: 1c9269b7-80f8-46b8-8a0b-7a8097915c17
Received: from sender4-of-o57.zoho.com (unknown [136.143.188.57])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 1c9269b7-80f8-46b8-8a0b-7a8097915c17;
	Sat, 31 Oct 2020 15:14:46 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1604157265; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=Y/N2YoseYxZvBfPtBP7ImOm5NEHe4Z/1XgWzf/DsiZqZUacNDP0EUK2mspwNDbHhb4tZyNiVuo1WKDOnmWeL8Cix2CPPPQk2L4jZhfR+66Wozt4NCVtSsycw5+PE6QS9cZMDcf4oI6ED+Mlj02ZoEEMmvgG/f38J2ekbSxwPWXw=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1604157265; h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To; 
	bh=93nOu4o8+RRpc4ALMBdxBUd5VTnxK5nhf8F1BIq1cSk=; 
	b=nRV3NAZfBED06WK+Dhd4ilXvzeZQK7/haNF6swf9D1Uxa4JZYr8Ut2348OdXC1UiEOKNI7yQZhOQU/oKVKADrkbs5EJ9Stp4XZJ+Ax3MO3NZqt/gx/naU1hpE1OXKyU31vnKqr/V4WcRyYrlU7jRxb+v+m8gP75tU6ASW0Zo9YY=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=qubes-os.org;
	spf=pass  smtp.mailfrom=frederic.pierret@qubes-os.org;
	dmarc=pass header.from=<frederic.pierret@qubes-os.org> header.from=<frederic.pierret@qubes-os.org>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1604157265;
	s=s; d=qubes-os.org; i=frederic.pierret@qubes-os.org;
	h=From:To:Cc:Message-ID:Subject:Date:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Content-Type;
	bh=93nOu4o8+RRpc4ALMBdxBUd5VTnxK5nhf8F1BIq1cSk=;
	b=cSUIb1e9btQ/p+5qDL1ri1Reoy66rgh4KsiT+qSfIuUReKoKbYH6F2vbvC+lktJ1
	uTA3SXtuVev7stb6ONhjfNqCs518hqLXQuMjeyvNEbYfqxKINOGsXIdT0JuIjP21Zq0
	N3tGFn9U7zhbzdKpBfb+qyD6MYsyGEzvHqoGgdkA=
Received: from localhost.localdomain (92.188.110.153 [92.188.110.153]) by mx.zohomail.com
	with SMTPS id 1604157264126690.3989801319432; Sat, 31 Oct 2020 08:14:24 -0700 (PDT)
From: =?UTF-8?q?Fr=C3=A9d=C3=A9ric=20Pierret=20=28fepitre=29?= <frederic.pierret@qubes-os.org>
To: xen-devel@lists.xenproject.org
Cc: =?UTF-8?q?Fr=C3=A9d=C3=A9ric=20Pierret=20=28fepitre=29?= <frederic.pierret@qubes-os.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Ian Jackson <iwj@xenproject.org>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>
Message-ID: <8b0e8b8be9c77476ecc702a7c6216ba50659deec.1604156731.git.frederic.pierret@qubes-os.org>
Subject: [PATCH v1 2/2] Define SOURCE_DATE_EPOCH based on git log
Date: Sat, 31 Oct 2020 16:14:08 +0100
X-Mailer: git-send-email 2.26.2
In-Reply-To: <cover.1604156731.git.frederic.pierret@qubes-os.org>
References: <cover.1604156731.git.frederic.pierret@qubes-os.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-ZohoMailClient: External
Content-Type: text/plain; charset=utf8

---
 xen/Makefile | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/xen/Makefile b/xen/Makefile
index 30b1847515..4cc35556ef 100644
--- a/xen/Makefile
+++ b/xen/Makefile
@@ -6,6 +6,8 @@ export XEN_EXTRAVERSION ?=3D -unstable$(XEN_VENDORVERSION)
 export XEN_FULLVERSION   =3D $(XEN_VERSION).$(XEN_SUBVERSION)$(XEN_EXTRAVE=
RSION)
 -include xen-version
=20
+export SOURCE_DATE_EPOCH=09?=3D $(shell git log -1 --format=3D%ct 2>/dev/n=
ull)
+
 export XEN_WHOAMI=09?=3D $(USER)
 export XEN_DOMAIN=09?=3D $(shell ([ -x /bin/dnsdomainname ] && /bin/dnsdom=
ainname) || ([ -x /bin/domainname ] && /bin/domainname || echo [unknown]))
 ifneq ($(SOURCE_DATE_EPOCH),)
--=20
2.26.2



