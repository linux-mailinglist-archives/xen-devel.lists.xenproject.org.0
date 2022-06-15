Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D431C54C54F
	for <lists+xen-devel@lfdr.de>; Wed, 15 Jun 2022 12:01:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.349843.576035 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o1Pps-0005Gx-Fz; Wed, 15 Jun 2022 10:01:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 349843.576035; Wed, 15 Jun 2022 10:01:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o1Pps-0005FB-CS; Wed, 15 Jun 2022 10:01:16 +0000
Received: by outflank-mailman (input) for mailman id 349843;
 Wed, 15 Jun 2022 10:01:14 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=56zs=WW=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1o1Ppq-0005BP-Cp
 for xen-devel@lists.xenproject.org; Wed, 15 Jun 2022 10:01:14 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on20606.outbound.protection.outlook.com
 [2a01:111:f400:7e1a::606])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 15dfb1e8-ec92-11ec-ab14-113154c10af9;
 Wed, 15 Jun 2022 12:01:12 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DU2PR04MB8981.eurprd04.prod.outlook.com (2603:10a6:10:2e0::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5332.20; Wed, 15 Jun
 2022 10:01:10 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::dfa:a64a:432f:e26b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::dfa:a64a:432f:e26b%7]) with mapi id 15.20.5332.020; Wed, 15 Jun 2022
 10:01:10 +0000
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
X-Inumbo-ID: 15dfb1e8-ec92-11ec-ab14-113154c10af9
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=galJlRCPHgZOhIfrk/t6X/JH+4y9wg/WLGPFFuN4AycWt1WrnQbzRrhXEuBrHjNDWcUPq7dx3JbvL4Gwin5hkGjwFO3tV/7vpVnZ8ygA4dpa96PFX89lcg0ZrWNMp5tUThHeQk7ILfBVxE+dSYkGSCO/09t9HvzMxpigaxyF4FVnkUgxAuXhp1XEMvR3z7cfjr4evthgib5LOQyG9iRKUFuUFdEraadJfjwvMpD36tF4wS0bvXGIro357roNBkAGELPAbaMSoONQBaeWj7EMQRxRg7CGjV9lKCqbMWekmjF3KtaylfpGHf8xsCyp5IOK9DyDZRbDrC8dPTvrsIy53w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ohfM2VreBd5WQTy/j3TfsjM1MewtvAw3hMJKgkcBjLw=;
 b=BItzRopYcBzI73Y1W7dJv1iVejT9T9fOojz0qx2ZGJBE/yVg5ZdJZWhsRHBtbAwVZvWY3r/xZz1AEyBr3/dSqGp0mTvyDjB98oin9VcdogDoDp1pMvRmt994FO8xgY1nnkCqH5nx3g+y9pGl68+YN7FeTR14NUY6esGWLitPwRwq4RREvyZZlzUDQbzSEYyCmp95LaxwhEnOxYmoOQDklPaekvi7SpXpnzhgOd27rz7EagC/PzndDu8F1T++c7y8kNhD+5yENH0orspB1hU6LNiLHHAj0x6xV7vFb3GPD1AQDg141Ml7oS/XMS8oy0aLg+jLAegAZiSrflVktb9tsA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ohfM2VreBd5WQTy/j3TfsjM1MewtvAw3hMJKgkcBjLw=;
 b=csl0Bx58QTQ81OUbb9vnyC5w3Cw+uy+EDTzKDWUhoUQdIps78OboQk0P7p965E4x80VwhJqqQsUMkrrFqSUuHeHzqLGeIFKe4cQel8G5oqooek93A4P+52rlXD89oS5j7T1tDb68CLRCF+/5j4GfEamaXV8F1paoTZLBtGw5V9ENz/QaAwdNOKMTnNZdbMFoTSb044qMcDX4Rur5b2JcY4j5wQ1UiueZ8iNpZv2x/k4f2V6KaRPsQT+H/+CchZEhBx7n0BRdH/Aw6Ei8VsFeqAXk2O/xlJ9FpiqNwl7hpO9F42T3ElCO4bhvLuSc26CpMa9CFLtOaL9AT8JeK1lHww==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <4d6c0008-2157-acc9-5cd7-12ed4016048d@suse.com>
