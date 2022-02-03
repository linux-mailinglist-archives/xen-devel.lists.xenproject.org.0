Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F88B4A8B42
	for <lists+xen-devel@lfdr.de>; Thu,  3 Feb 2022 19:12:17 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.264915.458195 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nFgZG-0003yW-48; Thu, 03 Feb 2022 18:10:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 264915.458195; Thu, 03 Feb 2022 18:10:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nFgZG-0003wk-0Y; Thu, 03 Feb 2022 18:10:50 +0000
Received: by outflank-mailman (input) for mailman id 264915;
 Thu, 03 Feb 2022 18:10:48 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Ap74=SS=citrix.com=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1nFgZE-0003we-Hk
 for xen-devel@lists.xenproject.org; Thu, 03 Feb 2022 18:10:48 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9ae54ff9-851c-11ec-8f75-fffcc8bd4f1a;
 Thu, 03 Feb 2022 19:10:46 +0100 (CET)
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
X-Inumbo-ID: 9ae54ff9-851c-11ec-8f75-fffcc8bd4f1a
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1643911846;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=so4Am0ORuGtCYnjcacxrQ0MqF+d7F1NVZVzTcDC95c8=;
  b=LTbFtNUjitkSalaVKmicwcf0VSSng/UD76LRu6pHcFGybgK82BF44Bqp
   lb2DNLDSCnzbdPy3pJhBRlpbVBQ3djMaBVmKVRkurY7rSm0XgFB1IFbHm
   sK9PnspVQKVzdXqNm8Gjc92zO9JSRlezkRIYugR2gemnLRnVkcsR16zSX
   M=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: 0cJLhdgVgeTWPX0OBNrZBO+1608NV+oplHmRa+wi/qP9ud14YIyywaTWPwAOcvWAelIwLZnXE2
 Xd2v0T8G8Zh55Pdso2Q8IjQPX068wbnh+/kgp0But1JeADBGoxB9RgE13EB1Uxfszfj6w5l5mI
 OfG6iaw3AVaLEu1q+ig3OidsWSrKEfa3auhEx/yYCUECE/OjvLnOaeSwLQXfGafrGqHjZIQTyp
 4/jUVT5UDx+COO7Z0CvQz7CeTd47avSMD2wVD6EKAvrSGH3AvvjY/vNKE0hoCCnpcuI3jyi6qJ
 wFesTIlidN6EVBGtBXiHl06g
X-SBRS: 5.2
X-MesageID: 63439656
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:tWQh4a24BXGfZoB7JvbD5TR2kn2cJEfYwER7XKvMYLTBsI5bp2ECz
 WAdXT2PP/6MYGH1c9pxPIjj8xkH78Lcy9NqHQo9pC1hF35El5HIVI+TRqvS04J+DSFhoGZPt
 Zh2hgzodZhsJpPkS5PE3oHJ9RGQ74nRLlbHILOCanAZqTNMEn9700o5w7Vh2OaEvPDia++zk
 YKqyyHgEAfNNw5cagr4PIra9XuDFNyr0N8plgRWicJj5TcypFFMZH4rHomjLmOQf2VhNrXSq
 9Avbl2O1jixEx8FUrtJm1tgG6EAaua60QOm0hK6V0U+6/TrS+NbPqsTbZIhhUlrZzqhx9Z/w
 9FNsLmKRwJyPoD1nbURFD1/HHQrVUFG0OevzXmXtMWSywvNcmf2wuUoB0YzVWEa0r8pWycUr
 6VecW1TKEDY7w616OvTpu1Er8IvNsT0eqgYvWlt12rxBvc6W5HTBa7N4Le02R9u3ZwVTKiDO
 aL1bxJEPB3bch1iHW4VJ5l5lv2likDnfABx/Qf9Sa0fvDGIkV0ZPKLWGPj/d8GORM5Vtl2Fv
 W+A9GP8ajkYO8aY0iGt6W+3i6nEmiaTcJIfEvi0++BnhHWXx3cPE1sGWF2ju/67h0WiHdVFJ
 CQ85S4GvaU0skuxQbHAswaQ+SDe+ERGApwJTrN8uFrlJrfoDxixXm4KRTpBbfkcusptRRET0
 w6F2PfOCmk62FGKck61+rCRpDK0HCEaK24eeCMJJTc4D8nfTJIb1UyWEIs6eEKhppisQGyrn
 WjWxMQrr+hL1aY2O7OHEUcrat5GjrzAVUYL6wreRQpJBSspNdf+N+REBbU2hMuszbp1rHHc5
 BDoeODEtYji6K1hcgTXG43h+5nyv5643MX02wIHInXY323FF4SfVY5R+ipiA0xiL9wJfzTkC
 GeK518KtMQOYib7NvAsC25UNyjM5fK7fTgCfquMBuein7ArLFPXlM2QTRL4M5/RfLgEzvhkZ
 MbznTeEBncGE6V3pAdatM9GuYLHMhsWnDuJLbiilkzP+ePHOBa9FOlZWHPTMLFRxP7U8W39r
 ocEX+PXmko3bQELSnSNmWLlBQpUfSFT6FGfg5E/S9Nv1SI9STx4Vq+Mneh8E2Gn9owM/tr1E
 riGchcw4DLCabfvcG1ms1hvN+HiW4hRt3U+MXB+NFqkwSF7M42u8L0eZ908erx+rL5vyvt9T
 v8kfcScA6sQFmSbqmpFNZSt/pZ/cBmLhB6VO3b3ajYIYJM9FRfC/cXpf1Wz+XBWXDa3r8Y3v
 5apyhjfHcgYXw1nAcuPMKCvwlq9sGIzguV3W0eUcNBfdF+1qNphKjDrj+9xKMYJcE2Ryjyf3
 geQIBEZueiS/NNlrIiX3fiJ9t77HfF/E0xWG3jgwYy3bSSKrHC+xYJgUfqTeWyPXm3D56j/N
 /5eyOvxMaNbkQ8S4ZZ8Cbti0Yk3+8Dr++1B1g1hEXjGMwarB7dnLiXU1MVDrPQQlLpQuA/wU
 UOT4NhKf76OPZq9QlIWIQMkaMWF1O0VxWaOvahkfh2i6X8l5qeDXGVTIwKI2X5UI7ZCOY84x
 fss5ZwN4Aulhxt2atuLg0i4LYhXwqDsh0n/iqwnPQ==
