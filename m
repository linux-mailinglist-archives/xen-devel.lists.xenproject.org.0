Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BA5D65246A
	for <lists+xen-devel@lfdr.de>; Tue, 20 Dec 2022 17:13:38 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.467187.726211 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p7fEt-0007k5-9i; Tue, 20 Dec 2022 16:13:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 467187.726211; Tue, 20 Dec 2022 16:13:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p7fEt-0007hB-6x; Tue, 20 Dec 2022 16:13:11 +0000
Received: by outflank-mailman (input) for mailman id 467187;
 Tue, 20 Dec 2022 16:13:09 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=I7dU=4S=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1p7fEr-0007h5-OH
 for xen-devel@lists.xenproject.org; Tue, 20 Dec 2022 16:13:09 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on2065.outbound.protection.outlook.com [40.107.21.65])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3149952d-8081-11ed-91b6-6bf2151ebd3b;
 Tue, 20 Dec 2022 17:13:08 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DU2PR04MB8853.eurprd04.prod.outlook.com (2603:10a6:10:2e0::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5924.16; Tue, 20 Dec
 2022 16:13:06 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::4da2:ea8b:e71e:b8d8]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::4da2:ea8b:e71e:b8d8%4]) with mapi id 15.20.5924.016; Tue, 20 Dec 2022
 16:13:06 +0000
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
X-Inumbo-ID: 3149952d-8081-11ed-91b6-6bf2151ebd3b
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ac6gvO56dVczBUP8yUSPCUd/3CTUpkwu1AfErkqN1NRN7eKn8z/fe2d+dZyqzMTkOVDJj0Rr7pW9LhoyCYYDuZ+f+1WG2oMbYEZMBInBcyDTBvltzi4tb3P+0mElKMFBDVi1FdwTk7OFa0gS3cjSsJDGQtYxrEBnh6z1I4NkoXqvbJWNlr6g9y21L7eO1xkdeOq0AzvH8aS7ttdG/phi4iYQkFKzHZdZ2qkf1XCj0qHcKwP25V9YVlprO/KlC8AkFm6Q7uNrmhvbqGOIp6CBKX9GIjM97uxEQVJJpLswWgZd1SkLCANvwoHk+r3PZaTP2KWxBYc861RHX+SFuVfMXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=H2i5E9tOi8XSxmU9nTTjr33Mj2BDqfSuTEWfHh/LLJE=;
 b=E7kk7f/nUquy3KFFZVj9fyoQTUNb+B3vD+S8Tusc2GbhhSsc5tgQ0ZMWikwW1/Z4Zm7uEiIA2AcS+d/Kg8HTk+TLdjRDCSblywDu9jbB/z0BiUV9zmTws4RnPlQMi5/2LtgnMVVHPkue0gk7X31qDDpP4lWVFoBOIgRW8JOe4s4WvnczwAq7ftMuh9PdkHOLUaGtndz8Wvx/ShJmBaQ0GcK+H6k2Q60+7+ziJVJg6fyiHsnZ1YQQoc9EVGUMMjsweZack1F27sUF4154DgogrBIHKsgCQKlXrNanhtDZO4hZZymHV1d77WLVg1LL++Qc6r2/i6fGglaE9+ZhElzOlg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=H2i5E9tOi8XSxmU9nTTjr33Mj2BDqfSuTEWfHh/LLJE=;
 b=dIfvD+befnsV0vWGp3gIuX/HDCe/1qBU0gOAnQAo9YRzV6s6/Gnu9kNvhXyXefVwRzlaqaYCpMds1dAvaLes+AnHemD+rE+RFv4r8pykHN50Cj8sSDPoppNAoGhAjoU3NPcYS2TMquzrZMLMJ5GNdyCqNhIXNQVI12w/H4XVKjmRXDNxEYZjtpTIiPUmkk9xNYDsLg7RasNmJ8gt73mWaSAia4D65lmHoNwqM0xaLWM32EPwp3MuM9aViiYoBXmkzXN2V4kJ04ENldUBHXfk7w0y9feBDgKNs9FqA0FoDWgkTfsW+i+Tx6Y5sBrFtPlGYgO3fdXSbFcww1LfXgX5YQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <24461a6b-b118-aad9-6407-d215d07a2924@suse.com>
