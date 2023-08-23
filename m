Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AE0F7859B2
	for <lists+xen-devel@lfdr.de>; Wed, 23 Aug 2023 15:47:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.589255.921103 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qYoCy-0005cT-38; Wed, 23 Aug 2023 13:47:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 589255.921103; Wed, 23 Aug 2023 13:47:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qYoCy-0005aJ-0G; Wed, 23 Aug 2023 13:47:40 +0000
Received: by outflank-mailman (input) for mailman id 589255;
 Wed, 23 Aug 2023 13:47:38 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=iSH1=EI=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qYoCw-0005F5-Iq
 for xen-devel@lists.xenproject.org; Wed, 23 Aug 2023 13:47:38 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04on2071.outbound.protection.outlook.com [40.107.7.71])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9eca1ff9-41bb-11ee-8783-cb3800f73035;
 Wed, 23 Aug 2023 15:47:37 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by AS8PR04MB8357.eurprd04.prod.outlook.com (2603:10a6:20b:3f1::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.24; Wed, 23 Aug
 2023 13:47:07 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::f749:b27f:2187:6654]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::f749:b27f:2187:6654%5]) with mapi id 15.20.6699.025; Wed, 23 Aug 2023
 13:47:07 +0000
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
X-Inumbo-ID: 9eca1ff9-41bb-11ee-8783-cb3800f73035
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mhFIuCCn14JoP471XYPI40x07aBjXBtR91iNRCasHiuFjfvPb350rHyHpSaaTWKPCVuKm3qWewH2xW9HKGCAKgeu1/UcXLS3FHr9zazrjTZFs9PXMNfztyF85qGVG4Hnkb4rolfVugbjwN/dRzH6bvV8Cnch7CvMhZ2nUpUiUu3VsqaIChK6RSeXAptw8mvK/oBGGBvfzRiKtgy+JLP9XbxfEkbKXhHgd6+AG9FK/skza0tYmv95x9l27a9hMGkK0TOLA9hHNa4Ks/meINTykeLUd7wdpLVvYYuXD6latgPRARIm3CmWcjA6F6n7O4bs4FrQ/4+WKXmhSdNQ+8FeUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CIxt7hMLQ6hhZMWbOHJvcK1Rpe3xiwvE+0oqWF42BV4=;
 b=eYBb/s1xYJNvfQMW080hqyIZRMSihFE+Pw6vDYsDtq1wYyyLEcHUA7kHNm5HUho9woNL4TOC6DyBsL49tBW+c9/oQ47NJgXrti4Z8R8XYTIXdnYYzX4TfOYI8LS5uzHVGOBg2/fhu/5Z1y9GA3/GfowaZao974xuHJVwfw4KqVZ+8561unkkdnI/WRDhiDHQ07J/4rVSZ2VEI9GkwyyX4fBb5WFaQV6Ug6P0r0M6t1vDYylaz3YFqnj18kadwBWGjEMxLTj6rtNKo/JKb3g4132ppi5lLFYmQn6Qaa0kSt+/zaDGz+wXlbp7hQNkWFnp2AzslvmQDAS3eBKzanJ7nA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CIxt7hMLQ6hhZMWbOHJvcK1Rpe3xiwvE+0oqWF42BV4=;
 b=rikvLaJqI4tO7wjaVatmwhV52UdvlgwA7QDwQCoEkD4buWOsCCcyn6aKbmToYOk2V4brxL0MYOk9Ap1Zi53HHX8oYpqYi3sPvhRoZFLwMbjyme8dsjOD8/UYjYCXd+5jig3sMv4G4dsWTR2wPjzqxBBxC5uTtwUUUJ0wAb1DJCponbZeQdnWFsj1QwG9lHzBUjLvMaRRpkE4qMiZXJ6cuhkCfmxC5p09Beh4JOhbwl6DH/DpoFWNpZ3hpPn0lV9W7Mzqi5WyxCi/Ouuh12bbKGJjmd6+3Z/a1x/OilhtXDY+zVYqVWbS21yg2l318+vU6TmLEA3ANY9leUtwyWjhqw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <91bb3d4e-46e6-c210-2610-c4771996adfb@suse.com>
