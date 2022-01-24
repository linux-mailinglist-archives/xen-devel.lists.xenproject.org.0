Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C4070497A4E
	for <lists+xen-devel@lfdr.de>; Mon, 24 Jan 2022 09:27:04 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.259735.448238 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nBugZ-0001Om-Oe; Mon, 24 Jan 2022 08:26:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 259735.448238; Mon, 24 Jan 2022 08:26:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nBugZ-0001Mn-Ku; Mon, 24 Jan 2022 08:26:47 +0000
Received: by outflank-mailman (input) for mailman id 259735;
 Mon, 24 Jan 2022 08:26:45 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=REvy=SI=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nBugX-0001Me-NV
 for xen-devel@lists.xenproject.org; Mon, 24 Jan 2022 08:26:45 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5d1f0baa-7cef-11ec-8fa7-f31e035a9116;
 Mon, 24 Jan 2022 09:26:44 +0100 (CET)
Received: from EUR03-AM5-obe.outbound.protection.outlook.com
 (mail-am5eur03lp2057.outbound.protection.outlook.com [104.47.8.57]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-25-I5i16AvjNoCmc-t5nOJ-EA-1; Mon, 24 Jan 2022 09:26:43 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by DBBPR04MB7883.eurprd04.prod.outlook.com (2603:10a6:10:1e9::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4909.17; Mon, 24 Jan
 2022 08:26:42 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe%6]) with mapi id 15.20.4909.017; Mon, 24 Jan 2022
 08:26:42 +0000
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
X-Inumbo-ID: 5d1f0baa-7cef-11ec-8fa7-f31e035a9116
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1643012804;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=jCxscIvq6zLulNKcY3/NWbd2vQ3CrupkD38ZmXXmcn4=;
	b=HN0hRmA14MVo2DTQzISJTY0T3R+bQOPbGZZosJtfYUgzyOXC3IHfail6D6j+d19eRwL8CH
	OhBIhOmacAqSpkOWctgbcZ74Qkgawr/BHWcytUoYxsCWvRON7IWJu6oBzaQ0lXYli9je2x
	m5wtvRZqz5rBOJF5CFNE7lSBHuNh+kc=
X-MC-Unique: I5i16AvjNoCmc-t5nOJ-EA-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UdaXG49nSwNhZQ6t0hhqLxCiBJtHlTE+FrlM2zvz69qhhnNTZ1kEfC5wWEJFDdzAgZUkBIkFOWubI5FlI2wHiAkCyGEvL1lzXor6zYI9gKDiXlJUYbe7wC7Tv1ZoJA48l08rrK6ugDLbRU11MPLHCqe0qKtB1I8PzfuDPpLV1q8sh5DE318ny7j7mli21G1VFHRaPdf6EOzxc8RXd1GLqBP3EIRI0ehqlD5wMvoxngKSe09OwCK18Y7H0+Xraafqo7PD7OtRlR2F5a9UPPkPZzOirCvJykPkIuXJ2bKr7ybbg09Pl90XEX3OHZfjtcN+wraQYc5LS3oYEJga1ZgeCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jCxscIvq6zLulNKcY3/NWbd2vQ3CrupkD38ZmXXmcn4=;
 b=MdZpHVMhraP5u85KQC3ijSjnCOgIAXTEfWvBB4yW5cAqxOMxV2panTgSHYwjeSCh8UZApVYec0MPGqFSKqJ6ef0gMlZw1jK4zzlUEWeb0xLaBA0Xpn/27YNjhUJz8Oi2vXhMbnfnoeMCM14/nJzXehr8vqDahE766cDHJ1wnouA8uND46FhofSkB6zAtYbeL/Zj/KHgBwljjAdFPl2ZJlSL/cRwYMtuSgTHYC+3oZW2SMNXAkLX8afLTEojEAtqm1cxrPsc6h2q305Q1F+KY45En0dL5xJUYUVS6nYT/9kAxqQ/nJKPXT0++yadreIci5+MvpYH0fWrQuwRdaPbmzQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <0ab22edc-bc06-4c52-8cd4-c7dd57746779@suse.com>
