Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EFFD598529
	for <lists+xen-devel@lfdr.de>; Thu, 18 Aug 2022 16:04:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.389559.626559 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oOg7q-0000Ab-O2; Thu, 18 Aug 2022 14:03:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 389559.626559; Thu, 18 Aug 2022 14:03:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oOg7q-00007j-Kn; Thu, 18 Aug 2022 14:03:58 +0000
Received: by outflank-mailman (input) for mailman id 389559;
 Thu, 18 Aug 2022 14:03:57 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=1x1s=YW=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1oOg7o-00007J-OR
 for xen-devel@lists.xenproject.org; Thu, 18 Aug 2022 14:03:56 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2065.outbound.protection.outlook.com [40.107.20.65])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 98a640c7-1efe-11ed-bd2e-47488cf2e6aa;
 Thu, 18 Aug 2022 16:03:55 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM0PR04MB5010.eurprd04.prod.outlook.com (2603:10a6:208:c3::30)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5546.16; Thu, 18 Aug
 2022 14:03:53 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2d5d:bae0:430f:70ad]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2d5d:bae0:430f:70ad%4]) with mapi id 15.20.5525.010; Thu, 18 Aug 2022
 14:03:53 +0000
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
X-Inumbo-ID: 98a640c7-1efe-11ed-bd2e-47488cf2e6aa
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TmI0hFwBkWwtcrwHADXrmLP2LwcqXJlBm4rQWOcOJbRhXatGLmw3s8nGxGT163R+XN9R+uslmEgmymlbKaVpiZz0VMXdw7nfMOIAHKR1g8TkLVj2nZAx2cAubadd2t1Zve1HLBRPFwtNqFEiWMVCjJSxyaO6xRRnnnIc7t5kuD63rR1B3W9vuwIPqtmFP4ntahBrBXvSFXHVFOf26v8tmzozWYpdElDDBrnnj01M0rEub5nvgRQXf+W+E0VeiWkb5Ltf7ON28XjB3SjJSqHzkxAiuGkYQ2jXoerRREl3svR1s8FH7fxU1iVOfzLDG/gfd1CX0aiUL/j1gDQy5TyGqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IUN7vaVh4r0dNBLCu3MEChinXPaRDFLZVXmbgnSuXxQ=;
 b=eoACjnoVXu2VylTd0AKfJ6S1Z2d6rim1BIjwnsyBn+JtCimmkGBUwEcKKHvGuObK0YU7E105awxCv2HPwajjPMFK2PWu3p7Z/vMGlbrqr8LawvlJdO9aYi1/XVvZigpPKpNmFA42AF/8fEV1LK3xnljoMqtIiJQy/pd33eLZSvW0+vZE3K+GLU6YRq+jpYgrx0KDXRFQ+VIHXdZ3TJ7jBSx/pqlKNH80eYM+DpzuhgAYUv/fVcApvC2mk04tYPYtDzj6i7bGnaow7BDx/VSb15/0z+CWeZrq6OBvOv18t9WxZBYGQnHuv89y/SwQf9oE1xK38M2sFIM3DHeOLfWfgg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IUN7vaVh4r0dNBLCu3MEChinXPaRDFLZVXmbgnSuXxQ=;
 b=k9gvPci0G2dpCAK8g58zP8bYA5rMiLwX0MlIMUC1ZJAawj3lNHBFGURWdX31GAaxYFQTpIDvU2jYcjiAYBXps5YdQ5tf5KGCdywlOixoOEGcJKlL4YXs9XcchpQSDMSXyg4YmM5T0jzRCsfFdUQALVt/gOUwWsG2qsGknCbO3wlJ88dL2pLb6WzSHB9+iR1PVpfeBRiE+YXCYgxEPHc8VG1Ecl60p21ppj1NwfKQ+BQQpcjIs81LTx3AAYed6LtmyU6+s2E/Ehaj6y/GZz8aTsXO3P9ApdssR6hpwyFjOidSBEndY6j1qqMAWvO1XVt+kZ4k7oaEH7CTcdXSOrtwnA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <68e71e3b-19a7-e062-9ebe-2e6f6aae0549@suse.com>
