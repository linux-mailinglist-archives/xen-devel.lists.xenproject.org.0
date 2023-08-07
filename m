Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 358D8772E31
	for <lists+xen-devel@lfdr.de>; Mon,  7 Aug 2023 20:52:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.578806.906569 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qT5L5-0000Kc-1V; Mon, 07 Aug 2023 18:52:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 578806.906569; Mon, 07 Aug 2023 18:52:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qT5L4-0000Hw-SG; Mon, 07 Aug 2023 18:52:22 +0000
Received: by outflank-mailman (input) for mailman id 578806;
 Mon, 07 Aug 2023 18:52:21 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Qk11=DY=gmail.com=jandryuk@srs-se1.protection.inumbo.net>)
 id 1qT5L3-0004lg-Fp
 for xen-devel@lists.xenproject.org; Mon, 07 Aug 2023 18:52:21 +0000
Received: from mail-oo1-xc30.google.com (mail-oo1-xc30.google.com
 [2607:f8b0:4864:20::c30])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 89533fb3-3553-11ee-b280-6b7b168915f2;
 Mon, 07 Aug 2023 20:52:20 +0200 (CEST)
Received: by mail-oo1-xc30.google.com with SMTP id
 006d021491bc7-56ca4d7079aso3310667eaf.0
 for <xen-devel@lists.xenproject.org>; Mon, 07 Aug 2023 11:52:20 -0700 (PDT)
Received: from pm2-ws13.praxislan02.com
 (207-172-141-204.s8906.c3-0.slvr-cbr1.lnh-slvr.md.cable.rcncustomer.com.
 [207.172.141.204]) by smtp.gmail.com with ESMTPSA id
 l3-20020a0ce503000000b00635fcd30ff9sm3077278qvm.40.2023.08.07.11.52.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Aug 2023 11:52:18 -0700 (PDT)
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
X-Inumbo-ID: 89533fb3-3553-11ee-b280-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1691434339; x=1692039139;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=u8YY0cMbSt93RGcC2b1IS+Yfu6uCEeREtdnIWAGkVWs=;
        b=GYWW5JX4pXnd3+DLhH12t6E5X7ni1FxzUuRMa1pwAj58O14rcveuPnkf8ddsYil1bg
         /W7kjcE1lJFd1OexBkUESi9KAaguNkDuL9n7WJ0Qj96karMvJ9LsBCvWGl6E5BhqQSTs
         g/IbyLBh1RC10mAfYXllHqhvKZOGpSlV10BrHRgh3uwo+YwDsN564CHxhD9u+1w/IZ/L
         qHVqnZaukjwds/uomKxmmITyBQuPEgyuuDm7mXOieVRIGiS8PWZcSJf1v6wv32CTcfHg
         /Ts3HpaKR8PNoDtOZd0mxvRj4U+xDPX1mI7ZllF8j0EimHiJjelyBL9Klm7GKPT8WBwA
         wMzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691434339; x=1692039139;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=u8YY0cMbSt93RGcC2b1IS+Yfu6uCEeREtdnIWAGkVWs=;
        b=MxYWnl1oEYYaSFsh8a595kPrgRf5/fm6a4kYR8O5OXcbx/dpwt39eBuY32Ce/3v9Pq
         GMVCH8BDSKRompoDOhcHWfMdaZlONa6xQX/GjpyHyeF4ZUztE22qDyk/YxtqJnE4hzB6
         o4kSCzlJIWyDFpMc3XMz1Hry8U/nkIXxPECVhjwqtduYe4UaDmM04hVQwP0qm6I6J8Mg
         TaJSn5CspInEOIad3/q7KVPtrV3fysZ2DCQAP5xhTrUI5Fu0dIS3AF+2D5uexG6iHD3K
         an/4DPzhwFfhJ4OuETFun5T+kiOvuHoqbs2/F8nO7HxcETRK8tjKqggha0tfGp7qNc6h
         PTWA==
X-Gm-Message-State: AOJu0Yzu40o2i6lxsMYjX3xjIbaewr/TLnpXwGeF9I4A0fHHdMo1f4vK
	tQKtYLg8nxELO77EvB1m2DARTxwXDzk=
X-Google-Smtp-Source: AGHT+IEgaCDlSduv/RvPBK6XMI+y0QAxWUnpQ54azRZXBg+BliJoQMDaz8dLyZ2DSoZcqwCXAbZbdQ==
X-Received: by 2002:a05:6358:4285:b0:134:eed0:3bc5 with SMTP id s5-20020a056358428500b00134eed03bc5mr7203855rwc.9.1691434338972;
        Mon, 07 Aug 2023 11:52:18 -0700 (PDT)
From: Jason Andryuk <jandryuk@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Jason Andryuk <jandryuk@gmail.com>,
	Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>,
	Jan Beulich <jbeulich@suse.com>
