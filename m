Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 71DD4731BE7
	for <lists+xen-devel@lfdr.de>; Thu, 15 Jun 2023 16:56:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.549667.858321 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q9oOi-0005ZH-UJ; Thu, 15 Jun 2023 14:56:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 549667.858321; Thu, 15 Jun 2023 14:56:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q9oOi-0005WB-RB; Thu, 15 Jun 2023 14:56:28 +0000
Received: by outflank-mailman (input) for mailman id 549667;
 Thu, 15 Jun 2023 14:56:27 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=tInE=CD=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1q9oOh-0005W0-Fy
 for xen-devel@lists.xenproject.org; Thu, 15 Jun 2023 14:56:27 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04on2070.outbound.protection.outlook.com [40.107.7.70])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id cc94a841-0b8c-11ee-8611-37d641c3527e;
 Thu, 15 Jun 2023 16:56:25 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by PAXPR04MB9665.eurprd04.prod.outlook.com (2603:10a6:102:240::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6500.25; Thu, 15 Jun
 2023 14:55:54 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c%5]) with mapi id 15.20.6455.039; Thu, 15 Jun 2023
 14:55:54 +0000
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
X-Inumbo-ID: cc94a841-0b8c-11ee-8611-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ViTfpIZ4Ba9SXt5AGTOqOAwElEaQGfdGZn4pkvYCwdMtlhDV7U8hPhW6ddmUuK7PWAkCmgN/cGgtnv97Yq57KKJd9BQa1h4CiETCMM8dpSSp9wkfoIi+rJQpxWgW1tN54IDV356yEDHWmFpHdxVwYhRoS7+jz3Cr6sgAq9/IBEHsGZgvo1VHHJ774pYBbKcH7YrJQPjsNsraNpNkXoSmDaktoCYyzz+cIS/Bn4YIq/pAUpidDo+f+D3biNfOx2NRbvocmW/y4jShDrAqtuTflN/S9JL7DwVn5PAYaY8xc6i21HQsFLPjAaq+TslUIcYeO9y9aI4ycl1pedYC5jsr2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OIdP+fPD+oF9cEQiMq7yKwpArFJAY76tnF1ijHYYjN8=;
 b=oKqM1Y2aU1AD3xfDOr5ACjQr5szE/jn93odDFIvzj8U+YFjPrgz2hfI9kG06apDbdyKAxNhevVtv7X+xibTfi/n9e8u+6datYUCkuwYLxGFmY8phCeHY3lTIvqJ4WLYCzHE8yxyM1S4N1L5ID1nr/jnx8ZD7wgEUkLnNOQPSKrvusMwDw8RORwHHteKvMPP+Bk6AdoI15Y8qoqH8va0xBkSB17y0AyFtKEwp9UTONJ6dU1LQI8k2ziUjgkQaMq0BSJ6+xkLeH10DEMu5m109/o6yVUE9Qf+WYKkSVjOL4LmTj3QzWaSFCYc8PXTWS8HBX0RGWBydPVaOAThRzYt7mg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OIdP+fPD+oF9cEQiMq7yKwpArFJAY76tnF1ijHYYjN8=;
 b=Sj+rb7AIiCPLVdGGoEQCUBtDep6sBzN6qAeR5gEcigc9h3rCDt5RWFnnbVF5okuTqOHXAQvwC+3dI4pcUkV/k0T1B3w+7+iz/kR+w3Myod2dxcuMQuNsSxjrpwBy6/iWNxUuH84hNkLCCay0uwf82Phi3WPqK5B9uuWqBwViyBsaghjg3dxmV2nvw2o233QIUy9/IYAfKxTe6kFIXJi9GD4pEca35ia4cyIDcLYnBQj7wRctWddvUsZa05vA2iBpTS7MqovFk9kmYm0JU0mFziplypGLisHT3kJ/R6M9T17wEhg2282O3Bjoe7b6fUX8FtFOsY2Umg5UFhsAF4crrQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <84853482-edea-ff2e-7301-1148e29bca65@suse.com>
