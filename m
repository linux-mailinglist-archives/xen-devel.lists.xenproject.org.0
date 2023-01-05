Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 66C2365E8AE
	for <lists+xen-devel@lfdr.de>; Thu,  5 Jan 2023 11:12:59 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.471785.731779 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pDNEL-0000vk-NF; Thu, 05 Jan 2023 10:12:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 471785.731779; Thu, 05 Jan 2023 10:12:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pDNEL-0000sS-KU; Thu, 05 Jan 2023 10:12:13 +0000
Received: by outflank-mailman (input) for mailman id 471785;
 Thu, 05 Jan 2023 10:12:12 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=lIpW=5C=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pDNEK-0000sM-5k
 for xen-devel@lists.xenproject.org; Thu, 05 Jan 2023 10:12:12 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04on2059.outbound.protection.outlook.com [40.107.8.59])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6a31f8f5-8ce1-11ed-b8d0-410ff93cb8f0;
 Thu, 05 Jan 2023 11:12:10 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AS8PR04MB8359.eurprd04.prod.outlook.com (2603:10a6:20b:3b3::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5944.19; Thu, 5 Jan
 2023 10:12:07 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2991:58a4:e308:4389]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2991:58a4:e308:4389%7]) with mapi id 15.20.5944.019; Thu, 5 Jan 2023
 10:12:07 +0000
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
X-Inumbo-ID: 6a31f8f5-8ce1-11ed-b8d0-410ff93cb8f0
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZVLcHCyk2/JLnkCZGKicwOdU4frcid+8BrB5gWY7rJ1LPM5XcWK6Q7leASIKtRc22iSWjUL1iHL1jtGkk7d6+sxmxaFay5PHP+TN8R/W5vtzsmQ5VzeSv94jlr2N4qXNqAz5sh38V10HZwBTK2OG4NX/3n7JCVYxrkLVCWFjbwBl0uJKAqeGdzTujndXTB2GjIiOwCYf/Xl9Hw0CPF3CjuMFlJC4J1wwglSi1RzWQvfC8aEWbJad01I/Kr1EvkHOiMtKj3LSINHdHtr2fS35V+hc//kxBoS44Y9/uP9ovt6qnrkxi/YbZ07tNQ6e4do+Nghm1Z081BffOITlydYRUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1RJywEcRfnPvZxYe9Fm8SQ3wBZj+5X3Tbq3pifAWXgM=;
 b=QQ/6VforayYyTv8IJdLgKHVa2KiJ8zKZ5jeYzuB3kltOJKWwYDJIiVv6WNmE4f1HPvvWRRr/67m7q2GDBvDiSx2b0ZtztqAHOOYccVvK3ZVEEZDS1Z3VdXqpvR4KCfl6RZ6uj+9w/RyUblsdO/TLQauPEATJuznt0znvbOS4pGzi4CodCt327J2I1lamsP13xDcO9QypGR9na+0o9FUCBy//PUgM2Kc3igp6rAAscdCzaxG6PhRQSbIw7MqZGQ5YmTybYWebXixl+ufmiPvjnrT/DrOdL0DKtRsJrH8qprjcyEZhRWcXQkZlg63+8IXXdRtRJgKLmIWrGXvThLPKEw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1RJywEcRfnPvZxYe9Fm8SQ3wBZj+5X3Tbq3pifAWXgM=;
 b=277lANii0BjzasAhf3UwxAut5Z5PpkkyQxpVz4d6XM/GOj2W9FZm5anliZxYvF3eqC7LXOFDiDHr/CqjBIg2x+7yb1Ks6vXYdvWlU0UoTlIg9Lzi2L8Ym/SdXKtDQqAIUd/nnM2xH0yAZg0s1S+WEL1unDUAuGD7135pHjU1XnqPi+nHLGHJhPnGTdI5j2LuoWb+cEwN87fVJBG3GkoQ7pO88HQPMsUmcEUMAKeAyw9ZX0sPX5XtP+lrRQmeNpnXvHlzYCMbLLF1QFUf63GRTr8A5DbzFR7WYsTNhhayVwqZnTyWUX7PPoVxl3SRPWIZdQRp5rFjt8YWBH1OPnBmxw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <15dd4897-d87b-9a0d-fc99-551a1b4be04d@suse.com>
