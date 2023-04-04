Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 68FE76D65E5
	for <lists+xen-devel@lfdr.de>; Tue,  4 Apr 2023 16:55:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.517933.803953 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pji3U-0003Ax-Ej; Tue, 04 Apr 2023 14:54:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 517933.803953; Tue, 04 Apr 2023 14:54:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pji3U-000398-BC; Tue, 04 Apr 2023 14:54:40 +0000
Received: by outflank-mailman (input) for mailman id 517933;
 Tue, 04 Apr 2023 14:54:38 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=7Jsu=73=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pji3S-00038P-5s
 for xen-devel@lists.xenproject.org; Tue, 04 Apr 2023 14:54:38 +0000
Received: from EUR02-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur02on20611.outbound.protection.outlook.com
 [2a01:111:f400:fe16::611])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9d9240a4-d2f8-11ed-85db-49a42c6b2330;
 Tue, 04 Apr 2023 16:54:36 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by PAXPR04MB8126.eurprd04.prod.outlook.com (2603:10a6:102:1bc::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6254.35; Tue, 4 Apr
 2023 14:54:34 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b%6]) with mapi id 15.20.6254.035; Tue, 4 Apr 2023
 14:54:34 +0000
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
X-Inumbo-ID: 9d9240a4-d2f8-11ed-85db-49a42c6b2330
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nFr790ZrZjSmlZcs33yWrti5tqAz3kertLXPude8W632EOZfuYr6BjHFMwk0Yx+uKoUfp8NDTN94xIn9l/k4noHgzuFV6yB2C+WEblF+NdU4D8HOUjGjCWqzWNNxR+8AV0hg6F5ESYGoYxOwEEbzhVFrGYE1FsOszk/Vh9o/BvxR/LMuwydz+PGQmxhK2t5eC8p3tUPnKgP4yhLQd3Wc6iEMYTMG147hFSTnL6FRJVDoFMzUxGt0wi4kH0Ot0QWzwH+7mz9aN5e3bcXdahpVZiBawcjzVNBlMg2UfMHUTvSzVSON4On3519EH8mUuhAGz3dRDgGhOhkHPnld19iNxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=N2VXtzSxt2N0XZD5RA5H5Y/sAIhPik9M4K9Pvxm3mDQ=;
 b=hz0hOfiGsgL4cWDcAocxbO32yQchhO5NzEnF+i0auW796NMe2I6mUN4o9CpF4EtdZF4qWGZuI5euzNER+XTCJNStbyvNcvNHYjKyL89zPLau85O0qKX2JABTc9mpfCSPAuNEGczunT3aYSR7o/8gxgODE/WQ97RhGnun5fhCOgYBMyp4rhb0+o1SQcs064HTc0UDnjhhFMjwMsliFnrCQEAO0XQyCWXeriU6HK2EQuvSeKZDnpEeA+UuA2OAeDvmZweGKfPGXV5B5GefdOtu+pb1XqXJYsP8z2ozbQzajldBcIs6/kGuvx+OW0hq9TrNQ7mQANgdALM/bjMDwYYBjQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=N2VXtzSxt2N0XZD5RA5H5Y/sAIhPik9M4K9Pvxm3mDQ=;
 b=S3KwFP555vTnXB5z6xy6NcVsc1EDXocbxy2qvpsJYQwzkFiNl/C64f6ntoqfGNvOD3Lh5/8nQzs5X3INV+4sYJ4I0270blANQiEnY/Zgs/4NQ+6qUz++k5ycV3ng0wVbB9gRGAk0jIDIzN/+1nR/ClRcrg3ot8UPR4pNdxAeayomC6WLkt/ICRAmlNDjI3NCVlb9OM8FBIVqOlYwpmduZzVfKytkgfhz5x9ivQqHC/RPR06JMAVS9XT0vXoU4jeF/84y2d029uDhjXipMTrTeXGpjNob4MgNqByRqkP9J/eHutqi4jCb9EMHGXya1RHtTLMFlzDLVlcDP9HG3TDyfw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <bdcb4822-397a-0795-08eb-74e661d9b7ae@suse.com>
