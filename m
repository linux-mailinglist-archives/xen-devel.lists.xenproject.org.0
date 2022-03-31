Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E0744ED6E9
	for <lists+xen-devel@lfdr.de>; Thu, 31 Mar 2022 11:30:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.296805.505352 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nZr7p-0007gt-2c; Thu, 31 Mar 2022 09:29:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 296805.505352; Thu, 31 Mar 2022 09:29:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nZr7o-0007dQ-Ua; Thu, 31 Mar 2022 09:29:52 +0000
Received: by outflank-mailman (input) for mailman id 296805;
 Thu, 31 Mar 2022 09:29:51 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=TTh1=UK=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nZr7n-0005JJ-8y
 for xen-devel@lists.xenproject.org; Thu, 31 Mar 2022 09:29:51 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1cf5c3a4-b0d5-11ec-8fbc-03012f2f19d4;
 Thu, 31 Mar 2022 11:29:50 +0200 (CEST)
Received: from EUR02-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur02lp2058.outbound.protection.outlook.com [104.47.5.58]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-4-SGmMGXfgO_667l57DKBIug-1; Thu, 31 Mar 2022 11:29:47 +0200
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com (2603:10a6:10:2db::16)
 by AM0PR04MB6161.eurprd04.prod.outlook.com (2603:10a6:208:148::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5123.21; Thu, 31 Mar
 2022 09:29:46 +0000
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::914d:e08d:7798:8476]) by DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::914d:e08d:7798:8476%7]) with mapi id 15.20.5123.021; Thu, 31 Mar 2022
 09:29:46 +0000
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
X-Inumbo-ID: 1cf5c3a4-b0d5-11ec-8fbc-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1648718990;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=izkM3/z4sPkt4zpxlsHGtY1fc5KRMyoYNoGbHZjH4Q0=;
	b=mYWhfAt4wjtQW5Cxn3zhirewX7CVQsGTnGi5PlKCL3WcRDOaBnw7RD3lxewT44z4yRdM+2
	R71SpBWA40/e/HshBctJFzJyCIP5+YjkCKuZ7cUVa2HgRGbv67nTuU95K1giuDFxKgrxjY
	R1SC6y5OmqElHynqPN5PehWSdHbumPI=
X-MC-Unique: SGmMGXfgO_667l57DKBIug-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TCRIT5/BMJ3RHYIz3kjxkjPL8Nw8rd20IpoCeFWWKn2oIgMIe6FoIFmpYiNIjZVFp/1f/C33YROc6wsHcWYzubMEdBedVtZ/XsYsVeevq9/IOorDjwZuFjs5sDixuKw9bMcmIa4s9DV7N+3MxBtaAH71TLebn5MnNuxEQabydnjUbbKtNmD30QCFzIHuW7zTDMOssWsVLELiQIFKLGpDwYNB5o+uEYoNHd2KCuXVtVMVNNA+e1XxBS4zvQk9QLh8Y3pwaZd59BJecTqa+m+nYsz1buAM7iiqXuc/8kJjLZG/3VyK/gRLg7J+1k56QoGBnYL8lx5KDb9Q8yd3APWHAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=izkM3/z4sPkt4zpxlsHGtY1fc5KRMyoYNoGbHZjH4Q0=;
 b=TS4TuKTtl+T7D+tlbqCyAA/F1RxlZTGihpOyzIzLxJdw7XKrMOZtj9TZU2hKh9fuiivrCV3Vh+0JK1M9Kj9IcDcQSlxy0RrtRqWfiNnZ0TFlP74tjBHF4NQTdyCaaFnjpkgzqfEucKWFTnzoQVeIdQodRXfDjuX6xN3DS+avOzaoCatTTRX5pz3K79Sw5HK2avZm7llaZ1LJFNFJX85Goj5M11Ti/6BcgicFqq9WjbKf+RbeDUbXzZHuQJ0ELjN+Gd8pDgheAvU/gUHXjpcxsiYVJJLRro6phoIjtuPTCzS90zwv0dMTUl+P4sqi2UoyM82uBhzn386pTYyHcQ3mLQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <37ee7fe7-1218-7fa3-bc29-0fb45389bf75@suse.com>
