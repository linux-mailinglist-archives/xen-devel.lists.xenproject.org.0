Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 823CD3D38A3
	for <lists+xen-devel@lfdr.de>; Fri, 23 Jul 2021 12:25:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.160053.294329 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m6sLh-0002Fq-AH; Fri, 23 Jul 2021 10:24:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 160053.294329; Fri, 23 Jul 2021 10:24:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m6sLh-0002Co-6U; Fri, 23 Jul 2021 10:24:09 +0000
Received: by outflank-mailman (input) for mailman id 160053;
 Fri, 23 Jul 2021 10:24:08 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=uTCe=MP=fujitsu.com=Alan.Robinson@srs-us1.protection.inumbo.net>)
 id 1m6sLf-0002Ci-Fr
 for xen-devel@lists.xenproject.org; Fri, 23 Jul 2021 10:24:08 +0000
Received: from mail1.bemta26.messagelabs.com (unknown [85.158.142.2])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 1a7f3ce2-eba0-11eb-932a-12813bfff9fa;
 Fri, 23 Jul 2021 10:24:04 +0000 (UTC)
Received: from [100.113.0.182] (using TLSv1.2 with cipher
 DHE-RSA-AES256-GCM-SHA384 (256 bits))
 by server-2.bemta.az-a.eu-central-1.aws.symcld.net id 6F/1F-07685-2C89AF06;
 Fri, 23 Jul 2021 10:24:02 +0000
Received: (qmail 26753 invoked from network); 23 Jul 2021 10:24:01 -0000
Received: from unknown (HELO mailhost3.uk.fujitsu.com) (62.60.8.84)
 by server-4.tower-226.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 23 Jul 2021 10:24:01 -0000
Received: from nera12.osd.abg.fsc.net ([172.17.20.104])
 by mailhost3.uk.fujitsu.com (8.14.5/8.14.5) with SMTP id 16NANaxE008069;
 Fri, 23 Jul 2021 11:23:36 +0100
Received: by nera12.osd.abg.fsc.net (Postfix, from userid 5004)
 id DF091440C20; Fri, 23 Jul 2021 12:23:25 +0200 (CEST)
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
X-Inumbo-ID: 1a7f3ce2-eba0-11eb-932a-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1627035843; i=@fujitsu.com;
	bh=3D7uuxiEIDbobr4GSN4apP+qTsHazYZF2I6FjlBzOUg=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:
	 Content-Transfer-Encoding;
	b=K483yfyHfDd76MmZD5GssmtTTzOSFCUSpSO1YjVSDBFpLIhOcWvXhWxcd6yXqTn1b
	 m+l9Uuu4OuW/aFGAwbxc7mmjF8gtQ/6Jam4YcKQME/r1kmzcoK0aCoWjPPEli86Dol
	 gc4PyJJZ/k1iLfCt7UGA1oSFG8p/KcTzg4p0VvfHjerREmA/Mh+zY61IfRXGmvoyD7
	 hOplHK5diCynEuireCsV5kKQK5lHqSN5sP9y6WQGhgA/M0wXMeauhrCvmSvIULw72Q
	 TIWz1WDpIzoVSCuNXF7mDPkZPYqjPWoY9F9OyTqTFDOkmsLYC8BYzdx0zUzLXJrk7i
	 YpNo9ExcGY8bw==
