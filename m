Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0210D44BDBA
	for <lists+xen-devel@lfdr.de>; Wed, 10 Nov 2021 10:22:36 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.224229.387399 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mkjn8-0001dT-K6; Wed, 10 Nov 2021 09:21:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 224229.387399; Wed, 10 Nov 2021 09:21:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mkjn8-0001bk-Gj; Wed, 10 Nov 2021 09:21:14 +0000
Received: by outflank-mailman (input) for mailman id 224229;
 Wed, 10 Nov 2021 09:21:13 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=PBp+=P5=citrix.com=Jane.Malalane@srs-se1.protection.inumbo.net>)
 id 1mkjn7-0001be-4R
 for xen-devel@lists.xenproject.org; Wed, 10 Nov 2021 09:21:13 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 898eaa30-4207-11ec-9787-a32c541c8605;
 Wed, 10 Nov 2021 10:21:09 +0100 (CET)
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
X-Inumbo-ID: 898eaa30-4207-11ec-9787-a32c541c8605
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1636536069;
  h=from:to:cc:subject:date:message-id:mime-version;
  bh=B8/23IjAs7tM8yvKwjTqTj7xnzcShUImgDvG/FDUAGE=;
  b=Y6GU2fR7ZSOnznX0Tkg0UbWjoSJzHZX4hFVXYqF6MUgubBGe8tGNTCTE
   FAiCz92BUGkeLsrKg9uXA7eMsze9927xd6sZ3lLSGrrRpwI+Kb4jeyWsR
   yqDe+0wDSjpgbCKTsezWtLEcZdlGYwE9h7CeotS1W5dYJ2dkUThmX/h3x
   0=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: Nk5V62544xVTdntOQAd9FxaTRb4MfKO5sISBHuDod2XeGX6FBoGoEQCmxD5+Yk7VYc+kx6LHrq
 ACuSoy5ooNY+MJ4OEySYPkMzcvzClEcFvcbcwMK/xnvEL7D+ffUu8K65VSa3iwpmpqE3qGcpWP
 FFrQuIrOwlRU11ICa5QKHnrKAU7TS2LqBRiyOupcp22vlRB5BtZxruIniLpy4Qy2wqQldWMspR
 K0iAPoCrwxAur5KYihfZ3MqAtvJxJNjEU206aIwkJ3q595a9voP2/TeLuKqXcnNDMVUGJcOJ4o
 jFZLZb4mHDsRGe3O89sFOll+
X-SBRS: 5.1
X-MesageID: 57485307
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:Q0/afKu+4jDQ6GFEeDBis1+oyufnVINZMUV32f8akzHdYApBsoF/q
 tZmKTuAPK7ZMzagKd9yPo6y8x8F7Z6Gn4MwHlRtriw9HyoU+JbJXdiXEBz9bniYRiHhoOOLz
 Cm8hv3odp1coqr0/0/1WlTZQP0VOZigHtIQMsadUsxKbVIiGHhJZS5LwbZj29cx2IDhWWthh
 PupyyHhEA79s9JLGjp8B5Kr8HuDa9yr5Vv0FnRnDRx6lAe2e0s9VfrzFonoR5fMeaFGH/bSe
 gr25OrRElU1XfsaIojNfr7TKiXmS1NJVOSEoiI+t6OK2nCuqsGuu0qS2TV1hUp/0l20c95NJ
 NplusSRQAAnGpb1usM7QzlSOD5cE4xC9+qSSZS/mZT7I0zudnLtx7NlDV0sPJ1e8eFyaY1M3
 aVGcnZXNEnF3r/ohuLgIgVvrp1LwM3DHooZtzdFxDXQCf8gTLjIQrnQ5M8e1zA17ixLNauBO
 5pEMmIwBPjGSxxjAw80L5choPbyr3LaVBsD9gORnaVitgA/yyQuieOwYbI5YOeiRNpXtlaVo
 Hrc+Gb0CQ1cM8aQoRKH+H+xgu7EnQvgRZkfUra/85ZCkFCVg2AeFhASfV+6uuWizF6zXcpFL
 E4Z8TZoqrI9nHFHVfGkAUf++iTd+EdBBZwASIXW9T1h1ILbuyeQAWYgdQdjT/o2lMUdWh4E9
 1uGyoaB6SNUjJWZTneU97GxpDy0ODQIIWJqWRLoXTfp8PG4/tht00unosJLVffs04arQW2YL
 yWi9XBm390uYdg3O7JXFLwtqxalvdD3QwE8/W07tUr1v1oiNOZJi2FFgGU3DMqszq7FETFtX
 1BewqByCdzi67nWzERhp81XTNmUCw6tamG0vLKWN8BJG86R03CiZ5tMxzp1OV1kNM0JERewP
 hSN5VMKuMIIYCb7BUOSX25XI59ypUQHPY60Ps04k/IUOsQhHON51Hg2DaJv44wduBd1yvxuU
 XtqWc2tEWwbGcxaIMmeHI8gPUsQ7nlmnwv7HMmjpzz+iOb2TCPFGN8tbQrVBshkvfzsnekg2
 4sGXyd8404EC7OWj+i+2dN7EG3m2lBnX82r8JIOKbbYSuekcUl4Y8LsLXoaU9QNt8xoei3gp
 BlRg2dUlwjyg2PpMwKPZiwxYb/jR88n/3k6ITYtLRCj3H16OdSj66IWdp0We7g79bM8ka4oH
 qddI8jQUO5STjnn+igGacWvpoJVaxn21xmFODCoYWZjcsc4FRDJ4NLtYiDm6DIKUnisrcI7r
 rD5jlHbTJMPSh5MFsHTbP7znVq9sWJEwLB5XlfSI8kVc0LpqdA4Jyv0h/4xAscNNRScmWfKi
 1fIWU8V/LCfrZU0/d/FgbG/g72oS+YuTFBHG2T77KqtMXWI9GSU3oIdAv2DeirQVT2o9fz6N
 /lV1fz1LNYOgE1O79hnC79uwK8zu4nvqrtdwlg2FXnHdQ32WLZpI33A1shTrKxdgLRevFLuC
 E6I/9BbP5SPOd/kTwFNdFZ0MLzb2KFGgCTW4NQ0PF7+tX1+87ewWElPOwWB1X5GJ7xvPYJ5m
 eostab6MeBkZsbG5jpesh1pyg==