Date: Thu, 31 Mar 2022 11:29:44 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: [PATCH v4 1/4] x86/APIC: calibrate against platform timer when
 possible
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <6e540bc9-c536-84ac-fb1c-8271e7731b3e@suse.com>
In-Reply-To: <6e540bc9-c536-84ac-fb1c-8271e7731b3e@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS8PR07CA0007.eurprd07.prod.outlook.com
 (2603:10a6:20b:451::6) To DU2PR04MB8616.eurprd04.prod.outlook.com
 (2603:10a6:10:2db::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 74fd2d73-fabe-4521-68f5-08da12f8febc
X-MS-TrafficTypeDiagnostic: AM0PR04MB6161:EE_
X-Microsoft-Antispam-PRVS:
	<AM0PR04MB616136F3659C67DA9889C215B3E19@AM0PR04MB6161.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	0uPofuTbHtC9SMECRn2gXw/CZqa+1EY637Qh0bQ+NBUz5rbycj8lpTtX/zYYtTRXoyUzIChe0LEYBu+b+SfitBqcrfy7pbamFkMjzDu+DK2PejOnb6u5rQXTQ0tb2po3l/DbwDQw0f5lYqZOQENwc1Af+bTEte4V6aM0BOuEgmEul8CU0vSCdRo8FgpVhRe8Kje8z8Q/TK0i98ekpcjmfWa9eoKjAFLD2LxeL9GYFn7U3bBxwkt07JBQeldOIUU8jRF+F6T3Wsvnbcb8NYvmRhmNzOe6ruSKkw22WYZApt2VTd/RlGjChu4qCBzpl6JBAYmK1RGxK98fbnqiHvAbAFttSZ3N7MDvTpdMFXlD1YgnkEMkyNO4ULvBGzCAhQasHtwOAuP9/TZym3qQD+jov6tdWRPXfunK8UGk26vkm2XHET3UZx781z/ezb1wyb/TMvBtnP0ug0I3s/vHvVyVi4/T0KAOJEJ/RalUwCYTpTWr5+gNlPovY2donD3d5Y4rnFs08nR3QyUqm59eQkdl9tf1Z1WRa/7niFeCbS/CdSVLF+VhAj/OtYVRgFxG71ISLBgtJIkWKMoHCUHOSTz2P6mi9loovRRmaSBmAOqXgJ+matVcswA8FqAzJoADwseSU5raygnzn4yyINS7rkdiNV0bKi1mYSHkXj+8QP9zG4qxvw2qh9zOrr8XKPL9GeuOywQu52bxzAqrO7XCnJ1FD6dL1gfOx0OZioKHxOJtjt4=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8616.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(6916009)(54906003)(66946007)(38100700002)(2616005)(8936002)(6506007)(66556008)(5660300002)(8676002)(186003)(2906002)(4326008)(66476007)(26005)(316002)(86362001)(6486002)(83380400001)(6512007)(31696002)(31686004)(508600001)(36756003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?KzBac3dDclZQVGIzbkN0cHpyVk1iYk01bUdIdjdObDB0STNJMGxQMUU4c094?=
 =?utf-8?B?RTJ1L2tiemNYb2tOWHhZWnJKaHEzajBrWC80aE5mN0htYUlTUDhsN0ozZkxE?=
 =?utf-8?B?UnBhYWFZblY0TmRsZHc3ZlF5WFBFSGsrQ2xkZkFXdzdqRFU3dkRkNUU3U0Nz?=
 =?utf-8?B?bVdvZ0g5aFVMVHhXSFFVSVZIazRLbFlFUEJ0S2xFclRtd1JVNVRoOTFqSnhl?=
 =?utf-8?B?M3lBM3RNZDlvUERZUlpMdjZ3aEpQKzJSVllsMEQ5eld4M1dWRWhjYWJVbW9S?=
 =?utf-8?B?Mm14dlF0U3h6QnJ0TDB0QU80Uzd5L1Rsa0h6d052bUUvQitaakcwSmVROU9S?=
 =?utf-8?B?ZU9FS2ZENUgxYU1PZVdVM3huL0haSGNCaHhId05JLzJmazJqQWJBektCcjhO?=
 =?utf-8?B?S1VnL2E5Ky9sYzBUY0NoRlc0SmZ5ZDN1TlpkNHk2K2ZXMXgrYnJWMFNsbzND?=
 =?utf-8?B?Uy9DRDgwcStiYVBycG16VkF2YTAzMlFSQWw4b2hKZzc1YThWTG5ZNVllc3dt?=
 =?utf-8?B?TkdDVW1vbithRmo2QUt0UTJ5ZmR6QlJFUU84Y2V6bTROZVpHSHljb2JNMFlS?=
 =?utf-8?B?a2hPYTdZWm4wbVBQSm93UlFZRlc1cytQelpOeDk1a1N6VDdjNGliTXVqVGRR?=
 =?utf-8?B?NTVvMWxIbGRhWmJoNllSTkZlVEQweXJpdEpPajNPQnR2Zk5YYWwybXIvdjQ0?=
 =?utf-8?B?RHg4b2YyVUVFeVVaTWR1Uy9DTjY5YjlOOEQrMXhucm9OVC9TU2p4Z1JWdUF4?=
 =?utf-8?B?UUVkcFBDRzZLeGZhTGt0czZmT2NJK0t5NUNiais2bEx4QkRMNXFiWWVEd1Nn?=
 =?utf-8?B?bGdZMS84SlpwRVNqVlhLQzBvcmxKalI0Qm5WQ2FIRjVoLzk2K2ttZjFobnMx?=
 =?utf-8?B?TFF2MFRLQldzL2srZUJlbHdNREhzVHVFbDduaWhOZ1VzNjBTNE9YT0JXY1pj?=
 =?utf-8?B?bC96YXNCa1RNbE9kYmQxeWNiMDJORFhWVG93TDJ3NTZVK2c4eFd0TkY4NjJQ?=
 =?utf-8?B?RWNpMmFpdUVmaU1WaTY0UzRSVER6aWRydjdITUlrb1FSWm03RlFuMUxsZ2x6?=
 =?utf-8?B?clltNnJhSVBMWHhUVXh1TndoSXpXZGxHZkZGbjJnaDhSZ0d1aUxGWG1VY3h1?=
 =?utf-8?B?eWhYU29yMFk3Z3MvUW9UOFljY2pzelpRZFk0Nm0rRTA0c0RVVmdtK3ZYdEhn?=
 =?utf-8?B?MlVYYi8vQ3ZlbFY3OHNvZFBuSnFvQXF0UzAwVWdoV2N3N0dHcHZob0FIbVFv?=
 =?utf-8?B?VHhyYU82RzhscTZ5bWdCQ1A1OU9mR1ozRDdWSWo1UWh4TWJ2R2Y4YUw1OGIz?=
 =?utf-8?B?TDhFNWlPcnVwdk5icG9LMlFDZU92VDV3cFdNK3Mrb1hCeFV4YzZ0dlAwMlhU?=
 =?utf-8?B?dnZ1WW03ZGVZYnN6VjN1bkI0SDVWWnZNTS95WUpCVnpsVlgrRDNadW1TUFN5?=
 =?utf-8?B?MFE5d1V0K0JyMkJ1WlY0R09oY0s5Z0thWnROdmtDYWFyYkxvTVRXYlFEMlIv?=
 =?utf-8?B?M1RMRWJWaEY0Wm1rYlRYNU9Na1ZDejlYbDRHMDBpUnBkM3ppeU14aU5QMFV4?=
 =?utf-8?B?YWhUKys5Q09pa0ZCMmdoc3Y2RGEzcW5PbkdDTDNiYVpQK3JTY1ljU0YzcGg3?=
 =?utf-8?B?RWxKZ05SU2JUY0x6Q09CbVRPWjhzcWNNRVlXVm92c0dNTjhSZEVhN3FoTlRy?=
 =?utf-8?B?bDRrLzByOXZMalhHQ0dmUnR1d1F6bGk3RnJTT2UxQWNjTXhiZTFSMkZTS2Jr?=
 =?utf-8?B?RDRHU0ZFYzBoc2JpOXI2aUV5QU8yRE4xOEtrUE9LNWdMbTZWc3RFb0Y1cWEy?=
 =?utf-8?B?dEZwbXBVOXhTbzQreWhlc0NWa1UzZjRoWFh4WXNkYVV2K3dmcXN3WXlZOVdk?=
 =?utf-8?B?ZFFsOXJCSzlCMlMrS3lEVExnRTcyblBWTjl3dE1CajNvOE9vMVpMTXJuYkZP?=
 =?utf-8?B?cWVCdXpvR2ZsNUN3SDlTRVlDL1UyMG9XNmhaVmcxZGwrY0ptSnk3V1IwNm1t?=
 =?utf-8?B?UjZhTjR2NTB6aTdZRFdIaVkzN1dYcWllNjB3UXdMc01QbTNjV3ViZXJtbTdp?=
 =?utf-8?B?ZC9jQXNwSHFuaDJQU0RqU3RsMFJWMTE4ekNPYk11d3RvNGpOOC81cnp1c3VE?=
 =?utf-8?B?N1E0MDRxeTdYZ0hEYjN6a0lsMFlmVlo0MytqOHlTRnQ0TlVhcmNZMW94SUxM?=
 =?utf-8?B?UzA3T01JeXY4T0tDYVQrUVYrU0VRODZsY3RJY1hTZVh3TzJPNnJmM21FQTcx?=
 =?utf-8?B?NEhKaFpSQkJOdldWV08ybUFXZUl4MS92TjB5aFloK0VSWTEzQ2pOM0dqalZn?=
 =?utf-8?B?OE9DU0hDS0FrVEVkNUd2dVk4WTU3ZlNqMitLOEpsaXFub3JYVHlFZz09?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 74fd2d73-fabe-4521-68f5-08da12f8febc
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8616.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Mar 2022 09:29:46.2546
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9mmIUx9VUgow94qic/LnAooyQrhZF66/Z1VoDKGqZU5LewpiXQu5xCC1pEZYjeQm0z9uUBNj1hg1/+YQWzqokg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB6161

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
Open-coding apic_read() in apic_tmcct_read() isn't overly nice, but I
wanted to avoid x2apic_enabled being evaluated twice in close
succession. And I also wouldn't want to have the barrier there even for
the (uncached) MMIO read.

Unlike the CPU frequencies enumerated in CPUID leaf 0x16 (which aren't
precise), using CPUID[0x15].ECX - if populated - may be an option to
skip calibration altogether. Aiui the value there is precise, but using
the systems I have easy access to I cannot verify this: In the sample
of three I have, none have ECX populated.

I wonder whether the secondary CPU freq measurement (used for display
purposes only) wouldn't better be dropped at this occasion.
---
v3: Move (and rename) read_tmcct() as previously suggested.
v2: New.

--- a/xen/arch/x86/apic.c
+++ b/xen/arch/x86/apic.c
@@ -1183,18 +1183,20 @@ static void __init check_deadline_errata
            "please update microcode to version %#x (or later)\n", rev);
 }
 
