Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B6B56B4E11
	for <lists+xen-devel@lfdr.de>; Fri, 10 Mar 2023 18:09:07 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.508537.783276 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pagDp-00026L-Ma; Fri, 10 Mar 2023 17:08:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 508537.783276; Fri, 10 Mar 2023 17:08:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pagDp-00022x-J6; Fri, 10 Mar 2023 17:08:01 +0000
Received: by outflank-mailman (input) for mailman id 508537;
 Fri, 10 Mar 2023 17:08:00 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Hylx=7C=citrix.com=prvs=426f5b69d=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1pagDo-00022r-K1
 for xen-devel@lists.xenproject.org; Fri, 10 Mar 2023 17:08:00 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 17887a98-bf66-11ed-87f5-c1b5be75604c;
 Fri, 10 Mar 2023 18:07:57 +0100 (CET)
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
X-Inumbo-ID: 17887a98-bf66-11ed-87f5-c1b5be75604c
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1678468077;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=qJUHxRCsNx0u9euoS9TNdoV5MXh2jlAdF3MSmsTTQNg=;
  b=VE5Spo3DgUk58XmcBU9cit8ok45wKZyc4U+CMDn8GHp3hbTF3E4yrEqb
   72VPuanGLxStClWLS1ElJKaebpqVXp8m99JZm3IpejN0iNj5w+Em0EAJU
   fHEIN837x5INa4bvTmE4+mttgQB2GrCUEaBTdeK8+PiINWFgkVME0NDr3
   s=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 100764149
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.123
X-Policy: $RELAYED
IronPort-Data: A9a23:F0KSMa+I2iEAdop7pGysDrUDjH6TJUtcMsCJ2f8bNWPcYEJGY0x3y
 jFJCmCBM/mKNGrweNslO4y+oEkDvpbQzIIyTgQ6pX88E34SpcT7XtnIdU2Y0wF+jCHgZBk+s
 5hBMImowOQcFCK0SsKFa+C5xZVE/fjUAOG6UKicYXoZqTZMEE8JkQhkl/MynrlmiN24BxLlk
 d7pqojUNUTNNwRcawr40Ire7kI/1BjOkGlA5AdmPqkT5AW2e0Q9V/rzG4ngdxMUfaEMdgKKb
 76r5K20+Grf4yAsBruN+losWhRXKlJ6FVHmZkt+A8BOsDAbzsAB+v9T2M4nQVVWk120c+VZk
 72hg3ASpTABZcUgkMxFO/VR/roX0aduoNcrKlDn2SCfItGvn9IBDJyCAWlvVbD09NqbDkl3q
 OwyKDohUCvSnum0nKqDEftHvpwseZyD0IM34hmMzBncBPciB5vCX7/L9ZlT2zJYasJmRKiEI
 ZBDMHw2MUqGOkcUUrsUIMtWcOOAj3/jczpeuRSNqLA++WT7xw1tyrn9dtHSf7RmQO0Mxh7H+
 D6fozWR7hcyHdKumDSK9zWXouaUmQb3fqRRRJ2y36s/6LGU7jNKU0BHPbehmtGph0j7V99BJ
 kg8/is1sbN05EGtVsP6XRCzvDiDpBF0c9tPEcUq5QeV0K3W7g2FQG8eQVZ8hMcO7ZFsA2Zwj
 xnQwo2vXGY02FGIdZ6D3o7JvRmyMwQrFj4bbi1YVTNe8fLb+I5m23ojUe1fOKKyi9T0HxT5z
 DaLsDUyit0vsCIb60mo1QuZ2mzx//AlWiZwv1yKBTz9smuVcab/P+SVBU7nAeGsxWpzZn2Ip
 zA6lseX94ji5rndxXXWEI3h8FxEjstp0QEwY3Y1QvHNFBz3oRZPmLy8BxkvTHqFyu5eJVfUj
 Lb74Gu9HqN7MnqwdrNQaImsEcksxqWIPY27CaCPPoQfOsMsK1PvEMRSiam4hT2FraTRuftnZ
 cfznTiEVx729piLPBLpHrxAgNfHNwg1xH/JRICT8vhU+eP2WZJhcp9caAHmRrlgvMu5TPD9r
 4432z2il08OD4UTo0D/reYuELz9BSFmVMGp9ZEJKbXrz8gPMDhJNsI9CIgJI+RN95m5XM+Tp
 hlRhmcwJILDuED6
IronPort-HdrOrdr: A9a23:d2apPansdgKVacUIJYalLctuxGLpDfLo3DAbv31ZSRFFG/Fw9/
 rCoB17726QtN91YhsdcL+7V5VoLUmzyXcX2/hyAV7BZmnbUQKTRekP0WKL+Vbd8kbFh41gPM
 lbEpSXCLfLfCJHZcSR2njELz73quP3jJxBho3lvghQpRkBUdAF0+/gYDzranGfQmN9dP0EPa
 vZ3OVrjRy6d08aa8yqb0N1JNQq97Xw5fTbiQdtPW9f1DWz
X-IronPort-AV: E=Sophos;i="5.98,250,1673931600"; 
   d="scan'208";a="100764149"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Ian Jackson <iwj@xenproject.org>, Roger Pau Monne <roger.pau@citrix.com>,
	Anthony PERARD <anthony.perard@citrix.com>
Subject: [OSSTEST PATCH] PDU/IPMI: Be less aggressive with IPMI commands
Date: Fri, 10 Mar 2023 17:07:21 +0000
Message-ID: <20230310170721.14493-1-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

The machine rimava0 doesn't power off or power on when we keep doing
"power status" then "power off" ipmi command without waiting.

Currently, osstest does:
    loop
	ipmitool power status
	ipmitool power off
	sleep 1

This loop goes on forever, the machine never change power state.
Adding some wait in between both command works.

While here, test for timeout just after a status check instead of
sending the `power off` command again which we would never check the
result of.

Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
---
 Osstest/PDU/ipmi.pm | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Osstest/PDU/ipmi.pm b/Osstest/PDU/ipmi.pm
index 21c94d98..ce498cb7 100644
--- a/Osstest/PDU/ipmi.pm
+++ b/Osstest/PDU/ipmi.pm
@@ -69,10 +69,10 @@ sub pdu_power_state {
     my $count = 60;
     for (;;) {
         last if $getstatus->() eq $onoff;
+        die "did not power $onoff" unless --$count > 0;
+        sleep(1);
 
 	system_checked((@cmd, qw(power), $onoff));
-
-        die "did not power $onoff" unless --$count > 0;
         sleep(1);
     }
 }
-- 
Anthony PERARD