Date: Tue, 20 Dec 2022 17:13:04 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: [PATCH v5 11/10] hvmloader: use memory type constants
Content-Language: en-US
To: xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, Demi Marie Obenour <demi@invisiblethingslab.com>
References: <cover.1671497984.git.demi@invisiblethingslab.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <cover.1671497984.git.demi@invisiblethingslab.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0091.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a9::11) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|DU2PR04MB8853:EE_
X-MS-Office365-Filtering-Correlation-Id: 50ee373d-2383-4499-ee09-08dae2a513ce
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	M4McA4BIwo/K8zwt1YAuR3hHnKt6BnASkan20foUlSppJiI9bjQFKw2t8JNil4CNgSc8BnopgNXLAyxCWHIJJu526bZL6Aj4uJRx0ydGqYl+13+7IIS/VE2Sce/xACwUyD3XNGRm6ClPy2g0hCQtx+lCmJ4momxmd4/MpoZpd74zKz6WeMuWiI+EkI4MyQautrQ3GJxdGdehnAdA2NHHYEkYAK0AlxroVPMlQC+YiJyqLqIem/LqbQ/bMdREi3hYpgZx0yfhRpYQ5SwOfRz/bxCR+xeQA2oUzBZJ4wknZb7DlHhQA55ZoBkz3Szfq56WMjZIzWg7Mm32XbMGQM506M68aN5ej3+H6Ul2PYyu8XfB7fL9RckYStB2wUnlXnSekMsYDJ86rOu4c2GVLsc6gWd4m3V6RnL+efDnZwwY7RYO8OpDgrGmIDp11U9YWgxgXKTJo+Iio5nal53eGdcfJeMbWSTdlhq/TzRYcx9ckSrCesfKRQjgAERRBGUoMxUTSPn27Ebg5XpFhoqv+bCj218ERaiET0bfQ9+R/3y5IVeea6fbWkmfysQqF2GRzDq1MdGPji85D7xWKGqK7LqoJmaabWVEeyHUkXPRGGVvua5JCO8WBzWCLyuCEz2yb6HF5/KRPxncG2O0Gs97usCmHZTVEhBlNg6XWG2qanN1CxxHLsZkKJckV2CANa9uFR2uzC8G2ErAuFkWSj066HHRR7zuVNtjnbmbZk0Jl3sR2/o=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(366004)(136003)(346002)(39860400002)(396003)(376002)(451199015)(6506007)(31686004)(2616005)(6512007)(26005)(186003)(86362001)(31696002)(38100700002)(41300700001)(2906002)(36756003)(66476007)(66556008)(316002)(5660300002)(6916009)(66946007)(6486002)(8936002)(8676002)(478600001)(54906003)(4326008)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MVhXczBjSHcrZXJjb2ZTKzNZU2lCYzkxZTZ1bzNFNU9FRWVoSnIvb1l2OFU0?=
 =?utf-8?B?MmhKcGR4SmVIUnhxSFluOThUdFdxcnZYY1JaTWYyMGFXM3JwMWMwN1A5R1dZ?=
 =?utf-8?B?RTYzZ0s5WmQ4UVFoUVJOZE0wVmczVmpHYkVrQmZ5SDNtN3RteGpUV052eVdk?=
 =?utf-8?B?dVBkTVppSnUrM3FyYUdZYlE4MlM0a2ZCZjRPVTlneHlKaElIeFY2cEFGYmJm?=
 =?utf-8?B?VTdDOVVreEtmQXhCMG52dGpZS3A2L2h6cjJtVzF3d2swUmZ4dWIvYkhVU25x?=
 =?utf-8?B?M0VjUDN2Umh4V1VNbzJNYnVBY1VEbklkUkVzOThRVVhORm85Vm1ONXdpRWZI?=
 =?utf-8?B?VFJOYkM5NGNyRHJTaExRZDl2ai90cEcrSzdkQUpxUldBcVhEOFdoeFkyWlhw?=
 =?utf-8?B?N3hobWVOZCs5WEJKZ1dDUnNzSWtoL3BQRlRCanIzcHFCNWM2OUw0b2tla2VC?=
 =?utf-8?B?SDRmdmlzZXExVGphL01oMDNyaFBJTU94RFRjS1NJRzlCMndCY0p6aWc1QmEr?=
 =?utf-8?B?T05kUk4vMmVBU0RQRTFvb3hIc2FkY09sajRRQUhLTTNEU2RHYXBOWDAweWdY?=
 =?utf-8?B?dE9LNHdnV3ZsbXEzajBVQlRTaFp4ODZYeXNTUWdYQllTSVYzZlNjYVVOV3hr?=
 =?utf-8?B?eVh4K1hwRW1vcllpaU1GMzl1UFdKcnVIbGE1N3o5TUhsNnJRZmpEOXdweWsv?=
 =?utf-8?B?YS9ORklhTGVRNVNqWmtOQ1hXVVBoNFFVMHl3RzhlZENLM2dmbmR2VnlSOFVx?=
 =?utf-8?B?d2diYkFiTUQ4bGROR2pERGkzSFZjUGt5ZTBDMlFHU3pFZzVsMnBRWDR2NW0x?=
 =?utf-8?B?WHJQWTlRRWRpV1A4NGh1MGxjOFJQRzVEOTJGdzJzM0FsZytOY0tNaTYxMFZj?=
 =?utf-8?B?Q29ocmVzRHhsZkVXUFFIaWlWSVN0QTlacFhHVHYxME4xdjkrQ1puaHc3MGpH?=
 =?utf-8?B?cjV1YmlTb2xrL3RTYUp6ZTF2bnhickJsVjBhT00vUXFoMGYvdWZEbE00TVZU?=
 =?utf-8?B?ME5sTEhvM2FKSnl4TFcvOUZZREhza1Q3QncwckluU3N5VUtNNy9sTUprdm9j?=
 =?utf-8?B?R1RBVm5PK21SMkZ0SkEzT1lpRzlDOVZnSFp2Y0JBOC9uTVduR2Fqa2dBdXI3?=
 =?utf-8?B?R0ZhekJUb25HMTlrbmdwQ3NaTWtqTEJoZ25ZbDdxdzdLTzExUHBuWlhaakww?=
 =?utf-8?B?L0I0YjlOMzloZldPRCttei9iNlNIanJWNzJZWVhka3Nyb09iOUlkcFB4N29M?=
 =?utf-8?B?cnZBRlVQMW81RU50OTcwTGlFclMzdEttSXo0U3U4aHllQVBoL0FOMk9Ja05x?=
 =?utf-8?B?a2pZaC90S2Q4d0l1WHhMU3FsRG1BRVloZ3M3cTBPSWFJaEdkRU5DRksvalRz?=
 =?utf-8?B?OHJiYXd1cG15TXJ0Q0RRcmpPVFhVUTNwTElCdE9ENTdtRjU5K0sxUUdBdGNZ?=
 =?utf-8?B?cXJQeXczdUZab0RhKy9PUnRIMVZicFdxMEZKRVFROHowOEkwbnhCa0QyalFO?=
 =?utf-8?B?SDZhM00zMkJPSkNPMXBRY2xYNDBLa0NtYUlIclFROXRIUlk5ZmlSK1VZdlBn?=
 =?utf-8?B?OWVkQ3VveUdlN3hOdnAzblkrdjNvc0pCTEh5TXY2N0JvdzZaYU5sWXNaRHVC?=
 =?utf-8?B?YStYTnpERFdPOE1Pam1iNFJSS21sUDB1RDlzaVJKY2t5clNnM21ZUmhqbHc2?=
 =?utf-8?B?L1lzMDhQQUZUcU1hV1N5WndmZHhaWHdJTWJsTkRMQVBUWnZLR3dObFErSlhs?=
 =?utf-8?B?WGtxZXhGMlMvL3U1TjNYTHVud0ZDZjVSbkV4Y25IZ3ViSDdtZ0dzOHVPRUxI?=
 =?utf-8?B?YkdDVFFGNGpURW5adVViRkZQb0hxM2dSeWVtalVCZ3VyWlpaa2ZndmZjL1g5?=
 =?utf-8?B?V1JkZkVpblhkRUY1cnRURUpBQWZJVVMwV2lGa0JxcnZnSmxxdWIyb1FRcXY4?=
 =?utf-8?B?OTlwRTdUUUM0WGlaOHVHbmhPMDRYUHhsODhCNkFrNW55OFAxd2pMNUtwazJW?=
 =?utf-8?B?bjMzV3I0SkhCWDZvVnNnUmtNLzdzd3Z3aGVUdXdhaGFiTmlYZ29od09UODBY?=
 =?utf-8?B?ZlhjQ2hza0ovem9UYUNZOElJdUhjNVNFQXRQdmhNUTl4Q0w1a0V2U0dseHJX?=
 =?utf-8?Q?Fqe/jrXN6fji1miMGl/U4Wyz5?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 50ee373d-2383-4499-ee09-08dae2a513ce
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Dec 2022 16:13:06.1780
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /dImKuBNG/VBKbWuTaV7rQvRAb71ta5V/Cs2JlGYPhb1U6NTkMALH0FyCk+Uh8oaXVO8oh2iv+0cKYkWvLisOQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB8853

