Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FC626968D7
	for <lists+xen-devel@lfdr.de>; Tue, 14 Feb 2023 17:11:45 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.495269.765595 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pRxth-0002w1-8m; Tue, 14 Feb 2023 16:11:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 495269.765595; Tue, 14 Feb 2023 16:11:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pRxth-0002uD-5b; Tue, 14 Feb 2023 16:11:13 +0000
Received: by outflank-mailman (input) for mailman id 495269;
 Tue, 14 Feb 2023 16:11:11 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=jX19=6K=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pRxtf-0002sY-MV
 for xen-devel@lists.xenproject.org; Tue, 14 Feb 2023 16:11:11 +0000
Received: from EUR02-AM0-obe.outbound.protection.outlook.com
 (mail-am0eur02on20627.outbound.protection.outlook.com
 [2a01:111:f400:fe13::627])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 316928c8-ac82-11ed-93b5-47a8fe42b414;
 Tue, 14 Feb 2023 17:11:09 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM0PR04MB6884.eurprd04.prod.outlook.com (2603:10a6:208:183::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6086.24; Tue, 14 Feb
 2023 16:11:07 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e138:4fc3:705c:d178]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e138:4fc3:705c:d178%7]) with mapi id 15.20.6086.024; Tue, 14 Feb 2023
 16:11:07 +0000
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
X-Inumbo-ID: 316928c8-ac82-11ed-93b5-47a8fe42b414
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=C99l2jMkVu9rzdHMOsHKmHwNS9BXezQ2iP6vvNFPn7+Ff87icPa6QXJJSf69OqINNj+HFCHRqE1pW5f6y1Podjz4FckXyBrTJrH6NQPBIXHt89JmRkuab+M2fJMTqspvodejXDQrv0Rk2Hzxaz6UWl6+/nC/sC2jdRZuJn3vNOwDHUOVa3NXULbrx+3ZBZ5mTA330aiuykWUL1VdDxEYEeWVqQW7J+BKWRGpeWIk4mU2x1NaWOwwDbwhFFwBl8a5qNWfgSWU4+Tps5YRP5wwwyvjNcoDIHI9aWCG/Ev1KQU4w1Tiw2X+AoH0s0pQDocvvpVmBsTipiROv3ICVra/9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=d+/DUjrNApE1of8R+q9OMsOXlsFTj99u5P7jS1EbUzw=;
 b=HlzK3w2z8vDcWlMOVrr3ldmCB5ym69dXwYYUT00Q9Da+RmIC1lzD/YbrFA2lb5yI65+WT9Ohn/LSiffFGlLnr6r+LaJntmrAM/CrWlZlzSufNcK908kkERraUTybrM8koUyX5OTYolKXZxyOgUF9RQbXe9f8ANTGxgT0V3Gu6tcYwQCFsm9P6YWw+oRcTi1tydtGOUfAXLv+fxWL45fTBlV3rQWR7X1AqTXe4NZ+Ud4nOdIzZ1/GidrCBE18V3YGX7vyLUjQfOS7h0bPmVouYbVZEVfNZ/qjY+LHy4CI9nmerebukVq78HXUHW8uh9HRbDL4ZLHRd4FkOtqRiCThUA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=d+/DUjrNApE1of8R+q9OMsOXlsFTj99u5P7jS1EbUzw=;
 b=mp379rXn8PAvUHg/0/2DNWWpDwNNxjCs8VFu5C9ewGCfl2xvKM91ZhuGzGwioznnlnmK+5ZAd7bc5XcPKkQZt42/61v2ZhD6ICwphB7Qvd0eh7JuAFKBXgmUa4Etf0O6O8e8a6afSqERds85Vk9b1g/n2uXW032z46hEvcMchvVuG3M9YUfKaDxHBasxJxN6Koqj161N/L3WCijP3qDIUY5AkcdWqCWN3/J4Mb9/kSOZK+zM0MX7+/vWhkQnZwO54xJ0i5HSKzmUszprnk0lAt2YvLuRorif8pmcAeLHHX4tVY5SJMU6oS6nuiF73s/HMEfIzjPDr76GrmL7W1/J0Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <83c2a504-bce4-d3e7-1d9a-76ac0ca17bab@suse.com>
