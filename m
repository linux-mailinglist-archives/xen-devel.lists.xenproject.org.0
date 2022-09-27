Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A0E7D5EC5AC
	for <lists+xen-devel@lfdr.de>; Tue, 27 Sep 2022 16:14:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.412626.655993 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1odBLY-0007eK-Ru; Tue, 27 Sep 2022 14:14:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 412626.655993; Tue, 27 Sep 2022 14:14:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1odBLY-0007bD-Of; Tue, 27 Sep 2022 14:14:04 +0000
Received: by outflank-mailman (input) for mailman id 412626;
 Tue, 27 Sep 2022 14:14:03 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Kd8q=Z6=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1odBLX-0007b7-Lw
 for xen-devel@lists.xenproject.org; Tue, 27 Sep 2022 14:14:03 +0000
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 (mail-eopbgr130049.outbound.protection.outlook.com [40.107.13.49])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a31db5e0-3e6e-11ed-9374-c1cf23e5d27e;
 Tue, 27 Sep 2022 16:14:02 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by GV1PR04MB9515.eurprd04.prod.outlook.com (2603:10a6:150:24::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5654.25; Tue, 27 Sep
 2022 14:14:01 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::358f:58dc:c0c2:1155]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::358f:58dc:c0c2:1155%7]) with mapi id 15.20.5654.026; Tue, 27 Sep 2022
 14:14:00 +0000
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
X-Inumbo-ID: a31db5e0-3e6e-11ed-9374-c1cf23e5d27e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=C5O/9Ld5XvMqhhS7Aky6V5V/3rEtLCZRRmKWK4sWZUbqH/vCXVsxpO2i7/NyUjuWrM5eRJs8JhjeKKx/fRPbk5u9yX0FExONmgXOFEFZo1oBRnjWT/DceIiIHcy29TSEqwdJh9junW0qArYmXzr2GxIdpZbSig+RPmrXQKyevDh0FaM7pCKFukB/F2hLVZ4rVw9XuS3UJ399jkQB/RuLlLQ2uq4/edRS3ousiyHG7RKrrAEShgpIfsq/ut7bQdOk3ZOXRcvyzyHRc5ftony5IV77xPqF2Zx8smw+KscRYXhhnKNFvJ7MqV+YUwc3PcvhmgXaE2QTDMntYrZHAX04HA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KBwtU4JRJ9juidOk2OLyGM7RoZQpHcQkjF5H2maw6Qc=;
 b=PjoSQhmfI2PhhbN4JT/bFZYz9ep7I0o4kMkjtun8/8gVmQs//YaShcjb1q2G4vFlv6gpttHnb4w+r2x3RDGHr7KbaIvRLvlBiQA+eWJape6FG1FkeuY0XpdggkGnjn0mRVs2EDv8EePvs1OrFHjeu5YOtRilcrYAz0pZi9GyKG2CI3EQrfH0jM+h3k/THrSmWQl+1hP/CYuB7TXbzDif5gA5kETzLnlWd+ieT32WRRvqRHXYtPhB2VWqLscEfefBpFiIY/jmo4ivbN/Tq+d1ari+4lM4XcHyjQFjQUMuNQUeqzIjQ2HVcLrWYKwDoF9vQKq8ov8aZDLIPN5qlyOIyQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KBwtU4JRJ9juidOk2OLyGM7RoZQpHcQkjF5H2maw6Qc=;
 b=SWvR+KDmUtZIT9NSmRxJEy6dSDDFB5mB/8W6mxwwVp9oOUGGyFizLyq1FJ2iheXHlWEzPi9EL4FWz6RTs4kRIr5+0WXNAI8ca4IF17rl0D0ct8OWKgZJ1x5XXR8u1Kgv4ajV6c1JmfkJngsCG0Lu4n1WzVLNjJa9I1QVP1QmIFKUUuCFfGh0znpsTMRR6xndcV3swO8dLl7kcJ0MEQDeftaeTUHd/xr7EDOKK+JJhuAyLd0SUW0z7SAfy/NZm+3bLRgvY7blMv6a/ExoQFM8OOfc4i19THtTPYRsY6soxOrv1+obt32Awz0paPEhbQrbqYaKz63B9HAYPV3Z9wOAtQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <1c668e16-bfb7-971b-8c95-be63792dee16@suse.com>
