Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 73F89497A46
	for <lists+xen-devel@lfdr.de>; Mon, 24 Jan 2022 09:25:31 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.259732.448227 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nBufA-0000nC-D9; Mon, 24 Jan 2022 08:25:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 259732.448227; Mon, 24 Jan 2022 08:25:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nBufA-0000lM-9t; Mon, 24 Jan 2022 08:25:20 +0000
Received: by outflank-mailman (input) for mailman id 259732;
 Mon, 24 Jan 2022 08:25:18 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=REvy=SI=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nBuf8-0000lB-NK
 for xen-devel@lists.xenproject.org; Mon, 24 Jan 2022 08:25:18 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 290717b3-7cef-11ec-bc18-3156f6d857e4;
 Mon, 24 Jan 2022 09:25:17 +0100 (CET)
Received: from EUR03-AM5-obe.outbound.protection.outlook.com
 (mail-am5eur03lp2054.outbound.protection.outlook.com [104.47.8.54]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-33-hSBwPLKkPZiwJxeDOLmwVA-1; Mon, 24 Jan 2022 09:25:15 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by DBBPR04MB7883.eurprd04.prod.outlook.com (2603:10a6:10:1e9::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4909.17; Mon, 24 Jan
 2022 08:25:13 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe%6]) with mapi id 15.20.4909.017; Mon, 24 Jan 2022
 08:25:13 +0000
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
X-Inumbo-ID: 290717b3-7cef-11ec-bc18-3156f6d857e4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1643012716;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ilZxZGw1TjgKK7WvV1Lh0ZuGM3SnwOvPz3fO9dftywI=;
	b=MFtCa/YC8KUfspfUHjoP7WlZKQWFwfo1HtRoDWT5N7QEN1DocRqH8zCSETz1TWXeCJ2Z99
	Bh8ARWPKexvZ6uNnxrxj9RsuG7Q0IWzO0zFt7V7KNKYOzQjFpoEwdB42fF7Nz0fNhjyreN
	UkKqtF/L4Fd2JXuZOpmsE8mTuFVpx9E=
X-MC-Unique: hSBwPLKkPZiwJxeDOLmwVA-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VUtPM7oa7n8YChl+RkHMn81hZsMmgGbK0FZgUcI8otmesp0AsezY9HOFkdzM8EzIkQlFmkEdBYFKg855eqDrmjQPz7naTf/RKNOAYDZNwAC4tym2Ic0HVN8+xN6CuHJtqN/zbEKbY8gu5gZrYDYqNoMDcwsmGWRYUFEZQNhoOgKlw24zmzVuLPi6KPVwrdD7qaGuXvA3jUALldzsaJPQDFIB0zEwy0x/HxRD9r6tc9S5thF7pbvNK5me+LHzcMpwFwGEL4ea2BlBVL2bqkafZfuVpSUm6orLIaiKM79zO5xcMDx+59sO4UFdBwIu4JrOIh/u4Ka+UU4QnNihRjpIZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ilZxZGw1TjgKK7WvV1Lh0ZuGM3SnwOvPz3fO9dftywI=;
 b=JIN5vmfgzwrxfK5EfbGb+65ll+uui7SRo+NfXrxxxq9vnDATrKmPpVivLGdsKKTsUXAfvuVUZm0/A2xFH/7ecfpN4ACBaQhkpTre3PBUzQfjtKFvmddE3/ygLjWyMHfAiRQo1zWJuaGyT0hQNxO9cOkh5W9GQiwMgaVRDYNFxcJFGcPHJJDkajIbmV8/tbuPEU4PAx6dnLQ6kt3bUzO0FTnprXctMxA8uDfdzTKxXGPZlcp03x883AYgjSAsjAZ+Qfj32g1a987nazHA4djiLAqt0Cn6/6Afccp/tRlcYL1KAj7LMoyr8hFRm5zPs9slCh6eYTJgQH6L8lyhB8uLrQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <2e97dd91-5e43-3312-2e47-534f425c28c4@suse.com>
Date: Mon, 24 Jan 2022 09:25:15 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: [PATCH v2 1/4] x86/time: further improve TSC / CPU freq calibration
 accuracy
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <879e5b70-bffd-b240-b2c8-c755b09d41a9@suse.com>
In-Reply-To: <879e5b70-bffd-b240-b2c8-c755b09d41a9@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS8P250CA0027.EURP250.PROD.OUTLOOK.COM
 (2603:10a6:20b:330::32) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ee9e9890-c196-447e-dffc-08d9df130b5a
