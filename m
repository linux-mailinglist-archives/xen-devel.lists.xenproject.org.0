Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C03BF27AD7D
	for <lists+xen-devel@lfdr.de>; Mon, 28 Sep 2020 14:07:01 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kMrvk-0004rE-38; Mon, 28 Sep 2020 12:06:56 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=qi+E=DF=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kMrvi-0004qz-KR
 for xen-devel@lists.xenproject.org; Mon, 28 Sep 2020 12:06:54 +0000
X-Inumbo-ID: ae64392f-e7d4-4a97-879a-da544e2527eb
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id ae64392f-e7d4-4a97-879a-da544e2527eb;
 Mon, 28 Sep 2020 12:06:53 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
 t=1601294813;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+j7kytoAkHPvZqCUffA6Hq83rtd5YVvzPLNyUaQ7Eow=;
 b=hPMCOuR/fsALI0ndiJldWU7w09pCrIwsDM/SfaYfhDQhBO+RtQthzYY1Aejxnf2mJ8GGPO
 enEBLGPseheMQqRPeCjpDEvtF5LPJMkPssfdqW2HacRlO2ER8egy4rfneiVYvH4qnDyJSZ
 sR3yK1QPzWSIdf/84dD8kUdiadRR5Kk=
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 2FEDEADA2;
 Mon, 28 Sep 2020 12:06:53 +0000 (UTC)
Subject: [PATCH 4/5] x86/ELF: also record FS/GS bases in elf_core_save_regs()
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <ec4b451e-2b93-8526-ef98-7a2d502e31c2@suse.com>
Message-ID: <518a5f88-3ae4-a3ed-ab13-caaf7e8a7295@suse.com>
Date: Mon, 28 Sep 2020 14:06:52 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <ec4b451e-2b93-8526-ef98-7a2d502e31c2@suse.com>
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
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/include/asm-x86/x86_64/elf.h
+++ b/xen/include/asm-x86/x86_64/elf.h
@@ -1,6 +1,7 @@
 #ifndef __X86_64_ELF_H__
 #define __X86_64_ELF_H__
 
+#include <asm/msr.h>
 #include <asm/regs.h>
 
 typedef struct {
@@ -59,8 +60,8 @@ static inline void elf_core_save_regs(EL
     asm volatile("pushfq; popq %0" :"=m"(core_regs->rflags));
     asm volatile("movq %%rsp,%0" : "=m"(core_regs->rsp));
     asm volatile("movl %%ss, %%eax;" :"=a"(core_regs->ss));
-    /* thread_fs not filled in for now */
-    /* thread_gs not filled in for now */
+    rdmsrl(MSR_FS_BASE, core_regs->thread_fs);
+    rdmsrl(MSR_GS_BASE, core_regs->thread_gs);
     core_regs->ds = read_sreg(ds);
     core_regs->es = read_sreg(es);
     core_regs->fs = read_sreg(fs);


