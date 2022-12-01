Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6691463F49E
	for <lists+xen-devel@lfdr.de>; Thu,  1 Dec 2022 16:58:30 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.450894.708399 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p0lwT-0005yO-SU; Thu, 01 Dec 2022 15:57:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 450894.708399; Thu, 01 Dec 2022 15:57:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p0lwT-0005wc-Pm; Thu, 01 Dec 2022 15:57:41 +0000
Received: by outflank-mailman (input) for mailman id 450894;
 Thu, 01 Dec 2022 15:57:41 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=lVjU=37=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1p0lwT-0005wW-4z
 for xen-devel@lists.xenproject.org; Thu, 01 Dec 2022 15:57:41 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on20603.outbound.protection.outlook.com
 [2a01:111:f400:7e1a::603])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e1ddbf01-7190-11ed-91b6-6bf2151ebd3b;
 Thu, 01 Dec 2022 16:57:40 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AS8PR04MB9045.eurprd04.prod.outlook.com (2603:10a6:20b:440::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5857.19; Thu, 1 Dec
 2022 15:57:38 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::4da2:ea8b:e71e:b8d8]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::4da2:ea8b:e71e:b8d8%4]) with mapi id 15.20.5857.023; Thu, 1 Dec 2022
 15:57:38 +0000
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
X-Inumbo-ID: e1ddbf01-7190-11ed-91b6-6bf2151ebd3b
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=X/zgdoQDR+6lptKjkLeTlSq36Okl7dL5OamoC0VgV/52oXt5ahEDrCu5HI3r1mQImdKK5jdj2Py457rhdnTis13jQm41nCKRrm8V3Z7rHynFZ0rwN5p6ZqHc6d2W7SGgZXrUXzbL9EMZxrA68hUU1i6RxT/QJFTqm3tyKHHXnS+A/hEtawP9jxify+QZNLO2x04LwVkR9EoFz7NwnFq6IDXUtaIR61rJFoK65l+bdoXXmUvMg7wUYSrRcC+/QoLbB+wrsvCRmdKw8XuCIGuy0t9Cie/Z/pOFtOUfT9n+mpUIgYXjsQiT7X4dNKlMNJ3vqHixOGKLONRgkwD65QoTZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0T+aIDvS5TPiM5tZREN5xqLQ1uBTTm2ZrMznbOT05Vc=;
 b=GUvld+T07GddadXKqX2y6gYLUvmv/+zDHbHgTt+nYpG1vr5x7tkeN9zUyPTR0hOWgcWf24zxXXSn2guIlc4+hICjWtAjISgISJCp3OZolvpVRh8NJFMsmou3UcFc4gmAq+sZ2LCk+WxZvWXba2JyR0TvZ/ai+ekTn6NwCTFUOTeyKHf4PPhHoXfxEBgcmgJdD+OeNNuMrrUQoIaFSHq+OK2bROxbd2IjBtbgopc74MBBYleSQU5yURA+EXDyWP/gw42HTXwKfK1dvnUYivs8KIT2dM1oxmyxopaBdU2sRTri+V54N51PBPL4v17Hidq+3z1Nv8Zw7ixV6obC//0lIg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0T+aIDvS5TPiM5tZREN5xqLQ1uBTTm2ZrMznbOT05Vc=;
 b=BWNkCQLi1gvEB6xIG79Wlb5eM73jEAZPd+YKdwtY11rjg8jUu/4KzAJ5K1GKPVaxYv/t7kUNH4V+DepXCxghhNs9ziNT8BPteT4dc1jg8q5l5k2+uF/F/HilwhRW4Ui+tpzcKcDDIBd3tV5oVSsiS/EEg7ekh7BjHxqHrgf5NdZFOa6T3A03Mt5W3TS0EEPJK2gJCr/mO3pqDg7OlmKoUxyq53U4T4qW7Wp5GCbxiacH/slAF1pnKTxuoOdCLNlwomMybuoBlG2IkaRiCPUKx15e63LwygQpu3ooOi4bQTRFoGfK1SHw/UQe4XyzmbE7/gVBDOXF+3J8ZXcKEa8ceA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <2ea8c3de-4967-802c-9a32-79203cd41384@suse.com>
