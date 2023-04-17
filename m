Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BF736E41A6
	for <lists+xen-devel@lfdr.de>; Mon, 17 Apr 2023 09:55:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.521801.810687 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1poJhL-0007jd-F7; Mon, 17 Apr 2023 07:54:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 521801.810687; Mon, 17 Apr 2023 07:54:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1poJhL-0007gp-By; Mon, 17 Apr 2023 07:54:51 +0000
Received: by outflank-mailman (input) for mailman id 521801;
 Mon, 17 Apr 2023 07:54:50 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=S5Vl=AI=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1poJhJ-0007gj-R6
 for xen-devel@lists.xenproject.org; Mon, 17 Apr 2023 07:54:49 +0000
Received: from EUR03-DBA-obe.outbound.protection.outlook.com
 (mail-dbaeur03on2063.outbound.protection.outlook.com [40.107.104.63])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1f15b9e3-dcf5-11ed-8611-37d641c3527e;
 Mon, 17 Apr 2023 09:54:46 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DB9PR04MB8268.eurprd04.prod.outlook.com (2603:10a6:10:240::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6298.45; Mon, 17 Apr
 2023 07:54:18 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::52b2:f58:e19:56ae]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::52b2:f58:e19:56ae%2]) with mapi id 15.20.6298.045; Mon, 17 Apr 2023
 07:54:18 +0000
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
X-Inumbo-ID: 1f15b9e3-dcf5-11ed-8611-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PAkXTsnJAiBIsoLsb7678toiVXG6Fsn1vtmR9FA1gu3JtcBQLWy5SHIqJgwvUB1PJxu7tsEt0i9DBAZ0S0BqX1BXroCaookRM/uDUlm8sb7qgD7yauWCiX+Gx2+eJVSTf/5HNd0B5sEhDQy4gr42lxVh1xudzf0nA9Uj6Z0WrRWjtvheLD/UQ1Yj/BlXxijH6Ya1huOT3ZxJZyk+ezPPpoDzBPuBiEZPbOUT2CU65hwHdytTuEHCRhpb0NEgdm5kDLiZvxfCeScJEOU/e5V51N/KTCZj87e8a1C70arTAfxV2rBVhuvUli6xnakyYZwRyQOtYg8vlPirMi17SLtCwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gE0a1mE6c2npUCOmNFYKdH+0rHLAz4QE3HbsVfSob6Y=;
 b=kMGocZqje/K4CoYYWo3zRuJD38tZnOFvDkmR51AJtf6jZcf9nCpH8OM5ApQiJXvD1ckwzBaqzB6a3nq98nidN9afVHPYRSNDmYlWsSSODNT159/ztK6l+UGqst4TNN4Si6hSR0bvP7YkP4GJ93J7hkozli7xFouv8R01svu5X57Zj7tkN9CPE6yo9zlr8LSfbSUYT4gOgidtUHnJW+GLwibE64RuR9ZaazBxdrmhgOPAd5CyMCu6BKvTtkQJhe2oFvR9ZZ3pTGKcveiXtr5qPyp0k7q2CO3zL0Go2USxx/dTj0amAT5UdmV0xj/Vmydl/CMKMrSb+XOLNHQ/7GICkQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gE0a1mE6c2npUCOmNFYKdH+0rHLAz4QE3HbsVfSob6Y=;
 b=OU4HS1JXVooRHDoLECM/X4vJW4Fb5p4hdIC74IJUDOSm5AdSN3hCRRw+YAYFdKhf4x1vk2IOYYlX5pE5ng4c2oDUoSYSr1CgEy+OzlpU5g085DfAs66U/PYzyJEBTzBACbpbw5Yq5gGpDRmGNeX2UdZXQjlgXeYDH+ewIzG/AXIZZn3X/Ez3jZR9R2hFm+5h66EuekdIGMWFNLOk72lI+WaFAfKe5LIEGBpxlls/TrBCThnhikRoF96mcNoS7dWwCeQfFLQduRIyeCmrt8JX1+SgAMBxeX1UKqpVL40riTBU+qbdM9XattB8O1V0eqSKVN2JKbfA5LpQEKpDmM1y6g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <658f5267-9943-7c5a-2ae7-f7e40a15301d@suse.com>
