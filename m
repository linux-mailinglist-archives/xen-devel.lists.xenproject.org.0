Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 19EF9497A52
	for <lists+xen-devel@lfdr.de>; Mon, 24 Jan 2022 09:28:11 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.259743.448260 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nBuhk-0002cA-FE; Mon, 24 Jan 2022 08:28:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 259743.448260; Mon, 24 Jan 2022 08:28:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nBuhk-0002aQ-BD; Mon, 24 Jan 2022 08:28:00 +0000
Received: by outflank-mailman (input) for mailman id 259743;
 Mon, 24 Jan 2022 08:27:58 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=REvy=SI=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nBuhi-0001Me-HY
 for xen-devel@lists.xenproject.org; Mon, 24 Jan 2022 08:27:58 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 88c5dacf-7cef-11ec-8fa7-f31e035a9116;
 Mon, 24 Jan 2022 09:27:57 +0100 (CET)
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04lp2056.outbound.protection.outlook.com [104.47.13.56]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-9-8PjrLE-cO4WCL-quvZmFRA-1; Mon, 24 Jan 2022 09:27:56 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by DBBPR04MB7883.eurprd04.prod.outlook.com (2603:10a6:10:1e9::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4909.17; Mon, 24 Jan
 2022 08:27:54 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe%6]) with mapi id 15.20.4909.017; Mon, 24 Jan 2022
 08:27:54 +0000
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
X-Inumbo-ID: 88c5dacf-7cef-11ec-8fa7-f31e035a9116
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1643012877;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=UMb8XxBGQTglh7QS0g0uFzDDbX+ZM/GP4Y8wGvBBNIg=;
	b=CegIi2wfwN1GTNoPhAlIMu7m2nh6KWizrgc7s1veWAPCpaPBwpwbZi9jQirf0RK+qi3UKw
	Z/x0yI/gCFibItyzcMhq64lGS+mUfiMDS0ahHUvaJ1xm44MHCWdf6GDRX++rX0uohyPXBe
	t7e35/N8kbLGaxzKQKCjKYmz6qJMtQg=
X-MC-Unique: 8PjrLE-cO4WCL-quvZmFRA-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XtlXun0YoRDoow9UiIRjwFmLOGI++5tfdBKyHtmOOvrGHVAVqRwym+P1Lawmju0WRMELh/1RLEOCGcNGbHjydPBSwfIXsrDFwnWSQKd/Yoh4zamx/1rIe2lPINRa1OfkCvgZUvTX9VEfazbY+tcuRIMQRLZdptuGiijZ7e5lG4tjHYAhGd1UVHtALy7+BLjoXr0f4hUV5SuyWu0hBxv3H52LviNNrCg7b/0/0iD6bdQSKV0BStBa6QuPUD8avQ6cHJO7sjEtxyiRNelOcR85v05baXur2AXsYzkdvYNt6kNsJsLcygsv1+9ZCvECrfB4OwiqJKM2qFavWiLKN6VqkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UMb8XxBGQTglh7QS0g0uFzDDbX+ZM/GP4Y8wGvBBNIg=;
 b=ToyHKaIJZuXRtFf/PGF2AOMjcCf9JT154MxbA7k3f7tNd+UV6k8A7lHcnmcxmsOdZgQ5YibTtYL2TGCIAlv6iYD5ksZE9Gw8FN/9tNXwndHbQaIZzsecXcyIWiOaIO5Syi8aERVeqs0hzcwDWv9Ru+ibwx5s0tfhZF9KU/yWLIBj+NXvsrL4xnCiD5d8Idd/wCGPi1PaTQOpYddZMBGlgjNvQ9lgkaF+vhDa0CAiHYZ/GleWMMuHT8cDuowBGmIPtO5jqGW5t8vVC0jhYU4lFT0pbbAGcqvQn6Rl9Ky0JNmjTKCYlyYhX6ZQVmmsblAwCMlf+rUO3jY3cURUpZjd+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <8495dd5d-f72a-24c5-3127-dd37767dd7c3@suse.com>
Date: Mon, 24 Jan 2022 09:27:55 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: [PATCH v2 4/4] x86/APIC: make connections between seemingly arbitrary
 numbers
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <879e5b70-bffd-b240-b2c8-c755b09d41a9@suse.com>
In-Reply-To: <879e5b70-bffd-b240-b2c8-c755b09d41a9@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM6P194CA0047.EURP194.PROD.OUTLOOK.COM
 (2603:10a6:209:84::24) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 198e876d-fedf-4589-5bb0-08d9df136b41
