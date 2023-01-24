Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B3196792D1
	for <lists+xen-devel@lfdr.de>; Tue, 24 Jan 2023 09:15:00 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.483435.749616 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pKERE-0008Bd-UL; Tue, 24 Jan 2023 08:13:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 483435.749616; Tue, 24 Jan 2023 08:13:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pKERE-000892-RX; Tue, 24 Jan 2023 08:13:52 +0000
Received: by outflank-mailman (input) for mailman id 483435;
 Tue, 24 Jan 2023 08:13:51 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=HFQP=5V=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pKERD-00088u-CG
 for xen-devel@lists.xenproject.org; Tue, 24 Jan 2023 08:13:51 +0000
Received: from EUR03-AM7-obe.outbound.protection.outlook.com
 (mail-am7eur03on2054.outbound.protection.outlook.com [40.107.105.54])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 078348c2-9bbf-11ed-91b6-6bf2151ebd3b;
 Tue, 24 Jan 2023 09:13:49 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by PAXPR04MB8686.eurprd04.prod.outlook.com (2603:10a6:102:21d::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.33; Tue, 24 Jan
 2023 08:13:45 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2991:58a4:e308:4389]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2991:58a4:e308:4389%7]) with mapi id 15.20.6002.033; Tue, 24 Jan 2023
 08:13:45 +0000
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
X-Inumbo-ID: 078348c2-9bbf-11ed-91b6-6bf2151ebd3b
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oQg8yIYjuKLcsdN6f9R8TwSfxXEA1YraVm48ps7i1pmycXw3Wc4zKvc3dca+pJwn+3oyQPpSgYFEAj9U8ObI+Z8K+9Ov3weWaywd9jDrD/+zxX6fQoUNHOpbS8V937mLcb6oelsQM7SCfYS/tRGU0id01bvNQ+ExZiLxA88oN2pA4zjvUVKeGS0+tgvxHpYYGyurjfVfwtMYy7X3L7lbWhZfJtA8gY+22vVnLS564rh7fln0QouU1IjweFgsM2yXHo/kW7B8X8Iirl6hSx4ewzNkdLCWeYlhPaOGnQ24OMy2Uw92ec0aNON4xnKN24Tp0uyg6pt3se+bK0Lk11X2wg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nmPyni6SMRkEMpYVHVe/VGs8zDO01QfTHDGU+pniX10=;
 b=V00tYPjf8wXy9nW02Uw5aFCn9eOJ5GJ7kR0Ipa9VAgUH5PjYQZCNqW0FqL/DSwX4LM6mA3z/JpAk2V6BOtsD9//9Jbg5yjvni2JjrltTOJGp6FSdfRL5XF+GmfjLh0sZWtj/0sg+esV7FlBYykvkrM523oycgckos/ACjAMUl6HMLNow8jzTfCAL9QrtN21KakoBBrLA3iR6/kPgc8X2E1oXypXHIdl6sDeqOMT1LWZ7+AltOyjxsI1xirv5yjO/vUmUQhxr6sJubuWLNcO1Soy0iuZfv6EDfYi2lgCKsrvelSseSB1p7kcb6am/Pfq+PznulgzBzc8ZOF/GYCcnRw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nmPyni6SMRkEMpYVHVe/VGs8zDO01QfTHDGU+pniX10=;
 b=QHiahjXHLQGccVBUkYI9KU8NisB3gNxgcyg6OQAS17FRcMYUdDjzWD9dZUNWBWzYosb5rwInFmCJhFlyLUoA0HIbNCHnrvKmdidmSX5IPYLHweNS/zkhUKD7cHy5MCOIZ3E7Nyk7tj6rBW0fH0JiTxwbzaFizAzdEJkTmeSj9yW+svWKs8cMrbMvjzgfLo7r03e5MZyDU+hQB/rm/hlc8EY5FTVzvZuMJKHvhtmPDOrLRJgz54KpIe8lN1P4vm3lGLr8qM+FqCJwQVzIGpmfUhyrdMeTVfoOETA53X4br7C+frWdfPNXwwKCn8vcO0hOmYOHOkZc+ZhOwLX7MMoSsA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <93431f73-9c9e-ab27-c50f-18dc4a3469fa@suse.com>
