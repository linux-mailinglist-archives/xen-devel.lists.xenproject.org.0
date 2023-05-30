Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AF942716714
	for <lists+xen-devel@lfdr.de>; Tue, 30 May 2023 17:30:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.541236.843772 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q41IW-0003FU-U4; Tue, 30 May 2023 15:30:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 541236.843772; Tue, 30 May 2023 15:30:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q41IW-0003DD-R8; Tue, 30 May 2023 15:30:08 +0000
Received: by outflank-mailman (input) for mailman id 541236;
 Tue, 30 May 2023 15:30:08 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=8LP9=BT=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1q41IW-00038g-07
 for xen-devel@lists.xenproject.org; Tue, 30 May 2023 15:30:08 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04on060a.outbound.protection.outlook.com
 [2a01:111:f400:fe0c::60a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id da4be508-fefe-11ed-8611-37d641c3527e;
 Tue, 30 May 2023 17:30:06 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by PAXPR04MB8830.eurprd04.prod.outlook.com (2603:10a6:102:20d::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6433.23; Tue, 30 May
 2023 15:30:04 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c%5]) with mapi id 15.20.6433.022; Tue, 30 May 2023
 15:30:04 +0000
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
X-Inumbo-ID: da4be508-fefe-11ed-8611-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fVMIRt4Ysn2ESQ9jE8OCzequOH+oPAWYSM31g1/uf4ebEp+IkPpv7Npiwbwi3JUi00C5QisJOjmTGyURDbn4eRM9zurX35rwJsaf+c1WvMl0LXlU5H4hPlWfDtkXBigp5fkA2ERy/lG1xf/HplALIVv92Yic1AM9/s/tu8ZI8IjKdpmQHnxdnrmCkm0j7LghHxqE0VIPAokEo455K0D3bbUL/vm9vswxWxo21JGrnamOn6gx5pzdE7gWY6rhz53pWZqal4DLmcLH9KcUTEctTWR2U2EMpnZddFcWsWAzLG08uQe6srPGxwVswGvXFQEpoma556KUKWtvAyWpq9gquw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IAG71PtkJKdo4vtdYFhwpAHf5tOfIIddYmApNP3+/zY=;
 b=ZvRgD52vO67tz+jGJPgVi/WvOjMWCvhWDX+Qg5SvtxAFf0Msz9Aa3Q1Nk+v2ZlPLAOx7YFMuRrZJwAyjgZxs7OHym0Tb5N+0318Za4XTUauvz6L+4IUvekjJwhhFnl814CHltbB0un1Nq/7g38E1oNPAayqBKTj4ttEjyV2lyiZcE71RxfsZoBlleCHkUA/kJAxtYc4wFGo9m4H/6jyzVdzxebtWSls1xqMD7ICkQnPzixtT0Y5Qd3sHuOYe3ASxRd2LnZ6MwoiSJ3gAVdu81XDEsXRaIFvKaMfI0DiOKsBimbSVdfA+YMwO9vuMrUJxbFBefOOqj+ZEjonWAm88kg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IAG71PtkJKdo4vtdYFhwpAHf5tOfIIddYmApNP3+/zY=;
 b=KAfos2uGCkE8yU1H/NNG5lwzBXyGTkO6KJ6EOkk+wnwwGBiZYRRl8ruMSYPYAqf2LgN73ICj+qb3kqsFKpIETl4VYAg6ayXhVGOTmIJ20n1obYEZtQ/dKCJQblPyZDi9sdRsm1nvVBhj+qvS0iarPWc9GuSlW/QcR1ZJ3wg6qip8nFJL6x7nMIpGqK3Oybl3qFREDY5bH9Zw5Xpo57l9opLqkvF6YR4Avl/OSJs0UxjDcgaMBqlDSHvuUGChvpNxYypu5LfLbHraTvogBk6Ikw2HLsTTpUbJy+BLrYmGeuETpXNCTaByWYfRkHMidyofM/owHwWE/6A10Wv7UyFyHQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <b6cbf871-53a6-15ee-99d5-0ad2ab9c8b80@suse.com>