Date: Thu, 1 Dec 2022 16:57:37 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Content-Language: en-US
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH] x86/HVM+shim: fix build when !CONFIG_GRANT_TABLE
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0134.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9e::13) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AS8PR04MB9045:EE_
X-MS-Office365-Filtering-Correlation-Id: 6212d6a8-043d-45bc-bb12-08dad3b4c554
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	jAzQi+ooVncsDlSyw+ss6Cxwd2T1XJRZmb/E9jVF1je6OiXVTE9294XvI+5oOgznawBtDXOg2Xka3WdYY0h8wNkvTTrvBng/IGOyXiEXxFX5CxPYWAmpGTvAOi0886rSRQWcaMDd/lJs2f+CTb2cpoqAYJogVH428XfwnblOzgItrbhK4gmJmDsDdj71nX0KC18+FgbVTJy1mPQ5C2z2LmmcGcKtZF3BKj6OwqrPOfYcAiuBeJQDGlAn10oxezfDRHpnQnr5vP96T0t4NaMNt9c/PM7/6QQxMmSHYMFOOmIRMLkWismBBy6+QhDyLGrok/r2l0QYzHzPIho+nyRlcPPb3cFtH16p21bkzdVRm9Dfg64Q1XRClNvOTZWES4vfhIoKhadx2BaGx2LO1eiqm11jtrgy6zSmeNaDDSeP0BxcX+2yiowI56Brn3xrQG5k830qig+vTo0/qthhlU1aD6SQJOcmJVauJmioNJmvYCXSZqjO7oAGPSd0rcxN3hKqRDntIKvC28fBF6pSCRDyguyu+W26fCcpTdRI3EwksHRpRc36/P/oGoDo70Ae+Y7XyyQP1ZBLdyBIfrXkAc/gtqLxsFB9kLeSbEL8i8qxh4QQ+/Gv6OWZZyBfEU2N3orwvEzwi13Ws70w49DG8Omn+FcP7b15dBRVaEDYGjetfCYitjs413g5EuFrCD0JM++h3bFL/cfKBYo0d+WPHj/PKIFvJhyIL+ddpmysq4vpUJo=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(346002)(376002)(366004)(39860400002)(396003)(136003)(451199015)(478600001)(6486002)(6512007)(26005)(6506007)(31696002)(2616005)(8936002)(86362001)(186003)(5660300002)(6916009)(66946007)(36756003)(4326008)(83380400001)(316002)(31686004)(54906003)(8676002)(66556008)(66476007)(38100700002)(41300700001)(4744005)(2906002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bUw5cW9TWXluNFRZNFV2b2VMT0RkelNid2NUYS85TjQvVEFLRXArQVB4NUk3?=
 =?utf-8?B?M2dXUkFYZHgyVkkzWUx6SXVwSjQrOE1aQWpMQlZlZndvbU43ZDlXb0c3OTZv?=
 =?utf-8?B?SWNEZTh3ekhBSG1RT0dybXI2emM4Slp3ZERMdGo4b0pxRWFUMTcxbXhVSzFU?=
 =?utf-8?B?Rzc2YTcxVHEybTduODlTNkhXdTNiMWVOSUViVW1QcWJyMURUVE1YUHpNZ0hU?=
 =?utf-8?B?L1Nmc1ZtNmdWMEMxbldhQ3ZjOCtTbnRGdkptZW51WEVLbHhpeDVzemRMUWZm?=
 =?utf-8?B?NW1uTFl6bTJ0YmdYU0d2YS9wbS9zNi9KM3g2SFhURWdFWnZuQzhGMm9OV0wv?=
 =?utf-8?B?RWZ2RnA3MFhnWWh5MEJxeFR3WDJhOHFIdlNScEQyNTlaa1Q1ckJUbTk3WnQx?=
 =?utf-8?B?dUR1WWVBVnRpRmt1Tkk2VzBicGFGclVjZE5oUFBrMzdKQll0UG4yV0dmTlRl?=
 =?utf-8?B?bTdFa1NPSmU4WEJCSTUyQXhXMHVsWmp2ZFlnSFppZTVZaXlwNTNMcEhyaFNk?=
 =?utf-8?B?SlU2SU9SVU5vT3NzNDNJaWZpdmp2OCtPSzBqWklqbWNQZTJvV0g1OFc1R1Q2?=
 =?utf-8?B?TTVPYTNTMjF1c2VHdDJvUzZGYmMxaFBKSVRvd3BXczV0cU0xZUZvOFlWMWEv?=
 =?utf-8?B?S0VVMjgyNW53RWdxYVFUSy9XZ29EZTN5SmthMjVWYmlVM1F5MytNWHljbkp2?=
 =?utf-8?B?bTVMTUtHTzVCeFl2clI0SGxmR2VFMm5seHJKQkpQQThQNmtCd050ZEFKVHFC?=
 =?utf-8?B?K2VRUjBLQW9PaTlUSjJmaDEwZktPQ1FnRHVzT3ZFZFpqVzlUbzU4WnBWSkx1?=
 =?utf-8?B?b0srR0VMeElBdGlmZFdxWm5YYWtJR1MwQjhrYVJhNFpFdUVFUnpSSDJIMG1x?=
 =?utf-8?B?QmJpRkgwVnBuZVRFSzNPb0ZvT1FISm5Xa1dKdVA4cnFhTU5LQjVVV3RHU1Ew?=
 =?utf-8?B?amxadEJWM1pPT0JYOGFEd3h4T3E3Mkd4QmxJZndiR3EyZ3dFVERXTkZ5ZFl0?=
 =?utf-8?B?Um1ud3JoM25iaE0veFdud2ZYMW94N0dRdjNhYTJ1T25aTE1SOUkvSys5UHNW?=
 =?utf-8?B?aEZZajNUVDMwY2dleWM5elNGTjRtVk1iY2R4My9ybnQwNy9xeXJ0dXRTcmQ5?=
 =?utf-8?B?QVdVSkdSTXptRWJRZ2hlQnN0T0RaT2NpTGRnZnJzOGdUUjZ3RmFYM2xTVFB1?=
 =?utf-8?B?cHpRZVdCNXh0L2pnM1QwQVRrbnFLOGJNS0plTHNoY1RVOVhDSU81NGdhSzND?=
 =?utf-8?B?SEJ0Q0dTRjRPaERsTzhxd3JvcGZ3VFhnajJIODREQWtCTDZBaENYVnF3UnB3?=
 =?utf-8?B?ZStFV2Nia1lTUlMrY000ZVNVRjdReEp2NkQ4M2pCdVY5SFdtRWhuQ21jQzAv?=
 =?utf-8?B?SG1WRXh0ZDRBK3BXL2ZKTzNrdlFBY01DSXYvOHkwVlZBc1NINHRrSmpKU2h4?=
 =?utf-8?B?VGFKcmJSNTFlRUtvclFGVmRvQ1UzSHI3VE1KUmtwSTFmekE1Ykx4Mk1uY2Fa?=
 =?utf-8?B?V3hOTUd1SHFUQyt6Yjd0aEJ3WkVieU1ETmQrMlRzK0RxdnJmMTBZYXNYOVFw?=
 =?utf-8?B?N3ZpMHV1NkV2a1pUVnFoZm95ZFlKWDFLK2tnazFzNFRsUENZb20xZlI5bUtD?=
 =?utf-8?B?UStpam9MTkFid256MWlYMEdTbWg2djlLMHkrUFA4NXN2eWlSaTJkR1BIV1Iz?=
 =?utf-8?B?bW5CVDZvRWtJeDMrM1IrNVRQUnZwSGg3RFRTVVBia0Y4QThvM0N2aDBTeEdR?=
 =?utf-8?B?YkRJZjNPT25pcC9iWUJic0R2bnIxc3hPTVhFR3ZraUs2b0E3UVNlWFVPWVJL?=
 =?utf-8?B?azJySzFTNzJkNzFZTW5WSzlaZnlvMkdiekRNdW1FSXNBVW9aM1NsbmRZTHNp?=
 =?utf-8?B?TzZqS0pVT21QSFBRYzlvVHpHaEhEd1hOaHROR3ZIaGNyaER6UjFNcnNrVFNj?=
 =?utf-8?B?TzhLRDI4SU41YjBJWFpPeG1sNEVLN1VNZ1FpQTg1cXFieU9SbjZLV3pnenVT?=
 =?utf-8?B?Q2dndnZSVTVZcGpGRmhHdHBheGpicVlYVjMwZExjb293SWFyTVBncjFPN1A5?=
 =?utf-8?B?V28vSDBGbTZ4SU5SQmEzcWNQWlFCd1dPazlMaFhsbDlPcGlaYWY3ZlhCMTFU?=
 =?utf-8?Q?tMNIV9Q6DG9HZEEG9StRy8Q72?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6212d6a8-043d-45bc-bb12-08dad3b4c554
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Dec 2022 15:57:38.5834
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qDHas1GrVf7NGWZXUGDzjBZ5GFnl1Np1C15atoony5opjCi3MsIJsEoMBhtd7pqwUr2B/cpzgSMxog4ppdoZsg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB9045

The HVM flavor of the hypercall handlers exists only when GRANT_TABLE is
enabled, while surrogate shim variants exist only for the purpose of PV.
(Also scratch out the Arm variant in that case; what exactly is used in
that cell of the new table row doesn't really matter.)

Fixes: 8523851dbc49 ("xen/x86: call hypercall handlers via generated macro")
Signed-off-by: Jan Beulich <jbeulich@suse.com>
Reported-by: Andrew Cooper <andrew.cooper3@citrix.com>

--- a/xen/include/hypercall-defs.c
+++ b/xen/include/hypercall-defs.c
@@ -241,8 +241,10 @@ event_channel_op_compat            do
 xen_version                        compat   do       compat   do       do
 console_io                         do       do       do       do       do
 physdev_op_compat                  compat   do       -        -        dep
-#if defined(CONFIG_GRANT_TABLE) || defined(CONFIG_PV_SHIM)
+#if defined(CONFIG_GRANT_TABLE)
 grant_table_op                     compat   do       hvm      hvm      do
+#elif defined(CONFIG_PV_SHIM)
+grant_table_op                     compat   do       -        -        -
 #endif
 vm_assist                          do       do       do       do       do
 update_va_mapping_otherdomain      compat   do       -        -        -