Date: Thu, 18 Aug 2022 16:03:50 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Content-Language: en-US
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Anthony Perard <anthony.perard@citrix.com>, Wei Liu <wl@xen.org>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH 0/3] tools: address recently reported Coverity issues
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0100.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a9::6) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 74bb4643-3339-484f-4d41-08da81227b93
X-MS-TrafficTypeDiagnostic: AM0PR04MB5010:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	BEmN2cs12Vwz13L8pH6QLjKnlaU+iGXr/B+VeMI8ufUvbRvPuWt3AzSKp7zUSqYtFgqW+Rh3nV5NPYL/2bbgF0V5/3EL4Yg7q8U8zPU5xwyI87dJK0eW5gfs2DVMsvO1SouTJB3NXW48FwJnlJC+1SaIuhhLeaSa9KOnFHwq7nlbaYf23vurfSeRLbRdkVxLJsvjQccZPibRoxNeUnfBcE4lSAknt85YUr+J2nlzsvqacBBGL9Qa1fyeUJ8enc954Rzu0Z6VVfXOCdE3uYqt7e9EAOCBk8vtAvsIPN0JfdpMC7Vs/hqcpEdpa/IYPRFDYclfd8v2u7K5453C4AGQvDufrSIFPIUgFejzfRdKPhhE576hoKf21kDN+0O2SpDv+TZ87/lj78LLo/Tp9fsEMQb4Moe1q+Axb4UF5IwVptrycUxEfD3rKbZbTQCgLcn4VgclcPxH/Tn3f3Z7XTj/2slpmKgoutaWafXCaxMSBL7OdTyKTDZXFXv9imP6ed2glBsfTCot7wd06pH8cUx+hg5Qa911809Ku8ccDGN1p5oHYDrM7kHsKtqu1dRVRq+7mchs7LQ8s7LOVz+O1/JA+W6zEzeg4Xm1Jh9+j5E2Ehl2rTsoZgwdTQDwsBuHU5agUsx8ZBhJWprC2KeRdpbXFy4k2S9Fd6SxQw9C6gFJr8/+P+ZFWx9rEeMsaWfsrmyyoTYrMGC947+0+ummm2N0c5yq4v0F2iufX2P1wMI2TU7+TrSUVnMoQJ76iuGSmr6KdIqblMd2wKa9d25QLjW8zMVMIgXTH9fvExEfhlb8WbM=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(396003)(346002)(136003)(366004)(39860400002)(376002)(31696002)(66476007)(478600001)(66946007)(8676002)(6486002)(4326008)(66556008)(2906002)(86362001)(6512007)(26005)(41300700001)(186003)(2616005)(5660300002)(4744005)(8936002)(6506007)(36756003)(54906003)(6916009)(31686004)(316002)(38100700002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Q3FvNVNIM1ZCZWlmZ3JKbExrYXVFZUZsV3N6T01DYWdadVFvTFRmeld1QUVm?=
 =?utf-8?B?dWxWa1VXR05pdFpCdTg2VHY2ajlsRmJkZFg4TVhBb1JvVkhFUkpvZytUTjZV?=
 =?utf-8?B?Uy9XczZQUk1KSzJSOG55anlPRXgwdmRNYkRPNzZYbGx0dlZaZmR5alVPZDFv?=
 =?utf-8?B?VkpSL1RFUUp5Mk9PSlQ5L0ovUmFYbVh2eUUreGlxc1RIQURSNEllY29pWE4w?=
 =?utf-8?B?TWFFSGwzYTViL0VEY0xUR294QVV2NnluUE5vbzdGdlo4Nk1XTE04bFRqbHFn?=
 =?utf-8?B?eEVpMnJHdkdQbHU2R2N2U1RPQXE5S21pOG9kNHNzbW1KWkdGMHFwdFdqOUdX?=
 =?utf-8?B?RXBuZGtQWGd1UnF1by9nZTNKUHhvKzdrTFgwMFdXQVBiZWVFM3hoMFBXTnE0?=
 =?utf-8?B?VmFYc0dNQnNpZ1U3c0wzOHEwdEFDeXhrSHpERWpBZW9uUW1jeDR5Sk1aUzcv?=
 =?utf-8?B?RjBZbHFHUVJrdm52R1BmYWhnSHMyc3dyOFBMTkpHYSsvb1hhM0I4OHVkZXZP?=
 =?utf-8?B?NUg1SzRwcHlPMzA4TGVGTENFR0l6bnM2dTFjVDdaTityd295eldyYkNCWGF2?=
 =?utf-8?B?ZzdIWHVrYXFXMm9scXlVZkEwN2tVeHBPZ245djYzUCtSSzZvWGRpaDNZdGVG?=
 =?utf-8?B?M0cxU0F5UGR5WDg0NGx5ZXZrRmRMTXJoajg2MExtb1JBSFhVQzVqaXdYajd5?=
 =?utf-8?B?bVpxRzhoMThsdWQrV0pKRy9yallMNTVtWWVKMFBTRkFJVnQ3enRDYXhRTFlV?=
 =?utf-8?B?djZxKzFZNVcvTTYvWEtyWW14bGRkekZYeWNrZmh0Zk1EcnE0WXRGU3g3K2NI?=
 =?utf-8?B?cXVaSmowVmtFK3JxTi9JYVRMVlI3NkNvZjR0OXVjcXNSNDlUc1JSanprWnlX?=
 =?utf-8?B?d1NDL25vRC9wMTIySnBZWkV6VmZ1b3JMK1VBNnB3ZTRMa3FCeHJZSTV5QkdI?=
 =?utf-8?B?UFNRS2NUc1JBbktmRkRrUkFzZEpvMHdXak44d2NQVmVKdS92aGYrL0Z0cTBQ?=
 =?utf-8?B?S0pUQU1iYWxjRktUZmY3QXdzVjVmZTh1Q0drNGJFZW1kYnlGMlBIR3dWR0NK?=
 =?utf-8?B?Y2tJbW5lVHhZUldnODZJZWhWSDJRU092TmlKRG45ZllFQytOK0lnbUxSWUd4?=
 =?utf-8?B?ODFqTXIxS3JlNStRZk9tbjBrRzl5bCttM3pFcGpTM1hPa01IdDhuRnE4Z3g1?=
 =?utf-8?B?eXV4SytwQlRJbU9QVXNiVmZrRHpyRUFXM1Q5ZTF6Uk5tV3Z0bnZkVkMzRkor?=
 =?utf-8?B?TU9NUjVOc1FMY0NoTjRwMkR5QlVHRmZNOGdmYmVYTzA1YkFNRlZJTUlBQ3lh?=
 =?utf-8?B?bHV2MDRXVnpnUUNQSmV0bmJQVVFBOHFBR2J4dFNsb3g1U2dqRUJBMzZ4TTBZ?=
 =?utf-8?B?dG5SL0NLa1NQN2JCSnk3cE9OeXQvdDRINU9TeW9lSGlwSlFXa0RkWElyV0l6?=
 =?utf-8?B?bW8zSXdmZ2ZIbldtTWxKZUsvZDNCR1N3eTN5YjlYT0FSdjFjZmdhby9sajFm?=
 =?utf-8?B?THFFbW0xR3FlcTFqZEhjT3FXYlh2YzFDMDNseUk0d3A0QzBYb2lwb2VFUmVH?=
 =?utf-8?B?VHhNU3Z5WXlJdmFzc2RTSTNxUURxMXJHS1NyU3ZCZmw3V2tjYUF6a1I5RTVB?=
 =?utf-8?B?cHVWTFZwVkQ3U1BCM21zemZxamFva0E4ODFrdjkvNjZwL3ZpMGtMVUNYVU1Q?=
 =?utf-8?B?T295RGd3RWg4RW40TW1hSFBTT2g1TFV3K2tLcHdKZldqYllsMjBuQ3UrSkI3?=
 =?utf-8?B?RFZsb0dyQzJsK3JVK2Z6Zm1vdjFrVGh6YnNMMDJqRzZ1am8rcTNDdWZuM0Nu?=
 =?utf-8?B?eGdXVXRBT0Q2UjljeHoyWjAyV2ZVM25zMDY2c2x0L09WNmV0WnZIbEV6b1hL?=
 =?utf-8?B?Vllid3c3ZXFiaEYwSEh0NFNKVWtlY0ZNVEVpZXliMzk3c0hXVi9LajZnWEFK?=
 =?utf-8?B?a2ZNbWhrU1BEYzdxUWk5SGFod2hlTzBiQys4b3Z1SnVGSld1T1VpM0VLbEVB?=
 =?utf-8?B?MWp5VGZXdktLSU5NdDVSemdCUWRSN2R6bHhhSFhIaDdmLzdWYjBtOXVMaWxy?=
 =?utf-8?B?bG9GcDZQZ0pESGdEUnhSOXpiS0kzZzNodUs2Y2VjcHREWEhJRmxwTmNPZkF2?=
 =?utf-8?Q?3+kc+ax4L0PHgL1M7KZmPotDF?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 74bb4643-3339-484f-4d41-08da81227b93
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Aug 2022 14:03:52.9562
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cER4TnMzPKGIFHvr4JyZ+T3aZrWljF7ZY//0uXxvg4ZWrUHtYm4jJYOxGmAD3uLbDLMkU17jzxQujmmLxLdmIA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB5010

Three of the four reported issues a pretty clear how to take care
of, which is done in this series. The 4th, CID 1509375, isn't as
obvious, mainly because I don't know enough about Coverity to be
able to tell whether adding a cast there might help; the issue
reported for xenbaked suggests it wouldn't. The alternative I can
see would be an arch-independent piece of inline assembly, hiding
the transformation from time_t to int from the analysis tool. But
I'm not convinced such would be liked. Nor am I sure the can be
fully arch-ignorant, as time_t potentially being a 64-bit type
might not be possible to match with an "r" constraint on all 32-
bit architectures. So maybe what's left is memcpy() from a
"time_t" variable to an "int" one ...

1: xenbaked: properly use time_t in dump_stats()
2: console/client: properly use time_t in get_pty_fd()
3: libxl: use time_t for qmp_synchronous_send()'s last parameter

Jan

