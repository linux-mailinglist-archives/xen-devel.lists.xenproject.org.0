Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 344D22A04F5
	for <lists+xen-devel@lfdr.de>; Fri, 30 Oct 2020 13:04:44 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.15741.38862 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kYT92-0003IL-8B; Fri, 30 Oct 2020 12:04:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 15741.38862; Fri, 30 Oct 2020 12:04:36 +0000
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
	id 1kYT92-0003Hu-4d; Fri, 30 Oct 2020 12:04:36 +0000
Received: by outflank-mailman (input) for mailman id 15741;
 Fri, 30 Oct 2020 12:04:34 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+yJr=EF=qubes-os.org=frederic.pierret@srs-us1.protection.inumbo.net>)
 id 1kYT90-0003HV-Cb
 for xen-devel@lists.xenproject.org; Fri, 30 Oct 2020 12:04:34 +0000
Received: from sender4-of-o57.zoho.com (unknown [136.143.188.57])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 9b2810f1-8cf9-481b-b5fc-5821381392f9;
 Fri, 30 Oct 2020 12:04:33 +0000 (UTC)
Received: from localhost.localdomain (92.188.110.153 [92.188.110.153]) by
 mx.zohomail.com with SMTPS id 1604059452261779.7132315246392;
 Fri, 30 Oct 2020 05:04:12 -0700 (PDT)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=+yJr=EF=qubes-os.org=frederic.pierret@srs-us1.protection.inumbo.net>)
	id 1kYT90-0003HV-Cb
	for xen-devel@lists.xenproject.org; Fri, 30 Oct 2020 12:04:34 +0000
X-Inumbo-ID: 9b2810f1-8cf9-481b-b5fc-5821381392f9
Received: from sender4-of-o57.zoho.com (unknown [136.143.188.57])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 9b2810f1-8cf9-481b-b5fc-5821381392f9;
	Fri, 30 Oct 2020 12:04:33 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1604059453; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=h2W/bm1nQCWlg1ACXWIM/W7jYwE1/M8+cvSaYI4R6hlLHfbg3mLNQ0qED6cn16J08ByKX0q+h/pOi+FUMTr+vBQmTDELmQuN5FZ45IWhm3TUNsxeLu0QZJcvjeRhrpDpbXcxzYAQAZstas6ubUUEFstJDxE+6UR+d+91ykqs43s=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1604059453; h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To; 
	bh=Y6WrjRh0df8S3a0pQK8pS6X5+OtEoeqlIRQoXLZLNJA=; 
	b=U0DE2aI/bQpNX0gmyCOwRirI+uW3ElMkcPum6l2F2IoffHAUvty8LZcvMlcdAOYxmblSZjgVRmhtN9thnarFqaw0mTThNeFQwMk+2rrvJ+0S8qO4MCMZdcNLXiIx7z2pw+5uQVWb1dgGlkRLwSI3aXjgEpkEYy9HXOGrn4tp+Tk=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=qubes-os.org;
	spf=pass  smtp.mailfrom=frederic.pierret@qubes-os.org;
	dmarc=pass header.from=<frederic.pierret@qubes-os.org> header.from=<frederic.pierret@qubes-os.org>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1604059453;
	s=s; d=qubes-os.org; i=frederic.pierret@qubes-os.org;
	h=From:To:Cc:Message-ID:Subject:Date:In-Reply-To:References:MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=Y6WrjRh0df8S3a0pQK8pS6X5+OtEoeqlIRQoXLZLNJA=;
	b=Vmq3Ol+rLzBTjjG3Pd/J4NGWmWdwsU0fCcxHHKkDlE+xgZFT3SiAC2utmW+D4Cov
	aVZxc0D69HbX+tbI4T1xJqmk8WhQh4Rs41K0Hk2I2aCLf108mpKW+zjJV+st8/VCTny
	A4zB8KgMaan1vr6l/rv+aizIhcCsSFrrXEyLuNWw=
Received: from localhost.localdomain (92.188.110.153 [92.188.110.153]) by mx.zohomail.com
	with SMTPS id 1604059452261779.7132315246392; Fri, 30 Oct 2020 05:04:12 -0700 (PDT)
From: =?UTF-8?q?Fr=C3=A9d=C3=A9ric=20Pierret=20=28fepitre=29?= <frederic.pierret@qubes-os.org>
To: xen-devel@lists.xenproject.org
Cc: =?UTF-8?q?Fr=C3=A9d=C3=A9ric=20Pierret=20=28fepitre=29?= <frederic.pierret@qubes-os.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Ian Jackson <ian.jackson@eu.citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>
Message-ID: <29b0632e30aba9bc2e071f572fb1067108bcae8c.1603725003.git.frederic.pierret@qubes-os.org>
Subject: [PATCH v1 2/2] xen/common/makefile: remove gzip timestamp
Date: Fri, 30 Oct 2020 13:03:51 +0100
X-Mailer: git-send-email 2.26.2
In-Reply-To: <cover.1603725003.git.frederic.pierret@qubes-os.org>
References: <cover.1603725003.git.frederic.pierret@qubes-os.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ZohoMailClient: External

This is for improving reproducible builds.

Signed-off-by: Fr=C3=A9d=C3=A9ric Pierret (fepitre) <frederic.pierret@qubes=
-os.org>
---
 xen/common/Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/xen/common/Makefile b/xen/common/Makefile
index 06881d023c..32cd650ba8 100644
--- a/xen/common/Makefile
+++ b/xen/common/Makefile
@@ -77,7 +77,7 @@ obj-$(CONFIG_HAS_DEVICE_TREE) +=3D libfdt/
=20
 CONF_FILE :=3D $(if $(patsubst /%,,$(KCONFIG_CONFIG)),$(XEN_ROOT)/xen/)$(K=
CONFIG_CONFIG)
 config.gz: $(CONF_FILE)
-=09gzip -c $< >$@
+=09gzip -n -c $< >$@
=20
 config_data.o: config.gz
=20
--=20
2.26.2