Date: Tue, 4 Apr 2023 16:54:32 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: [PATCH 8/9] x86emul: support AVX-NE-CONVERT insns
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <c7f748fe-f062-c2fc-4cc4-b2f888633abe@suse.com>
In-Reply-To: <c7f748fe-f062-c2fc-4cc4-b2f888633abe@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0181.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:ab::8) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|PAXPR04MB8126:EE_
X-MS-Office365-Filtering-Correlation-Id: 9c23632b-f94e-40cf-9c58-08db351c80e9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Neg8WMJaYIe6XSbITpCdr26RGqwTgvbcrYG1SCrolWeVvjRjgMFG+SH/yvxqaU30ceQedhzV7zayjOowVLRkwZJUGFQyXEU3u32VckP/qJqSPzGvj26D5R4iezyXlWum/klJDnS6w/Hf3mfROqVVvHNOyRNPpRoYcMDDUJNrPiM6EQ6wmC9zm32pYejjJiPr9nSNyQh8Mh5TnKMhMZNYBm/0AYYfy2hqpTrpN6MKhPeODmGMv7r/jQA/+0YQkkNZmFqkGUHzMEFH+zCiBhp+47FVCNzlcy1UvtbHRxiaDqcsuTkQblCtAheL6Qbeq7qgyr2B9BbJtntk5w7f5Ca8wgCZwZPpLwCRTpc5TWSmbK9cXKuTWYgJ+3KROCfHQto8FmkZwUKp0AOPmOD8q/XasRfm101TqyMFT2aw77uCo7uQkesFGpRH+m4xXyPvkw0ABDhXhO/pEs46uY4lkH9wt6WjzyJfu6n3sLscm7f1mqISqPP16hhPH/f3kiz7eJoBHhjnUHJNvO1qfBVKscs6j0RKLVAwLv0bNGcL5b0ooDSGKZ9uE6MeXSvXtnGQOT3F6kVDkZlm19YTwsuF1KS+siHFEPLAlSVj+IAcUAv0SNiDu2OpBM8nDCvte68LOTl45931sIkP+g6oyHe/6m9NOQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(396003)(366004)(39860400002)(376002)(346002)(136003)(451199021)(66556008)(41300700001)(8676002)(4326008)(6916009)(66476007)(66946007)(316002)(5660300002)(8936002)(31686004)(54906003)(478600001)(6486002)(26005)(6512007)(6506007)(2616005)(186003)(83380400001)(31696002)(86362001)(38100700002)(2906002)(36756003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?OUpoMlRCSnRQSHdRU2xNRmtsemd0QUNjTE1PNERmaGZ1c05aV21EYUI4S2hE?=
 =?utf-8?B?bktQOEJFdno4MUFaV01UNHFuLzI0S0JkbnUwNkE4ZGs1MUZ4MnFHa3pJZDE4?=
 =?utf-8?B?VE1KOXpoSWxldDZicXRTUmswa09kMVRkY01PK2Y4akNhcFJidE5PaFJrdVU5?=
 =?utf-8?B?MTRQU3E2MXl3RHVFdTJ5anJSWUJnWXU4dXRhTS9VVUFoV243WGlweEJyNEVX?=
 =?utf-8?B?UkdGa2kxRTU2V0xhZ2ZDVVFtbmtUZERPM1M3akR0dm1neWlYSGc4Mjd1cHI2?=
 =?utf-8?B?cWFURWEzeEg3R0FhMEFtVm5PT0czWXlzMWFGUUI4ajNhRHk3N2R5RkxydkdI?=
 =?utf-8?B?Nk0rMTdHWE0rTnVuczVyMVlQWTkvTlF0NmFSS0JhRGxtd2xzUWJ6RmMyeWRZ?=
 =?utf-8?B?eTFucFNXeHZGY3l1UjJ3UVNGc1c4SmFWSUswNi9RamxWc29yNi9iamlDMU4v?=
 =?utf-8?B?RGlrT0htWXdWTkpaR1MydFhQODMyT29zQWNNaTF6MGswZ0xDTEErREdwRWFR?=
 =?utf-8?B?N3JDVG44enJudUJmTE93U3Y0K2d2RlMrOUVGbnBUOFp1S0JFcTJ6RTAxUmVO?=
 =?utf-8?B?aVB3T1pFcHBPR3IyMnhmK1FYaVA0dklITXJMMlNhdmhMdlFLblRzbTFYUXhh?=
 =?utf-8?B?bWZYMThseEVIL2hoUjRoaDdvU2d2NjFDSUhlVkpzY284SGliV3RRcFV0Qnc0?=
 =?utf-8?B?eHB4ZUtSZ1BZWTU2U2Y5cFhWalFsVHpIS0VKNTFYVnhoTnUvVjF6aDBOK0Yz?=
 =?utf-8?B?bU1KNkNIU2RMU2JPWlpwY0hKQ0liT2lURnp5azdzUWQ4SHcxWXB3OVlOYmQ3?=
 =?utf-8?B?Z1BrdVkrRThWL29CMm9jdnBqdzRTQnpuU1N6MXdjeDZ4TmNWbEhSMGRrYzU4?=
 =?utf-8?B?YXBTVWFFMzV5RFN0eHNhR2RTOEJ5dk1uKzZveDBBNGEwOTlGUU1LWmtkOWJN?=
 =?utf-8?B?SHJxYXpkcWJLSGZuUE5pdTlTMytZalQwT2ZHN1NKMlNwZEVaMVJsMzUyZE5Q?=
 =?utf-8?B?Qy9WRWNjRlA4NXBtd2NXSU83RkRialJQYVlOdE43bmpYTk9UMFVJc0l2TXIz?=
 =?utf-8?B?eTNHelpCdEpRVUwyRzlqQkt1SG9LOTFoNEJVYXlhWW12TlY5K3NUMU9MK2pL?=
 =?utf-8?B?eVY3KzhFS0ZoMWFzZmE2cmU2UjRhNFZLTjd5cWVzRVdnQXAvR1dZSjV1SCtH?=
 =?utf-8?B?cVZ6ZlhUY1laaFFERUFVN25lSXY0OVd4TGs0d1ZtUHViWkJhclhhODVzUjRQ?=
 =?utf-8?B?eGRDUDB2TVNaU2xITE81TkNUVVprc0Jzd3ZYdzUzbjZWQ2drTWpKeWhwZ2ZQ?=
 =?utf-8?B?MkhGMVN3dC9SRWhGeFNUa2wvZFNUUXQ2SDZ3aFBBMk4xRmVwV0xheTBzc21y?=
 =?utf-8?B?dm1XNVhzMDdycWNqZ3FoUyt1bE9tbmpMNkNiaFdNNjN2V2IrYTlXcnVKQzB3?=
 =?utf-8?B?T2N1cDVjNGFyeUtaQ2ZEOVAxWTFkYTJmQjlXL0Y5WVNNUDR0RDdNbUdHNkpi?=
 =?utf-8?B?ZWprT0oydVorczU5Y3dvL2hCOVRabE1CM0MzcVZhN1VNcjM5Y2JDYnVlUkFV?=
 =?utf-8?B?ajRpZHpFZEh0cWg5QmNEaVdjNFZ3OTZ6bnhJUTdGalZvNC8xMlJXSkpteGw0?=
 =?utf-8?B?alA2c1BqOFNjdVdSeFd3LzRyZEtILytQSnVLRUYzMXBUY3Q3eFZGRlJjbXZU?=
 =?utf-8?B?WWtkRnNDVjdlVWtlSlpEY1VlM0o3SndNb1d4LzllMUtzTmQzTmhCTE1ZZ0Ft?=
 =?utf-8?B?TTJPV0MrZUhEa3hCSXdnd0pKWS9CNFgzWExTQjNrVnNQU1Z1SVdjWEtOdEpV?=
 =?utf-8?B?SDg1bDNZS3FXQTJWWU80eFg0aE95SEVXb3BhLzIvZ3pHRXJHaElIVEFPWm4z?=
 =?utf-8?B?V0hHdE9FZ3FwNzlRVXY0S3k2dXYyZk9vRTJNam5Ick84TzVtZ1NDNEdxYkRp?=
 =?utf-8?B?UmNpSGprdmdNdnoxclhQckxnL2szUWNudDIwTnpEZEU1OU9xQlBVdHV2UjNj?=
 =?utf-8?B?N1N3OHlPVlBVS1pFZk95WHo1aXArZ01BYjFRSEJsWkxnL1grdmxQR1NNb0k1?=
 =?utf-8?B?ejhBcHVDK2JuM1R1bWMvbHNTbTloNXlDRjdCeXhuckpTOFRoOVBpS09lNHNk?=
 =?utf-8?Q?4wCrIWJhID1vw+FNfN5thOAVo?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9c23632b-f94e-40cf-9c58-08db351c80e9
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Apr 2023 14:54:34.2795
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QIDfAINVTb+W4Toch1pGOexXH3FU6pwNkV3bLehq/gyW/Paa7fj6kLHUpLzHow3/86DeZLgFEBuDxS2aaVG0zw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8126

Matching what was done earlier, explicit tests are added only for
irregular insn / memory access patterns.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
SDE: -grr or -srf

--- a/tools/libs/light/libxl_cpuid.c
+++ b/tools/libs/light/libxl_cpuid.c
@@ -242,6 +242,7 @@ int libxl_cpuid_parse_config(libxl_cpuid
         {"avx-ifma",     0x00000007,  1, CPUID_REG_EAX, 23,  1},
 
         {"avx-vnni-int8",0x00000007,  1, CPUID_REG_EDX,  4,  1},
+        {"avx-ne-convert",0x00000007, 1, CPUID_REG_EDX,  5,  1},
         {"cet-sss",      0x00000007,  1, CPUID_REG_EDX, 18,  1},
 
         {"intel-psfd",   0x00000007,  2, CPUID_REG_EDX,  0,  1},
--- a/tools/misc/xen-cpuid.c
+++ b/tools/misc/xen-cpuid.c
@@ -214,7 +214,7 @@ static const char *const str_7c1[32] =
 
 static const char *const str_7d1[32] =
 {
-    [ 4] = "avx-vnni-int8",
+    [ 4] = "avx-vnni-int8", [ 5] = "avx-ne-convert",
 
     [18] = "cet-sss",
 };
--- a/tools/tests/x86_emulator/predicates.c
+++ b/tools/tests/x86_emulator/predicates.c
@@ -1350,6 +1350,7 @@ static const struct vex {
     { { 0x58 }, 2, T, R, pfx_66, W0, Ln }, /* vpbroadcastd */
     { { 0x59 }, 2, T, R, pfx_66, W0, Ln }, /* vpbroadcastq */
     { { 0x5a }, 2, F, R, pfx_66, W0, L1 }, /* vbroadcasti128 */
+    { { 0x72 }, 2, T, R, pfx_f3, W0, Ln }, /* vcvtneps2bf16 */
     { { 0x78 }, 2, T, R, pfx_66, W0, Ln }, /* vpbroadcastb */
     { { 0x79 }, 2, T, R, pfx_66, W0, Ln }, /* vpbroadcastw */
     { { 0x8c }, 2, F, R, pfx_66, Wn, Ln }, /* vpmaskmov{d,q} */
@@ -1378,6 +1379,12 @@ static const struct vex {
     { { 0xad }, 2, T, R, pfx_66, Wn, LIG }, /* vnmadd213s{s,d} */
     { { 0xae }, 2, T, R, pfx_66, Wn, Ln }, /* vnmsub213p{s,d} */
     { { 0xaf }, 2, T, R, pfx_66, Wn, LIG }, /* vnmsub213s{s,d} */
+    { { 0xb0 }, 2, F, R, pfx_no, W0, Ln }, /* vcvtneoph2ps */
+    { { 0xb0 }, 2, F, R, pfx_66, W0, Ln }, /* vcvtneeph2ps */
+    { { 0xb0 }, 2, F, R, pfx_f3, W0, Ln }, /* vcvtneebf162ps */
+    { { 0xb0 }, 2, F, R, pfx_f2, W0, Ln }, /* vcvtneobf162ps */
+    { { 0xb1 }, 2, F, R, pfx_66, W0, Ln }, /* vbcstnesh2ps */
+    { { 0xb1 }, 2, F, R, pfx_f3, W0, Ln }, /* vbcstnebf162ps */
     { { 0xb4 }, 2, T, R, pfx_66, W1, Ln }, /* vpmadd52luq */
     { { 0xb5 }, 2, T, R, pfx_66, W1, Ln }, /* vpmadd52huq */
     { { 0xb6 }, 2, T, R, pfx_66, Wn, Ln }, /* vmaddsub231p{s,d} */
--- a/tools/tests/x86_emulator/test_x86_emulator.c
+++ b/tools/tests/x86_emulator/test_x86_emulator.c
@@ -4572,6 +4572,39 @@ int main(int argc, char **argv)
     else
         printf("skipped\n");
 
+    printf("%-40s", "Testing vbcstnebf162ps 2(%ecx),%ymm3...");
+    if ( stack_exec && cpu_has_avx_ne_convert )
+    {
+        decl_insn(vbcstnebf162ps);
+
+        asm volatile ( /* vbcstnebf162ps 2(%0), %%ymm3 */
+                       put_insn(vbcstnebf162ps,
+                                ".byte 0xc4, 0xe2, 0x7e, 0xb1, 0x59, 0x02 ")
+                       :: "c" (NULL) );
+
+        res[0] = 0x43210000;
+        regs.ecx = (unsigned long)res;
+        set_insn(vbcstnebf162ps);
+        bytes_read  = 0;
+        rc = x86_emulate(&ctxt, &emulops);
+        if ( rc != X86EMUL_OKAY || !check_eip(vbcstnebf162ps) ||
+             bytes_read != 2 )
+            goto fail;
+
+        asm volatile ( "vbroadcastss %1, %%ymm2;"
+                       "vsubps %%ymm3, %%ymm2, %%ymm1;"
+                       "vptest %%ymm1, %%ymm1;"
+                       "setc %b0; setz %h0"
+                       : "=&Q" (rc)
+                       : "m" (res[0]) );
+        if ( (rc & 0xffff) != 0x0101 )
+            goto fail;
+
+        printf("okay\n");
+    }
+    else
+        printf("skipped\n");
+
     printf("%-40s", "Testing stmxcsr (%edx)...");
     if ( cpu_has_sse )
     {
--- a/tools/tests/x86_emulator/x86-emulate.h
+++ b/tools/tests/x86_emulator/x86-emulate.h
@@ -188,6 +188,7 @@ void wrpkru(unsigned int val);
 #define cpu_has_cmpccxadd  cp.feat.cmpccxadd
 #define cpu_has_avx_ifma   (cp.feat.avx_ifma && xcr0_mask(6))
 #define cpu_has_avx_vnni_int8 (cp.feat.avx_vnni_int8 && xcr0_mask(6))
+#define cpu_has_avx_ne_convert (cp.feat.avx_ne_convert && xcr0_mask(6))
 
 #define cpu_has_xgetbv1   (cpu_has_xsave && cp.xstate.xgetbv1)
 
--- a/xen/arch/x86/include/asm/cpufeature.h
+++ b/xen/arch/x86/include/asm/cpufeature.h
@@ -175,6 +175,7 @@ extern struct cpuinfo_x86 boot_cpu_data;
 
 /* CPUID level 0x00000007:1.edx */
 #define cpu_has_avx_vnni_int8   boot_cpu_has(X86_FEATURE_AVX_VNNI_INT8)
+#define cpu_has_avx_ne_convert  boot_cpu_has(X86_FEATURE_AVX_NE_CONVERT)
 
 /* Synthesized. */
 #define cpu_has_arch_perfmon    boot_cpu_has(X86_FEATURE_ARCH_PERFMON)
--- a/xen/arch/x86/x86_emulate/decode.c
+++ b/xen/arch/x86/x86_emulate/decode.c
@@ -423,6 +423,8 @@ static const struct ext0f38_table {
     [0xad] = { .simd_size = simd_scalar_vexw, .d8s = d8s_dq },
     [0xae] = { .simd_size = simd_packed_fp, .d8s = d8s_vl },
     [0xaf] = { .simd_size = simd_scalar_vexw, .d8s = d8s_dq },
+    [0xb0] = { .simd_size = simd_other, .two_op = 1 },
+    [0xb1] = { .simd_size = simd_other, .two_op = 1 },
     [0xb4 ... 0xb5] = { .simd_size = simd_packed_int, .d8s = d8s_vl },
     [0xb6 ... 0xb8] = { .simd_size = simd_packed_fp, .d8s = d8s_vl },
     [0xb9] = { .simd_size = simd_scalar_vexw, .d8s = d8s_dq },
--- a/xen/arch/x86/x86_emulate/private.h
+++ b/xen/arch/x86/x86_emulate/private.h
@@ -601,6 +601,7 @@ amd_like(const struct x86_emulate_ctxt *
 #define vcpu_has_wrmsrns()     (ctxt->cpuid->feat.wrmsrns)
 #define vcpu_has_avx_ifma()    (ctxt->cpuid->feat.avx_ifma)
 #define vcpu_has_avx_vnni_int8() (ctxt->cpuid->feat.avx_vnni_int8)
+#define vcpu_has_avx_ne_convert() (ctxt->cpuid->feat.avx_ne_convert)
 
 #define vcpu_must_have(feat) \
     generate_exception_if(!vcpu_has_##feat(), X86_EXC_UD)
--- a/xen/arch/x86/x86_emulate/x86_emulate.c
+++ b/xen/arch/x86/x86_emulate/x86_emulate.c
@@ -6208,6 +6208,19 @@ x86_emulate(
         host_and_vcpu_must_have(avx512_vbmi2);
         goto avx512f_no_sae;
 
+    case X86EMUL_OPC_VEX   (0x0f38, 0xb0): /* vcvtneoph2ps mem,[xy]mm */
+    case X86EMUL_OPC_VEX_66(0x0f38, 0xb0): /* vcvtneeph2ps mem,[xy]mm */
+    case X86EMUL_OPC_VEX_F3(0x0f38, 0xb0): /* vcvtneebf162ps mem,[xy]mm */
+    case X86EMUL_OPC_VEX_F2(0x0f38, 0xb0): /* vcvtneobf162ps mem,[xy]mm */
+        generate_exception_if(ea.type != OP_MEM, EXC_UD);
+        /* fall through */
+    case X86EMUL_OPC_VEX_F3(0x0f38, 0x72): /* vcvtneps2bf16 [xy]mm/mem,xmm */
+        host_and_vcpu_must_have(avx_ne_convert);
+        generate_exception_if(vex.w, EXC_UD);
+        d |= TwoOp;
+        op_bytes = 16 << vex.l;
+        goto simd_0f_ymm;
+
     case X86EMUL_OPC_EVEX_66(0x0f38, 0x75): /* vpermi2{b,w} [xyz]mm/mem,[xyz]mm,[xyz]mm{k} */
     case X86EMUL_OPC_EVEX_66(0x0f38, 0x7d): /* vpermt2{b,w} [xyz]mm/mem,[xyz]mm,[xyz]mm{k} */
     case X86EMUL_OPC_EVEX_66(0x0f38, 0x8d): /* vperm{b,w} [xyz]mm/mem,[xyz]mm,[xyz]mm{k} */
@@ -6737,6 +6750,13 @@ x86_emulate(
         break;
     }
 
+    case X86EMUL_OPC_VEX_66(0x0f38, 0xb1): /* vbcstnesh2ps mem,[xy]mm */
+    case X86EMUL_OPC_VEX_F3(0x0f38, 0xb1): /* vbcstnebf162ps mem,[xy]mm */
+        host_and_vcpu_must_have(avx_ne_convert);
+        generate_exception_if(vex.w || ea.type != OP_MEM, EXC_UD);
+        op_bytes = 2;
+        goto simd_0f_ymm;
+
     case X86EMUL_OPC_VEX_66(0x0f38, 0xb4): /* vpmadd52luq [xy]mm/mem,[xy]mm,[xy]mm */
     case X86EMUL_OPC_VEX_66(0x0f38, 0xb5): /* vpmadd52huq [xy]mm/mem,[xy]mm,[xy]mm */
         host_and_vcpu_must_have(avx_ifma);
--- a/xen/include/public/arch-x86/cpufeatureset.h
+++ b/xen/include/public/arch-x86/cpufeatureset.h
@@ -306,6 +306,7 @@ XEN_CPUFEATURE(MCDT_NO,            13*32
 
 /* Intel-defined CPU features, CPUID level 0x00000007:1.edx, word 15 */
 XEN_CPUFEATURE(AVX_VNNI_INT8,      15*32+ 4) /*A  AVX-VNNI-INT8 Instructions */
+XEN_CPUFEATURE(AVX_NE_CONVERT,     15*32+ 5) /*A  AVX-NE-CONVERT Instructions */
 XEN_CPUFEATURE(CET_SSS,            15*32+18) /*   CET Supervisor Shadow Stacks safe to use */
 
 #endif /* XEN_CPUFEATURE */
--- a/xen/tools/gen-cpuid.py
+++ b/xen/tools/gen-cpuid.py
@@ -232,7 +232,7 @@ def crunch_numbers(state):
         # for the XOP prefix).  VEX/XOP-encoded GPR instructions, such as
         # those from the BMI{1,2}, TBM and LWP sets function fine in the
         # absence of any enabled xstate.
-        AVX: [FMA, FMA4, F16C, AVX2, XOP],
+        AVX: [FMA, FMA4, F16C, AVX2, XOP, AVX_NE_CONVERT],
 
         # This dependency exists solely for the shadow pagetable code.  If the
         # host doesn't have NX support, the shadow pagetable code can't handle