Date: Thu, 15 Jun 2023 16:55:52 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: [PATCH v2 1/2] x86/vPIT: re-order functions
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <eaac83a2-8254-76b4-9bab-411e1e323851@suse.com>
In-Reply-To: <eaac83a2-8254-76b4-9bab-411e1e323851@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR2P281CA0068.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9a::12) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|PAXPR04MB9665:EE_
X-MS-Office365-Filtering-Correlation-Id: da522441-91cc-4c19-f325-08db6db09e8f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	iiVEUvMsqyFTew2r8tSwvfnir1Nag5PPN6Kx7yRcArDNyvkmHy1ynBUs5wKH5MqoxaLVLM4qgOFPujPqmmZBW9hEbpXFpqNM8F79vVkrNfgRbEd6an+ryCa20LZbWNDuuGHEizUSRy9RndsBxVtENJubd8FTxg1S75J37MCZqeSR4DtZH+oTYyPbtPpRpD8DD8fqmX3eOHEnutr2keoW/KC65lDisjZN2d51oRl2r2L57snYZ+UGG2/b8S/pyvZfpmiM7vDyE245xFnUw6ZApV+OADwdxDsw2VZ4IshRGy3TOZd5MYK57oAAMXnYG8AJb0dT3Gd/BRozWs4NgEEoHjGSKKhcnd6uirb5NbISXsIzJQBsTJUS2QomjBZ/Ll7r/6amLRjf2P13UccEXvKlZJdvhfi+aN+cnfKu1UvrWaCjvi3Liufjqn0sxC4XoYwulyI4sY81Pa2iZeIahlpjVStPBxbq36YKmpSTWxBNwq6ph+sKSr4tSaRZnY/4EJ3TINSnJK21u7bi1WB22DhvDPyB4Nzr+k8tZr0cqWOhEms10KlHkFS3uonNDn8H9EhlJQrfhD34gDt7GByq2Hxrbn44nN366L0pjyAewIOegZsr++RDFKBHtbnKbPdwCp2/Mo/noR/z0Fi7Y4DLZuHFHGQ59XpM+kPyaPI33xIXResMsKRA3w90Wur+CRS+TxLm
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(376002)(136003)(346002)(366004)(396003)(39860400002)(451199021)(5660300002)(38100700002)(2616005)(83380400001)(6506007)(186003)(2906002)(26005)(6512007)(478600001)(66556008)(6916009)(66946007)(66476007)(316002)(8936002)(6486002)(8676002)(41300700001)(86362001)(31696002)(36756003)(4326008)(31686004)(54906003)(169823001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UW5FRWdSdUowQUNWVDFlNDNvMm45Q2xhUXdEME1PWG85alBLakFDeG5aSkg5?=
 =?utf-8?B?cC9XejRiSVNJZkdNL2htbXJDNXZnTU1NZ0VNcGhCMnB6bm1ZSENMakFpUEJO?=
 =?utf-8?B?V2QvSysyM3hISW1iNlIwcVBFSHhnbUdweEluWnJmNVRiZldicHpaR1NERk5Y?=
 =?utf-8?B?T3AvVkxtTExlMk9sdmNRUVdxamdiVlgxUk1rSXFXbk4wcTRFTGNIQTRqcFp0?=
 =?utf-8?B?b01KMSs1MlpUTE52SThXVTdGNG1MdHhaZWF6dHByQlpXaFNoVjBkbGZINGlN?=
 =?utf-8?B?cXI2Tnl5MCtIU05YaEY3ZkxKYWd5TEEweFBTRFpDYUt3QXYweS9BSXZPOEwz?=
 =?utf-8?B?QmNJUFFFbUFqYm5XRitTRDZ6dDZBSUF1RWVVN3cvWE5DY1M1RDhxTUsxcEY1?=
 =?utf-8?B?MGtaR0psL1RiTG1iaE03NlJvVHFnVDJFSXpOcGV5enZxc0ppd2RGRklYSE9M?=
 =?utf-8?B?SEx1eCtvRWR1K0hPSVZWbHB6T1NYSUIzUE1JOGJ1Z0wxUHJ5ZExmV3BMdEow?=
 =?utf-8?B?aW83clVMQlplOTdpZG5SWmR2Rk5NNG5JeXBQYnd4RFd1MFZhaXhRZk56cTJB?=
 =?utf-8?B?d0tGc0xmVVdhZytuR3JHTlhaVlJYdkFRcm9jQjMySkpEcWhXTHZjelVJbmtz?=
 =?utf-8?B?ajhpcmNwWmRQTGJnTUtva3loYVArL2RuZ0RkZUtrUEdFeXZiZ00wdXNaMkFp?=
 =?utf-8?B?ZlIzN0ZwWUJjUWNzVVZ3eko4R3Y4RnBkSnlpMGZFNzJlVUdWRkVyTmZWSTJs?=
 =?utf-8?B?dENhSXRuR045ZWJVMDhtRVhFc0p4NTZvL21SckNBUVZMWkFTN0JrQS81cDlk?=
 =?utf-8?B?MWRSSkd6U3ZCZyttOHEzS1pLMG42UXp4cjN6TjUyTTAzU3orOGg0a21pb3RR?=
 =?utf-8?B?UWhUenBpRFRlWnA1L0ZLYUxsNnVWYUhJb1lsYXZyTnRUN1JDbDF5cGdkcHIy?=
 =?utf-8?B?UE85Q1BUZ1lQV3N2ZWNaVDFmT2RGQXA2a1RSbHN1WGNBM1pDOURvMHNGcms0?=
 =?utf-8?B?cDNiZ2NSWUV1dkxYY0g3Z3g3T0RWRU1PaFV6MWVHb0N3dXU1aUtCOEpOVjA0?=
 =?utf-8?B?dzE4VXU5a1pYSmRlbDM4bG01K2lqQU83T1Ztc2FGdEFpTXhkcy9BcHlQYzFV?=
 =?utf-8?B?K1huVllaN2UrVUUwMjBkNTZsS1BaQXlCUi9iekFKRW9MWWV1QmxZK2hSYkht?=
 =?utf-8?B?cVRvY0szbGtqRnhTMDJtRGtLWG5kem9kdkZQNG02ams1QkozOFRMRDRhVEdS?=
 =?utf-8?B?YUI5SzZLNi9iTGJueUlYS29aTml0SllGMk5VaTNmQTBwNk1oM0V0Vkw1VnBD?=
 =?utf-8?B?RHJCMjhXbnVsWHlPbFJVem9XYzlmeXVvK052MHlUSng0UDhuS2g3SWtIcWpQ?=
 =?utf-8?B?K2Jra0J5bVJ4UjR1cjJ0ZVcyOXk2M3dVSE9yeDAzb0JVLzNYYU9VU2dMNitX?=
 =?utf-8?B?UWs4aGlGOGJ0UlJTdXRFSGg0Q3pTSjJ4b21ocEY2bVN6cUpuZTlwQmMrL3ZT?=
 =?utf-8?B?ZWljOXhjUUg5RGNIV0l3THRxTWFYNjY1MjdodUxvSHh2WGx3Wm8rU01UTUpz?=
 =?utf-8?B?VnF4cGVnTGxHTGM4RmFCM0NGQ1prMnM3c3NKSjIrdVlFeDhGbWV4MHJCRlN5?=
 =?utf-8?B?L2ttTWNqQ3oxL0ZUb2UzY3dLVGZTNnp6VkloLzZuS1NHMmV0T1BTRVEweWRI?=
 =?utf-8?B?NkhXRGZmNkxEVjlMNGc4dW1JRENXTHRORXpYQmJpOU5Vc0VoUmlKSTVjSi83?=
 =?utf-8?B?b2trUUtDM2hQMnpHUm1Nb3JyZ0RjUHNoZjNUZWFVR2FsT0NYTWk3Q2JoVk00?=
 =?utf-8?B?K25nV01Yc2FxRldYL2NoQmt4WDRSbTlFaHJvVXBWLzJrYU5oVGY2eWFZZWRI?=
 =?utf-8?B?bEdpYm1DT3JFdGlyR0VtbGhHNnJyUWJOSTNzUnJ0UGc4VmZNNGxES29aRXZ2?=
 =?utf-8?B?ZXk4L0pBczlXbmQzS25vNHhyQS9DUmdqTnBCTXNjeVR5NkN1RTA4Y3RSTWNi?=
 =?utf-8?B?bEU5SG8yWTg0VC9yRUNMNVJRdk9mUU8vTk1Bc3hwS01TWGJDSTJkMkRmRkZL?=
 =?utf-8?B?ZkMyNnJmc2gzdllnekh3OFFDN1BLRUVwWmpTalYyVmJJeHJHeGlsQnZlS0VX?=
 =?utf-8?Q?sn1pMKEHrDCRFJyK+s3Y8jjrY?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: da522441-91cc-4c19-f325-08db6db09e8f
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jun 2023 14:55:54.6024
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yvwKE2WPt7U3VyBsoFoXHtXZwVPORbgeKv5cSA2S2fAugsvK7scsiZCdjSd5yRjDEHU1y0/YUUhn7/pxVFyfdA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB9665

To avoid the need for a forward declaration of pit_load_count() in a
subsequent change, move it earlier in the file (along with its helper
callback).

While moving the code, address a few style issues.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>
---
v2: Address a few style issues while moving the code.

--- a/xen/arch/x86/emul-i8254.c
+++ b/xen/arch/x86/emul-i8254.c
@@ -87,6 +87,58 @@ static int pit_get_count(PITState *pit,
     return counter;
 }
 
+static void cf_check pit_time_fired(struct vcpu *v, void *priv)
+{
+    uint64_t *count_load_time = priv;
+
+    TRACE_0D(TRC_HVM_EMUL_PIT_TIMER_CB);
+    *count_load_time = get_guest_time(v);
+}
+
+static void pit_load_count(PITState *pit, int channel, int val)
+{
+    uint32_t period;
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
+    if ( !v || !is_hvm_vcpu(v) || channel )
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
@@ -156,57 +208,6 @@ static int pit_get_gate(PITState *pit, i
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


