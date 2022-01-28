Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9316B49FAAC
	for <lists+xen-devel@lfdr.de>; Fri, 28 Jan 2022 14:30:38 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.262003.454043 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nDRKH-0005VD-0X; Fri, 28 Jan 2022 13:30:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 262003.454043; Fri, 28 Jan 2022 13:30:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nDRKG-0005ON-Ds; Fri, 28 Jan 2022 13:30:04 +0000
Received: by outflank-mailman (input) for mailman id 262003;
 Fri, 28 Jan 2022 13:30:02 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5Vxm=SM=citrix.com=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1nDRKE-0003aP-1Z
 for xen-devel@lists.xenproject.org; Fri, 28 Jan 2022 13:30:02 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 64628690-803e-11ec-8f75-fffcc8bd4f1a;
 Fri, 28 Jan 2022 14:30:00 +0100 (CET)
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
X-Inumbo-ID: 64628690-803e-11ec-8f75-fffcc8bd4f1a
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1643376600;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=553IIZvT2PCyQvNhYbatU6CdNT8wA+Ucg/LmMu9hXmw=;
  b=I7ALQtFHwQ+VNcQ3IP1mAOs7isbeKqk1v7f5N0/I5X5NTJJDzkTkFuug
   Hm62Ghhu+hFTHo8bZ8oKSMOipWAWhxTaw5W7ZzGD691z/UHplrG7pXslL
   y1eeMGKwNSLThztMWnp7OBHBmHSYA6r5Klgq5RE+3wgQhVguOAVAW7POI
   4=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: nZ2cejdBDX8oMSUGjR2N26zF1FbjTVo929lAUx01Xqwm40ANi85U1Sd2OlG6+iBkFwctGmOwIX
 4eFkYH9kRi3ubfR1/L20YXM5ak6/TL4AsGLfxWHGQb+RZNaQUfgjCa0HduBirFHMaWEla9c/sX
 7FecPSCerunJ5OtARsar6l/acMC4x9UZDtjPzSX9G/7zGWKazlX/Hu7k2nQ1pgNLjazthIvvKv
 RynbwNibEZba6bMNg/01U5SoLYMWKL+Oo7ta/qMVcFE/62kd51a5xZ/2AT07ani7m3yp2G8roU
 5NRcXPAX9kczz0JZSiLjSYkI
X-SBRS: 5.2
X-MesageID: 65159876
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:YLCM+qKiRBYYAj4uFE+RBZIlxSXFcZb7ZxGr2PjKsXjdYENS1jIOm
 GtMCzrSMvveazanL40kady3oU9UuMODyIM2SQBlqX01Q3x08seUXt7xwmUcns+xwm8vaGo9s
 q3yv/GZdJhcokcxIn5BC5C5xZVG/fjgqoHUVaiUakideSc+EH170Us5y7Zl6mJVqYPR7z2l6
 IuaT/L3YDdJ6xYsWo7Dw/vewP/HlK2aVAIw5jTSV9gS1LPtvyB94KYkDbOwNxPFrrx8RYZWc
 QphIIaRpQs19z91Yj+sfy2SnkciGtY+NiDW4pZatjTLbrGvaUXe345iXMfwZ3u7hB21xYxhl
 NcdjqadTA4ZboDIlP0ncBxxRnQW0a1uoNcrIFC6uM2XiUbHb2Ht07NlC0Re0Y8wo7gtRzsUr
 LpBdW5LPkvra+GemdpXTsFFgMg5IdatF4QYonx6lhnSDOo8QICFSKLPjTNd9Glt350fTamAD
 yYfQRFkShHxWkF/A2wON81jjr/v33zAKDIN/Tp5ooJoujOOnWSdyoPFL979atGMA8JPkS6wh
 EjL4mD4CREyL8GExHyO9XfErv/Cm2b3VZwfEJW89+V2mxuDy2oLEhoUWFCn5/6jhSaDt8l3c
 hJOvHB09O5rqRLtHoKVswCETGCsgkRAS4ZSQ9YAxQSE+vr55wqAPEsBZ2sUADA5j/MeSTsv3
 16PutrmAz1zrbGYIU6gGqeoQSCaYnZMczJbDcMQZU5cuoS4/tlv5v7aZos7SMaIYsvJ9SYcK
 txghAw3nP0tgMECzM1XFniX0mv39vAlouPYjzg7v15JDCskPOZJhKTysDA3CMqsyq7DEzFtW
 1Bfw6CjABgmV83lqcB0aLxl8EuVz/iEKibAplVkAoMs8T+gk1b6I9wLumomfxk0aptVEdMMX
 KM1kVkPjHO0FCDyBZKbnqrrU5h6pUQePYqNug/ogipmPcEqKV7vENBGbk+MxWH9+HXAYolkU
 ap3hf2EVC5AYYw+lWLeb75EjdcDm35irUuOG8GT50n3gNK2OS/OIZ9YYQTmUwzMxP7eyOkj2
 4wBZ5LiJtQ2eLCWXxQ7BqZKfQlVdiBqXM6vwyGVH8baSjdb9KgaI6e56dscl0ZNxsy5T8/Eo
 SOwXFF20l36iSGVIAmGcCk7OrjuQYx+vTQwOil1ZQSk3H0qYICO6qYDdsRoIel7pbI7lfMkH
 eMYf8igA+hUTmiV8ToqcpSg/pdpcw6mhFzSMnP9MiQ/ZZNpWyfA5sTgIln07CALAyfu7Zk+r
 rSs2xn1W50GQwg+Xs/aZOj2lwG6vGQHmfI0VEzNe4EBdELp+YlsCirwkv5ofJ1cdUSdnmOXj
 l/EDw0ZqO/Bp54O3OPI3a3U/Z20F+ZeH1ZBGzWJ57iBKiSHrHGoxpVNUbjUcGmFBn/04qire
 c5c0+r4bK8chF9PvodxT+RrwKY564e9rrNW1F05TnDCblDtAbJ8OHiWm8JIs/QVlLNevAK3X
 GOJ+8VbZurVaJ+0TgZJKVp3dPmH2NEVhiLWvKY8L0jN7SNq+KaKDBdJNB6WhS0BdLZ4PevJG
 wv6VBL6P+BnticXDw==
