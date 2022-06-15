Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E23254C617
	for <lists+xen-devel@lfdr.de>; Wed, 15 Jun 2022 12:29:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.349934.576145 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o1QGj-0005VR-LR; Wed, 15 Jun 2022 10:29:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 349934.576145; Wed, 15 Jun 2022 10:29:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o1QGj-0005TZ-Hk; Wed, 15 Jun 2022 10:29:01 +0000
Received: by outflank-mailman (input) for mailman id 349934;
 Wed, 15 Jun 2022 10:29:00 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=56zs=WW=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1o1QGi-0004ln-Bx
 for xen-devel@lists.xenproject.org; Wed, 15 Jun 2022 10:29:00 +0000
Received: from EUR03-DBA-obe.outbound.protection.outlook.com
 (mail-dbaeur03on20618.outbound.protection.outlook.com
 [2a01:111:f400:fe1a::618])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f776995e-ec95-11ec-ab14-113154c10af9;
 Wed, 15 Jun 2022 12:28:59 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM8PR04MB7332.eurprd04.prod.outlook.com (2603:10a6:20b:1db::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5353.13; Wed, 15 Jun
 2022 10:28:58 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::dfa:a64a:432f:e26b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::dfa:a64a:432f:e26b%7]) with mapi id 15.20.5332.020; Wed, 15 Jun 2022
 10:28:58 +0000
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
X-Inumbo-ID: f776995e-ec95-11ec-ab14-113154c10af9
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cilm6SpKw+V1vWrnEBhQz6mhCaXO0SaD+3VbOnWKWdCyN8lhufF4xgbumm9rqoKZ69eJKDUvabBc3AvD8BSi0HUJ98d/P/SnOg10i80Hg6DbHn7HUBPjJrV7UoXdKPN2k343p55+dTU+UEkruIWDynSMPRypLrvoqo1I4Rj8F4nxeDgJznlBtpa6+SbNKieJA3tedfIqirQZo/hntpq3YGugsX1cSthkAeaLjY8pFKcNK/0kxKAkwtVJCELWW+iAcPi/GNUtKlDEBoRUw9oQM+zmnok/NA8hD/wJsyGMQDHs65ZmMl++ZLeiOecYOxjeXaPrlInOgPjiQ562dUn7Qw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=R20kHAGmuLO0WXnq8u+WocwexxXx/2Ax+f3XUYxWKgM=;
 b=VRonKpARPWipDQLk+nM2yoZzadflbbGdiRxfIF5c2yR0Pe/LE5spWU/0a0VTj7XKmUCVtdzAJ7vxetkacSd92qpCwbkJ1qr16Hr/ylgtAVxvQ8HL4KEKBXHOsJJws2g1BX2EFMCVE0iH/fibPXPKi+BUub2Bk3RUxdc3Zj5qpHWySToNEOLNdSqhsXI8GBr99k0X2gMQl2G1yS5AX5FgGb2u87kJmZk5y9XTNy9Jfe8BIxOIlyFccvaRfRc9OhuB/jVqQ6niYYd5RUCSXg2nentbIlmuCL4k0XnGaqNvvkVwHnKvUucIFJpyW/rwkXmZIe1XvrTB6g5JWQrYfftLRQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=R20kHAGmuLO0WXnq8u+WocwexxXx/2Ax+f3XUYxWKgM=;
 b=Usoy1z2ioww0JQtUIFS0x7+jS+PIalFLfFDJK69QT+wfC/HGtBsd+n3Kkk1Ue16eVrexLIRLEknlBAvBgvrRP7PJjNc6qE5uRglBruklVz35xihw9gldBhPP3AFthAr1xJJ8DUTYkG49doDQcRkpdwHCcLVIcoWZOkYcCiATApAzMvQ7xpwxZJm0F18lhDtNEiw7zHpZqlxEiHxeaq+xAXB0mK1opk9CE3mwWQGHE0tG2S7OUt6PRBfu0ZwRpZOqdNXsp9Feam2k4EMPrvbpwrB7qN5PBt6tzxJI17kVAA0udk6rWYlNxJJnm+zd20r0rrAuV/NE7Mv324e3NZLNHA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <36fadb47-32a2-b06e-4cd3-218635ef8aeb@suse.com>