X-MS-TrafficTypeDiagnostic: DBBPR04MB7883:EE_
X-Microsoft-Antispam-PRVS:
	<DBBPR04MB7883B9DFC3DFB358C928562FB35E9@DBBPR04MB7883.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	kHoYpEcbK7TaeLUyCXn90bwo72P3QDp3Ol/PkFvSSJwBGXN6P0zuvFu7G0BudVQnV0f4ogp+fuqt5STqg2WwnvryY1Slyp6sWME7pO8brBnkE+ThbwpnqVSgErRLavgr20p/fkFyX7t1sodCpNgnKgPK4VYVoQV/b7UVnilTF0TTyFGtVdtiDV+sVgagZnGrrWg7epdustmZSpCClh5WGl2eGQwsizqOIt+r89xiVqFf/rMGwB8avFiJCij1dLoBega2IOoBninmVG5l8hMEMpcpCqgDxNKTY8B2eP1fKjA3BEq6uDJsYxvUi5Xb6Si85JJIscZvh/X16h1RumTPMAlmCKZ+gJuV9vLQj4CNnO+wVuB2CKN59qce/d/cuoVOD4hrC4dNu+6/PV1/2fH5PDrT1tFnLAiyNXuuCJw3SmfbVhRuJqZV7B0KnwgKOEWTvoOusxmOn9LVVEj/w4mUtMJBzJr2Codjhs5sSxusT7rmTztGjaar4RhZrnI48yZyOUBl++X2vI2KipQeCWCoMrKDcso+VGovkaDgmPv9FuTTvfKLQU4GeiFTDxDZTpurKFmRxQgVu5wu9eGLJORelXNeCn7emqyaiUOLzpkPBXbuZ7sZdZS1mJUjJ28mhoW1HUt61HBi5PQSLRk3WYL0Mqh6Y1vEslrm0Ab74w2dH42wg57EjB1yoDRVS8OeVpPYMEaXX/5ux91EpPaCy3NHcmDPUYIVS2+hjBObfbwnhBw=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(2616005)(36756003)(38100700002)(54906003)(4326008)(83380400001)(86362001)(66946007)(6916009)(8676002)(31686004)(316002)(31696002)(5660300002)(6512007)(26005)(508600001)(66476007)(2906002)(66556008)(6486002)(186003)(6506007)(8936002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Z044T3hYOFZpQW9QeGF2QTExaUVQVXdNQWVaMnMrbWphdnl6R0FxL0pQNnRm?=
 =?utf-8?B?aVBVZ1VYVGVON2FRUi9VS1B2TXFpRVBPOW13aHdHTlpuWVpoQVlrQlNzMkpP?=
 =?utf-8?B?L0JGUExyZW1tRXUxYjRwbDJTU0pkNWVjKzBqeVVRbmp1NS9ENzRiR0p0dDdE?=
 =?utf-8?B?Tjc5dEFKVzVOT1hkMjFId21zZ2VBbXlPZloxN1lkQjZWR2V5cGRjVzhLdlBt?=
 =?utf-8?B?VFJpZXhkZCtIL2w3WnJ6cVNUdDJNNCszQ0hndGpHbmZubHJyN2tGYW5VWUsz?=
 =?utf-8?B?UDlGd0hMQmFyUDlyMDFDZXc5alhVOHlFRjBES3M0V2tTMGhHemt6R000dXF1?=
 =?utf-8?B?Z05ZUnJMZjJlQm54aGFJY1RaUkV2OWhzR0p4VWhZcXo3dHhYT3dsT3Z6L1ZU?=
 =?utf-8?B?NjVCdmF2cW1oT0NYRmpybk9YZHdiVEpYd2JHUUtQVHpCUDltT0J0N2lTLzRt?=
 =?utf-8?B?Nm1JZnh5dTFuR1lvaDZzQlNOWXFvNzdTQ04xNWlmQkRkR21jWWpqS3dGajBG?=
 =?utf-8?B?eDNNNkNJRGszS0NFc29BdXJZaHZhTXpCUk40OVhCZjdwODh0ajBMTWQzN1lI?=
 =?utf-8?B?QUVTaCt5R0ttVXZ1dVV0cTRkZ3F1cDZSb0t1cVlNc0pTQ1lWQm9tNFRWWjRp?=
 =?utf-8?B?Q2g1bXJpb29IMXVaRW1RY1R1N2JOYkgvU2dpajN5MklnL2U3RS9HSlVRUHdW?=
 =?utf-8?B?V3ZQbUcxQ0pDVnFGVm5OMm5nWHh1U2dYWUZmU1lXK202V1pzcGtidEhxOFhN?=
 =?utf-8?B?V1BtOTlBYU5aSzh4RW1lc3Y5cG5LRkFVdk4rYkM1bGkvVi9pUENrWXNiWTEw?=
 =?utf-8?B?WVlxZytlWVQ5MThDb0o4WC9DQVZod3RBM1VLZkFXMHpjUUlteHhsRFc2OGFz?=
 =?utf-8?B?MG5DcTlNcTF3UENLMWZsaEJRTDcvT0RHbHJwNjg0b1Bzazh1aFUwS1BaWHY0?=
 =?utf-8?B?V3RFeHBEdjY3NWlhNUJHbkV3MEt2SmU1MnFLcjdVY3JRcSsvNFlpdm4veHlT?=
 =?utf-8?B?UGNwTmlUaGdwTVlod0NkNzE1VHJwandNbitlWUttVlVVQmowd2JkQnJ6Z1Jr?=
 =?utf-8?B?UVBqV0EvZENFRS9MV1RmZHpYMnB3WEFPbmQrTloxMVVpVHoyTTFUSCtRYTFY?=
 =?utf-8?B?RDJEcGZxM2l5ak1yTU1VWi9NRE82ci91bFc1WncxQUJ0L1grRlZzdzVCUURx?=
 =?utf-8?B?eml6T3E1MjV0Ty8vL0VVQXIxSUtQdXVPTnFJUmdkTzhRUEJpczU2TGZXdXRL?=
 =?utf-8?B?WWhYZmhxb1FheUIwRzlHdE5aR2ZrTE50WnNSRWhOTWVoZkhWVDRhSHhqWDhJ?=
 =?utf-8?B?NTBpT25QQXNqQlU5aE1yeWZCNXFXd3hNTHNvQjNaYm9DZzQ4ZExyRDZlWndv?=
 =?utf-8?B?aWpzMnNwL0hIQkYzbzA3YitUdEdISEg3b0ROOEcwYVlmdGdMOExpRStPejVW?=
 =?utf-8?B?RjNNZTF5NXJiK0V6dlE5S3hxUmdKNEE5Rks1MFQxY2dOWkxaOEdjYnNTSm9O?=
 =?utf-8?B?ZkpJaXZObGo2UlVxUW9JeVZiaWRVY1JBZjg4eFRjc2dnWElRMVhMWFJhWFQ1?=
 =?utf-8?B?R0JuUUdSeGgwaUtUNDJaWllLRFZwR1JRWktqdXB4ZHJDYlhBNkNHQXRUN3Ja?=
 =?utf-8?B?clFaZ1Y2aXlLbUFrMjRNejJwK3dkYTluSTN3cVNacmhlZWw5SWRGc1FuNERE?=
 =?utf-8?B?NmsxOFZhNFErM2JIVlNWNk1wRy9jYUFIcXRQNGdNSWNtalh5RzYyV3VRQWVV?=
 =?utf-8?B?dk9KeWdzZUFZOHNHdWZ4TWxNVDJWczlEcTh1dDlKU3piMEtIeWFaaGFiemVo?=
 =?utf-8?B?S3g3b3F0QWpJSWg1N0NvKzhoTzc0SkhNTzE2L3VJN2pLQm5BbzVQaEJKVmpz?=
 =?utf-8?B?OEErMTZPZWcxTjU2ODdqQ2hRTWpOeVI3MDc5TkJqTnJWL3F0c01oQkZoOWww?=
 =?utf-8?B?aCtyWWNvZW83eGNXd0pLMENMdm5uRHRwT2ZYTjZwdHVtbEFLL3hYeUJuRFpk?=
 =?utf-8?B?NE9mRWthRGtYTk9aWlN3bHU4bkFzMVo3RWg0cmhGdUh2d2o1QXh4VWJyTHRk?=
 =?utf-8?B?b0FmMUlHUUR3NnFsa3pKbm9XQTF6VlpUK21VM09CNVVjN2dwU1NNRDJEcVNG?=
 =?utf-8?B?blNXZnByZVFYTHFuVG9JSFVMdkpWTHFobGJCMHZ6NEZtRkw3dDJBbWZjZjF4?=
 =?utf-8?Q?3z/M/zxcbrhnbec5sqSWVDU=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ee9e9890-c196-447e-dffc-08d9df130b5a
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jan 2022 08:25:13.8662
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: c02/+7xw14JTzcu17DVWam6NudqQCg7lI1jVjl2zQ4uSl9f5xKrA09qLVzRqhA51uV62D0H2mlTIL0PmkTQ2qQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB7883

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
+    uint32_t count = read_pt_and_tsc(&start, pts);
+    uint32_t target = CALIBRATE_VALUE(pts->frequency), actual;
+    uint32_t mask = (uint32_t)~0 >> (32 - pts->counter_bits);
+
+    while ( ((pts->read_counter() - count) & mask) < target )
+        continue;
+
+    actual = read_pt_and_tsc(&end, pts) - count;
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