Date: Tue, 24 Jan 2023 09:13:44 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Content-Language: en-US
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH] x86/shadow: special-case SH_type_l2h_64_shadow in
 shadow_size()
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0004.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:15::9) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|PAXPR04MB8686:EE_
X-MS-Office365-Filtering-Correlation-Id: 96efa8b1-9cf8-43d9-8550-08dafde2e9de
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	xyXfriv4H7BTW+6sHB7zB0pIC5YwJlARdt4V6Dn9vHA3d1I+/CGwlIIbKYauieSoc/lpwwTguRe6wuqFwL+BN8QrDsQw8ZkWAA9V+UdPCbp6mLDAGs4lra+VHMJEGTYDDe6ZOwCMweVFjZY//ioiIcKRx7CV2WXtfPywt8D1AfNqKbnoEKYhfXs79EsomW/RU19fNnt4EO0qDvOgDPVgaCC20u6fTOqjJJdi98SH1O9qyWEmjKoaKYs74NwAZPFzoUFssmnUloPrRonQ6ETJ1ViZnBQGJWXnH8DOiT1luBzJVE24ZSIegrm/5bQ3ovCkbz9dVfbC6J+61FUytCO/fcPjxDQ3QJ3v9kFezxO/7HMvoqaCM5+/ObGwKQdDJ3sFsNIZQnsXFhws6FBuepbFZxqasBW/qHo9kwjNtWdVeW6jc/5XoOMVS8wGF9z74CRApWaMsO8OVPziJyvJseCx3aG415fIEMh8kLEEdBZWOf87VRNFc50+QW6ZboXtT2IlpneptISG+D4dbMVMc9xl6i0jsxkaOlsa4NfdNa/s/g98wORJmQ0taylYC5OuNTVCTJY+qXNjtD+CN8htzkvpudaF8MTXy7MJINnbMzkAsWp5hHB9qxh3Ir4b4C3R3m6rGvY6TLfIPFiUy6L9fELITdRnGKzleJk5mo6Nz4vlNEDvn0llhYJlALxfb2eACTllbXdxW8N/dxO+ljkm7f6Wa/SVqrwX2dpO/G1sToXlVW1OGnAJYIAZkAyZ1lhTK4gxfmCd4bUnBNzRQxUiln3kJZrN0ZCJPws5o0df04cZ3iw=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(39860400002)(396003)(136003)(366004)(346002)(376002)(451199015)(41300700001)(31696002)(83380400001)(86362001)(38100700002)(5660300002)(8936002)(2906002)(4326008)(26005)(6506007)(2616005)(6512007)(6916009)(186003)(8676002)(66556008)(54906003)(66946007)(316002)(966005)(478600001)(66476007)(6486002)(31686004)(36756003)(70780200001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZjRTLy90RUNMS3lTSXZwdDBheGFtWjkzeVNyM0xqQmZ0aXNreEV5UjBxRXNN?=
 =?utf-8?B?amdETXFaYS9xN0o5TkxYd0t5WjVrSEY1TGVzTjc2YlJGaHFMQ2JhOGFhTHB2?=
 =?utf-8?B?ckJmQitBNFYyODRvVlBBNXgxL2txNXpQak5SUXNwQjQxTHp5RVgxY2pDWXJO?=
 =?utf-8?B?R0tyMDF2OHRlbmIyV0Z3bGp2d2NzWHd6Vm1GR2VEdVl3Uy9xZ1BuMEZpWU44?=
 =?utf-8?B?cEg3Ukw3VmI0bU94aVljU1luKzIyVG03MEIxL2xOeDZMMk4vYkF2bEI1czJN?=
 =?utf-8?B?T0NVWHlwYW0xTmRFQnFUR3JMMHdMd1FIOGM5Q0IrNmMvWHdtZU5HMVY4UkxB?=
 =?utf-8?B?cGRhQmNwejRURVZSQ1hzSUJHamVRanYrNWhxSzEyYnlFY3llcE1Ham9nMS9w?=
 =?utf-8?B?cEFJNFZ3RmZFSEV0SVl2K0YxVnlJTGhHKy9tTjh6WmNCWHdWQi95SmgxRjhV?=
 =?utf-8?B?SWFHWDBlNzFlRUJjYTlGYjg5ZmdiR3d4emFXeGM0NVNmeFpPaXYvTEFoTmxO?=
 =?utf-8?B?OGtqYWlMMkZBdm9vcFRadGdHamlQYWxxVG1xTkMwd2YrcjFOWlNkN1VaTVpH?=
 =?utf-8?B?Y2N5OWNLWmwyMkVBVE5oRGpvUC9JRG1qVklrV29MRHM2RCsvLzNETlZaaGJo?=
 =?utf-8?B?VDE0d0RFeWl3K2ZSaUxsN0J3WHV2WlJTblRrUWlLcUZ4YjFvL0h4WnI5RzVk?=
 =?utf-8?B?NGNBQUV6bGwzVmpqdFVScTY0Qmc3NkdvMHp4cEY2aXhPdE1YYUc0WVk5WERE?=
 =?utf-8?B?Qk93K084aW1BV0ZjWlVjS1VZYk9NMFVlTC9Kd0lwSUNCZ3YrVDNFdHdocWIw?=
 =?utf-8?B?QjZpeDhOYVhkTG9PazB1TE1mWUFjSURvSkUranh4eHEzSzdGbThmWGpzZUky?=
 =?utf-8?B?UFpGSnNxbWZjSWRpclZaTjY2SitVMlJhWUt1Y0RweCtKNHpFelBMUTkwcjRq?=
 =?utf-8?B?MFpOQjJaTHNFc3hZQUgxL1hSUFNvWklHM09EWnA4Uk5FVjFCSzBLT3RFR1hJ?=
 =?utf-8?B?TnJrNVF3ajNnQUZac1FudjNCSURFQVR6dE5IZm9ORkt4bEtzOC9LYm5JM3Az?=
 =?utf-8?B?YkVDbFlDRGFJSUUrTWIxck9LMjFuNHpGOGhiMCs1SEtCa252bWlxaUo4Rk9u?=
 =?utf-8?B?OXFxMGJCU2JCWS96T1U5OU0wZkM4bVY4NjRaczY3SkpvbXJsMVVZaDBEcE9I?=
 =?utf-8?B?Z2lXSVlCWjhySWgwZTBvaWpiNTd0cmQrNXJpWkVwUm13ZmpMVFIzTkYrYmxt?=
 =?utf-8?B?Zkk3azJuUDVCZFlBczVLb3FrUWEvZE9nTjlNYUlzTCtSdE1JZWtpNTRuOTVp?=
 =?utf-8?B?MURjeWR6T2k4ZmdMYTU3bzZJOWZFZUJhOWltbStWZDRrVGFyY3k4TXA2RCtV?=
 =?utf-8?B?ZW15dXpKOTNnNDZQbktOQnhkM3I3emg1OGRwT1RDSEREcjdkaVU3SE1QYjRF?=
 =?utf-8?B?Nm9XL1RyRTJMa3VRdkpNckwzdUtFSGdBanJuanJzVklmUVpOSEE0WXI1UmR2?=
 =?utf-8?B?MVRjVEpIOFZqcVZqZW5rYzlNRTYwejVwWHNXMFFYbFdGR0phVHJNdUFlaGZu?=
 =?utf-8?B?Wms2UkYyd3FnU2FTaytBQ1ZpTkJiUmIwdUd1aFRkQldzalFmQ0JwN3BMMytp?=
 =?utf-8?B?TDFGb0c3RjFacTA5REpyckNXTDZIRVdZTFF1cHJIWkY3Z3R4ODhqSHQzbWxP?=
 =?utf-8?B?N1J3dU5RTWEvTWV6eDBNSWNNWVZXVEZmMkVHZkZaQVUrdlZDMnc4U29zYnFl?=
 =?utf-8?B?ZjI3Slh2aDVkLzFUeWplb1JwSGZSVlUxMndoZTdjaXYxT2lhdnNoaUFDRGhq?=
 =?utf-8?B?QzV2Ly81OS9FZFVvVzdqTVZyTHRkUDRwTUk0NDRsZVlRWmJOSEJVRHhaMUJz?=
 =?utf-8?B?cWRtR1NYYlpGbTRHOTlNWG1CMHl1QmZhU0dFdnJ1amVpQUJEeEZMOXZxamxE?=
 =?utf-8?B?Q2xUSDFibTZVWG14L0tqZ0h6YUV6QkZ1SzFvVFIvc3FTL2pqQy85bWhpMUky?=
 =?utf-8?B?YlpManJyeU9YblgzQnBnL3I3MUlyOVdqVGRWYy84Y25ENFI0ek5jWEo2MnU2?=
 =?utf-8?B?aXNsOWpyUjJrb3JUdkZPSTlhbUU0d2hLQ205NkZCY1lQNVdDRFRjWDNzcTFo?=
 =?utf-8?Q?dUjiecf9pjukJyuHrJw5lhbWM?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 96efa8b1-9cf8-43d9-8550-08dafde2e9de
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jan 2023 08:13:45.6332
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UuMlMX0skIprW/MfEeopyMpm75MMuMeQg9ShRi/lTwG+zy7LEuEAzeQFrjQ+zyESpe4u5h6X1oEVuk8rWgcRvQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8686

