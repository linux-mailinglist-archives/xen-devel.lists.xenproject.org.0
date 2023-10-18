Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 69FE47CE08C
	for <lists+xen-devel@lfdr.de>; Wed, 18 Oct 2023 16:58:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.618664.962605 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qt80G-0004wv-JB; Wed, 18 Oct 2023 14:58:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 618664.962605; Wed, 18 Oct 2023 14:58:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qt80G-0004uC-GN; Wed, 18 Oct 2023 14:58:32 +0000
Received: by outflank-mailman (input) for mailman id 618664;
 Wed, 18 Oct 2023 14:58:31 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=EezS=GA=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qt80F-0004u4-36
 for xen-devel@lists.xenproject.org; Wed, 18 Oct 2023 14:58:31 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on20610.outbound.protection.outlook.com
 [2a01:111:f400:7e1a::610])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id cc863a86-6dc6-11ee-98d4-6d05b1d4d9a1;
 Wed, 18 Oct 2023 16:58:30 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by PAXPR04MB9218.eurprd04.prod.outlook.com (2603:10a6:102:221::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6886.36; Wed, 18 Oct
 2023 14:58:28 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::d9c0:d907:4d2d:15b3]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::d9c0:d907:4d2d:15b3%7]) with mapi id 15.20.6907.022; Wed, 18 Oct 2023
 14:58:28 +0000
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
X-Inumbo-ID: cc863a86-6dc6-11ee-98d4-6d05b1d4d9a1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AdoUY/SnoMF98PVpgrX7XDY3gFOEg+1Ig8W+Qn97g8XGfgFpg1dvbdtzSBQuJH/ftycM9NuwCiK/VX7GktGTXYMswrLVrGkuCeeGlgNIPqzFa6PnnM2QAHEZ374TLv8M2rCxykNqgBhTwzL18yDnVVem/0Znjhyp9ztZQYMCDPQsfPfG2m7ZDlscOgFi3dKdtJsB58KSPlqxm8atJbuSU3v6mSO0V9lnAj883hVqrMp91yBKULCCs9L6Aqwb41rMS4ryfReCwyqWy4FQNrAB2B6U0yc5In1iGTKkXqP6p8wsxDkT6xf1eVGzdqblq4dJOOH3QEjPvtJGQLy5xS9d8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JtdLStHJ6wPskxUHsn22Jm6tejXGHXKWQEDe753mGTI=;
 b=Coa08xWIQjOwomobi8OdZtU52gWpjExT0azZlCX/jKrbK4cGY5nmt7ZcsW7uqOL0PreUVRhissLkK3sKJDtKhhwfmvoINH5vQgqPUZ4oCofwbMyFQNwGnlZGfOyup6B69MMAoILLT0Q0n4DpGfQHsEyg6Bwfsm/HbZvg/CXIUW0P1+0ll2RdTesaUZ9AnoIGNhSjoZiKsJWkIkPn8Zqu4XpvMCsFha+sTCgzr22rl/F0MmSbRdWNzzCZcDfL88tzjJqLJCqrFQMZGvw3k2pKoAi8hA7jfVvcZ/PUiR/6dGwci8EFm8PBSNCoBJxAptnCWjoSCWulfhss2QHPGzzd5Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JtdLStHJ6wPskxUHsn22Jm6tejXGHXKWQEDe753mGTI=;
 b=STp7LLMB0QlOLgd18yQC2tUh5jlgK7RQOwwwQm3YJFvdObHkMM7oGVfJaBkSLCM8smPesEJ3C8S5THWUfVqSM6iFfminWHzXzlf/iXSgd44EjuI5YhW7MXoFZ4XOVg3Dc5CBAQ/6yYNUNLc+9W4AbO61rA13umPPWlily+/JFSuETv2/xyuR3kw4P+onj7606zrllxkHf9rto8nXIXpKQcXfYLwPdsLLWsqgMMokp6I4pP2gAb4eV7YyiiUQVYXSH5STx3Zi3oZZ5n9SIvlX1vnmsFUpGmw2GkrxlZWwBZnDN/Wh0EshT/qrh7Whu/rGqlUFPPAPTjoj+XopOfpuOw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <ed275abf-351f-5237-7e19-a3856f6d4272@suse.com>
