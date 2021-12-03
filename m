Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 202214676FD
	for <lists+xen-devel@lfdr.de>; Fri,  3 Dec 2021 13:04:42 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.237487.411890 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mt7Ik-00036D-1G; Fri, 03 Dec 2021 12:04:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 237487.411890; Fri, 03 Dec 2021 12:04:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mt7Ij-00033i-Tf; Fri, 03 Dec 2021 12:04:29 +0000
Received: by outflank-mailman (input) for mailman id 237487;
 Fri, 03 Dec 2021 12:04:28 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=EuM9=QU=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1mt7Ih-0002qC-Rk
 for xen-devel@lists.xenproject.org; Fri, 03 Dec 2021 12:04:27 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 29a564c5-5431-11ec-b1df-f38ee3fbfdf7;
 Fri, 03 Dec 2021 13:04:27 +0100 (CET)
Received: from EUR03-AM5-obe.outbound.protection.outlook.com
 (mail-am5eur03lp2058.outbound.protection.outlook.com [104.47.8.58]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-30-LR79iWxJNseilWv7fZIBzQ-1; Fri, 03 Dec 2021 13:04:26 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB2958.eurprd04.prod.outlook.com (2603:10a6:802:a::29) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4734.24; Fri, 3 Dec
 2021 12:04:25 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe%5]) with mapi id 15.20.4734.028; Fri, 3 Dec 2021
 12:04:25 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AM6PR08CA0029.eurprd08.prod.outlook.com (2603:10a6:20b:c0::17) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4734.23 via Frontend Transport; Fri, 3 Dec 2021 12:04:24 +0000
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
X-Inumbo-ID: 29a564c5-5431-11ec-b1df-f38ee3fbfdf7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1638533067;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=3+yaC36DqlsYgMBtQOA6Ygvl1IDjxBnVmeHuhg98YSw=;
	b=CvWZPOSsPsq7fU+h4k3ERFJ2VYiDRXcxCj8J7L2wy/d/1U3eYuaRHIhD+Io8/+IrLDsRuM
	3E2yFvIOS4ArpWubtHUhKXVNjfkgAbcRH0gIitNTNisHwA10QbUFGCq/yzXBAFK7qQYGmZ
	USDn+XZH/m8kghIloZAnbahFTPL4VEg=
X-MC-Unique: LR79iWxJNseilWv7fZIBzQ-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kMxaTo5j16RN5X8zgqO22CAtF9pOAKIXToGkYzxHYY5mp9jvuYdmke0CTrCQoaG2Z5wO7hBADLB+wX8kytYvjbpkIGDogu6OZmsM4ASZ0vgAZEMXlgaEJHgxWc3FqYkPaAiF9o4MAQuesTqOg9HvEjW4b/qQ4VELGElkRyWcwyig8uyQ0aE7nQRyd/XsqaT7QTp7PtFsHNwb/MywSAMxBzxWrj4h8L8yOe3oEDKIbj0XqC97WL1zI3iHtXBATVfbaxfyYe5GBPiGqcScH0h48n3G/xBHRzth9GESveQesAZQxG8VKyAydcjSysmUd/sUjZwq+QKmbxgQgooVqDoGew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3+yaC36DqlsYgMBtQOA6Ygvl1IDjxBnVmeHuhg98YSw=;
 b=BNsB2S1hDC+n1GTCnC9+W+sqdG2R6CvrxPHlsrjEWTOZR6Q3ScDm2mLNTu0e+2VZgYKIs7FOknFzA4dCUF9rmpwECS7qmX0vZuvHxdiemFEcf39j+z9lHHov1dNFJg/CeEkjxpu5Cx7NRJOzW1ui/Qlt510NWaLbJUL5nXtiNuJMvWuOKdENL4fpnIKp5MOUbFV4RfT5q4Ys7B5uI4a9bo36/uX8Y2XjrN8Dvne49/3CllqzIyLAbp3vQ1wHYJJbNVrCCd32GVW5VuJvgVaHhm8GIsiPxT8oEcCwrqppwa8jzynexi3QFTCZ/j7bqiBvvF21xXycWdoyiJQgL/z8NA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <ea513864-58c0-fb90-cee6-f668309fcc38@suse.com>
