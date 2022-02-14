Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EE0514B4597
	for <lists+xen-devel@lfdr.de>; Mon, 14 Feb 2022 10:25:06 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.271282.465678 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nJXbJ-0003ZH-7n; Mon, 14 Feb 2022 09:24:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 271282.465678; Mon, 14 Feb 2022 09:24:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nJXbJ-0003X6-3W; Mon, 14 Feb 2022 09:24:53 +0000
Received: by outflank-mailman (input) for mailman id 271282;
 Mon, 14 Feb 2022 09:24:51 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=KkXt=S5=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nJXbH-0003X0-BS
 for xen-devel@lists.xenproject.org; Mon, 14 Feb 2022 09:24:51 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f54e5ad5-8d77-11ec-8eb8-a37418f5ba1a;
 Mon, 14 Feb 2022 10:24:50 +0100 (CET)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05lp2111.outbound.protection.outlook.com [104.47.18.111]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-30-lqBSNoEcPIG3vdXAKS47dg-1; Mon, 14 Feb 2022 10:24:48 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by AS8PR04MB7688.eurprd04.prod.outlook.com (2603:10a6:20b:29d::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4975.15; Mon, 14 Feb
 2022 09:24:47 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::d479:b728:345c:bd65]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::d479:b728:345c:bd65%5]) with mapi id 15.20.4975.015; Mon, 14 Feb 2022
 09:24:47 +0000
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
X-Inumbo-ID: f54e5ad5-8d77-11ec-8eb8-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1644830689;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=jRtj4tiv1hm3ixQ2cH3tp9s+VaiO4YvJFI8HrqxEZ68=;
	b=dEBsRK+YI8zdr/7wM+r8gZBYg+DTeOvb7SjoMFPbF7BPltWzA7cGCxVmc5xkHP4jR+eUYU
	Pyo8YS/3/qva5icvxGLJkJIoJTey9X5F6W6PSJUjsCY8P1jx2r+LsBTuv1KjfBNwm/ShZu
	DLYlK+vRKF3F4rdyvuRda09Zh25SPys=
X-MC-Unique: lqBSNoEcPIG3vdXAKS47dg-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ccgPs2X5KqWgOEOwIW7kXcoewEniZzSlZGVxrxmgWKQCkHdoVdGV1UWwspWegJchnVoMEJs8fSr2ESEQ3uj8YZ9KKiTU/pAMcFM/eMxCOhF0BhpbpWuEGtrHdVoT1rVFu1sUGBCLS9jivgqupyec0oP6ItfFmN9vKtY1Ivuhkk/WSbsVAf9PjjZxDSqDPUZ8Fv6K8U38ZKq7agvDQbnmutGVX440fWEE29zOUbxZ7grZ9sHWh+Xp06MstCnzWFlj8xHLJW0mE6wiNibYsjfz3QEe4djZ82SY9z7yAMAih9dkiTuSxQD9Cpe7pwnn0s1WPahgvkzlIiygPaAkUK33vA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jRtj4tiv1hm3ixQ2cH3tp9s+VaiO4YvJFI8HrqxEZ68=;
 b=NlyTV/Mbsw6gLNr0FgehfXhr/4aMY43s4ZJQXbq3HSEZ9ndbow/4xK75WxwGBShSYZTrrSdjVDTa1lFTKbT6sfd2+X/HfKlXb/Ihz4QqVKhM78HmJe6iUP4o0hZSK68vO/3wy0mqNbxl71lYbMhp4VOif7XYPsYah5CsyD9FvMB+LO6Dx4a+mmHbHEX9XOynJb9T/+g/Qhg9bOzpMGFVNMDi2ZnfhwE7kIp8K3hXCJlh9JwCqcBOuhGZ9dUxYwpS9e0YTD+fPNVMyYEyI4mL+5ENwQ3D0dFgkfuJrWsfLoYkWPeS1JegbCz/kL0+2ASk5a5FfvpLVl/zCMt/+mGGJg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <65c123fe-c8e7-b9cf-4dea-904bf28170a7@suse.com>
Date: Mon, 14 Feb 2022 10:24:49 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.0
Subject: [PATCH v3 1/4] x86/time: further improve TSC / CPU freq calibration
 accuracy
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <35cb3c72-05ba-24c7-1fdd-3ee1aced3aec@suse.com>
In-Reply-To: <35cb3c72-05ba-24c7-1fdd-3ee1aced3aec@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FRYP281CA0004.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10::14)
 To VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 99849706-52eb-4af9-8704-08d9ef9bd83b
