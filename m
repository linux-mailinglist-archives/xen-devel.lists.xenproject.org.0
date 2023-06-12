Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A28DE72C35F
	for <lists+xen-devel@lfdr.de>; Mon, 12 Jun 2023 13:47:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.547071.854274 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q8g11-0000vA-DY; Mon, 12 Jun 2023 11:47:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 547071.854274; Mon, 12 Jun 2023 11:47:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q8g11-0000sx-9g; Mon, 12 Jun 2023 11:47:19 +0000
Received: by outflank-mailman (input) for mailman id 547071;
 Mon, 12 Jun 2023 11:47:17 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Cme/=CA=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1q8g0z-0008F8-Qn
 for xen-devel@lists.xenproject.org; Mon, 12 Jun 2023 11:47:17 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04on061f.outbound.protection.outlook.com
 [2a01:111:f400:fe0e::61f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e13492d9-0916-11ee-b232-6b7b168915f2;
 Mon, 12 Jun 2023 13:47:17 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by PAXPR04MB9424.eurprd04.prod.outlook.com (2603:10a6:102:2b2::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.33; Mon, 12 Jun
 2023 11:47:15 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c%5]) with mapi id 15.20.6455.039; Mon, 12 Jun 2023
 11:47:15 +0000
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
X-Inumbo-ID: e13492d9-0916-11ee-b232-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jroH4RQ06pKYUqUL/tSj0ZPW84WaSBvwaZOwhLDIX+igvk91SuhBMRIreM9Ul5yZ5xLMfXxlOqHL4xlMR4x7QX0xq+KXKj/vjpovO+Izvvkxm7mcMvUm7vX5a6dewThZQPUYSdTxDJMvmwzzldrYVXUcGDyz1d2wvmrhaqyoSocr0nr4Q6xMoc8At4vWfnP65KJnroDAasMANJP/KbIB1RSoS6OjotDMO/oKN3gGmSXgnXQXEcIqdf7f5nKeat6aJ1lty6T/FPXq6CaQuCXHfGsi+Pmk2VR/Ax49NbX3z7HF9ufbmDEaXn9wWk+kSVcxd4XFAf0PkwoKkmAZ79Dkgg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=B+/y/m3EuaFu5IzJQsr10ANAsj4GrJLsTnjbxyCCt7g=;
 b=KhQDCSOp4CWzl7HCJ1xAJ7Faru+4+vUploMMs7So2jQfup+2Ws+FkPHs0UmwWOUURZ7YVDZHb9WM9HU45o3v1D+qmT0WrPjP7T5uxkSxlA0SwX+K2t/uJzTpA9tPDqTobxF0yyiMQJF3Z98MvzsjAsjqs+mi3AHtWtizCRei77s21folNqu7EeMo265BqSuneZICW+NNZbgG255LRnyRDJ+evEC83WP5nUhu79OngS3mRxgCVSAymnYyTB5XJJZhunhvJC/mEJhtK1MKmYCNUMI/TyQT4tK1I42s1IYCwP0gDoTYE8u+249voX0ssif6P3nNWcL8ifJhfPQBqiDnhw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=B+/y/m3EuaFu5IzJQsr10ANAsj4GrJLsTnjbxyCCt7g=;
 b=yN21UeDhi+eBaZqW5aDN7U/QlSnQL1POm/nzZbnoSsT+tXiqrOySiYyZDbsLgN8HEJpxla7p7mfARXVINRZKNljiuiZOnKj1Q3I7l2kYZognoMRSv0AVLIWUPWNN/ssXtYCxSp+EtBjxPUPvBzXbPxkDoQUs3MtmjeR0NfhJfCmKWVTfJhjFceulxrp2AZ3zFdWb6X4cqU9SmbCCLWmxtC2Q0CZVl1oJIIR+LFdmSt5dlPIxGlfoTBNxiZjZy5YataXV9i0P5zOEAeGQlTvBSbS5j7xnCd/R1OPSbK8hoc5R7tNzdXSj+eVx46ZPdcUqvEackny71gsx/giWKjWn6w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <89c45e29-fa7e-93e9-a2d5-45991c302794@suse.com>
Date: Mon, 12 Jun 2023 13:47:13 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: [PATCH 4/5] libxg: drop dead assignment to "rc" from
 xc_cpuid_apply_policy()
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Anthony Perard <anthony.perard@citrix.com>, Wei Liu <wl@xen.org>,
 Juergen Gross <jgross@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <2dc50b58-a4e4-3e32-1876-94412b14b052@suse.com>
