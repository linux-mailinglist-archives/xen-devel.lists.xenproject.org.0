Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E7D6878C40D
	for <lists+xen-devel@lfdr.de>; Tue, 29 Aug 2023 14:16:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.592155.924790 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qaxeG-0004wo-W0; Tue, 29 Aug 2023 12:16:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 592155.924790; Tue, 29 Aug 2023 12:16:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qaxeG-0004tb-SR; Tue, 29 Aug 2023 12:16:44 +0000
Received: by outflank-mailman (input) for mailman id 592155;
 Tue, 29 Aug 2023 12:16:44 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=mPBx=EO=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qaxeG-0004tN-1P
 for xen-devel@lists.xenproject.org; Tue, 29 Aug 2023 12:16:44 +0000
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur01on2045.outbound.protection.outlook.com [40.107.13.45])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e9e5bd83-4665-11ee-8783-cb3800f73035;
 Tue, 29 Aug 2023 14:16:42 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by PAXPR04MB8607.eurprd04.prod.outlook.com (2603:10a6:102:21a::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.34; Tue, 29 Aug
 2023 12:16:14 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::f749:b27f:2187:6654]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::f749:b27f:2187:6654%5]) with mapi id 15.20.6699.035; Tue, 29 Aug 2023
 12:16:14 +0000
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
X-Inumbo-ID: e9e5bd83-4665-11ee-8783-cb3800f73035
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Zr093Ac/ai/UHHUxClmI7wS5XPRAXYsSQqiPCUjQ8M74c2MGEz3ojE1wtxWcIj6CKcJsdmSCGvbAVNAyOPBLmrkrMOsNuh5C/qqH4dLm3LoOgP7pI7cUptRijCPNFBp3Ad5bIP5c78knIx+3z7EN2EsLB5pdp0uY61RPblI7HyWXifPcJlZWNv5tcH8d0T03j5FFmbbZI8a5sEM7f67UGRJP6VwtgG8NVceuO+J09HmR3vlFETk617pTVfopXitg2jGz8GZU9fKdKM1H/7owmjPwtBI99DJhH2EMtwmyC8jULKTUH3w9hzLRSA/m60Ej6rfUoIyr6X0zgudd4oJ8GQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=byPlITSxbU6diXzkr7Yqb4ZAxb+D+Yzm0kXT6k472aI=;
 b=mVlevpvwK0Mpi3guA0HSMmjPL2FiE/2c5drXXVFhHZhynuU9GyfOVIrOysPb9/pJR6u0YFccn2P9bBcJrpHLB20BC/+/VdesdwepNfo1xqrEDx3yYKcSr8Ej5bpVv1x1V/VqKTtKLQL5EgTnjqfc1XZ4yS0AoE7qKCNJ/Zu7Ici5KnDqz+GhqQCCkz4bMRpdnwYS+Uqj5i74Lx6LRtIIEX2G8QFIQh92Y81KCkfU3YD//gtSLWISravON6rOjiD2fjZQ3DY3xPkMqUo2eBrJ2msqUP7jCROVKDmRHLVzzvyZh7s1jhl8AXoJ9OiQ3rZtsBdg/vYDisvNM75atD4IaA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=byPlITSxbU6diXzkr7Yqb4ZAxb+D+Yzm0kXT6k472aI=;
 b=PD/cadMmtapkYdLto3ZbkCZHh8OIIMpnbfunAwYTkdgy5ZV0+t2ksmICIclE5giWoy2OfJdu6MBjCIEbzgd499PXIohNS48xUj2V65lWli8bBjiqfS1LrpSC3g7zHG6aMwuYP0y1swscaX0CF+P2JTsbIA23PED/uS7Jb6dgGUoNO6Zvn8Si+kyDYgbTSjqUQvVqQ2t2wWCrSpmL5u9CuW/1HuW3OhJHI9Qe0/gmSCHcNfFqFF1NhEbNkFdjpIwKSv0iqqsGtiXmfg3kv5idka4llPdxAwDa4saiKiAAB4mYJRCOCDZVU2PEAFD8QTFVjNSVlUfJO8tfzySs5lX3UQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <4e675365-4ca8-9e86-aed3-ab00571b0066@suse.com>
