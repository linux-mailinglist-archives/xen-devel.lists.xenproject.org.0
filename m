Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 779974D2F2C
	for <lists+xen-devel@lfdr.de>; Wed,  9 Mar 2022 13:40:10 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.287813.488027 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nRvbb-0005Dn-2t; Wed, 09 Mar 2022 12:39:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 287813.488027; Wed, 09 Mar 2022 12:39:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nRvba-0005Bt-V8; Wed, 09 Mar 2022 12:39:50 +0000
Received: by outflank-mailman (input) for mailman id 287813;
 Wed, 09 Mar 2022 12:39:50 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=d6dl=TU=citrix.com=prvs=060aafcb7=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1nRvba-0005Bn-5I
 for xen-devel@lists.xenproject.org; Wed, 09 Mar 2022 12:39:50 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0135b684-9fa6-11ec-8eba-a37418f5ba1a;
 Wed, 09 Mar 2022 13:39:49 +0100 (CET)
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
X-Inumbo-ID: 0135b684-9fa6-11ec-8eba-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1646829589;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=PKVg7PMP+xMVPMk4Xr0teJAyqGhLvdHNRwbCgwBnSjE=;
  b=X9qphh21FSuVLx6+gR6lqIefjwmnbHWskF/2J7Bk4LGWFMgSXlkBlshJ
   QZMrhjQuc281aVgnU93E3psVEOofUjBpiG0oVMRJH2+HdynOsuRk2bpTl
   p2Qdh/aNDgAAtfwkhtiBKJGhwDM2MaXrOoEyi5fCnUxa/RRiaX7zCTTPS
   M=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 5.1
X-MesageID: 68164424
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:llsvi6g6d2xCoKG23lBQG5EMX161BxAKZh0ujC45NGQN5FlHY01je
 htvUWyEMv7YNGahKd1+PIyypEsH65KHzNdnGwZvry4wFyob9cadCdqndUqhZCn6wu8v7a5EA
 2fyTvGacajYm1eF/k/F3oDJ9CU6jefSLlbFILas1hpZHGeIcw98z0M78wIFqtQw24LhWFvc4
 YmaT/D3YzdJ5RYlagr41IrbwP9flKyaVOQw5wFWiVhj5TcyplFNZH4tDfjZw0jQG+G4KtWSV
 efbpIxVy0uCl/sb5nFJpZ6gGqECaua60QFjERO6UYD66vRJjnRaPqrWqJPwwKqY4tmEt4kZ9
 TlDiXC/YVsXGYyRyKdEajt3QnhGBKNXp6fpAUHq5KR/z2WeG5ft6/BnDUVwNowE4OdnR2pJ8
 JT0KhhUMErF3bjvhuvmFK883azPL+GyVG8bklhmwSvUErANRpfbTr+RzdRZwC0xloZFGvO2i
 88xN2o2MkicOUEn1lE/M51mlejx2GDFaB4Dhli/tZd083rjw1kkuFTqGIWMIYHbLSlPpW6Iq
 2SD82nnDxUyMN2E1SHD4n+qnvXIny7wRMQVDrLQyxJxqATNnCpJUkRQDAbl56ni4qKjZz5BA
 xAq3Qtz/etrzW6EH4DFZhOp/2aqnidJDrK8DNYGwA2Kz6PV5SOQCW4FUiNNZbQaiSMmedA5/
 gTXxo20XFSDpJXQECvArenM8VteLABIdTdqWMMScecSDzAPSqkXhwmHcNtsGbXdYjbdSWCpm
 GDiQMTTatwuYS83O0eToAivb9GE/MGhousJCuP/BDzNAuRRPtLNWmBQwQKHhcus1a7AJrV7g
 FAKmtKF8McFBoyXmSqGTY0lRe/1uanbbGeM3QIzQfHNEghBHVb5Lei8BxkkeC9U3jssI2e1M
 Cc/RysKjHOsAJdaRfAuON/gYyjb5aPhCc7kRpjpgilmOfBMmPu81Hg2Pya4hjm1+GB1yP1XE
 crLIK6EUCdBYYw6nWXeegvo+eJyrszI7TiIHs6TItXO+ef2WUN5vp9eaQrQNL9ltP3YyOgXm
 v4GX/a3J9xkeLWWSkHqHUQ7cTjm8VBT6UjKlvFq
IronPort-HdrOrdr: A9a23:zebVGKOmh4YvccBcTs2jsMiBIKoaSvp037Eqv3oedfUzSL3+qy
 nOpoV+6faaslYssR0b9exoW5PwJE80l6QFgrX5VI3KNGKN1VdARLsSi7cKqAeAJ8SRzIFgPN
 9bAspDNOE=
X-IronPort-AV: E=Sophos;i="5.90,167,1643691600"; 
   d="scan'208";a="68164424"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: [PATCH 0/2] XSA-398 Followup
Date: Wed, 9 Mar 2022 12:39:34 +0000
Message-ID: <20220309123936.16991-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

Andrew Cooper (2):
  x86/CET: Remove XEN_SHSTK's dependency on EXPERT
  Changelog: Add __ro_after_init and CET

 CHANGELOG.md         | 6 ++++++
 xen/arch/x86/Kconfig | 4 ++--
 2 files changed, 8 insertions(+), 2 deletions(-)

-- 
2.11.0


