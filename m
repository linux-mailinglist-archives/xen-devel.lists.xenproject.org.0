Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B65EB1BF54C
	for <lists+xen-devel@lfdr.de>; Thu, 30 Apr 2020 12:24:32 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jU6Mh-0005xQ-M3; Thu, 30 Apr 2020 10:24:23 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Mtm3=6O=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jU6Mg-0005xL-Fv
 for xen-devel@lists.xenproject.org; Thu, 30 Apr 2020 10:24:22 +0000
X-Inumbo-ID: c194a3ae-8acc-11ea-9a1c-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id c194a3ae-8acc-11ea-9a1c-12813bfff9fa;
 Thu, 30 Apr 2020 10:24:21 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 0297FAC8F;
 Thu, 30 Apr 2020 10:24:19 +0000 (UTC)
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH] x86/HyperV: correct hv_hcall_page for xen.efi build
Message-ID: <c45d6098-a4e1-b565-4180-cc6da433dc57@suse.com>
Date: Thu, 30 Apr 2020 12:24:15 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
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

Along the lines of what the not reverted part of 3c4b2eef4941 ("x86:
refine link time stub area related assertion") did, we need to transform
the absolute HV_HCALL_PAGE into the image base relative hv_hcall_page
(or else there'd be no need for two distinct symbols). Otherwise
mkreloc, as used for generating the base relocations of xen.efi, will
spit out warnings like "Difference at .text:0009b74f is 0xc0000000
(expected 0x40000000)". As long as the offending relocations are PC
relative ones, the generated binary is correct afaict, but if there ever
was the absolute address stored, xen.efi would miss a fixup for it.

Reported-by: Andrew Cooper <andrew.cooper3@citrix.com>
Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
Build tested only (and generated binary inspected) - Wei, please check
that this doesn't break things.

--- a/xen/arch/x86/xen.lds.S
+++ b/xen/arch/x86/xen.lds.S
@@ -327,7 +327,7 @@ SECTIONS
 #endif
 
 #ifdef CONFIG_HYPERV_GUEST
-  hv_hcall_page = ABSOLUTE(HV_HCALL_PAGE);
+  hv_hcall_page = ABSOLUTE(HV_HCALL_PAGE - XEN_VIRT_START + __XEN_VIRT_START);
 #endif
 
   /* Sections to be discarded */

