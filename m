Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 26B7276FA13
	for <lists+xen-devel@lfdr.de>; Fri,  4 Aug 2023 08:28:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.576867.903502 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qRoI8-0002US-Kl; Fri, 04 Aug 2023 06:28:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 576867.903502; Fri, 04 Aug 2023 06:28:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qRoI8-0002Rb-HB; Fri, 04 Aug 2023 06:28:04 +0000
Received: by outflank-mailman (input) for mailman id 576867;
 Fri, 04 Aug 2023 06:28:03 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=VoTD=DV=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qRoI7-0002N8-3y
 for xen-devel@lists.xenproject.org; Fri, 04 Aug 2023 06:28:03 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04on0626.outbound.protection.outlook.com
 [2a01:111:f400:fe0e::626])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0f856222-3290-11ee-8613-37d641c3527e;
 Fri, 04 Aug 2023 08:28:01 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by PA4PR04MB7549.eurprd04.prod.outlook.com (2603:10a6:102:e0::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6652.20; Fri, 4 Aug
 2023 06:27:59 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e%5]) with mapi id 15.20.6631.046; Fri, 4 Aug 2023
 06:27:59 +0000
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
X-Inumbo-ID: 0f856222-3290-11ee-8613-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OmXQcmb5VAeeXY7500tmOnrHEZ7BMb0QH1HdJ1bZJBb7B6L1uarMCpYCjdVO1nk7m4qm9B1OH+ySoFy2mQ3Ca+oGaI+/6hIijYtbE/hLMUZNjhyVUYJePIAlLk1uo+OFIZoaBfLf5FEVnESmoYHHkJFWQILM6fMIqqD9aHbKjEdqtVqn7JmOkZEv3EO7vZyNoeQoHY7jZRqZml9XIOjVNVwvB2dEglHWpO30TxmKpRMfbgd5Kol0yh01DlrWM4j8fXHjCj4tH0gGMne4dvgWcw9w9CO6vaxG0Xe+5cvUDo2thZqHuyCzkrSApHfucJBLs3WGzfthwndPm7/KXYHsNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bxqTYAMqHDtwTsaXt5W2izXbr1PoTAZ70AuZ6hPpGqA=;
 b=Hzeq8KGKWMKgaTZq4tO5BLrEPSwV0dIW3/04kJUAfiVN0ClNJz67iP4Asv4UfjBaRUpuC7NpIKZ7C+bTmcAuKFv5zCUa858worpdhMN+g36GPba88ul/aTDp+/wGcNdXutNFpdcPJHNu0tbLIbD1/r4/wc4HeNjJrQSEoO7lZThbKRFMI+O+u8BHGuEdfV9h6/DCLbScONIcUEKOGIGB9iL7DWDOmw5pI3scE5lAi6c6uA8dgrvF5wIyv7EjyYovPptO0M86a/w+8N0miH2wk/d2FRTC+xG4zKB2paBLwEMjsJdzrhf7IZOjqqgWc9MrJ11jATOQ3b32gfr/HSfAzQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bxqTYAMqHDtwTsaXt5W2izXbr1PoTAZ70AuZ6hPpGqA=;
 b=IdUvyZWUWUnfYBIqNaqq1O8tiAOM5N90Gg0IUpzsuu8NmnD2KNqr79fNMMlGnvaZUCkCci5eIgsjT4yD7DDWUAS0cb+ACjS7j4l92+q2MOBl+1SthyWay32gKkquvsMbDGR6eCNUMCA1KdH84Rsmov/2q+E++4VdTblu1AaMmOaLsZiT4G3gu/nuk//qanBeoccA5ZDCiATEewKyuN3XCPcWwjzJYGcZYItu3dgOekpBS64aJXphwH+ru0IMP5d7pqN8+VF/gUkgnGS95hisFL/8SJ2UoMTbYGpMfhhV/AEr8XzAN2XUYq2h2ybEsy+fepaARJCLDRrdxdFMaKuf5Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <29f404eb-e5c9-fb1a-e60a-47d4dc77578e@suse.com>
Date: Fri, 4 Aug 2023 08:27:57 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.1
Subject: [PATCH v4 3/8] x86: also mark assembler globals hidden
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 George Dunlap <george.dunlap@citrix.com>
References: <e4bf47ca-2ae6-1fd4-56a6-e4e777150b64@suse.com>
 <bfc597f3-c61c-727a-159a-859f57997d02@suse.com>