Date: Wed, 23 Aug 2023 15:47:05 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Content-Language: en-US
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Anthony Perard <anthony.perard@citrix.com>, Wei Liu <wl@xen.org>,
 Juergen Gross <jgross@suse.com>, Jason Andryuk <jandryuk@gmail.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH] libxc: remove / adjust xc_get_cpufreq_para()'s
 BUILD_BUG_ON()s
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0079.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1e::19) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|AS8PR04MB8357:EE_
X-MS-Office365-Filtering-Correlation-Id: 058a2fc3-1ea0-4548-0a35-08dba3df7125
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	DoVq2gD7VZvnCXdfF/fWkIW1yFd7wMBUd2U4uKyvCTI+hyjSAoieEn2xl2RCEDJ80z15N18AYvMPTu8CauePebwv5tGNPWqXOHsV36MXINfmXqNuG81WfNpp8CjZEZI5+PDXTAjhXEyPbl6SKqsHCpKNlviBh9F277/eeWQ70z3S8JDpbr5n/Ce6PTjTXR96Oti0Yx6Rdz3/XDvkKmU6gMPIlyelUDufzNI8so2EqHEU5pqbvlPWveu9v74m8Lm+R9DVUjccoNmhQTG1nAlFJ1+tr/87N5hRCwWfl8cRVDR1noHZ97IybM0CDzUxu911db8yPAxQqpPOX/CcuAZPann/R/O+7ZZZ8D8t3EM64zb2O+vR4dg8tZ9nRZisSHxQ+h/mlOdPFHTV8ngmd5JGhhUCIIrF0ihMVUyfzL8VwvlUIQwGzdXjipwFhGKECDyChsAPusUH5KfA8f/Ab4b336BhT3q2wNgWyZ15cz9Z98KPVHYSu4KO1n4tjEMKlL6vJ1Q0iK/Fsv14O8aYkA2YWyg364q7YoiQdsvZ5oNi29/Mclo+/m/QOni2Mj9GGKOX502kyEOUo1QYY+jIx2PocZA8lAcqaw0MfoY2iXzcHiyvufxMLnLfAJHKqlhBeqJNHKyEYxjelc6igwyri5VzLA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(136003)(376002)(346002)(366004)(39860400002)(1800799009)(186009)(451199024)(54906003)(6916009)(66476007)(66946007)(6512007)(66556008)(316002)(8676002)(8936002)(2616005)(4326008)(36756003)(41300700001)(478600001)(38100700002)(6506007)(6486002)(83380400001)(2906002)(31686004)(31696002)(86362001)(5660300002)(26005)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WXQ1RnFvWHJ4QnhpWU9yeEE1a3NoN2U0U1g2ZlV4ZklUaVhhaE02eTUvZ3Yz?=
 =?utf-8?B?QXFJYk9MSk52dGNLengxT2d5S0RNc3BRYmt0VDdKU3hKRzB3czUvalhuZ241?=
 =?utf-8?B?ZnR0d1FReENZaityNTlEMUVYR2xTWlkvSlpONnBEK3ErU3lBekJsRjk4MnZr?=
 =?utf-8?B?OTFsaFlQenFOS2pTME1DeERSaTVneVBubFVsTkV6UkZ3dXRVL2doN09kSEMw?=
 =?utf-8?B?Wk4zeGkzdXoyRURySnhadmxjQjNBeVgyWjBDZ25YTWlJeVZNT3RGQm5UWnlu?=
 =?utf-8?B?blBVRmxXMUdTQVFaR2xERGZsTjVYSHhuL0tkZmkwYjVBR3U3Zm9iendXa1V4?=
 =?utf-8?B?WTZpK2c0NXpjaWsxSjY5L0Y1ZFJVZkloTWhWaFJPU21kRVR1a0tjZkp3clg5?=
 =?utf-8?B?L0dqK21kOW5QN0lUUVVOaklkNzFZTGZBV3Y5SlJOTDlyY25zVW5iSkZWcUJZ?=
 =?utf-8?B?SWM5NEtuSDZzUDZlcHU2dWRISWhqcUtzdnpkK0RxZUZRTTFJKzJnZnQvN2Q4?=
 =?utf-8?B?N3BWUkErOWxLMmNiV1ZZVDhaM0I1OVZ0Q3RTMnVxbHplK1VHSy9YRG9jQ2VB?=
 =?utf-8?B?VktNaTFZamhlSE5od3FoRlgrV2NsOEU4UjVDOVg2VFdjd05xcmh6eGh5ZVBI?=
 =?utf-8?B?STU3NVFCR0tFVU1raTRRbzNGVG1HSGNYOGdDYWJqcmhIV2kyS29kTGo5ZGdO?=
 =?utf-8?B?OENkSmtYbHllMHRKdXR1QlpxTnlVaFNYU1RIaFU2N3BSc3N2OHA1R25XL2Vv?=
 =?utf-8?B?VTljcEJHWFRZeUY5NTA4MG1XOFlSQThSOUZMVm8xa3huNjcyazdYdG5ITDRZ?=
 =?utf-8?B?b3lNUWJnSWNLcVRja1B5LzlHM3VnL1hFVkVPcXhFK1dBK0IyVDlDSlYyanFx?=
 =?utf-8?B?UnpGbzVJMTN6Rk9WdEU2WmpyYjR3ZkRoMm5rQUI4N0VuYlZmV1lDeks0dUQ1?=
 =?utf-8?B?VmZwK3VIOVQyT3lVUWZZTnFQcnJoei9sVjVSd2ZMMlU0YlkrM09mVnZ3THJ2?=
 =?utf-8?B?YlAra1RDaXZra0ZQYnVNYXNTQmI2NzhQTnlhVjc4SGNpd1RCOUlHOXpGemJa?=
 =?utf-8?B?cDc3V2FDV1BycFJrVXVCeldiTENFT1NQY3lYWG5CY0pjb0xPYXpYcXRlRjBm?=
 =?utf-8?B?SHI1anNtTkVzN3BCSnVabnZRMXBqampTNldFTkY3SFlwRGxkN2Z6KzJYQWJk?=
 =?utf-8?B?YlRFT3RGSUtKRkVYQmxrTEtRQVl4czZWYlBtWHlSYjZycWE3ODhxbXlNZ0lB?=
 =?utf-8?B?UDBETFJCNWIxWUdrUEF5NWZydU1DZW9PTmRuaU1VUG9uVFEzazVqTCtkVHRs?=
 =?utf-8?B?NFBQemRpNVVTY3QzckltaGZpS3lybTltbUZVYmhjR25ENEh1aURvTnNOQkFM?=
 =?utf-8?B?aXMxZDJMN2xEWUpvU1l5ZzNONXJGeHpBWnNSYnM5UTZaMk10QW1tTEF5UlRs?=
 =?utf-8?B?NURSaTNPbWdKRWJDVVYrc1pFRHZUZDhycWRMUFJKcUNvL21Sa3psRXBPc25V?=
 =?utf-8?B?R29TTUZ6U1g4VUxESWNZbGI2MGN4Rm1Fd1I5anJkdC92VGsvaEtpaWpQY3dG?=
 =?utf-8?B?RkJ0b1VMSW15YXM1Nkl1VzNGRnkwMlZrRCsraVFRVzVHRFh3MGtkWjN0U2Fl?=
 =?utf-8?B?VGtwZ3ZDbEJWTUlSV2JYbWlBUzlpYkJuNnZHaWdzTllRcG41eVZEa1dhRDhM?=
 =?utf-8?B?WDhoeUgwQXRVY0lNemxQUDZYbWZBbkdGL0gyVWUwZlpReHdaT1VPMXRTN2Ju?=
 =?utf-8?B?NlU2NXAxNzBFbTc3d1dEQmZmR3RtVjZ5TGk5SFFmRlMwR3hkYnU2UWpnSjMz?=
 =?utf-8?B?KzdBSGF1QzVjRFFLVU42MG80T3dkUWcxR1dzVmF3T1lSMDI4cTBxSVdHczBz?=
 =?utf-8?B?Ylk0cWFzV2N1TzEvTnpidHNFN28xOHJRaytMTHFlQkVXejlOUDdUMUl3S21Q?=
 =?utf-8?B?ZTM0d2ZMc1Y3WUhOaC93djBmZEpydTJpVG1GYUJWc29mL0tSQUdaeDJFSmRa?=
 =?utf-8?B?ckRsVTc4MURPb3V4OFc1MEo3YkczbE90bWdySW9BY2VuOUYrZG1pN3lZY3RW?=
 =?utf-8?B?LzRJT3F3d3FuZTlXU1pxcjNBNk1YQ2tBQTdidERmVWs0YldWdXhkcmRRY3Y4?=
 =?utf-8?Q?p/vV+UxjPfwzVYNezxUmfNTXD?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 058a2fc3-1ea0-4548-0a35-08dba3df7125
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Aug 2023 13:47:07.5914
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jsvuyTUQ5LG8ZAMIiwDamyMofcpRkZoJBz6fUE9oF1E2I1i9/XdYrwVjUYf95B9bBSpxtpZ3eL3SXzVGgZBeYg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8357