Date: Tue, 27 Sep 2022 16:13:59 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.0
Content-Language: en-US
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH] x86/NUMA: correct off-by-1 in node map size calculation
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0069.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:49::22) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|GV1PR04MB9515:EE_
X-MS-Office365-Filtering-Correlation-Id: 09e49820-ee14-419e-4f35-08daa0928674
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	HXsysI/5+yJ51YyKJ1UptNB6syBrSzbywJHQLOkRs97cYoWePt0m/lqsPgPB8M6Q+nnijcTbawV3B8rAYsa7heoZzhd3YKg/t0LWWdBvhyb7AhHR1EJj8TU59pZOV+MvvNRau9d6IAaSQu08iXyDHdouVYc/987xUWXFb+9536n4GMadCqrFQZqO9NofApCJ2J+/gMPhfIkDFpijapRMYQ5L0To3HpbK7lq+Q2BgJ7zgt+9oNfccd/Sb3WKt46Tn2ARci9obuo0QnmbZOnhIyfGRJaRNFEBHP2Pw5Hz/aOrcUEpiW7BO+DDyguQsbDOfst33kRVRlVSgGjaSdWeOS3Z9sJC5kyA6NXX96OHFpXxmVnLFiXDju4j64AYUD6PtFc0PTGeUa/6TYbDdcgrHRsuhDkNrO+qseU2NxADKx7oTb5U88VaBSzaMV1l7vmQDSLrNN1XDqhjPDzUVzik9A0dblU4CrhsGT/U8aaNGV5P9yyKJuu8zo+ZGpO4zaEraa7jfgxZ1evjihhLlQ0eabwDuf5/8U9Unz7Jvn/2GW0VF0V1fHdVhO+tSlQMd+HUgu4BMiGIN06YOheZdAzEQUa5vGnTBJiZUWU/eobxsf05sT2yZkHcpQcjylPQOPx8HCyRD59DjHPzjBCRvYUec6f1vmaHSE4QjF7Mv6w1NDiQKJcrra+V9HhO9mjGOzcJ6bIym42R86ffn2etFcsrcC6qkHUjJ+5tR2K0pcQZhqRCaKEKBiIqqGXZ80lUHveR+kwfPQQaQ/HvjNmIcB4qAPx7jZ8sx75bBZBp3vjyHT6I=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(346002)(396003)(376002)(39860400002)(366004)(136003)(451199015)(26005)(6512007)(5660300002)(41300700001)(8936002)(38100700002)(83380400001)(2616005)(36756003)(186003)(6506007)(2906002)(6916009)(31686004)(478600001)(86362001)(31696002)(66946007)(66556008)(316002)(6486002)(66476007)(8676002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UURrVGZadU1HMjlBTUNMMlVpOFlab0wyLzMvQTNFUUZVeWkrTmM2Tnh5L2Nz?=
 =?utf-8?B?Y1QwcjFaWStXbkRDUjV2L0VMWlZZOWpjbnUxenBGcVpPRE40YnVvaWsrRVpO?=
 =?utf-8?B?YzNwbzJ0SHpVYTlPNk1zWG1la3VWOXlQbTBwV2lKbVYzVjVyWk4xSWxLQjUz?=
 =?utf-8?B?KzVNWUFPVTBaWHR0NWtaQk9jYzFwbVg0aFJJbVArakNBb0lPOGIzY3c2ME02?=
 =?utf-8?B?WnlTRlY1OTBpVUdEcGhiUE5yWEFsc0o5ZkJTVXFJQlBYQms3YnAvNGFsRGxY?=
 =?utf-8?B?M1ZZVzdSMjVjVGJqcFAxb21xVzJyMVpqcTlDR1A3WEpud21DbzRORitCM2pu?=
 =?utf-8?B?NFlpZDFXMXVSMXBvWTB0Mjg4MnFENlU2WCswVDRjdWRqVHpyb0NWM0M0YTZ0?=
 =?utf-8?B?bTYzZW12RXpqdDdjUHBtRVowaWFzcy9WdnJoOC9xUkpPNWRDaXM5TnpqaFUw?=
 =?utf-8?B?dkFKNk5OOW1PK2FiWFpES0tzbmY1YnB2WVVTTHk2bFlZT0dheExrNjAwKzdp?=
 =?utf-8?B?aVlrMDlsdTNyT1lNQmF5L01pbFlXa2xoeWt6YTk2bXQ4N0E5Z3JBWUZBSGZh?=
 =?utf-8?B?SW1iMmFsVm9rT25hcGhRMVVDSXFuMEpTVnVJQzZLT0ZGZ0VtbjhodE9mK3Nl?=
 =?utf-8?B?Z3hBMDhuUk8wM0ZQSHdVYnlSY2h2cUNLQVZzVzUrR21tN2xoNElxYWkyMEJ0?=
 =?utf-8?B?ZUVvOE03VHBNVjR1aVMyL1FvL0tXYmR6OVBmMHBMSHVxMThRU1VDd3dKQmd1?=
 =?utf-8?B?VU9DVE5vTXBHVmNVOXFJOUFTbEtXL25UcnI4M0lScWpmUHhUaTFMc0tFNWtz?=
 =?utf-8?B?WWZLQnV6Zm1tUDBuUVFST1Q1M0tJMFFReUxaTW1HbnFRMTllN1FBMk1kUGNX?=
 =?utf-8?B?K3F5TTc2cXU2NmZnN0J0RVRET1BVM1JNc0FKTEFjYzRCd2VGcTlKZlJPU25B?=
 =?utf-8?B?cjZvMW9xWVJFdzFDL1lpdlR0RWJ2dnFPangrYnFhM0FwaGdGdDIxeU9VQmY2?=
 =?utf-8?B?Umc3U0pTUEJEWW5Jd0ZyK1d3UkVQbmg2ZmtSZzRaQXhiK0U0QmNBY1RqTTAv?=
 =?utf-8?B?UzRscllIUEJjOThtVS9FY3pPdDNpb1hJM2p4V3BUeUJqWlhpcXEzaHJZZUF1?=
 =?utf-8?B?cFFVVzFHWUFLaUJ1SmNWazA3dzh0UHYzZDA2ZU5TSDRzMTd3bjh3K0NYWUR6?=
 =?utf-8?B?T2VBR0p3VnpBTXlGT1BETFhPMzFyYU0vYlBKQ1I0WjFRS3RGV296L1hoTTFL?=
 =?utf-8?B?VG0wcXM5VEpGUHpKQVRwUVdyckVIT21DUkUxVmNXa09JZHpJSXAzSkxnL2h1?=
 =?utf-8?B?bW5NbzZFZ3BZU3hHRjJ3Vm1TbEhWUmJLUGxsUE5EMGdzTlNrUWxFY1JuQjRI?=
 =?utf-8?B?dlp5MHRyMTVGUDdpcGtCVnVWTDJvSjdYbFZOVlQ3d3RJazQ0N2JVaDdLMmp5?=
 =?utf-8?B?U2dUTTUyclpKU0FJaTE5ODRnOUhtRjZnaXpqamtTS0d3bldWTTZaeExNajIr?=
 =?utf-8?B?N2ZOaEdpVDdCTkx3bmpzU0EreXFmU1NiaFVJQkJTQ1hNbmNyYzRGYW5SYlhz?=
 =?utf-8?B?SW9Hc0hsa2ZmeGxDTnR4YWtCMkVHRFM5bGJKSjdpdHdxYTFyaGprSFhFd292?=
 =?utf-8?B?MzZsV2dvRDkyS1I0REJZdDl5RDBvODRiMzFsRFR2VUpFWWxBbXRWdmkvc0NP?=
 =?utf-8?B?S1VJaHUwbk5yZEs0SVJ3MjJtSGZHU0daVDFwNEdORm5qV3JXYmFlM2VVeU15?=
 =?utf-8?B?RVdNTVdUemVRTjRUNlU0d21CUTFtaURrbTRWWlJ3dHdSQWs0OEpOR3dpT0M5?=
 =?utf-8?B?YzJXQlNNVXptTkYvcnlKKzVjeE53N1l1dGNLTlN3aisxWU9tbHVLdFVuOU0w?=
 =?utf-8?B?U2s2T05HM05ReDRaTkUvanJsdU5rY2xVRjFnRmprZ3FMdlFJVE8yckZtZzZv?=
 =?utf-8?B?TnhLa2J5djRQbkNDZVVydk1BUnR5dm5pN1M0VXRzOXE3N1l0dWd0U0lHaHZW?=
 =?utf-8?B?c3YxOWh5RzREYlpuMFhoWWQ2UVIyVlhMZG1NMXNaekVSSjU3VE5kUkZZWU15?=
 =?utf-8?B?UW1pOVdaZ2t1TThKbFNUNjdjUDAyMks3NmpDM0Y3RS9kdGl1TVFzWC9aWTRJ?=
 =?utf-8?Q?NGass3rJh0NfiCO1XokW8RO8X?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 09e49820-ee14-419e-4f35-08daa0928674
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Sep 2022 14:14:00.9035
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WqecTQE1/R/eE6YkkoZSOFzFWeWU9k5Ou43fM78LipOwkTrnOYBTZGokO9JKrqgml1DVRTwDhjIWnauYYG7K8w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR04MB9515

extract_lsb_from_nodes() accumulates "memtop" from all PDXes one past
the covered ranges. Hence the maximum address which can validly by used
to index the node map is one below this value, and we may currently set
up a node map with an unused (and never initialized) trailing entry. In
boundary cases this may also mean we dynamically allocate a page when
the static (64-entry) map would suffice.

While there also correct the comment ahead of the function, for it to
match the actual code: Linux commit 54413927f022 ("x86-64:
x86_64-make-the-numa-hash-function-nodemap-allocation fix fix") removed
the ORing in of the end address before we actually cloned their code.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
Really the shift value may end up needlessly small when there's
discontiguous memory. Within a gap, any address can be taken for the
node boundary, and hence neither the end of the lower range nor the
start of the higher range necessarily is the best address to use. For
example with these two node ranges (numbers are frame addresses)

[10000,17fff]
[28000,2ffff]

we'd calculate the shift as 15 when 16 or even 17 (because the start of
the 1st range can also be ignored) would do. I haven't tried to properly
prove it yet, but it looks to me as if the top bit of the XOR of lower
range (inclusive) end and higher range start would be what would want
accumulating (of course requiring the entries to be sorted, or to be
processed in address order). This would then "naturally" exclude lowest
range start and highest range end.

--- a/xen/arch/x86/numa.c
+++ b/xen/arch/x86/numa.c
@@ -110,7 +110,7 @@ static int __init allocate_cachealigned_
 }
 
 /*
- * The LSB of all start and end addresses in the node map is the value of the
+ * The LSB of all start addresses in the node map is the value of the
  * maximum possible shift.
  */
 static int __init extract_lsb_from_nodes(const struct node *nodes,
@@ -135,7 +135,7 @@ static int __init extract_lsb_from_nodes
         i = BITS_PER_LONG - 1;
     else
         i = find_first_bit(&bitfield, sizeof(unsigned long)*8);
-    memnodemapsize = (memtop >> i) + 1;
+    memnodemapsize = ((memtop - 1) >> i) + 1;
     return i;
 }
 