Date: Fri, 3 Dec 2021 13:04:21 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.2
Subject: [PATCH 2/5] x86/perfc: conditionalize HVM and shadow counters
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <57038a1c-671b-f0f9-1bf1-0ff9bae6e2dc@suse.com>
In-Reply-To: <57038a1c-671b-f0f9-1bf1-0ff9bae6e2dc@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM6PR08CA0029.eurprd08.prod.outlook.com
 (2603:10a6:20b:c0::17) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 83757df3-360a-42a3-f0a6-08d9b6550ca2
X-MS-TrafficTypeDiagnostic: VI1PR04MB2958:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB29582D1221A39D98E60E869AB36A9@VI1PR04MB2958.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6430;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	duvvBCEKiXprorkxaxK+fmynmWcqjILkC1CRV8IYljMmwIyS9DCD+7cru5Ivv0dpgqiGOEajLeAg/QZAfhN5ZqF73VuX5hMPI0TdM4GR0Gkin+T2dQ4+7vGlcs3vmp3ZqwWnZ2fBuHVFqSssfKjQHwWZal82GNV/2ce0FNDETsnG1cINor6SAETOrwJUYYODy02/t5CeIla0PwooUYVcb/2A9ok0Gnbpm6RYvBhOtexHyEUPAq3sNBSBcRBYfVk0GMd6dygR3C4akwqqX+7nQLWa1hD4D51ZJV8vZlPM8aXnEgjzGWe6xY4ZwF50sRdLMNBGWmnCReIBUyLpS0J66NSktnqsRi1fd2n9bZ+rBgjxMhOtJ/t+EkHe/3wOJ+uh3kwhiM6t3u89RFEVa304lwmX8/3Frlta5w/bV4EMrRsF3WWMfnvrq67XiWwg4ig8rNs+gl+edgJkaJajKZocGOjpQn6TFCj7QSjBHbjIkmJl/eUSDKJ2mhmUHN4jpotbQdIVfRrmLQ30WuxxwqM34YrboiYYarKDGuljm6rQsRaypNJTeV/1x3ahJXCbvdd/4NdF6vdaVDCPN1b5PpulGJIRL+/d7SJ8FQCFpYPY1PqPR5tAXvTpbWZL4JJeVHniBzO1eqsLbgvLC/rJOul/jIjQjNBvzHOvTqkr0OeKApV6rVRY1hU5FQpiKNqqdXh6wPhbrtOlxIwTYOltys1FKtzCbzZ/BV4fUua3u1M5xKXVw1VcJ0f8MPwgC16++0RF
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(66476007)(66946007)(8676002)(186003)(66556008)(956004)(36756003)(38100700002)(26005)(4326008)(8936002)(16576012)(31696002)(316002)(6916009)(508600001)(6666004)(86362001)(31686004)(5660300002)(54906003)(2616005)(2906002)(6486002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RUV5aDMzZ2FNN2VUbFVQNTd6c2hLdFcxT1EvelpSaERZRGFaSDNLcmNTVnE5?=
 =?utf-8?B?d09aZHVaYU5uZXdONzNIb1pEM05DUnZFMTdhaXR5Mk1telZBNktxNWh5ZEp2?=
 =?utf-8?B?OWxsaGlYUXRlZkZlZDVDdUZJRFlkS0dwVFBaMGdMM0RRUno2SUtSSDJnKzkx?=
 =?utf-8?B?bm5HMjB0ZkxYN213aTl1RGxMZHRBcWI3dGlUZG1vNFRBR0QvUkUvMWVyb3RG?=
 =?utf-8?B?NDQvLzNsbzNPNUhzNHBUUXU0QUIvNmRLaUhpMGlGaHd1TWFJNVNxOW41bURa?=
 =?utf-8?B?cFl2bHpEVEorM2p6NjVmd0pTbjVWamZTbTNqYnFmYVJBT1RSSDFsSVllZm9h?=
 =?utf-8?B?Y0EvMlM4M1A0Tkd0dk5PcEZrYzlvcGJCL1pDY3JjbDhKOGdVckZ2MFlIdTFY?=
 =?utf-8?B?a21RWVRhbWNQTXdEaVZkMUVseDVRUU1uSk80MXhrTVQ0d0o3bGpFYmRNeVZ1?=
 =?utf-8?B?WFFaSTc0aDhsbG9oTEdTZ1pEQ1JpdlBaT1d5d2s4eldTV3YyMmdzOXRocFFZ?=
 =?utf-8?B?Y3lZZW9ocndjM2oxSGVjSGpacTVjSFJsVmxubTdTdjkwd0lqWTlRNmtpbmc4?=
 =?utf-8?B?ZkYvbHY2RHdOdkN5OUV0QlB0SlI5eHFtRDVyaW5HM0lVQzM1SlZSN3pkVG5K?=
 =?utf-8?B?K2NMa0x2eHVyT3BvOTFmcmphYW0ybVhjY2QzbTV0SDVFQXZOK0VtSDlxWVB6?=
 =?utf-8?B?UXBabllwSWk2aG1FdnlNamZvUWM3bXFPNzh2Tnk2YkM3NHNzcVB4Q0I0bkov?=
 =?utf-8?B?U09hcHIyWjE4NHQ4azJ1a09Qdzd2SVgwVmdoTHdXWldFNDVkRmJqdWJ6bllW?=
 =?utf-8?B?b0o3SUY0TUdxdFFtdFBzN2o1L1VrRzZ3MGJ6RHBtS3hnU1hiLzZIUHZlZTVD?=
 =?utf-8?B?ZndTZUVvNEVDajFaZlRpaGk1dkZUQmhOdVkyWjA4MlY2VWtVZmQzQi9nemwx?=
 =?utf-8?B?b1NSaGwydXdsTXNIL0YzeEdISEhDS083VFVselZqaStrZGF4dTA0Uk1nYXRi?=
 =?utf-8?B?aUhyYkptMnhnMmNCSkpwWUhPcUFTZXVtSW14MFJJWnFTbFBvcXUrTnpuOGg3?=
 =?utf-8?B?ZGQ2ejRaT3BLcWF6N3poSXZHQjRkZDhOQ1M4KytOVVIrT3c5b0hyVmNCS2pP?=
 =?utf-8?B?N3ZwWHRhNFo3Z015UWh6d1ByRzN5K0J2UHNmeFkwVWwvaVVKamlQcFJYM1l6?=
 =?utf-8?B?U2F2WERhSi9XdDZFbnV1NG1OMjZ0UkhnU2cwYmp5VzFlTUFSUWUyc3E4Uktv?=
 =?utf-8?B?WlAwL0FhOW1OTlhxbGNEOWtmaFF3WWdERHRuWTVUeGE2S2x5T2xVSlhzUVV4?=
 =?utf-8?B?WHFjMm5hblFHMklJbWtpeENpaFFHYUFDVERkUDZFR0s4UHd6bXM0ejlsTjc0?=
 =?utf-8?B?c1N2TldBR2JvKzZWS01HT3VFdjU5QlN5WWJHT1N0UThndksvbVp6WnNuYTVs?=
 =?utf-8?B?QmJYWStLM2pZZ2tYbit0eDZGaTFQL2IrSzlmWHAvUHRyOXJqWDZ0bktkckVU?=
 =?utf-8?B?a0o0eDY0VEZHRFdFZ2xubFQ0Sit0YktHQ081Zzh3YXl1TEo2ZUphRFI0YnQv?=
 =?utf-8?B?ZnVQYW9UMkdYVzJ3ZXh5RTBLU0FNc1FOMllSUFREc3VrMVQxbmFBaTY4anBq?=
 =?utf-8?B?bzd4elgwaFhvUks5OWppaGVTVG9HVjBMN1ZFWDFLVWFoQ1JoMmlvTUxSOTRs?=
 =?utf-8?B?dUtmQ05Ocis5NFZyM21aM3RLQ2ZWbDN1aFBLeUgweGtuaTROQXB3ZUUvaWw3?=
 =?utf-8?B?RXZ4THZkaThtMkt1bGJZQm5qbC9saUo2elo4NlRSaWlPRmtrcFhFcjhjRTR5?=
 =?utf-8?B?ZDVGS3Jrd0htUFpnZUhJM3YreHB3SDIxT3dMSEZzVjZ5UjlvVkJHMlpmMEUy?=
 =?utf-8?B?eFJvNnlHbDkwWXorRER4ai90WE1CQnMyV2lWYlpCMmpMNElDVlVVMTE0dFdH?=
 =?utf-8?B?UjJsalk1NVFpQk4xTkpTWmJTazRaRlJqajA0ZW1iakpMZ0tzcW5SN2JIQjZL?=
 =?utf-8?B?QmVERExtaU04RWZRTUYzaFVSd3JUQ2hDSE5SSDFJRWwzRmFJZFBLMzVhWGI2?=
 =?utf-8?B?dUdZWUNkU0JJWnF2Um9iUnBYV0pQTUxMZUdYU2E5Tk5TVnhqd3E3MnFIbkNG?=
 =?utf-8?B?NnpBYnRYakZLNjhnbTlaT0hsdjdqSjN5NlRSSWZHempqQ2FoRWl0emJ4a0Nl?=
 =?utf-8?Q?HvegpAm24IfYJaXK+tej6js=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 83757df3-360a-42a3-f0a6-08d9b6550ca2
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Dec 2021 12:04:25.1125
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ry14BUNpxSS5vItZ6Ocy7ZrT4ieHtt659dW8q4Qzn/lEWNt8FBKkUfnJvnS1l7Dn7veKwR+FmnoZW5UTKrN/eA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB2958

There's no point including them when the respective functionality isn't
enabled in the build. Note that this covers only larger groups; more
fine grained exclusion may want to be done later on.

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/include/asm-x86/perfc_defn.h
+++ b/xen/include/asm-x86/perfc_defn.h
@@ -4,6 +4,8 @@
 
 PERFCOUNTER_ARRAY(exceptions,           "exceptions", 32)
 
+#ifdef CONFIG_HVM
+
 #define VMX_PERF_EXIT_REASON_SIZE 56
 #define VMX_PERF_VECTOR_SIZE 0x20
 PERFCOUNTER_ARRAY(vmexits,              "vmexits", VMX_PERF_EXIT_REASON_SIZE)
@@ -13,6 +15,8 @@ PERFCOUNTER_ARRAY(cause_vector,
 #define SVM_PERF_EXIT_REASON_SIZE (1+141)
 PERFCOUNTER_ARRAY(svmexits,             "SVMexits", SVM_PERF_EXIT_REASON_SIZE)
 
+#endif /* CONFIG_HVM */
+
 PERFCOUNTER(seg_fixups,             "segmentation fixups")
 
 PERFCOUNTER(apic_timer,             "apic timer interrupts")
@@ -37,6 +41,8 @@ PERFCOUNTER(exception_fixed,        "pre
 PERFCOUNTER(guest_walk,            "guest pagetable walks")
 
 /* Shadow counters */
+#ifdef CONFIG_SHADOW_PAGING
+
 PERFCOUNTER(shadow_alloc,          "calls to shadow_alloc")
 PERFCOUNTER(shadow_alloc_tlbflush, "shadow_alloc flushed TLBs")
 
@@ -112,6 +118,8 @@ PERFCOUNTER(shadow_unsync,         "shad
 PERFCOUNTER(shadow_unsync_evict,   "shadow OOS evictions")
 PERFCOUNTER(shadow_resync,         "shadow OOS resyncs")
 
+#endif /* CONFIG_SHADOW_PAGING */
+
 PERFCOUNTER(realmode_emulations, "realmode instructions emulated")
 PERFCOUNTER(realmode_exits,      "vmexits from realmode")
 


