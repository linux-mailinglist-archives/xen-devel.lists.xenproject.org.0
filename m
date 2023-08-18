Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 101B6780C33
	for <lists+xen-devel@lfdr.de>; Fri, 18 Aug 2023 14:58:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.586215.917445 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qWz3x-0000Ju-LJ; Fri, 18 Aug 2023 12:58:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 586215.917445; Fri, 18 Aug 2023 12:58:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qWz3x-0000HE-I7; Fri, 18 Aug 2023 12:58:49 +0000
Received: by outflank-mailman (input) for mailman id 586215;
 Fri, 18 Aug 2023 12:58:47 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=OTTw=ED=citrix.com=prvs=587dba071=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1qWz3v-0007Sb-RJ
 for xen-devel@lists.xenproject.org; Fri, 18 Aug 2023 12:58:47 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f7160129-3dc6-11ee-877e-cb3800f73035;
 Fri, 18 Aug 2023 14:58:46 +0200 (CEST)
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
X-Inumbo-ID: f7160129-3dc6-11ee-877e-cb3800f73035
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1692363526;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=57I9Q/U+6E375af+JHdMMxAsFMIEGopCo6I6/NQDaCg=;
  b=DUmatWUWCMxslT/DTK7occCAlMxS70vddUzbVsPhz+DsqjfldKN/mFMr
   m6AE5hQK0MQT3fZrVarhMWY5Jq/fyodqOHLHD5wB+DYeQaHTRZJ6KlufU
   i4qtyfftcZBnWlBWXWYBz4kNr1GPjjQeDPpGHvIkS51w6DiZSQil9KA29
   0=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 119911584
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.123
X-Policy: $RELAYED
IronPort-Data: A9a23:sVCptqKElXHoKg31FE+Rz5UlxSXFcZb7ZxGr2PjKsXjdYENSgjYBn
 GIcWGGEOPuONGT9L9AlPI2+9UkBu5GAzdJrTwplqX01Q3x08seUXt7xwmUcnc+xBpaaEB84t
 ZV2hv3odp1coqr0/0/1WlTZhSAgk/rOHvykU7Ss1hlZHWdMUD0mhQ9oh9k3i4tphcnRKw6Ws
 Jb5rta31GWNglaYCUpKrfrawP9TlK6q4mhA7gVuPaojUGL2zBH5MrpOfcldEFOgKmVkNrbSb
 /rOyri/4lTY838FYj9yuu+mGqGiaue60Tmm0hK6aYD76vRxjnVaPpIAHOgdcS9qZwChxLid/
 jnvWauYEm/FNoWU8AgUvoIx/ytWZcWq85efSZSzXFD6I+QrvBIAzt03ZHzaM7H09c5pX2ZE+
 8w6Bgs/RT2/2c2E3Ly0acBj05FLwMnDZOvzu1llxDDdS/0nXYrCU+PB4towMDUY354UW6yEP
 oxANGQpNU6bC/FMEg5/5JYWteGknHTgNRZfr0qYv/Ef6GnP1g1hlrPqNbI5f/TTHJQExx/F9
 j6uE2LRCTEnO+eZkRe+sX/yo8nKkC/rWIdLLejtnhJtqALKnTFCYPEMbnOrrP/8hkOgVtZ3L
 00P5jFovaU07FasTNT2Q1u/unHsljw2VsdUEuY6wBqQ0aeS6AGcbkAbShZRZdpgs9U5LQHGz
 XfQwYmvX2Y29uTIFzTErOz8QS6O1TY9MzEFbyE0byU+0fLOnN8cvA7BQfVKH/vg5jHqIg3Yz
 zePpSk4orwci88Xyqm2lWz6byKQSovhFVBsuFiONo6xxkYgPdP+OdT0gbTOxawYRLt1WGVtq
 5TtdyK2yOkVRa+AmyWWKAnmNOH4vq3VWNEwbLMGInXAy9hP0yTzFWyzyGskTKuMDirjUWaxC
 HI/QSsLuPdu0IKCNMebmb6ZBcUw1rTHHt/4TP3SZdcmSsEvJVXdrX42NBfLgT6FfK0QfUcXY
 8fznSGEVypyNEia5GDuG7d1PUEDl0jSOl8/tbiklk/6gNJylVaeSKsfMUvmUwzKxPrsnekhy
 P4Gb5Hi40wGAIXDjtz/rdZ7waYicSJqWvgbaqV/Koa+H+aRMDh6UqWMm+x8ItwNcmY8vr6gw
 0xRk3RwkDLX7UAr4y3TMhiPtJuHsU5DkE8G