X-MS-TrafficTypeDiagnostic: DBBPR04MB7883:EE_
X-Microsoft-Antispam-PRVS:
	<DBBPR04MB78836B7B7730FDB56215E763B35E9@DBBPR04MB7883.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:913;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	w+oA7gxG2sw3n9BCzQ/Dkfkt+Dc3xayFRxzQ/9Y6qs5GfYgudPh7ZaCrB+LOQqOgYtZoOxSmSZoqqNbx7ttUPbU1IjAERFuiuH2bMoUwZX41QO4Yu3xm6YbAJqv92ABNewEGemvR/Q4A1/OjQ+kEWkszVcdMbloBegbx8GB3cEBiPMITsFXvIHRK/M2RhoaVL0GT4OJ2A9W5pP7zE6aAzcHl6qz+OP7Xh8CldoGvNH4ll/h6KkbLHopt5IzQa58a0o2ObQXOdZdk7Umw7DqSM/p31Cd3vTJ/zuUbmX0cYR14Q2yNteZF8prAPsgW21oxN9WFdjmqDo3E5EmVwvxZslkY5nxs3HLHKHjaTBQ+XQEA+TT6TFHB0+v122wY9VE4QW2475BIzGgScyRyJnKdcjv5vGf+aZ1HO0xmhFXxcsg4EPcZKGow+2DcDahPFKbpwuFDuWy2B+4U0D8X4j5HQPo7UuLr2nUwD6JiLgLv+D4Th3rsOGpcIejfFOjF67H9ph7fBgCm5YER7kbAcs8cRcRM1pupJto339HlRRECYbug5RovC2bVktQFZET5Me+GkerB9umDjmELK5CxZ0q2uP6BCUXB3ZHoKiDd2Nw6bqSr5CAY9iOFcZTlEyE7jvwfkgHR/wSeK2t8MMGVVfSsjWcWrlb2JqPYfhnVrEldNyskCzt3Spg36r69sJRUkRZ4Z/Rm8XV4TbVqJe7x4OFziN6MgfTD9lJICFmLvhHHu/Ej3+nN3mrROPZj6qnFsmUR
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(2616005)(36756003)(38100700002)(54906003)(4326008)(83380400001)(86362001)(66946007)(6916009)(8676002)(31686004)(316002)(31696002)(5660300002)(6512007)(26005)(508600001)(66476007)(2906002)(66556008)(6486002)(186003)(6506007)(8936002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TENtSU5sczFseVpHMEZvb05pSmhMdUQrYitpU1Yyakp2dkM1YmdGKzBUaDRr?=
 =?utf-8?B?c2JZb2p4T011M21maG1oTCtPTFJlSENRd2tkZ0NrS1JvY1NzL1VyYWtiNnRn?=
 =?utf-8?B?N1dxVC9ZK1JUbmkxQlFLSzNqTWFpOS9jWXhjL0JxMS9ieXR3eWszbTlXV2Ry?=
 =?utf-8?B?ZUYzMkR5eFJiWm5xdnhmMHFLOTdGek9zVnRjbWhvSFhyaEYzamtpREFZdlVR?=
 =?utf-8?B?Z3d1SllYbkZUMW4zT0ZvdVlqenBqZjJRVHp0ZjZPMVYvNER5dStiOUd4ckJC?=
 =?utf-8?B?Qzl5N3RKWlE1RnF1bG1NMjBjbFBGdG5aQzk3NkxrcldUSXltdmJ3U21lMHMz?=
 =?utf-8?B?dWhqY1NiUmxFQ3BFajdzY2N2UnRJOTU3a3lxVTNPM2RsKzUwUnhUWU1lRUVR?=
 =?utf-8?B?RENpb0hxT3ljMUt4VS9FaXhwdUVHRUUxTURieHlESUJjWlhraXRTSUlvT0t6?=
 =?utf-8?B?NHI0dm1TU0NvdE5QNnJzcVc0S2tlYXBKRDlSSzgyVkdyS083ajNRczZiTkhS?=
 =?utf-8?B?MU1yeFo4TmdjQ25hVERSVlRCcVhCUjdFd3haU3BBcjF5bEFUNWhkd1VDQTRk?=
 =?utf-8?B?cXZRSHl4VDV6R0xxTG9kck0veFdrNmo0RHdwREpkNmpNdUF6VitEcWdaUGRJ?=
 =?utf-8?B?UVZTdnpQK3dpMUVkVUM3NjBuOHVqM0VMbzFJS0NZQ2dkN2hmVEtYYVVLV0dr?=
 =?utf-8?B?Q2x5VWZSTGo5N2hTTnBKbDM3ekdTZjViWUtkOCtEd2pnN2FXMlcwN2EvSU1p?=
 =?utf-8?B?c095U08zenV1Vk9wOFRLc0grZGNody9ESG8rSHgzV2d2S21yT2VBeDVuclFO?=
 =?utf-8?B?Q3UrWWRWb2wvLzV3NWhZaTg0K05HRWdpc3NGWmpYdk1SNmdoQlREMFNXdzJp?=
 =?utf-8?B?VlJVY3JVK3NwTlhOWkxublZkSGticlFoK2Z2WDlGenlwT3RmWk1SZFBXU1l5?=
 =?utf-8?B?MXZvYUF6bTVRaUlHS2o2NXBCQndRNW9EWWdla2dHYUlDRXNFMTRjcW85NWhM?=
 =?utf-8?B?b0RUNDdXUUZsTW5kUW5EakNHbGVWOEdsY1ZNdTlYd2N6NW45c1lnN0hGdGVs?=
 =?utf-8?B?OHZvaTJ4QXdVVmY5L0R4TzJzdU9lMGE2SlZOdzRWTWtUZVlMWVhVWW4zMWdE?=
 =?utf-8?B?YzlPb28wT0NKNUoyZ05yKzIyczJubmhhdm1kMGhLSVMvUGdYWGwwZ1kzMHRa?=
 =?utf-8?B?V3YwVzAyaXBtREZhUUd2SE95MTk4UnlUK29ueUQreWhuUmdYa0ZuVWZDRXFC?=
 =?utf-8?B?MlNlSFAweTVNYll0WHBPR0VBdW5ONmE5d2dwTlVUYk1IRmZaRVhIV2s2elRZ?=
 =?utf-8?B?aElMeFJndVdWZWQ5Ni9CR0RDWmdGMkE1a2FBd3NZdjdUdHl1b3JZZUdKQXJy?=
 =?utf-8?B?WDJUdDEvTEo5aENlS2tGb09DamVoZHV2ZHNrVE5NeG9LdS83U1E4a2Vrd2Nz?=
 =?utf-8?B?bllDUnVoTStUcTlWK1pYeVdpOU1wQnZUcE84NmlKWnFPNkhTRTcyaU5oUXRR?=
 =?utf-8?B?MnFRdE9ETlRLb3hGUURpYTU1UDZZOWMwdlJ0blZUc09UVWtLUkl0a1hiOFNO?=
 =?utf-8?B?VnEvTzhURmxoRWprU1FsRWNTRE1RcHAzcWhtamZBTFFnZmh2Sm9tNUpqQXdI?=
 =?utf-8?B?RTlhVGVHTUtUZ0RkeGJNR002d0NIQ21CaHRBNEhpdVNhL1BSN0pINCttVkV3?=
 =?utf-8?B?VmJXcHNuTGMycWlaMS9RZVFONzRLNGg5OWxFcUZtamN2MmxoWmtoVVBhaVpv?=
 =?utf-8?B?QldiZUpFWm9sSWVad1hsVHhZRTZEcDl1UzZmeGttdEFVemFmbkhvbkhpaFRW?=
 =?utf-8?B?UCt3YW5GWE1ldEtCYTYydjZMUUtJenRXemUzWXJDdU1kSHpsSmZORXlnRTho?=
 =?utf-8?B?L1p0UW80R3lEWnJPMWlRK00vZDFzVFM5UFBoWVdhUjNac3JKN2tqd013TzJU?=
 =?utf-8?B?NTExNVRab0Ftd3NlajhzMjZYVnZ5OFo0VEhaQ1BNdFRhRXlRWTg4M0Q0ZW9W?=
 =?utf-8?B?Uk5NZFNiKzhIUVZrRXYrZ1pVMzh4UG9PUkpuUHNyR1VsSWYybnAyMjVybEdL?=
 =?utf-8?B?ekRMWDVOK0FIdUNrYzNwdm1raWVXRGp0N0NpZ0NxU013QThnM3B4MDhMbmVn?=
 =?utf-8?B?bnhDVEUwTGIzWW9xK3E5SWE1c2dXU2hoQVBJOEMwUnJRaW0yUzhnWE1DRGd2?=
 =?utf-8?Q?8Iv82PxMWffJEJlYGvEvsnI=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 198e876d-fedf-4589-5bb0-08d9df136b41
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jan 2022 08:27:54.7713
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ms5Ug2BQkWqIrvqoz/hdXaSi7+KZBz+wXILOVf1RMPw5XKreCWIBQk1HonZxW2p1HkTC7/Voa/Exn8hT2iLqnA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB7883

Making adjustments to arbitrarily chosen values shouldn't require
auditing the code for possible derived numbers - such a change should
be doable in a single place, having an effect on all code depending on
that choice.

For one make the TDCR write actually use APIC_DIVISOR. With the
necessary mask constant introduced, also use that in vLAPIC code. While
introducing the constant, drop APIC_TDR_DIV_TMBASE: The bit has been
undefined in halfway recent SDM and PM versions.

And then introduce a constant tying together the scale used when
converting nanoseconds to bus clocks.

No functional change intended.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
I thought we have a generic "glue" macro, but I couldn't find one. Hence
I'm (ab)using _AC().
---
v2: New.

--- a/xen/arch/x86/apic.c
+++ b/xen/arch/x86/apic.c
@@ -1078,8 +1078,8 @@ static void __setup_APIC_LVTT(unsigned i
     lvtt_value = /*APIC_TIMER_MODE_PERIODIC |*/ LOCAL_TIMER_VECTOR;
     apic_write(APIC_LVTT, lvtt_value);
 
-    tmp_value = apic_read(APIC_TDCR);
-    apic_write(APIC_TDCR, tmp_value | APIC_TDR_DIV_1);
+    tmp_value = apic_read(APIC_TDCR) & ~APIC_TDR_DIV_MASK;
+    apic_write(APIC_TDCR, tmp_value | _AC(APIC_TDR_DIV_, APIC_DIVISOR));
 
     apic_write(APIC_TMICT, clocks / APIC_DIVISOR);
 }
@@ -1196,6 +1196,8 @@ static void __init check_deadline_errata
  * APIC irq that way.
  */
 
+#define BUS_SCALE_SHIFT 18
+
 static void __init calibrate_APIC_clock(void)
 {
     unsigned long bus_freq; /* KAF: pointer-size avoids compile warns. */
@@ -1249,8 +1251,8 @@ static void __init calibrate_APIC_clock(
     /* set up multipliers for accurate timer code */
     bus_cycle  = 1000000000000UL / bus_freq; /* in pico seconds */
     bus_cycle += (1000000000000UL % bus_freq) * 2 > bus_freq;
-    bus_scale  = (1000*262144)/bus_cycle;
-    bus_scale += ((1000 * 262144) % bus_cycle) * 2 > bus_cycle;
+    bus_scale  = (1000 << BUS_SCALE_SHIFT) / bus_cycle;
+    bus_scale += ((1000 << BUS_SCALE_SHIFT) % bus_cycle) * 2 > bus_cycle;
 
     apic_printk(APIC_VERBOSE, "..... bus_scale = %#x\n", bus_scale);
     /* reset APIC to zero timeout value */
@@ -1337,7 +1339,8 @@ int reprogram_timer(s_time_t timeout)
     }
 
     if ( timeout && ((expire = timeout - NOW()) > 0) )
-        apic_tmict = min_t(u64, (bus_scale * expire) >> 18, UINT_MAX);
+        apic_tmict = min_t(uint64_t, (bus_scale * expire) >> BUS_SCALE_SHIFT,
+                           UINT32_MAX);
 
     apic_write(APIC_TMICT, (unsigned long)apic_tmict);
 
--- a/xen/arch/x86/hvm/vlapic.c
+++ b/xen/arch/x86/hvm/vlapic.c
@@ -580,7 +580,7 @@ static uint32_t vlapic_get_tmcct(const s
 static void vlapic_set_tdcr(struct vlapic *vlapic, unsigned int val)
 {
     /* Only bits 0, 1 and 3 are settable; others are MBZ. */
-    val &= 0xb;
+    val &= APIC_TDR_DIV_MASK;
     vlapic_set_reg(vlapic, APIC_TDCR, val);
 
     /* Update the demangled hw.timer_divisor. */
@@ -887,7 +887,7 @@ void vlapic_reg_write(struct vcpu *v, un
     {
         uint32_t current_divisor = vlapic->hw.timer_divisor;
 
-        vlapic_set_tdcr(vlapic, val & 0xb);
+        vlapic_set_tdcr(vlapic, val);
 
         vlapic_update_timer(vlapic, vlapic_get_reg(vlapic, APIC_LVTT), false,
                             current_divisor);
@@ -1019,7 +1019,7 @@ int guest_wrmsr_x2apic(struct vcpu *v, u
         break;
 
     case APIC_TDCR:
-        if ( msr_content & ~APIC_TDR_DIV_1 )
+        if ( msr_content & ~APIC_TDR_DIV_MASK )
             return X86EMUL_EXCEPTION;
         break;
 
--- a/xen/arch/x86/include/asm/apicdef.h
+++ b/xen/arch/x86/include/asm/apicdef.h
@@ -106,7 +106,7 @@
 #define		APIC_TMICT	0x380
 #define		APIC_TMCCT	0x390
 #define		APIC_TDCR	0x3E0
-#define			APIC_TDR_DIV_TMBASE	(1<<2)
+#define			APIC_TDR_DIV_MASK	0xB
 #define			APIC_TDR_DIV_1		0xB
 #define			APIC_TDR_DIV_2		0x0
 #define			APIC_TDR_DIV_4		0x1


