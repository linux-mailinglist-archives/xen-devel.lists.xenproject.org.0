Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A2A002C0D95
	for <lists+xen-devel@lfdr.de>; Mon, 23 Nov 2020 15:36:12 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.34542.65668 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1khCwi-0001D8-QL; Mon, 23 Nov 2020 14:36:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 34542.65668; Mon, 23 Nov 2020 14:36:00 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1khCwi-0001Cm-M9; Mon, 23 Nov 2020 14:36:00 +0000
Received: by outflank-mailman (input) for mailman id 34542;
 Mon, 23 Nov 2020 14:35:58 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=qJrE=E5=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1khCwg-0001Ch-Pt
 for xen-devel@lists.xenproject.org; Mon, 23 Nov 2020 14:35:58 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id bca35d8d-a5fb-45c3-ab03-fb8450ed5b2a;
 Mon, 23 Nov 2020 14:35:58 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 56C35ACD5;
 Mon, 23 Nov 2020 14:35:57 +0000 (UTC)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=qJrE=E5=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
	id 1khCwg-0001Ch-Pt
	for xen-devel@lists.xenproject.org; Mon, 23 Nov 2020 14:35:58 +0000
X-Inumbo-ID: bca35d8d-a5fb-45c3-ab03-fb8450ed5b2a
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id bca35d8d-a5fb-45c3-ab03-fb8450ed5b2a;
	Mon, 23 Nov 2020 14:35:58 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1606142157; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=34ofaxpzjh8AyHvZBsnreMoOPw77UuBjoo4CEQ9cQ6Q=;
	b=SJ1UK5yM/go1LSkVuhzHDE/ZMT7yPPj4nuzcY74a3T8873g8Jk5xNKayxOEN9KV/HqPlo/
	bBQyPAz1TGlTBnP/4gtAFenD8IQwrWjy0nou4Ibn6d/aL/0REqVRtSJGON0EaiO3gdk33a
	7i4rLepni/cnIIeHamgVdsSzj8eDdM0=
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 56C35ACD5;
	Mon, 23 Nov 2020 14:35:57 +0000 (UTC)
Subject: [PATCH v2 15/17] x86emul: introduce X86EMUL_FPU_tile
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <255f466c-3c95-88c5-3e55-0f04c9ae1b12@suse.com>
Message-ID: <2a1e1a7e-d29c-ef4e-8741-ceb46ee58dde@suse.com>
Date: Mon, 23 Nov 2020 15:35:56 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <255f466c-3c95-88c5-3e55-0f04c9ae1b12@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

This will be used by AMX insns. Note that CR0.TS behavior is only
assumed to be similar to AVX* insns, as the ISA extensions document (as
of rev 041) doesn't specify this either way. But since XFD is not
supposed to be used for lazy context restore, it's unlikely to work any
other way.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
v2: New.

--- a/xen/arch/x86/x86_emulate/x86_emulate.c
+++ b/xen/arch/x86/x86_emulate/x86_emulate.c
@@ -1420,6 +1420,12 @@ static int _get_fpu(
             return X86EMUL_UNHANDLEABLE;
         break;
 
+    case X86EMUL_FPU_tile:
+        ASSERT(mode_64bit());
+        if ( !(xcr0 & X86_XCR0_TILECFG) || !(xcr0 & X86_XCR0_TILEDATA) )
+            return X86EMUL_UNHANDLEABLE;
+        break;
+
     default:
         break;
     }
--- a/xen/arch/x86/x86_emulate/x86_emulate.h
+++ b/xen/arch/x86/x86_emulate/x86_emulate.h
@@ -172,6 +172,7 @@ enum x86_emulate_fpu_type {
     X86EMUL_FPU_ymm, /* AVX/XOP instruction set (%ymm0-%ymm7/15) */
     X86EMUL_FPU_opmask, /* AVX512 opmask instruction set (%k0-%k7) */
     X86EMUL_FPU_zmm, /* AVX512 instruction set (%zmm0-%zmm7/31) */
+    X86EMUL_FPU_tile, /* AMX instruction set (%tmm0-%tmmN, tilecfg) */
     /* This sentinel will never be passed to ->get_fpu(). */
     X86EMUL_FPU_none
 };


