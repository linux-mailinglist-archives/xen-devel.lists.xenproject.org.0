Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EFA223B888
	for <lists+xen-devel@lfdr.de>; Tue,  4 Aug 2020 12:14:37 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k2txD-0006KK-7p; Tue, 04 Aug 2020 10:13:55 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=xzDE=BO=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1k2txB-0006Jo-Ib
 for xen-devel@lists.xenproject.org; Tue, 04 Aug 2020 10:13:53 +0000
X-Inumbo-ID: 419a531d-e690-4e6f-a276-00468615c287
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 419a531d-e690-4e6f-a276-00468615c287;
 Tue, 04 Aug 2020 10:13:52 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 86838B595;
 Tue,  4 Aug 2020 10:14:07 +0000 (UTC)
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH] x86emul: replace further UB shifts
Message-ID: <0ae25858-f981-1552-0a3c-58a9733a758a@suse.com>
Date: Tue, 4 Aug 2020 12:13:51 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
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

I have no explanation how I managed to overlook these while putting
together what is now b6a907f8c83d ("x86emul: replace UB shifts").

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/arch/x86/x86_emulate/x86_emulate.c
+++ b/xen/arch/x86/x86_emulate/x86_emulate.c
@@ -9735,7 +9735,7 @@ x86_emulate(
 
                 rc = ops->read(ea.mem.seg,
                                truncate_ea(ea.mem.off +
-                                           (idx << state->sib_scale)),
+                                           idx * (1 << state->sib_scale)),
                                (void *)mmvalp + i * op_bytes, op_bytes, ctxt);
                 if ( rc != X86EMUL_OKAY )
                 {
@@ -9857,7 +9857,8 @@ x86_emulate(
                 continue;
 
             rc = ops->read(ea.mem.seg,
-                           truncate_ea(ea.mem.off + (idx << state->sib_scale)),
+                           truncate_ea(ea.mem.off +
+                                       idx * (1 << state->sib_scale)),
                            (void *)mmvalp + i * op_bytes, op_bytes, ctxt);
             if ( rc != X86EMUL_OKAY )
             {