Date: Tue, 29 Aug 2023 14:16:12 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: [PATCH 2/2] x86/cpu-policy: drop NR_DEEP_DEPS
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <647aa53f-9b2f-df38-6de4-3e407f34f7f5@suse.com>
In-Reply-To: <647aa53f-9b2f-df38-6de4-3e407f34f7f5@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0152.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:b3::7) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|PAXPR04MB8607:EE_
X-MS-Office365-Filtering-Correlation-Id: 6c97185d-0f97-435a-912a-08dba889bd22
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	lIbVtjovJlQTOwX71qH0T5IqzrNn7UbjuuIao0wW1ZWeX3IjlbmPMCdpMC7uIBcibbCCzS0Xt2gY+OpjVTJmwdP9yXgPn33kVHGOogkWwxfAKdXYjjZoxXj0tNn4c8meJSBipptjiCex1oN9lXTLWPyP+NqWyKi2LPSjL9+cekFgKtnCshYMfDxHlJUMn5ITv1JUnecI97jlS3+/tGcDiYAocBzifCLhxoepFhUM7Ivlz3jhzY5uNqEbNmpO1V3xvHteUKVLvuI7+CU2D8/aeqA15WltDXG3pY+UtP/UgIYYUpcxw+U65BJIbAPRjddVFONtrbXdfTQEABKRPkoeARHpXbBDPDE4O9kC2uYc/RReKFkoVTWazU4QzbpBwaojeviKruUJeUve5BqBOibiClOoCcgS9ZoJrUcN3n4zwc6W3qoPw80fmju52M3XnvxXdUyd2l229yRfd7I6WBaWmpBMCnFHkpj22OOrf8DmqDnwHVKoqhT+XX0XR26KvWXxp4Kt08tK1/tCVWbTqghi8yhZulkKSnG64rtW2itMAtSf1ti12PsuLLPcuQPNcMBMshoPW5vELtkjXKAm2sCZAbTa5Su+qjQkfqPuDn/y4dZfQQAcYaHRn9qqaeHAWEB3Ey9zHtW22ueLM10Q0nHpTw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(136003)(346002)(39860400002)(376002)(396003)(186009)(1800799009)(451199024)(6506007)(6486002)(86362001)(31696002)(36756003)(26005)(2616005)(6512007)(316002)(6916009)(5660300002)(66946007)(66556008)(41300700001)(66476007)(38100700002)(54906003)(31686004)(2906002)(478600001)(8936002)(8676002)(4326008)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NjFuV3VZRUI3TnQwc21pY2NrTklhT2lmSW1wWWtsbWY2MFFBblpGZEFmZTVo?=
 =?utf-8?B?VnNpYTU2RS93OEE5dXczTk1iemNtZXpLSVZZeDRFdTJFN3k2VW1RdDdqbkxE?=
 =?utf-8?B?N29MQzFKdFFSQjFTcXN1VkhXa0tsbERFUGVDZGo2bHdzc3FiOUlHMjNFVi9V?=
 =?utf-8?B?d2VuRHRZRWg2SDBTWmtwTEpwSTBQTXh3bVRxWWtoM3JPdXRnSUVYeFRTVWcy?=
 =?utf-8?B?Sm5VbG9RcW5PNVptWld2REg1dXVvb2NQMzhLajNXVlFrcnBETGE1OEVJZEtm?=
 =?utf-8?B?WWpJbUtVVTJXMDAvQnE2eEwzczRCanl5OWxKU0NGRHExc2hKWldrU1ltU2ZR?=
 =?utf-8?B?Q2Z0cjZBUExzdzVFcVF3cWg2dzk0Mm9IS0hsekpFVTVRcTVxTXhaN25rbEUx?=
 =?utf-8?B?K0MzTE83enFzb05ZRzJLVzByZC9GYnlYbVF5TjkwT0Z0eENoMFI0MW93SDIy?=
 =?utf-8?B?b01sYVdId21OTkZmUkhiMDlyRFNXTEw4Q3lvb1R0YzVUenZWelc1Y2ppejY0?=
 =?utf-8?B?YjRUWFQwMzRvRjNZMkdCdXBWdmk3RVVFR1hBWHVxVDRHTUVZRThERnYwdUVs?=
 =?utf-8?B?aW9oQ2YrSkJ6M2h5aXo5U2pxYXFuZzVvOTdNa0tueGlQME0zRGsvRktKcXhZ?=
 =?utf-8?B?NldNSmVwc0xGVE1PcVJRRGFKWE4rWkJCRnV2bTVGa0V1endjeFNZMEt4VmN3?=
 =?utf-8?B?UWhJZG83bURBclNmWTF5VnYyTXBpblRPSHZsdkVVbHJpTDFEL3Q4c1BGRGEw?=
 =?utf-8?B?c21DUTJKN0tyV0tyRUZYK3h3bHlWYnVZeTBrMW9aZmgvZ01GSkRjK2IvT2dl?=
 =?utf-8?B?eUVDSVpyZXJ5aVVuWTh4Wm1lQ2o4ckdhazBFUTNsVGJoVDVBdldLMVVGQnFJ?=
 =?utf-8?B?U1prajMxZ0NxUWRFRzU4WmRvRFV3OXhUbHZYN09saEpsQUpSN2JUWVFsWWpM?=
 =?utf-8?B?VUZaR3pISjBXTTRBMGNiTUoxNTFPcEVyLy9mREltQzhHa0VBK2hoTTJJQ2NL?=
 =?utf-8?B?czF1MGJxL1lrWklvUUozUXZoY3JBNEN6bHVNYXVRMkNvOHlJdHFFTlBRWCtE?=
 =?utf-8?B?MENoempBZS9LNTllNnNFbEpnU3FEUFQwU2VUdXEyOVlQSk5iVU1zWFFhNE95?=
 =?utf-8?B?cEljNGhUcGViMm80YnhkSURCVjUrSmp1eXhHQ21PakVQYjluMFJtZXNid2Z1?=
 =?utf-8?B?TUZMbndjM1RaeEpCOFF2TkpaS2ZzcGZlaXNtT0JnNmYzTW8yaUV0TndkblpK?=
 =?utf-8?B?QnVVUEZPSzhRRUxjZ1hSRTVGWGFuRW80SDdYdE1QbVFSWHlzdngxYTh3Mm1M?=
 =?utf-8?B?VVZNWkpjUEt4eVdNMVdwWWE2ZllJdHhWVDE0QmFKdVVRWTJiYis1dEd3akNX?=
 =?utf-8?B?Ykh2K3JpaGN6UE1hQTdyRkpLUktldldvS2RZdEFRS3J0QkNVY0duTHYxQ3Nw?=
 =?utf-8?B?U1Rra3pjWXROaldzY1o1VURkUjI1bzZPcFJEQ25abXc5NUJsUlgydXZzTmtT?=
 =?utf-8?B?cTA4ZlBGenc0MFRFZEMyRExIWWRobUM3U2hJajBweVlPWmh0akFCL0NQck52?=
 =?utf-8?B?UFJ6aXhac0VnSWJ5cm9FR1NNbEFJNEVONTFYWVNJOGdpK2M2SEt1WnJKZUdy?=
 =?utf-8?B?SW00N0g3dndEQXRnUXk0VExxYWFHMmxEZjU0M1lob05TdDhIUnJWaUFKZ3R0?=
 =?utf-8?B?MURybDZzMEM2M1I2blZXVHQ4ZGhpOEU5MXdkU3NETDBWVzdPa2dyMVMxUENy?=
 =?utf-8?B?eVhVc3daZTF2U1NkWHNadDZKdFhkUkVwU0dtVlluVWpzQ04xNndpNWg2TXcr?=
 =?utf-8?B?bE1QNkxyUGk4OUpiV2l3UUl1M1N2UjNhVW1KUTlxL2NuOUd1SnZpbHh4U2kv?=
 =?utf-8?B?aHZOZStXSGFQRTJRRzQwaGVwd21sc1NDQ1BTYi9zZkhVTXFOTEFpU3lOL00r?=
 =?utf-8?B?dWhOTW5ITXBUNDZGSkVmS0grLzRCcnc2YTRXdjd0UGk0K010N3dyMXg5WU9r?=
 =?utf-8?B?ZTZWNmxOM1cxL0hWb20rMm9KdlU0UmR1dDRZWjl5NHQwVVJJSVpnbXFFa25k?=
 =?utf-8?B?bGNXTDZwSkZhaVF0MzI4MWdsN0NnTDhrdVErN0ZyMFptOXRYYUdwSmMyYnNG?=
 =?utf-8?Q?3tUjhJ86ZFAMjlQ+SV8Z7Xcyc?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6c97185d-0f97-435a-912a-08dba889bd22
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Aug 2023 12:16:14.1473
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +VNxT7r4ZuQn0ONG7MAGgkhsdq8j7J/6vJG90g63IhNUDnn/CO+LybCbpW2LG4NPCpdABaYFpnPV10AkjJD8Yw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8607

