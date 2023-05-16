Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C416E7046AE
	for <lists+xen-devel@lfdr.de>; Tue, 16 May 2023 09:42:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.535009.832577 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pypJo-0001aT-Ac; Tue, 16 May 2023 07:42:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 535009.832577; Tue, 16 May 2023 07:42:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pypJo-0001Y3-7a; Tue, 16 May 2023 07:42:00 +0000
Received: by outflank-mailman (input) for mailman id 535009;
 Tue, 16 May 2023 07:41:59 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=00Q8=BF=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pypJn-0001Xt-4Z
 for xen-devel@lists.xenproject.org; Tue, 16 May 2023 07:41:59 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on20604.outbound.protection.outlook.com
 [2a01:111:f400:7e1a::604])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 22e09797-f3bd-11ed-b229-6b7b168915f2;
 Tue, 16 May 2023 09:41:58 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by VI1PR04MB9810.eurprd04.prod.outlook.com (2603:10a6:800:1df::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6387.32; Tue, 16 May
 2023 07:41:55 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c%4]) with mapi id 15.20.6387.032; Tue, 16 May 2023
 07:41:54 +0000
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
X-Inumbo-ID: 22e09797-f3bd-11ed-b229-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gLpJfnqyJNH2BsjYz7bANMYnLyJXzDJDmLkWkdZOLOfN3l2kZce63GG6yYo1UC24G+dW0vJMiflomj+v4NNTxNLCy7bhAgdgwa/r3tI8qayn+GpS8Bs/a6U7N4EHqHxBfjsMD/pGhIPOaPUoLlOnFhd7/LUHZg59Fq0bvujKfUdwPEdej/Lex0lPkDdJzlHPlCtV+O5IdNM5ei17pd6E8omM5cNvKR5o0iDy8XT5D5AIwEJCJzDWLICrkJSGBrUjpk4Af8BwiTrXC8SFWFwVmIFx/uB5BTe1DQ5mnlPIp9tNY2jPJ8z7K+W/cyk9T9vG6nG74LypeYdaEVnTiGU+TQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZITHlve6KzewL4/nVxygx6EqipDtPX6ixQIP0ctjoDI=;
 b=kMa/e6OpAfvd8/6N9wPGMOODwkxj+arv4y3lMAtVLfat9cEeoRHFx5j67wQh3SdVlRWZb7vkrTjtk7kvkS0DmWyqRr8pe4uNA0TiUcY8pJzrIH3pEb9qHXPRg9KBXHjcAqUEkFNCWstOX7Fh4Vr/KVgIxqgYnR8cyA51QYJ1lUs7C2X2NIZWjEOH0kOHh5YLFgd+XX54nFukmZNzAMLVOxx3mXSWvj1ZpLlXrlqa0dlOI/A9wNhvv9OKxuzZUlpofAfNYuo4Z0az0RNMxfBSyuxGrU1bAlmc4C6kFnrRZa1yC/vni1Rlazxe5r4boR713xfusb+/uZnN+IJOMaE2rw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZITHlve6KzewL4/nVxygx6EqipDtPX6ixQIP0ctjoDI=;
 b=NYpbA8MOiRJgXK3zgaToYQkRoitxTuQxrdw25VaZCDvPZD5qgaoRU8c5i6tsuMO8UBrs5tkSUi1i1PSlq0v78WWKxuw+AHdz49r6F5/my2fkfnQHH1Ug7RV/zNt8Wh2P1WdPPXf6x6gyU4+Q86QYuB4/4kOIPcpzqWwQaP2o/LGZSyIGuCUxDLOgs+b+lTMk2cQNN23U6OX6MsAxwRRp2i8n0G1JVTJgXCswGY3hYnQspsGVgMxAKJXTe7o7z9tCkamObrU5x7sH5D9cK4OEjAvmP5q030QQ69tKBNUx7uTQmfqRTjWctNKE7fEYt+wXUhxRCFECSoFy32dObksVMg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <dee5be5d-a997-cd80-aa67-ca2f5c68bada@suse.com>
