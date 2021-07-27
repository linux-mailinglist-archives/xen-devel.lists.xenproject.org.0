Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 70DBD3D708D
	for <lists+xen-devel@lfdr.de>; Tue, 27 Jul 2021 09:48:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.161075.295764 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m8Hp3-0001zF-Cd; Tue, 27 Jul 2021 07:48:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 161075.295764; Tue, 27 Jul 2021 07:48:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m8Hp3-0001wf-9T; Tue, 27 Jul 2021 07:48:17 +0000
Received: by outflank-mailman (input) for mailman id 161075;
 Tue, 27 Jul 2021 07:48:15 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Gco/=MT=fujitsu.com=Alan.Robinson@srs-us1.protection.inumbo.net>)
 id 1m8Hp1-0001wX-GR
 for xen-devel@lists.xenproject.org; Tue, 27 Jul 2021 07:48:15 +0000
Received: from mail1.bemta25.messagelabs.com (unknown [195.245.230.65])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id ff1ee7e2-eeae-11eb-96d9-12813bfff9fa;
 Tue, 27 Jul 2021 07:48:14 +0000 (UTC)
Received: from [100.112.198.115] (using TLSv1.2 with cipher
 DHE-RSA-AES256-GCM-SHA384 (256 bits))
 by server-1.bemta.az-b.eu-west-1.aws.symcld.net id A9/8A-03155-C3ABFF06;
 Tue, 27 Jul 2021 07:48:12 +0000
Received: (qmail 1782 invoked from network); 27 Jul 2021 07:48:12 -0000
Received: from unknown (HELO mailhost1.uk.fujitsu.com) (62.60.8.148)
 by server-14.tower-287.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 27 Jul 2021 07:48:12 -0000
Received: from nera12.osd.abg.fsc.net ([172.17.20.104])
 by mailhost1.uk.fujitsu.com (8.14.5/8.14.5) with SMTP id 16R7m4da019505;
 Tue, 27 Jul 2021 08:48:05 +0100
Received: by nera12.osd.abg.fsc.net (Postfix, from userid 5004)
 id C582A4427B4; Tue, 27 Jul 2021 09:48:01 +0200 (CEST)
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
X-Inumbo-ID: ff1ee7e2-eeae-11eb-96d9-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1627372093; i=@fujitsu.com;
	bh=oxHVKLYi/Dc8DU43SJKSIIV8CAdX4OrcyT8cQHFsVU4=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:
	 Content-Transfer-Encoding;
	b=S6eiWr76SphR3CgSFd6fHDtwsVh8GdUCqtNTZiIV8cCggkbhxAfEJyzwUufifG/1A
	 K+jVQr7T40nou5vLwVsSU2HFPTGNaTSR1mbBAKckNfGw9boIqQedNWufDFi6Ln+tTr
	 Qycg9zrPVIZl9hlDl+vKjEOMlXoOm9oyIwRr5SpLJV0J+WstIbCoF4UiD+VPSw4aRY
	 DwDXULZ2/tYnpQBf/0D0no/9GiSzzlqaaLwc8W1vZ51yTUqYG6aFfUK4fYRffH155g
	 xCPIvHN4aeeXwaJeXVhGbcUCITSC9WrlJxlj7n7jlg3HomkjKKfwkLfLNFX1O+qidU
	 CLekmtzRUdDOw==