Date: Mon, 24 Jan 2022 09:26:43 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: [PATCH v2 2/4] x86/APIC: calibrate against platform timer when
 possible
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <879e5b70-bffd-b240-b2c8-c755b09d41a9@suse.com>
In-Reply-To: <879e5b70-bffd-b240-b2c8-c755b09d41a9@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM6P191CA0077.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:209:8a::18) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c3c46a5c-72fb-4004-e411-08d9df133ff8
X-MS-TrafficTypeDiagnostic: DBBPR04MB7883:EE_
X-Microsoft-Antispam-PRVS:
	<DBBPR04MB78838FFDD5849A62274079FFB35E9@DBBPR04MB7883.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5797;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	kIR1S95DfiauCMPUtHG/XBUnwyx9R0Y2EwnNkaEifUTV5cZ7e7t4gSI5sxwDlO5hKRzAVtE153LvTsn3JlT5EdEZyg1mprOwADyaBoa2dxuuKmeIXcx49W4iXdJI5Svcs/VGApetzPfN2juCamZb3IGp3/sPdFIuu2Ynn6nwCA3TIkDaDI++TWX6aYIx/bgYymsSNrBP10XXUEYRDKNrIrPg+InKKJ/Yj3KjSdSsBosVB8t3Adqom9ZYJtkZVyAXNyj2C9JYaOa3BU4r1nmu5Q8plBtnfRNjRKa208OhE9WKJZjzpldvUvi4nYkyklmoYO3JoWyqYOeR/K5D23cbyJuiuPq2zb8KZbT4hDILBXqbta1fzNQVIpQxCMS3eGuWGxaldvb920yKbwYPrNobT09FcTA2I9+XfKmz+IYrDefri0lzZkmbcbMZqdtINCqyX/PC60gmSaYCZu7NC3lLPLE0xJkUkGzkqwGLWjMz+9tUqhEWnxRlVjhhMRf8MP/6dq3LTSjlpv//15fUEiiN4J49AhnjeYuAwnWXudy/USYG2ORKZMfXaZi6OlK524DhKNyx5ZDo7qZUr9Hr5BRQNnGnUIE2IB7jMyu3VHn2oyjtoOjjXsVccxumd+Mc1HTfP2670wN7kl5lStvtb9p+667CPGOd+Lt+O3lVYLjQZQBbWtlai0et8VtV++WjNFrmfADdJ2DNhGa5Kmy9nikIyMBTq50DZKYkquSzUlEMYGM=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(2616005)(36756003)(38100700002)(54906003)(4326008)(83380400001)(86362001)(66946007)(6916009)(8676002)(31686004)(316002)(31696002)(5660300002)(6512007)(26005)(508600001)(66476007)(2906002)(66556008)(6486002)(186003)(6506007)(8936002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NjV5bVFOc2JjS09vL0JaNURPYUQ5Qy92bVVLdDladGV4NlQ4TnN2WWJ1eWdw?=
 =?utf-8?B?UHFna3EybE9ET0hNODdrSVpXNHdQWU54U3g2ZldzMXdOTjdMZ2VsNmNFc1Zy?=
 =?utf-8?B?eEtZTmxmQmttaWtHMmtzQVZFcmg3eFBoK2VuVU84Zm5pS0FlV245M2FKQytz?=
 =?utf-8?B?aVd3UXhkUlpJL29NNUVpVVJrVmtJRXprekUwTnVzTnVnaXpBbUdqSkRWT0pl?=
 =?utf-8?B?c3VPeGQzNmtVL01LVDdVZ2lwdko5UG1lWjVaV2t4RVJMaHhQMXQvUUduRTVR?=
 =?utf-8?B?ODRaSGJORHdBcTZZZEo4RlRJeUhNM2Z5RWJHaTFjKzByK0tyRnZiL2VsZ1BO?=
 =?utf-8?B?ejFnYTFFNG8xK3RZRUZyM21IcnkxcnhCRXdIaVFwNjdWMDRuckM2VW92ZGlU?=
 =?utf-8?B?dUJRaGdLSmNQaWpzbTRMaXR4VXZDdGlkOUY2OHhGM0pLSm1mbWtHdm5jcEJC?=
 =?utf-8?B?ZFBDeEN5c2ZkUG1OQUJ0M3A0a0xzeDZ0T0hvL0NTTUxqZDZSNUt6cUV3VUhN?=
 =?utf-8?B?RjVEUitxbCs5YnROTVdoNU1aU2l3SXEvQUxlUHE3cnc2UW5BbnUzM0xhNkJp?=
 =?utf-8?B?NlBSWEhpaTV3aHUwQlZSSC9tRUxEMTFteWZjWTFoQTJaNThhT1Z1dEZSRjR2?=
 =?utf-8?B?VngvOUUybGhaMTh2OE0xU0hNNGhzTTFxOVZGWXJOQ2JIdEtWK0J1YWl1RjFB?=
 =?utf-8?B?d2tBY25HL0NxeEJrRkZHdDBxK2lCdURuQ0FWVnFhaE13ODVoSnhxd3ZvaXg2?=
 =?utf-8?B?VklkZ2VxcVhhQldWd2ZlVVpialpURDRkeEJlSzROSFAzK1FlZHJIRnRzVktC?=
 =?utf-8?B?V3RiRnljd3h5KzI1ZjRXb0s4b2hLZE9NbDhyR2VCUmc5cTZDSDFZdjNKSER1?=
 =?utf-8?B?YXhjOTJsZkpFUDFOOFh6USt2ZFI4eUF4ZzBodjdsK092a1cxZTdVSDluRll4?=
 =?utf-8?B?eTVpUnVSVUZSTy9lMlB0cWtoSUtRd3l3NDQ0VWJ4QlgyeGFTcHQ2K2lxMGdv?=
 =?utf-8?B?N3gzaG10YVBwUWFPNmNLZEduU0hxTFp2ajIzcm8vc2dPOUJVOWRpWWRWcDdU?=
 =?utf-8?B?MGE5SzNSZTdKMHN2T0kzdE42dzhmZURCVkk5RzhYUWFKalZsaHFSOTYwY28r?=
 =?utf-8?B?bVNBQkdHMzU4NGQyRHJOUytIZHl5RGVMeDM2SUxPT1crbWxoem9YQXFWWjFn?=
 =?utf-8?B?SzUzZlMyMDdKV2hSS2NxNVZSdm9ZR3FtM0l5WWE0QURkQ2pHNFJsOXpuTmEw?=
 =?utf-8?B?Um1ZYzlaSHpHUWpLTHRtbklOZ3k3NEJ1cERuYnhZQW0rNU0rLzNBNWR0R3NO?=
 =?utf-8?B?cXpCQUNDR1FBaVdMZy9oK2tzT2tVcU50bnZVMzZnTlV1OVlXdXZTRG1UdlZC?=
 =?utf-8?B?UnJYTXpVN1pHVC91QXh4RWhGMWpHLzlpcDFDSTVVRGFWMTNja3hndDJKWlYw?=
 =?utf-8?B?azlvcUxaT2pSa2dmL1ViNnYxYUlENXBHbmMvZ0NrQW43cTZXa1lKd1FmREdo?=
 =?utf-8?B?eUNURTV4ekRJMForTkZSVWYrOGNlbXBtRFJkVWtaRFFDTFRHQkRoS2lmVXB5?=
 =?utf-8?B?SFY1U3VlZkJaVURTdXQrSnVhbkRSeFJVa0ZyQnoxdDR6M1A5bnI3dFhCTXlL?=
 =?utf-8?B?MmtZTzFnMCt1aHNucXhCMWwyVFFhOWRIK29nZDF6alRMcW5JRk1pZnhPclFs?=
 =?utf-8?B?c21Eb2NNenc5Tjc4VXhITlJJbG5nMkN1UVBKSzlqb2hXZkxyK0U2cnk3cHhz?=
 =?utf-8?B?L3kvN1JxTmFvUGlBMmZMRXlxNEdveFpuZGlxUmZ5ek1VcG1pMWgrSXdQTEY2?=
 =?utf-8?B?N05BOUt4Um1PY3Ivd1Y1ZVlUTFhCU1lkUTYzOWJSZGtUMjh0K1hTMFp6THNx?=
 =?utf-8?B?VTVxUDhPdlRNbzVRQWJQa3JJV21mRDVISUUxckxreXVsOHNacXZxMFlrdktJ?=
 =?utf-8?B?OHlGVDlMbDFsMXU5cTZWWGFFUnhmcEljR3QySHNRZmJLeE05SnExVVdXZWNk?=
 =?utf-8?B?T2s4QXJ5anNGZFZLT2lBcjVMZktWSDhtNklaTmhxS29kb2NJelFhdm1wbTA2?=
 =?utf-8?B?VmNhNzlMam1jZFFpOFZJMjdJZFQ3YnRHVWZ1MWlKVVpkQXZyNW4xZXRvdEVi?=
 =?utf-8?B?WVV1Z2ZhOFRNMWw4bjRqaTBUSER0Q3dFSERGNlZTQ3hUM29kVGQ3VTRmaHRF?=
 =?utf-8?Q?Vu53VnRM+qUUkZd/UwrtaX0=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c3c46a5c-72fb-4004-e411-08d9df133ff8
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jan 2022 08:26:42.1463
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wiiV6bjMJvu4qdgLAcW2h85PTwqjNvUzCHICSQOgFUlhg7Xz2to3PMzecEE6C7HAHKY/SdEETslr35gKUie6WA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB7883

