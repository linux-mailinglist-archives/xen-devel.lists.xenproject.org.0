Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 95AC9351547
	for <lists+xen-devel@lfdr.de>; Thu,  1 Apr 2021 15:39:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.104469.199849 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lRxXJ-00065D-2m; Thu, 01 Apr 2021 13:39:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 104469.199849; Thu, 01 Apr 2021 13:39:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lRxXI-00064a-Ut; Thu, 01 Apr 2021 13:39:00 +0000
Received: by outflank-mailman (input) for mailman id 104469;
 Thu, 01 Apr 2021 13:38:59 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=j8z4=I6=citrix.com=george.dunlap@srs-us1.protection.inumbo.net>)
 id 1lRxXH-0005gw-47
 for xen-devel@lists.xenproject.org; Thu, 01 Apr 2021 13:38:59 +0000
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 8e757902-a110-488d-a85f-50f8eca96c28;
 Thu, 01 Apr 2021 13:38:39 +0000 (UTC)
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
X-Inumbo-ID: 8e757902-a110-488d-a85f-50f8eca96c28
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1617284319;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=E7PWP01YlYArqfPdyR9XpVrgVVm/Kk33xKnYE1YhnsI=;
  b=Q69Sa4a3vVt1DgZj+aqqLbZDxa5iZ7emWaz0KePVvS65Yy6UKuyM8Yu5
   yINm6dyaOFimPuyUZPlpP/tG9h6eks+lar3jPG4nyqDvsXoilc0z2P/KA
   A5zO9mCzFX6tCYpjArsWK35KoXp3BWaLLlq42KmFI6zi/PnOh6EyicbRb
   c=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: 2FbHTM9kD8m0dsEYumiLjx7uy99rlr8rMY73D0FWcKTP7Fp5VQNNdSZY8cNLMVkRCOxXfV6Gkh
 dv9vfn2x6dK7twJhhZ9N7bsXhkqmkfRK3Ld6GzDriSnRZ2Wm9sW+aj8zSjjWNm4iMDrGTB9Ohp
 StVbBnYllX4U8kGDAkm9Dzk8Ujt6pArz+XS2RBxndnrpiM+uCi6JFvVPI+erSDyHmrJjOAb8/v
 Qob6fMrOExVQxXgrVcfdIPj+VU4zwiixUcsAN7E8tTeGGOqNPb49Fsj8rUsPTRuPQd+lIOvZFz
 8mc=
