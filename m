Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8126F1EF274
	for <lists+xen-devel@lfdr.de>; Fri,  5 Jun 2020 09:51:28 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jh78L-0001Ca-KB; Fri, 05 Jun 2020 07:51:21 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=thT7=7S=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jh78J-0001CQ-TB
 for xen-devel@lists.xenproject.org; Fri, 05 Jun 2020 07:51:19 +0000
X-Inumbo-ID: 555ba286-a701-11ea-af7f-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 555ba286-a701-11ea-af7f-12813bfff9fa;
 Fri, 05 Jun 2020 07:51:16 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 7B094AB7D;
 Fri,  5 Jun 2020 07:51:18 +0000 (UTC)
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH] x86/Intel: insert Ice Lake and Comet Lake model numbers
Message-ID: <baa738ce-0398-48df-e94e-dc8b86a35f6c@suse.com>
Date: Fri, 5 Jun 2020 09:51:09 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.1
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Paul Durrant <paul@xen.org>,
 Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Both match prior generation processors as far as LBR and C-state MSRs
go (SDM rev 072) as well as applicability of the if_pschange_mc erratum
(recent spec updates).

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
Such changes having been subject to backporting in the past, this
change may want considering for 4.14.
---
I'm leaving alone spec_ctrl.c, albeit there's a scary looking erratum
for Ice Lake indicating that MDS_NO may wrongly be set. But this is
apparently addressed by ucode update, so we may not need to deal with
it in software.

--- a/xen/arch/x86/acpi/cpu_idle.c
+++ b/xen/arch/x86/acpi/cpu_idle.c
@@ -180,9 +180,15 @@ static void do_get_hw_residencies(void *
     case 0x4E:
     case 0x55:
     case 0x5E:
+    /* Ice Lake */
+    case 0x7D:
+    case 0x7E:
     /* Kaby Lake */
     case 0x8E:
     case 0x9E:
+    /* Comet Lake */
+    case 0xA5:
+    case 0xA6:
         GET_PC2_RES(hw_res->pc2);
         GET_CC7_RES(hw_res->cc7);
         /* fall through */
--- a/xen/arch/x86/hvm/vmx/vmx.c
+++ b/xen/arch/x86/hvm/vmx/vmx.c
@@ -2438,8 +2438,12 @@ static bool __init has_if_pschange_mc(vo
     case 0x4e: /* Skylake M */
     case 0x5e: /* Skylake D */
     case 0x55: /* Skylake-X / Cascade Lake */
+    case 0x7d: /* Ice Lake */
+    case 0x7e: /* Ice Lake */
     case 0x8e: /* Kaby / Coffee / Whiskey Lake M */
     case 0x9e: /* Kaby / Coffee / Whiskey Lake D */
+    case 0xa5: /* Comet Lake H/S */
+    case 0xa6: /* Comet Lake U */
         return true;
 
         /*
@@ -2781,10 +2785,14 @@ static const struct lbr_info *last_branc
         case 0x66:
         /* Goldmont Plus */
         case 0x7a:
+        /* Ice Lake */
+        case 0x7d: case 0x7e:
         /* Tremont */
         case 0x86:
         /* Kaby Lake */
         case 0x8e: case 0x9e:
+        /* Comet Lake */
+        case 0xa5: case 0xa6:
             return sk_lbr;
         /* Atom */
         case 0x1c: case 0x26: case 0x27: case 0x35: case 0x36:

