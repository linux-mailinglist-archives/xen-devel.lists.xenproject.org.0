Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FEEF6D5E02
	for <lists+xen-devel@lfdr.de>; Tue,  4 Apr 2023 12:49:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.517829.803702 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pjeDV-0007d9-Gv; Tue, 04 Apr 2023 10:48:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 517829.803702; Tue, 04 Apr 2023 10:48:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pjeDV-0007af-E8; Tue, 04 Apr 2023 10:48:45 +0000
Received: by outflank-mailman (input) for mailman id 517829;
 Tue, 04 Apr 2023 10:48:44 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=7Jsu=73=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pjeDU-0007aZ-2A
 for xen-devel@lists.xenproject.org; Tue, 04 Apr 2023 10:48:44 +0000
Received: from EUR02-AM0-obe.outbound.protection.outlook.com
 (mail-am0eur02on20604.outbound.protection.outlook.com
 [2a01:111:f400:fe13::604])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4402ac15-d2d6-11ed-85db-49a42c6b2330;
 Tue, 04 Apr 2023 12:48:42 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AS8PR04MB8562.eurprd04.prod.outlook.com (2603:10a6:20b:421::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6254.35; Tue, 4 Apr
 2023 10:48:40 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b%6]) with mapi id 15.20.6254.035; Tue, 4 Apr 2023
 10:48:40 +0000
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
X-Inumbo-ID: 4402ac15-d2d6-11ed-85db-49a42c6b2330
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dvDvE+LdazRTMVRdDLDqwsNJxaThusd9CBiFKV57vm0UBFZmGSem9OShFD2UMBKabaw5DrqhPj6/6hqFVFHjS+fXL9LUTmdE/bpL11afEra45alD6mqKJdknys3xZqyhT9DWjC+MlvnM2dfDHCGC04wAN0KrwibaY6zjHugujdsZnnlD2bbr0Y3xHPQaSmgjPb5SrZZl3vxq4uJrtzA6z3qHBeZoeSt/lkBJf/GjOaNUnW5BPMPtjPp0gXbCa/2IGghWAMv+mcWSZyrG6xUNDaiqBVgYu9Fvb6gETdLC2UVcP+7Gbu0dxoQVrAlvhQPz6Xuj9EuZuH4wpbS7LS4NNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Cf8KOdXE7psy3J1Dgd+qmWiV5099rLBr/uhBEdSFlTs=;
 b=GVxNefWRk1qm1V/1NQT8LdLgikIAi5APO95GVkRLFT3gnR8LjggpmiHUe2TYabjPvPufgQejJSNUPdv0usgTyIRCMLTvBGb8+WwLZpPEKv51Ff+/FM7rKUihF7Dweqa3GCBys6XZmD9fqycHY1MNQ81XiTBCh8gkslNwbU1Dby0eEINxK/hvTFDrylSNuqqQc9dnogvGXRrin21A7/qvsdf5hgyHiDjm5ZRJKOPQpxy8YOjqkYzYtROTgjY28yrvLvxcNPvlnr2j3CB9S5A7XfTks4yzj+YHDpi03lyZlTL/vRT93w1Rgt6+7233FhV76gWpvwZGoYW43xLqqD1NiA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Cf8KOdXE7psy3J1Dgd+qmWiV5099rLBr/uhBEdSFlTs=;
 b=A1TCnAEwsh0hf0EH9LSb2baIYDDAH14fym9XaVUAnrTmESFIiUyibFgGOqENld2ejHLg3RrfLGJhiJT9pcymiwi9IDeglb+JU9heJ103XorFDwLW2J/1ClB/+N8zW1mVF6LpxRbZyewDInsRc2pwlfXtbn7MurNtwm9808cMnmn45fVtKzC9sVL4nSYv2qJb61G20/Y69LtjQJSTeBQe6DHvDshz5Zo+eZt7/qzvwjCCjncRap0bEHPbvZB72xyCKxPhWk/1aAIFVX9uYmk25cfli2l4ks7yMzTTEX1br9nRMvZ6xqQZoecZ/e09UJBSDXrXvUkD/slSZFIu5lo0KQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <558b1cc5-e294-87b3-676b-68d7e55065f5@suse.com>