Authentication-Results: mx.messagelabs.com; spf=pass 
  (server-14.tower-287.messagelabs.com: domain of fujitsu.com designates 
  46.226.52.199 as permitted sender) smtp.mailfrom=fujitsu.com; dkim=none 
  (message not signed); dmarc=pass (p=none sp=none adkim=r aspf=r) 
  header.from=fujitsu.com
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrFIsWRWlGSWpSXmKPExsViZ8MxRddm1/8
  Eg5NLeSxOnOhhsri7+CK7xYvNORZzbhpZfFwjbvF9y2QmBzaP15MnMHpsaHrD5nH4wxUWj/Vb
  rrJ4nL41i81j2sdtLAFsUayZeUn5FQmsGVse32YruMRT8e/+LJYGxiUcXYxcHEICixglvl/dw
  dLFyAnklEs0vvkEZrMJ6Es8vHaOFcQWEVCSuLdqMhNIA7PAX0aJUw92AhVxcAgL2Er8m1ILUs
  MioCpxueMVG4jNK2AnseLFCzBbQkBeon35dqi4oMTJmU/A5jMLaEssW/iaeQIj9ywkqVlIUgs
  YmVYxWiQVZaZnlOQmZuboGhoY6BoaGukaWlrqGhmZ6yVW6SbppZbqlqcWl+ga6iWWF+sVV+Ym
  56To5aWWbGIEBmNKwfHHOxhXvPmgd4hRkoNJSZQ3tuB/ghBfUn5KZUZicUZ8UWlOavEhRhkOD
  iUJ3sodQDnBotT01Iq0zBxgZMCkJTh4lER4hbcDpXmLCxJzizPTIVKnGHU5mj4sWcQsxJKXn5
  cqJc5rBjJDAKQoozQPbgQsSi8xykoJ8zIyMDAI8RSkFuVmlqDKv2IU52BUEuZNBJnCk5lXArf
  pFdARTEBHBNf/BTmiJBEhJdXAtNwm4bnspDTfv4wvljsr6S2WcZ1xp0XULTaqQJDjhJbCb9s0
  l/C5/n9Vm700F+6REv+hXLN406cVt3jdLFcxtux/WSXZw3tks3iBzIzYftfv5u91VF86uS5M+
  Nv3glFs9ZWXyRdElat+d7Tk3+2KmrKOl+3Qiv09rqd5lonfyvbcqBC5w4hP5k99xserz7r5dz
  j96+PcJM42o3vq2sBQ++mFAgda9R/WffCMyOm9P5Hn0NJLy3bVG/C+zbqRZiU+cdvqQ8+PtUz
  OC/G9V9Y4d6HDr501i86WS4ovPmxg2yimb5tnzPhrd5XsdtE1gkeuzpA+s2lfms1srmS5Gqu+
  0k2X3nrEbJBV1gnavtVfiaU4I9FQi7moOBEAIKduZU0DAAA=
X-Env-Sender: Alan.Robinson@fujitsu.com
X-Msg-Ref: server-14.tower-287.messagelabs.com!1627372091!132291!1
X-Originating-IP: [62.60.8.148]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received:
X-StarScan-Version: 9.81.3; banners=-,-,-
X-VirusChecked: Checked
From: Alan Robinson <Alan.Robinson@fujitsu.com>
To: xen-devel@lists.xenproject.org
Cc: Alan Robinson <Alan.Robinson@fujitsu.com>,
        Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>,
        Anthony PERARD <anthony.perard@citrix.com>,
        Juergen Gross <jgross@suse.com>,
        Alan Robinson <alan.robinson@fujitsu.com>
Subject: [PATCH v2] tools/libxl: add missing blank in message
Date: Tue, 27 Jul 2021 09:47:03 +0200
Message-Id: <20210727074703.19865-1-Alan.Robinson@fujitsu.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Add missing blank giving "an emulation" instead of "anemulation"
while making the text a single source line.

Signed-off-by: Alan Robinson <alan.robinson@fujitsu.com>
---

Changed since v1:
  * text as as single line, requested by Juergen

 tools/libs/light/libxl_dm.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/tools/libs/light/libxl_dm.c b/tools/libs/light/libxl_dm.c
index dbd3c7f278..5cc8ce34c2 100644
--- a/tools/libs/light/libxl_dm.c
+++ b/tools/libs/light/libxl_dm.c
@@ -1893,8 +1893,7 @@ static int libxl__build_device_model_args_new(libxl=
__gc *gc,
                 if (format =3D=3D NULL) {
                     LOGD(WARN, guest_domid,
                          "Unable to determine disk image format: %s\n"
-                         "Disk will be available via PV drivers but not =
as an"
-                         "emulated disk.",
+                         "Disk will be available via PV drivers but not =
as an emulated disk.",
                          disks[i].vdev);
                     continue;
                 }
@@ -1905,8 +1904,7 @@ static int libxl__build_device_model_args_new(libxl=
__gc *gc,
=20
                 if (!target_path) {
                     LOGD(WARN, guest_domid, "No way to get local access =
disk to image: %s\n"
-                         "Disk will be available via PV drivers but not =
as an"
-                         "emulated disk.",
+                         "Disk will be available via PV drivers but not =
as an emulated disk.",
                          disks[i].vdev);
                     continue;
                 }
--=20
2.26.2


