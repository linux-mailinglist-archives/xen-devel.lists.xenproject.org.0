Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 63A5133190E
	for <lists+xen-devel@lfdr.de>; Mon,  8 Mar 2021 22:08:02 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.95111.179485 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lJN6W-0007dp-Ej; Mon, 08 Mar 2021 21:07:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 95111.179485; Mon, 08 Mar 2021 21:07:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lJN6W-0007d7-As; Mon, 08 Mar 2021 21:07:52 +0000
Received: by outflank-mailman (input) for mailman id 95111;
 Mon, 08 Mar 2021 21:07:49 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=odrr=IG=gmail.com=jandryuk@srs-us1.protection.inumbo.net>)
 id 1lJN25-0006P0-Jk
 for xen-devel@lists.xenproject.org; Mon, 08 Mar 2021 21:03:17 +0000
Received: from mail-qt1-x82d.google.com (unknown [2607:f8b0:4864:20::82d])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 1a6da784-fe9b-49da-bd27-6060c32b14c3;
 Mon, 08 Mar 2021 21:02:45 +0000 (UTC)
Received: by mail-qt1-x82d.google.com with SMTP id w6so8655624qti.6
 for <xen-devel@lists.xenproject.org>; Mon, 08 Mar 2021 13:02:45 -0800 (PST)
Received: from pm2-ws13.praxislan02.com ([2001:470:8:67e:a33e:daa7:46a1:a7eb])
 by smtp.gmail.com with ESMTPSA id
 r2sm8514070qti.4.2021.03.08.13.02.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Mar 2021 13:02:44 -0800 (PST)
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
X-Inumbo-ID: 1a6da784-fe9b-49da-bd27-6060c32b14c3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=rVtlX4LAnp5jRUKVkmkEc1GA5I4vbGffEAZm21QjQrM=;
        b=eH2n4iUAB2+95HjUtKYHsMFrWKuAIs+a2kPamNBPo+kMHSFIyvtZE79ZYIdgEfeK6l
         y0ni+1qQDOUE+zmAIHmGQEIaYSBkZOWu6HiDcuNY/siQpIsanZpz9t23Bnokwmxxu9DZ
         K9EMpdGG5FDFfSGtVFLS0tigh4zB9JPK3aQ4kFoHhgXwHoWby7eVhrhawY6kwmHzBoU4
         Y6KsI9N80zxxGO723ZShW22iXhz10LlakmRgIFCaU4uEPKjpO9vSc2FA/95V6can/+TL
         36y+e3nQ9/Wfk2ngdzo1xuuGnGxRyf9Oocg+v2gaAUvliRQFdoRGNfvwVTGmnJb7KoJW
         smqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=rVtlX4LAnp5jRUKVkmkEc1GA5I4vbGffEAZm21QjQrM=;
        b=TO4onI8nKQetLFDRtntm7Vp5tMMH56ZY4aItRNOHKnaml4mGpKXjNz9FQRWzOhSa/n
         CkN83G2P3GUkK+039NOmYqndWdHdIa5EjC1geLY6eFFlBNrxf7/hbFteo9RwEUCJVRF3
         eC8cb0hJpwdtY0jvySZeshJmznVzqQYeRx4yQjqT6RjxB0KvZ8buW6gi9+4bnDidBvXN
         8fDINwwjBolKnu7F5U82SzVEieBZ8mTr3lj2mJig/pFxV7qvNyrJmwly9EWddQppalqD
         FQfOZRJcLO8cxHEx763rsW1YfNhzfPmLz9dTFKBs4Zqph790NrQ8M7Tj8LkL92VkRZ23
         csTg==
X-Gm-Message-State: AOAM5313cVkbMw5doQUjmTL6yndtydkQvd3nX+Dp5GNRgb7PwxbGG6d2
	41YKQCIIiw5NuYBT0nI8NirxvL7p8N4=
X-Google-Smtp-Source: ABdhPJz7FWHDpj+qhIKakYWL0X3cPsCoqUlVm65leH4sWpU/7lxdScTpjRTxPbVQyd01jeNXSNDKvw==
X-Received: by 2002:ac8:4f52:: with SMTP id i18mr22418241qtw.82.1615237364551;
        Mon, 08 Mar 2021 13:02:44 -0800 (PST)
From: Jason Andryuk <jandryuk@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: pawel@invisiblethingslab.com,
	marmarek@invisiblethingslab.com,
	Jason Andryuk <jandryuk@gmail.com>,
	Ian Jackson <iwj@xenproject.org>,
	Wei Liu <wl@xen.org>
Subject: [RFC 11/12] libxc: Add xc_set_cpufreq_hwp
Date: Mon,  8 Mar 2021 16:02:09 -0500
Message-Id: <20210308210210.116278-12-jandryuk@gmail.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210308210210.116278-1-jandryuk@gmail.com>
References: <20210308210210.116278-1-jandryuk@gmail.com>
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
index 3b0ca62fc7..dc8e1bb23a 100644
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
2.29.2