Date: Mon, 17 Apr 2023 09:54:15 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Content-Language: en-US
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH] x86emul/fuzz: correct header (symlink) dependencies
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0154.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:98::9) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|DB9PR04MB8268:EE_
X-MS-Office365-Filtering-Correlation-Id: 763a66cf-d671-4fc2-05db-08db3f18f24f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	EoFWdv8YN+O5Ur/nvl7KoUUWk7P6xPcfHpbRICmvsPzm8xnaWtt3DYbDBq38Hh1t0AlmJmkkmx/D6UUCME0aH/2gw34CJsmLEoawQ5JXvPQoM5+N/yHbUGcRgEskfSz1WcbpEgWmovQ1szi64mru6lnOXOgbKHk2paGldvuI30YSZgpiPAyl8UVnuhRAXLHPws37Uu4ELHScwYtcOTMbkxRcUlJ+nXuidis6eDor1C0kag4LzXsI9k8MONQzMvvII0K8dK7Woboa0sqpbP/wN0xY42wZs7wvKGDzEBOjkZILKj80MCoI498siiny0s9xz+ym90+F/DesKBhRf/1uLphjJSEgwvly5yp8L3ep2A92G/ypFzLwYdsL+gt9rxGLhw7hW40B5tJbaO1N5BrqejRY84aImfhVH2CTORZ41sH81C+hp+eeIkmQoBAjB1iyCWSjCqaJ49Kv4If4U7IUKIN+hpKy1JfDgB7Al2uUGLGScleQh1HVecrKtFu4iMAqhMu8JeYyzTHgKcQ4ZgMlvboQQreMHgY1bm2ym1gUIBQgMYeNrKlMABtqMAHlC1SS5tEpVBXkB/69rc44vnsss4WIGaRpPZmJeqp4jiECfxYLCIa8jJ/tkCoFHO3pjIO0ELRvmkcIyb5KfdaLjjEn5w==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(346002)(136003)(39860400002)(396003)(366004)(376002)(451199021)(38100700002)(8676002)(8936002)(5660300002)(2906002)(36756003)(86362001)(31696002)(478600001)(6486002)(6666004)(54906003)(31686004)(186003)(2616005)(26005)(6506007)(6512007)(66946007)(66476007)(316002)(41300700001)(4326008)(6916009)(66556008)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?YmNHL25CTkZRdVI3VWdJTGlQcVVxaUFaRUI5OWxUVlpnZi80enVKeFB3N2Yr?=
 =?utf-8?B?eTBTRVVTeU1sV2xkQ1d3cnl3cDlwT2s1dUZqUzNwY1dZWHRSaGJ0VUVmUXlz?=
 =?utf-8?B?Z2czWHpCZmxnNlF4bUplbnoyRjVKeXFDRFZNYUdZUllxYXBDZm5GdStGeWNq?=
 =?utf-8?B?eXJGeDRTM0RnbVBkRFJGVkE4RnJsSWl4bDFDNDBva1o2cVhXaWplS1F3MFRQ?=
 =?utf-8?B?UWFPaG00YkFuVVFqWWNFdXhGUmg2cFR3VDJ4NkpEK3BMUXZjektiejBDUVNX?=
 =?utf-8?B?ZEVvQVBBaThQbTFrWlBkRmI0Ty9aZWxhaUNhYUVueEhPZHBNVktkc3B6ZzNi?=
 =?utf-8?B?ZVJob0s3d1Jhd0VFdnJGNjBGNnFneE1neTBWbVUxbmtDTWxaL2F3dUJOV1dv?=
 =?utf-8?B?TURsNWo4SGl0dllzWk1QZitvblFhTll0eDRHMjA4TE5OUFBYVStSZlFvRFI0?=
 =?utf-8?B?MVhQeFFGZXdXRTVyYWVUbWwvdS80Ylh4UmVIR256K3NVeDFPRDNtQTRTKzdU?=
 =?utf-8?B?OWNidHlPNUhiaStYVWw5NXVzYlFnYlRwbklGeVBLK21nZGVkdkxlKytreHhW?=
 =?utf-8?B?TVpOaHAxYVRxaWVpRXdpSWRxaFRHUkNaY2c5a0dwdCtnbW1GWWZOaEhvNXI0?=
 =?utf-8?B?dXl0ZmtHK2hrZ3hHQnVMSVJqQldGTWQ0dzduSTUwUm9Nc0VYT3dMUUNkSWUr?=
 =?utf-8?B?V0doT3E2Zk1KV3ppRnNOVERWVW05NXBUemNTV3NIamQ2U0RWS3VzZkE2NExs?=
 =?utf-8?B?M2lBTXR3L2YyWFBEOGZ2aTIzbzl2U0liNVdPbWNjUDdWNFJRZWtBZlVxZlF0?=
 =?utf-8?B?VjhpRTMva3kzTmVJZVVGQ2VlNnh5NTB1SG1CakxQcHNtdjhLT3BObEFhM1Z5?=
 =?utf-8?B?L0xPdytGTUVLLytNRWdTamVPRG0xMTZvd3NqSVRsSUczdWJTcjZNUXh1eTFm?=
 =?utf-8?B?OS9HSWRvOEhkWlB2OTJ3M2tFcDlTWGxDY09hZDZFMkFRYmNSNmpyZjNTWXhB?=
 =?utf-8?B?TkdRNTltTzVJMk1BbEovUXdvc3R4dnlZS2Q5ZEt3a0NkMkFLOHlIQjJ2eUNQ?=
 =?utf-8?B?VklNZzJySUJ3Nkd6NHEva1RBc3pwZjMyQlN3YlNGajV4aWNOREk0WFFRcHF0?=
 =?utf-8?B?MFhpVVUxM2x3eDNFTE5wd0JJYTIvZzR6anZqRXVkMXlRL0R0b1JFS3p1SitS?=
 =?utf-8?B?ZDdnZDFJclVTam1JaUtpL2xnTWZIK0MrRklLaHVHV1FMUzRmOUo5R1Y2aDNX?=
 =?utf-8?B?Wk8weVkyQjh3eXp6K1RkWjFGQWJxMGpjdW5hamFyT1N6cmRqTUgzNGpCSG5t?=
 =?utf-8?B?bVVoSGMwOXlBNExFVEhvTDZmTUN5YUJabXBmOUlQc0FzQmhKdUdBWGRpdzNj?=
 =?utf-8?B?eVZkSWhXNnZZSFpvOGtqeXdQcVp5aUVDTkNSNWNzczNvWDRkelZDMFZNbEFV?=
 =?utf-8?B?Nmo3Q2gzU2ZWeHlvMllyNDFod3F4YzFvUzNFNlIraVZoMjhRbUwrZnpHUUU1?=
 =?utf-8?B?Qmp4UWl4SUlSNmRtQkJvREdjTnBjYVVCU2VsZnBOZTJSNmdvUy94WnBKSldN?=
 =?utf-8?B?Qm0yWG9UbVV2YnJaMjAya2dMemk1Rm1SYnZZY0V1NEFOaitlMHJ4blJjM0Zj?=
 =?utf-8?B?UGZocnRnM2VjZnp1QjlUNXpSd1hrd3I1V1NILzFReWlYTGlUcHN6N21Cenpy?=
 =?utf-8?B?TUR1VTcrNldMdm1PeGlMbmV2NDQxQkw1R0g2TFJSTmJLUHhYUU1CV3lVRkl0?=
 =?utf-8?B?T2ZkYU1OTkthbERHcW42T2FWeTNsRGtKT1MweGNUZVRLVktNM0YwUExvMnF3?=
 =?utf-8?B?MHV3U0hTOHVuVGt0R0hTWHljRlR3UXFIaS94Vk01NHpqa0x0Y3pwaE5RZjVU?=
 =?utf-8?B?VmhSTlUxQkN2OE9oVHhaa0pDeExhbXZGRUhPWXZJV0hGTHl6bTRtM0RtbDZZ?=
 =?utf-8?B?Uzl5MGF3bEJ3UkRFR1p0S0JYTVV6MCt1TUZvUnM1UFViU21ibTNJT0N0dDlZ?=
 =?utf-8?B?SjQ2UnFqYUJuSGVnZk9SYlUrd2owQVNHWmRwRGlFWmN4a2tKZkZQVmhZZGth?=
 =?utf-8?B?UU4rS0VYWTFWM3ZFWDBHMkMzNSswSG1CMUhSR2xNRkRVREk0U1MyMGYrMXU2?=
 =?utf-8?Q?a7Jfwg3lKRPvX3hnKm69f8Har?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 763a66cf-d671-4fc2-05db-08db3f18f24f
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Apr 2023 07:54:18.1948
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wADAhTd6r2OUkD0tqJ5QdXsOaS9evWNdvwXIvKpdGVLp4zIJw6BAFN3IOJmx5zyNa79UQRFtBYu7NscEykLTmg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB8268