The type is valid even in HVM=y plus PV32=y builds. Hence either the
respective sh_type_to_size[] entry needs to be non-zero [1], or an
override is needed. With the table sitting in a HVM-only file, it was
requested that the table be left alone. Leverage the need for an
override to make the size actually dependent on a runtime property,
not just a build time one.

Fixes: 1894049fa283 ("x86/shadow: L2H shadow type is PV32-only")
Signed-off-by: Jan Beulich <jbeulich@suse.com>

[1] https://lists.xen.org/archives/html/xen-devel/2023-01/msg01586.html
---
This is an alternative to "x86/shadow: sh_type_to_size[] needs L2H entry
when HVM+PV32". I continue to think that's the better solution, but the
main goal is to get the regression sorted, so I'm (hesitantly) willing
to go this less optimal route. While there's a benefit to making the
size runtime instead of just build time dynamic (in principle we could
go further and make it depend on domain type), the downsides are extra
code and a scalability concern: Things will get unwieldy when a few more
types want special casing for (more or less) similar reasons.

Leaving the table alone is questionable in the first place: It's still
used for both HVM and PV domains. With the change here all we avoid is
the use of that one table entry. Its HVM-only-ness is a build property,
not (like in many other cases) a runtime one.

--- a/xen/arch/x86/mm/shadow/private.h
+++ b/xen/arch/x86/mm/shadow/private.h
@@ -29,6 +29,7 @@
 #include <xen/domain_page.h>
 #include <asm/x86_emulate.h>
 #include <asm/hvm/support.h>
+#include <asm/pv/domain.h>
 #include <asm/atomic.h>
 
 #include "../mm-locks.h"
@@ -366,6 +367,10 @@ extern const u8 sh_type_to_size[SH_type_
 static inline unsigned int
 shadow_size(unsigned int shadow_type)
 {
+#ifdef SH_type_l2h_64_shadow
+    if ( shadow_type == SH_type_l2h_64_shadow )
+        return opt_pv32;
+#endif
 #ifdef CONFIG_HVM
     ASSERT(shadow_type < ARRAY_SIZE(sh_type_to_size));
     return sh_type_to_size[shadow_type];