Date: Wed, 18 Oct 2023 16:58:25 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Content-Language: en-US
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Henry Wang <Henry.Wang@arm.com>, Michal Orzel <michal.orzel@amd.com>,
 Manuel Bouyer <bouyer@antioche.eu.org>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH] console: make input work again for pv-shim
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0198.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:e5::13) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|PAXPR04MB9218:EE_
X-MS-Office365-Filtering-Correlation-Id: 5987cc22-a158-4056-a621-08dbcfeaafb3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	4S8cIsmSTs/wZhooeJWNgmqyL4bj9y4PC1cx781PTB2SZdiojEjssImRzB7TR8OQFJPaHUUqMXh/Jr1DkdeLadoDi2Mmt6Y3IMkjucANKXRy4CtZm0QmwaieOjDQzd94OUt53tvO0stKiHLGpsnKfXQhcoIbo9CwP2Ud9K1ye69uaBJCxULoQaxzGtb7Tt1b9Q5CVPcAoBeM5JWeqXt4eOQBbcK5Cb1hWm67ji2UZJByipPHfB540uKLYCpOpVXZzeogtw+aakzY4EE+zafxZr2DdXuXfSote1LmNEKfgwMxk9ZsaC8x2gIRnN9CA9LmVkVxbCK4fBUj2ydw3hYl5BrXYOu6Hhm2l4lKt4J5fIkhKUCjCWc+dSbeuACZm95T0OnGYQ/HmK06TmrvYuUjlBPvzp1PpRuwWAahEkbhyK1tQMfUZjnyp7bziqpV0OQrqtBJTYMBdSO/QCA8F0LHRuGNEF9rCKi8vOnBdeX8BpvY479sHYW/lW2tjaT0DkQCvr3r26fxdDvzhSzOC7Dh51+UQtKjqLyEQ6m5TseNReN1VZ5SjUZTVTQkQgq4EtL8vE+ddHOO0svtgRi+GQ8yKBSf3/luwHvHRxIcPGsAnM1eh8dRKQ69IvCc32rX1c4C1pczRJ5MzzrjihuyPeLJKQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(396003)(376002)(346002)(366004)(136003)(230922051799003)(451199024)(1800799009)(186009)(64100799003)(26005)(41300700001)(36756003)(83380400001)(2616005)(6512007)(86362001)(38100700002)(31686004)(2906002)(6506007)(31696002)(6666004)(6916009)(5660300002)(66476007)(316002)(66946007)(54906003)(66556008)(8936002)(6486002)(478600001)(8676002)(4326008)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Q1JudUFIc3lxbnFQSmtJSm9UYm8rVWk4d2tPOS9VWTVvaFZKMXliRXNOekJM?=
 =?utf-8?B?bmhkNG9wWWxBbmswL1ZRQzJqeVpGZ0JXdmlEdzd4ZEN6L1djUUllZFJwL0JP?=
 =?utf-8?B?dngxTWZKWDRndTlrblRKQldYMUNzelY4Z2RuVUVways2NUdXcjhvcmpqTDA1?=
 =?utf-8?B?MWNZL3JBSDIxQThIZEJUL3Q2RXV1REkvZ0NrK0Rja1FVRG55WGd0cUxUOFpW?=
 =?utf-8?B?WnVHVDE5NFlmNnVVaXluMTk3NFpFQ0hPU2V1WUlZaXFTd0N4ejhjS0JLSEdT?=
 =?utf-8?B?TWdFOFFHYkNUTm5YVFVSSDUydG16Tk5vVkZxNkM4bVRtUk1OYXFybTBNR2Ji?=
 =?utf-8?B?OXgyNHZaVVVzN3lpTmpibWMwLzVRcFBCODVOUS80Mm4vRVFGSUlzdDNMRU5k?=
 =?utf-8?B?VGRtay8wTHQyWXhjRW9ITmxLMGx4cmE5S3dqTit5ekFzRnN6aU5POWxDd0RO?=
 =?utf-8?B?UU5oZXIyTStlMURvaUhIbXVjeTlEUXNnTktpR1NZVDNRR2hDUUIvM2ZwQjBQ?=
 =?utf-8?B?UGtDM0hpa3BHTVZMNUhuODEvUTAza3RZakwxd3BDbFg5L3FMSGhaYWN2M3VQ?=
 =?utf-8?B?ZlBpSzJmNXNxOGNIeStmTWRyeDVXUlgxcGZGZCtGWSsvTTRJSmU4SEFFQ0Er?=
 =?utf-8?B?UU0xOUtyRzhLL290QVVjZmF2T292c3lITFVBa0dGbzZZc29DNitVV0s0WTdy?=
 =?utf-8?B?b2huQktNaVd3RE1PaWNONGd4cnpFWHFoT0F1YzZXcnpBWU5vOTdGbG1WV2tt?=
 =?utf-8?B?ZmE3ZHR2U0FIMHRCSDZJc3NCY0w5aVJOS2p1V3I3RGovNGphakMwcithaUdE?=
 =?utf-8?B?dnpnTHlHQ215NEtKemVzL0xCMGwzc1UzNzFBUWFNOTU1Sm5UenJYdjZTUEV5?=
 =?utf-8?B?QkNJUnVsektvOW5sYzU4dkNBN2VRQlFDOTB2eDBVNnA3MlcrQ0Uvbkhrb2V1?=
 =?utf-8?B?RDY0RmFzUEtOdGlRbXlQTDY1b1hWQTl5aWpZZHBiZ1ViT3RhWG44dTAvSHZD?=
 =?utf-8?B?UG9ISHhRZzVSYXNMMkpSR2NrWEJNUVVHUTMrenZGVGJSdnJWSitranh5T2pC?=
 =?utf-8?B?ZTVwd3d4K1pYSGsyVFBNbXlmNEhLMVluK3dTdXdXSm0vVXZlNDU2YU84Q2lV?=
 =?utf-8?B?cno5L3hGVUNjUlVlOG9MYkxPWFlEc3cxSnp6MGNJRVRCUHlDLzlnTHJwQWhw?=
 =?utf-8?B?Rzc4WER3OXVQTW92NmwrSWNvZ2Q1Qys2a1BPdm0vQy9jektBUUVTaTlIaXdm?=
 =?utf-8?B?QXFVd3lKeFp4Z3VmandBS3VOdm1LdkNJTjYxTVhlNVIydmoxUG1lYkpMd25Q?=
 =?utf-8?B?VHFHQkEySm0rclBjTlJodmNCNG16YTlxME83T2lZLzMvWW5hdDhUVDhlS0Vl?=
 =?utf-8?B?VmNhZmNJZXRHVXM0NklINHdKcVN2Um5kR2ZrUG9ZZDZYU29sdnJiaDJscnNR?=
 =?utf-8?B?eXpadG1BQ3F6Tm1McTJOOSswTUY1UngrYm9qSlkzYzRRUnhZbDA3QzNkQWNt?=
 =?utf-8?B?d1ZKZ0g0aUF1d0xoVU1SckpwTzVidXpmL0Y2Y3RwdGhPb0NiNDBlb2F4Vk5S?=
 =?utf-8?B?UThLaExzc0ppV0MyVUhvc1p1QU9wQ0ZzdkRBOHFjZ0hYU1BwcHExQUJUZk05?=
 =?utf-8?B?Yi90UjFHUi9lNmxldjQvSFZUYllPNHh2UDk5R3FBYWJiQkI4M3M2SHdUTHhn?=
 =?utf-8?B?R0Rkd3F0eEdONGloK3RnZGU0bUVtZVZoTGtLUmc4Q0VleU1USFpnQ3FPV0Zz?=
 =?utf-8?B?VzdTRUxtV2JKOTRlSm9ETmRBNDlsRCtEd2FNY1ZLS2ZSODB5RDh3Lzg4dTl4?=
 =?utf-8?B?Z2VVQTRsK3ROeDJRT3gwRGFKYzU3NDlWQ3ozM3ROOVRrVHlIMzhmWGdQTW1F?=
 =?utf-8?B?dnZ5ODBxOTFtOC9QNEU4cG9JZlJkaDExZWRPQW04TlN5SmpJN3VVQVcvOE13?=
 =?utf-8?B?S1M3OCtaRlJDVERQS1ovV3gwL05JRWxaVzhJcnNvenlVTUVONUZhSk4waHJG?=
 =?utf-8?B?OC9EbHNESmtKMDVOSE1SekswYk0wV3VsQUVmQlVzYUhFUEJ0RjIrL3VwQ1Y1?=
 =?utf-8?B?RG93dXpFWlJLTkRoN08vMGFJeHhEa1l0NkVMVlAwZ21KS05qM2owVTA0R0lw?=
 =?utf-8?Q?PEAr634tsJJd9BIA3xoNh03CM?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5987cc22-a158-4056-a621-08dbcfeaafb3
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Oct 2023 14:58:28.1030
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wuNRB/SqWWjpB9fzgZTDaOkH66EiDu2lAYYJ8ZofMsyxRajsTc2rAtH2KSwOWOpPFzBeO2QdXLit8JUs+LfsOg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB9218