Authentication-Results: mx.messagelabs.com; spf=pass 
  (server-4.tower-226.messagelabs.com: domain of fujitsu.com designates 
  85.158.142.101 as permitted sender) smtp.mailfrom=fujitsu.com; dkim=none 
  (message not signed); dmarc=pass (p=none sp=none adkim=r aspf=r) 
  header.from=fujitsu.com
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrNIsWRWlGSWpSXmKPExsViZ8MRontwxq8
  Eg1sTbSxOnOhhsri7+CK7xYvNORZzbhpZfFwjbvF9y2QmBzaP15MnMHpsaHrD5nH4wxUWj/Vb
  rrJ4nL41i81j2sdtLAFsUayZeUn5FQmsGd/+TmUp+Mhd8f3TVvYGxi/sXYxcHEICixglVm3dz
  NbFyAnklEu8272MHcRmE9CXeHjtHCuILSKgJHFv1WQmkAZmgVOMEhtaNrGAJIQFrCT23LkGVs
  QioCrx4doboDgHB6+ArcTnjdwgYQkBeYn25dvB5vMKCEqcnPkErJVZQFti2cLXzBMYuWchSc1
  CklrAyLSK0TKpKDM9oyQ3MTNH19DAQNfQ0FgXSJoa6iVW6SbqpZbqJqfmlRQlAmX1EsuL9Yor
  c5NzUvTyUks2MQLDMaWQYfoOxjVvPugdYpTkYFIS5WXq/5UgxJeUn1KZkVicEV9UmpNafIhRh
  oNDSYJ36jSgnGBRanpqRVpmDjA2YNISHDxKIrzxU4HSvMUFibnFmekQqVOMuhxNH5YsYhZiyc
  vPS5US5/WbDlQkAFKUUZoHNwIWp5cYZaWEeRkZGBiEeApSi3IzS1DlXzGKczAqCfMmgUzhycw
  rgdv0CugIJqAjTnX9BDmiJBEhJdXAtG7trkON2Q94A+VZ9Y9fmKnIkSFXObn5zPF9tV78b7MT
  FkucYjkcUfyWp1T2RJZKmKh86ayOkDf3n6od87Kvidl6dNPqQ3/OJizwDquaLBPtMaU+qzjn1
  Upfg/sr5qq5vH/2zbCSeaKv09d2h1+MT+yPSX+6GV7VIrFmq0ZxrETYwWmdvgrx1guPfrB9pL
  VwyoEtRguKNYvYqxI1Y6Ryf7PwbLmglt92NUD/56KJeeHHJtdxx9xemWhaWbRlpiLPe0sTQ8f
  ANJ7STRrXp6e42yxsmZnJv8WinGvjkvy038cZjgQ2Vc7M1Li4wzFFqSWQd3+IQdOXyxNnP3mX
  OclQ5OqFudGJ829EWmul13IrsRRnJBpqMRcVJwIASzYSDU4DAAA=
X-Env-Sender: Alan.Robinson@fujitsu.com
X-Msg-Ref: server-4.tower-226.messagelabs.com!1627035841!77980!1
X-Originating-IP: [62.60.8.84]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received:
X-StarScan-Version: 9.81.3; banners=-,-,-
X-VirusChecked: Checked
From: Alan Robinson <Alan.Robinson@fujitsu.com>
To: xen-devel@lists.xenproject.org
Cc: Alan Robinson <alan.robinson@fujitsu.com>,
        Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>,
        Anthony PERARD <anthony.perard@citrix.com>,
        Juergen Gross <jgross@suse.com>
Subject: [PATCH] tools/libxl: add missing blank in message
Date: Fri, 23 Jul 2021 12:23:08 +0200
Message-Id: <20210723102308.5332-1-Alan.Robinson@fujitsu.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

From: Alan Robinson <alan.robinson@fujitsu.com>

Add trailing blank to first part of concatenated string giving
"an emulated" instead of "anemulated".

Signed-off-by: Alan Robinson <alan.robinson@fujitsu.com>
---
 tools/libs/light/libxl_dm.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/tools/libs/light/libxl_dm.c b/tools/libs/light/libxl_dm.c
index dbd3c7f278..755641604a 100644
--- a/tools/libs/light/libxl_dm.c
+++ b/tools/libs/light/libxl_dm.c
@@ -1893,7 +1893,7 @@ static int libxl__build_device_model_args_new(libxl=
__gc *gc,
                 if (format =3D=3D NULL) {
                     LOGD(WARN, guest_domid,
                          "Unable to determine disk image format: %s\n"
-                         "Disk will be available via PV drivers but not =
as an"
+                         "Disk will be available via PV drivers but not =
as an "
                          "emulated disk.",
                          disks[i].vdev);
                     continue;
@@ -1905,7 +1905,7 @@ static int libxl__build_device_model_args_new(libxl=
__gc *gc,
=20
                 if (!target_path) {
                     LOGD(WARN, guest_domid, "No way to get local access =
disk to image: %s\n"
-                         "Disk will be available via PV drivers but not =
as an"
+                         "Disk will be available via PV drivers but not =
as an "
                          "emulated disk.",
                          disks[i].vdev);
                     continue;
--=20
2.26.2


