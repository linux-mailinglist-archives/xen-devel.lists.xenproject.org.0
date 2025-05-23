Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 88009AC2723
	for <lists+xen-devel@lfdr.de>; Fri, 23 May 2025 18:06:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.995944.1378016 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uIUuL-0002CX-R1; Fri, 23 May 2025 16:06:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 995944.1378016; Fri, 23 May 2025 16:06:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uIUuL-0002As-O4; Fri, 23 May 2025 16:06:05 +0000
Received: by outflank-mailman (input) for mailman id 995944;
 Fri, 23 May 2025 16:06:04 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ep+V=YH=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1uIUuJ-0002Am-V8
 for xen-devel@lists.xenproject.org; Fri, 23 May 2025 16:06:04 +0000
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [2a00:1450:4864:20::431])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d251b4b6-37ef-11f0-b892-0df219b8e170;
 Fri, 23 May 2025 18:06:01 +0200 (CEST)
Received: by mail-wr1-x431.google.com with SMTP id
 ffacd0b85a97d-3a3673e12c4so57227f8f.2
 for <xen-devel@lists.xenproject.org>; Fri, 23 May 2025 09:06:01 -0700 (PDT)
Received: from localhost.localdomain (host-92-26-98-202.as13285.net.
 [92.26.98.202]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3a35ca4d2ddsm26749906f8f.7.2025.05.23.09.05.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 23 May 2025 09:06:00 -0700 (PDT)
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
X-Inumbo-ID: d251b4b6-37ef-11f0-b892-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1748016361; x=1748621161; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=cKRGcqOB4K7R/otJOmMfsqC3TxSzOnxP7UoS9tqRNfk=;
        b=Fhqala2VzIEoou5vCl7m8hTIWPtsNQZAinNc1kEhWzMm/lwpEiyLCqiFoDY/J4BXZ3
         WuAzuZFy1Ja7JHa4klcXMngf9XtxM53+jXnWiqES+mValXb54tffqEpl4e+eAYPuKOFu
         lyG/8MvNUyxiwq5bbmG1ATpT/DsxvVB1RrDZ8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748016361; x=1748621161;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cKRGcqOB4K7R/otJOmMfsqC3TxSzOnxP7UoS9tqRNfk=;
        b=ssyXHfI2lO6/tLuwOrsWTn9xY7owdT0wYSI9G7KIUErM5j8wDkkCaUca8kDCCFPSga
         ybj7g1AmaPrbTSgXHrX+dBATdrn4Fl3bAFqufeqAL4AfslQxPZHDnd+V83rYnn4DszqU
         O2gVSEN78mu/Qo2yKuMqOEprr482h3AH6gHAf5sQ3ZOXLbaRK0345F4ckOd508sFitmp
         BCjOg+yZ+pdEjkGT1wa+j65R8I/8/SyP7yMFoWH91wDpYyGseoc6WtamrB+Pdr0u2/Fd
         WDjgXaWA5fho+/wTqTG/WQdt4gu+UTn35vqnJ0vYTAzbLzcloehtoYwsTNgCk6MKiNf4
         IXCg==
X-Gm-Message-State: AOJu0Yxqgui2jIgYsC+/LYr4EgrjseE9ii//Zg80/9IgAPwFmM0Rp2tn
	nYgIujUdSD4XBvVrASWp58y5pVb71aWMBCS0RvJpOYge7cgR0LVqx1MXdOscyT1Vt6HNHpAa/id
	WIXUQ
X-Gm-Gg: ASbGncvWxJCsiJgYPgVs+3UWI+l98HX5tycVpuMyIGFUeJQSL9+A/eTij5rwICrX5yG
	/MmKhMcwfwus/vQIPksQ1SF8tWmbptLRDzVdXecyDwAch2jVP0YYajmBUGiKOuOlRQPsg04y7n1
	DnywKBrdONE9zs2+DWdhSN+x7opzJb6w3pJGaWG3ogRybEdH+ZSk3uwoY6NmGSFZEKFvlaNLCk3
	EkLqMM7B+1NJvBYcB4obke/0TkuskfdbFv4zf977XhYAA2j4rvh9bkvSE1fLDC0kY2OXbt1xorj
	mn0Q5EoPHYcPKbo3V2d4TZgh7nbRksy+ou0JerM9r7mMtQ/i9Fv33f/HQu3eGS/n/aM+75/3W1h
	uh3Yl1Z+gUYjGp/mRax3qZxYi
X-Google-Smtp-Source: AGHT+IGmLLWJsOobbgnRwrrAYeL7Wcsod6zD75J7hJ6LkhurtLXwRxr8Achj60krJmZW+TqCZIwmHw==
X-Received: by 2002:a05:6000:2892:b0:3a4:c2e4:11b with SMTP id ffacd0b85a97d-3a4c2e40151mr3483242f8f.51.1748016360670;
        Fri, 23 May 2025 09:06:00 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <JBeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	=?UTF-8?q?Petr=20Bene=C5=A1?= <w1benny@gmail.com>,
	Tamas K Lengyel <tamas@tklengyel.com>,
	=?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
Subject: [PATCH] x86/vmx: Fix VMEntry failure on ADL/SPR with shadow guests
Date: Fri, 23 May 2025 17:05:58 +0100
Message-Id: <20250523160558.593849-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Paging Writeable depends on EPT, so must disabled in non-EPT guests like the
other EPT dependent features.  Otherwise, VMEntry fails with bad control
state.

Drop a piece of trailing whitepsace in context.

Fixes: ff10aa9d8f90 ("x86: Add Support for Paging-Write Feature")
Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Petr Beneš <w1benny@gmail.com>
CC: Tamas K Lengyel <tamas@tklengyel.com>
CC: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>

This is the cause of the XTF Shadow failures in Gitlab CI.  Working run:

https://gitlab.com/xen-project/hardware/xen-staging/-/jobs/10133481327
---
 xen/arch/x86/hvm/vmx/vmcs.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/xen/arch/x86/hvm/vmx/vmcs.c b/xen/arch/x86/hvm/vmx/vmcs.c
index 59f4d1d86f02..57d49364db56 100644
--- a/xen/arch/x86/hvm/vmx/vmcs.c
+++ b/xen/arch/x86/hvm/vmx/vmcs.c
@@ -1132,9 +1132,11 @@ static int construct_vmcs(struct vcpu *v)
     else
     {
         v->arch.hvm.vmx.secondary_exec_control &=
-            ~(SECONDARY_EXEC_ENABLE_EPT | 
+            ~(SECONDARY_EXEC_ENABLE_EPT |
               SECONDARY_EXEC_UNRESTRICTED_GUEST |
               SECONDARY_EXEC_ENABLE_INVPCID);
+        v->arch.hvm.vmx.tertiary_exec_control &=
+            ~(TERTIARY_EXEC_EPT_PAGING_WRITE);
         vmexit_ctl &= ~(VM_EXIT_SAVE_GUEST_PAT |
                         VM_EXIT_LOAD_HOST_PAT);
         vmentry_ctl &= ~VM_ENTRY_LOAD_GUEST_PAT;
-- 
2.39.5