Subject: [PATCH v8 11/15] xenpm: Print HWP/CPPC parameters
Date: Mon,  7 Aug 2023 14:51:15 -0400
Message-ID: <20230807185119.98333-12-jandryuk@gmail.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230807185119.98333-1-jandryuk@gmail.com>
References: <20230807185119.98333-1-jandryuk@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Print HWP-specific parameters.  Some are always present, but others
depend on hardware support.

Signed-off-by: Jason Andryuk <jandryuk@gmail.com>
Reviewed-by: Jan Beulich <jbeulich@suse.com>
---
v2:
Style fixes
Declare i outside loop
Replace repearted hardware/configured limits with spaces
Fixup for hw_ removal
Use XEN_HWP_GOVERNOR
Use HWP_ACT_WINDOW_EXPONENT_*
Remove energy_perf hw autonomous - 0 doesn't mean autonomous

v4:
Return activity_window from calculate_hwp_activity_window
Use blanks instead of _ in output
Use MASK_EXTR
Check XEN_HWP_DRIVER name since governor is no longer returned
s/hwp/cppc

v5:
Add Jan's Reviewed-by

v8:
Switch from "if ( !hwp )" to "if ( hwp )" and re-org code.
Use %PRIu32 instead of %u - this lengthens some strings past 80 chars
---
 tools/misc/xenpm.c | 68 +++++++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 67 insertions(+), 1 deletion(-)

diff --git a/tools/misc/xenpm.c b/tools/misc/xenpm.c
index 3f5b2afcea..688529b59d 100644
--- a/tools/misc/xenpm.c
+++ b/tools/misc/xenpm.c
@@ -708,6 +708,46 @@ void start_gather_func(int argc, char *argv[])
     pause();
 }
 
+static unsigned int calculate_activity_window(const xc_cppc_para_t *cppc,
+                                              const char **units)
+{
+    unsigned int mantissa = MASK_EXTR(cppc->activity_window,
+                                      XEN_CPPC_ACT_WINDOW_MANTISSA_MASK);
+    unsigned int exponent = MASK_EXTR(cppc->activity_window,
+                                      XEN_CPPC_ACT_WINDOW_EXPONENT_MASK);
+    unsigned int multiplier = 1;
+    unsigned int i;
+
+    /*
+     * SDM only states a 0 register is hardware selected, and doesn't mention
+     * a 0 mantissa with a non-0 exponent.  Only special case a 0 register.
+     */
+    if ( cppc->activity_window == 0 )
+    {
+        *units = "hardware selected";
+
+        return 0;
+    }
+
+    if ( exponent >= 6 )
+    {
+        *units = "s";
+        exponent -= 6;
+    }
+    else if ( exponent >= 3 )
+    {
+        *units = "ms";
+        exponent -= 3;
+    }
+    else
+        *units = "us";
+
+    for ( i = 0; i < exponent; i++ )
+        multiplier *= 10;
+
+    return mantissa * multiplier;
+}
+
 /* print out parameters about cpu frequency */
 static void print_cpufreq_para(int cpuid, struct xc_get_cpufreq_para *p_cpufreq)
 {
@@ -733,7 +773,33 @@ static void print_cpufreq_para(int cpuid, struct xc_get_cpufreq_para *p_cpufreq)
 
     printf("scaling_driver       : %s\n", p_cpufreq->scaling_driver);
 
-    if ( !hwp )
+    if ( hwp )
+    {
+        const xc_cppc_para_t *cppc = &p_cpufreq->u.cppc_para;
+
+        printf("cppc variables       :\n");
+        printf("  hardware limits    : lowest [%"PRIu32"] lowest nonlinear [%"PRIu32"]\n",
+               cppc->lowest, cppc->lowest_nonlinear);
+        printf("                     : nominal [%"PRIu32"] highest [%"PRIu32"]\n",
+               cppc->nominal, cppc->highest);
+        printf("  configured limits  : min [%"PRIu32"] max [%"PRIu32"] energy perf [%"PRIu32"]\n",
+               cppc->minimum, cppc->maximum, cppc->energy_perf);
+
+        if ( cppc->features & XEN_SYSCTL_CPPC_FEAT_ACT_WINDOW )
+        {
+            unsigned int activity_window;
+            const char *units;
+
+            activity_window = calculate_activity_window(cppc, &units);
+            printf("                     : activity_window [%"PRIu32" %s]\n",
+                   activity_window, units);
+        }
+
+        printf("                     : desired [%"PRIu32"%s]\n",
+               cppc->desired,
+               cppc->desired ? "" : " hw autonomous");
+    }
+    else
     {
         printf("scaling_avail_gov    : %s\n",
                p_cpufreq->scaling_available_governors);
-- 
2.41.0