X-MS-TrafficTypeDiagnostic: AS8PR04MB7688:EE_
X-Microsoft-Antispam-PRVS:
	<AS8PR04MB76885C8E3E09322A00C101CBB3339@AS8PR04MB7688.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	jdYvnhKPTPi8T6jFp3jmFSaWfU30V+UsWq/K/w8dGM2YA6GC7Q2UWA7Gzy1bXJFjFfSp20ZPDNKf9yFrz5q1OUkfw1mPSYNZzjvaI2I2lKufhB5/rG2g6hJTmvJGZ4EuGfQhnFCg8bSg6d6MLdVRehCik0JnXIUmVPwlZgFQcnCWWWio/t/IdSTTaD4EgHjDllESOfugFQzXy17ZS3P/HMOJ6M8z/2ValhqlQdTpyj2p6NkSm+K7G6ZvaIFaeVn/ttfp1IZEH+bFSztdzHediIA6LPLTfe4ihYqTy9LvePXlLe5PUmufPnn5WHacKdICzrkPy+buiDfQbnyqA0hGUR78j5xPOoGwJIZ0rVq+f3GmOOhVE3RMSGzEzs02wFIRAbbvsawc94JAyCJhiNeHMRVsWzOtL4sB6AxAeZAvdqo0SDab+b9g49cYRwbk6dM2j4i4dK8bH3Kj5fbaXUTxqHmEFBjCWZvkLcAAZSpUPwuuQbzB7RQox8vDZkAeN1qXrtE2q8/MAlGadKd/ecBqJZ81eghzqbvtLQqNX+15jvq7LgPWGYjiZHZcQJ34YRzSWa5anoyza4ayGF04d4pUWqPx+CCfKWXziStk+6wYeDZJxt6GTqeDbLa+pof+PxNOzGdCtZshgOWl//GYue2FUB5Maobz3svsZ4/YXdU+YD7nlutqCWI+HBayhan57cvhxhYU0lbezkX79poe1AzBir8QIkcjdtr1s/c0pPSVo18=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(186003)(6916009)(38100700002)(26005)(6486002)(508600001)(54906003)(6512007)(6506007)(316002)(2616005)(86362001)(66946007)(4326008)(31686004)(5660300002)(66556008)(66476007)(8936002)(31696002)(8676002)(83380400001)(2906002)(36756003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?R1lGYThMTWFZYXA1UlJvWnJFZHdCdmpWWGIwK2ZqcEVSR2VQS3RIM1BIUGg5?=
 =?utf-8?B?M0tvZzYrMjJuVVBlV2NxM0VoT1dRT3VvWjVINS9sZW9Nb0tZbnVhc010T0Q0?=
 =?utf-8?B?b1RKSWVLaER6Q2NQVVVreVRYVzQ2NkloVHc1TEV6NDVCMVE2Slh5eDB5aldK?=
 =?utf-8?B?eVZFYkNLQ3RFcko3NHBTY2tsY21RQWNuUWkwV3ROSGVDR0YxZHJuakh5V2ZR?=
 =?utf-8?B?NHVnYWNnd08xTnMrMGdhK2VUd21UTXYrd01ickpnaDE0RmtVN0RRRHp5L1ZF?=
 =?utf-8?B?aFV0Y1U1bWtXOEJBNXBOSk5VeFFNQUZWcnlsVFVvMXJZOTFZeFhsbldVS1cx?=
 =?utf-8?B?alpMeUpmV1hTVlJpbzljay9rMFRDZEFUYUdEUGNGZzVDMW5INmVjNE9KSDdF?=
 =?utf-8?B?SkR4NFh6MlNrZ2w2bmoxSE82WVFhWkp1RW5TZjBZT2NCVzdRUTFPZ0xhajE5?=
 =?utf-8?B?eDVna21GMnJTSi9HbE1maDBEemJpSEJrVW1PZjN0bjQzUkE1bldqUS80UWtw?=
 =?utf-8?B?OTJBbDhqN0dYcFRGUlJScGU5dmpSNXBQaDZNZzhaUWRQcGw1WTdRc3RDSFR1?=
 =?utf-8?B?OU5jSXVRU2pCL3BPM2RYS1YzYjduTFdMTERmY3N2S0x3ZzN1M0tUL29qTHlN?=
 =?utf-8?B?eE1KYzRGbGN0b3NwNXFUSFhCSGZOcHhGdVcxUWlJTUkydG9IbDNuL2RSckx6?=
 =?utf-8?B?YnlER3ZNZ3QzRXdsVXZrTVFOZjhpT3dlNkpFc0wza2ZwN2FpS3hOZDdBQkpF?=
 =?utf-8?B?Nmh1VkRBeHFjcFdKTWhmNjFRU3AwNE9RSGx6SVRQY05xWnJUSXpLOVpVZU91?=
 =?utf-8?B?dzkwNlFRZ3ZGVTR2Uzk4Q0ZKT2FxazdyRm5VSGl5VEhIKy9GazJhUnkrY0xy?=
 =?utf-8?B?eW5tSjFJSGZ2cVZIcnkwSGZVVGc4Sk9seHlLbWtkUTlzWnprVUFiV2ppRytk?=
 =?utf-8?B?T1hkakt1SUNyaFJQSWdiaWN1VUtWQXRhdWtPdkc1emFva013VW9jQ2pFVTVz?=
 =?utf-8?B?aXNGTEF5djdxVkthNW5TZFBhZGJzVm9UUlA3dmo3T3prdktpeHRETDBsWDg2?=
 =?utf-8?B?QkQ4bVBmRmdUbzVML0IzMW1VVmhycE85cnlxUmI0TkEzN1VaQkdWQzk5QTNO?=
 =?utf-8?B?b2JwRmlkSGk1VTArOGc4YmcrSzBmeDFpdkJWZk5JczhWRE5ydTlXUmRiVE1j?=
 =?utf-8?B?eDhrZUVHUnhLMG5uRmV1ODMrUGcwTHhOSWNzQTJNSlF4WmdEOW5aaTdMNkU0?=
 =?utf-8?B?QXNnYTdqSW5kbmR2NkhUNWRrV1pJbGI2QnJkZHBod2JyQ0xmWE1MdDgvYStz?=
 =?utf-8?B?TDZQd3ZUN2NlWjV5R29rc1pSMU5tS1R1aEcwcStKdlNwdlZjL1pqTCtNdzRu?=
 =?utf-8?B?Y1NGMmdtZkxCUW9yVGZaTFRZc1JUcElTdUFTMVdMeEdzclk3aW0yMHduY3Ay?=
 =?utf-8?B?N0ZqeE1SWjRnSFFONm41ejlaQXlTU0tsakhmWVEzK3c0SXlqNzIwSGY3R1NS?=
 =?utf-8?B?UlROMEppOUJjdklYWVNYK0VXRTl0S0I1czMzNWN6Y3RtZGY4dktGdVpGbmt4?=
 =?utf-8?B?Z0hOVWdsR1B3K1UwcjVmRTJ6N21LeDdycFFEVysybDNuMFoycHBVcEpJbDZH?=
 =?utf-8?B?ckZnUzlMRldEUno3L1hlU2VrQlBRSURCcEVqWC8yYUdHSFViZlBGOGpzbFlS?=
 =?utf-8?B?RzZVcVRKckVyRWxINlV1bVBvbWZIOXlPMTA0d0dRYjhkYW9yK1pQYU44WEp4?=
 =?utf-8?B?VlVJSzdmOUtzYjFoZ08ybnQvbzFCUUJ1ZjhONXp5aGIxZy8yOXZhZC9xUXFt?=
 =?utf-8?B?enB6T0c1L1JBRWVpdVNrdnhxVDBUWTVoZG5IMnVUdUlobWlXUDdvRUg3OVZG?=
 =?utf-8?B?S3ozYndWcU4wRE1SOHpLTnoyZzgwbEpMbytsYmM4b3dHckszVFlmdG94cVJ6?=
 =?utf-8?B?L3BLTyt3QjJtemxYZjh0M09PWFZCL013YWQ5d2FmWDBIN3g2MElhV0wxTWM1?=
 =?utf-8?B?R0tQOGNyVjBlZTRIaWZ4N0pLdnJVRDdiUEIzaVY4Z3Iwa2dVWmV3S1dYajRV?=
 =?utf-8?B?STgxZlMrUWlKY21KeEtpWngzVmQ0d2VOWGxCU0VkSis2OVYwbm9IT1h6UE8z?=
 =?utf-8?B?VzR3bkpmM2Q5VWNWelpUSzdRYkJWT2MxS0EyNWg1ZXdWamJvQ0VFRjhzSXR2?=
 =?utf-8?Q?LLpi7eM/5IIh+6C3vPq4Wxw=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 99849706-52eb-4af9-8704-08d9ef9bd83b
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Feb 2022 09:24:47.7478
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: o3T5TjLjqbFv4ZxLJBYKRlWqhR+09NYnFNHxifvSSgawRhPMQmxWcbvkM/8O3L1epdeUPfpnuTipJUc1jN8jbw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB7688

