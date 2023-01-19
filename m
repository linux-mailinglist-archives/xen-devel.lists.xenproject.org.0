Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DF3386739D6
	for <lists+xen-devel@lfdr.de>; Thu, 19 Jan 2023 14:19:41 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.481036.745724 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pIUp5-0000eN-4R; Thu, 19 Jan 2023 13:19:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 481036.745724; Thu, 19 Jan 2023 13:19:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pIUp5-0000bh-0W; Thu, 19 Jan 2023 13:19:19 +0000
Received: by outflank-mailman (input) for mailman id 481036;
 Thu, 19 Jan 2023 13:19:17 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=DP+J=5Q=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pIUp3-0000DY-Hp
 for xen-devel@lists.xenproject.org; Thu, 19 Jan 2023 13:19:17 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04on2061.outbound.protection.outlook.com [40.107.6.61])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id df24041b-97fb-11ed-b8d1-410ff93cb8f0;
 Thu, 19 Jan 2023 14:19:15 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DB8PR04MB6841.eurprd04.prod.outlook.com (2603:10a6:10:116::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.23; Thu, 19 Jan
 2023 13:19:14 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2991:58a4:e308:4389]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2991:58a4:e308:4389%7]) with mapi id 15.20.6002.024; Thu, 19 Jan 2023
 13:19:14 +0000
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
X-Inumbo-ID: df24041b-97fb-11ed-b8d1-410ff93cb8f0
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lzjzR4+FWN5lJ6i+PeyCgmB6LvWoUsBmXtVYOv/mjCn7EEhkrRH1rvIi4l44KhPpMDzmquqwXUvk2v5zk4Y8VmQ53JEMf/KwZ97t0vujbLjaZP+iRk0vkRY8WEkPO+iBttEVLZWN3DD2eYc2pTYLXI5wP02ju/HnQqBH/RADinCMjmaTN6n/lusFpUtuGsn9YSOUyGhnc18farGZcyizKhmdqIFMcm3JQeU9zdpNKmn+YkbAXAqnThcwUV3f+ddNK1KNpUFaLcGDfIEy8jtU5gvVC9SIi7BhFUWp6v+uYfP7wejhu9WTn0CAP8bhweDWU4Pn5KCCY18CALvLbyTxJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AitU+pHKk+enzQgMWj+BP+8JFiOp/gFdjRqxb0m96BM=;
 b=JtqbaSJSW2UxZcmeVZ8ngXPT5p9xIWEkDNhV6j8LXfOp7FHUTdsdVPYu8ZLzyfnUwU5S6KOQUnT1YnLlv3+/VaQZ4vfQbYijf5A8NQzEYWMaUzPGktUYchUatjlXWFDepOlGwwqAOGz+HILVPGqZsTRk1dQCo9qhI7t5hJLTRaDMzkIWCMfftC3ku/50GospYtjLS/Q3kkmMmGSdp18nxsN05ebhNqeUNVz87K1jGDqqhzod3hxCwSEJsTaHGOLsVp15G/NiX2CrAiXk/aX1ui6XshDQLCiVyBlHpNkbazc7ze+RQSm9YwttkyHJtbvZL9hRsViH6VCAahPDkakERA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AitU+pHKk+enzQgMWj+BP+8JFiOp/gFdjRqxb0m96BM=;
 b=5eYp0SKJ6di5e+aWjigiA5qpCG71BXx90ZY+VT8iK1F157pr97BflbhMspwWRyueb1LT3gI25WTQVblgLqtfaK4Ajj0VfcIH5D/9rg1XiEVfNy5MJboj9n3aNlTV47N4q2rexOTFhskHQkp64gy4aWN8Lbr0r9sfVxJGVByTwUk14XFOwP4fCAgpX8VPwOR1Z+KdgN7dzThNcdtWrp8sTF+oCjR3N9rdQILlDmmOQ8BnYKzB0knwvS9LR+PiuibJSGfhE9pmqJjBqlpfHnrBVJBJW6wTo3sd2ZXvJJrQte+SeRv4tUR+2yGxuVkByiz6dfGgtidfPPMg0p6F502u/A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <bf03f851-2fb4-3de1-7d72-b0ac15b2d488@suse.com>