Use the original calibration against PIT only when the platform timer
is PIT. This implicitly excludes the "xen_guest" case from using the PIT
logic (init_pit() fails there, and as of 5e73b2594c54 ["x86/time: minor
adjustments to init_pit()"] using_pit also isn't being set too early
anymore), so the respective hack there can be dropped at the same time.
This also reduces calibration time from 100ms to 50ms, albeit this step
is being skipped as of 0731a56c7c72 ("x86/APIC: no need for timer
calibration when using TDT") anyway.

While re-indenting the PIT logic in calibrate_APIC_clock(), besides
adjusting style also switch around the 2nd TSC/TMCCT read pair, to match
the order of the 1st one, yielding more consistent deltas.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
Open-coding apic_read() in read_tmcct() isn't overly nice, but I wanted
to avoid x2apic_enabled being evaluated twice in close succession. (The
barrier is there just in case only anyway: While this RDMSR isn't
serializing, I'm unaware of any statement whether it can also be
executed speculatively, like RDTSC can.) An option might be to move the
function to apic.c such that it would also be used by
calibrate_APIC_clock().

Unlike the CPU frequencies enumerated in CPUID leaf 0x16 (which aren't
precise), using CPUID[0x15].ECX - if populated - may be an option to
skip calibration altogether. Iirc the value there is precise, but using
the systems I have easy access to I cannot verify this: In the sample
of three I have, none have ECX populated.

I wonder whether the secondary CPU freq measurement (used for display
purposes only) wouldn't better be dropped at this occasion.
---
v2: New.

--- a/xen/arch/x86/apic.c
+++ b/xen/arch/x86/apic.c
@@ -1182,20 +1182,6 @@ static void __init check_deadline_errata
            "please update microcode to version %#x (or later)\n", rev);
 }
 