The full structures cannot match in layout, as soon as a 32-bit tool
stack build comes into play. But it also doesn't need to; the part of
the layouts that needs to match is merely the union that we memcpy()
from the sysctl structure to the xc one. Keep (in adjusted form) only
the relevant ones.

Since the whole block needs touching anyway, move it closer to the
respective memcpy() and use a wrapper macro to limit verbosity.

Fixes: 2381dfab083f ("xen/sysctl: Nest cpufreq scaling options")
Reported-by: Andrew Cooper <andrew.cooper3@citrix.com>
Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/tools/libs/ctrl/xc_pm.c
+++ b/tools/libs/ctrl/xc_pm.c
@@ -248,45 +248,6 @@ int xc_get_cpufreq_para(xc_interface *xc
     sys_para->freq_num = user_para->freq_num;
     sys_para->gov_num  = user_para->gov_num;
 
-    /* Sanity check struct layout */
-    BUILD_BUG_ON(sizeof(*user_para) != sizeof(*sys_para));
-    BUILD_BUG_ON(offsetof(typeof(*user_para), cpu_num) !=
-                 offsetof(typeof(*sys_para),  cpu_num));
-    BUILD_BUG_ON(offsetof(typeof(*user_para), freq_num) !=
-                 offsetof(typeof(*sys_para),  freq_num));
-    BUILD_BUG_ON(offsetof(typeof(*user_para), gov_num) !=
-                 offsetof(typeof(*sys_para),  gov_num));
-    BUILD_BUG_ON(offsetof(typeof(*user_para), affected_cpus) !=
-                 offsetof(typeof(*sys_para),  affected_cpus));
-    BUILD_BUG_ON(offsetof(typeof(*user_para), scaling_available_frequencies) !=
-                 offsetof(typeof(*sys_para),  scaling_available_frequencies));
-    BUILD_BUG_ON(offsetof(typeof(*user_para), scaling_available_governors) !=
-                 offsetof(typeof(*sys_para),  scaling_available_governors));
-    BUILD_BUG_ON(offsetof(typeof(*user_para), scaling_driver) !=
-                 offsetof(typeof(*sys_para),  scaling_driver));
-    BUILD_BUG_ON(offsetof(typeof(*user_para), cpuinfo_cur_freq) !=
-                 offsetof(typeof(*sys_para),  cpuinfo_cur_freq));
-    BUILD_BUG_ON(offsetof(typeof(*user_para), cpuinfo_max_freq) !=
-                 offsetof(typeof(*sys_para),  cpuinfo_max_freq));
-    BUILD_BUG_ON(offsetof(typeof(*user_para), cpuinfo_min_freq) !=
-                 offsetof(typeof(*sys_para),  cpuinfo_min_freq));
-    BUILD_BUG_ON(offsetof(typeof(*user_para), u.s.scaling_cur_freq) !=
-                 offsetof(typeof(*sys_para),  u.s.scaling_cur_freq));
-    BUILD_BUG_ON(offsetof(typeof(*user_para), u.s.scaling_governor) !=
-                 offsetof(typeof(*sys_para),  u.s.scaling_governor));
-    BUILD_BUG_ON(offsetof(typeof(*user_para), u.s.scaling_max_freq) !=
-                 offsetof(typeof(*sys_para),  u.s.scaling_max_freq));
-    BUILD_BUG_ON(offsetof(typeof(*user_para), u.s.scaling_min_freq) !=
-                 offsetof(typeof(*sys_para),  u.s.scaling_min_freq));
-    BUILD_BUG_ON(offsetof(typeof(*user_para), u.s.u.userspace) !=
-                 offsetof(typeof(*sys_para),  u.s.u.userspace));
-    BUILD_BUG_ON(offsetof(typeof(*user_para), u.s.u.ondemand) !=
-                 offsetof(typeof(*sys_para),  u.s.u.ondemand));
-    BUILD_BUG_ON(offsetof(typeof(*user_para), u.cppc_para) !=
-                 offsetof(typeof(*sys_para),  u.cppc_para));
-    BUILD_BUG_ON(offsetof(typeof(*user_para), turbo_enabled) !=
-                 offsetof(typeof(*sys_para),  turbo_enabled));
-
     ret = xc_sysctl(xch, &sysctl);
     if ( ret )
     {
@@ -316,6 +277,22 @@ int xc_get_cpufreq_para(xc_interface *xc
         BUILD_BUG_ON(sizeof(((struct xc_get_cpufreq_para *)0)->u) !=
 		     sizeof(((struct xen_get_cpufreq_para *)0)->u));
 
+        /* Sanity check layout of the union subject to memcpy() below. */
+        BUILD_BUG_ON(sizeof(user_para->u) != sizeof(sys_para->u));
+#define CHK_FIELD(fld) \
+        BUILD_BUG_ON(offsetof(typeof(user_para->u), fld) != \
+                     offsetof(typeof(sys_para->u),  fld))
+
+        CHK_FIELD(s.scaling_cur_freq);
+        CHK_FIELD(s.scaling_governor);
+        CHK_FIELD(s.scaling_max_freq);
+        CHK_FIELD(s.scaling_min_freq);
+        CHK_FIELD(s.u.userspace);
+        CHK_FIELD(s.u.ondemand);
+        CHK_FIELD(cppc_para);
+
+#undef CHK_FIELD
+
         memcpy(&user_para->u, &sys_para->u, sizeof(sys_para->u));
     }
 