The constant is solely used in a build time check of the array size of
x86_cpu_policy_lookup_deep_deps():deep_deps[], thus merely proving that
Python got its internal calculations right. There's no real dependency
on this constant expressing the number of elements in INIT_DEEP_DEPS.

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/lib/x86/cpuid.c
+++ b/xen/lib/x86/cpuid.c
@@ -299,7 +299,6 @@ const uint32_t *x86_cpu_policy_lookup_de
     unsigned int start = 0, end = ARRAY_SIZE(deep_deps);
 
     BUILD_BUG_ON(ARRAY_SIZE(deep_features) != FEATURESET_NR_ENTRIES);
-    BUILD_BUG_ON(ARRAY_SIZE(deep_deps) != NR_DEEP_DEPS);
 
     /* Fast early exit. */
     if ( !test_bit(feature, deep_features) )
--- a/xen/tools/gen-cpuid.py
+++ b/xen/tools/gen-cpuid.py
@@ -37,7 +37,6 @@ class State(object):
         self.hvm_hap_max = set() # HVM HAP max features
         self.bitfields = [] # Text to declare named bitfields in C
         self.deep_deps = {} # { feature num => dependant features }
-        self.nr_deep_deps = 0 # Number of entries in deep_deps
         self.deep_features = set() # featureset of keys in deep_deps
 
 def parse_definitions(state):
@@ -362,7 +361,6 @@ def crunch_numbers(state):
         state.deep_deps[feat] = seen[1:]
 
     state.deep_features = deps.keys()
-    state.nr_deep_deps = len(state.deep_deps.keys())
 
     # Calculate the bitfield name declarations.  Leave 4 placeholders on the end
     for word in range(state.nr_entries + 4):
@@ -421,8 +419,6 @@ def write_results(state):
 
 #define INIT_HVM_HAP_MAX_FEATURES { \\\n%s\n}
 
-#define NR_DEEP_DEPS %sU
-
 #define INIT_DEEP_FEATURES { \\\n%s\n}
 
 #define INIT_DEEP_DEPS { \\
@@ -436,7 +432,6 @@ def write_results(state):
        format_uint32s(state, state.hvm_shadow_max, 4),
        format_uint32s(state, state.hvm_hap_def, 4),
        format_uint32s(state, state.hvm_hap_max, 4),
-       state.nr_deep_deps,
        format_uint32s(state, state.deep_features, 4),
        ))
 