Now that we have them available in a header which is okay to use from
hvmloader sources, do away with respective literal numbers and silent
assumptions.

Signed-off-by: Jan Beulich <jbeulich@suse.com>

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
@@ -71,23 +73,32 @@ void cacheattr_init(void)
 
     addr_mask = ((1ull << phys_bits) - 1) & ~((1ull << 12) - 1);
     mtrr_cap = rdmsr(MSR_MTRRcap);
-    mtrr_def = (1u << 11) | 6; /* E, default type WB */
+    mtrr_def = (1u << 11) | X86_MT_WB; /* E, default type WB */
 
     /* Fixed-range MTRRs supported? */
     if ( mtrr_cap & (1u << 8) )
     {
+#define BCST2(mt) ((mt) | ((mt) << 8))
+#define BCST4(mt) (BCST2(mt) | (BCST2(mt) << 16))
+#define BCST8(mt) (BCST4(mt) | ((uint64_t)BCST4(mt) << 32))
         /* 0x00000-0x9ffff: Write Back (WB) */
-        content = 0x0606060606060606ull;
+        content = BCST8(X86_MT_WB);
         wrmsr(MSR_MTRRfix64K_00000, content);
         wrmsr(MSR_MTRRfix16K_80000, content);
+
         /* 0xa0000-0xbffff: Write Combining (WC) */
         if ( mtrr_cap & (1u << 10) ) /* WC supported? */
-            content = 0x0101010101010101ull;
+            content = BCST8(X86_MT_WC);
         wrmsr(MSR_MTRRfix16K_A0000, content);
+
         /* 0xc0000-0xfffff: Write Back (WB) */
-        content = 0x0606060606060606ull;
+        content = BCST8(X86_MT_WB);
         for ( i = 0; i < 8; i++ )
             wrmsr(MSR_MTRRfix4K_C0000 + i, content);
+#undef BCST8
+#undef BCST4
+#undef BCST2
+
         mtrr_def |= 1u << 10; /* FE */
         printf("fixed MTRRs ... ");
     }
@@ -106,7 +117,7 @@ void cacheattr_init(void)
             while ( ((base + size) < base) || ((base + size) > pci_mem_end) )
                 size >>= 1;
 
-            wrmsr(MSR_MTRRphysBase(i), base);
+            wrmsr(MSR_MTRRphysBase(i), base | X86_MT_UC);
             wrmsr(MSR_MTRRphysMask(i), (~(size - 1) & addr_mask) | (1u << 11));
 
             base += size;
@@ -121,7 +132,7 @@ void cacheattr_init(void)
             while ( (base + size < base) || (base + size > pci_hi_mem_end) )
                 size >>= 1;
 
-            wrmsr(MSR_MTRRphysBase(i), base);
+            wrmsr(MSR_MTRRphysBase(i), base | X86_MT_UC);
             wrmsr(MSR_MTRRphysMask(i), (~(size - 1) & addr_mask) | (1u << 11));
 
             base += size;