From: Manuel Bouyer <bouyer@antioche.eu.org>

The use of rcu_lock_domain_by_id() right in switch_serial_input() makes
assumptions about domain IDs which don't hold when in shim mode: The
sole (initial) domain there has a non-zero ID. Obtain the real domain ID
in that case (generalized as get_initial_domain_id() returns zero when
not in shim mode).

Note that console_input_domain() isn't altered, for not being used when
in shim mode (or more generally on x86).

Fixes: c2581c58bec9 ("xen/console: skip switching serial input to non existing domains")
Signed-off-by: Manuel Bouyer <bouyer@antioche.eu.org>
Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/drivers/char/console.c
+++ b/xen/drivers/char/console.c
@@ -468,7 +468,7 @@ static void cf_check dump_console_ring_k
 #define switch_code (opt_conswitch[0]-'a'+1)
 /*
  * console_rx=0 => input to xen
- * console_rx=1 => input to dom0
+ * console_rx=1 => input to dom0 (or the sole shim domain)
  * console_rx=N => input to dom(N-1)
  */
 static unsigned int __read_mostly console_rx = 0;
@@ -493,6 +493,7 @@ static void switch_serial_input(void)
      */
     for ( ; ; )
     {
+        domid_t domid;
         struct domain *d;
 
         if ( next_rx++ >= max_console_rx )
@@ -502,12 +503,18 @@ static void switch_serial_input(void)
             break;
         }
 
-        d = rcu_lock_domain_by_id(next_rx - 1);
+#ifdef CONFIG_PV_SHIM
+        if ( next_rx == 1 )
+            domid = get_initial_domain_id();
+        else
+#endif
+            domid = next_rx - 1;
+        d = rcu_lock_domain_by_id(domid);
         if ( d )
         {
             rcu_unlock_domain(d);
             console_rx = next_rx;
-            printk("*** Serial input to DOM%u", next_rx - 1);
+            printk("*** Serial input to DOM%u", domid);
             break;
         }
     }