Date: Wed, 15 Jun 2022 12:01:08 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: [PATCH v2 7/8] x86emul: move various utility functions to separate
 source files
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <7f5287ad-8442-6c53-d513-f9a8345c4857@suse.com>
In-Reply-To: <7f5287ad-8442-6c53-d513-f9a8345c4857@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FRYP281CA0017.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10::27)
 To VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 84358331-82b5-4597-7160-08da4eb5f92f
X-MS-TrafficTypeDiagnostic: DU2PR04MB8981:EE_
X-Microsoft-Antispam-PRVS:
	<DU2PR04MB89815166204F133C130E633FB3AD9@DU2PR04MB8981.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	N1VLILjBis/nTav7yYIaeAwdTjuxZSHcUrsZnxHWDDeok75Ez6/IDikDmLtZMhViLaqoTQs0SmZkjVZHucdtAYs7e0vwBvV3JPerVoMM8ff4FpZvouid788787tRnyXD4gA4xkp1Sqqy9Kvee5DVkbNZMGhPRQiSTZ1mvink1RvwiHYrQzb6SeTeNpX39Fkl07NGobbszny7GPKC1kmVJ0EiKCTWBLFYEzs+uYa03MaHDCG/dkA3Dxd0NMcgeuu9rBamq3Y8mimjl6eqtnpe7SP//8OzhIYOxIhw/sWkFNZiaN0NJCjGoNl2UG1V38Q/hiNwEoNrkD1isRxq318uLhT6NGfF1IaqV5X656tzJdTqwN9mObNMQvw+uFrhp6XdgQlVKgCIIbX3Lva0twHfhMc7WsOJp9BzeqrDdfYBo7Sqhcaxxc5oQDT8Y9n/CIgigLOHo5Fl6YdzqWici6AEiOmFF5JlE3nnfyVDsWsHu9bcKz640C+R0DWZJWIMt2ReWr64Jd87kTdjfujSPkDIuaMa+P4j5/ix2BSkBrGCwWj2YgA1hbjdi53zZwLDivAVPTeaFIZGer8yEcLqNYYNj3oSF6835hnimbLEnQJi2twL/TmU2Mq9ohMEZDl1YOKZ4LFuTTHo8xx5A/ExqF9KRcJp/I+wMBrC9CXehP7VFXJYsnDvFSW+gtw/vNO+6t4aiIh5JC8tQwjnaKUgOUMumqyXDXrOOFGfF7EE7vabu8w90DIoj1xwFjr9bKVa+c1giQT+06oqE9Ty4MZbmg/5Zg/LH6m8253xZZmHDLs5DJ8We3B8DuVWtzjyT3EtKaecFS8fGMI0UrcM4GmdnuDAPw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(366004)(83380400001)(6512007)(4326008)(26005)(54906003)(66556008)(36756003)(6506007)(316002)(186003)(31686004)(2906002)(30864003)(5660300002)(8676002)(31696002)(6916009)(86362001)(6486002)(66476007)(66946007)(66574015)(508600001)(2616005)(8936002)(38100700002)(2004002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NVZER2RseXRZOVVPL20wVHlLcnZOZXlqOGtrQmErOStnalhBemszRmNVclAy?=
 =?utf-8?B?Y1l3WmZuQkF1NCtNZ2JVVkMzakM0UnB6L2hEZkZHWEplSXhqSy84bk9sdktz?=
 =?utf-8?B?UHZtUHg2dzRwUXl6dEN4ZnFFbW1HbFAyOEJ5aUorV29aclRGWXNRbDNLdG0v?=
 =?utf-8?B?Uk5LTG9IQ0ltZ0VmaHNaVGYzZy8xc2drTEl1anZIc3VYTFR3ZHRmVGVTRkF3?=
 =?utf-8?B?NnYvcUJYcGE3Wm9mc2JZVExFV2JmQjF3ZENSNGg5bkY4ejd5RHQyUmZzaUly?=
 =?utf-8?B?WG5JeFF5aHdIZHQ5ZG05V0Y0aVJmVURZc1pLQWVJWHQyYTFrVk82dmVpY0dN?=
 =?utf-8?B?TVhvVk5DckFpOUZkdUZPRUJGNmlocmdCUm9vL0xRY2FMN1pCVXE3QWhRM3N4?=
 =?utf-8?B?TEhvT2Y3YmFLbWl3ZFF4QmpYSklzRDZRWXdFRFFYeGVmNkZLSys3VUtXcmJD?=
 =?utf-8?B?OVJXZ2Y5OHpFcWg1ck9lQzZrOUlsSEtPTDE1cEFHcWtSK2Q2V1F2WTc1VzNI?=
 =?utf-8?B?cnRBOU1ZYy9Qekh0Z3NLaEpQOXEwU2tWMTZVL2Q2RHZjdHIxK3NQMFZmTEVG?=
 =?utf-8?B?ZUQ1Zks0RlFzZVhpQ2dSRWxPSXY2blN2T2JIK2lyNThLeHk1VHlkR2dxcndO?=
 =?utf-8?B?VitoNmI0c25xSHdrcjU4QTlsOHN5clFGdWJTMDBSQ0NmdHFFZjdaNXBIZE9N?=
 =?utf-8?B?MzNxeG0wZUZOMUY1eEtqSzFXK0dPaHNYQythdTZaRTM5eDlPeXBWWWNQVUgr?=
 =?utf-8?B?eUNTcEVOVnU5NHJPeTgyL2Z0bWR3VytoMldGUkwxNEFGNXF1ak5rWE5KUWdZ?=
 =?utf-8?B?M3pQaDZYMUlLYmZOUExYbGUwTmtERXN1QVdyamVpRU5YWDFmUmR0NnZxUlhY?=
 =?utf-8?B?NFJIZEZCb2Y0ZVVhQ3E4SUJpV0l3eEJGK1hUblhialN4NXpJTHorMWwyM3Vr?=
 =?utf-8?B?UGxJS3BlTmhBQVlqUmVpL1JNNEtaNzB0MW1vUE41VnFPTGNZSDMzVXlZMUw4?=
 =?utf-8?B?bUN4MUlMS293QzNNTjBVU1lVQlB1b01mMzdRZmh5WjJJMFVWbzFGL2JDNlpm?=
 =?utf-8?B?V2J0YXVRaUZFNTBRQzFxaUdYK1V2cU9pczdaanc5MzBVYWFLZkdHTVRrcTgr?=
 =?utf-8?B?a0lpaGVkK1o3T2laZG9VdTQwYmFzR2JlUVRYU1JQNWFrYkNmQUhnaktGUDBX?=
 =?utf-8?B?eHM5TEYyWk1zb0VxTVVvUTFuK3hGdVNtVmZVNWo2b3JOa2hPV0Frdno3Mldh?=
 =?utf-8?B?Q0xscjd1ei9sUlI5N0tZeHdUQmhWdVZVZzA3UzYrNEhSZXd2bUpFQ1R2MHhR?=
 =?utf-8?B?ZlJaS1JBL09OcnljellLQi81WnNaSURTQ29EdXhRM3RvRUdUazFReHp1VnM5?=
 =?utf-8?B?USs5MGlQbWVscFZBOHFZSTBMZFA1a0JZWksxYUlCU2ptWGxSVW1GNlBJc28v?=
 =?utf-8?B?VVVZM0lvVDFvRUUxYUp1czBMLzFPRm1oQkJIKzlVY0FMRjRBMDh4SXdOQVhk?=
 =?utf-8?B?OS9LWEVkUUV4MHNwd2RPTFc4ZDllK1IzZkNEVjB1MmorcmlEZGJPQ2RnaHRL?=
 =?utf-8?B?WExlVDlZT2tEaFJNeG5NUG5GbzV5SXp5TkZpMlVqTy8waXpaUzVlTDBqU1pt?=
 =?utf-8?B?eFNNd0VRRnRDSVVhUVAyQlgyWWVMSkNyR1BwdEdlMGcvMmRhNzdTM0wwQkZu?=
 =?utf-8?B?ekl6NklFYldkVGJYSmhiRktYVmFYSEFFRHc4UUgwa2pBQ0ZRcFdRMkNZODNp?=
 =?utf-8?B?dFlpYlZjNDNNVjkyc1dobXViQkRsRld4SEw2WHRUL0F0Q0RySXdxdlByWk84?=
 =?utf-8?B?ZFI2N0wxU2lZZ3hrcVgyS1ovSTR1N2N0YUlNalNleStxb0ZQSElDSnBQMlgy?=
 =?utf-8?B?M2I5Z08wb3V5QjF5NERsU0pSVlp4cVBGRlpOSCtVUXBwQzhpek9iejV0dSty?=
 =?utf-8?B?aDBDMW5WNDVzZG1jWGpRV01iTDF6UHpJbm5ERmVud0pTWnhxdnpnRXkwMGlT?=
 =?utf-8?B?ZEttNEVCYlgwa2Iza1VscmV5NGhUc1k3bm54V25Nd1FjZ1JkMGk3V1RaZXJB?=
 =?utf-8?B?QVNJOXc4ditDczY2RGRMYjVRTWw4N2d4Q0pQR3luYW1xeFJDZ3g4Umk3T2Yz?=
 =?utf-8?B?eE9Id2ozTjNLMktFdVM2UlNRWWlnQlJ6Z1dpRklEOHVyTVNVck9BS0I4cDlS?=
 =?utf-8?B?OThrcHlRZEZndGs5QTQyVi9pQ3RLM1hvbXlCb1ArSG55UjRPd3BROGwxRWli?=
 =?utf-8?B?OFhHb3FQd2lEcklzdElCMFJGMjU0LzRoUUd1b0pjWjd0YnpJRnNHSnpZS0JX?=
 =?utf-8?B?TVJGYTdzNWQ2UVFiSS85anVCY0RoWUhiQ3YwNjVJWURUc1JwYnBZQT09?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 84358331-82b5-4597-7160-08da4eb5f92f
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jun 2022 10:01:10.4435
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: g4P7zOOwqCIvgX1gTsfazMvrYCwRbKwyxGJW6s+wxnbRfPfHNRk0lwHDEO+UXL6h/tOXBmDzYdemWpqQwXFseQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB8981