In-Reply-To: <bfc597f3-c61c-727a-159a-859f57997d02@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0018.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:15::23) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|PA4PR04MB7549:EE_
X-MS-Office365-Filtering-Correlation-Id: 0ced7ace-56d8-41c9-db83-08db94b3f2bf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Rl4RFUex+Nm08t8dyQ0ELwJIMCxxc4nDVySDnhLQklu2sUUrK3STQYg0wchr7WHWjAR477MYagGiH0Lv04++W50IZJ/GF5sn14sDeqpHel6vrzOwo4FRd/AomnvHvSLMHTYM48WWlxJnh/iiTKzd4rK/D7eI1BYzrLZCYWQlJXmA5XVvGdUGdr8aX2QOeRjZ1jxBJcW1giGLTw4rNWPzdvV8pPbcoFm2tij3mY3rwuOTl8vZ7wUwESp4ke1ZAV24TB756NMCoQDFBgZOF0sq1NHybLFs35nDAIb2vFZ5SPr7Vj6CDg6VcJhzBgqEb5pLRBkYuCQ8CFdz1krtl15Qz9aZv8UPE1Eyb5ih92/o/lfphxpW40sY2JrUnpVSlwNudHRZCvkui5cO7ZzNI6Z4QYxjH7MHcSkawq3fVx7uiqEmXrnTdHLPrYX4BF2Ny8kTCQ0eNpQHBcT9je1PoT3R4HBsX/EGNw5wLa614vWpJgXvj/AxNMhmdpq0hvvtZfHUb/j2awAH/MCy0zqNhmR14HkfULIgByjXOYvWdBQc55RIfwU+zjJSN1pAdGEqZ+pAPEXckQHvYqjqzVxscEzSDJTJfWPN7Fgfo+tD62vXd+dhmHrJ3tJvjLk49Gta1hNScjV3CwPWQd1gRxpBqTmlqA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(136003)(396003)(366004)(39860400002)(376002)(346002)(451199021)(1800799003)(186006)(4326008)(6916009)(316002)(2616005)(66946007)(66476007)(66556008)(5660300002)(26005)(41300700001)(6506007)(8676002)(8936002)(31696002)(54906003)(6512007)(6486002)(478600001)(31686004)(38100700002)(2906002)(86362001)(36756003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?S2g1bHErcHUyRGlOa3pkMVVmbTMxSkdqZi9CV2hDaEJhaDhvWXNReGhkbDE3?=
 =?utf-8?B?YjBCblBBdytvaGZrN3lBZlgrSE00b1RoZDBWSkFwTUMrbktya3BNMVhoaEcx?=
 =?utf-8?B?QzFYeFd1NlE2ejJGT3doMy9hRVBXWDYvOHBmZ2g4aVBNdlk2UjNBMVhvcktm?=
 =?utf-8?B?UlowK1dkOEFzNWt3SldWVGNlQnJvbGw4eUJLRmpPNGxaNFUzdGIxK09PS1ZF?=
 =?utf-8?B?UjRMMmU3VUcxdllzNU1mcE0ydkl5ZkRqZ2o3LzBzWlROWEdNRmpVbE5LYTh3?=
 =?utf-8?B?ek85VkhDQjBMZ3RJMmhKcjlYaWtQVWphbEtscUxQZTQ3ZDdyODVNM2paMDVa?=
 =?utf-8?B?MjhUMVFsMDVWaERXS1htWmxVUzJobWpDOWZockpranBMQlVQb3FVaEpkNEpD?=
 =?utf-8?B?bHFKM1d2R0lYUCtsTFJrQUM2MDJjVHFDSU5qZXVuaWRXUHFRbWtnNU8vM0t6?=
 =?utf-8?B?VXRTc0VnN3dDa2xCSzNVRXBHL0tsQWV1K2kxQWJtak96VjNTcGhZdkJZODBk?=
 =?utf-8?B?NUV2QXR6ZXBBbGtqN1RsdVVZL204UVlRRVlCWW1kOEV0VnBEdjR1WHN3TGov?=
 =?utf-8?B?U1VHYThia0pQZklpOGpaTGlXRGNqOXNlS2ZZbURGN3JWcXluMzVvb292cXdR?=
 =?utf-8?B?QTJlMnRvdy90Ky9YR0lpRmR3WG1UVmJwMzlUWVR3L21XbDEyMXc5aHAwSncr?=
 =?utf-8?B?UkZzZmg3ZjJNSkZ2Rmt5SW10U094bnM0SnU5MkRQTGVWK1FjYTVOL01QNjVJ?=
 =?utf-8?B?THFsYWJQOEZ4emJBSE1XYllyOVhDbUZIN1dsSTZuaXJ0and2R2hMc3VOTE5P?=
 =?utf-8?B?aGZhYUlraW5XWnNZY21yT2J5V2didXB4Vm9DTUQxVVJzMUVEdnQxeWtneHpY?=
 =?utf-8?B?TFp1MjVITTNQMnlGY1ZZUVI3aDB1ZGV4MGZaWW9RWjNxbjRtV0UzSGhudCtD?=
 =?utf-8?B?TllrU3RZTHJkU0t1Zit6RS9zUE1BdklGNjlvYW9vcml3TGdLTjNobTBpSHJJ?=
 =?utf-8?B?bjZ4c1VudUlTdm5tb0k1V2ZiY1dCQnlCTHJXT3ZhMSszSWZaVkRNc1VsL1Nn?=
 =?utf-8?B?aStyUDdqTmNkRm9oY28yK1k2MG02UnNpbXBaUHVQaGdhaFp5RlVWenkxWFFp?=
 =?utf-8?B?Y1RuMHBmclpOUXl4cEVQMzZrSzRaVjJnRkpMaU56dmRDMWR5NEpWUWx4VXBV?=
 =?utf-8?B?QXZ2ZG1aOVhRWjlFZGFpQWNuN0ZVWHdWUmlmQzBOTjArS3UwSFlDblBUdmtC?=
 =?utf-8?B?TjE2dW5MMTQ1dk9JbGY3dTJtbjd3RTJ1VXdjWXVwQ3hKTkIxQUh6R3p6ZWla?=
 =?utf-8?B?OFdsc2N0TTcyTmNnWVcwS3J2NXhOY2tBekN3VFhXcWdVSnpvTy9NUktiVnNF?=
 =?utf-8?B?bjVqMDNGY094UXVIcGhaemgzRWd3dU5RTlVGM1RqandWczdsSEZDZjdmaFZh?=
 =?utf-8?B?NGF6Q3JBVFBrUlRkNklqQ043OG11a3FHYkFYZ0R3bnlWYnBJalVuSXhhL2cv?=
 =?utf-8?B?N01yVTJGQVJIMUtXSXBtZmhKMVRtTUMySFNocHo5bCtwSGNQVlhEM1hHYllx?=
 =?utf-8?B?SjFBQUpoN05FY0NFMGZJQUJFU25JVFJpc1NaeTRYM0hoejF6MWdQbVpQQ3NR?=
 =?utf-8?B?Q0x4Y3I0QWJsOEphN2JiWHBEcEhTQXRxYWR2UjN4MzUyOWNiMlRVcDh4Qlpi?=
 =?utf-8?B?VmhaL1V2b1RyOWtyYU1PNjByeHk0U1FudFZEeURjS3J1aW1saEpyTjBjemk2?=
 =?utf-8?B?VkRNNDdUUXdqNVp1WG5HRXRzRjVVZkttdnBnTXFMb2JSMHk3b3pZclVKT3ZU?=
 =?utf-8?B?NTRUYmRpb3VrSktDeTVhbzNkdWgyYWgyWm1mN25HVlduNGlFKy91aFNSWi9h?=
 =?utf-8?B?d2MzV3R6cEZ4b21lODcvS0FaWnEzVnpBcFBVVnF2SDBvMnVhdE1USTNrZ0xS?=
 =?utf-8?B?TisxL2Rha1QvTGlMUGdLc1RIT29iS25aeUVZb05rdis3K25MM3ZmZmdPR2Fr?=
 =?utf-8?B?WUFPVHY5VjhCYm5Md21uc1VLZ2sxMWNXaGxSd2F4bEoySW96bzdYN1MwM0Jr?=
 =?utf-8?B?RXRZUHlod1lxZldzb0J2eUdNbE4zSjg1eWlLb05USUpGaXE3MG9RTFYzNDh3?=
 =?utf-8?Q?OVpcZKyLRx+HC4dpf8jxlI+Ro?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0ced7ace-56d8-41c9-db83-08db94b3f2bf
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Aug 2023 06:27:59.7027
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3D4AWl7BLojvCUKyhf9Z5B67qSTKpxebycLVSTdXNGhweR111Ope2gEOAzgh5GTKyZkisWs3kMeX3wVy3HFewQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB7549

Let's have assembler symbols be consistent with C ones. In principle
there are (a few) cases where gas can produce smaller code this way,
just that for now there's a gas bug causing smaller code to be emitted
even when that shouldn't be the case.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>
---
v3: Re-base over generalization of the annotations.
v2: New.

--- a/xen/arch/x86/include/asm/config.h
+++ b/xen/arch/x86/include/asm/config.h
@@ -47,11 +47,11 @@
 #define CODE_FILL 0x90
 #define ALIGN .align CODE_ALIGN, CODE_FILL
 #define ENTRY(name)                             \
-  .globl name;                                  \
   ALIGN;                                        \
-  name:
+  GLOBAL(name)
 #define GLOBAL(name)                            \
   .globl name;                                  \
+  .hidden name;                                 \
   name:
 #endif
 
--- a/xen/include/xen/linkage.h
+++ b/xen/include/xen/linkage.h
@@ -21,7 +21,7 @@
 
 #define SYM_ALIGN(algn...) .balign algn
 
-#define SYM_L_GLOBAL(name) .globl name
+#define SYM_L_GLOBAL(name) .globl name; .hidden name
 #define SYM_L_WEAK(name)   .weak name
 #define SYM_L_LOCAL(name)  /* nothing */
 


