Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B38F92A1878
	for <lists+xen-devel@lfdr.de>; Sat, 31 Oct 2020 16:14:45 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.16956.41730 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kYsaJ-0006oI-6o; Sat, 31 Oct 2020 15:14:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 16956.41730; Sat, 31 Oct 2020 15:14:27 +0000
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
	id 1kYsaJ-0006nt-3e; Sat, 31 Oct 2020 15:14:27 +0000
Received: by outflank-mailman (input) for mailman id 16956;
 Sat, 31 Oct 2020 15:14:25 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=b0cl=EG=qubes-os.org=frederic.pierret@srs-us1.protection.inumbo.net>)
 id 1kYsaH-0006no-5E
 for xen-devel@lists.xenproject.org; Sat, 31 Oct 2020 15:14:25 +0000
Received: from sender4-of-o57.zoho.com (unknown [136.143.188.57])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 9a324a4d-5b17-4a0b-b0ff-bea87176a417;
 Sat, 31 Oct 2020 15:14:23 +0000 (UTC)
Received: from localhost.localdomain (92.188.110.153 [92.188.110.153]) by
 mx.zohomail.com with SMTPS id 1604157256192744.0465096339267;
 Sat, 31 Oct 2020 08:14:16 -0700 (PDT)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=b0cl=EG=qubes-os.org=frederic.pierret@srs-us1.protection.inumbo.net>)
	id 1kYsaH-0006no-5E
	for xen-devel@lists.xenproject.org; Sat, 31 Oct 2020 15:14:25 +0000
X-Inumbo-ID: 9a324a4d-5b17-4a0b-b0ff-bea87176a417
Received: from sender4-of-o57.zoho.com (unknown [136.143.188.57])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 9a324a4d-5b17-4a0b-b0ff-bea87176a417;
	Sat, 31 Oct 2020 15:14:23 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1604157257; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=WOoN9bqzI80lerK/Okit0zrBPXDiAhKwIluVIg+q1/mOhie/lnKyj3zt94PyDoaxZgactIVawXxTpB+63PJLbQpgIT85JhTuu/ArR1lO61H+KM3i8JCD8xuzcFbo4M8Bh6COwB3QpysHgoaCjmwmePWdPsj43E730h0oxQwDlv4=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1604157257; h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:MIME-Version:Message-ID:Subject:To; 
	bh=r/9IfMBpU+kvBya/rT8LWqoWC929p0oXvKNbnF4Xtqc=; 
	b=NYHtRmWGqqjGE8G6L2IMnCieSpgPOLqx5vXozI3wo+yOFid2xGqlFe299ttmk+DspH2baxrAy4MANRlTofpgEpR0MJjPBgsVKtBIaOXZaRR6uUj90W7R2DVtqKlsf/R/VlbT05vLp9uSerefQKXwcGH444at3P8QYciKx9qhbJw=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=qubes-os.org;
	spf=pass  smtp.mailfrom=frederic.pierret@qubes-os.org;
	dmarc=pass header.from=<frederic.pierret@qubes-os.org> header.from=<frederic.pierret@qubes-os.org>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1604157257;
	s=s; d=qubes-os.org; i=frederic.pierret@qubes-os.org;
	h=From:To:Cc:Message-ID:Subject:Date:MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=r/9IfMBpU+kvBya/rT8LWqoWC929p0oXvKNbnF4Xtqc=;
	b=DnHeEaMshkBDmdURqjlP34WhQXgT4iHPgttTiZGbTRKp6hbs/0NOjQAji+oAbNDZ
	iRQjkakVA6I7Fow+5FRLcgfQjzi0g3IyASORcMtaraR0nz/cOBn4OKryJ71ew3uj2cp
	yY4B5tF1XIbFqkdkHXOrGzfuuDDWOLnbn3WjB5xQ=
Received: from localhost.localdomain (92.188.110.153 [92.188.110.153]) by mx.zohomail.com
	with SMTPS id 1604157256192744.0465096339267; Sat, 31 Oct 2020 08:14:16 -0700 (PDT)
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
Message-ID: <cover.1604156731.git.frederic.pierret@qubes-os.org>
Subject: [PATCH v1 0/2] Reproducibility: use of SOURCE_DATE_EPOCH
Date: Sat, 31 Oct 2020 16:14:06 +0100
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ZohoMailClient: External

It intends to take into account feedback on previous patch removing timesta=
mp
from xen efi binary. If defined, we can set build dates and time variables =
with
respect to SOURCE_DATE_EPOCH. A default value is provided if sources
come from git repository else, that's up to the builder to handle it.

Fr=C3=A9d=C3=A9ric Pierret (fepitre) (2):
  Define build dates/time based on SOURCE_DATE_EPOCH
  Define SOURCE_DATE_EPOCH based on git log

 tools/firmware/hvmloader/Makefile | 4 ++++
 tools/firmware/vgabios/Makefile   | 4 ++++
 xen/Makefile                      | 7 +++++++
 3 files changed, 15 insertions(+)

--=20
2.26.2



