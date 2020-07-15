Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2984E22066E
	for <lists+xen-devel@lfdr.de>; Wed, 15 Jul 2020 09:45:57 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jvc6v-0000Dg-Ob; Wed, 15 Jul 2020 07:45:49 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=9G22=A2=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jvc6u-0000DZ-Ay
 for xen-devel@lists.xenproject.org; Wed, 15 Jul 2020 07:45:48 +0000
X-Inumbo-ID: 31fd1c10-c66f-11ea-b7bb-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 31fd1c10-c66f-11ea-b7bb-bc764e2007e4;
 Wed, 15 Jul 2020 07:45:47 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id C5CE2AC7F;
 Wed, 15 Jul 2020 07:45:49 +0000 (UTC)
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH] x86/CPUID: move some static masks into .init
Message-ID: <2e3dfe1a-bc8b-6774-ef7e-efb565343c52@suse.com>
Date: Wed, 15 Jul 2020 09:45:47 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Except for hvm_shadow_max_featuremask and deep_features they're
referenced by __init functions only.

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/arch/x86/cpuid.c
+++ b/xen/arch/x86/cpuid.c
@@ -16,12 +16,15 @@
 const uint32_t known_features[] = INIT_KNOWN_FEATURES;
 const uint32_t special_features[] = INIT_SPECIAL_FEATURES;
 
-static const uint32_t pv_max_featuremask[] = INIT_PV_MAX_FEATURES;
+static const uint32_t __initconst pv_max_featuremask[] = INIT_PV_MAX_FEATURES;
 static const uint32_t hvm_shadow_max_featuremask[] = INIT_HVM_SHADOW_MAX_FEATURES;
-static const uint32_t hvm_hap_max_featuremask[] = INIT_HVM_HAP_MAX_FEATURES;
-static const uint32_t pv_def_featuremask[] = INIT_PV_DEF_FEATURES;
-static const uint32_t hvm_shadow_def_featuremask[] = INIT_HVM_SHADOW_DEF_FEATURES;
-static const uint32_t hvm_hap_def_featuremask[] = INIT_HVM_HAP_DEF_FEATURES;
+static const uint32_t __initconst hvm_hap_max_featuremask[] =
+    INIT_HVM_HAP_MAX_FEATURES;
+static const uint32_t __initconst pv_def_featuremask[] = INIT_PV_DEF_FEATURES;
+static const uint32_t __initconst hvm_shadow_def_featuremask[] =
+    INIT_HVM_SHADOW_DEF_FEATURES;
+static const uint32_t __initconst hvm_hap_def_featuremask[] =
+    INIT_HVM_HAP_DEF_FEATURES;
 static const uint32_t deep_features[] = INIT_DEEP_FEATURES;
 
 static int __init parse_xen_cpuid(const char *s)

