Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C2065983AF
	for <lists+xen-devel@lfdr.de>; Thu, 18 Aug 2022 15:04:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.389512.626481 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oOfBq-000795-Hg; Thu, 18 Aug 2022 13:04:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 389512.626481; Thu, 18 Aug 2022 13:04:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oOfBq-00075r-Dx; Thu, 18 Aug 2022 13:04:02 +0000
Received: by outflank-mailman (input) for mailman id 389512;
 Thu, 18 Aug 2022 13:04:01 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=1x1s=YW=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1oOfBo-0006az-Vg
 for xen-devel@lists.xenproject.org; Thu, 18 Aug 2022 13:04:01 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-eopbgr80054.outbound.protection.outlook.com [40.107.8.54])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 39dbf736-1ef6-11ed-9250-1f966e50362f;
 Thu, 18 Aug 2022 15:04:00 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by VI1PR04MB4685.eurprd04.prod.outlook.com (2603:10a6:803:70::25)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5525.11; Thu, 18 Aug
 2022 13:03:58 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2d5d:bae0:430f:70ad]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2d5d:bae0:430f:70ad%4]) with mapi id 15.20.5525.010; Thu, 18 Aug 2022
 13:03:58 +0000
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
X-Inumbo-ID: 39dbf736-1ef6-11ed-9250-1f966e50362f
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VycxG/A6hA+c7n0s7H7T28xfAxqTr3006kdDywr+qsjCzYWdKb50gcZANSC/08BlSrnjXzVLNd4yV2RmxiQSNRs3GTprHLsO62Y7oXTrbT3ub+0/4UlUyYTOpnYEi0po7DEa/PeMoVJzEHnIux5kptEZeVhE6BXrmn71skXMUp1uHyMK6l2/z55Xz6Iv0yK5Vgi212Q9SKWSFCahlIu285gi4kW23W4kAtX0RnACYqzYOXuSSYWDOGSo4aVLaoFObJzd/fmyDGkuDEwkS85tQQwwptjCRws+yU+BwiNYUXClozvfrxsLCpKqOGu11NRWgBt0HVGLRETLT1mvrd7Rkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Q1xcR1YrekDly/6j+fddD6c7EDtW054iEZ9k6oP7154=;
 b=XakYcV6iB4EwG13VDy9k8lnm07z+A+jXZBuQQQr5FX5KmDZhLfCZGjsmZJBNWCJh5/t7Hwi1LkC0NrpGTAF1/F+Mi9l/HlhpxlIo1zEBBihCGYUIox7/Zv+ADoa3wLpI6pPrk7HXG/ulI1aet0zs0iclhM8rF8fN8wbLxHZOhVdN6ynJMwRJyL4aAiNdCGjVBhDFFgF0sEhx6q73RoLnEE5ixGWKZ3x+NN1VDlJRbaT+ZPiPF0tr3+qoduubjyy7muHR3R6KEsfW5BA271PBvogclpuLE6G3VqpUgH7ei4PurHsSW6ZsFUTIP5VaStp9CLqo05PNLCQy64Z6rD3Icw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Q1xcR1YrekDly/6j+fddD6c7EDtW054iEZ9k6oP7154=;
 b=RT8Ejjd05uf79z2Er0em2GMca6pdFkJG86Ck/1idw2AwF3STZjOMOrIlgvlB9e39IGxKhQXtWrnbcoSDn3Q36LfH2rUZ04hugnx1U9c+eb2STChKDgVZ0S3e0Mq1ZFT8yxiI9f8vB4SzHgqJwL9rKarfx2XmHN+t+2oQA7+7B7uJXoX4Ou5j6igA4LhvKjj0Ab5qtsFwwRf2ye++vtmXNpuaeZ8fssk1dSwrP1ukZvz79ovBmtXAYoQ6lADhsLVslL4qRIE1WbVyNyPmXAkAdkFzaE57RfU8gWfOEYte/coQ690BT28DIGFsb6K6vywTwy39d9To7Dxdn+GxqTOIIg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <56364ce2-3b4a-43d5-2161-6354a4aa9dbd@suse.com>