Many are needed by the hypervisor only - have one file for this purpose.
Some are also needed by the harness (but not the fuzzer) - have another
file for these.

Code moved gets slightly adjusted in a few places, e.g. replacing
"state" by "s" (like was done for other that has been split off).

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
v2: Re-base.

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
@@ -26,129 +25,6 @@
 
 #include "x86_emulate/x86_emulate.c"
 
-int cf_check x86emul_read_xcr(
-    unsigned int reg, uint64_t *val, struct x86_emulate_ctxt *ctxt)
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
-int cf_check x86emul_write_xcr(
-    unsigned int reg, uint64_t val, struct x86_emulate_ctxt *ctxt)
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
-int cf_check x86emul_read_dr(
-    unsigned int reg, unsigned long *val, struct x86_emulate_ctxt *ctxt)
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
-int cf_check x86emul_write_dr(
-    unsigned int reg, unsigned long val, struct x86_emulate_ctxt *ctxt)
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
-int cf_check x86emul_cpuid(
-    uint32_t leaf, uint32_t subleaf, struct cpuid_leaf *res,
-    struct x86_emulate_ctxt *ctxt)
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
@@ -331,6 +331,13 @@ struct x86_emulate_state {
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
+bool cf_check x86_insn_is_mem_access(const struct x86_emulate_state *s,
+                                     const struct x86_emulate_ctxt *ctxt)
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
+bool cf_check x86_insn_is_mem_write(const struct x86_emulate_state *s,
+                                    const struct x86_emulate_ctxt *ctxt)
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
@@ -0,0 +1,250 @@
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
+bool cf_check x86_insn_is_portio(const struct x86_emulate_state *s,
+                                 const struct x86_emulate_ctxt *ctxt)
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
+bool cf_check x86_insn_is_cr_access(const struct x86_emulate_state *s,
+                                    const struct x86_emulate_ctxt *ctxt)
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
+int cf_check x86emul_read_xcr(unsigned int reg, uint64_t *val,
+                              struct x86_emulate_ctxt *ctxt)
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
+int cf_check x86emul_write_xcr(unsigned int reg, uint64_t val,
+                               struct x86_emulate_ctxt *ctxt)
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
+int cf_check x86emul_read_dr(unsigned int reg, unsigned long *val,
+                             struct x86_emulate_ctxt *ctxt)
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
+int cf_check x86emul_write_dr(unsigned int reg, unsigned long val,
+                              struct x86_emulate_ctxt *ctxt)
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
+int cf_check x86emul_cpuid(uint32_t leaf, uint32_t subleaf,
+                           struct cpuid_leaf *res,
+                           struct x86_emulate_ctxt *ctxt)
+{
+    guest_cpuid(current, leaf, subleaf, res);
+
+    return X86EMUL_OKAY;
+}
--- a/xen/arch/x86/x86_emulate/x86_emulate.c
+++ b/xen/arch/x86/x86_emulate/x86_emulate.c
@@ -8435,393 +8435,3 @@ int x86_emulate_wrapper(
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
-bool cf_check
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
-bool cf_check
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
-bool cf_check
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
-bool cf_check
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