IronPort-HdrOrdr: A9a23:v/Q5haslfVVndjVnPNEMfCP87skDYNV00zEX/kB9WHVpmszxra
 6TdZUgpHjJYVkqOE3I9ertBEDiewK5yXcW2/hzAV7KZmCP0wHEEGgL1/qG/9SKIUzDH4Bmup
 uIC5IOauHNMQ==
X-IronPort-AV: E=Sophos;i="5.87,223,1631592000"; 
   d="scan'208";a="57485307"
From: Jane Malalane <jane.malalane@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Jane Malalane <jane.malalane@citrix.com>, Jan Beulich <jbeulich@suse.com>,
	Ian Jackson <iwj@xenproject.org>
Subject: [PATCH] xen/cpufreq: Reset policy after enabling/disabling turbo status
Date: Wed, 10 Nov 2021 09:19:35 +0000
Message-ID: <20211110091935.16906-1-jane.malalane@citrix.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Content-Type: text/plain

Before, user would change turbo status but this had no effect: boolean
was set but policy wasn't reevaluated.  Policy must be reevaluated so
that CPU frequency is chosen according to the turbo status and the
current governor.

Therefore, add __cpufreq_governor() in cpufreq_update_turbo().

Reported-by: <edvin.torok@citrix.com>
Signed-off-by: <jane.malalane@citrix.com>
---
CC: Jan Beulich <jbeulich@suse.com>
CC: Ian Jackson <iwj@xenproject.org>
---

Release rationale:
Not taking this patch means that turbo status is misleading.

Taking this patch is low-risk as it only uses a function that already
exists and is already used for setting the chosen scaling governor.
Essentially, this change is equivalent to running 'xenpm
en/disable-turbo-mode' and, subsequently, running 'xenpm
set-scaling-governor <current governor>'.
---
 xen/drivers/cpufreq/utility.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/xen/drivers/cpufreq/utility.c b/xen/drivers/cpufreq/utility.c
index b93895d4dd..5f200ff3ee 100644
--- a/xen/drivers/cpufreq/utility.c
+++ b/xen/drivers/cpufreq/utility.c
@@ -417,10 +417,14 @@ int cpufreq_update_turbo(int cpuid, int new_state)
     {
         ret = cpufreq_driver.update(cpuid, policy);
         if (ret)
+        {
             policy->turbo = curr_state;
+            return ret;
+        }
     }
 
-    return ret;
+    /* Reevaluate current CPU policy. */
+    return __cpufreq_governor(policy, CPUFREQ_GOV_LIMITS);
 }
 
 
-- 
2.11.0