Date: Tue, 16 May 2023 09:41:53 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
Subject: [PATCH v3 10/12] x86/shadow: make monitor table create/destroy more
 consistent
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Tim Deegan <tim@xen.org>
References: <184df995-e668-1cea-6f9f-8e79a1ffcbbd@suse.com>
In-Reply-To: <184df995-e668-1cea-6f9f-8e79a1ffcbbd@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0080.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9a::13) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|VI1PR04MB9810:EE_
X-MS-Office365-Filtering-Correlation-Id: dbe1e6a5-356f-4983-1220-08db55e10545
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	3pUdJ7oAV3RKkdmEUfSPKP+tFZ75X4FyIGPuWS3U+RnEp48KYSgujLaN8ZRxoplZMZO3l7zNMVHJB1w/sfy9oPHDvjVEyr4K6ko9k9/5gfCV1l7PrSC/unsOAmPMDW6zutwXX1lgx1CGpFr4gn8N00VfpHV+g7FTrFZcTjH3ionKeo7nbVuRARmWznBhSPwq1wgh1VZdD96Kvx6j6Z5B6AVk04MyDHHdNG/51ZGS2qyKkvzW/gezxm2fIxINTks857ATo6MFNQOrYCLH51PvVy/9ybCzmW/VGKHSXJnGqSLiT1O87rSqLCJbIXSHMbN+3UE+hGHlAIYIbpaTNK54AbPYwvtcsWW5bTOO6pwj8Kh/3IcwzmUPOHN2pzY0kL4c+UdUxwVl/JOH963uJuYWJFAtfBQrRCWa/HB5Y2sPk8WFOMPeOUEO9cZZUxf4eFr6DAWv0gMiFj+qwATEYFTlhMbmgEdRYQ64wZhB1T21wwytFK399mxuC/SGAYCIfpX0xEc5ynVXd7qiPHDkYSyvyd+OLGOFm0Jdp4pxSvK6a0hzVMJhWZyRN7u9TN2yhodfVK2rRMiUQaF6YgN5uE4I8MRdvA7+AujykSfwjUkwFBWmwD7VJP6OX45eUkfqJD3AW/pIhW1H+3/v8+fmpabIQQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(396003)(136003)(346002)(376002)(366004)(39860400002)(451199021)(26005)(83380400001)(5660300002)(4326008)(6916009)(6512007)(316002)(66556008)(66476007)(66946007)(6506007)(6486002)(31686004)(2616005)(186003)(36756003)(31696002)(478600001)(66899021)(54906003)(2906002)(38100700002)(86362001)(8676002)(41300700001)(8936002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MHVEVnoyMnA1Y1Y1R295d1NrU3Q0bGpySlZhK2ZzSjlScmlnOGcrVTQxSU9C?=
 =?utf-8?B?V1RpbmM0Zll3TWpkL1JDKzFJSVA1ZGdSZWhSckpNVVlHazNxNVR3QjZjZ0lM?=
 =?utf-8?B?c3hqT0tJekhDTThPVm9wWGpDVEZueGJGWXZtb096MHd6Nk5CRDRvMDZvcms1?=
 =?utf-8?B?MTZ3SW9NL0J6emFjK2RQQlFhRUdEVkUwc0EvYnhRZVp4Tzc5VHJvSEZlaVNx?=
 =?utf-8?B?VE1jM0RpbjJ3ZHMySi9Uek5RSlMxS1dNdm9mNVpJUG05bjZXNTdKQTVDVUFj?=
 =?utf-8?B?RWQwYmpvUnp5eUNWL0NXa0xjUDBHbFdjUTU2YmF2ZUZ6aldsWm14M0FPMFpj?=
 =?utf-8?B?eUt6c25HWTdydzVTL1orR2pEOWJpTE1LWHJpMkwyNDdlOXhBY3lsaHY4T1BF?=
 =?utf-8?B?MmQrY0FZenRBUUViN3g1M3V5N01lVEhqZFdvTmpaS3JYbkgzMHUzUTArdkdh?=
 =?utf-8?B?WGZYNDhFZlEvRlJoemNHUHM1NHlLbm9KVlFZVkFiekhmVVdtcGdMc1pXQVha?=
 =?utf-8?B?YmM0TTFNNkRQRzdMODZ0Vzc4UysydVZLWExJNFlwTml2a3RkUVZYSDhwSVRK?=
 =?utf-8?B?UW9SWW1ubDFMQ2dGa3lTSG9pWGFldjVmUVh5SFVZNnhjRFZSeGw3NUttMGlW?=
 =?utf-8?B?N2RZN1FCbWNjQVF1MU1XZnplbmE3SWJ3N3NtSlJwZjByV1pmOUJkTHJ5a1Ju?=
 =?utf-8?B?WTBRWWk5cHJSZlRnL3RVQU0wZlFlTm1hWmhsdlNKMHB4dWtjSmg0cXBXbExW?=
 =?utf-8?B?cVl5QjNGY1FDOFpQTnJVb0Fzc2FDeittNWhQcVJYNGYrUTQybHQ0cG9GMktu?=
 =?utf-8?B?TkZiWUpMR1F0VzVrK0tFaFN0dmlPaWdPbm5WQXZ2eVdCK1JsTmlUNmxjb2Rh?=
 =?utf-8?B?STBUL2NhRUQ2M2psWVhhOTI1TDRiVVE2OEJCaCtrbFBWZjdGcmkzcmw1bVRJ?=
 =?utf-8?B?a0xFbk5EcTFNaHZjT1BBYUxSSm5kbVFBdzQ4MThLcjhFSDNSOUlNWGNkM0JZ?=
 =?utf-8?B?Q3dEUzcvUXRORndiSHV3NHBBenl1eS9ORXh6OG5uU1BPUWpzTElXV3lpSi9u?=
 =?utf-8?B?dVkxY0t5WGdyOWRnendicVUyVVJvclBqZVVaWlpJc1F2WEh5ekx6VFVhcm9J?=
 =?utf-8?B?cGpmU0ZhMmhQVXRWUENBazJuaEV0Q2R6d0xkS1BiRElFbHVVWEJOUnpuQ28x?=
 =?utf-8?B?UDF4RjBUdzF5d3VnaVI1TlJCc3V1bXllbEpuOHNmcU5QaDJQU3ZKT0lSZC9l?=
 =?utf-8?B?TElCbE5HVE1EWDhYaHluNFRnTUhpalVrallrUjFxNVhaeWY5a2I4U0F0WUdR?=
 =?utf-8?B?VzhuZWlqcDJwNHdudU5KWEhNbjUrcWNtWGJxSHJFNXlUVUJjWjdIRlZCVlB0?=
 =?utf-8?B?Z1BTZ1BFOWloMk1HUnllSEc2RU1JbmJnSUpBTVJ6bzhTSE1LdTFBSW5tNzdh?=
 =?utf-8?B?SHV5aHJqWmNqTytEdDlLbnErMjl0ZFBXeDR0Q2NvWFRRT0RRZnlqdXFGSFJk?=
 =?utf-8?B?enJSK0NML0ZWcC9PeUkwRWJhbkY4MXVoSkR0RDNlc3BxV2dTNjZkanVpb2lh?=
 =?utf-8?B?MDJnRmthYU5ZK005YkhIZmtjNW1HWXBZOExGeUVsSm9JNS9DMUdVa0FYUnQ3?=
 =?utf-8?B?UkhCMnZoL0lWMGFvL1E0MEtZOEFqc3owUmV3M09naUxPZEJBdmdGWDQ3TUVR?=
 =?utf-8?B?WDV4Y3ZwRGVOZ3hrWWpsSndOcVBRVUZYcUFRUTJRWVcrRks4ZURDKzBoR1g4?=
 =?utf-8?B?QUtybEdJUEFNQlVZMkJZY0FmNVFOamkvK2YwZlFSTlVycjNyYTlaREoyd0d5?=
 =?utf-8?B?Vk9wc1BjZHR5NXhDcFhyME9NbHMvSUxKVXU1SXpvZTI2N3NMaVIxWm9TQmFB?=
 =?utf-8?B?SG9kOXhKNWJwTUVBZWxsek5rNnJWQ2QxQ3VMTW0xaFpnNkdVK0hFZnVYQmZB?=
 =?utf-8?B?RWY2ODRDQUhiK08vM2tEaHcrSDFnaVZXWGVYR2hqdW5LSEJwTUhsYTg1SE1W?=
 =?utf-8?B?SWhUV1NmVENGb3hIa0Jhd3BKYmcvQ3BRS1VHSzhhbnVoaVRTbmxabFNRcjFt?=
 =?utf-8?B?N3pzcUttSHBpMzdYdE5lM2lvL1JSbDNvWXV2dGVLQlZabG9YRWpNNFllSXRG?=
 =?utf-8?Q?RgY2yRdJzbl0c1VukmzT9pIEX?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dbe1e6a5-356f-4983-1220-08db55e10545
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 May 2023 07:41:54.8543
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xJXm8nO9OFjeDqBkEBtFU+NJcgQLtMqWa2yKJwXVRETTgYABj83aFDzdhHOehVQqCFLw2YjH84jCTSMvJa60yQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB9810

While benign at present, it is still a little fragile to operate on a
wrong "old_mode" value in sh_update_paging_modes(). This can happen when
no monitor table was present initially - we'd create one for the new
mode without updating old_mode. Correct this in two ways, each of which
would be sufficient on its own: Once by adding "else" to the second of
the involved if()s in the function, and then by setting the correct
initial mode for HVM domains in shadow_vcpu_init().

Further use the same predicate (paging_mode_external()) consistently
when dealing with shadow mode init/update/cleanup, rather than a mix of
is_hvm_vcpu() (init), is_hvm_domain() (update), and
paging_mode_external() (cleanup).

Finally drop a redundant is_hvm_domain() from inside the bigger if()
(which is being converted to paging_mode_external()) in
sh_update_paging_modes().

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
v2: Style adjustment.

--- a/xen/arch/x86/mm/shadow/common.c
+++ b/xen/arch/x86/mm/shadow/common.c
@@ -119,9 +119,9 @@ void shadow_vcpu_init(struct vcpu *v)
     }
 #endif
 