Date: Tue, 14 Feb 2023 17:11:05 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.2
Subject: [PATCH v4 2/4] x86/spec-ctrl: defer context-switch IBPB until guest
 entry
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <06591b64-2f05-a4cc-a2f3-a74c3c4a76d6@suse.com>
In-Reply-To: <06591b64-2f05-a4cc-a2f3-a74c3c4a76d6@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0013.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1d::18) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AM0PR04MB6884:EE_
X-MS-Office365-Filtering-Correlation-Id: 7d646964-26d3-445f-a041-08db0ea61462
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Tskmce7OGb43LH2g6WzEvYyOya1BIYP3xbYaiTLPk72ey6rs2j1yXUt0bcKOVtKSPNv8CYQJU1bQ0GFVTu5XXyZJf8SRH2yBiMNj86yI1tlFOvicEkgR1A2ZHTJ8EFgEpacGDab33LrxQmoDI0hjhgjeezlYRRP1k7oufuHDYmpyQ5zCyCklGn5CUSVWs2qFUAEWDeRxXe0TmRyKlESL7vxpVCpn0JOK+L5rsN3KNKzAJ601Nyfj2fuspOiU6YSU2uoGZhVgs1HmOUqtxjBmrNO859vXajhAZVjZeAJ8yOHkyMIwsNpuBSyxWUqk29ihuVO1iN+Q+BwvgbjCXZFP6Sa0d5ZTvg/tLzkb1uy66tHFxyCp6EdDVWdM112UtVuz7rqRILErt7dnaXjhdOn2M9zOGTBd7nv/xvO/U39Ag+04jW+oF2VEg+hsWTOFY/uwP5gHW1010FkEJmsa2hW1IYm9xIuO6Poo5qrUHh1Fz12PXfMI+Lx2i8oQjnwh0OgdWBFL7rAZr3vWKWy/x0oLtD033+8FBbrAJL15ugXfeIiF+wfzXkgS1ny3gLPFIE5mUHBhgMTkTSEFdwrer47mFgp3CbOXFDWuV+NK/2J6dyAq32VpSCAdTmNh4vpKzSHobQbd3XYG5lssxYfDRNt3WC7KgCl/VARjl9w0oVqGYvGWV+EomQ0aG8Lt35TzNehyCuUWjd4H2YIaOwbZq9UFJLwEChBBHFaC0hMgegIGulw=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(376002)(366004)(39860400002)(396003)(346002)(136003)(451199018)(66476007)(66556008)(66946007)(6916009)(83380400001)(4326008)(31686004)(8676002)(41300700001)(316002)(8936002)(54906003)(36756003)(2906002)(5660300002)(26005)(31696002)(186003)(6486002)(478600001)(86362001)(6506007)(38100700002)(6512007)(2616005)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?b25sVkF5ZDlOdmdhMUExaGNPNUZJdXhWYnFQaUZnbm5YNEoyU09pNmI2UzlE?=
 =?utf-8?B?ZGtuOHJVZWc5OGNxU2NLcS9CVHYxQ0tHblBNM1BMVUJRcmQrUSsxNFc5eGtu?=
 =?utf-8?B?WEZGWnBnRG43dmlMRmhWbXpqV2dIMUxrR1g1djV0dVEvTk5Vdk54TDJPaEVh?=
 =?utf-8?B?VFVUZEdJUU8wOEU2bWUwdHZMdDkrbTVjUSs5Zlkyak85a3FRbjd5cndEQWwx?=
 =?utf-8?B?SFNtV0hmSzg1M1h6emlxeWZkN2FPWTlCak0wT1BVWXJCYnZzUXhuaW4vVGkw?=
 =?utf-8?B?Zk1qNU9Ca2hRTEhpcDNSdC9qcnh5NzZ1MDc3Qmg2bkdDdGd3OThqazNBY3lx?=
 =?utf-8?B?WWg0N3MzaXd6VVB4VnFBVXBxYWhrTTZmQlBPeGROdnl2eXF2T2MrQUJUeTAv?=
 =?utf-8?B?aXdGTEYxWVM3aVFlMGtsWDFYalpaaFNob1lOYndmMlVkVkZ0Mld3VWcyK2Fw?=
 =?utf-8?B?RGIwUlhTYnA3c1FSWml6dGgvWENFMmNGUENrZFZXMWZyMnQzcEhhQ05NUVJj?=
 =?utf-8?B?OFJzSXFDMGI5MmIrY2RQR2haSFBXR1pCK3k0U2o4ek1JZmRSYzZQQ0JVV2Rx?=
 =?utf-8?B?SCtPbkt1YnJQa3JCaTNPWWpEM0VXNFJFRzVmL1pma0FHeWp1S3l0Y0sybFhR?=
 =?utf-8?B?YzRheXdEVUFFbDN4RXp0RWhXaGFxRklBRC9QTXRxYnVpZWNDd2NQdFFEaFpB?=
 =?utf-8?B?YzRwYWIyTFpBMm9EeHlUbEdrOHpjaDBKN2lVTHRjd3RJUGNZWEE0NFJINldw?=
 =?utf-8?B?akhkeGYyajA1SXdiRXlaSzZSWDlrbTJueFlzQUgwUG9helJFVmtuKzZIOG52?=
 =?utf-8?B?SzJJZW1sd0hMUDRjWXZCcDhzZjZhVDM1cWZRbVM1ZHhqMHpUSFFrOG1Ua0hO?=
 =?utf-8?B?a2QxNm5ISkd5SUtsYUJqWkRucEwxaStraWo3T3gydGdndndFRzdvMUNYaTNG?=
 =?utf-8?B?MWFVaUNuVFE1aHBpWnU0TmVtaC9QSk9Ga0FVSmtDVExjVk9TNnUvSkdLRlov?=
 =?utf-8?B?MjRtKys5ZHZYWnhaNUV5enNBS2xxL2hFMXNDRWs3WXV3L2d0c0pBb2VoSHF0?=
 =?utf-8?B?SUhVcVhaZncxNWVrS0lnakZFUjJPUzFpY2pmN1pCL0lDZmNOR0hVRTNYOUxX?=
 =?utf-8?B?elZGTjQzc0FBc251alYzRDlnUksveUJCMjFlNTJRWXNTb25kN2VwSFhnWE1r?=
 =?utf-8?B?dmpQcnJKUlB4c3E2R1JvWmNsczVtRWwrcFIraENOekFkYUxjSm5XMzZqN0Qw?=
 =?utf-8?B?NjVkV2MzYlRTSzIwNDMvR1ZSWjNiSWpsQ3JCRGJQQlFQNzRTN3ZaNGEwSkpT?=
 =?utf-8?B?Z0pscTA5dlA4cjVtd0svL0phYittNG11ZjJRQ042RlV1dE1xam1GVk1FRk9D?=
 =?utf-8?B?M1krM01xRHZMYWhqNFBPazJNR1Vzc3YwU1ZNTWw1UktRbjI5T1gvaE9yQ2Zx?=
 =?utf-8?B?ZlNqQWJYWmNwNFhhcGM0Q3RqZ1hpdEpJaHgzNUIvdHJ2NTVVbk9PZTNyRjAz?=
 =?utf-8?B?N3Iwc25WRS9FNHVWRXRoSE11Wnp2eGtYeGthUHBqalUyYWFjcm4wT2M2eWtX?=
 =?utf-8?B?UDlNaXVINWJnSFIxUStzNzFrTVNkM0VrSjB1WGFVdEVvYlJuTHZnb2hHOFU1?=
 =?utf-8?B?R1l4MmhVZkcxbDJkdmxGaGE0azdTdTBQSnprQUZNZTVxMC9MblpuVmlFWjZv?=
 =?utf-8?B?UnR0YmtUbXEwVXgwcVFFTXBFZjI1ekdzb1kvTEREZ0JDRzlxOEFyL0tWQmxt?=
 =?utf-8?B?Y2MvanY5QzFaRUFxdWxrRmpBVGRLZXdwNDNxZGVCSCtQelNhL2hWSVN0WHlO?=
 =?utf-8?B?b21vT0V6Ny9qWFZDbjlzNlpGQUxReVRCT3o3QjVVbG50cGVNbVlFMlNGdDh3?=
 =?utf-8?B?dTgrVWtDUVIrUEp4REVvOHhNbmwyNzRjSnUwVEpIZG1EdnczSWFWdFlXeVJn?=
 =?utf-8?B?QjBrckw4Q0drcmF1QWQwUWsyVlBSQTVtS3JBL2JGbXBZbVhtWG9XSTdEcVUz?=
 =?utf-8?B?aldvVVFxOThMYlhGV0pjcFlJZDNqS1ROaFBlZ1cwRHRSdXlLZUdpOFcrdGgy?=
 =?utf-8?B?eGo5NzQzZXRxZnhTL2VYUWJRcE4zcTJmVkdXQ2NQM3lzcG1sR0wzZktoSFFk?=
 =?utf-8?Q?W4uUW5EVMIB1wWlE8jp1aSQ6G?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7d646964-26d3-445f-a041-08db0ea61462
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Feb 2023 16:11:07.3987
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bVEwUtcvQJBdxzOzEFyBX9jSj1PP7UJMXhJxLjaPxUEEG3WcdQ2eleMwQKzAwuqbeIqrTiAVmW5qOyeXGCc/LQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB6884

