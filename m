Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 085B3372084
	for <lists+xen-devel@lfdr.de>; Mon,  3 May 2021 21:35:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.121844.229842 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ldeLR-0007Xb-Rt; Mon, 03 May 2021 19:35:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 121844.229842; Mon, 03 May 2021 19:35:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ldeLR-0007Wo-NN; Mon, 03 May 2021 19:35:05 +0000
Received: by outflank-mailman (input) for mailman id 121844;
 Mon, 03 May 2021 19:35:04 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Wh1Q=J6=gmail.com=jandryuk@srs-us1.protection.inumbo.net>)
 id 1ldeFu-0005i5-KF
 for xen-devel@lists.xenproject.org; Mon, 03 May 2021 19:29:22 +0000
Received: from mail-qk1-x729.google.com (unknown [2607:f8b0:4864:20::729])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 67c84692-857f-406e-b7f5-ce41fbc9cc96;
 Mon, 03 May 2021 19:28:54 +0000 (UTC)
Received: by mail-qk1-x729.google.com with SMTP id q127so6277958qkb.1
 for <xen-devel@lists.xenproject.org>; Mon, 03 May 2021 12:28:54 -0700 (PDT)
Received: from pm2-ws13.praxislan02.com ([2001:470:8:67e:8710:5560:a711:776f])
 by smtp.gmail.com with ESMTPSA id
 g18sm9225209qke.21.2021.05.03.12.28.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 May 2021 12:28:53 -0700 (PDT)
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
X-Inumbo-ID: 67c84692-857f-406e-b7f5-ce41fbc9cc96
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=W0dWQDpwEXoVAFtJGqplAcn8R3hLDan97osHedktuzA=;
        b=jeAjy/+B/nRqPMGmVF+3m+72zaVTjLaZvFYZSePfzwkhZoOAiPKLpoeYT4Y7f8KNru
         IN8zHh5ajNrJHuLR8D9RfEz7Rb9Qv3hrAlwuXlfu9kj4iM6om55UeBgPlcPbehR7btBj
         FEoF+XgPnyMAhDwL7Cwx+JHYcj8th2ikK4EDPnsJI3y0qfBkm7oyOyAJ6Jh5zBsaML+1
         avV3KbPga57bSfIcmSu0a5y9BwGkLtwzZN1NgW3iZXKBPjABpprnwM6w3DCTewcQgI+U
         GnwxM+wsrY2jsnTmSfGAVi4ngq5nYKDqoR6sHQ7dRVecGh5wtL2TsnbeMBiksn4MOGPP
         SNiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=W0dWQDpwEXoVAFtJGqplAcn8R3hLDan97osHedktuzA=;
        b=W7vmTRBLEq59hle7farg74MjR34dQLgcLsX+182+L13IFRoEzKmE9DTLgugww0XSqb
         Ll6jyNQRf5jZCqgYbpa+xK417IF63vSQeDdg/JPyWSehBJsHariUAiudZTJDoPJgrPQ2
         PIZxdTiqP7QfNV1uDdw9zU1TtlvT1llQxOWyVKbZm1C0J5WocLO8GJW3U0JJUvOosOJH
         U01YwjImPKVmU989ibfgNvVqWVSvf//sLBfIOpPfXw7t/QTjLDS3OmPIPle/ZKOLpBwO
         mIA09iPUSNMzgAyG1S64Jzehl7tAVRn5yWwM1AOrqjMP5IhTiuKXVPLWNdz4rvlb+Aht
         Cqqg==
X-Gm-Message-State: AOAM530VrBtfAghkJylPN6hZSN781xo6+KSsw0IULQ20PgrwL32TqkM+
	AZSovIfpL4kPI4sTiYow2Y4W1+P8TLI=
X-Google-Smtp-Source: ABdhPJxRgtng+6wCpftZbN46/DsbYWTqBEYMoYU4Bv7uuJjFVyruFKXM/P3Mof7Bhs5NjIskLYxNGQ==
X-Received: by 2002:ae9:c014:: with SMTP id u20mr21902294qkk.387.1620070133953;
        Mon, 03 May 2021 12:28:53 -0700 (PDT)
From: Jason Andryuk <jandryuk@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Jason Andryuk <jandryuk@gmail.com>,
	Ian Jackson <iwj@xenproject.org>,
	Wei Liu <wl@xen.org>
Subject: [PATCH 10/13] libxc: Add xc_set_cpufreq_hwp
Date: Mon,  3 May 2021 15:28:07 -0400
Message-Id: <20210503192810.36084-11-jandryuk@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210503192810.36084-1-jandryuk@gmail.com>
References: <20210503192810.36084-1-jandryuk@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add xc_set_cpufreq_hwp to allow calling xen_systctl_pm_op
SET_CPUFREQ_HWP.

Signed-off-by: Jason Andryuk <jandryuk@gmail.com>

---
Am I allowed to do set_hwp = *set_hwp struct assignment?
---
 tools/include/xenctrl.h |  4 ++++
 tools/libs/ctrl/xc_pm.c | 18 ++++++++++++++++++
 2 files changed, 22 insertions(+)

diff --git a/tools/include/xenctrl.h b/tools/include/xenctrl.h
index 82dfa1613a..0fd1e756cb 100644
--- a/tools/include/xenctrl.h
+++ b/tools/include/xenctrl.h
@@ -1994,11 +1994,15 @@ struct xc_get_cpufreq_para {
     int32_t turbo_enabled;
 };
 
+typedef struct xen_set_hwp_para xc_set_hwp_para_t;
+
 int xc_get_cpufreq_para(xc_interface *xch, int cpuid,
                         struct xc_get_cpufreq_para *user_para);
 int xc_set_cpufreq_gov(xc_interface *xch, int cpuid, char *govname);
 int xc_set_cpufreq_para(xc_interface *xch, int cpuid,
                         int ctrl_type, int ctrl_value);
+int xc_set_cpufreq_hwp(xc_interface *xch, int cpuid,
+                       xc_set_hwp_para_t *set_hwp);
 int xc_get_cpufreq_avgfreq(xc_interface *xch, int cpuid, int *avg_freq);
 
 int xc_set_sched_opt_smt(xc_interface *xch, uint32_t value);
diff --git a/tools/libs/ctrl/xc_pm.c b/tools/libs/ctrl/xc_pm.c
index 76d7eb7f26..407a24d2aa 100644
--- a/tools/libs/ctrl/xc_pm.c
+++ b/tools/libs/ctrl/xc_pm.c
@@ -330,6 +330,24 @@ int xc_set_cpufreq_para(xc_interface *xch, int cpuid,
     return xc_sysctl(xch, &sysctl);
 }
 
+int xc_set_cpufreq_hwp(xc_interface *xch, int cpuid,
+                       xc_set_hwp_para_t *set_hwp)
+{
+    DECLARE_SYSCTL;
+
+    if ( !xch )
+    {
+        errno = EINVAL;
+        return -1;
+    }
+    sysctl.cmd = XEN_SYSCTL_pm_op;
+    sysctl.u.pm_op.cmd = SET_CPUFREQ_HWP;
+    sysctl.u.pm_op.cpuid = cpuid;
+    sysctl.u.pm_op.u.set_hwp = *set_hwp;
+
+    return xc_sysctl(xch, &sysctl);
+}
+
 int xc_get_cpufreq_avgfreq(xc_interface *xch, int cpuid, int *avg_freq)
 {
     int ret = 0;
-- 
2.30.2