IronPort-HdrOrdr: A9a23:3H3d8qrLIKwxO6Z4e393bNwaV5oleYIsimQD101hICG8cqSj9v
 xG+85rsyMc6QxhP03I9urwW5VoLUmyyXcX2/h0AV7BZniFhILAFugLhuGOrwEIcxeOj9K1vp
 0BT0ERMrPN5CBB/KPH3DU=
X-IronPort-AV: E=Sophos;i="5.88,340,1635220800"; 
   d="scan'208";a="63439656"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
	<JBeulich@suse.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>, Anthony PERARD
	<anthony.perard@citrix.com>, Juergen Gross <jgross@suse.com>
Subject: [PATCH] tools/guest: Fix comment regarding CPUID compatibility
Date: Thu, 3 Feb 2022 18:10:23 +0000
Message-ID: <20220203181023.1554-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

It was Xen 4.14 where CPUID data was added to the migration stream, and 4.13
that we need to worry about with regards to compatibility.  Xen 4.12 isn't
relevant.

Expand and correct the commentary.

Fixes: 111c8c33a8a1 ("x86/cpuid: do not expand max leaves on restore")
Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Wei Liu <wl@xen.org>
CC: Anthony PERARD <anthony.perard@citrix.com>
CC: Juergen Gross <jgross@suse.com>

Roger, this also has a knock-on effect on your CPUID series.  The 4.12 had
been nagging me for a while before I figured out why.
---
 tools/libs/guest/xg_cpuid_x86.c | 15 ++++++++++++---
 1 file changed, 12 insertions(+), 3 deletions(-)

diff --git a/tools/libs/guest/xg_cpuid_x86.c b/tools/libs/guest/xg_cpuid_x86.c
index b9e827ce7eb0..57f81eb0a082 100644
--- a/tools/libs/guest/xg_cpuid_x86.c
+++ b/tools/libs/guest/xg_cpuid_x86.c
@@ -497,9 +497,19 @@ int xc_cpuid_apply_policy(xc_interface *xch, uint32_t domid, bool restore,
     if ( restore )
     {
         /*
-         * Account for feature which have been disabled by default since Xen 4.13,
-         * so migrated-in VM's don't risk seeing features disappearing.
+         * Xen 4.14 introduced support to move the guest's CPUID data in the
+         * migration stream.  Previously, the destination side would invent a
+         * policy out of thin air in the hopes that it was ok.
+         *
+         * This restore path is used for incoming VMs with no CPUID data
+         * i.e. originated on Xen 4.13 or earlier.  We must invent a policy
+         * compatible with what Xen 4.13 would have done on the same hardware.
+         *
+         * Specifically:
+         * - Clamp max leaves.
+         * - Re-enable features which have become (possibly) off by default.
          */
+
         p->basic.rdrand = test_bit(X86_FEATURE_RDRAND, host_featureset);
         p->feat.hle = test_bit(X86_FEATURE_HLE, host_featureset);
         p->feat.rtm = test_bit(X86_FEATURE_RTM, host_featureset);
@@ -509,7 +519,6 @@ int xc_cpuid_apply_policy(xc_interface *xch, uint32_t domid, bool restore,
             p->feat.mpx = test_bit(X86_FEATURE_MPX, host_featureset);
         }
 
-        /* Clamp maximum leaves to the ones supported on 4.12. */
         p->basic.max_leaf = min(p->basic.max_leaf, 0xdu);
         p->feat.max_subleaf = 0;
         p->extd.max_leaf = min(p->extd.max_leaf, 0x8000001c);
-- 
2.11.0