Date: Wed, 15 Jun 2022 12:28:56 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: [PATCH 05/11] x86emul: handle AVX512-FP16 fma-like insns
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <9ba3aaa7-56ce-b051-f1c4-874276e493e1@suse.com>
In-Reply-To: <9ba3aaa7-56ce-b051-f1c4-874276e493e1@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM5PR0202CA0020.eurprd02.prod.outlook.com
 (2603:10a6:203:69::30) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8fbcaa9b-8b4b-4696-6e94-08da4eb9db1f
X-MS-TrafficTypeDiagnostic: AM8PR04MB7332:EE_
X-Microsoft-Antispam-PRVS:
	<AM8PR04MB7332F11BE58FAD989B3CA7AFB3AD9@AM8PR04MB7332.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	bFlNVYf4IPuHSJQ9GGfvlLkSBbv+sTAZGcBTslaLZo/i1sy4f94g9UckZx/CKW6V6QtRwkqPK7th3HfUAuH2p8G60FinzVU5jdJtEAK2PDSPinDishSB53jMDTpsllzUSkyL16E/bGSgwpyvoRh06Vkut15X8WY2LT/joLQcR5hgM0ihf9qI5ik+2K6C1PoalFVLJ6OMESze4ThgC+0Vtg5dEjGyF4jNcS98OJgN0aoGit/N1S7+/cGrBzAY4QVvpWM5RZLldUKuXjJMCc5gETznQ65axoDNFDgr7aSZEFFsOUhfODGCYU79aExlMze+3NmYEQwN7Uebc9ga015u9d9zwBThBFDgCn8cDgsG48DctorPZiyxGpwYMtmGVXxA8TjoR2EFaDLO1Vv/HOheATAsRaCXmWJu8kems6i+7xWbJZ6D5kuY7Y7QwpCycGGHkRBDSFhcQUEVZbzhL9LYd14e/9EFh9Jv0GMqHOR3xbEDDezZ+ODNXl7XkWTASoqzKuK+eJsqtL+fJXY6XM7HY2HJf2R9jDbz7VpMXxX35x5z7Sx+BR1Eq3cw1bqNrhQfFdwdVps7QSMwF4WB2PAb1EcPW1PNkESpdBdTGwoJKngMQ8tGSOSJu2izjB+EjpNL+0sH9cuDZKK8rI5KWDg5KUOzr93OSbplHYOtsLSzvdiUbEO6jp4qi90XdqESwsGGMkWkTBRKlouuDMendCZmcZreOul8qV7chukh54rh7bsCjDAnC9m6BScngiC+cfrN
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(366004)(31686004)(6486002)(316002)(36756003)(26005)(86362001)(31696002)(6512007)(186003)(8936002)(2616005)(6506007)(38100700002)(6916009)(54906003)(508600001)(66476007)(4326008)(66556008)(8676002)(5660300002)(2906002)(66946007)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dTZaRjRkRDd3M1BwVTBub2RDVCsvTjBYalRrSzhQMHZlYXhjK3BIWTAyOVk0?=
 =?utf-8?B?TmJweVlWNGNadEd1N0YxeTUxRGhzTStMNGFhUHVXZ3JhaXliUjZtMHpQSmMv?=
 =?utf-8?B?WUtiOTZxMVBlRXNFRXNVQ2pLTzFJRnI0YkVqSWxYSVZOY2ZXTHAvMGQ3TEMx?=
 =?utf-8?B?VTJRU29GM0ZvcjlhUHdIVkZKUkI5eWoxYjk2T1pESUhzTnRNV1NaTDV0WVlu?=
 =?utf-8?B?d3o1VmYvR1M4WkhvL2xTRVBRUWRUOFdscEJsaDFHSHlJeEJJRGNhTG5IL0hH?=
 =?utf-8?B?RlJOdlN0Z1NyMXBrYjExUmphbWU0emJMUlNUakQ3V2pUMnV1WXp4Tm9zS0JT?=
 =?utf-8?B?SUFBaWFSMnhraUg4K1R2MGhQZFlOYnE0SmJxaVNpK1JRc01oVnB2VGxPaWFS?=
 =?utf-8?B?KzBsRGU2NFBHV21ManJRb21Jajlwcm1HMElOWGlRNjFqYjc4SDZQQXpoRm0z?=
 =?utf-8?B?SE1iTFRyWVhhUjROeDhtWkVtMWtlQ2hvMzlDckNqazlKQjN2RkJYUk53ZVBp?=
 =?utf-8?B?OHY4Q2NaMi9ramdUam9wbk5rZHJPbDlSYlE4Zk1VVC9SazFsck5oUE93ZW42?=
 =?utf-8?B?SElZVk5rYm1kUFlxb3FSQXZuWFZIUHF0VGNCQkkrZXZyZmFLeVFwV0ZxZjNR?=
 =?utf-8?B?dTFYMi8zcTkzaHRxbittYVVpa01zM1BuYThNQ3ZvamtmQzRwTmpPanQ0a2Jv?=
 =?utf-8?B?RHlZcWcrYXp5VVhzdURyRWJTYUx0Z0ZROXVUcW1JVi9OSVE5L25VazJWUWRq?=
 =?utf-8?B?Z1ExRnFmN1ZDZ2dwQkV0L3lITndPcDlGQ2NkN094MDk2NThuVWlnaG9YV0JK?=
 =?utf-8?B?eXp4NWc5dDVMZXlhakRVSkZ2RnR6M3NYeTVNRUw3SHdnKy9xZk1ZVE5BTC9D?=
 =?utf-8?B?T0ZIeklvdlQ2b3NCNi9DYTRtMng1OUllNWlVZW5zTHJhbmlicXREV0YzVkUw?=
 =?utf-8?B?amJ0ellDK2dHcmR4TXhWQ2Q5TnFid2RpcHlNWGdpMFB1WkhNeXpnczd4dU4z?=
 =?utf-8?B?VWNQZVBCRFdZOUJ6Nm95Ujg0SmlWQnlpS0NJL0djYkJwZmZyVVZFNjc1N0Qr?=
 =?utf-8?B?MzZsUzFjSG5xdHh0RHZ1VXdyemVSL0NyazZ2LzdIdlBrZVNHN0UrM3g0bEc5?=
 =?utf-8?B?SEdqYjRLdEZtbVRtb00yZFVrZURmYnNMaXZkWmRjdENCMnQ4SmYwL2ZYK25j?=
 =?utf-8?B?RXRCQVZtQ1FFTzQva2dOVHJrd0pxSFpxNElDNGFtTktKcUVCcGN4UmJma083?=
 =?utf-8?B?WUFBM3VMenQyUkNBaU5xcmRqOE4vUU9GYlR0RUluNGp6dnhrdTZITXEzbmxm?=
 =?utf-8?B?SzFvNnVOT0FDSXFBUVQwWXlUZ0UraWNoenRyajdPSFF4aHg2WWIrOGJya3pp?=
 =?utf-8?B?dzlIV1pSZE1vcWR5RnJMMlFSbDRMUkxTRzJjNWNZeWJLVkpmSkMvOWxNckVL?=
 =?utf-8?B?OWlUdlNwYldVL2hIRzhTNlNhZ3R1MFVkWkNHMmo5bVFURUhjanFOb1pybEZB?=
 =?utf-8?B?NE95UEtTQzFpangxUFN5L2Rvb0MvZTNZenIzMy96NVB0WGc4VjdpTEU1Vm5z?=
 =?utf-8?B?S0Q3ZHJzVEQvc1J3Z01DY0UxMFVZeGpydlpEcUljUU9PSStnOU5zTkk3UWZq?=
 =?utf-8?B?c1VtRTNjUHFoa3J5eUZYcHRRVnl5OHJqQ0xHcnREbUczanlPemxxZHBFQS9G?=
 =?utf-8?B?Nmc1ekNyQXZvVk5TZ2FDUE5TMlIwTHZ6MGh2Zy9kV2trVnNuOGNpaFBFM1dC?=
 =?utf-8?B?RzV4MkZtU1gyNkdJL1N1WnRCek5helRrY3dzdjEzQW0zaG5sWDNyVkhKWXpD?=
 =?utf-8?B?cWY2WEtuRGI4T2tRQUYzMXdCcXdUL0NJV21UbDNLY25nbm9ETHFQa0ZlNFAz?=
 =?utf-8?B?dGNqTUcwL2FoeXlzamNqOEFuUU00UEF2RTBpVUtrWjlCemhIUXNERS9md2dG?=
 =?utf-8?B?QVhjU3IyaHJMZU5NczF1WXhOSS9IbitaTnJtK0hUSnM1eUV2S2NrMUVqczFx?=
 =?utf-8?B?SVpSNnFuL0g4YmpNcEdITXFEMTFUbmVqa2ZOalBvNnhicDNFMjFsYkxBUzJV?=
 =?utf-8?B?V2cvZWRJL24wQUFIUEdOeXU1d2JGZUIrQUNIdjRIU2phSisyTlVzWkdpT3Bz?=
 =?utf-8?B?OUhnd1VoVmxNS2xReDlwTTBJbEZwc0M4VWpOUVZYa1MvbEQ1YmR2M2NEdlBk?=
 =?utf-8?B?T1h0SGFmWE92bkpQN2UrcEJVYVZLamhPanlFSHAvbXVGVCtpYkhReVBSVUxs?=
 =?utf-8?B?dS80QTdGTTFQeGI2OUpyc0x2MzY2eHd0YlR0M2FjZmM2QzIxSkRDM0tXNHBx?=
 =?utf-8?B?a2RmQzAzaG5wZFVDNS96RXNURS9EOTMyUjI3M004c0prdmlkWnh1Zz09?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8fbcaa9b-8b4b-4696-6e94-08da4eb9db1f
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jun 2022 10:28:57.9782
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4J5BcHPRuNpX/rY2roY4un8khWKnxdW69yF8t4S40y0oBARVo3aMmFl3lW+42FlBhntF6z/WENrf9xKPmiT57Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR04MB7332