A use of $(x86_emulate.h) was introduced (mirroring what the testharness
has) without realizing that no such variable exists here. (Re)name the
variable (to) "private.h", which better expresses what is included which
way.

Note that because of automatic dependencies tracking, unlike in the test
harness no $(x86.h) variable is needed here - we solely need explicit
dependencies for files which need symlinks created.

Fixes: 9ace97ab9b87 ("x86emul: split off opcode 0f01 handling")
Reported-by: Andrew Cooper <andrew.cooper3@citrix.com>
Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/tools/fuzz/x86_instruction_emulator/Makefile
+++ b/tools/fuzz/x86_instruction_emulator/Makefile
@@ -35,14 +35,16 @@ OBJS := fuzz-emul.o x86-emulate.o
 OBJS += x86_emulate/0f01.o x86_emulate/0fae.o x86_emulate/0fc7.o
 OBJS += x86_emulate/decode.o x86_emulate/fpu.o
 
+private.h := x86-emulate.h x86_emulate/x86_emulate.h x86_emulate/private.h
+
 x86-emulate.h: x86_emulate/x86_emulate.h
-x86-emulate.o x86-emulate-cov.o: x86-emulate.h x86_emulate/x86_emulate.c x86_emulate/private.h
+x86-emulate.o x86-emulate-cov.o: x86_emulate/x86_emulate.c $(private.h)
 fuzz-emul.o fuzz-emul-cov.o wrappers.o: x86-emulate.h
 
-$(filter x86_emulate/%.o,$(OBJS)): x86_emulate/%.o: x86_emulate/%.c x86_emulate/private.h $(x86_emulate.h)
+$(filter x86_emulate/%.o,$(OBJS)): x86_emulate/%.o: x86_emulate/%.c $(private.h)
 	$(CC) $(CPPFLAGS) $(CFLAGS) $(CFLAGS_$*.o) -c -o $@ $< $(APPEND_CFLAGS)
 
-$(patsubst %.o,%-cov.o,$(filter x86_emulate/%.o,$(OBJS))): x86_emulate/%-cov.o: x86_emulate/%.c x86_emulate/private.h $(x86_emulate.h)
+$(patsubst %.o,%-cov.o,$(filter x86_emulate/%.o,$(OBJS))): x86_emulate/%-cov.o: x86_emulate/%.c $(private.h)
 	$(CC) $(CPPFLAGS) $(CFLAGS) $(CFLAGS_$*.o) $(GCOV_FLAGS) -c -o $@ $< $(APPEND_CFLAGS)
 
 x86-insn-fuzzer.a: $(OBJS) cpuid.o

