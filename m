Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FD55780F83
	for <lists+xen-devel@lfdr.de>; Fri, 18 Aug 2023 17:46:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.586409.917645 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qX1gP-00056a-St; Fri, 18 Aug 2023 15:46:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 586409.917645; Fri, 18 Aug 2023 15:46:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qX1gP-00054b-PM; Fri, 18 Aug 2023 15:46:41 +0000
Received: by outflank-mailman (input) for mailman id 586409;
 Fri, 18 Aug 2023 15:46:41 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=9btj=ED=gmail.com=jinoh.kang.kr@srs-se1.protection.inumbo.net>)
 id 1qX1gP-00054Q-45
 for xen-devel@lists.xenproject.org; Fri, 18 Aug 2023 15:46:41 +0000
Received: from mail-pj1-x1036.google.com (mail-pj1-x1036.google.com
 [2607:f8b0:4864:20::1036])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6a88522d-3dde-11ee-9b0c-b553b5be7939;
 Fri, 18 Aug 2023 17:46:38 +0200 (CEST)
Received: by mail-pj1-x1036.google.com with SMTP id
 98e67ed59e1d1-268bc714ce0so1578154a91.0
 for <xen-devel@lists.xenproject.org>; Fri, 18 Aug 2023 08:46:38 -0700 (PDT)
Received: from [10.137.0.57] ([14.33.99.107]) by smtp.gmail.com with ESMTPSA id
 o4-20020a17090a5b0400b00263b4b1255esm3403185pji.51.2023.08.18.08.46.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 18 Aug 2023 08:46:35 -0700 (PDT)
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
X-Inumbo-ID: 6a88522d-3dde-11ee-9b0c-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1692373597; x=1692978397;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:subject:from:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+jx5RSLTw30Nq5GpRjwoFyWLugIiYJY9y8Xx3gRG6sI=;
        b=dCCwD3hqVs7Yr2LWpptrZcV6PcAZ6BDxhAhTcBtu8PJarJv3MYUgOR/N0K/T4vjvNl
         k37JFTrgIXU59YjTnEUbCqDhDJHGDpd8+u5eMGknQZWC44BqeFPKzBg3vj9g8Bajw/GB
         gnQRQ9M2DkbXmDUwDS5jH296X2j5WeNaC23GH36Fwi/1AYwwM4OWtXN2S7gWCnc2iAGM
         aQQIabgHDo376lGK/006z/RQs3nWgJ5eRWtVYXDj7S3R+1vOS0yWUeEghVnmJHShO8bW
         iv81PvYVhlpyKaRsU/k0pZ+nR6EoI8znqGqgIVVgtTLiTTgMyhaCGjXhWY30Phpjiecg
         sc7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692373597; x=1692978397;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:subject:from:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+jx5RSLTw30Nq5GpRjwoFyWLugIiYJY9y8Xx3gRG6sI=;
        b=EZELB0xXh9CqfxUPIQO1v61nOIbvFhSh00nzbDZQ6vsV3oS9uVbdia+7fwz2qESwCN
         J3k1jmu+zyBQo539Po/ZvjRGSxW2ApgwkxKM5OkgFvTZaxJz5uJr92wBrO1OnzXGywgY
         je4aAq3roV8TlQQIflfWSIS6k24NEg/9Gwtxl/XvAwcz4cK5bauChnqDEqSC8lv0zPcr
         t0sa2+lX6DIpnRahkShR+w1SX/5HDveEqpmImkmSrTWSiB3doHlcv0DNqUIObazsyKfl
         FyPT5uxLC5pDSJ/+zeBHGaSkk5pN35fmbyO+24zXL82au/rzNS3kmuDVIWyNIevuinv6
         oBXA==
X-Gm-Message-State: AOJu0YwZmDorGcSeoC3OhD/uHSUVu9SGKD/BAxy5Fl50iflQjuEuuTUy
	oWyuupn/MD4UuF2n41LlbCM=
X-Google-Smtp-Source: AGHT+IFItXjWmD7PhztM9Z2UGCNDAzLriU9yJ3S5cvEVu8a73PjHzSAClc7U+oxddT87zvdBX+jUwA==
X-Received: by 2002:a17:90b:3908:b0:268:2f6:61c4 with SMTP id ob8-20020a17090b390800b0026802f661c4mr3888963pjb.12.1692373596701;
        Fri, 18 Aug 2023 08:46:36 -0700 (PDT)
Message-ID: <46162899-50bb-30ac-133f-90355706347b@gmail.com>
Date: Sat, 19 Aug 2023 00:46:05 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
From: Jinoh Kang <jinoh.kang.kr@gmail.com>
Subject: [PATCH 1/6] x86/hvm: only populate info->cr2 for #PF in
 hvm_get_pending_event()
Cc: Jan Beulich <jbeulich@suse.com>, Andrew Cooper
 <andrew.cooper3@citrix.com>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>, Wei Liu <wl@xen.org>, Paul Durrant <paul@xen.org>,
 Jun Nakajima <jun.nakajima@intel.com>, Kevin Tian <kevin.tian@intel.com>,
 Tim Deegan <tim@xen.org>, George Dunlap <george.dunlap@citrix.com>,
 xen-devel@lists.xenproject.org
References: <ca40fdab-fbe4-8679-9f7c-194d54a7ef34@gmail.com>
Content-Language: en-US
In-Reply-To: <ca40fdab-fbe4-8679-9f7c-194d54a7ef34@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Prepare for an upcoming patch that overloads the 'cr2' field for #DB.

Signed-off-by: Jinoh Kang <jinoh.kang.kr@gmail.com>
---
 xen/arch/x86/hvm/hvm.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/xen/arch/x86/hvm/hvm.c b/xen/arch/x86/hvm/hvm.c
index 3a99c0ff20be..48a77524f198 100644
--- a/xen/arch/x86/hvm/hvm.c
+++ b/xen/arch/x86/hvm/hvm.c
@@ -502,9 +502,14 @@ void hvm_migrate_pirqs(struct vcpu *v)
 
 static bool hvm_get_pending_event(struct vcpu *v, struct x86_event *info)
 {
-    info->cr2 = v->arch.hvm.guest_cr[2];
+    if ( !alternative_call(hvm_funcs.get_pending_event, v, info) )
+        return false;
+
+    if ( info->type == X86_EVENTTYPE_HW_EXCEPTION &&
+         info->vector == X86_EXC_PF )
+        info->cr2 = v->arch.hvm.guest_cr[2];
 
-    return alternative_call(hvm_funcs.get_pending_event, v, info);
+    return true;
 }
 
 void hvm_do_resume(struct vcpu *v)
-- 
2.41.0


