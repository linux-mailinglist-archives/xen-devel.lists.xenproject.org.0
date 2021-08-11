Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9966B3E90DD
	for <lists+xen-devel@lfdr.de>; Wed, 11 Aug 2021 14:25:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.166015.303198 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mDnIk-0001OW-5l; Wed, 11 Aug 2021 12:25:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 166015.303198; Wed, 11 Aug 2021 12:25:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mDnIk-0001MZ-2M; Wed, 11 Aug 2021 12:25:42 +0000
Received: by outflank-mailman (input) for mailman id 166015;
 Wed, 11 Aug 2021 12:25:40 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=fjOV=NC=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mDnIi-0001MJ-H0
 for xen-devel@lists.xenproject.org; Wed, 11 Aug 2021 12:25:40 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.109.102])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 3b573b6e-fa9f-11eb-a06e-12813bfff9fa;
 Wed, 11 Aug 2021 12:25:37 +0000 (UTC)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05lp2110.outbound.protection.outlook.com [104.47.18.110])
 (Using TLS) by relay.mimecast.com with ESMTP id
 de-mta-21-jsf7zT2MPLaK2ijKyaY8EA-1; Wed, 11 Aug 2021 14:25:35 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR0401MB2335.eurprd04.prod.outlook.com (2603:10a6:800:2e::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4394.17; Wed, 11 Aug
 2021 12:25:34 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::99d3:99cd:8adf:3eea]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::99d3:99cd:8adf:3eea%5]) with mapi id 15.20.4394.025; Wed, 11 Aug 2021
 12:25:34 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 PR0P264CA0147.FRAP264.PROD.OUTLOOK.COM (2603:10a6:100:1b::15) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4415.13 via Frontend Transport; Wed, 11 Aug 2021 12:25:33 +0000
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
X-Inumbo-ID: 3b573b6e-fa9f-11eb-a06e-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1628684736;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=61nzHG3t05KhKcSaMocj8vKTFGtTFK0LBUFu1Mp+C7o=;
	b=k1RNEqGgj6OMKEIWvZg+rbRgSaPJQ9dLkhs2+sy6Dhv5+WyUFrvHg0rHnoSXOGhwfyIwSX
	+T3tbtqAwJk2mzA4mw6IX/pwUv9gDYP2uVUp2qAqMhIcsCUFSkDQXju3KGnaPL98elCZOV
	sqGBWjUEKuHRnB5OEBV2ptF+UTmLwlM=
X-MC-Unique: jsf7zT2MPLaK2ijKyaY8EA-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LdN8C3k0yr5dcb4RXpl5BevPqL5d5F8GHLu3QPgQn1hI9GJv+l4QEj6DOqmiIEb53dyBsGHtMuwwykHZQQC6UDRbzYn8eYO1gO9XDZ527MBjUHovd2UE8M6+cvuG+ochwyLRz1G59hVAmBMrl0hqvCDmpoHayGC7Tgx5UWETNbWd/2ErcUy0Uo4LYaVEF1Lg1ucrFTJOdZJlN23a47mWTwLlCiqRb1JaUu2rntDHlsIkwFFbX1/+lK+YQ4RIvabxXPPSBikpcyk5DNe9o5a9IgeyFjwiZ7iE6ic6aCgyji4eE+6QqUv5SqbB2QapX8ybt4nU2dTgCz3587SjNfoXrg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=61nzHG3t05KhKcSaMocj8vKTFGtTFK0LBUFu1Mp+C7o=;
 b=V/87wLPEhb33gnRGlAjbiVHaLX1maSZ6RYxJ+7q+0SH2c5HLcM06qUKd5+9vMGY+GVbYFdOrsq+9YkTpy1OcSqLL3JZKcE892hTkqE5wbsy59ercDlf3djduc+SLCDIjuf5wThVIcj5HCaQlz9Ao/y9/uTnCCS3jedBu7bKDVoupl46JkYxUIj9kMNtezqyyyFtxyaXBgz87zO/rZN9HdFnZm2YnK0LXobK1KVE+s60amZV6XNlyipdSsxJyINv34CgHpF396S3sAfRzAPuLcbnNZhghFbMzztxfQB4Oj5cf2SoPCaA6LuG2UNE7O1m8z65hUkQzntRJFt0mkxMKuQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: citrix.com; dkim=none (message not signed)
 header.d=none;citrix.com; dmarc=none action=none header.from=suse.com;