-static void __init wait_tick_pvh(void)
-{
-    u64 lapse_ns = 1000000000ULL / HZ;
-    s_time_t start, curr_time;
-
-    start = NOW();
-
-    /* Won't wrap around */
-    do {
-        cpu_relax();
-        curr_time = NOW();
-    } while ( curr_time - start < lapse_ns );
-}
-
 /*
  * In this function we calibrate APIC bus clocks to the external
  * timer. Unfortunately we cannot use jiffies and the timer irq
@@ -1211,9 +1197,6 @@ static void __init wait_tick_pvh(void)
 
 static void __init calibrate_APIC_clock(void)
 {
-    unsigned long long t1, t2;
-    unsigned long tt1, tt2;
-    unsigned int i;
     unsigned long bus_freq; /* KAF: pointer-size avoids compile warns. */
     unsigned int bus_cycle; /* length of one bus cycle in pico-seconds */
 #define LOOPS_FRAC 10U      /* measure for one tenth of a second */
@@ -1226,39 +1209,38 @@ static void __init calibrate_APIC_clock(
      */
     __setup_APIC_LVTT(0xffffffff);
 
-    if ( !xen_guest )
+    bus_freq = calibrate_apic_timer();
+    if ( !bus_freq )
+    {
+        unsigned int i, tt1, tt2;
+        unsigned long t1, t2;
+
+        ASSERT(!xen_guest);
+
         /*
-         * The timer chip counts down to zero. Let's wait
-         * for a wraparound to start exact measurement:
-         * (the current tick might have been already half done)
+         * The timer chip counts down to zero. Let's wait for a wraparound to
+         * start exact measurement (the current tick might have been already
+         * half done):
          */
         wait_8254_wraparound();
-    else
-        wait_tick_pvh();
 
-    /*
-     * We wrapped around just now. Let's start:
-     */
-    t1 = rdtsc_ordered();
-    tt1 = apic_read(APIC_TMCCT);
+        /* We wrapped around just now. Let's start: */
+        t1 = rdtsc_ordered();
+        tt1 = apic_read(APIC_TMCCT);
 
-    /*
-     * Let's wait HZ / LOOPS_FRAC ticks:
-     */
-    for (i = 0; i < HZ / LOOPS_FRAC; i++)
-        if ( !xen_guest )
+        /* Let's wait HZ / LOOPS_FRAC ticks: */
+        for ( i = 0; i < HZ / LOOPS_FRAC; ++i )
             wait_8254_wraparound();
-        else
-            wait_tick_pvh();
 
-    tt2 = apic_read(APIC_TMCCT);
-    t2 = rdtsc_ordered();
+        t2 = rdtsc_ordered();
+        tt2 = apic_read(APIC_TMCCT);
 
-    bus_freq = (tt1 - tt2) * APIC_DIVISOR * LOOPS_FRAC;
+        bus_freq = (tt1 - tt2) * APIC_DIVISOR * LOOPS_FRAC;
 
-    apic_printk(APIC_VERBOSE, "..... CPU clock speed is %lu.%04lu MHz.\n",
-                ((unsigned long)(t2 - t1) * LOOPS_FRAC) / 1000000,
-                (((unsigned long)(t2 - t1) * LOOPS_FRAC) / 100) % 10000);
+        apic_printk(APIC_VERBOSE, "..... CPU clock speed is %lu.%04lu MHz.\n",
+                    ((t2 - t1) * LOOPS_FRAC) / 1000000,
+                    (((t2 - t1) * LOOPS_FRAC) / 100) % 10000);
+    }
 
     apic_printk(APIC_VERBOSE, "..... host bus clock speed is %ld.%04ld MHz.\n",
                 bus_freq / 1000000, (bus_freq / 100) % 10000);
--- a/xen/arch/x86/include/asm/apic.h
+++ b/xen/arch/x86/include/asm/apic.h
@@ -192,6 +192,8 @@ extern void record_boot_APIC_mode(void);
 extern enum apic_mode current_local_apic_mode(void);
 extern void check_for_unexpected_msi(unsigned int vector);
 
+uint64_t calibrate_apic_timer(void);
+
 extern void check_nmi_watchdog(void);
 
 extern unsigned int nmi_watchdog;
--- a/xen/arch/x86/time.c
+++ b/xen/arch/x86/time.c
@@ -26,6 +26,7 @@
 #include <xen/symbols.h>
 #include <xen/keyhandler.h>
 #include <xen/guest_access.h>
+#include <asm/apic.h>
 #include <asm/io.h>
 #include <asm/iocap.h>
 #include <asm/msr.h>
@@ -1004,6 +1005,78 @@ static u64 __init init_platform_timer(vo
     return rc;
 }
 
+static uint32_t __init read_tmcct(void)
+{
+    if ( x2apic_enabled )
+    {
+        alternative("lfence", "mfence", X86_FEATURE_MFENCE_RDTSC);
+        return apic_rdmsr(APIC_TMCCT);
+    }
+
+    return apic_mem_read(APIC_TMCCT);
+}
+
+static uint64_t __init read_pt_and_tmcct(uint32_t *tmcct)
+{
+    uint32_t tmcct_prev = *tmcct = read_tmcct(), tmcct_min = ~0;
+    uint64_t best = best;
+    unsigned int i;
+
+    for ( i = 0; ; ++i )
+    {
+        uint64_t pt = plt_src.read_counter();
+        uint32_t tmcct_cur = read_tmcct();
+        uint32_t tmcct_delta = tmcct_prev - tmcct_cur;
+
+        if ( tmcct_delta < tmcct_min )
+        {
+            tmcct_min = tmcct_delta;
+            *tmcct = tmcct_cur;
+            best = pt;
+        }
+        else if ( i > 2 )
+            break;
+
+        tmcct_prev = tmcct_cur;
+    }
+
+    return best;
+}
+
+uint64_t __init calibrate_apic_timer(void)
+{
+    uint32_t start, end;
+    uint64_t count = read_pt_and_tmcct(&start), elapsed;
+    uint64_t target = CALIBRATE_VALUE(plt_src.frequency), actual;
+    uint64_t mask = (uint64_t)~0 >> (64 - plt_src.counter_bits);
+
+    /*
+     * PIT cannot be used here as it requires the timer interrupt to maintain
+     * its 32-bit software counter, yet here we run with IRQs disabled.
+     */
+    if ( using_pit )
+        return 0;
+
+    while ( ((plt_src.read_counter() - count) & mask) < target )
+        continue;
+
+    actual = read_pt_and_tmcct(&end) - count;
+    elapsed = start - end;
+
+    if ( likely(actual > target) )
+    {
+        /* See the comment in calibrate_tsc(). */
+        while ( unlikely(actual > (uint32_t)actual) )
+        {
+            actual >>= 1;
+            target >>= 1;
+        }
+        elapsed = muldiv64(elapsed, target, actual);
+    }
+
+    return elapsed * CALIBRATE_FRAC;
+}
+
 u64 stime2tsc(s_time_t stime)
 {
     struct cpu_time *t;