In-Reply-To: <2dc50b58-a4e4-3e32-1876-94412b14b052@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0083.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1e::18) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|PAXPR04MB9424:EE_
X-MS-Office365-Filtering-Correlation-Id: e37195fe-b498-47f9-bd37-08db6b3ac45f
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	DxZssvo65/JcAV/t6goMFqjIykoss3/7Kx4/GehuaRJZZ/BqcX6ivwPuXHvftBHLNTH0AuA2KcqATj0F1S6U+QQX8k32pJglA14dNA7AZsx1pgo+vkLvlFU/ht7rziJ/g9Ag06UmC+bNxvlUEah+jaOXg7SGA/bLl+D6H1XAhLquKzVpqJVpo+3rBsIqOuCxnIIO4VWBF4spHQxJGU7IoJ7l9fMYe7Q2uzD71A3uLWIHSgksAtH6xCST+gZLSWPWrv8l1lsylsPNgaEuC8etQtUGtRtgZJud74zb7YNWsoTLMPS5ORqbxgMuJ3yPoAozsZRUYGe0xh5Vvu3Te+0oSh8u3MJDP17wlSPLW9RrhxHG6FljTD53Ey+3kxriqrMgq1GLAYVKgXgRc1oXE+KcarJzxqdm3UUZ7NV5fJCn6Z9WeTx9H2EjDY5iF4Z15asH57pV3T39c0m0PbdMERc956tWcXXVAVluE1HQwOYX/DRjWSIqMFm/0SQdO4yPP89nLtVOTZzNj7aOtlKaTHK+n2r3VY7TvN9AXOeqamvPzjMyhOImRFi/ApUTLvHp9Plo1JmnlAZmTtxnJno5Sf3rqhHL+jkskrCs3sR2pAX0zi4LrXHk8tbh/0seTufIJgqk0G1KFHBZ8ZjfSlnSxgszwQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(366004)(376002)(346002)(136003)(396003)(39860400002)(451199021)(478600001)(8936002)(8676002)(54906003)(6506007)(5660300002)(41300700001)(316002)(6486002)(66556008)(6916009)(26005)(186003)(31686004)(4326008)(6512007)(66476007)(66946007)(2616005)(83380400001)(2906002)(38100700002)(86362001)(36756003)(31696002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Z09rMnpQQXFWU2hQR2Q4UUVOaU5rZkpiSXBwQzNHV2hzbnpmYzNVdVdaRDZj?=
 =?utf-8?B?M1duVHdwcGhFemFWcy9aek9aWnlHR01XeWs2RDkyYkcwVnUxd1NnMnZHdjFP?=
 =?utf-8?B?ajNiZkpXdHBhWTBvbmJ5MWdZaGVyMFZqaU4xSGFTZ3VIOEhJOHlDZTBQOHJF?=
 =?utf-8?B?dWNObzVrOGhzUHdRSGp4VUVrNHFrRnM4Y2RmbDJ6NVBWcTE4N2lFaGljclFR?=
 =?utf-8?B?Q0NSbU1VVlpCUlVValYxOGxQU2xQRHFVRnVheG45bjBuS1NoOVZ5VVdkQnBX?=
 =?utf-8?B?ME5zbkt2eGhIZ3ZQYWZsWFVqS09aNEM5VzVCeEEyV2VqZ0JlMURBQ2FvNW9w?=
 =?utf-8?B?c0NTQ0IyMmk3OVQ2Wmd0Zk9qaUdhenhtUEJ2c09ia09kTFVqUzNZZWM5YXlu?=
 =?utf-8?B?MWZCRTBQbFBCSmxJUU9jSFAzTzU4NGpMTzBrdG5TQ3VBTFlXUTBEZVlFbS9w?=
 =?utf-8?B?VWpGbGlmRWlvWStlc3BLTXEwemZEVmFQR0ZTekMrcHI2K3VQUFRXblJweEVR?=
 =?utf-8?B?SmpZQ00zcjIxMXc4ZEFwN2Y5SHhDRUg3WWhraEl5Qk5yNTNEdnJrSXc4RktI?=
 =?utf-8?B?dWpaMGR0VFlyMk1ZOEREWlpnNzk0UXY1eUcyOGZsZlRYdHpQUFJmcUhGM01M?=
 =?utf-8?B?UW5DUytObHpIbThEdDJoTHJYWit2Q0dHUFRDQ3U2MGt0dmVyM3hGZ3V3RXdn?=
 =?utf-8?B?NFI0QmZmc3BpUkVKaFlvTUl6L09wSmllSk5vQ0o5WmpDSlFSOGxNeTJORWQ5?=
 =?utf-8?B?Mjd4Vi96NlNWWEVZbGVtKzBudVRSTWFzVmZEQm9OY2xNK08rM2kzVTZVY2Va?=
 =?utf-8?B?UzlRSjJhK2dxcXlrMEJsbzFvR2lQQjNnZ1d0WjdhUGkwbmZGN3pGTkNOb3or?=
 =?utf-8?B?QWRyNUQ5REc1TGJWSUFidktkV1JxSzJpVGNWUDVmdFE5aEJ2bVE1bUdoOERi?=
 =?utf-8?B?dDVFZnBTemdnbnZldW13OVdsM2dCN01zbHFvYytIek03aGVpYjR0VVVlR2wv?=
 =?utf-8?B?OXd6L3BXOTJZR2RPSGFyNU9PcmVpdHphMnpJcmZXNndoZ1NPSWNXQmRHTjYx?=
 =?utf-8?B?a294VkN5ZU5vV29qb1BDdjRZN3RQMC9iaFdJQ1F4Z0Fuem5uZ3RIWU9iZEtw?=
 =?utf-8?B?TGhOSkhwWEliMEdic1AraW1vVEZPMmlMclgrZlVhdldkdEM4MVZlOStaSVZw?=
 =?utf-8?B?QTE3eW5VSlRSSmd3NVNUU0tYcXdIQVg1RHlaVTcrSDBXTkN1M0trMlR5T1l0?=
 =?utf-8?B?SDVYajFrdXVPZFhpL2RzNXlOT1lxbmU2TXc3MXh5T0dUdmsrYndwOStNS05l?=
 =?utf-8?B?ZjVrYWN2N2wrbXVNczFkbWtTUnVQVGdPc2s0dWc2c2MrWFdKTlIxbHpIU1RF?=
 =?utf-8?B?Wk1MYnB3T2lnM0lnbXRDUlZPdjQ0bjcyTXFMaGovQkdpeWdiNFh3TDc4cHJ0?=
 =?utf-8?B?WWNHQjM3dExHZU4zK25abW4zcEhnckp4SGtYaGxmY1JpTjlCQVMvdlRhYTBE?=
 =?utf-8?B?TkxnNnFtTHJJeHlQd0tGUVAvVzZwek4wSUFIZlhveDM5clFLSlZXeDhrSDRh?=
 =?utf-8?B?YWtPVmlRdXgweE1JTnVCcTNHUEUzTzgwQlh6WkRwVUczTkREYWx0OTUyTDZM?=
 =?utf-8?B?Ujc2VGRMeDJIZlVkVFZXMUZiWG5GVUNwR0ZwbHlhS0M2NmNQUUlrd29QK214?=
 =?utf-8?B?UUZXdXZNM3NJSTUxQzJoWkU3dW9wUDh5MUNWS0IwVWZ5c1NybkhEZkFIQitJ?=
 =?utf-8?B?ZXpiK0x1RXhKbEQ1M1F4NjI2M21IQ25rZjBMcGkwRHlUS0t6OGlxeUhQL1Uw?=
 =?utf-8?B?bW1oMkhMSEk2djRGNlNkRU5lSk1WN3lFUEpiSlJZYlc4Nlh5OWhRaWN2cjht?=
 =?utf-8?B?R01mSzVwdlpJVk4zbmh4QXd5Q3dId2x4cVNKUDdhMzVwc1F2SkRkUjc4RHJU?=
 =?utf-8?B?QUwyL3lDNEdMaTdHa0k5eC8xMjFMc2lIVHdrOXFnZlhUZklzUlBpdmF6SXp5?=
 =?utf-8?B?VzRQdWd5dEI3aHprYzRoQkw1ZVJLSUdlVVRxbVdIL0J5djY0UmFKZzRCeDBp?=
 =?utf-8?B?Q2RabDkwbXltbUdTTm5jMC93ek1CYkhEUmpCTnpOQVVCSVBOTkVBYk5qTXV4?=
 =?utf-8?Q?7gOCCbOKwVT6Jf1plObHl/Dke?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e37195fe-b498-47f9-bd37-08db6b3ac45f
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jun 2023 11:47:15.1388
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: czparCyPdKRU4+qIQv2WeyjQCfRFeWQltMCb5SODLCg6++m+JPbnHPyiy7Qd53Al44frp8hKRJ5mhDCLUucV3w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB9424

"rc" is written immediately below the outer if(). Fold the remaining two
if()s.

Coverity ID: 1532320
Fixes: 685e922d6f30 ("tools/libxc: Rework xc_cpuid_apply_policy() to use {get,set}_cpu_policy()")
Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
The code in question was subsequently moved by 54463aa79dac ("x86/hvm:
Disable MPX by default").

--- a/tools/libs/guest/xg_cpuid_x86.c
+++ b/tools/libs/guest/xg_cpuid_x86.c
@@ -462,17 +462,12 @@ int xc_cpuid_apply_policy(xc_interface *
     /* Get the host policy. */
     rc = xc_get_cpu_featureset(xch, XEN_SYSCTL_cpu_featureset_host,
                                &len, host_featureset);
-    if ( rc )
+    /* Tolerate "buffer too small", as we've got the bits we need. */
+    if ( rc && errno != ENOBUFS )
     {
-        /* Tolerate "buffer too small", as we've got the bits we need. */
-        if ( errno == ENOBUFS )
-            rc = 0;
-        else
-        {
-            PERROR("Failed to obtain host featureset");
-            rc = -errno;
-            goto out;
-        }
+        PERROR("Failed to obtain host featureset");
+        rc = -errno;
+        goto out;
     }
 
     /* Get the domain's default policy. */