Date: Thu, 18 Aug 2022 15:03:57 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: [PATCH v3 2/5] x86/mwait-idle: add core C6 optimization for SPR
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <84200e9c-ee22-c240-826f-6c7006c0ef57@suse.com>
In-Reply-To: <84200e9c-ee22-c240-826f-6c7006c0ef57@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0001.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1d::10) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1a205b41-8fe6-47f1-d296-08da811a1d52
X-MS-TrafficTypeDiagnostic: VI1PR04MB4685:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	BkRDGIe+f86MAvIz+3igGrI6UlZBlWH0u6EYQcGXCHdOjyguLILTePqSqylnF1Sy9VbHu3184F++AwJldgqN9ZCC7wxhl6IIhNrGV+mf0x/6mWfOXoJhkWOFFAi1WvbjtaNaJ6zrToLFAvmEhqGEcoOZQpiWAyNJqyyh2HPR/WlxbKeDFKxYUxHQRtoONVnatXpvXak8G4zTDg0g8VaRc/K9MBvLDobGo4ck5FRqM0Gn1blLT3FWL3ipzMGCqbOH2szsqFEMCMqW5Z7f33Tn1fLQntxngtuU2YP7xMiEyTJdnZcfhjplyNwOv02LKFagnvcVB7NRA/ahxDD+HkT0ZOoFX+sb5k4VruuihHtd2//vT/3CQBoKznoElY1nwXFwMAUqQw7yIssLYkXXtDo8eQvo/d+Du4TDhMUG4r/FbinW3fQQxKwP8gWhdWgFA4RwqbjpTr3SLqWQNnlBmH5ggPv10IHa05VbH/PoiZq53/bCqL4INUYD65I6T+aNl0pvkZWhgXVbqNHJJeSl7if7PtKhF9m6HdMwIBgHwz/jpgGIm6It1wpY07KbDVYwQHnvy7lU52smK0sfDlrbtaPrv24B/loCBL0o4b3LYgZmCsolmYzvXgNt6JqNUZVPzRYYXIzfrIHjmlQRkRt1DqwT0NXfkJZ2QgKqUvFS5qlvgHFoUqASwp1Qz9fyaN5IFSkC8Gp9pDW3C8WiCT0YRiSUW+nA61CIO2WvmqT/BNBFg1aYSpRceWhOq3tAir/3JfO2Yl9LjwkIPGpHtlMisxFe5192guk/LZzflvjvFkbOl48=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(396003)(376002)(39860400002)(366004)(136003)(346002)(31696002)(86362001)(38100700002)(83380400001)(186003)(2616005)(31686004)(36756003)(6506007)(6486002)(54906003)(26005)(316002)(41300700001)(478600001)(6512007)(6916009)(5660300002)(8676002)(4326008)(8936002)(2906002)(66946007)(66476007)(66556008)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cHMxMUp4T2pCazUxYkdjT1Z5WnU3bHoyaHdrb3B2aWxNbC9neGRXVkZmNmli?=
 =?utf-8?B?aW0rR0ZVUGJrUGJuNi9qRzRSN2krc3lZUkpQSGhydlpkM1pQREJ2OXBJL21k?=
 =?utf-8?B?SUEva0FjWDMyU2NtQ2ZTYm01MHZZUk11WlVrdm4rVm1mSUxKMHZxSk5tY0Vm?=
 =?utf-8?B?OExncDN2UFE1cUpFYWp6MEZCMERQcndVdzVmT0xWdDRTZVpvVmNRVnBHYkpo?=
 =?utf-8?B?K3BPWkRUVVVIS1NYMWZlQXNpNE1Qc3dQUHdNQjNuSjJ3bjB5WjYrZWtPWENK?=
 =?utf-8?B?QkNpMER5bU1FblV0VHAvN1lISk9mdzlJSVN5eS90VklmbHgxai80dGdGTk01?=
 =?utf-8?B?N21YOWNqRjR2Z0l6c3dJR2M3QWk2eDVrdTFDZEtBMWMvZzFRV1MxV2NpMkVw?=
 =?utf-8?B?MWllR0xtMGd4K1pvelJzemtsSHphYVFYc2o4eW9JZ1pOa0NRckJ3Vk1HRDdl?=
 =?utf-8?B?clRlNHdVaDE3cy9BSEVtMHRUNU9IVmo0MVFKREx4Mm4vYmxrWllQMEMvcE1w?=
 =?utf-8?B?R0JZbnZFMWhQS0tBRnB2bnFJdHVqUTVpNUtlYi8zK1orODEvSnVoU25VL3Ra?=
 =?utf-8?B?NlV0NnRNWU9VQmxrcnlzc3IvYkdaZ1RWNEFCZVFKVGl2YzFMc2ZmY3hJbjY4?=
 =?utf-8?B?OTFQajVpVzJlai9xOEpYK2doWVJOemNpQjhaVWxPN0I4RU05QUJSY3ZoWm5X?=
 =?utf-8?B?NDNSN1dnVlMvZUFoWndScENZRktzWi9lNmF4TXFCNFltclhSaWI3UktQd1ln?=
 =?utf-8?B?ZE5ZU0JIWmRpamJZZXRFZTQycTdLSGMxaTZpR2ovbk1ENG1NT2pZVTR0WXdh?=
 =?utf-8?B?cjYzVHFBWkpJUnZTOUZKczdVZ3RxVUZTNStuVnlGWlpoaVpOaUJIN1N1b1cx?=
 =?utf-8?B?ZDN6QVptM1lObDdzenNQWGdQaWdoVHhwcjl6UHFUOGFBTlZ3Nm50V0tsN1ZL?=
 =?utf-8?B?dXloUk5ocEt6d1R4SHZUZXBWK1VOSWhWa2d4VnRCKzJLUVU3RnZZOGZiVXBD?=
 =?utf-8?B?dUg0bVN1ck9McmFiNXpXQ1hzRDJ4UGRoaFRSVnlsZmJaM2V4dHkrVTg0dVJu?=
 =?utf-8?B?UHdnbVJoZjhaOGM5dzI4ZkF6ODcwV3dBV0MxUWYzdWF5V1dzOHlQUnNQWktW?=
 =?utf-8?B?cUtQQjRiNzNTS2RianMwcm1raUdiZ0dWY3BOeGpkVlhDeHVZMXNKTDA2T3Zx?=
 =?utf-8?B?TVB0eVQ0b2tvdFh5b1FQV2o3SGN5NWgvMm0rMmlEY0E3bHB0QkdQNDBNUEU4?=
 =?utf-8?B?T0EvcGQwZWlETUpNUVJTdGgxSCs4WW90RkpxNDBiQVNzbXEwckFnK2pZU0c4?=
 =?utf-8?B?T0svMFZoQkhpT2p2VjMyUEJRbFN1bUVhNmY3ZTgwdkx2Qm5TQ1dEQ3B4Nk5z?=
 =?utf-8?B?TzBrMVFVeFEvRjZQYmxyNmhDSENKazJuM281LzNUSVlFdmRISXYzY2RsLzNL?=
 =?utf-8?B?U25rcFhkNW9EQThQcXFOQWE4YjNNVjNFcDV4TndzRVRBcW1zTXQycDJhakpk?=
 =?utf-8?B?bklSVjBVSDh4ZGdvaklodUZFTTA4TnpwMysvVStlNHBPVnlKVHErcGxqUGxU?=
 =?utf-8?B?aG80UGRhSkdSb093cXZTMmUxUG9tcUt6cDJNa21RVUxRdnFKeFUwQlFtRlBP?=
 =?utf-8?B?cWZlQUVGMll6b2tHQjNVS2JYV1UyZXRpOWpqZHlvc3JkNWxBVG1RK29GbVBC?=
 =?utf-8?B?TmZtUm1LS1pOVlBUUWFIS0RkTWttaUhoM0toTlZDUVVEQWp2dk5wQXcrOHhi?=
 =?utf-8?B?MjJyd2plYmphN0x6WUV1WlR4SGZNUHNBeUZrOWZQZVFFT1pEUXdYRmVrVjZX?=
 =?utf-8?B?YXJKTjBOMkIzSnlYZU1GQnB4R2Qzb0srWTNjckhYblJZbzVCM1pGNUw1Umh4?=
 =?utf-8?B?L2RFek9pWm5kbjFqQnltYWljUFI3NzhOZEI2U0N0RzFwNDFZbnpYbFRXSHN1?=
 =?utf-8?B?bDhCbXpBU0paMzdXUnB4TXNETUYwWklDRGZ1SDd1N3JOby9Ybnc0ZjBjQVdO?=
 =?utf-8?B?Ym5HQXRlcTd5K0RtSzhVamRGcnYzYXV1WjdsR2tENGVDSlFvOS9USm0reDJl?=
 =?utf-8?B?SStveEUxb0pVUW14MFhxYkVVaFhESlIxaHRPSFVTcnFoMndJNmJxcGI4Z3JD?=
 =?utf-8?Q?ypJpUiSMScm+EAzy53XsgIff3?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1a205b41-8fe6-47f1-d296-08da811a1d52
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Aug 2022 13:03:58.8071
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2TUFVaUukVmsbaVhEBJMtDVGaEZgCvN/2mEI/DsqxK0Zwh53KPsW/sADUPtPdnPtUxn2abaXXgAtfJUNB0dbuA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB4685