-    v->arch.paging.mode = is_hvm_vcpu(v) ?
-                          &SHADOW_INTERNAL_NAME(sh_paging_mode, 3) :
-                          &SHADOW_INTERNAL_NAME(sh_paging_mode, 4);
+    v->arch.paging.mode = paging_mode_external(v->domain)
+                          ? &SHADOW_INTERNAL_NAME(sh_paging_mode, 2)
+                          : &SHADOW_INTERNAL_NAME(sh_paging_mode, 4);
 }
 
 #if SHADOW_AUDIT
@@ -1801,7 +1801,7 @@ static void sh_update_paging_modes(struc
         sh_detach_old_tables(v);
 
 #ifdef CONFIG_HVM
-    if ( is_hvm_domain(d) )
+    if ( paging_mode_external(d) )
     {
         const struct paging_mode *old_mode = v->arch.paging.mode;
 
@@ -1854,13 +1854,12 @@ static void sh_update_paging_modes(struc
             make_cr3(v, mmfn);
             hvm_update_host_cr3(v);
         }
-
-        if ( v->arch.paging.mode != old_mode )
+        else if ( v->arch.paging.mode != old_mode )
         {
             SHADOW_PRINTK("new paging mode: %pv pe=%d gl=%u "
                           "sl=%u (was g=%u s=%u)\n",
                           v,
-                          is_hvm_domain(d) ? hvm_paging_enabled(v) : 1,
+                          hvm_paging_enabled(v),
                           v->arch.paging.mode->guest_levels,
                           v->arch.paging.mode->shadow.shadow_levels,
                           old_mode ? old_mode->guest_levels : 0,


