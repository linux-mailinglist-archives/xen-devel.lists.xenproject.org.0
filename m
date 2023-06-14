Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 17387730716
	for <lists+xen-devel@lfdr.de>; Wed, 14 Jun 2023 20:09:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.549175.857591 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q9Uvu-0004V4-MU; Wed, 14 Jun 2023 18:09:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 549175.857591; Wed, 14 Jun 2023 18:09:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q9Uvu-0004SB-Ig; Wed, 14 Jun 2023 18:09:26 +0000
Received: by outflank-mailman (input) for mailman id 549175;
 Wed, 14 Jun 2023 18:09:25 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=nA9c=CC=gmail.com=jandryuk@srs-se1.protection.inumbo.net>)
 id 1q9Uqi-0005LA-Hm
 for xen-devel@lists.xenproject.org; Wed, 14 Jun 2023 18:04:04 +0000
Received: from mail-qv1-xf2a.google.com (mail-qv1-xf2a.google.com
 [2607:f8b0:4864:20::f2a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d8ae584a-0add-11ee-b232-6b7b168915f2;
 Wed, 14 Jun 2023 20:04:04 +0200 (CEST)
Received: by mail-qv1-xf2a.google.com with SMTP id
 6a1803df08f44-5ed99ebe076so20969846d6.2
 for <xen-devel@lists.xenproject.org>; Wed, 14 Jun 2023 11:04:04 -0700 (PDT)
Received: from pm2-ws13.praxislan02.com ([2001:470:8:67e:ba27:ebff:fee8:ce27])
 by smtp.gmail.com with ESMTPSA id
 s5-20020a05621412c500b006262de12a8csm4851613qvv.65.2023.06.14.11.04.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 Jun 2023 11:04:01 -0700 (PDT)
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
X-Inumbo-ID: d8ae584a-0add-11ee-b232-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686765842; x=1689357842;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XCeW0dYT+v8QEPZf3DSgLima7EAFRRshc9U3zxruA5E=;
        b=ioef9NoqNOhWXzDGhf07TsMCIL+/ArZDW82lXoz5o44kk+HsZ44H7MENnzkDPj/7+g
         PdclA63C4YtxigRpv5fjwKmEZXwkOtJ4mB0REgQI3lDtKLAUhM2YfOLahLWTPEadTGoP
         kqVyA43mGoFGz/6gqVESnZiBS7fAS6yFaWLsZmpEQyfmU+dmgs9Rf4qCpgS8Uyv1qb0m
         Y+Fw7S661t8TCupEDlE9ODvV04zreWC5zul5PfgiRWVZvRpQCF6XXwpC82UD2To+1K5I
         wA6Bl9dhAw43WhmOBc3nNLP5SQ+8J5wLM7uFAQwdoa2f8LWAnfiwYYzIMk2UxpHx3d7C
         FQ9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686765842; x=1689357842;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XCeW0dYT+v8QEPZf3DSgLima7EAFRRshc9U3zxruA5E=;
        b=QOH79vRZZ9kW7m83aL/7nAnaB+Kz5g9lY+Z3T1z4fxP9F5vcPTU45Q+GwTvk5im9Mc
         W813//hANWz4bEdPdAl9Ltq0CsRV8lqYlVmz7V4wmXfGwYfRUqKPG02iAsrD3VmnlcPt
         QWKkRc/PgsSi7amNmw9Wl1XoSrEI74n1zad9RuqCgFTHv2RWTScMjCFG4CWDUDtJCB/J
         QA8jQlTN+YzpJpKhnhqZtg1rjPzqEqZgy0nn9QYRlT1VMqQ4ae6DMPUuMP/4INJdTgqV
         3VUTScyCP2sT5SEfEb//RLVhtMN0ptQDPUYlvAzS1xOWNfGTGyNBRMz5IgVXqbiaW03N
         6a+g==
X-Gm-Message-State: AC+VfDyolF4vCEad//wpcYb4AmVsJUKSXqRKTCYBQMN/iGdwyXyhoIfF
	XGAbq9nSIgdVzf3dMjq2RRwRp77dVVw=
X-Google-Smtp-Source: ACHHUZ5n3c7JJqP1H1zg8yJ4E2XIk4P1BXCK8CNzYiAoIkAiTzgx0S4MhLraMwl1ofebkDHWX4xUEA==
X-Received: by 2002:ad4:5de3:0:b0:62f:ea09:7088 with SMTP id jn3-20020ad45de3000000b0062fea097088mr1194311qvb.27.1686765842395;
        Wed, 14 Jun 2023 11:04:02 -0700 (PDT)
From: Jason Andryuk <jandryuk@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Jason Andryuk <jandryuk@gmail.com>,
	Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>,
	Juergen Gross <jgross@suse.com>
Subject: [PATCH v4 13/15] libxc: Add xc_set_cpufreq_cppc
Date: Wed, 14 Jun 2023 14:02:51 -0400
Message-Id: <20230614180253.89958-14-jandryuk@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230614180253.89958-1-jandryuk@gmail.com>
References: <20230614180253.89958-1-jandryuk@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add xc_set_cpufreq_cppc to allow calling xen_systctl_pm_op
SET_CPUFREQ_CPPC.

Signed-off-by: Jason Andryuk <jandryuk@gmail.com>
Acked-by: Anthony PERARD <anthony.perard@citrix.com>
---
v2:
Mark xc_set_hwp_para_t const

v4:
s/hwp/cppc/
Add Anthony's Ack
---
 tools/include/xenctrl.h |  4 ++++
 tools/libs/ctrl/xc_pm.c | 18 ++++++++++++++++++
 2 files changed, 22 insertions(+)

diff --git a/tools/include/xenctrl.h b/tools/include/xenctrl.h
index 2092632296..c7eb97959a 100644
--- a/tools/include/xenctrl.h
+++ b/tools/include/xenctrl.h
@@ -1930,11 +1930,15 @@ struct xc_get_cpufreq_para {
     int32_t turbo_enabled;
 };
 
+typedef struct xen_set_cppc_para xc_set_cppc_para_t;
+
 int xc_get_cpufreq_para(xc_interface *xch, int cpuid,
                         struct xc_get_cpufreq_para *user_para);
 int xc_set_cpufreq_gov(xc_interface *xch, int cpuid, char *govname);
 int xc_set_cpufreq_para(xc_interface *xch, int cpuid,
                         int ctrl_type, int ctrl_value);
+int xc_set_cpufreq_cppc(xc_interface *xch, int cpuid,
+                        const xc_set_cppc_para_t *set_cppc);
 int xc_get_cpufreq_avgfreq(xc_interface *xch, int cpuid, int *avg_freq);
 
 int xc_set_sched_opt_smt(xc_interface *xch, uint32_t value);
diff --git a/tools/libs/ctrl/xc_pm.c b/tools/libs/ctrl/xc_pm.c
index 19fe1a79dd..e86045697d 100644
--- a/tools/libs/ctrl/xc_pm.c
+++ b/tools/libs/ctrl/xc_pm.c
@@ -329,6 +329,24 @@ int xc_set_cpufreq_para(xc_interface *xch, int cpuid,
     return xc_sysctl(xch, &sysctl);
 }
 
+int xc_set_cpufreq_cppc(xc_interface *xch, int cpuid,
+                        const xc_set_cppc_para_t *set_cppc)
+{
+    DECLARE_SYSCTL;
+
+    if ( !xch )
+    {
+        errno = EINVAL;
+        return -1;
+    }
+    sysctl.cmd = XEN_SYSCTL_pm_op;
+    sysctl.u.pm_op.cmd = SET_CPUFREQ_CPPC;
+    sysctl.u.pm_op.cpuid = cpuid;
+    sysctl.u.pm_op.u.set_cppc = *set_cppc;
+
+    return xc_sysctl(xch, &sysctl);
+}
+
 int xc_get_cpufreq_avgfreq(xc_interface *xch, int cpuid, int *avg_freq)
 {
     int ret = 0;
-- 
2.40.1