The Map6 encoding space is a very sparse clone of the "0f38" one. Once
again re-use that table, as the entries corresponding to invalid opcodes
in Map6 are simply benign with simd_size forced to other than simd_none
(preventing undue memory reads in SrcMem handling early in
x86_emulate()).

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/tools/tests/x86_emulator/evex-disp8.c
+++ b/tools/tests/x86_emulator/evex-disp8.c
@@ -614,6 +614,36 @@ static const struct test avx512_fp16_all
     INSN(comish,          , map5, 2f,    el, fp16, el),
     INSN(divph,           , map5, 5e,    vl, fp16, vl),
     INSN(divsh,         f3, map5, 5e,    el, fp16, el),
+    INSN(fmadd132ph,    66, map6, 98,    vl, fp16, vl),
+    INSN(fmadd132sh,    66, map6, 99,    el, fp16, el),
+    INSN(fmadd213ph,    66, map6, a8,    vl, fp16, vl),
+    INSN(fmadd213sh,    66, map6, a9,    el, fp16, el),
+    INSN(fmadd231ph,    66, map6, b8,    vl, fp16, vl),
+    INSN(fmadd231sh,    66, map6, b9,    el, fp16, el),
+    INSN(fmaddsub132ph, 66, map6, 96,    vl, fp16, vl),
+    INSN(fmaddsub213ph, 66, map6, a6,    vl, fp16, vl),
+    INSN(fmaddsub231ph, 66, map6, b6,    vl, fp16, vl),
+    INSN(fmsub132ph,    66, map6, 9a,    vl, fp16, vl),
+    INSN(fmsub132sh,    66, map6, 9b,    el, fp16, el),
+    INSN(fmsub213ph,    66, map6, aa,    vl, fp16, vl),
+    INSN(fmsub213sh,    66, map6, ab,    el, fp16, el),
+    INSN(fmsub231ph,    66, map6, ba,    vl, fp16, vl),
+    INSN(fmsub231sh,    66, map6, bb,    el, fp16, el),
+    INSN(fmsubadd132ph, 66, map6, 97,    vl, fp16, vl),
+    INSN(fmsubadd213ph, 66, map6, a7,    vl, fp16, vl),
+    INSN(fmsubadd231ph, 66, map6, b7,    vl, fp16, vl),
+    INSN(fnmadd132ph,   66, map6, 9c,    vl, fp16, vl),
+    INSN(fnmadd132sh,   66, map6, 9d,    el, fp16, el),
+    INSN(fnmadd213ph,   66, map6, ac,    vl, fp16, vl),
+    INSN(fnmadd213sh,   66, map6, ad,    el, fp16, el),
+    INSN(fnmadd231ph,   66, map6, bc,    vl, fp16, vl),
+    INSN(fnmadd231sh,   66, map6, bd,    el, fp16, el),
+    INSN(fnmsub132ph,   66, map6, 9e,    vl, fp16, vl),
+    INSN(fnmsub132sh,   66, map6, 9f,    el, fp16, el),
+    INSN(fnmsub213ph,   66, map6, ae,    vl, fp16, vl),
+    INSN(fnmsub213sh,   66, map6, af,    el, fp16, el),
+    INSN(fnmsub231ph,   66, map6, be,    vl, fp16, vl),
+    INSN(fnmsub231sh,   66, map6, bf,    el, fp16, el),
     INSN(fpclassph,       , 0f3a, 66,    vl, fp16, vl),
     INSN(fpclasssh,       , 0f3a, 67,    el, fp16, el),
     INSN(getmantph,       , 0f3a, 26,    vl, fp16, vl),