Date: Tue, 30 May 2023 17:30:02 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: [PATCH 1/2] x86/vPIT: re-order functions
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <fd113adc-6d66-5a4f-78ee-766c197ced93@suse.com>
In-Reply-To: <fd113adc-6d66-5a4f-78ee-766c197ced93@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0160.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a2::15) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|PAXPR04MB8830:EE_
X-MS-Office365-Filtering-Correlation-Id: 1036e4d9-9588-4803-ddcf-08db6122bd90
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	hKEbQKUepn9bXgc7glL2LuoAybckJ8ZaNz/BFFeNcbo1Sci1wS1Yczxy2qxq0ldNz8UeMMvMuKzDFTsnKiI5iqLjyRNfPu0wKh1QmAPJVOMaKTzKns/fIDFNAbZ+noEOFrPzKKAxzmurM6HxgqajIMTuvmFsKLhmJjlXUZknzflFjAsrRLNIPKB/0GE9mC0clH/wOxenvXIDQEs8k4Ox1RwfFIRimY0wuHHHdZFw9dmbAhym3yyjhBcufVzKyN/ZJ5JrnOfh5L+IwEaBYB5J5YLw0pLk4rd10pkm9ViAwo2nJcaLAZ9YrvIzNAzfnOeLh/kiQBaoa8Wdd4j7bALsbvaczJBjlpk0jRXwxGQSNjtbkWMvrhxU3CGtWNSIsNVnwC+X7R4L7l5NDr3++27TPEgJGndqneb7y+UkatQ5oX5aTlNecKALWXfEu4sfxnbV/elBjpsOIhQsfmteG6BpJZhYfrfUnlQVY7OHfbOmb2K3gRHT4hiISL4MMlvjT/xeH2EKpoBO+1GUVYa7n+icnep0bKOG0tL71WhvtfW5GjVrl6ASseJXQteS171buLfl9ap2wfkbQJ5kJGgT5Q1OtV++u1atKtASrR3ADAtDOzsEDGrCwgk7ERopykdWCXpAdMSGdFfg2j782F4psdHDwxOaPZA463JmzbYIePnlV8eoSyXNYE1Bol7jtSZXx6lS
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(39860400002)(136003)(396003)(346002)(366004)(376002)(451199021)(478600001)(6486002)(54906003)(6512007)(6506007)(186003)(26005)(2906002)(6916009)(8676002)(316002)(66556008)(66476007)(8936002)(41300700001)(5660300002)(66946007)(4326008)(38100700002)(31696002)(86362001)(36756003)(83380400001)(2616005)(31686004)(169823001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?QytOSm8zbTc0QUV3K0krRTlHZEpxN2JtSzZkM1FrQWxmekppL3kweDF2N05w?=
 =?utf-8?B?SXZtVFA2N2xqRkJNM2l2RW1rMVZ3SEVDVGVsbzdtV1Jkem5ybUtqMUQ3c2lp?=
 =?utf-8?B?OFBFWG1GRkFLdlVIcmpDVmJadHdLRmxKdVdFV2VxOGg2SGhsTS82Q3lsNEpV?=
 =?utf-8?B?TklKeFcvbTBCOWRYeFNrR0Z2RERFVE42WVZJVzE4eU1mUmgyZ3lHRysvaXVv?=
 =?utf-8?B?RUtOd1haYnNmWktoSW4yR0JNa2lFd1R4T1ViRDRBRlZTMUl0U3U2ZEkwbTNa?=
 =?utf-8?B?ZEdxTi9YTzNpaWxLWEhsVE85S0wrM21IeFB0VkpKenkzTXh6T0wrd0FvWVY1?=
 =?utf-8?B?V3B3LytvL01rUFcyTHJ1aVZ0ZnNkNWM1M09QNU5qN29xc1dnbGxxSHVZV05B?=
 =?utf-8?B?YjB6dkhnVWFkd2k2Z1VKTEhGRyszWlNQNXJJYTNJWnVyZGZGdUhZOTdROUli?=
 =?utf-8?B?eitVUnQ4cFRSUitRSlJaWmUrbVZUTDNsNVVQNU1xa1NweUY1cnVtZWwzTkY5?=
 =?utf-8?B?S21hMWVKMFNmSkYwalFFNFRyTzltNlRiOTVSMms5dVRCSFV2cTA2dlRKUC90?=
 =?utf-8?B?YjR3S2kxb2lhdUhIYWZZRkZOOHgzeGZvdWlOWnh5ZXQ2aTl4Rkc3UXZua21Q?=
 =?utf-8?B?MGRaalRwaVhaYno1UFMxQkg5QmJscmZJckIvcXQ5dG9tNmlFbC9SUmxCampw?=
 =?utf-8?B?dDQrRmEyN2RETHRyRjkvQjRBMGNDNUdHWDNaWVk0TDZPOVBXZjZENVQ0cm9j?=
 =?utf-8?B?MDZjK2hyeE5Db3ErOFdMTndRRUtqYXRBWFB2Y2kvNHp1VU40cjVJQkxublpT?=
 =?utf-8?B?QjdMT0VCNkNvWDBMdWdodEhXeC9EeUhXczkyekN1ZVhERm04SkdpNFc0aTFh?=
 =?utf-8?B?QVkvSEloQTdpN0R4Z0NGdGdXZHBmRmczZEQ3SnppcTNIQzNodW9wU3ZVZWpj?=
 =?utf-8?B?UHFFZ1NCb0MvTDFWYmw5ZkMvaStsZkJDM1ZNS3hRRUVIaWkxT283bUNyOW9a?=
 =?utf-8?B?eU00dzRIcmtmOWs1L3NKVGZNamZFRTU4QXJwMkZ1TlA3MGVGeDBoQXQrZmJx?=
 =?utf-8?B?OWdHVjNOOERST3gwT3hkN0pUdUkwUURGSnpLano3YTVjMU9udjJzTVcyQUE5?=
 =?utf-8?B?a1kzNi96YVdFSmxrTi9ZZXlnNEN4N3FPRDladHBYM0lrdUR4dTM0MitZV2dZ?=
 =?utf-8?B?U2IzMkJ3anBDOS9VUlFZUGVIb0lPV3VyL1N1aHlmc0lTL0lRNFZCa2dkeUxN?=
 =?utf-8?B?a2hXcllkWjhuSUNSRko4ZHZ6NGJXUDlNRnVCaG8vWnZjelQ3YUlNZERLNlFL?=
 =?utf-8?B?SmZUSnoraUU4akpTMWpZUkxJQ1E3U2ZpNXJ0Y2VFazZDQ29UMHladHJYUVZ2?=
 =?utf-8?B?emlKdTVoMTlyZ1hOK1FXakdoaGRTdWVLZ2xJdXlybC9xT0VOK2F3ZHI0aDU4?=
 =?utf-8?B?aXAycFlHUU9IYmQyKzZhS0Y0TDJQc1RVMUxDUWNsdjhXcVB6cGVGSFZ5dXUz?=
 =?utf-8?B?eWRWS3k2MFRnNHRZZ1BhUTN0cVFURkhPMWNsTlZySjR6RzgxTndSaTY1dkgv?=
 =?utf-8?B?c0Z5Wnk0c0M1QW9nVVY1SXM0blJMbGtYa3d3Vm9iNU9VZVJsb1BjQy83aTZ6?=
 =?utf-8?B?dDEvZGR1M2hWbVhkcXF0QVk0RFFyekdHL2Noa1RnRDRYeWdpakRPaEhoOVc0?=
 =?utf-8?B?NmlvTGZobnVmQXdwazlIYlZpY3VEM0lHMXJmUkNPZC96dHl6ZjkxMjdYVjYw?=
 =?utf-8?B?cDhRZ0RlZzVnWGV0WTdGdy81R0FWeERqS3gwakxjakQrN1o1U3o2QTRkbVR1?=
 =?utf-8?B?aVpDd0tTOE5zU2Y0NkdTbGQ5MVZ6MEMwQTF5Zzc0am9pR0piZlJndXd0Q3RS?=
 =?utf-8?B?ODlZUC9FdENyUWNqUjg1RXc0SzREcm9aOUowdEtQdGZKSGo4UlUydFptSkV3?=
 =?utf-8?B?Mi9sdVdEV2NMRmQrNDhIVXl1aWw3TW9BemdBL0cydW5hd21IRG42aFdoaVBU?=
 =?utf-8?B?VU1FMmtqbzAwRjhDT000OUpoWXpMNzloZm85U2ppeWJUMjJJT1gyMGw4RmlK?=
 =?utf-8?B?SW5FMmc0NTRUUElFQ0lLSDNwM01lei92S2d3eVVhd3VCUm00clZJZjlONStn?=
 =?utf-8?Q?bcLFz7qrSNNfvrwc2Tb65I2qu?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1036e4d9-9588-4803-ddcf-08db6122bd90
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 May 2023 15:30:04.1710
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: D740qdPzNjVufyk4Q7plvA6Pk0Ptp8tltmIr8v+dK+aPxIXnzZ8/61L7ZXG5KUYvRGRMSYQKkKOeWNfhkq2ISA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8830

To avoid the need for a forward declaration of pit_load_count() in a
subsequent change, move it earlier in the file (along with its helper
callback).

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/arch/x86/emul-i8254.c
+++ b/xen/arch/x86/emul-i8254.c
@@ -87,6 +87,57 @@ static int pit_get_count(PITState *pit,
     return counter;
 }
 
+static void cf_check pit_time_fired(struct vcpu *v, void *priv)
+{
+    uint64_t *count_load_time = priv;
+    TRACE_0D(TRC_HVM_EMUL_PIT_TIMER_CB);
+    *count_load_time = get_guest_time(v);
+}
+
+static void pit_load_count(PITState *pit, int channel, int val)
+{
+    u32 period;
+    struct hvm_hw_pit_channel *s = &pit->hw.channels[channel];
+    struct vcpu *v = vpit_vcpu(pit);
+
+    ASSERT(spin_is_locked(&pit->lock));
+
+    if ( val == 0 )
+        val = 0x10000;
+
+    if ( v == NULL )
+        pit->count_load_time[channel] = 0;
+    else
+        pit->count_load_time[channel] = get_guest_time(v);
+    s->count = val;
+    period = DIV_ROUND(val * SYSTEM_TIME_HZ, PIT_FREQ);
+
+    if ( (v == NULL) || !is_hvm_vcpu(v) || (channel != 0) )
+        return;
+
+    switch ( s->mode )
+    {
+    case 2:
+    case 3:
+        /* Periodic timer. */
+        TRACE_2D(TRC_HVM_EMUL_PIT_START_TIMER, period, period);
+        create_periodic_time(v, &pit->pt0, period, period, 0, pit_time_fired,
+                             &pit->count_load_time[channel], false);
+        break;
+    case 1:
+    case 4:
+        /* One-shot timer. */
+        TRACE_2D(TRC_HVM_EMUL_PIT_START_TIMER, period, 0);
+        create_periodic_time(v, &pit->pt0, period, 0, 0, pit_time_fired,
+                             &pit->count_load_time[channel], false);
+        break;
+    default:
+        TRACE_0D(TRC_HVM_EMUL_PIT_STOP_TIMER);
+        destroy_periodic_time(&pit->pt0);
+        break;
+    }
+}
+
 static int pit_get_out(PITState *pit, int channel)
 {
     struct hvm_hw_pit_channel *s = &pit->hw.channels[channel];
@@ -156,57 +207,6 @@ static int pit_get_gate(PITState *pit, i
     return pit->hw.channels[channel].gate;
 }
 
-static void cf_check pit_time_fired(struct vcpu *v, void *priv)
-{
-    uint64_t *count_load_time = priv;
-    TRACE_0D(TRC_HVM_EMUL_PIT_TIMER_CB);
-    *count_load_time = get_guest_time(v);
-}
-
-static void pit_load_count(PITState *pit, int channel, int val)
-{
-    u32 period;
-    struct hvm_hw_pit_channel *s = &pit->hw.channels[channel];
-    struct vcpu *v = vpit_vcpu(pit);
-
-    ASSERT(spin_is_locked(&pit->lock));
-
-    if ( val == 0 )
-        val = 0x10000;
-
-    if ( v == NULL )
-        pit->count_load_time[channel] = 0;
-    else
-        pit->count_load_time[channel] = get_guest_time(v);
-    s->count = val;
-    period = DIV_ROUND(val * SYSTEM_TIME_HZ, PIT_FREQ);
-
-    if ( (v == NULL) || !is_hvm_vcpu(v) || (channel != 0) )
-        return;
-
-    switch ( s->mode )
-    {
-    case 2:
-    case 3:
-        /* Periodic timer. */
-        TRACE_2D(TRC_HVM_EMUL_PIT_START_TIMER, period, period);
-        create_periodic_time(v, &pit->pt0, period, period, 0, pit_time_fired, 
-                             &pit->count_load_time[channel], false);
-        break;
-    case 1:
-    case 4:
-        /* One-shot timer. */
-        TRACE_2D(TRC_HVM_EMUL_PIT_START_TIMER, period, 0);
-        create_periodic_time(v, &pit->pt0, period, 0, 0, pit_time_fired,
-                             &pit->count_load_time[channel], false);
-        break;
-    default:
-        TRACE_0D(TRC_HVM_EMUL_PIT_STOP_TIMER);
-        destroy_periodic_time(&pit->pt0);
-        break;
-    }
-}
-
 static void pit_latch_count(PITState *pit, int channel)
 {
     struct hvm_hw_pit_channel *c = &pit->hw.channels[channel];


