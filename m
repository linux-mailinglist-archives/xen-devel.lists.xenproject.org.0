Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D2589BB85D0
	for <lists+xen-devel@lfdr.de>; Sat, 04 Oct 2025 00:56:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1136997.1473474 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v4oh6-00051Y-0y; Fri, 03 Oct 2025 22:56:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1136997.1473474; Fri, 03 Oct 2025 22:56:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v4oh5-0004zM-S3; Fri, 03 Oct 2025 22:56:07 +0000
Received: by outflank-mailman (input) for mailman id 1136997;
 Fri, 03 Oct 2025 22:56:05 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=WVFT=4M=citrix.com=andrew.cooper3@srs-se1.protection.inumbo.net>)
 id 1v4of6-0004mK-8r
 for xen-devel@lists.xenproject.org; Fri, 03 Oct 2025 22:54:04 +0000
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [2a00:1450:4864:20::433])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id da8d35cf-a0ab-11f0-9809-7dc792cee155;
 Sat, 04 Oct 2025 00:54:01 +0200 (CEST)
Received: by mail-wr1-x433.google.com with SMTP id
 ffacd0b85a97d-42557c5cedcso1550919f8f.0
 for <xen-devel@lists.xenproject.org>; Fri, 03 Oct 2025 15:54:01 -0700 (PDT)
Received: from localhost.localdomain (host-92-22-57-86.as13285.net.
 [92.22.57.86]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4255d8a6bbesm9616571f8f.12.2025.10.03.15.54.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Oct 2025 15:54:00 -0700 (PDT)
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
X-Inumbo-ID: da8d35cf-a0ab-11f0-9809-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1759532041; x=1760136841; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mWok3/ERT2Kd1oqFiPyrt4RuQmQhVZTmRdQZKV98WJM=;
        b=LzXkfqppwPGWgnVAnoDUTbjyMpT1tGNl4eIVoGuMGcOZqS7vItKiWDS3eOtkqQYLq4
         W5F1Lun7lOEdLiRz/49QCHdzfh5ekx/UGdv2qISgDTPGmsfgbxXQAmBvsL2ZIyJ1H6CW
         pfszVGxy429GjuBvCfx2kALgHPEfEv3zDNDb4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759532041; x=1760136841;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mWok3/ERT2Kd1oqFiPyrt4RuQmQhVZTmRdQZKV98WJM=;
        b=lgVEmH91hMh+6ymqDklLMRi5U/InN6zH1RsW+usYQZt5/hQ1JfdPr/DKfJoPy6iMHm
         lxnUAKSIdNxpSHmc1jFCtrqArftpQFn4uc3phngcdemXnv2lAYqibeWoOqqewUtxMXOh
         eIe8YtTj3j1iM34QBIfQ2LXv/D8Q4MdcjRyvyl974ZiF2WT4wVY8plkOFCkJdMf4JHmQ
         1SlOL6PWbZkZqtdXsBxT/BnavLrxgnc8IooBu+pEOCIygToO+vtDpSkwtWVTyRS+2PRZ
         4i+aL6AK7k3ds/0PrSncg6SrD/Zsp/ftNQhzyzJhXaqcDGxVL92Vd35aw5r/unryww9l
         dqpw==
X-Gm-Message-State: AOJu0Ywo+jZ9dYLFy79Halx8taMk4E5vRUSYLfZTQNj9zkP9+uL/WTT3
	i5L4Gx+8obE8DDRKj5vG+HV+aLhk1VarMyVSCpqWPLPKkxdEyFyVAczXBt/qqLsjR5GXBqdNr49
	8pHlBDDfX0A==
X-Gm-Gg: ASbGncszh3DTvTnmteA2bdLFzGyVMkGVQIpAQm6I3Hyrp7VlV/eQBzcWegXIEPI/JUh
	yX/Ufh/RuQUgRw9iSr32SjCDdIZRNvtFDYhoRa/8IapzGp2cS4dGKT7sgeYBQlV4TRRMxyco1aQ
	Edo4tnY+eVKaOFfYvell5VxeiSaSEikuDemc+5xVc8N+w5WrgHF9KmuQfcU67oTm9H5K8phnYaq
	cNSzFUZRkKmJI20Lq/cQxQYsqmdqNe05pRSGRDISNkSkBnesKqqxYteDyV/gOIPj7rAgpzS19xB
	xLM5gO/jM8ETAsnBc4Qg0LcS87IW/XnamEKOhQx6jGcC9ZhzsnXwi1IQdH5/wYg8OFQxGZ/sCK6
	EL1Hr1pHLuiCbyjk4d3/UbkCvSVtnBRgLnxn/HlSYPH4cFztSG6oMBrKINjDVBvn/R1YMz7dWlw
	fMMbJxaLO6Ax/w4cDMc1JxOwakp+ka2MY=
X-Google-Smtp-Source: AGHT+IGAlj9NvArVgrk3EIWYhVj9LhocWPo66bi9Ey3W4rHABnNTDyCv5iC1f+VVMdCI3V+43cm1vQ==
X-Received: by 2002:a5d:5d0b:0:b0:3fe:4fa2:8cdc with SMTP id ffacd0b85a97d-425671c3b54mr2819740f8f.60.1759532040804;
        Fri, 03 Oct 2025 15:54:00 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Jan Beulich <JBeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH v3 17/22] x86/entry: Rework the comment about SYSCALL and DF
Date: Fri,  3 Oct 2025 23:53:29 +0100
Message-Id: <20251003225334.2123667-18-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20251003225334.2123667-1-andrew.cooper3@citrix.com>
References: <20251003225334.2123667-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

It's soon going to be needed in a second location.

Right now it's misleading saying that nothing else would be cleared.  It's
missing the more important point that SYSCALLs are treated like all other
interrupts and exceptions, and undergo normal flags handling there.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
Acked-by: Jan Beulich <jbeulich@suse.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>

v2:
 * New
---
 xen/arch/x86/x86_64/entry.S | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/xen/arch/x86/x86_64/entry.S b/xen/arch/x86/x86_64/entry.S
index 01b431793b7b..ca446c6ff0ce 100644
--- a/xen/arch/x86/x86_64/entry.S
+++ b/xen/arch/x86/x86_64/entry.S
@@ -39,10 +39,9 @@ FUNC_LOCAL(switch_to_kernel)
         leal  (,%rcx,TBF_INTERRUPT),%ecx
 
         /*
-         * The PV ABI hardcodes the (guest-inaccessible and virtual)
-         * SYSCALL_MASK MSR such that DF (and nothing else) would be cleared.
-         * Note that the equivalent of IF (VGCF_syscall_disables_events) is
-         * dealt with separately above.
+         * The PV ABI, given no virtual SYSCALL_MASK, hardcodes that DF is
+         * cleared.  Other flags are handled in the same way as interrupts and
+         * exceptions in create_bounce_frame().
          */
         mov   $~X86_EFLAGS_DF, %esi
 
-- 
2.39.5