Date: Thu, 19 Jan 2023 14:19:13 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: [PATCH 1/2] x86/shadow: fix PAE check for top-level table unshadowing
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Tim Deegan <tim@xen.org>, George Dunlap <george.dunlap@citrix.com>
References: <9e79449a-fd12-f497-695b-79a50cc913c7@suse.com>
In-Reply-To: <9e79449a-fd12-f497-695b-79a50cc913c7@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0176.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a0::11) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|DB8PR04MB6841:EE_
X-MS-Office365-Filtering-Correlation-Id: 7ea97159-7d68-4154-c55e-08dafa1fc269
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	5pmQA3/qMFTPFyRaPd4OSmrCeoOtGrIyK/ZacvjvNpAzYQnTEmUYKcNjuOBe34X2ZAm1VqAHPisVtIn/pdpRHgl2A7iRLqkLvj9odgAo563B0NTgfnM0XXs5slyVwflcZnJxAma0JJhEaSwADBZlVCZdU1wb4l4dRENmDqYReYFATGzDdewcejyx6w+7LxmBqpPgtRkpFdEk+PTqcW7Di5S4EmclrlMfvbEOjuVl6+siLlQoJsECiRGJeQQ+xKZuohA9XL9L9XhrV9UjOtJBwzDcRgLc4zgB9x1Kriu/5CCJXVqnZDndNDj6U2JEa6qst5oBELJCig3i2lP7s2G5tGg4ene3z4QwbvGwk2faEHvf3nJV0qlezw5DFBTisbdNfMjLlQV8ISk2Jl1/WdBob6agRblXV7xgPyZhNdWaUr2PWP//cXgZXW3IFVTlhdXvpQW/Qz2crXy8fJ1E4y2r/TaURzgOryQBfN7aBveLh88bEmD3y63csQpoQeUOkKsr9k9rYfyUXmkTO/1XzB6KxmoNKvkrKhBQGEZuHcZSgiCQ98UgX/JkPyNm3P/+mnBr7xgJOv9S3THScL9LRxL/p5w/tA2ppD9r70vJxBgGFmC4uDRP9bBJhMUUz0WyT0v4l31bVLNnJtFJ2Jfu4aneKOkgVqgYnPsYld0S2fnnx3K0fofMmv92QGzCTFVBLhoOHgr2RsKGIe2m8Zuop0mauY48d9THH6dt4CVlTpOrgBk=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(366004)(39860400002)(396003)(376002)(136003)(346002)(451199015)(8936002)(54906003)(66476007)(66946007)(4326008)(6916009)(31696002)(36756003)(66556008)(316002)(26005)(86362001)(6512007)(2616005)(38100700002)(186003)(6506007)(478600001)(6486002)(41300700001)(5660300002)(8676002)(4744005)(31686004)(2906002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?YndnK3FxYnlSOENtRmxTSzNCSHRKVmJZbC9uZ0FwSzhFT1NUbG9RamJaeHhB?=
 =?utf-8?B?dWpva3BESmRzMmdBMWczMi9UZ01CM2t0OHZhZUdEMWJ6c1RxdnJ6eXBTU011?=
 =?utf-8?B?YWlWaE5tWHZoeU9paE9mY0FzeW1Xc0dYMllBcDFsMlZLLytzUFArQkMyekQ4?=
 =?utf-8?B?NU9Tanp2TndGM0tqRFNqUkozSXczYXNLQW9Ld09nb0ZIeXFlWmh3NXBXakkr?=
 =?utf-8?B?endyT3hUallYdC9uWU5Ib3NZNUlZcnlDWWZKUUNwMXUzWHRjdTlNVGI0anJR?=
 =?utf-8?B?MzdweVdLR0RIYXNEdTFOOEpCSi9pVHQ5d2wxUTdjRTdWbEVIRU9HcEN2TXdW?=
 =?utf-8?B?VmNaclZnQlRUZkhpclVFWXl3QnE2ZnQ4SmpVT051RDRSMGlqdUpNWjJ5Z0kw?=
 =?utf-8?B?TmJyRjJBcFJSYlM3aEU3bVM5MWpreHJIb2twUU1iaUFPd2NSWFg3VkFtc0Nx?=
 =?utf-8?B?Ky82RW1qczNVVWNwQm9HMkM5WEhBNHpIbEZrZ1JuTnIyVG5qZGNZN2dyNjF4?=
 =?utf-8?B?bFlsZVFYQXphVWwyamxqQ1Y5V1FjRG16OEdLQnJvYjI3VlQ2RVRFa0pIVHZw?=
 =?utf-8?B?VTcvQ2hxM25Pd0gzRWNGbFBpdktCUWNOTkNReWFwV1VpWmlWSFFsajNjYndO?=
 =?utf-8?B?dWFKTTlGeUlHcFRpVHZWY1N5bnVQOXA2ZklVdkhaWGdGZTd1NzJqM3FmS2Jx?=
 =?utf-8?B?MUFFUHNadmU2UUZET0w4cy9qUUlBbTRvWVNMNi94L09lMVUyd3JFbzkvOElX?=
 =?utf-8?B?czRJMkx3R2E4N3YwZDVjTXBuZFJ1NlRmbHhrTVBrT2VvaTlJTEs3SDEyUFZu?=
 =?utf-8?B?Q0J3VkRXTUVKUHJCUDdyd1ZDNVhIcjI5U1FYSXFnSi9DenRTaWJWbUNpNjBp?=
 =?utf-8?B?cDZSUE1nYkFyaU0rL1NXSFRpQkVYUllvVks5dXdYZGdrc1NuaU5MTTIzMlBF?=
 =?utf-8?B?VFdhSUt6SW1IQlJMWjY4RGNVOGltVHVqdFlRSFlwT0ZhZFZ6N2xERmRqK3B6?=
 =?utf-8?B?L0FTY280WC9IeHd5S2xWb3pDdU9qWCt2aVhReW04ZktLbW5oOG1aZDRXaXFo?=
 =?utf-8?B?M2xFTXlINFdIUElOZUZveEQvN2tpcWt5VS9tWUM0dzFMS1FJSHF4SG1KWlFB?=
 =?utf-8?B?VU1xUXJDODhaUVYwTFU4Mzk0bTdFdVBSZXo4cDFsOE9aV21BUlRPZDhDYUNI?=
 =?utf-8?B?N3Z6elR2dlNkV1dpM2J6MWZ3U3Y4eWFWOUF2cmJiY2tQU21ZSFptN2Z4eGZr?=
 =?utf-8?B?TUU3S1J6WFNIZHJVNHExKzdSVWpjcWdlbnA3UXFHSFhtaHM2Zkk1S3BNUk1m?=
 =?utf-8?B?L3JDNmJDaE9jeVlWdy94cXB4cXlVSG1iVHVHNEU4TWgxZnl1Y1NMZDBqbzVi?=
 =?utf-8?B?OFo5VTdWWDJqVlpnWmEwUDZuVUZIc2Q2QytYbEhhSzNzWU9sU2tvaFRDRTBq?=
 =?utf-8?B?UE4yalJ3Ym1mMnJXSHFGN0JvZWVLOUdtbEZUYW9ISHRXclUwc3l0RTNOT1VL?=
 =?utf-8?B?eTE5UllkN0tUMTNlbkJ0WUNMNEZ6dStVbW5RMlpkZlJ0UnM2YnRKaVNsbEFo?=
 =?utf-8?B?STlldCsyc3g2M2lnSGZWRkQyQjU0VysyYlUzTFNlL0dMamtVdXdiT1k4OXBU?=
 =?utf-8?B?anJBVlVVK0pibVBjR2pjYnIwNlBPR2p5ODMwSHg4MkZWUC9YYjBjNytaMkZI?=
 =?utf-8?B?QW1qSm04NGVUU2s1QjFUYXZQQWlHN05ROXJVdmhzTklpQXRlVThvYlUraHlw?=
 =?utf-8?B?QXhVb283RSszQmhBNDJCNUUzM0Z5VlZxN2V4YzJXN1dJby9NT0hhdGFFUFdz?=
 =?utf-8?B?L3EzaTNrdVFoRDZXVFAyOHhCT1ZUVGxRQzcwQXBmNGY5ODR1WCtlQmpFOWdN?=
 =?utf-8?B?YmhSOEJhMllLeVgvaTkza1piT016UzdLNENycWxhdVd2elJ6R3ZSM2V2S1RM?=
 =?utf-8?B?TEhZWEE3S0I0Q0NqQ2Q3Z0t6ZDhIaDk4YU12Tm9GeDFES0hRdnR3TjQvVHZ3?=
 =?utf-8?B?aTNNQWpHNlROVndsNTFSR1BoeDFYSUFhZGR3U3IwZjlLR3F4aGh2MExYZjRB?=
 =?utf-8?B?ZElYZXpaOEMxRlY3RjRvaE5OMTZPY05UWVJISHNjQWJyeHlsWHZLWHVhd0dH?=
 =?utf-8?Q?VrTQvkqBG2hc9INt7ojTazL9S?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7ea97159-7d68-4154-c55e-08dafa1fc269
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jan 2023 13:19:14.0863
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lg6vgIVMN2NfhYSbDYvZVwVZbcUIEj3HGgQfXtZJGbF1kRsddLAvvKxcplcgGidHnH+gXNZiU8BzOeIDg4uXKw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR04MB6841

Clearly within the for_each_vcpu() the vCPU of this loop is meant, not
the (loop invariant) one the fault occurred on.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
Quitle likely this mistake would have been avoided if the function scope
variable was named "curr", leaving "v" available for purposes likethe
one here. Doing the rename now would, however, be quite a bit of code
churn.

--- a/xen/arch/x86/mm/shadow/multi.c
+++ b/xen/arch/x86/mm/shadow/multi.c
@@ -2672,10 +2672,10 @@ static int cf_check sh_page_fault(
 #if GUEST_PAGING_LEVELS == 3
             unsigned int i;
 
-            for_each_shadow_table(v, i)
+            for_each_shadow_table(tmp, i)
             {
                 mfn_t smfn = pagetable_get_mfn(
-                                 v->arch.paging.shadow.shadow_table[i]);
+                                 tmp->arch.paging.shadow.shadow_table[i]);
 
                 if ( mfn_x(smfn) )
                 {