IronPort-HdrOrdr: A9a23:44YQV6yaJnGnPzO76SSgKrPwFL1zdoMgy1knxilNoRw8SKKlfq
 eV7Y0mPH7P+VAssR4b+exoVJPtfZqYz+8R3WBzB8bEYOCFghrKEGgK1+KLqFeMJ8S9zJ846U
 4JSdkHNDSaNzlHZKjBjzVQa+xQouW6zA==
X-Talos-CUID: =?us-ascii?q?9a23=3Ahsea3GnL16kdmpOxUUse7Gh81RbXOWODy33eE22?=
 =?us-ascii?q?WMlRCZYHLZm2M9qxHusU7zg=3D=3D?=
X-Talos-MUID: 9a23:IyZRQAquOWfEmSHmdOEezzpCCchT5fyDMwMAz7AgvsSIJSx1Yg7I2Q==
X-IronPort-AV: E=Sophos;i="6.01,183,1684814400"; 
   d="scan'208";a="119911584"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
	<JBeulich@suse.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>
Subject: [PATCH 1/2] rombios: Avoid using K&R function syntax
Date: Fri, 18 Aug 2023 13:57:52 +0100
Message-ID: <20230818125753.876699-2-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230818125753.876699-1-andrew.cooper3@citrix.com>
References: <20230818125753.876699-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

The declarations for these functions in 32bitprotos.h are already Ansi
compatible.  Update the definitions to match.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Wei Liu <wl@xen.org>
---
 tools/firmware/rombios/32bit/tcgbios/tcgbios.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/tools/firmware/rombios/32bit/tcgbios/tcgbios.c b/tools/firmware/rombios/32bit/tcgbios/tcgbios.c
index fa22c4460aac..ad0eac0d20c2 100644
--- a/tools/firmware/rombios/32bit/tcgbios/tcgbios.c
+++ b/tools/firmware/rombios/32bit/tcgbios/tcgbios.c
@@ -595,7 +595,7 @@ static void tcpa_add_measurement(uint32_t pcrIndex,
 /*
  * Add measurement to log about call of int 19h
  */
-void tcpa_calling_int19h()
+void tcpa_calling_int19h(void)
 {
 	tcpa_add_measurement(4, EV_ACTION, 0);
 }
@@ -603,7 +603,7 @@ void tcpa_calling_int19h()
 /*
  * Add measurement to log about retuning from int 19h
  */
-void tcpa_returned_int19h()
+void tcpa_returned_int19h(void)
 {
 	tcpa_add_measurement(4, EV_ACTION, 1);
 }
@@ -611,7 +611,7 @@ void tcpa_returned_int19h()
 /*
  * Add event separators for PCRs 0 to 7; specs 8.2.3
  */
-void tcpa_add_event_separators()
+void tcpa_add_event_separators(void)
 {
 	uint32_t pcrIndex = 0;
 	while (pcrIndex <= 7) {
@@ -624,7 +624,7 @@ void tcpa_add_event_separators()
 /*
  * Add a wake event to the log
  */
-void tcpa_wake_event()
+void tcpa_wake_event(void)
 {
 	tcpa_add_measurement_to_log(6,
 	                            EV_ACTION,
@@ -659,7 +659,7 @@ void tcpa_add_bootdevice(uint32_t bootcd, uint32_t bootdrv)
  * Add measurement to the log about option rom scan
  * 10.4.3 : action 14
  */
-void tcpa_start_option_rom_scan()
+void tcpa_start_option_rom_scan(void)
 {
 	tcpa_add_measurement(2, EV_ACTION, 14);
 }
-- 
2.30.2


