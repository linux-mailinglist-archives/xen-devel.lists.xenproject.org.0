Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 30DE16D6601
	for <lists+xen-devel@lfdr.de>; Tue,  4 Apr 2023 16:55:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.517939.803963 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pji4P-0003sx-Ns; Tue, 04 Apr 2023 14:55:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 517939.803963; Tue, 04 Apr 2023 14:55:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pji4P-0003qQ-Kd; Tue, 04 Apr 2023 14:55:37 +0000
Received: by outflank-mailman (input) for mailman id 517939;
 Tue, 04 Apr 2023 14:55:35 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=7Jsu=73=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pji4N-0003oC-2I
 for xen-devel@lists.xenproject.org; Tue, 04 Apr 2023 14:55:35 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04on0620.outbound.protection.outlook.com
 [2a01:111:f400:fe0e::620])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id bf7e408d-d2f8-11ed-b464-930f4c7d94ae;
 Tue, 04 Apr 2023 16:55:33 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by PR3PR04MB7387.eurprd04.prod.outlook.com (2603:10a6:102:91::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6254.35; Tue, 4 Apr
 2023 14:55:30 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b%6]) with mapi id 15.20.6254.035; Tue, 4 Apr 2023
 14:55:28 +0000
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
X-Inumbo-ID: bf7e408d-d2f8-11ed-b464-930f4c7d94ae
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=S5C8RUOJoi+hdotVxI3CsrNA3Ic+y6ScMHT4OnOdslj7PMiji5TJMyg6coI6uSOMHxC5ylWYUBteOjxdJcUfldfuD43CEutMRQxdB9T3/6ayResp69fo/9+9lh4QiYwVSmxiYoaCbgkzMwbe2dLsY8TMU/KLaPM2qnW0BUWps/X4ZBNvqULHU6X00XX75buG5s4fgr8WLVxvE1EYZFLEE3PFCly7e6MNtL+7xXxoL2emufiLKUetwEvQ5PO8p5P+hlNYHY7CJypSCppQLLLk9h8fM7MnLOTGH+AWWimYX+xYlmhNof6dZiidZMrh6BWZoik50vjfygmJGrqZg/eL5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lLeFsTI0iyr3SPpC0veUHC0LR4+hVFKVGSkpuBvNPvk=;
 b=j1B3/nI/Ij62SVVKcWFXoxcL+fLfMxdc/l1q4uUGqygLzB4TS5upSqZP7OkunisF1w6o3/zAZkfdh9Ef045Fetzfib+0LNcfAPK1wizXoqZpVFZxgLx/SlTdlHZOwMLT477nW5cEBKjVj4h0Hm3qp907QtI5kEykoj13JAhITwexypOtOLSxbCQD3oivQRPCz/fm3YyeD15QgA/gpYbfY+yzb8haX+Y7ONtZXbYAkxb7yO+n0N2D3FH6rkXpInVQjROd7mIz6x6fDQvR7VORH2zcsqNBQmirtt8tSyaLKk/z/QIVCI0X3MD196Z1sY5BjJYr8K0M/dgM/QF1shBahg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lLeFsTI0iyr3SPpC0veUHC0LR4+hVFKVGSkpuBvNPvk=;
 b=on7RLrSQgN/5YUVplOkU3QxQdBCRm73yu0+GJ84nv9o+VI83CNHh2gjtkIHyrepE4N+pD90PJoyQgBRpbnSbqGNMsGUzf0/WU4V6vXqzRK5mu/2q7mDkFfe+XsZQ84wrOOO5S3QtMUt2HWEn2xk1Waf5YHlmahtmNr+AuMFhRenEHogKoPuXo1HEz5VBvH/MuskNIzD1R71ZjJCOAKzXqTqb30mR81Wl/oFfnPJssLiX82CrTMee70lzzrduc9YGBH0Na6L2W/EL5mNwNdN1chHWTD8x7gJOyVlpdYbWnuY0/iPIUzwsgLASgXuFYStiNyK+l32QsLyzdVwaM/IvWQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <b567e068-dcab-b294-9706-ffbecb36de3c@suse.com>
