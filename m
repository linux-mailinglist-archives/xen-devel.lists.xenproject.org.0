Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8106434762D
	for <lists+xen-devel@lfdr.de>; Wed, 24 Mar 2021 11:34:58 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.100901.192515 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lP0qS-0002IP-IS; Wed, 24 Mar 2021 10:34:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 100901.192515; Wed, 24 Mar 2021 10:34:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lP0qS-0002I0-F8; Wed, 24 Mar 2021 10:34:36 +0000
Received: by outflank-mailman (input) for mailman id 100901;
 Wed, 24 Mar 2021 10:34:35 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=nnUc=IW=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lP0qR-0002Hv-Az
 for xen-devel@lists.xenproject.org; Wed, 24 Mar 2021 10:34:35 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id fd221857-e8aa-4367-a4fc-3e6dc49f8f3e;
 Wed, 24 Mar 2021 10:34:34 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 8ACFBAE20;
 Wed, 24 Mar 2021 10:34:33 +0000 (UTC)
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
X-Inumbo-ID: fd221857-e8aa-4367-a4fc-3e6dc49f8f3e
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1616582073; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=E3sM+MHdMWPuK3E9lJOyRxJeBHE9Ske6vJlUmMvX6Z4=;
	b=NDOiO9ZwJRWKTA2v1y9oajxe+KOLRr7QEDLcW3CNShvU53tA67S0Mp+7JiVmd23o3CGROY
	g+k12hKhmY06AcVdCIjUJsYqQGr2CBYibxh53n2Fek6W4s9NqaVanTBWAzioK9o0yVw6fd
	p1PcZSmGf7idItawH/oQlIKxM2G4Q/w=
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Ian Jackson <iwj@xenproject.org>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH][4.15] x86/HPET: don't enable legacy replacement mode
 unconditionally
Message-ID: <8e18a2a5-bc19-615d-0c8c-cea49adcf976@suse.com>
Date: Wed, 24 Mar 2021 11:34:32 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

Commit e1de4c196a2e ("x86/timer: Fix boot on Intel systems using ITSSPRC
static PIT clock gating") was reported to cause boot failures on certain
AMD Ryzen systems. Until we can figure out what the actual issue there
is, skip this new part of HPET setup by default. Introduce a "hpet"
command line option to allow enabling this on hardware where it's really
needed for Xen to boot successfully (i.e. where the PIT doesn't drive
the timer interrupt).

Since it makes little sense to introduce just "hpet=legacy-replacement",
also allow for a boolean argument as well as "broadcast" to replace the
separate "hpetbroadcast" option.

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/docs/misc/xen-command-line.pandoc
+++ b/docs/misc/xen-command-line.pandoc
@@ -1274,9 +1274,26 @@ supported. See docs/misc/arm/big.LITTLE.
 When the hmp-unsafe option is disabled (default), CPUs that are not
 identical to the boot CPU will be parked and not used by Xen.
 
+### hpet (x86)
+> `= List of [ <boolean> | broadcast | legacy-replacement ]`
+
+> Default : `true`, `no-broadcast`, 'no-legacy-replacement`
+
+Controls Xen's use of the system's High Precision Event Timer.  The boolean
+allows to turn off use altogether.
+
+`broadcast` forces Xen to keep using the broadcast for CPUs in deep C-states
+even when an RTC interrupt got enabled.
+
+`legacy-replacement` is intended to be used on platforms where the timer
+interrupt doesn't get raised by the legacy PIT.  This then also affects
+raising of the RTC interrupt.
+
 ### hpetbroadcast (x86)
 > `= <boolean>`
 
+Deprecated alternative of `hpet=broadcast`.
+
 ### hvm_debug (x86)
 > `= <integer>`
 
--- a/xen/arch/x86/hpet.c
+++ b/xen/arch/x86/hpet.c
@@ -52,6 +52,8 @@ static unsigned int __read_mostly num_hp
 DEFINE_PER_CPU(struct hpet_event_channel *, cpu_bc_channel);
 
 unsigned long __initdata hpet_address;
+static bool __initdata opt_hpet = true;
+static bool __initdata opt_legacy_replacement;
 u8 __initdata hpet_blockid;
 u8 __initdata hpet_flags;
 
@@ -63,6 +65,32 @@ u8 __initdata hpet_flags;
 static bool __initdata force_hpet_broadcast;
 boolean_param("hpetbroadcast", force_hpet_broadcast);
 
+static int __init parse_hpet_param(const char *s)
+{
+    const char *ss;
+    int val, rc = 0;
+
+    do {
+        ss = strchr(s, ',');
+        if ( !ss )
+            ss = strchr(s, '\0');
+
+        if ( (val = parse_bool(s, ss)) >= 0 )
+            opt_hpet = val;
+        else if ( (val = parse_boolean("broadcast", s, ss)) >= 0 )
+            force_hpet_broadcast = val;
+        else if ( (val = parse_boolean("legacy-replacement", s, ss)) >= 0 )
+            opt_legacy_replacement = val;
+        else
+            rc = -EINVAL;
+
+        s = ss + 1;
+    } while ( *ss );
+
+    return rc;
+}
+custom_param("hpet", parse_hpet_param);
+
 /*
  * Calculate a multiplication factor for scaled math, which is used to convert
  * nanoseconds based values to clock ticks:
@@ -761,12 +789,9 @@ u64 __init hpet_setup(void)
     unsigned int hpet_id, hpet_period, hpet_cfg;
     unsigned int last, rem;
 
-    if ( hpet_rate )
+    if ( hpet_rate || !hpet_address || !opt_hpet )
         return hpet_rate;
 
-    if ( hpet_address == 0 )
-        return 0;
-
     set_fixmap_nocache(FIX_HPET_BASE, hpet_address);
 
     hpet_id = hpet_read32(HPET_ID);
@@ -803,9 +828,9 @@ u64 __init hpet_setup(void)
      * IRQ routing is configured.
      *
      * Reconfigure the HPET into legacy mode to re-establish the timer
-     * interrupt.
+     * interrupt, if available and if so requested.
      */
-    if ( hpet_id & HPET_ID_LEGSUP &&
+    if ( opt_legacy_replacement && (hpet_id & HPET_ID_LEGSUP) &&
          !((hpet_cfg = hpet_read32(HPET_CFG)) & HPET_CFG_LEGACY) )
     {
         unsigned int c0_cfg, ticks, count;

