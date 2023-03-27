Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 65EC16CA61A
	for <lists+xen-devel@lfdr.de>; Mon, 27 Mar 2023 15:38:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.515275.797977 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pgn3F-0002Hz-NG; Mon, 27 Mar 2023 13:38:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 515275.797977; Mon, 27 Mar 2023 13:38:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pgn3F-0002FL-K9; Mon, 27 Mar 2023 13:38:21 +0000
Received: by outflank-mailman (input) for mailman id 515275;
 Mon, 27 Mar 2023 13:38:19 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=s+OC=7T=citrix.com=prvs=44343e547=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1pgn3D-0002FF-U8
 for xen-devel@lists.xenproject.org; Mon, 27 Mar 2023 13:38:19 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a11c303e-cca4-11ed-85db-49a42c6b2330;
 Mon, 27 Mar 2023 15:38:18 +0200 (CEST)
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
X-Inumbo-ID: a11c303e-cca4-11ed-85db-49a42c6b2330
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1679924298;
  h=date:from:to:subject:message-id:mime-version;
  bh=1Vm/XmJespN+zR/alM23zOnU/EoDRb4nphiwjRzfvbs=;
  b=IR14WewhO6dPdiOXR5KosgZgLSY16Sro4ezXgSp17QKz93oiOo3Ri4v7
   i3hqXhbKrQSQygVIrD3u+ixBS4d4aeYvpFfzAH9j8s901y+ahoXJ3vUew
   6iA3KEDGhRFgeBpey5lZbpB/nJSHe9a/KJ3iklNyrRaWzyQBtmwTqPPEg
   U=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 103403407
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.123
X-Policy: $RELAYED
IronPort-Data: A9a23:pP0dXKParupJEF3vrR3Ml8FynXyQoLVcMsEvi/4bfWQNrUor0zYPx
 jAbWD+FOPeMMWXzctl/Po/l/U9UsZXUzNFiSgto+SlhQUwRpJueD7x1DKtS0wC6dZSfER09v
 63yTvGacajYm1eF/k/F3oDJ9CU6jufQAOKnUoYoAwgpLSd8UiAtlBl/rOAwh49skLCRDhiE/
 Nj/uKUzAnf8s9JPGj9SuvLrRC9H5qyo42tD5ANmPJingXeF/5UrJMNHTU2OByOQrrl8RoaSW
 +vFxbelyWLVlz9F5gSNy+uTnuUiG9Y+DCDW4pZkc/HKbitq/0Te5p0TJvsEAXq7vh3S9zxHJ
 HehgrTrIeshFvWkdO3wyHC0GQkmVUFN0OevzXRSLaV/ZqAJGpfh66wGMa04AWEX0uFVXFlcy
 eIfEjJTRwzEmOWm7JmcWuY506zPLOGzVG8eknRpzDWfBvc6W5HTBa7N4Le03h9p2JoIR6yHI
 ZNEN3w2Nk+ojx5nYz/7DLo3mvuogX/uNSVVsluPqYI84nTJzRw327/oWDbQUoXSHpkNxRrA+
 Qoq+UzmHk8zDviTxQPVyUqineGIvBvwapkrQejQGvlC3wTImz175ActfVKjrOOwkEKWR9NVI
 EtS8S0rxYAi+UruQtTjUhmQpH+fogVaS9dWC/c96gyG1uzT+QnxO4QfZmcfMpp87pZwHGF0k
 AbTxLsFGACDrpWSay+l5IuKqgmwZwEJanAFdQMvahsKtoyLTJ4Isv7fcjpyOPfr0YyrR2yqm
 GjiQDsW3OtK05NSv0mv1RWe2m/3+MCUJuIgzl+PNl9J+D+Vc2JMi2aAzVHApchNI4+CJrVql
 ChVwpPOhAzi4HzkqcBsfAnuNOvzjxp9GGeA6WOD5rF4n9hXx1atfJpL/BZ1L1pzP8APdFfBO
 RGM6FMMucECZiP7Msebhr5d7Ox0pZUM6Py/DqyEBjawSsEZmPC7ENFGOhfLgjGFfLkEmqAjI
 5aLGfuR4YIhIf0/llKeHr5NuYLHMwhinQs/s7inlUX4uVdfDVbJIYo43KymMr9pt/PY/FSKm
 zudXuPToyhivCTFSnG/2eYuwZoicRDX2bieRxRrS9O+
IronPort-HdrOrdr: A9a23:c4jCr6xXgdWmWAjAVSAhKrPwBL1zdoMgy1knxilNYDdeeKWj5r
 uTdTogpGbJYVcqKQkdcLW7UpVoLkmskKKdjbNhX4tKGTOW21dAT7sC0WKB+UyFJ8SWzIc0vp
 uIMZIfNDSaNykcsS+V2njfLz/i+rW6GWKT6Ns2A00DceiiUc9d0zs=
X-IronPort-AV: E=Sophos;i="5.98,294,1673931600"; 
   d="scan'208";a="103403407"
Date: Mon, 27 Mar 2023 14:38:12 +0100
From: Anthony PERARD <anthony.perard@citrix.com>
To: <xen-devel@lists.xenproject.org>
Subject: OSSTEST: adding back rimava0 and rimava1 in production
Message-ID: <147fcf8a-17f5-45ba-ad99-c93cd2957a4b@perard>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

Hi,

Just to let you know that we've added both machines "rimava0" and
"rimava1" in back in production. I did run a whole "xen-unstable" flight on
just those two machines and it looked fine.

Cheers,

-- 
Anthony PERARD

