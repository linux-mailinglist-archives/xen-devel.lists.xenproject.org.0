Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B6A923682DD
	for <lists+xen-devel@lfdr.de>; Thu, 22 Apr 2021 16:57:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.115580.220566 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lZam4-0006mQ-EP; Thu, 22 Apr 2021 14:57:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 115580.220566; Thu, 22 Apr 2021 14:57:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lZam4-0006m0-AU; Thu, 22 Apr 2021 14:57:48 +0000
Received: by outflank-mailman (input) for mailman id 115580;
 Thu, 22 Apr 2021 14:57:46 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=uib8=JT=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lZam2-0006lp-BK
 for xen-devel@lists.xenproject.org; Thu, 22 Apr 2021 14:57:46 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 751cc7ac-e603-4a1f-a002-1c66535d470c;
 Thu, 22 Apr 2021 14:57:45 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 4F834B16A;
 Thu, 22 Apr 2021 14:57:44 +0000 (UTC)
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
X-Inumbo-ID: 751cc7ac-e603-4a1f-a002-1c66535d470c
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1619103464; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0Kar8c0Mm+YFIHWmPbC+8g9omJWrv1zJZFI3hL51bIQ=;
	b=eBoUDSl4ml+KE6JjGdKtVsKE+2Wx9sR4QP1+q10TA8kbXIfKcC+zm84gssNoZHJdr0UWB7
	sitgryWGEKbPDgd8TyrxPV2p9gvlA5b/Q48G/JA25MSVpy6bdgCyvyj0tdfcnLXqLXTa+Q
	Tdxo0rzbhLGtMx+1soYolNUJIghEpzY=
Subject: [PATCH v3 22/22] x86: permit guests to use AMX and XFD
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <322de6db-e01f-0b57-5777-5d94a13c441a@suse.com>
Message-ID: <dd649f56-69b4-a3a7-5eba-88edd9358073@suse.com>
Date: Thu, 22 Apr 2021 16:57:44 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <322de6db-e01f-0b57-5777-5d94a13c441a@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

These features are marked experimental (for only parts of the code
actually having got tested yet, while other parts require respective
hardware) and opt-in for guests.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
v3: New.

--- a/CHANGELOG.md
+++ b/CHANGELOG.md
@@ -6,6 +6,9 @@ The format is based on [Keep a Changelog
 
 ## [unstable UNRELEASED](https://xenbits.xen.org/gitweb/?p=xen.git;a=shortlog;h=staging) - TBD
 
+### Added / support upgraded
+ - x86 AMX and XFD (Experimental)
+
 ## [4.15.0 UNRELEASED](https://xenbits.xen.org/gitweb/?p=xen.git;a=shortlog;h=RELEASE-4.15.0) - TBD
 
 ### Added / support upgraded
--- a/SUPPORT.md
+++ b/SUPPORT.md
@@ -61,6 +61,10 @@ For the Cortex A57 r0p0 - r1p1, see Erra
 
     Status: Tech Preview
 
+### x86 AMX and XFD
+
+    Status: Experimental
+
 ### IOMMU
 
     Status, AMD IOMMU: Supported
--- a/xen/include/public/arch-x86/cpufeatureset.h
+++ b/xen/include/public/arch-x86/cpufeatureset.h
@@ -191,7 +191,7 @@ XEN_CPUFEATURE(XSAVEOPT,      4*32+ 0) /
 XEN_CPUFEATURE(XSAVEC,        4*32+ 1) /*A  XSAVEC/XRSTORC instructions */
 XEN_CPUFEATURE(XGETBV1,       4*32+ 2) /*A  XGETBV with %ecx=1 */
 XEN_CPUFEATURE(XSAVES,        4*32+ 3) /*S  XSAVES/XRSTORS instructions */
-XEN_CPUFEATURE(XFD,           4*32+ 4) /*   XFD / XFD_ERR MSRs */
+XEN_CPUFEATURE(XFD,           4*32+ 4) /*a  XFD / XFD_ERR MSRs */
 
 /* Intel-defined CPU features, CPUID level 0x00000007:0.ebx, word 5 */
 XEN_CPUFEATURE(FSGSBASE,      5*32+ 0) /*A  {RD,WR}{FS,GS}BASE instructions */
@@ -269,9 +269,9 @@ XEN_CPUFEATURE(MD_CLEAR,      9*32+10) /
 XEN_CPUFEATURE(TSX_FORCE_ABORT, 9*32+13) /* MSR_TSX_FORCE_ABORT.RTM_ABORT */
 XEN_CPUFEATURE(SERIALIZE,     9*32+14) /*a  SERIALIZE insn */
 XEN_CPUFEATURE(CET_IBT,       9*32+20) /*   CET - Indirect Branch Tracking */
-XEN_CPUFEATURE(AMX_BF16,      9*32+22) /*   AMX BFloat16 instructions */
-XEN_CPUFEATURE(AMX_TILE,      9*32+24) /*   AMX tile architecture */
-XEN_CPUFEATURE(AMX_INT8,      9*32+25) /*   AMX 8-bit integer instructions */
+XEN_CPUFEATURE(AMX_BF16,      9*32+22) /*a  AMX BFloat16 instructions */
+XEN_CPUFEATURE(AMX_TILE,      9*32+24) /*a  AMX tile architecture */
+XEN_CPUFEATURE(AMX_INT8,      9*32+25) /*a  AMX 8-bit integer instructions */
 XEN_CPUFEATURE(IBRSB,         9*32+26) /*A  IBRS and IBPB support (used by Intel) */
 XEN_CPUFEATURE(STIBP,         9*32+27) /*A  STIBP */
 XEN_CPUFEATURE(L1D_FLUSH,     9*32+28) /*S  MSR_FLUSH_CMD and L1D flush. */


