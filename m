Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 19DA61B2A2C
	for <lists+xen-devel@lfdr.de>; Tue, 21 Apr 2020 16:39:50 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jQu3r-0004V3-Fj; Tue, 21 Apr 2020 14:39:43 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=OiHr=6F=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jQu3q-0004Us-Dk
 for xen-devel@lists.xenproject.org; Tue, 21 Apr 2020 14:39:42 +0000
X-Inumbo-ID: ef5c5caa-83dd-11ea-b4f4-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id ef5c5caa-83dd-11ea-b4f4-bc764e2007e4;
 Tue, 21 Apr 2020 14:39:42 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 7522DAEF6;
 Tue, 21 Apr 2020 14:39:40 +0000 (UTC)
Subject: [PATCH v3 2/2] x86: validate VM assist value in arch_set_info_guest()
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <cb2dd3ad-2f38-1576-7743-7525e77704b5@suse.com>
Message-ID: <60f51e40-ada5-b206-cfd3-d1cc1d24c382@suse.com>
Date: Tue, 21 Apr 2020 16:39:40 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <cb2dd3ad-2f38-1576-7743-7525e77704b5@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
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

While I can't spot anything that would go wrong, just like the
respective hypercall only permits applicable bits to be set, we should
also do so when loading guest context.

Reported-by: Andrew Cooper <andrew.cooper3@citrix.com>
Signed-off-by: Jan Beulich <jbeulich@suse.com>
Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
I'd like to note that Arm lacks a field to save/restore vm_assist.

--- a/xen/arch/x86/domain.c
+++ b/xen/arch/x86/domain.c
@@ -932,6 +932,9 @@ int arch_set_info_guest(
         }
     }
 
+    if ( v->vcpu_id == 0 && (c(vm_assist) & ~arch_vm_assist_valid_mask(d)) )
+        return -EINVAL;
+
     if ( is_hvm_domain(d) )
     {
         for ( i = 0; i < ARRAY_SIZE(v->arch.dr); ++i )