Date: Tue, 4 Apr 2023 12:48:38 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Content-Language: en-US
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH] x86emul: correct AVX512VL+VPCLMUL test descriptions
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0146.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:96::20) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AS8PR04MB8562:EE_
X-MS-Office365-Filtering-Correlation-Id: 982942c5-8a4e-4b0d-1967-08db34fa26ef
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Sar9RPx4JvyedxjGsvPXmdWuQZQ8waCOZr/tki2/FKxQKZc9gDk5v+lNVpGY1H+cMlrjYN46owAlEM/1Vo5cRHQoYxabg5IF1xmZio424WDYI+CUFICkdIxTAhATqfPWg1hqW8fWW0VBEoj5aCoWAqtvndf8oZfsYcUM151nb0SY+UQ7bo2GWaIC9iGqaXA/XAGC9DjC0RbrE8WLa15o3BU/qOqnP1zLXAaGdRPKkm18TcTQkiV1PXZOJFcQRR1kkd73igW0mu9j1SwSOrLs84qCmtunjix7DvVg5pzanQbP9IL/vtS3u3OJ0dmDqvo5Rdf8iJ1Y+DRwbgV1cXfWPtvsJQaxVRDpd9cd2dh2tkelS3QUccTTRgXrGE7Bce7BumbJYdgn5D68G8CPO7M7Lr8Rj/AeMhzWQCBx2RsIYtE/CLttqBi4GqclVnPZQ3H+k/WeEEymqndpN5uRE3o9OShqZUr9WflKEJf80WMyBbtSjwYhxORy4m9U3rSanN4zbj6sEldEepPNy8elZla74SbJAShoIs57mI3gGdNiSzPnsjZL9Oz0geeeVfogKSMkdLAu/x6EnP5UY3U0tq1fcngBx4toA97iEqWjPurzwGyKN8036G/2XoMBn5f57bUbibFvzUyssOb+jadvRuUcvg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(376002)(366004)(346002)(136003)(39860400002)(396003)(451199021)(31686004)(478600001)(26005)(6512007)(6506007)(66556008)(2616005)(41300700001)(66946007)(6486002)(66476007)(6916009)(4326008)(54906003)(316002)(186003)(5660300002)(8676002)(8936002)(2906002)(38100700002)(31696002)(86362001)(36756003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Wjg4SjR2bUdsWm1HclBPMVZ0YVUxK3dSYXFQa1R5UERXdWxrY2E1bndBQ082?=
 =?utf-8?B?NE1ncHhJRlNlc24vKzJrM0psc3hiZW5tWHpGOWJBVWNMbjNzVEZPUXFlVjdU?=
 =?utf-8?B?WmMyZlJ0anRRam01ejNodjNDZE9Fd3JVUGxWdzZCR21GajExWjlrTmpvME84?=
 =?utf-8?B?eHRMRHowYlU2TXk2WGJHaWpaMW5GN014dlJFUXFjdGtSaHp6TFpKSFA2c2Iy?=
 =?utf-8?B?TGloYjRmRVVRM2gxQzYrTnRsRXJvQ0QxWFl2b0t6S2RRdEpnVVE3QlpobjN6?=
 =?utf-8?B?OE0vd1dpM2RmOC92TWJ5ZUxURTI1dWE4TlNXS2QvNW1rQVJKMml6WWRzMjdz?=
 =?utf-8?B?TFNCeGxDNStrVG1zTkxEQ0p6SXgvcEo5Y2Y1NlhIRjRHVXBpMldqVUxwWkhV?=
 =?utf-8?B?UmI1T2dOc2RqZ3BvVWh2emhhZnJURkZCNytteGNpVWMxL0o2ZUNTOFUySmFO?=
 =?utf-8?B?M28xZUlpN3hxU2R5K25pdDBYenJOQldTSzk0WXhSV01RcTQrUXhLQ1F3SWdW?=
 =?utf-8?B?NWVMYUdMYXl5TjY1WHhZdDhBZ0N6Q0tCemtPSDUycnVqdUV4SDZoZjhuMzdF?=
 =?utf-8?B?Y0NUUkJVQmwxZXU5R2ZUNDBOYlZmN3NuMnRkcW9EUzBGalo0djFiNmlVYjdD?=
 =?utf-8?B?S3FzTnYybGVmZTUxQlNmd0pBMU1rQ3F1amtRdk9UaDBITkdxWk5mVVFHdElx?=
 =?utf-8?B?ZzEyZ0l0d0FrZ2dOc0J6cUQ2MEd3am4yc0d2aDVKcVN0RXFXU3dtcDFvTG5v?=
 =?utf-8?B?d0k4YW9NQU8wSmZFT09WK2F5b0N2Mm9LdmxYQ3dUUjY4SkFXTXZrT3RYdS9z?=
 =?utf-8?B?TTlxbi9UUHJKSlBtQUZLcDZUN1NNVzVJc1c5U1FpK3lOaitUQW92KzI5Uk1l?=
 =?utf-8?B?MlZZK0h3bWVzRFh4NGlVdURKcEw5cGlGUW1HMXIzQ2t0Y1lKRWVyMXRlUVBo?=
 =?utf-8?B?aG1RaHp5MDIvWkdEcW9rWVdsc1QrM2hCa21VQVZybDQrWFptRVA3UnRvVVVp?=
 =?utf-8?B?TmdLWGVOYkw1SCtiVkhjV2xTY0RON2k4b3JrMGk1Mm5jNDdDc0NRZVV2SWh5?=
 =?utf-8?B?Y2g1dUxrZTJPMGN1SzNBMXpJNnZidXgrT1ZDbzRRZ3JpNkxFaWE1RERyZFhG?=
 =?utf-8?B?Y3k2NSsrOTB0cWthSTBPWjJtMTdrU3d3WTFoR3Ric3AvQTVkK3lmSDBMd2pB?=
 =?utf-8?B?Vk1GZTIwSTJ6c2NlMmlaTWFBaW1uei9ic3NmUW5leElSY1ZvNEdZU0RsOHFJ?=
 =?utf-8?B?T2ZFTXlhaUprQWM0UHhiY1FkeExONnBZL2ZWaEVwZ29LeDVVZEMyYXo5aHI3?=
 =?utf-8?B?R1Ixai9QWVJDaTRaaGwydGZPVEdObTlLb1dRWC9OUVBKZXpUb0tjUEpHTG5L?=
 =?utf-8?B?Q2E3Sm9ObkxoRkdEMkNwWVVTTUtMM1AyY255QllFTUdtYnFpbUVodFE0NGN3?=
 =?utf-8?B?U0tlcWQxU05Tb3NJc2RqVkJsUFBHVWVYU1F3cHZ2Yjk2SGN5WHJZdjhhK2N0?=
 =?utf-8?B?eTR2NWVHeUYyVE1QYUhIc3FiQXk3VCsrTGVGKzl3TFFwczdST2VBZWxtcjlh?=
 =?utf-8?B?bk1mWFJBMmhIcjFXa3F5ZzJSM0lITHdQeWUvQldzWGFka2tST3lITzZ5bk1T?=
 =?utf-8?B?RkFPQlRXaENyQ3hkKzAwKzRpL3ZhOGxKZ3VMb0Q1d2w1aCtHSi81RGRhcWVy?=
 =?utf-8?B?bXI1cjJ1T0ZaRjJ0Vnc1bFNkM2pnMTBaMW44UXJQZksrOVgxaFlXdmRjeTZS?=
 =?utf-8?B?ZDNoaUF1V2pNOElHWlg5bHplbWNCS2hqamtGam1pWVVkZnVNd05lQXVQVUYr?=
 =?utf-8?B?Q3lDZWM2UXl4N3VNaUhpSEZKUDZGSGNmTE5GSmt4cG1jQUJFWDhGSlNoZTUz?=
 =?utf-8?B?bElkTnN5dHBTRS9tNXd6RTNESXpJeG5NeVJsc3hiK1RMUmpmaCtMQUpGTmR2?=
 =?utf-8?B?RlFFSmZ6K3Boa01tVFFHdlJxTTFjZ1NFdjdRZ21jaHhUUTFnWmVVdTJhc0VM?=
 =?utf-8?B?b2sxRVBwT2drblZ3U0pUWjJWdkYxK2xUZkVoMHdWazFQeEE1bjVMTUZBMDVX?=
 =?utf-8?B?TENPZzlMS016WlY4SytkRlpxUTFwMkdyWlEya2p3aGw4VW5JSmpyUWpJRDBC?=
 =?utf-8?Q?cVPjr/Jb2iTenlDt4GIa2OUgz?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 982942c5-8a4e-4b0d-1967-08db34fa26ef
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Apr 2023 10:48:40.4500
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: s/uTvvQ44jZuUEM0woXj3LHRAzt7Qhmo4pQJd72L7ISoPYXfuEVWRMGqUG+rah6CxHNXx+WNy+PaN/gpFCuK9g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8562

The stride values (based on 32-bit element size) were wrong for these
two test, yielding misleading output (especially when comparing with the
test variants also involving AVX512-VBMI2).

Also insert a missing blank on a nearby, related line.

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/tools/tests/x86_emulator/test_x86_emulator.c
+++ b/tools/tests/x86_emulator/test_x86_emulator.c
@@ -520,10 +520,10 @@ static const struct {
     SIMD(VAES (EVEX/x64), avx512bw_vaes,      64),
     AVX512VL(VL+VAES (x16), avx512bw_vaes,    16),
     AVX512VL(VL+VAES (x32), avx512bw_vaes,    32),
-    SIMD(VPCLMUL (VEX/x4), avx2_vpclmulqdq,  32),
+    SIMD(VPCLMUL (VEX/x4), avx2_vpclmulqdq,   32),
     SIMD(VPCLMUL (EVEX/x8), avx512bw_vpclmulqdq, 64),
-    AVX512VL(VL+VPCLMUL (x4), avx512bw_vpclmulqdq, 16),
-    AVX512VL(VL+VPCLMUL (x8), avx512bw_vpclmulqdq, 32),
+    AVX512VL(VL+VPCLMUL (x2), avx512bw_vpclmulqdq, 16),
+    AVX512VL(VL+VPCLMUL (x4), avx512bw_vpclmulqdq, 32),
     SIMD(AVX512_VBMI2+VPCLMUL (x8), avx512vbmi2_vpclmulqdq, 64),
     AVX512VL(_VBMI2+VL+VPCLMUL (x2), avx512vbmi2_vpclmulqdq, 16),
     AVX512VL(_VBMI2+VL+VPCLMUL (x4), avx512vbmi2_vpclmulqdq, 32),