--- a/tools/tests/x86_emulator/predicates.c
+++ b/tools/tests/x86_emulator/predicates.c
@@ -2049,6 +2049,37 @@ static const struct evex {
     { { 0x5f }, 2, T, R, pfx_f3, W0, LIG }, /* vmaxsh */
     { { 0x6e }, 2, T, R, pfx_66, WIG, L0 }, /* vmovw */
     { { 0x7e }, 2, T, W, pfx_66, WIG, L0 }, /* vmovw */
+}, evex_map6[] = {
+    { { 0x96 }, 2, T, R, pfx_66, W0, Ln }, /* vfmaddsub132ph */
+    { { 0x97 }, 2, T, R, pfx_66, W0, Ln }, /* vfmsubadd132ph */
+    { { 0x98 }, 2, T, R, pfx_66, W0, Ln }, /* vfmadd132ph */
+    { { 0x99 }, 2, T, R, pfx_66, W0, LIG }, /* vfmadd132sh */
+    { { 0x9a }, 2, T, R, pfx_66, W0, Ln }, /* vfmsub132ph */
+    { { 0x9b }, 2, T, R, pfx_66, W0, LIG }, /* vfmsub132sh */
+    { { 0x9c }, 2, T, R, pfx_66, W0, Ln }, /* vfnmadd132ph */
+    { { 0x9d }, 2, T, R, pfx_66, W0, LIG }, /* vfnmadd132sh */
+    { { 0x9e }, 2, T, R, pfx_66, W0, Ln }, /* vfnmsub132ph */
+    { { 0x9f }, 2, T, R, pfx_66, W0, LIG }, /* vfnmsub132sh */
+    { { 0xa6 }, 2, T, R, pfx_66, W0, Ln }, /* vfmaddsub213ph */
+    { { 0xa7 }, 2, T, R, pfx_66, W0, Ln }, /* vfmsubadd213ph */
+    { { 0xa8 }, 2, T, R, pfx_66, W0, Ln }, /* vfmadd213ph */
+    { { 0xa9 }, 2, T, R, pfx_66, W0, LIG }, /* vfmadd213sh */
+    { { 0xaa }, 2, T, R, pfx_66, W0, Ln }, /* vfmsub213ph */
+    { { 0xab }, 2, T, R, pfx_66, W0, LIG }, /* vfmsub213sh */
+    { { 0xac }, 2, T, R, pfx_66, W0, Ln }, /* vfnmadd213ph */
+    { { 0xad }, 2, T, R, pfx_66, W0, LIG }, /* vfnmadd213sh */
+    { { 0xae }, 2, T, R, pfx_66, W0, Ln }, /* vfnmsub213ph */
+    { { 0xaf }, 2, T, R, pfx_66, W0, LIG }, /* vfnmsub213sh */
+    { { 0xb6 }, 2, T, R, pfx_66, W0, Ln }, /* vfmaddsub231ph */
+    { { 0xb7 }, 2, T, R, pfx_66, W0, Ln }, /* vfmsubadd231ph */
+    { { 0xb8 }, 2, T, R, pfx_66, W0, Ln }, /* vfmadd231ph */
+    { { 0xb9 }, 2, T, R, pfx_66, W0, LIG }, /* vfmadd231sh */
+    { { 0xba }, 2, T, R, pfx_66, W0, Ln }, /* vfmsub231ph */
+    { { 0xbb }, 2, T, R, pfx_66, W0, LIG }, /* vfmsub231sh */
+    { { 0xbc }, 2, T, R, pfx_66, W0, Ln }, /* vfnmadd231ph */
+    { { 0xbd }, 2, T, R, pfx_66, W0, LIG }, /* vfnmadd231sh */
+    { { 0xbe }, 2, T, R, pfx_66, W0, Ln }, /* vfnmsub231ph */
+    { { 0xbf }, 2, T, R, pfx_66, W0, LIG }, /* vfnmsub231sh */
 };
 
 static const struct {
@@ -2060,6 +2091,7 @@ static const struct {
     { evex_0f3a, ARRAY_SIZE(evex_0f3a) },
     { NULL,      0 },
     { evex_map5, ARRAY_SIZE(evex_map5) },
+    { evex_map6, ARRAY_SIZE(evex_map6) },
 };
 
 #undef Wn
--- a/xen/arch/x86/x86_emulate/decode.c
+++ b/xen/arch/x86/x86_emulate/decode.c
@@ -1231,6 +1231,16 @@ int x86emul_decode(struct x86_emulate_st
                         d = twobyte_table[b].desc;
                         s->simd_size = twobyte_table[b].size ?: simd_other;
                         break;
+
+                    case evex_map6:
+                        if ( !evex_encoded() )
+                        {
+                            rc = X86EMUL_UNRECOGNIZED;
+                            goto done;
+                        }
+                        opcode |= MASK_INSR(6, X86EMUL_OPC_EXT_MASK);
+                        d = twobyte_table[0x38].desc;
+                        break;
                     }
                 }
                 else if ( s->ext < ext_8f08 + ARRAY_SIZE(xop_table) )
