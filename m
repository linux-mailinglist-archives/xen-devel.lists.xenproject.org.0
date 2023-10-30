Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BFC97DBA5B
	for <lists+xen-devel@lfdr.de>; Mon, 30 Oct 2023 14:15:16 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.625089.973993 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qxS6U-00016D-CE; Mon, 30 Oct 2023 13:14:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 625089.973993; Mon, 30 Oct 2023 13:14:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qxS6U-00014O-8j; Mon, 30 Oct 2023 13:14:50 +0000
Received: by outflank-mailman (input) for mailman id 625089;
 Mon, 30 Oct 2023 13:14:48 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Hhfi=GM=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qxS6S-00014I-Es
 for xen-devel@lists.xenproject.org; Mon, 30 Oct 2023 13:14:48 +0000
Received: from EUR02-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur02on20603.outbound.protection.outlook.com
 [2a01:111:f400:fe12::603])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4be61bc6-7726-11ee-9b0e-b553b5be7939;
 Mon, 30 Oct 2023 14:14:46 +0100 (CET)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by AM9PR04MB9004.eurprd04.prod.outlook.com (2603:10a6:20b:40b::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6954.15; Mon, 30 Oct
 2023 13:14:44 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::d924:b650:a2ad:7b25]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::d924:b650:a2ad:7b25%3]) with mapi id 15.20.6954.016; Mon, 30 Oct 2023
 13:14:44 +0000
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
X-Inumbo-ID: 4be61bc6-7726-11ee-9b0e-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JM7AhipIM/gAKD6N379Ecjai+UVnZkt9CCjrKR4qdVZnRRHJWHQcCCa3K3WRLR0QFBhsDGFYXKWfjfhb+aJl9nR/YrBQxSUkbt6qGp+EmDywgcNVsGjprHdxAVd9CH+FXFXLXjqkvkzpaAE5IkXv0Ndxv0bt6FLUTha48QW+Qh7DNxZwI2APyBg2+ZXxFcdyJ0vIpKkg/iWee8+KlOFQyQk2qgjwEIc4XV98x/rBwWjIDAjNtEzFacj513RZDE3j6hb3kC7n/jwzcOiluj8idAOgZ0DUutoP/GK23Lp0gK6sKpvysAWGpkvOE2UHQnsarNAQqtEqwbXtd+mq/K+1ig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3Q4mQqnMvveaYTXc/q/QyyNJWrBwCyPsV63BAEhdJmM=;
 b=hdhR/Oyr8+PKTeY7+dgT9umluxZhmOvcJIxObP0t2m4JQKtgmscQQ6sU/MS9eOIcrgKqhi4sfxEjA5EWTPHCR/uYyTWey55e8j8noO5SAuGbRHNGzIK6s8i2+t95S8i7lHDCG7JtbgbPhQPKqvGaV2/TjP06i1lMMwqS/vtpckuxfUrFxo27C486pn1rVPgGFUrpi9NEUfF/yPSEP2fw7b0uF3cWMN/5GOklLHNGGBXGf9tfCZvZOJZzFRvIr5L7d/3yf/ojZOtzyx5wQ5tOdp+UUkGv8hWcpqdFu1egMsR+vfpp+qH20FYCzFq5YqC1bOROWFKCtkhtDFi6WYP7pA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3Q4mQqnMvveaYTXc/q/QyyNJWrBwCyPsV63BAEhdJmM=;
 b=eb/8SNMXrc96ZPrOO33qFCyUYtMnx3AhqBcfx4yoxcm/bm1bmJ7EwwjtTzc8PkLEAL2Lir5nnYsMAOeiYfnItYfiDaHR7q0KxYmLRnkArPW5ShGVI6Hx/HsGxDXVlTFbWgF7dDl43lvXQS5Duoz9eT0FwvBG8yaOWbDugY3Ac5PkjRfnakKg2UIN+bXU621j1cIpZKXBZv9K/a4m8rHRwT9sNxPeQzLCRnjRyp810SwjOm035QNkanpxKKLXMLi7uRcedgsAta3Otq5e9LWUaAHIfsmqGVYF7xM8vmtiOyv/JqdMHxhdPSgk9Tzhduw+88azdOH4oltpOca4IadAzA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <b297e430-f3e3-97a7-be7d-1debdbcb0119@suse.com>