Subject: [PATCH 7/7] x86emul: move various utility functions to separate
 source files
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <bdc58964-e2a8-af36-1653-41c7146bdfc9@suse.com>
Message-ID: <ea88cf39-01cf-a2a9-3ec2-62a3614d3cd3@suse.com>
Date: Wed, 11 Aug 2021 14:25:32 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
In-Reply-To: <bdc58964-e2a8-af36-1653-41c7146bdfc9@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PR0P264CA0147.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:100:1b::15) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: dd90436e-ef31-44a8-f014-08d95cc31dca
X-MS-TrafficTypeDiagnostic: VI1PR0401MB2335:
X-Microsoft-Antispam-PRVS:
	<VI1PR0401MB23356CD16F769B7D327BF6CAB3F89@VI1PR0401MB2335.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3276;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	vFBl5dUaz+o3sgzMbQ05UP323dsAOIp2cKHjNSDscFQobl8kKDD5l0xrC855tzKYNMbdBjYbS6j04mqmorIQVHNsE5KqN4qxdbvRSuG/lCZbnOxgNP+14uX1jqBrBl11k6igfasdoBsy+wtLrdep1hdSQDzIHSgC4dd3Dt9pLhvyl8RdJLeYm0OrNbSfqec1WqRwyI9+wUWNscahQlF7i43pkyZcmRjbx/4tr5b4gTGpeJzSO6aVL2xRFaZXrkMuS2EzwSC18Aok4JcDIAb/Qh/H3boXlJEyAqazR4okQ8Af37+Fiy731mPtVi8zJlrS1rt73Cm4Q8fwfzh42ryxcIoJPmL0AhTVUYB7hAenpztNIE/ODKnoDpqAcLA+IvWD3m8xUQ1HL7pOdDB59nWR+L6N8x+qYqWXaODoH4Q4WulsNHp4IvuIGHe5Uhv69JD9JGjLPNbDrFaVReCqHEBagb/vcR41KzeVmgRSNHC8SbtWGIfQ0lF0egpYCh5O6/zuMcl5T3mqmveb/itiYbBTScNyYAcjyFu0FwBwLzON7jqfkoLBQiRZaXesCoOJTkMtVOOWz0/4HH/fljG05TvexX3snKTaFK8z8CSDwpusp7mJbr2bPnwFT/aB+1J7nLw40pAJFBaTgCZ5NSjUlGo+gxMUvyS+RMmNyc9cilKkgwtm8Srpx7XSQhpqo0NAVAr055VculXEpxYW2PW7tiT5lTHbutTNM25tOPmQJQztPGfz5cI6blLNxwSd5EvaV1eY7bA5LKdSM29rybQODJq7Tw6VZpnnRJKLe6klq0Mmu2TZbrJEI6ndE929FZr4JWYeUW7meOoZ73oAZ0XkSf0wCg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(136003)(396003)(39860400002)(366004)(346002)(376002)(6916009)(31696002)(316002)(956004)(6486002)(2906002)(36756003)(478600001)(30864003)(86362001)(16576012)(8676002)(31686004)(8936002)(38100700002)(2616005)(66556008)(83380400001)(186003)(66476007)(66946007)(5660300002)(26005)(54906003)(66574015)(4326008)(2004002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?THIrUExPTjZnMmczS0xRemg4R3pVdFBVc2pROTFnaGU3ampocE9tRGRBWjNC?=
 =?utf-8?B?b1JTSzlmSmZJZUs0T21aOVFYU0Y1STJ5MExMTFE3NTlselhSUHRxZmc0cTlh?=
 =?utf-8?B?V2hqTzhJam5VTzBIMXNtYXJUSnhWM1JsM1ZSUFRCZlUxdzFKcTFzTGdqTVE5?=
 =?utf-8?B?Y3Zzb3NUQUJPUWFxSWVWSUFlLyt5TmZtYWt0alg1VFhkMnJsQlhCZzc4NFNJ?=
 =?utf-8?B?VlE5Vi9zc3NMVjZFUFkzQWtQK01nb053QUxuR1FPZUVsL2VCUnQrMHVJVnRD?=
 =?utf-8?B?b3ZGdlVkV0t2dFdEUmxOSllXSVoxVW1VcndudDRxVDNwWUJsNWwrc1pnZStC?=
 =?utf-8?B?bFgrUXRHUTUrM0FhS0s4RkQyRWF1blNXT2xvaUU3ajk3TWl4NVdmM0VhNUhS?=
 =?utf-8?B?NWhDRWRBTEpnUGZsMUI2NGFxSTZmOW5kbFQxMERqemNNdVE3SHd2Nzc1Slgr?=
 =?utf-8?B?NmViTWxEd3dSTU1oekZmNnFneXQ5bWxQLzZmODBHazAwWXVjMGJLVEMrTlhS?=
 =?utf-8?B?ZWRBNSs1MHZMNGVIdUFlSWVIOWhETnVDMG50dUFvMWhkZ2lPdTVQV01jT0U4?=
 =?utf-8?B?cVpxMTlwYS9uL3NNOWUyQ3Brb2JsQ29qY3o0c3pHRUVJVGJwL1IxcC9LUDd0?=
 =?utf-8?B?TEJSQ3JLZWEwcE5ubkwxWHZXRTUrcHM0VS92Vi9udUNHRmxIK3p1WEQ4a3NL?=
 =?utf-8?B?NlJucG1Sb1hwKzJQN2ZpdEJOZHFJcktKM3hBT00zWkNWelVxWjc2cmJaMHN0?=
 =?utf-8?B?T01qYXhlRnFoY3hxeHFHeW93RVVhdExoS1JUczVwVGVSeUtQNFo3Tjl3STg1?=
 =?utf-8?B?YUpsaTZsdHpsUWlDU1E0dDZmeTlHblNISE03WUt2RVhBV25vYysyNk53QzJy?=
 =?utf-8?B?WXdrUjlWR2JRTzFCb2I1em9uOFk3QldKa1JQa3dFckNMdFZ5MER5cUJRRlNn?=
 =?utf-8?B?TXM4Q2c2V3pna3pxQ3ljOTlKK01yK1ZwcHZxWmNXc1JoRXZUZjBXTHRicE5Q?=
 =?utf-8?B?YUplRUJUMWphcVF3YkpxMXNoQTBmYVdHK0RFeTBDQTdpUU50VUh4U1ZNc1do?=
 =?utf-8?B?YzVMSEJBeUNENUNNenhLbXUwTGdtTDc5M2lBaVJxQ3BnMjRSNmpIcStmSjlh?=
 =?utf-8?B?OWMxYys5WGxWbVNYcDlLT0hmTnBDSWRtMjB2SmRTcHpsRS9nRWRuVXJSRjZp?=
 =?utf-8?B?YzBvcHZwQm5zUDlDMHluVk94amFzWnkyeHdiL3d3Q3BXTGNWREZaV1pZM095?=
 =?utf-8?B?S3kzekw4Q3FPNTg1ZHI1aXQyZTJQU2FzNTNiK3RoWTJaMEdQcXdYUVFsVVV4?=
 =?utf-8?B?Z0pWMEhQUkpQMG8xZDQ1VVl3VmtOaHYvRlU3em1lV1BtaU9wVU5hMWhUUENt?=
 =?utf-8?B?K2RVbXUyT01ZTUR3SWJjZm9FNHl1YjlxQkpLNVFrS3FWREtEbFBaOFFUKzFr?=
 =?utf-8?B?QVlTbE5yY0drS2NXRXRxcGVPQ3pVUVhlTGhIRm1GZERlZDA4RXVuMXNZV1FV?=
 =?utf-8?B?ZThSczlialZZSVc1NVpuUldyV1RRbERyRWxpTXlFRjNRdzY5YkJvdWpMeXpB?=
 =?utf-8?B?OStIOUQxQTZYekI0eFlpalN6dHNMRnVDbEN3VFJHRWdvek5MUlZLaFdHdlVo?=
 =?utf-8?B?bXlsMi84R3NWcm04citLSDE3ZTFXL2VSWWVLeEh1RStyMXAyTzU1cFNTYW1O?=
 =?utf-8?B?Z2NmQ0t3eGdReWZaeHVCSDJPbi90cUhtQzAxQW4vdGhpS0xscXQ4bis4dGN3?=
 =?utf-8?Q?BxuaP6PH5biV20wBcNU3+709hzM4hMPI5cTa0Fa?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dd90436e-ef31-44a8-f014-08d95cc31dca
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Aug 2021 12:25:33.9292
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: P9HlXbiA7mDhA9xz4MZajks/5MajZe/RTIV/paer+BZOdkURVyc2XYzFbzvhzqqXojDMjD1VCa0ag2n1cLpRWQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0401MB2335

Many are needed by the hypervisor only - have one file for this purpose.
Some are also needed by the harness (but not the fuzzer) - have another
file for these.

Code moved gets slightly adjusted in a few places, e.g. replacing
"state" by "s" (like was done for other that has been split off).

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/tools/tests/x86_emulator/Makefile
+++ b/tools/tests/x86_emulator/Makefile
@@ -252,7 +252,7 @@ endif # 32-bit override
 
 OBJS := x86-emulate.o cpuid.o test_x86_emulator.o evex-disp8.o predicates.o wrappers.o
 OBJS += x86_emulate/0f01.o x86_emulate/0fae.o x86_emulate/0fc7.o
-OBJS += x86_emulate/blk.o x86_emulate/decode.o x86_emulate/fpu.o
+OBJS += x86_emulate/blk.o x86_emulate/decode.o x86_emulate/fpu.o x86_emulate/util.o
 
 $(TARGET): $(OBJS)
 	$(HOSTCC) $(HOSTCFLAGS) -o $@ $^
--- a/xen/arch/x86/x86_emulate.c
+++ b/xen/arch/x86/x86_emulate.c
@@ -14,7 +14,6 @@
 #include <asm/processor.h> /* current_cpu_info */
 #include <asm/xstate.h>
 #include <asm/amd.h> /* cpu_has_amd_erratum() */
-#include <asm/debugreg.h>
 
 /* Avoid namespace pollution. */
 #undef cmpxchg
@@ -26,128 +25,6 @@
 
 #include "x86_emulate/x86_emulate.c"
 
-int x86emul_read_xcr(unsigned int reg, uint64_t *val,
-                     struct x86_emulate_ctxt *ctxt)
-{
-    switch ( reg )
-    {
-    case 0:
-        *val = current->arch.xcr0;
-        return X86EMUL_OKAY;
-
-    case 1:
-        if ( current->domain->arch.cpuid->xstate.xgetbv1 )
-            break;
-        /* fall through */
-    default:
-        x86_emul_hw_exception(TRAP_gp_fault, 0, ctxt);
-        return X86EMUL_EXCEPTION;
-    }
-
-    *val = xgetbv(reg);
-
-    return X86EMUL_OKAY;
-}
-
-/* Note: May be called with ctxt=NULL. */
-int x86emul_write_xcr(unsigned int reg, uint64_t val,
-                      struct x86_emulate_ctxt *ctxt)
-{
-    switch ( reg )
-    {
-    case 0:
-        break;
-
-    default:
-    gp_fault:
-        if ( ctxt )
-            x86_emul_hw_exception(TRAP_gp_fault, 0, ctxt);
-        return X86EMUL_EXCEPTION;
-    }
-
-    if ( unlikely(handle_xsetbv(reg, val) != 0) )
-        goto gp_fault;
-
-    return X86EMUL_OKAY;
-}
-
-#ifdef CONFIG_PV
-/* Called with NULL ctxt in hypercall context. */
-int x86emul_read_dr(unsigned int reg, unsigned long *val,
-                    struct x86_emulate_ctxt *ctxt)
-{
-    struct vcpu *curr = current;
-
-    /* HVM support requires a bit more plumbing before it will work. */
-    ASSERT(is_pv_vcpu(curr));
-
-    switch ( reg )
-    {
-    case 0 ... 3:
-        *val = array_access_nospec(curr->arch.dr, reg);
-        break;
-
-    case 4:
-        if ( curr->arch.pv.ctrlreg[4] & X86_CR4_DE )
-            goto ud_fault;
-
-        /* Fallthrough */
-    case 6:
-        *val = curr->arch.dr6;
-        break;
-
-    case 5:
-        if ( curr->arch.pv.ctrlreg[4] & X86_CR4_DE )
-            goto ud_fault;
-
-        /* Fallthrough */
-    case 7:
-        *val = curr->arch.dr7 | curr->arch.pv.dr7_emul;
-        break;
-
-    ud_fault:
-    default:
-        if ( ctxt )
-            x86_emul_hw_exception(TRAP_invalid_op, X86_EVENT_NO_EC, ctxt);
-
-        return X86EMUL_EXCEPTION;
-    }
-
-    return X86EMUL_OKAY;
-}
-
-int x86emul_write_dr(unsigned int reg, unsigned long val,
-                     struct x86_emulate_ctxt *ctxt)
-{
-    struct vcpu *curr = current;
-
-    /* HVM support requires a bit more plumbing before it will work. */
-    ASSERT(is_pv_vcpu(curr));
-
-    switch ( set_debugreg(curr, reg, val) )
-    {
-    case 0:
-        return X86EMUL_OKAY;
-
-    case -ENODEV:
-        x86_emul_hw_exception(TRAP_invalid_op, X86_EVENT_NO_EC, ctxt);
-        return X86EMUL_EXCEPTION;
-
-    default:
-        x86_emul_hw_exception(TRAP_gp_fault, 0, ctxt);
-        return X86EMUL_EXCEPTION;
-    }
-}
-#endif /* CONFIG_PV */
-
-int x86emul_cpuid(uint32_t leaf, uint32_t subleaf,
-                  struct cpuid_leaf *res, struct x86_emulate_ctxt *ctxt)
-{
-    guest_cpuid(current, leaf, subleaf, res);
-
-    return X86EMUL_OKAY;
-}
-
 /*
  * Local variables:
  * mode: C
--- a/xen/arch/x86/x86_emulate/Makefile
+++ b/xen/arch/x86/x86_emulate/Makefile
@@ -4,3 +4,5 @@ obj-y += 0fc7.o
 obj-y += blk.o
 obj-y += decode.o
 obj-$(CONFIG_HVM) += fpu.o
+obj-y += util.o
+obj-y += util-xen.o
--- a/xen/arch/x86/x86_emulate/private.h
+++ b/xen/arch/x86/x86_emulate/private.h
@@ -330,6 +330,13 @@ struct x86_emulate_state {
 #endif
 };
 
+static inline void check_state(const struct x86_emulate_state *s)
+{
+#if defined(__XEN__) && !defined(NDEBUG)
+    ASSERT(s->caller);
+#endif
+}
+
 typedef union {
     uint64_t mmx;
     uint64_t __attribute__ ((aligned(16))) xmm[2];
--- /dev/null
+++ b/xen/arch/x86/x86_emulate/util.c
@@ -0,0 +1,298 @@
+/******************************************************************************
+ * util.c
+ *
+ * Generic x86 (32-bit and 64-bit) instruction decoder and emulator utility
+ * functions.
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License as published by
+ * the Free Software Foundation; either version 2 of the License, or
+ * (at your option) any later version.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ * GNU General Public License for more details.
+ *
+ * You should have received a copy of the GNU General Public License
+ * along with this program; If not, see <http://www.gnu.org/licenses/>.
+ */
+
+#include "private.h"
+
+unsigned int x86_insn_length(const struct x86_emulate_state *s,
+                             const struct x86_emulate_ctxt *ctxt)
+{
+    check_state(s);
+
+    return s->ip - ctxt->regs->r(ip);
+}
+
+/*
+ * This function means to return 'true' for all supported insns with explicit
+ * accesses to memory.  This means also insns which don't have an explicit
+ * memory operand (like POP), but it does not mean e.g. segment selector
+ * loads, where the descriptor table access is considered an implicit one.
+ */
+bool x86_insn_is_mem_access(const struct x86_emulate_state *s,
+                            const struct x86_emulate_ctxt *ctxt)
+{
+    if ( mode_64bit() && s->not_64bit )
+        return false;
+
+    if ( s->ea.type == OP_MEM )
+    {
+        switch ( ctxt->opcode )
+        {
+        case 0x8d: /* LEA */
+        case X86EMUL_OPC(0x0f, 0x0d): /* PREFETCH */
+        case X86EMUL_OPC(0x0f, 0x18)
+         ... X86EMUL_OPC(0x0f, 0x1f): /* NOP space */
+        case X86EMUL_OPC_66(0x0f, 0x18)
+         ... X86EMUL_OPC_66(0x0f, 0x1f): /* NOP space */
+        case X86EMUL_OPC_F3(0x0f, 0x18)
+         ... X86EMUL_OPC_F3(0x0f, 0x1f): /* NOP space */
+        case X86EMUL_OPC_F2(0x0f, 0x18)
+         ... X86EMUL_OPC_F2(0x0f, 0x1f): /* NOP space */
+        case X86EMUL_OPC(0x0f, 0xb9): /* UD1 */
+        case X86EMUL_OPC(0x0f, 0xff): /* UD0 */
+        case X86EMUL_OPC_EVEX_66(0x0f38, 0xc6): /* V{GATH,SCATT}ERPF*D* */
+        case X86EMUL_OPC_EVEX_66(0x0f38, 0xc7): /* V{GATH,SCATT}ERPF*Q* */
+            return false;
+
+        case X86EMUL_OPC(0x0f, 0x01):
+            return (s->modrm_reg & 7) != 7; /* INVLPG */
+
+        case X86EMUL_OPC(0x0f, 0xae):
+            return (s->modrm_reg & 7) != 7; /* CLFLUSH */
+
+        case X86EMUL_OPC_66(0x0f, 0xae):
+            return (s->modrm_reg & 7) < 6; /* CLWB, CLFLUSHOPT */
+        }
+
+        return true;
+    }
+
+    switch ( ctxt->opcode )
+    {
+    case 0x06 ... 0x07:                  /* PUSH / POP %es */
+    case 0x0e:                           /* PUSH %cs */
+    case 0x16 ... 0x17:                  /* PUSH / POP %ss */
+    case 0x1e ... 0x1f:                  /* PUSH / POP %ds */
+    case 0x50 ... 0x5f:                  /* PUSH / POP reg */
+    case 0x60 ... 0x61:                  /* PUSHA / POPA */
+    case 0x68: case 0x6a:                /* PUSH imm */
+    case 0x6c ... 0x6f:                  /* INS / OUTS */
+    case 0x8f:                           /* POP r/m */
+    case 0x9a:                           /* CALL (far, direct) */
+    case 0x9c ... 0x9d:                  /* PUSHF / POPF */
+    case 0xa4 ... 0xa7:                  /* MOVS / CMPS */
+    case 0xaa ... 0xaf:                  /* STOS / LODS / SCAS */
+    case 0xc2 ... 0xc3:                  /* RET (near) */
+    case 0xc8 ... 0xc9:                  /* ENTER / LEAVE */
+    case 0xca ... 0xcb:                  /* RET (far) */
+    case 0xd7:                           /* XLAT */
+    case 0xe8:                           /* CALL (near, direct) */
+    case X86EMUL_OPC(0x0f, 0xa0):        /* PUSH %fs */
+    case X86EMUL_OPC(0x0f, 0xa1):        /* POP %fs */
+    case X86EMUL_OPC(0x0f, 0xa8):        /* PUSH %gs */
+    case X86EMUL_OPC(0x0f, 0xa9):        /* POP %gs */
+    case X86EMUL_OPC(0x0f, 0xf7):        /* MASKMOVQ */
+    case X86EMUL_OPC_66(0x0f, 0xf7):     /* MASKMOVDQU */
+    case X86EMUL_OPC_VEX_66(0x0f, 0xf7): /* VMASKMOVDQU */
+        return true;
+
+    case 0xff:
+        switch ( s->modrm_reg & 7 )
+        {
+        case 2: /* CALL (near, indirect) */
+        case 6: /* PUSH r/m */
+            return true;
+        }
+        break;
+
+    case X86EMUL_OPC(0x0f, 0x01):
+        /* Cover CLZERO. */
+        return (s->modrm_rm & 7) == 4 && (s->modrm_reg & 7) == 7;
+    }
+
+    return false;
+}
+
+/*
+ * This function means to return 'true' for all supported insns with explicit
+ * writes to memory.  This means also insns which don't have an explicit
+ * memory operand (like PUSH), but it does not mean e.g. segment selector
+ * loads, where the (possible) descriptor table write is considered an
+ * implicit access.
+ */
+bool x86_insn_is_mem_write(const struct x86_emulate_state *s,
+                           const struct x86_emulate_ctxt *ctxt)
+{
+    if ( mode_64bit() && s->not_64bit )
+        return false;
+
+    switch ( s->desc & DstMask )
+    {
+    case DstMem:
+        /* The SrcMem check is to cover {,V}MASKMOV{Q,DQU}. */
+        return s->modrm_mod != 3 || (s->desc & SrcMask) == SrcMem;
+
+    case DstBitBase:
+    case DstImplicit:
+        break;
+
+    default:
+        switch ( ctxt->opcode )
+        {
+        case 0x63:                         /* ARPL */
+            return !mode_64bit();
+
+        case X86EMUL_OPC_66(0x0f38, 0xf8): /* MOVDIR64B */
+        case X86EMUL_OPC_F2(0x0f38, 0xf8): /* ENQCMD */
+        case X86EMUL_OPC_F3(0x0f38, 0xf8): /* ENQCMDS */
+            return true;
+
+        case X86EMUL_OPC_EVEX_F3(0x0f38, 0x10) ...
+             X86EMUL_OPC_EVEX_F3(0x0f38, 0x15): /* VPMOVUS* */
+        case X86EMUL_OPC_EVEX_F3(0x0f38, 0x20) ...
+             X86EMUL_OPC_EVEX_F3(0x0f38, 0x25): /* VPMOVS* */
+        case X86EMUL_OPC_EVEX_F3(0x0f38, 0x30) ...
+             X86EMUL_OPC_EVEX_F3(0x0f38, 0x35): /* VPMOV{D,Q,W}* */
+            return s->modrm_mod != 3;
+        }
+
+        return false;
+    }
+
+    if ( s->modrm_mod == 3 )
+    {
+        switch ( ctxt->opcode )
+        {
+        case 0xff: /* Grp5 */
+            break;
+
+        case X86EMUL_OPC(0x0f, 0x01): /* CLZERO is the odd one. */
+            return (s->modrm_rm & 7) == 4 && (s->modrm_reg & 7) == 7;
+
+        default:
+            return false;
+        }
+    }
+
+    switch ( ctxt->opcode )
+    {
+    case 0x06:                           /* PUSH %es */
+    case 0x0e:                           /* PUSH %cs */
+    case 0x16:                           /* PUSH %ss */
+    case 0x1e:                           /* PUSH %ds */
+    case 0x50 ... 0x57:                  /* PUSH reg */
+    case 0x60:                           /* PUSHA */
+    case 0x68: case 0x6a:                /* PUSH imm */
+    case 0x6c: case 0x6d:                /* INS */
+    case 0x9a:                           /* CALL (far, direct) */
+    case 0x9c:                           /* PUSHF */
+    case 0xa4: case 0xa5:                /* MOVS */
+    case 0xaa: case 0xab:                /* STOS */
+    case 0xc8:                           /* ENTER */
+    case 0xe8:                           /* CALL (near, direct) */
+    case X86EMUL_OPC(0x0f, 0xa0):        /* PUSH %fs */
+    case X86EMUL_OPC(0x0f, 0xa8):        /* PUSH %gs */
+    case X86EMUL_OPC(0x0f, 0xab):        /* BTS */
+    case X86EMUL_OPC(0x0f, 0xb3):        /* BTR */
+    case X86EMUL_OPC(0x0f, 0xbb):        /* BTC */
+        return true;
+
+    case 0xd9:
+        switch ( s->modrm_reg & 7 )
+        {
+        case 2: /* FST m32fp */
+        case 3: /* FSTP m32fp */
+        case 6: /* FNSTENV */
+        case 7: /* FNSTCW */
+            return true;
+        }
+        break;
+
+    case 0xdb:
+        switch ( s->modrm_reg & 7 )
+        {
+        case 1: /* FISTTP m32i */
+        case 2: /* FIST m32i */
+        case 3: /* FISTP m32i */
+        case 7: /* FSTP m80fp */
+            return true;
+        }
+        break;
+
+    case 0xdd:
+        switch ( s->modrm_reg & 7 )
+        {
+        case 1: /* FISTTP m64i */
+        case 2: /* FST m64fp */
+        case 3: /* FSTP m64fp */
+        case 6: /* FNSAVE */
+        case 7: /* FNSTSW */
+            return true;
+        }
+        break;
+
+    case 0xdf:
+        switch ( s->modrm_reg & 7 )
+        {
+        case 1: /* FISTTP m16i */
+        case 2: /* FIST m16i */
+        case 3: /* FISTP m16i */
+        case 6: /* FBSTP */
+        case 7: /* FISTP m64i */
+            return true;
+        }
+        break;
+
+    case 0xff:
+        switch ( s->modrm_reg & 7 )
+        {
+        case 2: /* CALL (near, indirect) */
+        case 3: /* CALL (far, indirect) */
+        case 6: /* PUSH r/m */
+            return true;
+        }
+        break;
+
+    case X86EMUL_OPC(0x0f, 0x01):
+        switch ( s->modrm_reg & 7 )
+        {
+        case 0: /* SGDT */
+        case 1: /* SIDT */
+        case 4: /* SMSW */
+            return true;
+        }
+        break;
+
+    case X86EMUL_OPC(0x0f, 0xae):
+        switch ( s->modrm_reg & 7 )
+        {
+        case 0: /* FXSAVE */
+        /* case 3: STMXCSR - handled above */
+        case 4: /* XSAVE */
+        case 6: /* XSAVEOPT */
+            return true;
+        }
+        break;
+
+    case X86EMUL_OPC(0x0f, 0xba):
+        return (s->modrm_reg & 7) > 4; /* BTS / BTR / BTC */
+
+    case X86EMUL_OPC(0x0f, 0xc7):
+        switch ( s->modrm_reg & 7 )
+        {
+        case 1: /* CMPXCHG{8,16}B */
+        case 4: /* XSAVEC */
+        case 5: /* XSAVES */
+            return true;
+        }
+        break;
+    }
+
+    return false;
+}
--- /dev/null
+++ b/xen/arch/x86/x86_emulate/util-xen.c
@@ -0,0 +1,249 @@
+/******************************************************************************
+ * util-xen.c
+ *
+ * Generic x86 (32-bit and 64-bit) instruction decoder and emulator hypervisor-
+ * only utility functions.
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License as published by
+ * the Free Software Foundation; either version 2 of the License, or
+ * (at your option) any later version.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ * GNU General Public License for more details.
+ *
+ * You should have received a copy of the GNU General Public License
+ * along with this program; If not, see <http://www.gnu.org/licenses/>.
+ */
+
+#include "private.h"
+
+#include <xen/nospec.h>
+#include <xen/sched.h>
+#include <asm/debugreg.h>
+#include <asm/xstate.h>
+
+#ifndef NDEBUG
+void x86_emulate_free_state(struct x86_emulate_state *s)
+{
+    check_state(s);
+    s->caller = NULL;
+}
+#endif
+
+unsigned int x86_insn_opsize(const struct x86_emulate_state *s)
+{
+    check_state(s);
+
+    return s->op_bytes << 3;
+}
+
+int x86_insn_modrm(const struct x86_emulate_state *s,
+                   unsigned int *rm, unsigned int *reg)
+{
+    check_state(s);
+
+    if ( unlikely(s->modrm_mod > 3) )
+    {
+        if ( rm )
+            *rm = ~0U;
+        if ( reg )
+            *reg = ~0U;
+        return -EINVAL;
+    }
+
+    if ( rm )
+        *rm = s->modrm_rm;
+    if ( reg )
+        *reg = s->modrm_reg;
+
+    return s->modrm_mod;
+}
+
+unsigned long x86_insn_operand_ea(const struct x86_emulate_state *s,
+                                  enum x86_segment *seg)
+{
+    *seg = s->ea.type == OP_MEM ? s->ea.mem.seg : x86_seg_none;
+
+    check_state(s);
+
+    return s->ea.mem.off;
+}
+
+bool x86_insn_is_portio(const struct x86_emulate_state *s,
+                        const struct x86_emulate_ctxt *ctxt)
+{
+    switch ( ctxt->opcode )
+    {
+    case 0x6c ... 0x6f: /* INS / OUTS */
+    case 0xe4 ... 0xe7: /* IN / OUT imm8 */
+    case 0xec ... 0xef: /* IN / OUT %dx */
+        return true;
+    }
+
+    return false;
+}
+
+bool x86_insn_is_cr_access(const struct x86_emulate_state *s,
+                           const struct x86_emulate_ctxt *ctxt)
+{
+    switch ( ctxt->opcode )
+    {
+        unsigned int ext;
+
+    case X86EMUL_OPC(0x0f, 0x01):
+        if ( x86_insn_modrm(s, NULL, &ext) >= 0
+             && (ext & 5) == 4 ) /* SMSW / LMSW */
+            return true;
+        break;
+
+    case X86EMUL_OPC(0x0f, 0x06): /* CLTS */
+    case X86EMUL_OPC(0x0f, 0x20): /* MOV from CRn */
+    case X86EMUL_OPC(0x0f, 0x22): /* MOV to CRn */
+        return true;
+    }
+
+    return false;
+}
+
+unsigned long x86_insn_immediate(const struct x86_emulate_state *s,
+                                 unsigned int nr)
+{
+    check_state(s);
+
+    switch ( nr )
+    {
+    case 0:
+        return s->imm1;
+    case 1:
+        return s->imm2;
+    }
+
+    return 0;
+}
+
+int x86emul_read_xcr(unsigned int reg, uint64_t *val,
+                     struct x86_emulate_ctxt *ctxt)
+{
+    switch ( reg )
+    {
+    case 0:
+        *val = current->arch.xcr0;
+        return X86EMUL_OKAY;
+
+    case 1:
+        if ( current->domain->arch.cpuid->xstate.xgetbv1 )
+            break;
+        /* fall through */
+    default:
+        x86_emul_hw_exception(TRAP_gp_fault, 0, ctxt);
+        return X86EMUL_EXCEPTION;
+    }
+
+    *val = xgetbv(reg);
+
+    return X86EMUL_OKAY;
+}
+
+/* Note: May be called with ctxt=NULL. */
+int x86emul_write_xcr(unsigned int reg, uint64_t val,
+                      struct x86_emulate_ctxt *ctxt)
+{
+    switch ( reg )
+    {
+    case 0:
+        break;
+
+    default:
+    gp_fault:
+        if ( ctxt )
+            x86_emul_hw_exception(TRAP_gp_fault, 0, ctxt);
+        return X86EMUL_EXCEPTION;
+    }
+
+    if ( unlikely(handle_xsetbv(reg, val) != 0) )
+        goto gp_fault;
+
+    return X86EMUL_OKAY;
+}
+
+#ifdef CONFIG_PV
+
+/* Called with NULL ctxt in hypercall context. */
+int x86emul_read_dr(unsigned int reg, unsigned long *val,
+                    struct x86_emulate_ctxt *ctxt)
+{
+    struct vcpu *curr = current;
+
+    /* HVM support requires a bit more plumbing before it will work. */
+    ASSERT(is_pv_vcpu(curr));
+
+    switch ( reg )
+    {
+    case 0 ... 3:
+        *val = array_access_nospec(curr->arch.dr, reg);
+        break;
+
+    case 4:
+        if ( curr->arch.pv.ctrlreg[4] & X86_CR4_DE )
+            goto ud_fault;
+
+        /* Fallthrough */
+    case 6:
+        *val = curr->arch.dr6;
+        break;
+
+    case 5:
+        if ( curr->arch.pv.ctrlreg[4] & X86_CR4_DE )
+            goto ud_fault;
+
+        /* Fallthrough */
+    case 7:
+        *val = curr->arch.dr7 | curr->arch.pv.dr7_emul;
+        break;
+
+    ud_fault:
+    default:
+        if ( ctxt )
+            x86_emul_hw_exception(TRAP_invalid_op, X86_EVENT_NO_EC, ctxt);
+
+        return X86EMUL_EXCEPTION;
+    }
+
+    return X86EMUL_OKAY;
+}
+
+int x86emul_write_dr(unsigned int reg, unsigned long val,
+                     struct x86_emulate_ctxt *ctxt)
+{
+    struct vcpu *curr = current;
+
+    /* HVM support requires a bit more plumbing before it will work. */
+    ASSERT(is_pv_vcpu(curr));
+
+    switch ( set_debugreg(curr, reg, val) )
+    {
+    case 0:
+        return X86EMUL_OKAY;
+
+    case -ENODEV:
+        x86_emul_hw_exception(TRAP_invalid_op, X86_EVENT_NO_EC, ctxt);
+        return X86EMUL_EXCEPTION;
+
+    default:
+        x86_emul_hw_exception(TRAP_gp_fault, 0, ctxt);
+        return X86EMUL_EXCEPTION;
+    }
+}
+
+#endif /* CONFIG_PV */
+
+int x86emul_cpuid(uint32_t leaf, uint32_t subleaf,
+                  struct cpuid_leaf *res, struct x86_emulate_ctxt *ctxt)
+{
+    guest_cpuid(current, leaf, subleaf, res);
+
+    return X86EMUL_OKAY;
+}
--- a/xen/arch/x86/x86_emulate/x86_emulate.c
+++ b/xen/arch/x86/x86_emulate/x86_emulate.c
@@ -8412,393 +8412,3 @@ int x86_emulate_wrapper(
     return rc;
 }
 #endif
-
-static inline void check_state(const struct x86_emulate_state *state)
-{
-#if defined(__XEN__) && !defined(NDEBUG)
-    ASSERT(state->caller);
-#endif
-}
-
-#if defined(__XEN__) && !defined(NDEBUG)
-void x86_emulate_free_state(struct x86_emulate_state *state)
-{
-    check_state(state);
-    state->caller = NULL;
-}
-#endif
-
-unsigned int
-x86_insn_opsize(const struct x86_emulate_state *state)
-{
-    check_state(state);
-
-    return state->op_bytes << 3;
-}
-
-int
-x86_insn_modrm(const struct x86_emulate_state *state,
-               unsigned int *rm, unsigned int *reg)
-{
-    check_state(state);
-
-    if ( unlikely(state->modrm_mod > 3) )
-    {
-        if ( rm )
-            *rm = ~0U;
-        if ( reg )
-            *reg = ~0U;
-        return -EINVAL;
-    }
-
-    if ( rm )
-        *rm = state->modrm_rm;
-    if ( reg )
-        *reg = state->modrm_reg;
-
-    return state->modrm_mod;
-}
-
-unsigned long
-x86_insn_operand_ea(const struct x86_emulate_state *state,
-                    enum x86_segment *seg)
-{
-    *seg = state->ea.type == OP_MEM ? state->ea.mem.seg : x86_seg_none;
-
-    check_state(state);
-
-    return state->ea.mem.off;
-}
-
-/*
- * This function means to return 'true' for all supported insns with explicit
- * accesses to memory.  This means also insns which don't have an explicit
- * memory operand (like POP), but it does not mean e.g. segment selector
- * loads, where the descriptor table access is considered an implicit one.
- */
-bool
-x86_insn_is_mem_access(const struct x86_emulate_state *state,
-                       const struct x86_emulate_ctxt *ctxt)
-{
-    if ( mode_64bit() && state->not_64bit )
-        return false;
-
-    if ( state->ea.type == OP_MEM )
-    {
-        switch ( ctxt->opcode )
-        {
-        case 0x8d: /* LEA */
-        case X86EMUL_OPC(0x0f, 0x0d): /* PREFETCH */
-        case X86EMUL_OPC(0x0f, 0x18)
-         ... X86EMUL_OPC(0x0f, 0x1f): /* NOP space */
-        case X86EMUL_OPC_66(0x0f, 0x18)
-         ... X86EMUL_OPC_66(0x0f, 0x1f): /* NOP space */
-        case X86EMUL_OPC_F3(0x0f, 0x18)
-         ... X86EMUL_OPC_F3(0x0f, 0x1f): /* NOP space */
-        case X86EMUL_OPC_F2(0x0f, 0x18)
-         ... X86EMUL_OPC_F2(0x0f, 0x1f): /* NOP space */
-        case X86EMUL_OPC(0x0f, 0xb9): /* UD1 */
-        case X86EMUL_OPC(0x0f, 0xff): /* UD0 */
-        case X86EMUL_OPC_EVEX_66(0x0f38, 0xc6): /* V{GATH,SCATT}ERPF*D* */
-        case X86EMUL_OPC_EVEX_66(0x0f38, 0xc7): /* V{GATH,SCATT}ERPF*Q* */
-            return false;
-
-        case X86EMUL_OPC(0x0f, 0x01):
-            return (state->modrm_reg & 7) != 7; /* INVLPG */
-
-        case X86EMUL_OPC(0x0f, 0xae):
-            return (state->modrm_reg & 7) != 7; /* CLFLUSH */
-
-        case X86EMUL_OPC_66(0x0f, 0xae):
-            return (state->modrm_reg & 7) < 6; /* CLWB, CLFLUSHOPT */
-        }
-
-        return true;
-    }
-
-    switch ( ctxt->opcode )
-    {
-    case 0x06 ... 0x07: /* PUSH / POP %es */
-    case 0x0e:          /* PUSH %cs */
-    case 0x16 ... 0x17: /* PUSH / POP %ss */
-    case 0x1e ... 0x1f: /* PUSH / POP %ds */
-    case 0x50 ... 0x5f: /* PUSH / POP reg */
-    case 0x60 ... 0x61: /* PUSHA / POPA */
-    case 0x68: case 0x6a: /* PUSH imm */
-    case 0x6c ... 0x6f: /* INS / OUTS */
-    case 0x8f:          /* POP r/m */
-    case 0x9a:          /* CALL (far, direct) */
-    case 0x9c ... 0x9d: /* PUSHF / POPF */
-    case 0xa4 ... 0xa7: /* MOVS / CMPS */
-    case 0xaa ... 0xaf: /* STOS / LODS / SCAS */
-    case 0xc2 ... 0xc3: /* RET (near) */
-    case 0xc8 ... 0xc9: /* ENTER / LEAVE */
-    case 0xca ... 0xcb: /* RET (far) */
-    case 0xd7:          /* XLAT */
-    case 0xe8:          /* CALL (near, direct) */
-    case X86EMUL_OPC(0x0f, 0xa0):         /* PUSH %fs */
-    case X86EMUL_OPC(0x0f, 0xa1):         /* POP %fs */
-    case X86EMUL_OPC(0x0f, 0xa8):         /* PUSH %gs */
-    case X86EMUL_OPC(0x0f, 0xa9):         /* POP %gs */
-    CASE_SIMD_PACKED_INT_VEX(0x0f, 0xf7): /* MASKMOV{Q,DQU} */
-                                          /* VMASKMOVDQU */
-        return true;
-
-    case 0xff:
-        switch ( state->modrm_reg & 7 )
-        {
-        case 2: /* CALL (near, indirect) */
-        case 6: /* PUSH r/m */
-            return true;
-        }
-        break;
-
-    case X86EMUL_OPC(0x0f, 0x01):
-        /* Cover CLZERO. */
-        return (state->modrm_rm & 7) == 4 && (state->modrm_reg & 7) == 7;
-    }
-
-    return false;
-}
-
-/*
- * This function means to return 'true' for all supported insns with explicit
- * writes to memory.  This means also insns which don't have an explicit
- * memory operand (like PUSH), but it does not mean e.g. segment selector
- * loads, where the (possible) descriptor table write is considered an
- * implicit access.
- */
-bool
-x86_insn_is_mem_write(const struct x86_emulate_state *state,
-                      const struct x86_emulate_ctxt *ctxt)
-{
-    if ( mode_64bit() && state->not_64bit )
-        return false;
-
-    switch ( state->desc & DstMask )
-    {
-    case DstMem:
-        /* The SrcMem check is to cover {,V}MASKMOV{Q,DQU}. */
-        return state->modrm_mod != 3 || (state->desc & SrcMask) == SrcMem;
-
-    case DstBitBase:
-    case DstImplicit:
-        break;
-
-    default:
-        switch ( ctxt->opcode )
-        {
-        case 0x63:                         /* ARPL */
-            return !mode_64bit();
-
-        case X86EMUL_OPC_66(0x0f38, 0xf8): /* MOVDIR64B */
-        case X86EMUL_OPC_F2(0x0f38, 0xf8): /* ENQCMD */
-        case X86EMUL_OPC_F3(0x0f38, 0xf8): /* ENQCMDS */
-            return true;
-
-        case X86EMUL_OPC_EVEX_F3(0x0f38, 0x10) ...
-             X86EMUL_OPC_EVEX_F3(0x0f38, 0x15): /* VPMOVUS* */
-        case X86EMUL_OPC_EVEX_F3(0x0f38, 0x20) ...
-             X86EMUL_OPC_EVEX_F3(0x0f38, 0x25): /* VPMOVS* */
-        case X86EMUL_OPC_EVEX_F3(0x0f38, 0x30) ...
-             X86EMUL_OPC_EVEX_F3(0x0f38, 0x35): /* VPMOV{D,Q,W}* */
-            return state->modrm_mod != 3;
-        }
-
-        return false;
-    }
-
-    if ( state->modrm_mod == 3 )
-    {
-        switch ( ctxt->opcode )
-        {
-        case 0xff: /* Grp5 */
-            break;
-
-        case X86EMUL_OPC(0x0f, 0x01): /* CLZERO is the odd one. */
-            return (state->modrm_rm & 7) == 4 && (state->modrm_reg & 7) == 7;
-
-        default:
-            return false;
-        }
-    }
-
-    switch ( ctxt->opcode )
-    {
-    case 0x06:                           /* PUSH %es */
-    case 0x0e:                           /* PUSH %cs */
-    case 0x16:                           /* PUSH %ss */
-    case 0x1e:                           /* PUSH %ds */
-    case 0x50 ... 0x57:                  /* PUSH reg */
-    case 0x60:                           /* PUSHA */
-    case 0x68: case 0x6a:                /* PUSH imm */
-    case 0x6c: case 0x6d:                /* INS */
-    case 0x9a:                           /* CALL (far, direct) */
-    case 0x9c:                           /* PUSHF */
-    case 0xa4: case 0xa5:                /* MOVS */
-    case 0xaa: case 0xab:                /* STOS */
-    case 0xc8:                           /* ENTER */
-    case 0xe8:                           /* CALL (near, direct) */
-    case X86EMUL_OPC(0x0f, 0xa0):        /* PUSH %fs */
-    case X86EMUL_OPC(0x0f, 0xa8):        /* PUSH %gs */
-    case X86EMUL_OPC(0x0f, 0xab):        /* BTS */
-    case X86EMUL_OPC(0x0f, 0xb3):        /* BTR */
-    case X86EMUL_OPC(0x0f, 0xbb):        /* BTC */
-        return true;
-
-    case 0xd9:
-        switch ( state->modrm_reg & 7 )
-        {
-        case 2: /* FST m32fp */
-        case 3: /* FSTP m32fp */
-        case 6: /* FNSTENV */
-        case 7: /* FNSTCW */
-            return true;
-        }
-        break;
-
-    case 0xdb:
-        switch ( state->modrm_reg & 7 )
-        {
-        case 1: /* FISTTP m32i */
-        case 2: /* FIST m32i */
-        case 3: /* FISTP m32i */
-        case 7: /* FSTP m80fp */
-            return true;
-        }
-        break;
-
-    case 0xdd:
-        switch ( state->modrm_reg & 7 )
-        {
-        case 1: /* FISTTP m64i */
-        case 2: /* FST m64fp */
-        case 3: /* FSTP m64fp */
-        case 6: /* FNSAVE */
-        case 7: /* FNSTSW */
-            return true;
-        }
-        break;
-
-    case 0xdf:
-        switch ( state->modrm_reg & 7 )
-        {
-        case 1: /* FISTTP m16i */
-        case 2: /* FIST m16i */
-        case 3: /* FISTP m16i */
-        case 6: /* FBSTP */
-        case 7: /* FISTP m64i */
-            return true;
-        }
-        break;
-
-    case 0xff:
-        switch ( state->modrm_reg & 7 )
-        {
-        case 2: /* CALL (near, indirect) */
-        case 3: /* CALL (far, indirect) */
-        case 6: /* PUSH r/m */
-            return true;
-        }
-        break;
-
-    case X86EMUL_OPC(0x0f, 0x01):
-        switch ( state->modrm_reg & 7 )
-        {
-        case 0: /* SGDT */
-        case 1: /* SIDT */
-        case 4: /* SMSW */
-            return true;
-        }
-        break;
-
-    case X86EMUL_OPC(0x0f, 0xae):
-        switch ( state->modrm_reg & 7 )
-        {
-        case 0: /* FXSAVE */
-        /* case 3: STMXCSR - handled above */
-        case 4: /* XSAVE */
-        case 6: /* XSAVEOPT */
-            return true;
-        }
-        break;
-
-    case X86EMUL_OPC(0x0f, 0xba):
-        return (state->modrm_reg & 7) > 4; /* BTS / BTR / BTC */
-
-    case X86EMUL_OPC(0x0f, 0xc7):
-        switch ( state->modrm_reg & 7 )
-        {
-        case 1: /* CMPXCHG{8,16}B */
-        case 4: /* XSAVEC */
-        case 5: /* XSAVES */
-            return true;
-        }
-        break;
-    }
-
-    return false;
-}
-
-bool
-x86_insn_is_portio(const struct x86_emulate_state *state,
-                   const struct x86_emulate_ctxt *ctxt)
-{
-    switch ( ctxt->opcode )
-    {
-    case 0x6c ... 0x6f: /* INS / OUTS */
-    case 0xe4 ... 0xe7: /* IN / OUT imm8 */
-    case 0xec ... 0xef: /* IN / OUT %dx */
-        return true;
-    }
-
-    return false;
-}
-
-bool
-x86_insn_is_cr_access(const struct x86_emulate_state *state,
-                      const struct x86_emulate_ctxt *ctxt)
-{
-    switch ( ctxt->opcode )
-    {
-        unsigned int ext;
-
-    case X86EMUL_OPC(0x0f, 0x01):
-        if ( x86_insn_modrm(state, NULL, &ext) >= 0
-             && (ext & 5) == 4 ) /* SMSW / LMSW */
-            return true;
-        break;
-
-    case X86EMUL_OPC(0x0f, 0x06): /* CLTS */
-    case X86EMUL_OPC(0x0f, 0x20): /* MOV from CRn */
-    case X86EMUL_OPC(0x0f, 0x22): /* MOV to CRn */
-        return true;
-    }
-
-    return false;
-}
-
-unsigned long
-x86_insn_immediate(const struct x86_emulate_state *state, unsigned int nr)
-{
-    check_state(state);
-
-    switch ( nr )
-    {
-    case 0:
-        return state->imm1;
-    case 1:
-        return state->imm2;
-    }
-
-    return 0;
-}
-
-unsigned int
-x86_insn_length(const struct x86_emulate_state *state,
-                const struct x86_emulate_ctxt *ctxt)
-{
-    check_state(state);
-
-    return state->ip - ctxt->regs->r(ip);
-}