-static void __init wait_tick_pvh(void)
+uint32_t __init apic_tmcct_read(void)
 {
-    u64 lapse_ns = 1000000000ULL / HZ;
-    s_time_t start, curr_time;
-
-    start = NOW();
+    if ( x2apic_enabled )
+    {
+        /*
+         * Have a barrier here just like in rdtsc_ordered() as it's
+         * unclear whether this non-serializing RDMSR also can be
+         * executed speculatively (like RDTSC can).
+         */
+        alternative("lfence", "mfence", X86_FEATURE_MFENCE_RDTSC);
+        return apic_rdmsr(APIC_TMCCT);
+    }
 
-    /* Won't wrap around */
-    do {
-        cpu_relax();
-        curr_time = NOW();
-    } while ( curr_time - start < lapse_ns );
+    return apic_mem_read(APIC_TMCCT);
 }
 
 /*
@@ -1212,9 +1214,6 @@ static void __init wait_tick_pvh(void)
 
 static void __init calibrate_APIC_clock(void)
 {
-    unsigned long long t1, t2;
-    unsigned long tt1, tt2;
-    unsigned int i;
     unsigned long bus_freq; /* KAF: pointer-size avoids compile warns. */
     unsigned int bus_cycle; /* length of one bus cycle in pico-seconds */
 #define LOOPS_FRAC 10U      /* measure for one tenth of a second */
@@ -1227,39 +1226,38 @@ static void __init calibrate_APIC_clock(
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
@@ -192,6 +192,9 @@ extern void record_boot_APIC_mode(void);
 extern enum apic_mode current_local_apic_mode(void);
 extern void check_for_unexpected_msi(unsigned int vector);
 
+uint64_t calibrate_apic_timer(void);
+uint32_t apic_tmcct_read(void);
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
@@ -1018,6 +1019,67 @@ static u64 __init init_platform_timer(vo
     return rc;
 }
 
+static uint64_t __init read_pt_and_tmcct(uint32_t *tmcct)
+{
+    uint32_t tmcct_prev = *tmcct = apic_tmcct_read(), tmcct_min = ~0;
+    uint64_t best = best;
+    unsigned int i;
+
+    for ( i = 0; ; ++i )
+    {
+        uint64_t pt = plt_src.read_counter();
+        uint32_t tmcct_cur = apic_tmcct_read();
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