Date: Tue, 4 Apr 2023 16:55:27 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: [PATCH 9/9] x86emul+VMX: support {RD,WR}MSRLIST
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <c7f748fe-f062-c2fc-4cc4-b2f888633abe@suse.com>
In-Reply-To: <c7f748fe-f062-c2fc-4cc4-b2f888633abe@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0131.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:97::16) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|PR3PR04MB7387:EE_
X-MS-Office365-Filtering-Correlation-Id: a0b0b44f-ddb3-4d24-b94f-08db351ca162
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	/je+6YLXR1M66HeYWQ2onL2DabuFALwc5l0MZ+Bn2W8TXGG+HBeejT1eNPsFqsThOJB6eHaDHNiSQTs1z/Jzg/i1fmKOAyKO9vW6M7u/0afR6petqdSm5lFxWto8cqfetpuftRPlw0PK5Q8ZwwYTqWzowc/L8dGqYmWsCwwOuSlGtGZwoixzMqq4bOpngLIVPx6QT5q8N0Q8eXUc4xjzQoV+Ia0Y/vOQVWwKlsXwbg1qBepw2PSbM4pxT2+cP+ZI0emmFI1XIXjG3gi3w5jaIhNHg43/A2CF+2xIx5AuGo5KaLLSD9T6udNkUQRwGhkdkQ4ylm2x2kDkRtjEsxEVkaAko4GoFlLKu7XsyNAvZ+eaVu6z5A4a81zP9tqSlKZuzrYF8SATpXUHsor070GajW60iMMWFCxpsAAlTe+4PFA1OteW2JeoP2nssyskpTgV4paEMUwel5MB8Q/Gr0Icq3l69KyLAGP1jByBGmAowS90BeKn2+kdAVmWMXCh6M8NsNkXV9XwPuiKo4MaRc8I5W3ie6Oiw/gHOhVrliTrKRMt31RF76noMp0K31sQAVXw8V2Ha+75EHUWEN0UW/nsLk4kv3cvkNEYOx4uvMAFURFCIslJ4IvDf+82UdIm+42AyIYDzOUDf8Y2CclKEkhSeg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(346002)(376002)(396003)(136003)(39860400002)(366004)(451199021)(83380400001)(2616005)(6486002)(6506007)(316002)(6512007)(478600001)(54906003)(2906002)(26005)(186003)(30864003)(5660300002)(38100700002)(66946007)(66556008)(66476007)(41300700001)(86362001)(8676002)(31696002)(8936002)(6916009)(4326008)(36756003)(31686004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MjJicU5WMFMxZlZnZEU5NC84dFYwYmowR2NhRFIxci9DZkJsRzR1TlgzQXkv?=
 =?utf-8?B?L05pQTN3Qnp1WWtPek1FZHlrcDk1TGFwc3FZcVdpMG5uM1B6SEtoajZLaTR6?=
 =?utf-8?B?VDQ2Ulo3NGxHSmJ4ZWI4Rk1NVFpLOUVzYzdxTVd2R0lDZWQ2dExHMTdHSWVm?=
 =?utf-8?B?Uk9KdENJSE9SRFl4YmNhZllBd0xURU5vc1VPS016OE9WSldSWXBwUTNzNGhY?=
 =?utf-8?B?endmOXBIU2hSOWJlYXR3dzRjN2xTcUxNbzRFL3ZDYkpnUkdPeVlkWWlKK25a?=
 =?utf-8?B?aFdJMjVJbG9wK0c1aERVT0JFWERheGY0T21PanFsNzRLTHJWd01NWlRDZzNJ?=
 =?utf-8?B?MTBSeHZDM2lWMTUyd1Q0ZktuYnFyM1g4c3p0eGFuMEV1N0xRbEtDdktFaEFC?=
 =?utf-8?B?WHRJTGc3a0VpSDcyUzJqOGhaUEdIODRVUnQ2NEJ5ajdSdUlMVGVaZHZpSjFj?=
 =?utf-8?B?c1A1UjYxbkczbFYzSENTMUdnVGE5TC9KM1BOODZ5WitUSDF4Q2w3eUpSeGh6?=
 =?utf-8?B?dkM3WWRtNkE1MklOTzgySk90LzdiUWtuUmtVNHpWRFJISUNzZ2V5M2ZmcUI5?=
 =?utf-8?B?L0tIK0NKOWFIRzFvSENtRlM3emk1VzlhbGVHM0I5QUZ2dEV1YzkyNTJ1MzVy?=
 =?utf-8?B?R1A3TENRQVVwb3NMSnQybDRERmpsMWk0NEhCR1pKaW95TWtnMi9uVjRQTWZt?=
 =?utf-8?B?MitUbE9CTnpzb0dScUhMUENWR2dqeWxkcERQN1B4d2RGWDc3SDEwUTcvc3ls?=
 =?utf-8?B?bnFLZlE2OTZJb3FrNEkxOE1NcURqZytWTUZBOUFUNVN0SGRUTHdPcXhOM05Y?=
 =?utf-8?B?ckEzdTMvdkd3c0pad2gxM1JZZno5YWtMVU9pUXYzNEdNQ2tTbkxSQStJKzBF?=
 =?utf-8?B?MFNLVFgyYmk3dGIvTXZMRmNuMUN4S3lQclRoQUgrZTNKeUVzelZzMVBOVHky?=
 =?utf-8?B?OU5leG4wTHNDaWtMRVp3ZnFaSUZxcDlEWnZTa3A1Z3hzK1FwbC9YTk0yQ0Fm?=
 =?utf-8?B?TE93ZGNPMnNvai83UCtXOTUyaVBuNE5QcytaTWhaN2kxcjcyRU1HWEpJc3ow?=
 =?utf-8?B?TkdQWlpoclJocEZFSWVJMDhVZlZZclVTQTFvckVTcmNkQVBjMk8zaHMwNzNz?=
 =?utf-8?B?L2V0cWQ1VnJOWlRBbDV2NlllT3NBTmRvQkx6ZGw1RVBYdkVoRVpNaWdTU2RZ?=
 =?utf-8?B?VUV3OUFMUzhDcTA2TDZUeFdBck1DTjVhQUlkNG5hS2RjbnhSOU9Nc1NkMUZu?=
 =?utf-8?B?YXlmSHNzbXIwbUJRaTgwSXZhQTJBYnpJbU9HSG50cXBINE5oSEEzYi9SR0FE?=
 =?utf-8?B?NUhqUkNLUDBMQmcrVDYzWEgvVVJTRlluK0grK21rVkI5VFZPMll0Sm9iTDRW?=
 =?utf-8?B?TVdLU0RXRkZ4Y3R3T2dJdkJMSEh1OC9BSnhaL2k1TnRSRGFlS0VtekoxKzgv?=
 =?utf-8?B?YXdCdS80OG0zajQ1VVc2UURQQkxhUStuNm8xMFJRdXFuUitodnh5a3Q5a1Vr?=
 =?utf-8?B?QjN4NVQ4N0MwczZIcVlpRW10RGhvTDJrWUR5WWdKcmpaQmVwcXBWckJpNjha?=
 =?utf-8?B?Z25qL1NuWXpYSnBtVWRGcUpDdU1UOVRGei9sNXViMHMrdEg1SVMrbGQ0NnZW?=
 =?utf-8?B?RFNkSTZDdWduOSsybGl0a0wzZk5PRHJERHNFR1FuZUVKYlFvc0ZVeXQ0TkIv?=
 =?utf-8?B?L3BKcVd5Wnp2ZVRscEtsVEZsUFB2QXA1YWVKYXRlUnpYaGYrbkF2R3pvTTYw?=
 =?utf-8?B?NnNrUlZQMjhHSDdHYVFwSXBHV2N1cUdsMkUwaDd4VVBJUnE5QlgrTlhCTlg5?=
 =?utf-8?B?eWZTSk9NQTB1V05pZEVaYTlTWFMycWJEcjZJZXF6UTJOb05XUU1kakRxOTla?=
 =?utf-8?B?eEJRNG0zRlNMZ2ZOZDY3S2FURGU1VGxWdElleGxlVDNaRzJnUWEyK0hucjVG?=
 =?utf-8?B?Qkg1THVlN1gzRlhQNE54Um9HdTdkazV1K01ZazZqbUZSYkVZdWZ2b2NYazQr?=
 =?utf-8?B?cGkxME5JQzA5M0Z5RU00Tm9yWWgrTm5uS3JLN1UvZ3Njb3MrTXE2c0hTRjhE?=
 =?utf-8?B?SDJwb0czQ3JleWFEU3FvbnRnaUliVkdYRllXQUR6QWNjT3ZIVDgxSWxhQnJq?=
 =?utf-8?Q?Up0dv1aW8a5nepSm6dLuogKca?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a0b0b44f-ddb3-4d24-b94f-08db351ca162
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Apr 2023 14:55:28.7634
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0TN3sk35VdQqZnON7Yql3gZG76HBwh1+FgeJ90UY59yFPDq7O9i2VKE/NAuMHiahZ/Nt8dc2lq9KTTuk5cXHew==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR04MB7387

These are "compound" instructions to issue a series of RDMSR / WRMSR
respectively. In the emulator we can therefore implement them by using
the existing msr_{read,write}() hooks. The memory accesses utilize that
the HVM ->read() / ->write() hooks are already linear-address
(x86_seg_none) aware (by way of hvmemul_virtual_to_linear() handling
this case).

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
TODO: Use VMX tertiary execution control (once bit is known; see
      //todo-s) and then further adjust cpufeatureset.h.

RFC: In vmx_vmexit_handler() handling is forwarded to the emulator
     blindly. Alternatively we could consult the exit qualification and
     process just a single MSR at a time (without involving the
     emulator), exiting back to the guest after every iteration. (I
     don't think a mix of both models makes a lot of sense.)

RFC: For PV priv_op_ops would need to gain proper read/write hooks,
     which doesn't look desirable (albeit there we could refuse to
     handle anything else than x86_seg_none); we may want to consider to
     instead not support the feature for PV guests, requiring e.g. Linux
     to process the lists in new pvops hooks.

RFC: I wasn't sure whether to add preemption checks to the loops -
     thoughts?

With the VMX side of the spec still unclear (tertiary execution control
bit unspecified in ISE 046) we can't enable the insn yet for (HVM) guest
use. The precise behavior of MSR_BARRIER is also not spelled out, so the
(minimal) implementation is a guess for now.

--- a/tools/libs/light/libxl_cpuid.c
+++ b/tools/libs/light/libxl_cpuid.c
@@ -240,6 +240,7 @@ int libxl_cpuid_parse_config(libxl_cpuid
         {"lkgs",         0x00000007,  1, CPUID_REG_EAX, 18,  1},
         {"wrmsrns",      0x00000007,  1, CPUID_REG_EAX, 19,  1},
         {"avx-ifma",     0x00000007,  1, CPUID_REG_EAX, 23,  1},
+        {"msrlist",      0x00000007,  1, CPUID_REG_EAX, 27,  1},
 
         {"avx-vnni-int8",0x00000007,  1, CPUID_REG_EDX,  4,  1},
         {"avx-ne-convert",0x00000007, 1, CPUID_REG_EDX,  5,  1},
--- a/tools/misc/xen-cpuid.c
+++ b/tools/misc/xen-cpuid.c
@@ -195,6 +195,8 @@ static const char *const str_7a1[32] =
     [18] = "lkgs",          [19] = "wrmsrns",
 
     /* 22 */                [23] = "avx-ifma",
+
+    /* 26 */                [27] = "msrlist",
 };
 
 static const char *const str_e21a[32] =
--- a/tools/tests/x86_emulator/predicates.c
+++ b/tools/tests/x86_emulator/predicates.c
@@ -342,6 +342,8 @@ static const struct {
     { { 0x01, 0xc4 }, { 2, 2 }, F, N }, /* vmxoff */
     { { 0x01, 0xc5 }, { 2, 2 }, F, N }, /* pconfig */
     { { 0x01, 0xc6 }, { 2, 2 }, F, N }, /* wrmsrns */
+    { { 0x01, 0xc6 }, { 0, 2 }, F, W, pfx_f2 }, /* rdmsrlist */
+    { { 0x01, 0xc6 }, { 0, 2 }, F, R, pfx_f3 }, /* wrmsrlist */
     { { 0x01, 0xc8 }, { 2, 2 }, F, N }, /* monitor */
     { { 0x01, 0xc9 }, { 2, 2 }, F, N }, /* mwait */
     { { 0x01, 0xca }, { 2, 2 }, F, N }, /* clac */
--- a/tools/tests/x86_emulator/test_x86_emulator.c
+++ b/tools/tests/x86_emulator/test_x86_emulator.c
@@ -589,6 +589,7 @@ static int read(
     default:
         if ( !is_x86_user_segment(seg) )
             return X86EMUL_UNHANDLEABLE;
+    case x86_seg_none:
         bytes_read += bytes;
         break;
     }
@@ -619,7 +620,7 @@ static int write(
     if ( verbose )
         printf("** %s(%u, %p,, %u,)\n", __func__, seg, (void *)offset, bytes);
 
-    if ( !is_x86_user_segment(seg) )
+    if ( !is_x86_user_segment(seg) && seg != x86_seg_none )
         return X86EMUL_UNHANDLEABLE;
     memcpy((void *)offset, p_data, bytes);
     return X86EMUL_OKAY;
@@ -711,6 +712,10 @@ static int read_msr(
 {
     switch ( reg )
     {
+    case 0x0000002f: /* BARRIER */
+        *val = 0;
+        return X86EMUL_OKAY;
+
     case 0xc0000080: /* EFER */
         *val = ctxt->addr_size > 32 ? 0x500 /* LME|LMA */ : 0;
         return X86EMUL_OKAY;
@@ -1499,9 +1504,53 @@ int main(int argc, char **argv)
          (gs_base != 0x0000111122224444UL) ||
          gs_base_shadow )
         goto fail;
+    printf("okay\n");
 
     cp.extd.nscb = i;
     emulops.write_segment = NULL;
+
+    printf("%-40s", "Testing rdmsrlist...");
+    instr[0] = 0xf2; instr[1] = 0x0f; instr[2] = 0x01; instr[3] = 0xc6;
+    regs.rip = (unsigned long)&instr[0];
+    regs.rsi = (unsigned long)(res + 0x80);
+    regs.rdi = (unsigned long)(res + 0x80 + 0x40 * 2);
+    regs.rcx = 0x0002000100008000UL;
+    gs_base_shadow = 0x0000222244446666UL;
+    memset(res + 0x80, ~0, 0x40 * 8 * 2);
+    res[0x80 + 0x0f * 2] = 0xc0000101; /* GS_BASE */
+    res[0x80 + 0x0f * 2 + 1] = 0;
+    res[0x80 + 0x20 * 2] = 0xc0000102; /* SHADOW_GS_BASE */
+    res[0x80 + 0x20 * 2 + 1] = 0;
+    res[0x80 + 0x31 * 2] = 0x2f; /* BARRIER */
+    res[0x80 + 0x31 * 2 + 1] = 0;
+    rc = x86_emulate(&ctxt, &emulops);
+    if ( (rc != X86EMUL_OKAY) ||
+         (regs.rip != (unsigned long)&instr[4]) ||
+         regs.rcx ||
+         (res[0x80 + (0x40 + 0x0f) * 2] != (unsigned int)gs_base) ||
+         (res[0x80 + (0x40 + 0x0f) * 2 + 1] != (gs_base >> (8 * sizeof(int)))) ||
+         (res[0x80 + (0x40 + 0x20) * 2] != (unsigned int)gs_base_shadow) ||
+         (res[0x80 + (0x40 + 0x20) * 2 + 1] != (gs_base_shadow >> (8 * sizeof(int)))) ||
+         res[0x80 + (0x40 + 0x31) * 2] || res[0x80 + (0x40 + 0x31) * 2 + 1] )
+        goto fail;
+    printf("okay\n");
+
+    printf("%-40s", "Testing wrmsrlist...");
+    instr[0] = 0xf3; instr[1] = 0x0f; instr[2] = 0x01; instr[3] = 0xc6;
+    regs.eip = (unsigned long)&instr[0];
+    regs.rsi -= 0x11 * 8;
+    regs.rdi -= 0x11 * 8;
+    regs.rcx = 0x0002000100000000UL;
+    res[0x80 + 0x0f * 2] = 0xc0000102; /* SHADOW_GS_BASE */
+    res[0x80 + 0x20 * 2] = 0xc0000101; /* GS_BASE */
+    rc = x86_emulate(&ctxt, &emulops);
+    if ( (rc != X86EMUL_OKAY) ||
+         (regs.rip != (unsigned long)&instr[4]) ||
+         regs.rcx ||
+         (gs_base != 0x0000222244446666UL) ||
+         (gs_base_shadow != 0x0000111122224444UL) )
+        goto fail;
+
     emulops.write_msr     = NULL;
 #endif
     printf("okay\n");
--- a/tools/tests/x86_emulator/x86-emulate.c
+++ b/tools/tests/x86_emulator/x86-emulate.c
@@ -88,6 +88,7 @@ bool emul_test_init(void)
     cp.feat.rdpid = true;
     cp.feat.lkgs = true;
     cp.feat.wrmsrns = true;
+    cp.feat.msrlist = true;
     cp.extd.clzero = true;
 
     if ( cpu_has_xsave )
--- a/xen/arch/x86/hvm/vmx/vmx.c
+++ b/xen/arch/x86/hvm/vmx/vmx.c
@@ -835,6 +835,17 @@ static void cf_check vmx_cpuid_policy_ch
     else
         vmx_set_msr_intercept(v, MSR_PKRS, VMX_MSR_RW);
 
+    if ( cp->feat.msrlist )
+    {
+        vmx_clear_msr_intercept(v, MSR_BARRIER, VMX_MSR_RW);
+        //todo enable MSRLIST tertiary execution control
+    }
+    else
+    {
+        vmx_set_msr_intercept(v, MSR_BARRIER, VMX_MSR_RW);
+        //todo disable MSRLIST tertiary execution control
+    }
+
  out:
     vmx_vmcs_exit(v);
 
@@ -3705,6 +3716,22 @@ gp_fault:
     return X86EMUL_EXCEPTION;
 }
 
+static bool cf_check is_msrlist(
+    const struct x86_emulate_state *state, const struct x86_emulate_ctxt *ctxt)
+{
+
+    if ( ctxt->opcode == X86EMUL_OPC(0x0f, 0x01) )
+    {
+        unsigned int rm, reg;
+        int mode = x86_insn_modrm(state, &rm, &reg);
+
+        /* This also includes WRMSRNS; should be okay. */
+        return mode == 3 && rm == 6 && !reg;
+    }
+
+    return false;
+}
+
 static void vmx_do_extint(struct cpu_user_regs *regs)
 {
     unsigned long vector;
@@ -4513,6 +4540,17 @@ void vmx_vmexit_handler(struct cpu_user_
         }
         break;
 
+    case EXIT_REASON_RDMSRLIST:
+    case EXIT_REASON_WRMSRLIST:
+        if ( vmx_guest_x86_mode(v) != 8 || !currd->arch.cpuid->feat.msrlist )
+        {
+            ASSERT_UNREACHABLE();
+            hvm_inject_hw_exception(TRAP_invalid_op, X86_EVENT_NO_EC);
+        }
+        else if ( !hvm_emulate_one_insn(is_msrlist, "MSR list") )
+            hvm_inject_hw_exception(TRAP_gp_fault, 0);
+        break;
+
     case EXIT_REASON_VMXOFF:
     case EXIT_REASON_VMXON:
     case EXIT_REASON_VMCLEAR:
--- a/xen/arch/x86/include/asm/hvm/vmx/vmx.h
+++ b/xen/arch/x86/include/asm/hvm/vmx/vmx.h
@@ -211,6 +211,8 @@ static inline void pi_clear_sn(struct pi
 #define EXIT_REASON_XRSTORS             64
 #define EXIT_REASON_BUS_LOCK            74
 #define EXIT_REASON_NOTIFY              75
+#define EXIT_REASON_RDMSRLIST           78
+#define EXIT_REASON_WRMSRLIST           79
 /* Remember to also update VMX_PERF_EXIT_REASON_SIZE! */
 
 /*
--- a/xen/arch/x86/include/asm/msr-index.h
+++ b/xen/arch/x86/include/asm/msr-index.h
@@ -24,6 +24,8 @@
 #define  APIC_BASE_ENABLE                   (_AC(1, ULL) << 11)
 #define  APIC_BASE_ADDR_MASK                0x000ffffffffff000ULL
 
+#define MSR_BARRIER                         0x0000002f
+
 #define MSR_TEST_CTRL                       0x00000033
 #define  TEST_CTRL_SPLITLOCK_DETECT         (_AC(1, ULL) << 29)
 #define  TEST_CTRL_SPLITLOCK_DISABLE        (_AC(1, ULL) << 31)
--- a/xen/arch/x86/include/asm/perfc_defn.h
+++ b/xen/arch/x86/include/asm/perfc_defn.h
@@ -6,7 +6,7 @@ PERFCOUNTER_ARRAY(exceptions,
 
 #ifdef CONFIG_HVM
 
-#define VMX_PERF_EXIT_REASON_SIZE 76
+#define VMX_PERF_EXIT_REASON_SIZE 80
 #define VMEXIT_NPF_PERFC 143
 #define SVM_PERF_EXIT_REASON_SIZE (VMEXIT_NPF_PERFC + 1)
 PERFCOUNTER_ARRAY(vmexits,              "vmexits",
--- a/xen/arch/x86/msr.c
+++ b/xen/arch/x86/msr.c
@@ -223,6 +223,12 @@ int guest_rdmsr(struct vcpu *v, uint32_t
     case MSR_AMD_PPIN:
         goto gp_fault;
 
+    case MSR_BARRIER:
+        if ( !cp->feat.msrlist )
+            goto gp_fault;
+        *val = 0;
+        break;
+
     case MSR_IA32_FEATURE_CONTROL:
         /*
          * Architecturally, availability of this MSR is enumerated by the
@@ -493,6 +499,7 @@ int guest_wrmsr(struct vcpu *v, uint32_t
         uint64_t rsvd;
 
         /* Read-only */
+    case MSR_BARRIER:
     case MSR_IA32_PLATFORM_ID:
     case MSR_CORE_CAPABILITIES:
     case MSR_INTEL_CORE_THREAD_COUNT:
--- a/xen/arch/x86/x86_emulate/0f01.c
+++ b/xen/arch/x86/x86_emulate/0f01.c
@@ -40,6 +40,7 @@ int x86emul_0f01(struct x86_emulate_stat
     switch ( s->modrm )
     {
         unsigned long base, limit, cr0, cr0w, cr4;
+        unsigned int n;
         struct segment_register sreg;
         uint64_t msr_val;
 
@@ -54,6 +55,56 @@ int x86emul_0f01(struct x86_emulate_stat
                                 ((uint64_t)regs->r(dx) << 32) | regs->eax,
                                 ctxt);
             goto done;
+
+        case vex_f3: /* wrmsrlist */
+            vcpu_must_have(msrlist);
+            generate_exception_if(!mode_64bit(), X86_EXC_UD);
+            generate_exception_if(!mode_ring0() || (regs->r(si) & 7) ||
+                                  (regs->r(di) & 7),
+                                  X86_EXC_GP, 0);
+            fail_if(!ops->write_msr);
+            while ( regs->r(cx) )
+            {
+                n = __builtin_ffsl(regs->r(cx)) - 1;
+                if ( (rc = ops->read(x86_seg_none, regs->r(si) + n * 8,
+                                     &msr_val, 8, ctxt)) != X86EMUL_OKAY )
+                    break;
+                generate_exception_if(msr_val != (uint32_t)msr_val,
+                                      X86_EXC_GP, 0);
+                base = msr_val;
+                if ( (rc = ops->read(x86_seg_none, regs->r(di) + n * 8,
+                                     &msr_val, 8, ctxt)) != X86EMUL_OKAY ||
+                     (rc = ops->write_msr(base, msr_val, ctxt)) != X86EMUL_OKAY )
+                    break;
+                regs->r(cx) &= ~(1UL << n);
+            }
+            goto done;
+
+        case vex_f2: /* rdmsrlist */
+            vcpu_must_have(msrlist);
+            generate_exception_if(!mode_64bit(), X86_EXC_UD);
+            generate_exception_if(!mode_ring0() || (regs->r(si) & 7) ||
+                                  (regs->r(di) & 7),
+                                  X86_EXC_GP, 0);
+            fail_if(!ops->read_msr || !ops->write);
+            while ( regs->r(cx) )
+            {
+                n = __builtin_ffsl(regs->r(cx)) - 1;
+                if ( (rc = ops->read(x86_seg_none, regs->r(si) + n * 8,
+                                     &msr_val, 8, ctxt)) != X86EMUL_OKAY )
+                    break;
+                generate_exception_if(msr_val != (uint32_t)msr_val,
+                                      X86_EXC_GP, 0);
+                if ( (rc = ops->read_msr(msr_val, &msr_val,
+                                         ctxt)) != X86EMUL_OKAY ||
+                     (rc = ops->write(x86_seg_none, regs->r(di) + n * 8,
+                                      &msr_val, 8, ctxt)) != X86EMUL_OKAY )
+                    break;
+                regs->r(cx) &= ~(1UL << n);
+            }
+            if ( rc != X86EMUL_OKAY )
+                ctxt->regs->r(cx) = regs->r(cx);
+            goto done;
         }
         generate_exception(X86_EXC_UD);
 
--- a/xen/arch/x86/x86_emulate/private.h
+++ b/xen/arch/x86/x86_emulate/private.h
@@ -600,6 +600,7 @@ amd_like(const struct x86_emulate_ctxt *
 #define vcpu_has_lkgs()        (ctxt->cpuid->feat.lkgs)
 #define vcpu_has_wrmsrns()     (ctxt->cpuid->feat.wrmsrns)
 #define vcpu_has_avx_ifma()    (ctxt->cpuid->feat.avx_ifma)
+#define vcpu_has_msrlist()     (ctxt->cpuid->feat.msrlist)
 #define vcpu_has_avx_vnni_int8() (ctxt->cpuid->feat.avx_vnni_int8)
 #define vcpu_has_avx_ne_convert() (ctxt->cpuid->feat.avx_ne_convert)
 
--- a/xen/arch/x86/x86_emulate/util.c
+++ b/xen/arch/x86/x86_emulate/util.c
@@ -112,6 +112,9 @@ bool cf_check x86_insn_is_mem_access(con
         break;
 
     case X86EMUL_OPC(0x0f, 0x01):
+        /* {RD,WR}MSRLIST */
+        if ( mode_64bit() && s->modrm == 0xc6 )
+            return s->vex.pfx >= vex_f3;
         /* Cover CLZERO. */
         return (s->modrm_rm & 7) == 4 && (s->modrm_reg & 7) == 7;
     }
@@ -172,7 +175,11 @@ bool cf_check x86_insn_is_mem_write(cons
         case 0xff: /* Grp5 */
             break;
 
-        case X86EMUL_OPC(0x0f, 0x01): /* CLZERO is the odd one. */
+        case X86EMUL_OPC(0x0f, 0x01):
+            /* RDMSRLIST */
+            if ( mode_64bit() && s->modrm == 0xc6 )
+                return s->vex.pfx == vex_f2;
+            /* CLZERO is another odd one. */
             return (s->modrm_rm & 7) == 4 && (s->modrm_reg & 7) == 7;
 
         default:
--- a/xen/include/public/arch-x86/cpufeatureset.h
+++ b/xen/include/public/arch-x86/cpufeatureset.h
@@ -286,6 +286,7 @@ XEN_CPUFEATURE(FRED,         10*32+17) /
 XEN_CPUFEATURE(LKGS,         10*32+18) /*S  Load Kernel GS Base */
 XEN_CPUFEATURE(WRMSRNS,      10*32+19) /*A  WRMSR Non-Serialising */
 XEN_CPUFEATURE(AVX_IFMA,     10*32+23) /*A  AVX-IFMA Instructions */
+XEN_CPUFEATURE(MSRLIST,      10*32+27) /*   MSR list instructions */
 
 /* AMD-defined CPU features, CPUID level 0x80000021.eax, word 11 */
 XEN_CPUFEATURE(LFENCE_DISPATCH,    11*32+ 2) /*A  LFENCE always serializing */