IronPort-HdrOrdr: A9a23:M1DKyq7R8dQWyi6gyQPXwPLXdLJyesId70hD6qhwISY1TiX+rb
 HXoB17726MtN9/YgBCpTntAsa9qDbnhPpICOoqTNGftWvdyQmVxehZhOOIqVCNJ8S9zJ876U
 4JSdkENDSaNzhHZKjBjjVQa+xQpeW6zA==
X-IronPort-AV: E=Sophos;i="5.88,324,1635220800"; 
   d="scan'208";a="65159876"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
	<JBeulich@suse.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>
Subject: [PATCH v2 4/9] x86/spec-ctrl: Don't use spec_ctrl_{enter,exit}_idle() for S3
Date: Fri, 28 Jan 2022 13:29:22 +0000
Message-ID: <20220128132927.14997-5-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20220128132927.14997-1-andrew.cooper3@citrix.com>
References: <20220128132927.14997-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

'idle' here refers to hlt/mwait.  The S3 path isn't an idle path - it is a
platform reset.

Conditionally clearing IBRS and flushing the store buffers on the way down is
a waste of time.

Furthermore, we want to load default_xen_mcu_opt_ctrl unilaterally on the way
back up.  Currently it happens as a side effect of X86_FEATURE_SC_MSR_IDLE or
the next return-to-guest, but that's fragile behaviour.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Wei Liu <wl@xen.org>

v2:
 * New
---
 xen/arch/x86/acpi/power.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/xen/arch/x86/acpi/power.c b/xen/arch/x86/acpi/power.c
index 31a56f02d083..ea2bd8bbfe93 100644
--- a/xen/arch/x86/acpi/power.c
+++ b/xen/arch/x86/acpi/power.c
@@ -248,7 +248,6 @@ static int enter_state(u32 state)
         error = 0;
 
     ci = get_cpu_info();
-    spec_ctrl_enter_idle(ci);
     /* Avoid NMI/#MC using MSR_SPEC_CTRL until we've reloaded microcode. */
     ci->spec_ctrl_flags &= ~SCF_ist_wrmsr;
 
@@ -295,7 +294,9 @@ static int enter_state(u32 state)
 
     /* Re-enabled default NMI/#MC use of MSR_SPEC_CTRL. */
     ci->spec_ctrl_flags |= (default_spec_ctrl_flags & SCF_ist_wrmsr);
-    spec_ctrl_exit_idle(ci);
+
+    if ( boot_cpu_has(X86_FEATURE_IBRSB) )
+        wrmsrl(MSR_SPEC_CTRL, default_xen_mcu_opt_ctrl);
 
     if ( boot_cpu_has(X86_FEATURE_SRBDS_CTRL) )
         wrmsrl(MSR_MCU_OPT_CTRL, default_xen_mcu_opt_ctrl);
-- 
2.11.0


