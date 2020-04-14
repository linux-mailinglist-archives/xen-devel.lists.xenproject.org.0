Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E03D1A79A1
	for <lists+xen-devel@lfdr.de>; Tue, 14 Apr 2020 13:35:21 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jOJqT-0003fi-9j; Tue, 14 Apr 2020 11:35:13 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=t7Uy=56=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jOJqR-0003fX-2c
 for xen-devel@lists.xenproject.org; Tue, 14 Apr 2020 11:35:11 +0000
X-Inumbo-ID: ff2aa302-7e43-11ea-8926-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id ff2aa302-7e43-11ea-8926-12813bfff9fa;
 Tue, 14 Apr 2020 11:35:10 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 8EC13AD0F;
 Tue, 14 Apr 2020 11:35:08 +0000 (UTC)
Subject: [PATCH v2 2/2] x86: validate VM assist value in arch_set_info_guest()
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <51dfb592-2653-738f-6933-9521ffa4fecd@suse.com>
Message-ID: <f46967a9-f55d-63f1-1825-352a122fdd8e@suse.com>
Date: Tue, 14 Apr 2020 13:35:09 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <51dfb592-2653-738f-6933-9521ffa4fecd@suse.com>
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
---
I'd like to note that Arm lacks a field to save/restore vm_assist.

--- a/xen/arch/x86/domain.c
+++ b/xen/arch/x86/domain.c
@@ -932,6 +932,9 @@ int arch_set_info_guest(
         }
     }
 
+    if ( v->vcpu_id == 0 && (c(vm_assist) & ~arch_vm_assist_valid(d)) )
+        return -EINVAL;
+
     if ( is_hvm_domain(d) )
     {
         for ( i = 0; i < ARRAY_SIZE(v->arch.dr); ++i )


