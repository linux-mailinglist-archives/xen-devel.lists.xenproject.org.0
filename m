Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 452E0665D1D
	for <lists+xen-devel@lfdr.de>; Wed, 11 Jan 2023 14:55:24 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.475361.737047 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pFbZP-0007B7-Gs; Wed, 11 Jan 2023 13:55:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 475361.737047; Wed, 11 Jan 2023 13:55:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pFbZP-00079E-Db; Wed, 11 Jan 2023 13:55:11 +0000
Received: by outflank-mailman (input) for mailman id 475361;
 Wed, 11 Jan 2023 13:55:10 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=1UMm=5I=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pFbYy-0004QI-Bw
 for xen-devel@lists.xenproject.org; Wed, 11 Jan 2023 13:54:44 +0000
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur01on2059.outbound.protection.outlook.com [40.107.13.59])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7f31bd34-91b7-11ed-b8d0-410ff93cb8f0;
 Wed, 11 Jan 2023 14:54:42 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DU2PR04MB8551.eurprd04.prod.outlook.com (2603:10a6:10:2d6::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.18; Wed, 11 Jan
 2023 13:54:40 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2991:58a4:e308:4389]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2991:58a4:e308:4389%7]) with mapi id 15.20.6002.012; Wed, 11 Jan 2023
 13:54:40 +0000
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
X-Inumbo-ID: 7f31bd34-91b7-11ed-b8d0-410ff93cb8f0
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ef4eBs+AKiiy090udEb1VC+i9u//RYUJ5ou3mdLgQ9b6v0NqFQZm3eOYB/2LvKMsMQza4tj4RkVFhV1PXHJI6VJyJbiFPAKMAcfnEFsuSCbco8F3PbSaUozDvVb5GKQdJvFGCu1Z2pwb3GNsS7dIy3CT85Fh4sw2nG95zVepUBfHQaVQORMxlIlmAvrRf5Zcm7DQdiwoVMzH58trVcID0Hw8LTQgpDs8SNBs9tpusHwuXTL8ZCnUGq4SUHdHDWUkJ3ZG9avyKxF4OUWIxAEZQUX5TS+/pQ2oIDcsrrRXfxrr8+LwuC+hr2fo4NY+jAiENdlTLFlnfI/TDt2mfR4Tlg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+A1uJIX8hCVYxMZpSUyJ3UOaNSMYMDBoFU6vGM6iCfg=;
 b=ZFVuMt3mAXTXntaYkgz/BRN3GtdwR7DDbyo2AL6oRH8Nz3lP/fUHEYmmmsqY0TPv5Qgz4oyTfc+ruFgX6WTZe66E85NXPcWKELzZ0oYWL7xhC0RnF1VUPQG2dYiG9u9Q+dCd5sYctXVmvKOkDo/pdwhYRsAylsYc3uFTxkOldJsVX8B283OMV9bt1aiQDQE6FzRc2mMnfF2Ocnp/0IRt9ucbYoUVVZfAWvuu89fLs8V7dev7MywsglWEgu2aQU9VHvt1ov/SWqkXRysPZCg/Kf9w6+YhtWkUpHVll9euzK4k76P70I9e7eY7kcO2mnwdt4jFaRsraGXrGedM2DWBhg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+A1uJIX8hCVYxMZpSUyJ3UOaNSMYMDBoFU6vGM6iCfg=;
 b=nzbKpI3XMAKMvios3Vn76ZE44+K5Hsg4OavvTdiW5CyfvFWOqTD41O8F6Ty6dj1xx9bJdhHbg3SaKGZugR4SaR3w9et0Y3glkIcZYXjHK4px8ctLZs1IfBNaO5RkR8HVOLAt7tnVny9YXj3m/R8dQ79PAcMQF/OJWF2X/T0YTl7QQMWVUIFy0Q8sHJB2C1FLf17L9yu4Xj7/LShwjNeLWartGKQKXozKXLBtPVEXJtSo/Bvkqq2IT3xD9Cf96KW5TwCjI4Fi7dIlOTfdj5q4FX8sgTltaiTMskUg4D63GiGiFUMqji4n7BjlpZ9kt/hNSsN41d25q0A8EiMFUTr4LA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <27a7245c-f933-5b2b-5685-d9ba2dbd4a8c@suse.com>