X-SBRS: 5.1
X-MesageID: 40557944
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:DnbioK6q07ExB0gFygPXwWWEI+orLtY04lQ7vn1ZYSd+NuSFis
 Gjm+ka3xfoiDAXHEotg8yEJbPoexzh3LZPy800Ma25VAfr/FGpIoZr8Jf4z1TbdxHW3tV2kZ
 1te60WMrDNJHBnkMf35xS5Gd48wN+BtJuln/va0m0Fd2BXQotLhj0JbzqzOEtwWQVAGN4dHJ
 2T+sJIq1ObCAsqR+68AWQIWPWGmsbCk4jobQVDKxks7gSPij3A0s+HLzGz2BACXzRThYoz6G
 StqX2F2oyPkdGejiXd2Wja8ohMlLLapOdrKcSQhqEuW03RoymyYoAJYczkgBkUp6WV5E8ugJ
 3wpX4bTr5OwlfwWk3wnhf3wQnn118Vmgzf4HuVm2Hqr8C8ZB9SMbs5uatjfhHU61UtsbhHuc
 ohtQLp1OsjMTr6kCvw/NTOXR1x/3DExUYKquIPk2dZFbIXdb45l/1uwGpuDJwCECjmgbpXdt
 VGMce03oc1TXqndXzD+kFgzNuwN05DZSuucwwpv8yY1CVuh3Zpz0cU79x3pAZwyLsND7ZD/O
 jKKaJuifVnSdIXd7t0AKM7TdKwEXGle2OCDEuiZXDcUI0XMXPErJD6pJ0z+eGRYZQNiL8/go
 7IXl90vXM7EnieR/Gm7dluyFTgUW+9VTPixoV1/J5ioIDxQ7LtLGmqVE0uu9HImYRdPuTrH9
 KIfL5GCf7qKmXjXaxT2RflZpVUIX4CFOUIp9cAXU6UqM6jEPyrisXrNNLoYJb9GzctXW3yRl
 EZWiLoGclG5ke3HlDihhz8XG7sZ1zf8Zp8HLOyxZlX9KE9cql39iQFg1Ww4c+GbRdYtLYtQU
 d4KLT71oO3zFPGuVrg3iFMAF5wH0xV6LLvXzdhvgkRKX75dr4FppG6cWBW132XGw9nQ6rtYU
 lijmUy3ZjyA42bxCgkBd7iGHmdlWEvqHWDSIpZvaGf+8H/eNcdAow9UKJ8USXHfiYF2DpCmS
 NmUkspV0XfHjThheGOl5oPHtzScNF6nUOMOs5bqXXWsG2GvsExTn4nXzqjOPTnwzoGdn5xvB
 lc4qUfiL2PlXKEMm0kmtk1N1VKdSCqGr5cNR+EY49Vg7jvXwl1QQ6x9HqnoiB2XlCv21QZh2
 TnIyHRXf3QGFJStkpV1bvQ/Epuen+QeF9xbX5GoZRwfF62yEpb4KuuXO6ewmGRYlwNzqUmPD
 bJbSA7Dyluy9q0vSTl0gqqJDED/NEDL+bdBLMsf/XvwXurMpSPjrxDNeRT5oxZONfntfIrXe
 qTdxSOFi7xD/ok1mWu1y8YERgxjENhveLj2RXj4mT94WU2BuDKJk96A54cONOR4gHfNr+1+a
 Q8qehwm+S+Mm/8MIHbjY7WaiNOMRPVryqdSfoypZVdoKI1s/9SEvDgIEz1/UAC+C97CsH+0H
 46auBcxpvqP4d0Zcwcey5D5DMS5Z+yBXpuljazO/M0eFEmsmTSMNyI6YfZsLZHODz0mCLAfX
 2ktxBH9/jLXyG/xacXJqI5L2NRclU94h1ZjZW/XryVLAWhbOdY+lWmdle7bb9GUaCAcI9g4y
 pS0pWtn+WNcTD/1x2VlTxnIrhW+2LiZc+pGgqDFapp9NO9UG78zpeC0YqWjD3tTyG8ZFldrY
 pZdVYIZsAGswIctuQMo2CPY52yhFkknVtY6SxmkVCo+rHO2hakIWh2dSvDgptXWjFPNGOvls
 qty5nB6EjA
X-IronPort-AV: E=Sophos;i="5.81,296,1610427600"; 
   d="scan'208";a="40557944"
From: George Dunlap <george.dunlap@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: George Dunlap <george.dunlap@citrix.com>, Juergen Gross <jgross@suse.com>,
	Jan Beulich <jbeulich@suse.com>, Ian Jackson <ian.jackson@citrix.com>
Subject: [PATCH for-4.15 6/7] CHANGELOG.md: Various entries, mostly xenstore
Date: Thu, 1 Apr 2021 14:38:26 +0100
Message-ID: <20210401133827.362216-6-george.dunlap@citrix.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210401133827.362216-1-george.dunlap@citrix.com>
References: <20210401133827.362216-1-george.dunlap@citrix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

...grouped by submitters / maintainers

Signed-off-by: George Dunlap <george.dunlap@citrix.com>
---
CC: Juergen Gross <jgross@suse.com>
CC: Jan Beulich <jbeulich@suse.com>
CC: Ian Jackson <ian.jackson@citrix.com>
---
 CHANGELOG.md | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/CHANGELOG.md b/CHANGELOG.md
index 2f26cd5c87..9c272a0113 100644
--- a/CHANGELOG.md
+++ b/CHANGELOG.md
@@ -28,8 +28,11 @@ The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/)
  - Factored out HVM-specific shadow code, improving code clarity and reducing the size of PV-only hypervisor builds
  - Added XEN_SCRIPT_DIR configuration option to specify location for Xen scripts, rather than hard-coding /etc/xen/scripts
  - xennet: Documented a way for the backend (or toolstack) to specify MTU to the frontend
+ - Fix permissions for watches on @introduceDomain and @releaseDomain: By default, only privileged domains can set watches; but specific domains can be given permission in order to allow disaggregation.
+ - xenstore can now be live-updated on a running system.
  - Some additional affordances in various xl subcommands.
  - Added the following ARM errata: Cortex A53 #843419, Cortex A55 #1530923, Cortex A72 #853709, Cortex A73 #858921, Cortex A76 #1286807, Neoverse-N1 #1165522
+ - On detecting a host crash, some debug key handlers can automatically triggered to aid in debugging
 
 ### Removed / support downgraded
 
-- 
2.30.2