@@ -1479,6 +1489,24 @@ int x86emul_decode(struct x86_emulate_st
             disp8scale = decode_disp8scale(twobyte_table[b].d8s, s);
             break;
 
+        case ext_map6:
+            d = ext0f38_table[b].to_mem ? DstMem | SrcReg
+                                        : DstReg | SrcMem;
+            if ( ext0f38_table[b].two_op )
+                d |= TwoOp;
+            s->simd_size = ext0f38_table[b].simd_size ?: simd_other;
+
+            switch ( b )
+            {
+            default:
+                if ( s->evex.pfx == vex_66 )
+                    s->fp16 = true;
+                break;
+            }
+
+            disp8scale = decode_disp8scale(ext0f38_table[b].d8s, s);
+            break;
+
         case ext_8f09:
             if ( ext8f09_table[b].two_op )
                 d |= TwoOp;
@@ -1698,6 +1726,7 @@ int x86emul_decode(struct x86_emulate_st
         break;
 
     case ext_map5:
+    case ext_map6:
     case ext_8f09:
     case ext_8f0a:
         break;
--- a/xen/arch/x86/x86_emulate/private.h
+++ b/xen/arch/x86/x86_emulate/private.h
@@ -195,6 +195,7 @@ enum vex_opcx {
     vex_0f38,
     vex_0f3a,
     evex_map5 = 5,
+    evex_map6,
 };
 
 enum vex_pfx {
@@ -250,6 +251,7 @@ struct x86_emulate_state {
         ext_0f38 = vex_0f38,
         ext_0f3a = vex_0f3a,
         ext_map5 = evex_map5,
+        ext_map6 = evex_map6,
         /*
          * For XOP use values such that the respective instruction field
          * can be used without adjustment.
--- a/xen/arch/x86/x86_emulate/x86_emulate.c
+++ b/xen/arch/x86/x86_emulate/x86_emulate.c
@@ -7780,6 +7780,49 @@ x86_emulate(
         generate_exception_if(evex.w, EXC_UD);
         goto avx512f_all_fp;
 
+    case X86EMUL_OPC_EVEX_66(6, 0x96): /* vfmaddsub132ph [xyz]mm/mem,[xyz]mm,[xyz]mm{k} */
+    case X86EMUL_OPC_EVEX_66(6, 0x97): /* vfmsubadd132ph [xyz]mm/mem,[xyz]mm,[xyz]mm{k} */
+    case X86EMUL_OPC_EVEX_66(6, 0x98): /* vfmadd132ph [xyz]mm/mem,[xyz]mm,[xyz]mm{k} */
+    case X86EMUL_OPC_EVEX_66(6, 0x9a): /* vfmsub132ph [xyz]mm/mem,[xyz]mm,[xyz]mm{k} */
+    case X86EMUL_OPC_EVEX_66(6, 0x9c): /* vfnmadd132ph [xyz]mm/mem,[xyz]mm,[xyz]mm{k} */
+    case X86EMUL_OPC_EVEX_66(6, 0x9e): /* vfnmsub132ph [xyz]mm/mem,[xyz]mm,[xyz]mm{k} */
+    case X86EMUL_OPC_EVEX_66(6, 0xa6): /* vfmaddsub213ph [xyz]mm/mem,[xyz]mm,[xyz]mm{k} */
+    case X86EMUL_OPC_EVEX_66(6, 0xa7): /* vfmsubadd213ph [xyz]mm/mem,[xyz]mm,[xyz]mm{k} */
+    case X86EMUL_OPC_EVEX_66(6, 0xa8): /* vfmadd213ph [xyz]mm/mem,[xyz]mm,[xyz]mm{k} */
+    case X86EMUL_OPC_EVEX_66(6, 0xaa): /* vfmsub213ph [xyz]mm/mem,[xyz]mm,[xyz]mm{k} */
+    case X86EMUL_OPC_EVEX_66(6, 0xac): /* vfnmadd213ph [xyz]mm/mem,[xyz]mm,[xyz]mm{k} */
+    case X86EMUL_OPC_EVEX_66(6, 0xae): /* vfnmsub213ph [xyz]mm/mem,[xyz]mm,[xyz]mm{k} */
+    case X86EMUL_OPC_EVEX_66(6, 0xb6): /* vfmaddsub231ph [xyz]mm/mem,[xyz]mm,[xyz]mm{k} */
+    case X86EMUL_OPC_EVEX_66(6, 0xb7): /* vfmsubadd231ph [xyz]mm/mem,[xyz]mm,[xyz]mm{k} */
+    case X86EMUL_OPC_EVEX_66(6, 0xb8): /* vfmadd231ph [xyz]mm/mem,[xyz]mm,[xyz]mm{k} */
+    case X86EMUL_OPC_EVEX_66(6, 0xba): /* vfmsub231ph [xyz]mm/mem,[xyz]mm,[xyz]mm{k} */
+    case X86EMUL_OPC_EVEX_66(6, 0xbc): /* vfnmadd231ph [xyz]mm/mem,[xyz]mm,[xyz]mm{k} */
+    case X86EMUL_OPC_EVEX_66(6, 0xbe): /* vfnmsub231ph [xyz]mm/mem,[xyz]mm,[xyz]mm{k} */
+        host_and_vcpu_must_have(avx512_fp16);
+        generate_exception_if(evex.w, EXC_UD);
+        if ( ea.type != OP_REG || !evex.brs )
+            avx512_vlen_check(false);
+        goto simd_zmm;
+
+    case X86EMUL_OPC_EVEX_66(6, 0x99): /* vfmadd132sh xmm/m16,xmm,xmm{k} */
+    case X86EMUL_OPC_EVEX_66(6, 0x9b): /* vfmsub132sh xmm/m16,xmm,xmm{k} */
+    case X86EMUL_OPC_EVEX_66(6, 0x9d): /* vfnmadd132sh xmm/m16,xmm,xmm{k} */
+    case X86EMUL_OPC_EVEX_66(6, 0x9f): /* vfnmsub132sh xmm/m16,xmm,xmm{k} */
+    case X86EMUL_OPC_EVEX_66(6, 0xa9): /* vfmadd213sh xmm/m16,xmm,xmm{k} */
+    case X86EMUL_OPC_EVEX_66(6, 0xab): /* vfmsub213sh xmm/m16,xmm,xmm{k} */
+    case X86EMUL_OPC_EVEX_66(6, 0xad): /* vfnmadd213sh xmm/m16,xmm,xmm{k} */
+    case X86EMUL_OPC_EVEX_66(6, 0xaf): /* vfnmsub213sh xmm/m16,xmm,xmm{k} */
+    case X86EMUL_OPC_EVEX_66(6, 0xb9): /* vfmadd231sh xmm/m16,xmm,xmm{k} */
+    case X86EMUL_OPC_EVEX_66(6, 0xbb): /* vfmsub231sh xmm/m16,xmm,xmm{k} */
+    case X86EMUL_OPC_EVEX_66(6, 0xbd): /* vfnmadd231sh xmm/m16,xmm,xmm{k} */
+    case X86EMUL_OPC_EVEX_66(6, 0xbf): /* vfnmsub231sh xmm/m16,xmm,xmm{k} */
+        host_and_vcpu_must_have(avx512_fp16);
+        generate_exception_if(evex.w || (ea.type != OP_REG && evex.brs),
+                              EXC_UD);
+        if ( !evex.brs )
+            avx512_vlen_check(true);
+        goto simd_zmm;
+
     case X86EMUL_OPC_XOP(08, 0x85): /* vpmacssww xmm,xmm/m128,xmm,xmm */
     case X86EMUL_OPC_XOP(08, 0x86): /* vpmacsswd xmm,xmm/m128,xmm,xmm */
     case X86EMUL_OPC_XOP(08, 0x87): /* vpmacssdql xmm,xmm/m128,xmm,xmm */
--- a/xen/arch/x86/x86_emulate/x86_emulate.h
+++ b/xen/arch/x86/x86_emulate/x86_emulate.h
@@ -620,6 +620,7 @@ struct x86_emulate_ctxt
  *  0x0f38xxxx for 0f38-prefixed opcodes (or their VEX/EVEX equivalents)
  *  0x0f3axxxx for 0f3a-prefixed opcodes (or their VEX/EVEX equivalents)
  *     0x5xxxx for Map5 opcodes (EVEX only)
+ *     0x6xxxx for Map6 opcodes (EVEX only)
  *  0x8f08xxxx for 8f/8-prefixed XOP opcodes
  *  0x8f09xxxx for 8f/9-prefixed XOP opcodes
  *  0x8f0axxxx for 8f/a-prefixed XOP opcodes