In order to avoid clobbering Xen's own predictions, defer the barrier as
much as possible. Merely mark the CPU as needing a barrier issued the
next time we're exiting to guest context.

Suggested-by: Andrew Cooper <andrew.cooper3@citrix.com>
Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
I couldn't find any sensible (central/unique) place where to move the
comment which is being deleted alongside spec_ctrl_new_guest_context().
(If this patch is to survive in the first place, it was suggested to
move to spect_ctrl_asm.h, next to the #define of the controlling bit.)
---
v4: Re-base in particular over changes earlier in the series.
v3: New.

--- a/xen/arch/x86/domain.c
+++ b/xen/arch/x86/domain.c
@@ -2038,7 +2038,7 @@ void context_switch(struct vcpu *prev, s
              */
             if ( *last_id != next_id )
             {
-                spec_ctrl_new_guest_context();
+                info->spec_ctrl_flags |= SCF_new_pred_ctxt;
                 *last_id = next_id;
             }
         }
--- a/xen/arch/x86/include/asm/spec_ctrl.h
+++ b/xen/arch/x86/include/asm/spec_ctrl.h
@@ -67,28 +67,6 @@
 void init_speculation_mitigations(void);
 void spec_ctrl_init_domain(struct domain *d);
 
-/*
- * Switch to a new guest prediction context.
- *
- * This flushes all indirect branch predictors (BTB, RSB/RAS), so guest code
- * which has previously run on this CPU can't attack subsequent guest code.
- *
- * As this flushes the RSB/RAS, it destroys the predictions of the calling
- * context.  For best performace, arrange for this to be used when we're going
- * to jump out of the current context, e.g. with reset_stack_and_jump().
- *
- * For hardware which mis-implements IBPB, fix up by flushing the RSB/RAS
- * manually.
- */
-static always_inline void spec_ctrl_new_guest_context(void)
-{
-    wrmsrl(MSR_PRED_CMD, PRED_CMD_IBPB);
-
-    /* (ab)use alternative_input() to specify clobbers. */
-    alternative_input("", "DO_OVERWRITE_RSB", X86_BUG_IBPB_NO_RET,
-                      : "rax", "rcx");
-}
-
 extern int8_t opt_ibpb_ctxt_switch;
 extern bool opt_ssbd;
 extern int8_t opt_eager_fpu;
--- a/xen/arch/x86/spec_ctrl.c
+++ b/xen/arch/x86/spec_ctrl.c
@@ -854,6 +854,11 @@ static void __init ibpb_calculations(voi
      */
     if ( opt_ibpb_ctxt_switch == -1 )
         opt_ibpb_ctxt_switch = !(opt_ibpb_entry_hvm && opt_ibpb_entry_pv);
+    if ( opt_ibpb_ctxt_switch )
+    {
+        setup_force_cpu_cap(X86_FEATURE_NEW_PRED_CTXT_PV);
+        setup_force_cpu_cap(X86_FEATURE_NEW_PRED_CTXT_HVM);
+    }
 }
 
 /* Calculate whether this CPU is vulnerable to L1TF. */