Date: Thu, 5 Jan 2023 11:12:06 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Content-Language: en-US
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH v2] hvmloader: use memory type constants
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0031.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1c::9) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AS8PR04MB8359:EE_
X-MS-Office365-Filtering-Correlation-Id: 2ddca258-141c-4210-c54c-08daef054d46
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	VIUCT+qyONgTkqH1UG8F1KO1P5AcgGQpMBOkQnuyCcpG2/2GERw67BsAZkAC6qDNi7LM8K4b5bSZSQiAlfxNnWRXq4kOBkj8jwxw/n0rLKT62uOmJ2T8OHiN35+U1h9Q+xaI2Is4MabKvHhwlbzjw0AMrYgTjMKmeDGqsmvCxk2pYLDrzWJQ1e60roW/kVNIjEDVs6ic+exwY9jvFWUNNDJ4KGsRwyjMuwJCRgBATpcz3aArX13Qk1gy1m1Raud4YFZJMbJeildIm2ivu+x3sf3OxZ7d99qos3Lpc2d6BePkNp3Dlg5FkLzZbiyPjZkWKGnTBC1MooJUDxRDmLNXfeYGN6azmN0EEtS6yenGCFxDYdkM1xguP1elPLFvfZeshj9OUArlTniOKE7ahVinxintzOgh0Z4VUkN04B5yMLG0I0MwTi1hA3aM+Tb3Na7uEjLr9vGbfVAHq5Q6bL+oMGNJogKvDh3x/ODnMVjU3JWwLEdwQXXWPht2CSY8uacNe9iuRGfBzpHhEPV4Wr3I5VxG5IL/rjhd/3zVedhMC4BnYX4wAYB6rYiOSEIuX602NYsgRtBNzRpOZmMHsw46vkigybs2zJTVTCZ7oNs+NrugklJd9ac0TX5L5XD3Tfuza7rhLs325OK3qB/Bv4babq0Yzr1CimKh9UklE3NXocgTZUnlD6j2gSYWKWH2MdCq3W796q+DC9XOyXohDcszJU7onSuDZIj7m7YfcVWFfUY=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(136003)(346002)(376002)(39860400002)(396003)(366004)(451199015)(38100700002)(31696002)(316002)(54906003)(66946007)(6486002)(2906002)(66476007)(66556008)(5660300002)(8676002)(4326008)(6916009)(41300700001)(8936002)(2616005)(478600001)(186003)(6512007)(6506007)(26005)(86362001)(31686004)(36756003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cEp3dm40K0JuaGI0UHFrWUFqNGNQY05leFZKQ3U3TFRaL1hkMS91bllxUEY5?=
 =?utf-8?B?MExiOWdaTklTVDJDRkJ4TElvOVB2c1VhOG8rNDRyNVhjdURvVE80d3JoMlN6?=
 =?utf-8?B?MlBYdXNHRWJyOXlNMlE0ZEJjMC9rcXQxWUhmVG00dXhRR0NoM1FKSEdLUXBM?=
 =?utf-8?B?SUQ2cHIzbzBhMzJ6TlVWTFRRa3V6Z1p6UkpZU3JoQlJkN2NIaWdGQnlCZ0pE?=
 =?utf-8?B?MC9RSlc4N2dDTjBFMTFvSjVDMkNEd2R6OVlVQ0p6OEJ5Zk9BcjVUUkVUVGln?=
 =?utf-8?B?aXRjNThzZDlzZ3lzQ0orRXl6a1ptR2ZSdnVJaFErcU9ESVdSNWl1OFpHZzNT?=
 =?utf-8?B?TXAzSGs1UmtWRHhRcjRrbm1SRWM3T2NBTXFjZUV0cE9WU3NEUGhVekkzUHBS?=
 =?utf-8?B?ZnJyTEt3ekFMZlVVWVlyT1VscUV1QzBGd3hqc05JSlBWQTUwZmpuZC9OZHh3?=
 =?utf-8?B?eDlZZkFLbTU5RGx1eFJSRkltNVpFdDRaQmhRK1pMKzFyaVl3RWwwN3VIZ3JE?=
 =?utf-8?B?Uk01NjlNWFF3REltR1hWREVEem1aLzkxQlVpSjY0R3k5ZldJZVFoU1JzUkh1?=
 =?utf-8?B?bWZac0tQcjBxVFZhd2ZIbit6cVVPTlB4ek95RXp0S05VeGhRNTdvZktWZk5G?=
 =?utf-8?B?TFR3L1RQNmhCaTEvOElpZ25mWWtnVzRZSGlyWFFzbkJYUmxGZnMrVXdld1Rw?=
 =?utf-8?B?djIrQWs1VTVPTnZVRGc3cHlZb1d5S3B3KzByZENRdWFrZzk1SkxzZ0xuR1o5?=
 =?utf-8?B?Tjdjd1pUZ1hBNzcrUktRVmJIMU8xTTYvWDNJWmlXK2VxbkJNVlhtTEl5QUl3?=
 =?utf-8?B?SllDNUk2d3dyR2FyTElKYlQ0Zy9pd0ExMkxkRllDd3JZTFJETnR4dk84cHJv?=
 =?utf-8?B?NWZGdFJaSVh2SmZYVStZdlJ1Y296NmRISitESFd3U3RTZVlwQnk1K1pEdnlX?=
 =?utf-8?B?UW55WnVzUzIyb1UwNUJDcWUyNndWSkZCZFpCRnpKUW1rK0ZnVGZ1OHovNXJs?=
 =?utf-8?B?eTAzcVZWRnFHRGVpa0pLZU5sb25OQkpyMlBHZ01qTUIvZWoyMWM3cThsOE9Q?=
 =?utf-8?B?dFEvMUJsZXhWN01EaDY5cU8rVnBScXNmY2QwUVRhSXhJTVJsa3R0amdZNWNn?=
 =?utf-8?B?Y2hhS2pDL09wZjhjdkRVNm5NL0xkangrdmlwUFZ2bXg4WWREWUJUQWNud3JQ?=
 =?utf-8?B?TE5xK0JHWTRjdUJZQXEwQ245bDZnSHdvaWFXeVBRb0JmRnhLdDUzdjdTNUhi?=
 =?utf-8?B?OUdUUW9TTkh5WkVHQ2x1c21jODJFS3luM25KNlYrMzZpdjNVRFV4MUlsM1Zj?=
 =?utf-8?B?UERwcnJ4TGMvZnpMVWFpNExCZnZFM2dpa0lLUnBMRit1azRDei92L0hmTUdI?=
 =?utf-8?B?ZVlYaVE2bENrMXZXYnQzRDFDbmszbkE3dGo2SnV1djAzbktHSGhHUFhHeU0r?=
 =?utf-8?B?cXJLeERnSFkwRVI1dUFFQUk4VWt3WDZOUzcvc1JuRTFKUXZnRmcwaGpNbXFO?=
 =?utf-8?B?c2xWdWppRE5IeW5DWkhBS3RseG5TUDhpSml4WUdTWDRJRkRZTXJUWnNUc1BE?=
 =?utf-8?B?U1VyVTFIc0FKSGRjQlNQZ1ZtczFkaFlzSWs0aXFoM2JPcXdNOElOYnczR3Bv?=
 =?utf-8?B?QXJkakxHSzRoK3dBb3lJbHA5UVJsUGc0TWZEKzNBMG9PRFh4MXl6eDQ1Qkxp?=
 =?utf-8?B?ZHljc0hZNy9lZjBvMHRvVkNiYzA2bzErcjFnSGZaeUZ2aHNwYitoaEZ2SjBX?=
 =?utf-8?B?MUtnRFNHZ1dmY1oxeXBLbCtKME10VTVnZ1N0TUZ5N05WdlRqQTFVMEk2NDNS?=
 =?utf-8?B?bkU0Ry8zakdzQ0pRMS9hTDNUSGc5dDBncU1aZ0Z5ZkJldDJuQ0xRMllxLzVX?=
 =?utf-8?B?ek1qb0lHM3BMMmRwMER1UGlvTTkwRDVIMVpXUldWOVd1VUZ2ZEhYN05iUnJB?=
 =?utf-8?B?ZVlLTWtxMEFGcTJiUDVsOVdvTmNXMDhVRmFaODA2U1ZTR0xLZGJ5K2hhU29k?=
 =?utf-8?B?MDB3M1o5RFFhK1BZeDNjNjlXNEpUS0VuMTVpMGphb2tTRGRRZjlnQjdDZVZr?=
 =?utf-8?B?RmFsTUF0UDdGVnJ6MHlsR01Yekwyd1BNbXFGQ2xkNGpSOGEvS2RhaDVFVjR3?=
 =?utf-8?Q?YrJ8YMlic8RXz4pSvMwqsYLOI?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2ddca258-141c-4210-c54c-08daef054d46
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jan 2023 10:12:07.8111
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6swL7whTXVbPMkhnwUbrgVPJ7C59HAo6O6DCuQBXYNFKyeQQ9OTDHVwE/62gEx/XZWd56PTQMiE6taXmq4FLFA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8359

Now that we have them available in a header which is okay to use from
hvmloader sources, do away with respective literal numbers and silent
assumptions.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
v2: Use simpler BCST() macro.

--- a/tools/firmware/hvmloader/cacheattr.c
+++ b/tools/firmware/hvmloader/cacheattr.c
@@ -22,6 +22,8 @@
 #include "util.h"
 #include "config.h"
 
+#include <xen/asm/x86-defns.h>
+
 #define MSR_MTRRphysBase(reg) (0x200 + 2 * (reg))
 #define MSR_MTRRphysMask(reg) (0x200 + 2 * (reg) + 1)
 #define MSR_MTRRcap          0x00fe
@@ -71,23 +73,28 @@ void cacheattr_init(void)
 
     addr_mask = ((1ull << phys_bits) - 1) & ~((1ull << 12) - 1);
     mtrr_cap = rdmsr(MSR_MTRRcap);
-    mtrr_def = (1u << 11) | 6; /* E, default type WB */
+    mtrr_def = (1u << 11) | X86_MT_WB; /* E, default type WB */
 
     /* Fixed-range MTRRs supported? */
     if ( mtrr_cap & (1u << 8) )
     {
+#define BCST(mt) ((mt) * 0x0101010101010101ULL)
         /* 0x00000-0x9ffff: Write Back (WB) */
-        content = 0x0606060606060606ull;
+        content = BCST(X86_MT_WB);
         wrmsr(MSR_MTRRfix64K_00000, content);
         wrmsr(MSR_MTRRfix16K_80000, content);
+
         /* 0xa0000-0xbffff: Write Combining (WC) */
         if ( mtrr_cap & (1u << 10) ) /* WC supported? */
-            content = 0x0101010101010101ull;
+            content = BCST(X86_MT_WC);
         wrmsr(MSR_MTRRfix16K_A0000, content);
+
         /* 0xc0000-0xfffff: Write Back (WB) */
-        content = 0x0606060606060606ull;
+        content = BCST(X86_MT_WB);
         for ( i = 0; i < 8; i++ )
             wrmsr(MSR_MTRRfix4K_C0000 + i, content);
+#undef BCST
+
         mtrr_def |= 1u << 10; /* FE */
         printf("fixed MTRRs ... ");
     }
@@ -106,7 +113,7 @@ void cacheattr_init(void)
             while ( ((base + size) < base) || ((base + size) > pci_mem_end) )
                 size >>= 1;
 
-            wrmsr(MSR_MTRRphysBase(i), base);
+            wrmsr(MSR_MTRRphysBase(i), base | X86_MT_UC);
             wrmsr(MSR_MTRRphysMask(i), (~(size - 1) & addr_mask) | (1u << 11));
 
             base += size;
@@ -121,7 +128,7 @@ void cacheattr_init(void)
             while ( (base + size < base) || (base + size > pci_hi_mem_end) )
                 size >>= 1;
 
-            wrmsr(MSR_MTRRphysBase(i), base);
+            wrmsr(MSR_MTRRphysBase(i), base | X86_MT_UC);
             wrmsr(MSR_MTRRphysMask(i), (~(size - 1) & addr_mask) | (1u << 11));
 
             base += size;