Date: Mon, 30 Oct 2023 14:14:44 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Content-Language: en-US
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH] x86/PVH: allow Dom0 ELF parsing to be verbose
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0208.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a5::18) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|AM9PR04MB9004:EE_
X-MS-Office365-Filtering-Correlation-Id: 966bba68-2b74-4dca-8e63-08dbd94a2ee6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	pM0keaDmkA2IeB45t3VGUE8AjkaVpvutVSF5db4SnAedSGceuo3fZi0f4Y8BySqXLE79tqs5IJ2m/VBSyH8Kq1/Gbx1gSQGwGY26K7PcOetO5Jcbs+dWJDLDeN2jutEs38RX517tw57iOBrt28mUOThpVcKAdqKHFf99JRsER37fzetcN1R88teEFmcvqjLnODvg/SnL5Ftw3yXybMT58N7TrW86SukkjustObqledB2S2xuD2Dq1W5oCR63Ls+1FjxUIAheNK8JS1L0tpLxwaEKDX54JKb+eWDkxZXqvaFK9oumDaFJtoNyQFsbe3vV6t7CcDBKv//mt4kuaJStzw22UBjrAnGWwD817G1ro9GYjD/gUjgT+scYduJIsBXJ+As3kbINOuL7eXDlin+VBRifVK3BeZ1kAnBbTCMrPAtc+J2ro4sMPpVuLQW6F0/hN71y4g04V/myQooaQBZyQgHiqlSJMxz1QRrEsIL5d2spGfbT/bVgRvUvEIUbzQ9fl4m1DoNxHk6XTROqd1gEXwd9gX6OodgL5rxQkiv+HoN0f0TI6XqKeaJK6vsOPMERWfppjUz1tCZKsPNYN1XYB/EoZ8b48UuCH5HSTTEgSeKxUoD+tsUSRXa4ji4/TqlDnIgiUnG2vb/14VrSvv08zw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(39860400002)(346002)(376002)(366004)(396003)(230922051799003)(64100799003)(1800799009)(186009)(451199024)(38100700002)(26005)(6506007)(31686004)(6512007)(2616005)(31696002)(36756003)(86362001)(54906003)(66476007)(66556008)(66946007)(4326008)(8936002)(8676002)(6486002)(41300700001)(5660300002)(4744005)(2906002)(478600001)(316002)(6916009)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TUU1S1doV3dxRVZZa2cwcDR3YlFYR05Ba21EY2kyYVBsbUdDZnlNb29xWEpU?=
 =?utf-8?B?cXIwaVBLT0lIVVR0V0ZLSmEreFF0R1JmZ3R2TEdRNzNZZTdWekd0dHNJSTkv?=
 =?utf-8?B?WS9ZYk9YRjBLckJUL29wUDRMclNjN2N3K0hHMXdnTFZmWHgvZkNXL1lXdVpi?=
 =?utf-8?B?QXd2dWc3cG1zNGEwRnR1bytGU2l6TG1QL1NPdng5MVZMUEdwenNZNFBqK1JY?=
 =?utf-8?B?YkJGMXljWDBIaEdpTFkrdXNNWW5xVi96MStRT3Q5SjlwZEwrSFRPUy9aOE5O?=
 =?utf-8?B?UldtVXc1azRpNnVrZmNTdDhkTkpDTTVFcXVJWHQzSXhPZDE0THVrQlFQMk5Q?=
 =?utf-8?B?VHRWYkR2RHBOcXF0azBLeXBZYUNtZEtNQ2R3cmlKS1Nxb3A4bVB3MmRDSWk5?=
 =?utf-8?B?ODRJc1k2eWo0TEtJL3ExTHJocCtoM3RrYzRkajczYlhyUFZXYU1lb3RiM0pP?=
 =?utf-8?B?aEN6NTluMkpaS213Zk5sN2EvS0s2cG5lMGNvcmNtUDJMbWhPeVJjVkIvVWdl?=
 =?utf-8?B?d2FObXBSSmlUbGY3VlJkV1QvbElBei81REFyTk1FUW42TFhSbVE4Mi9sQ2d2?=
 =?utf-8?B?dWNNV0dLbUliRjlZZldZLzMzWjlrNkE3R0doY2RBaEN4RTFOVTlzdzFqaWRs?=
 =?utf-8?B?RVVaSWcwUUsycU1LOG5IOVBGcS9pbmtkcWVUM1V1emJGcWpvbGlNbHhJYndi?=
 =?utf-8?B?SUg1d0V6dENzdG11TCtsQjU2N0wrWDd3dHBEVWJ3Qzk2ZERJNjBpcUtiSmxz?=
 =?utf-8?B?YXNLY0VYUC8zRFQxM2NpS3lVZHAzVHFxT0RBQlFDeFIvMDN3YmdlNUQwbTdH?=
 =?utf-8?B?USt6dkxab2txK01LYlkxOStBZXdVL2hFODRoTmxhQUMrUnhGMnFNWWEyM0VW?=
 =?utf-8?B?VVNQbHlxMi95aHpocU5tQWdJaGNESHdxVkFZSnBmVllNb3VYNGdnVTF0cWor?=
 =?utf-8?B?aU9zRmtFQ3VLUUdaYjAwTHZCMzlpVlN0MGZjaGdISkIzUEZtZUxkcXd6Ulpm?=
 =?utf-8?B?R0ZIMmpMS3QvcVhUVVNUL0dDMkd4clM0WGVOMGZOQmltYkVHS2NuQ3drRXV4?=
 =?utf-8?B?RllVc0xIdVNkdE5tRDJtRGs2dUR0NVdGNXpPUEVKOUh6RU91TnVUY3RhdFAz?=
 =?utf-8?B?K1R4MUc3ekNZUFVVMDBsRUF3eW0xd3UrNTM1ODhTbisvYysxWFVOZmNMS2Mr?=
 =?utf-8?B?VjYvUkZvbTRXRStGTlVlTVRwckxaRXNFdjJlYzVFSE9RWUt2ZUF3aklYS29u?=
 =?utf-8?B?SmRHZHdEZXZTNk84d3h4eTFyOVVnV0FXdGwyMVpMWHZwZW9KTmNDaTFhcm0y?=
 =?utf-8?B?UGdBcWREZEo4a3J0cElIK3VnOGUzczZGOHliaUNRZUFIOUtQLzZwUzNsdHQ4?=
 =?utf-8?B?bXdKWGJ5ZHZLMFE3QUZkTTdMT2oxYkpqTG96OGZiVVRLNjNMV2FTVlB2bmtx?=
 =?utf-8?B?TmpTRTBuaWJNYTBOUlZkUFhHZ0luamJoZFZOY05XMUtwK01VaDhEajdJN001?=
 =?utf-8?B?VVRUZ01XMk91QmRoMklxdGVrUDVLanZHVnc4bU8yOEdmeDZKd3FaTjhKM1Ry?=
 =?utf-8?B?MFBvcUVnNkJUNXZ5UnA0L1dXeW5KRjNBMkorakhxeGhpU2N3STVES2YwUENM?=
 =?utf-8?B?enRKVnEzTHA5RjY1NXJXODNCSUpDN2RkWW5vMHVpZjU2MUJiS1lzamh2MWZw?=
 =?utf-8?B?WHE3YUtzSmp4VUZQT1Rrbm5FRzdUbjlpMFhGKytTQXU0bm5xUHJtVmI5T0Q4?=
 =?utf-8?B?Yno2RlVFQlhqRE5IVGJONy96czEydm9icStnUzdTemNscVQ0cUNVditBekRD?=
 =?utf-8?B?eWY2c0kwb25haXJmTjJyeG1BeEFUcmowanpEZEhOS1ZpV1JKWENvcWdrRkdI?=
 =?utf-8?B?M3hydWVDQkQzaklMUWlxYXJMU2czMjJYSHBPdDJzSXlJM2lGa1hJQkcrT0oz?=
 =?utf-8?B?Y0FJblpmdHU2M1BsTEwrVHFrSm9uY0VGK25JOFVOT2JUeVZ1YkorK2hjOUdG?=
 =?utf-8?B?T2VZN00rVENlT2Z0MUZEdTJ5cUFzR3RKZzVrK0E0dU1FN1JXYUc3YWZvSHVX?=
 =?utf-8?B?YlY5N2V5VkxERThxU3ZkMGd5YmVKZjdiV0IrMVRrSU4ySlA0dk52bzQ0TVh4?=
 =?utf-8?Q?MV8E/tqb/PkHGmtoCj6YMmql2?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 966bba68-2b74-4dca-8e63-08dbd94a2ee6
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Oct 2023 13:14:44.2471
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eUebcvQZjd9BLYMEDPgPM9mwJGi/ftKSHarJkTP/q2a8/iOrBTWCubBRVZGUwmgdifiD9yFrYCzIfE+TbB0caw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB9004

VERBOSE had ceased to exist already before the introduction of this ELF
parsing code.

Fixes: 62ba982424cb ("x86: parse Dom0 kernel for PVHv2")
Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/arch/x86/hvm/dom0_build.c
+++ b/xen/arch/x86/hvm/dom0_build.c
@@ -557,9 +557,8 @@ static int __init pvh_load_kernel(struct
         printk("Unable to init ELF\n");
         return rc;
     }
-#ifdef VERBOSE
-    elf_set_verbose(&elf);
-#endif
+    if ( opt_dom0_verbose )
+        elf_set_verbose(&elf);
     elf_parse_binary(&elf);
     if ( (rc = elf_xen_parse(&elf, &parms, true)) != 0 )
     {