From: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>

Add a Sapphire Rapids Xeon C6 optimization, similar to what we have for Sky Lake
Xeon: if package C6 is disabled, adjust C6 exit latency and target residency to
match core C6 values, instead of using the default package C6 values.

Signed-off-by: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>
Signed-off-by: Rafael J. Wysocki <rafael.j.wysocki@intel.com>
Origin: git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git 3a9cf77b60dc

Make sure a contradictory "preferred-cstates" wouldn't cause bypassing
of the added logic.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
Acked-by: Roger Pau Monné <roger.pau@citrix.com>
---
v3: Add parentheses.
v2: Sync with the Linux side fix to the noticed issue. Re-base over
    change to earlier patch.

--- a/xen/arch/x86/cpu/mwait-idle.c
+++ b/xen/arch/x86/cpu/mwait-idle.c
@@ -1273,18 +1273,31 @@ static void __init skx_idle_state_table_
  */
 static void __init spr_idle_state_table_update(void)
 {
-	/* Check if user prefers C1E over C1. */
-	if (preferred_states_mask & BIT(2, U)) {
-		if (preferred_states_mask & BIT(1, U))
-			/* Both can't be enabled, stick to the defaults. */
-			return;
+	uint64_t msr;
 
+	/* Check if user prefers C1E over C1. */
+	if ((preferred_states_mask & BIT(2, U)) &&
+	    !(preferred_states_mask & BIT(1, U))) {
+		/* Disable C1 and enable C1E. */
 		spr_cstates[0].flags |= CPUIDLE_FLAG_DISABLED;
 		spr_cstates[1].flags &= ~CPUIDLE_FLAG_DISABLED;
 
 		/* Request enabling C1E using the "C1E promotion" bit. */
 		idle_cpu_spr.c1e_promotion = C1E_PROMOTION_ENABLE;
 	}
+
+	/*
+	 * By default, the C6 state assumes the worst-case scenario of package
+	 * C6. However, if PC6 is disabled, we update the numbers to match
+	 * core C6.
+	 */
+	rdmsrl(MSR_PKG_CST_CONFIG_CONTROL, msr);
+
+	/* Limit value 2 and above allow for PC6. */
+	if ((msr & 0x7) < 2) {
+		spr_cstates[2].exit_latency = 190;
+		spr_cstates[2].target_residency = 600;
+	}
 }
 
 /*