Date: Wed, 11 Jan 2023 14:54:38 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: [PATCH v2 6/9] x86/shadow: re-work 4-level SHADOW_FOREACH_L2E()
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Tim Deegan <tim@xen.org>, George Dunlap <george.dunlap@citrix.com>
References: <f17d07b3-2558-70b8-9d1b-b599a54a2d59@suse.com>
In-Reply-To: <f17d07b3-2558-70b8-9d1b-b599a54a2d59@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0032.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1c::13) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|DU2PR04MB8551:EE_
X-MS-Office365-Filtering-Correlation-Id: 77f40980-f1c7-40ad-5378-08daf3db62c5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	x4WqpYgLr3iqSQJb/MamaeokYvbenoEW649EYtu+cuhH/ix4DTkhY1/cFxm4HRpMoKnPwrg+C6hIZnq4G9IOr/UChdZwWP01Tp4cTifMGmiJMzGy/s/TO1o1HXFQrdXwqWX9l/XGRLRn16DufIJtg+ugZYq3OM85llPVxZlCIQbnHtHp6ehipwDi01Qv7MG/PcorOqHey/gJPI8U/vTdjoT+hb7ig2NDjs1jikpb+AkEPvGaofjoQMO1jURtIaCrbBsJsuqsaI3TJjYHVOwd3xDvWPa0eZtpMAlcgXBUsk7JVraBvi4G1PS1y3jYMjc9BkGTK0QfceRDovUheuY3v6V0c/332dtcsxgfcOw0W3jIxcQqqET5zJl+gaDzP5AYw7wI6xbBWlbeKdVYlSLpKJnB5hyAtao+N4g6gMmfKTpyvhRMA4q4t3t+HAeb2Yryh6w0aisnvTIFjhC7AoBpMlDvq+OkfmpcCbFSSTfrOXwweEATVTVdmEURl0BRI2RB3v+4zQ7oy0Bv5KUvkih3hpWgcR2LLxgSx+2LhsXlMfdH0Oiw9WKoyX2dhuwgZV0dl1b440+hre6yNtz7Rrf5/UVV/KJXZewMbISD7h9bH8TM52J8vZyMLO/7Yce38egF8yi14dUhr4uXq66/UovksTI/oZ0aGwVO2sA3m41Ic6vMf47yCkIlVNTY4cZ5Ng2L8a5JHGmfvRL0Lp+GdsGBg99RlRrSAOxQlWDMQWlZ1Hk=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(346002)(39860400002)(366004)(376002)(136003)(396003)(451199015)(8936002)(2906002)(5660300002)(41300700001)(316002)(4326008)(66556008)(8676002)(6916009)(66476007)(66946007)(54906003)(26005)(6512007)(38100700002)(2616005)(31686004)(86362001)(186003)(31696002)(36756003)(6506007)(478600001)(6486002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SHlTSy9mMzk3OWVldEV0Qld4T1lpQWUzR2hKMU1sZW85aVVjajVmckxvNXFx?=
 =?utf-8?B?SWowU09ySExoYnpjWExlcDlNa25nRmV6QW9NVVRMT0ZNbS9XWkpvZlB1S0VC?=
 =?utf-8?B?SVFYaGQvalQyeXhYc3VmQ21FaVZXeTNDZkdLQnk2R0ZsQXdMOEgycjhMNkZQ?=
 =?utf-8?B?eGtNUG9jRlN5cXVrUG5aS1pjNjZmbWxlWVo1Q01jM3duUG9tYWJBalZDYVBY?=
 =?utf-8?B?UGlEK1dNQmlNbjRwRTNjdVBpc3lxUlBnMUNaakNrOTc4UEZYNFNqbWowTHNp?=
 =?utf-8?B?a0daV2FaMTFUc3JkbEtlckcwOTJHRWFoODlVR3BEVFk0dDBjU2JYdWd1WHZE?=
 =?utf-8?B?Y1Z4aUNiWTZhYkFXeURSRnFnMjU2bmkxbmIvM2ZqNC94QkN2TFFKZzc2c2dG?=
 =?utf-8?B?N1Q2ZzROeTlFRGZvdXJ5VEVWbzZOaDlUZlFHK2JNWk9yb3VXWmVxZFFpbThC?=
 =?utf-8?B?VUU4YzZWUk5vQjBpeFl2R09RYTBrYmNmbzdDZGdCRjBPOEVFTTg3cEFweXVD?=
 =?utf-8?B?OTBUMnVoNnc1bithOG9sN2VlYmhYdWZVVkF3R1Rwd0RKdktWRHMwOFB3amJF?=
 =?utf-8?B?QTFFK2t3OEtvNGw3ODg1anJ0M2pZVHJ1dHhsR0RmTWN6NzBIR1JLT3psT2hy?=
 =?utf-8?B?alc2N1d4a05UWUhZcWh1VHRLUjJKWVVrcnpnMmJoTXY2NXhsWkR2OXFOSElz?=
 =?utf-8?B?S1ZuMUdDckxPeStGdVE1dmZXZlZRR2NhaDdZUEU3UGJQQ0locWk5bCtjeExw?=
 =?utf-8?B?bXlUUFdZUklhejdPQ2JycFhPYXJkeHFjUm54VklLYnNRcHV6S2hSeWwxemM2?=
 =?utf-8?B?VWtTYTJIRnNzV0ZKTjBiT0U5Z1RnZjVEa0padTlCbWVTMWlRQU1TSnVINnpl?=
 =?utf-8?B?SkU2TVVRcmRYbnJRN2pMOHBDTVdZVkVycFhxZ2VDVHZaNVg5TVBkQTE3NENW?=
 =?utf-8?B?WEo1ek1ybDhURzErM3B2VHFWOFNTS3JOS0NKamZQZXJWa2ZMcHhhL1JEcUI1?=
 =?utf-8?B?YU9KZnlPS1NIc3NDZ0hXcDlaMnJXNW5WOEhNVUMyZkFldFhxYUVLUHc1cWJV?=
 =?utf-8?B?d0R3Ri96K2lGUTV1czQzWHl3dzdJUHczdFBkT2NpZnYvTHZhUXMxV0p5WUpP?=
 =?utf-8?B?QTZyczI4VU13Zk15RytNK3lpbkNzb0pEVWNRdmZMcnl1dWZva2cwem5KZDJ4?=
 =?utf-8?B?QisvM3ZpK0pRM2FjVk93T1dRbHVxbGZ3NCtMNG5DWnNXc3VCa0MvZStkT0p2?=
 =?utf-8?B?WEJBV0J3QmlOYndoY3FGVklNYWN5MU4xL05lb0FndUJieGhwRC8xNjA0Z1lQ?=
 =?utf-8?B?aFplUjcrZmgwbmZab2VmcDlrQXhyQmJ3Q2RLVTZvdlJ5ZUlWT1NMeTB0NjFv?=
 =?utf-8?B?SU4zRUdvNlVoNThZMHpqNHNNLytsNTZ1QlJsQVJUYUlkdVRaV2ZsU2Q5dzIx?=
 =?utf-8?B?VDVYOEJ1M3ptZ0YrdGtYUnlPT091NFhMejVndlZGQlIxYjlGaGtId29IdTdH?=
 =?utf-8?B?ZHFIYnYwNTZiN09IbW4xK1VxYmxyN0poaDZ6YUtERXFiYzNBRmhjZkNtY0d0?=
 =?utf-8?B?R0ZRMEYzdUJQdUhmY25RM1NSZWxFNkhUU1VvS2djU2E5RjYxMVZTeWNjYW1W?=
 =?utf-8?B?TTQ0TTdRbklNSnQzN3RyRTZoNnRjNlltQTlIQWZ3RjNtS3hUSDF5MGxwbmdr?=
 =?utf-8?B?aGFtRWFDRW5ocUVIdE1jL0pCdHRvR2c2RndqTk5pOGk1ZUFQcjgrMWZFMkdQ?=
 =?utf-8?B?NWRjTzA5WG5JTDdkdXBDdmhWaEN3MWNabnNuZWRFRFl3UkoralVEYjRrc2pW?=
 =?utf-8?B?bmdFZjFibFA2OUMzb3o1NkdTdm9vTi91WEdTUHkvQVBvbGREemZDd2dnSVRp?=
 =?utf-8?B?YmowYytIMEJ3ZnlRSHorbU9uUVZ6OW1JakkwU1NNcTlxaFpDUFlocUdMTkNh?=
 =?utf-8?B?YmhyZUZ2RzFjR2xxYVVOVnpJcVk4R1ZhbzFaS3cxQVNFQW9Pc1AwQWZNQ1V3?=
 =?utf-8?B?WHpMVUNVeDc5bmFBVDVpb0FTNDFBL0JidHY3MFdUdTE0WXBBckZQVWxLdC9p?=
 =?utf-8?B?OTYzNE15ZVRFcWRwZHZtNmNKMUJXSFNxUjQ5a3JyWk83cnVxTUQzcEJPQzhR?=
 =?utf-8?Q?0uW1LtPf4c5X2e8Z9EKRI8Tce?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 77f40980-f1c7-40ad-5378-08daf3db62c5
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jan 2023 13:54:40.7770
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PcxIjW7TFPzjrc9g8815cBO2A4qjBvxhFlPsiatNZj4DNwJVkZuZ0bA+2/8dbTMDDQC6owX1dFRB+ogtiIVF4A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB8551

First of all move the almost loop-invariant condition out of the loop;
transform it into an altered loop boundary. Since the new local variable
wants to be "unsigned int" and named without violating name space rules,
convert the loop induction variable accordingly.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
v2: New.

--- a/xen/arch/x86/mm/shadow/multi.c
+++ b/xen/arch/x86/mm/shadow/multi.c
@@ -863,23 +863,20 @@ do {
 /* 64-bit l2: touch all entries except for PAE compat guests. */
 #define SHADOW_FOREACH_L2E(_sl2mfn, _sl2e, _gl2p, _done, _dom, _code)       \
 do {                                                                        \
-    int _i;                                                                 \
-    int _xen = !shadow_mode_external(_dom);                                 \
+    unsigned int i_, end_ = SHADOW_L2_PAGETABLE_ENTRIES;                    \
     shadow_l2e_t *_sp = map_domain_page((_sl2mfn));                         \
     ASSERT_VALID_L2(mfn_to_page(_sl2mfn)->u.sh.type);                       \
-    for ( _i = 0; _i < SHADOW_L2_PAGETABLE_ENTRIES; _i++ )                  \
+    if ( !shadow_mode_external(_dom) &&                                     \
+         is_pv_32bit_domain(_dom) &&                                        \
+         mfn_to_page(_sl2mfn)->u.sh.type != SH_type_l2_64_shadow )          \
+        end_ = COMPAT_L2_PAGETABLE_FIRST_XEN_SLOT(_dom);                    \
+    for ( i_ = 0; i_ < end_; ++i_ )                                         \
     {                                                                       \
-        if ( (!(_xen))                                                      \
-             || !is_pv_32bit_domain(_dom)                                   \
-             || mfn_to_page(_sl2mfn)->u.sh.type == SH_type_l2_64_shadow     \
-             || (_i < COMPAT_L2_PAGETABLE_FIRST_XEN_SLOT(_dom)) )           \
-        {                                                                   \
-            (_sl2e) = _sp + _i;                                             \
-            if ( shadow_l2e_get_flags(*(_sl2e)) & _PAGE_PRESENT )           \
-                {_code}                                                     \
-            if ( _done ) break;                                             \
-            increment_ptr_to_guest_entry(_gl2p);                            \
-        }                                                                   \
+        (_sl2e) = _sp + i_;                                                 \
+        if ( shadow_l2e_get_flags(*(_sl2e)) & _PAGE_PRESENT )               \
+            { _code }                                                       \
+        if ( _done ) break;                                                 \
+        increment_ptr_to_guest_entry(_gl2p);                                \
     }                                                                       \
     unmap_domain_page(_sp);                                                 \
 } while (0)