Calibration logic assumes that the platform timer (HPET or ACPI PM
timer) and the TSC are read at about the same time. This assumption may
not hold when a long latency event (e.g. SMI or NMI) occurs between the
two reads. Reduce the risk of reading uncorrelated values by doing at
least four pairs of reads, using the tuple where the delta between the
enclosing TSC reads was smallest. From the fourth iteration onwards bail
if the new TSC delta isn't better (smaller) than the best earlier one.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
When running virtualized, scheduling in the host would also constitute
long latency events. I wonder whether, to compensate for that, we'd want
more than 3 "base" iterations, as I would expect scheduling events to
occur more frequently than e.g. SMI (and with a higher probability of
multiple ones occurring in close succession).
---
v3: Fix 24-bit PM timer wrapping between the two read_pt_and_tsc()
    invocations.
v2: Use helper functions to fold duplicate code.

--- a/xen/arch/x86/time.c
+++ b/xen/arch/x86/time.c
@@ -287,9 +287,47 @@ static char *freq_string(u64 freq)
     return s;
 }
 
-static uint64_t adjust_elapsed(uint64_t elapsed, uint32_t actual,
-                               uint32_t target)
+static uint32_t __init read_pt_and_tsc(uint64_t *tsc,
+                                       const struct platform_timesource *pts)
 {
+    uint64_t tsc_prev = *tsc = rdtsc_ordered(), tsc_min = ~0;
+    uint32_t best = best;
+    unsigned int i;
+
+    for ( i = 0; ; ++i )
+    {
+        uint32_t pt = pts->read_counter();
+        uint64_t tsc_cur = rdtsc_ordered();
+        uint64_t tsc_delta = tsc_cur - tsc_prev;
+
+        if ( tsc_delta < tsc_min )
+        {
+            tsc_min = tsc_delta;
+            *tsc = tsc_cur;
+            best = pt;
+        }
+        else if ( i > 2 )
+            break;
+
+        tsc_prev = tsc_cur;
+    }
+
+    return best;
+}
+
+static uint64_t __init calibrate_tsc(const struct platform_timesource *pts)
+{
+    uint64_t start, end, elapsed;
+    unsigned int count = read_pt_and_tsc(&start, pts);
+    unsigned int target = CALIBRATE_VALUE(pts->frequency), actual;
+    unsigned int mask = (uint32_t)~0 >> (32 - pts->counter_bits);
+
+    while ( ((pts->read_counter() - count) & mask) < target )
+        continue;
+
+    actual = (read_pt_and_tsc(&end, pts) - count) & mask;
+    elapsed = end - start;
+
     if ( likely(actual > target) )
     {
         /*
@@ -395,8 +433,7 @@ static u64 read_hpet_count(void)
 
 static int64_t __init init_hpet(struct platform_timesource *pts)
 {
-    uint64_t hpet_rate, start;
-    uint32_t count, target, elapsed;
+    uint64_t hpet_rate;
     /*
      * Allow HPET to be setup, but report a frequency of 0 so it's not selected
      * as a timer source. This is required so it can be used in legacy
@@ -467,13 +504,7 @@ static int64_t __init init_hpet(struct p
 
     pts->frequency = hpet_rate;
 
-    count = hpet_read32(HPET_COUNTER);
-    start = rdtsc_ordered();
-    target = CALIBRATE_VALUE(hpet_rate);
-    while ( (elapsed = hpet_read32(HPET_COUNTER) - count) < target )
-        continue;
-
-    return adjust_elapsed(rdtsc_ordered() - start, elapsed, target);
+    return calibrate_tsc(pts);
 }
 
 static void resume_hpet(struct platform_timesource *pts)
@@ -508,22 +539,12 @@ static u64 read_pmtimer_count(void)
 
 static s64 __init init_pmtimer(struct platform_timesource *pts)
 {
-    uint64_t start;
-    uint32_t count, target, mask, elapsed;
-
     if ( !pmtmr_ioport || (pmtmr_width != 24 && pmtmr_width != 32) )
         return 0;
 
     pts->counter_bits = pmtmr_width;
-    mask = 0xffffffff >> (32 - pmtmr_width);
-
-    count = inl(pmtmr_ioport);
-    start = rdtsc_ordered();
-    target = CALIBRATE_VALUE(ACPI_PM_FREQUENCY);
-    while ( (elapsed = (inl(pmtmr_ioport) - count) & mask) < target )
-        continue;
 
-    return adjust_elapsed(rdtsc_ordered() - start, elapsed, target);
+    return calibrate_tsc(pts);
 }
 
 static struct platform_timesource __initdata plt_pmtimer =


