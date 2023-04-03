Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BB576D4B3F
	for <lists+xen-devel@lfdr.de>; Mon,  3 Apr 2023 16:59:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.517496.802902 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pjLe5-0000Qe-IY; Mon, 03 Apr 2023 14:58:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 517496.802902; Mon, 03 Apr 2023 14:58:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pjLe5-0000OE-FG; Mon, 03 Apr 2023 14:58:57 +0000
Received: by outflank-mailman (input) for mailman id 517496;
 Mon, 03 Apr 2023 14:58:56 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=dypz=72=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pjLe3-00066R-9z
 for xen-devel@lists.xenproject.org; Mon, 03 Apr 2023 14:58:55 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04on0630.outbound.protection.outlook.com
 [2a01:111:f400:fe0c::630])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0d7765f0-d230-11ed-85db-49a42c6b2330;
 Mon, 03 Apr 2023 16:58:54 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DU2PR04MB8760.eurprd04.prod.outlook.com (2603:10a6:10:2e3::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6254.33; Mon, 3 Apr
 2023 14:58:53 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b%6]) with mapi id 15.20.6254.033; Mon, 3 Apr 2023
 14:58:53 +0000
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
X-Inumbo-ID: 0d7765f0-d230-11ed-85db-49a42c6b2330
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GZHer3oZBf7lCanQ1VDcdXV3qZySk5bsXWZnVk5TkFgjHacTMdyseqGAoruYKmu0GsS8kQKpgY7tdLkBQhVv1G4JePTjqJjeqa1JkreHgc3fb3R8ua/1shoSzxWEVpQzzXPP39VtnnBHF29Q5b2gGTuGjH195x7HpWYoGJLiOm1eN+bVJlZKPhSburJ0LuW7oLWWiwUIFhvxlraLYs8aFd7e1qDaL3Nce2GqQ8I5MeJ9KHxjBrRCgpJk2YqYdUEcg4ds7+rQndBH0CyqMgF7Ie0O4vE0/sTphLowoJMPESrO28MOTbhXwzRYqWRlkUjn5t0pwIJVV2XQrTBozuL+3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WeVlilJaXvmgNgAfKdgiJwwyvehDZKjSOpUZTR1a6eU=;
 b=ZTwIE8L09mh/cA67hF9lWtOfzJVyl/QpZ1F1QGVEjeilZP7aOjw9QHqG3YCWBDE+LjV7ET+jxyaVGZ0qPBXJo84AtoRd7MmhoUVY88PUQhKucv0ufYUWUEutyPhYstPcFALGcbKyoBNbQH6GkqlVNYhbTpDJFkmBrLnZmf/Jf4wjDJT+yjlBOa3GCG7RcKAommwFzsyEcEXcthIt8QSz6VsiI4TAxL3gFVeTl0BAyjgan5UX5xPU0NbMVIpQXJj4nz5gz1Rwjc/eZawbiRaCp5DVS9Ymn7CmzBbt1pzXW3cjnDSZ/MmARaFggy7at35pWMGAjrH2X482TCUpp+DtoQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WeVlilJaXvmgNgAfKdgiJwwyvehDZKjSOpUZTR1a6eU=;
 b=Q2KughHdC/0ucGez9OJMQuI4UlCJ2XlnA9DHsGexkV3AFcIL8du3Va1nI4PIyFMgIaCd9qhnAJCzJaDXAoS43RRt5fRMRgdq/FO1EBX+emyEF5uby6vln/iKlvU+i43IqHcR/uLKZl0I4wHepZw0XB45Th0Cnag3ezUVbrG8b1sCajrT+iQ+sPnok7vOAty/SldzCaeC5G1MurA8Co5pukc2Wrhd1joTHLn2M5sy8X6/MIuGVYa5iPgF8jbJWR4sp+mDUiHyFMEdRrKcLuNnEMMLFa4jqrG1VY9iQVCUf4pdXkPJgJaR1OrVwb4ll/S9ap64nhNhPbKVgm7yAQ38tQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <25c100d7-fae7-5aa7-1d6e-3c06774a33f6@suse.com>
Date: Mon, 3 Apr 2023 16:58:51 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: [PATCH v2 06/10] x86emul: handle AVX512-FP16 complex multiplication
 insns
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <8cbbab55-d670-5632-30ee-3e8ca352f048@suse.com>
In-Reply-To: <8cbbab55-d670-5632-30ee-3e8ca352f048@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0055.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:4b::18) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|DU2PR04MB8760:EE_
X-MS-Office365-Filtering-Correlation-Id: 15772e1f-0528-4b4b-fe97-08db3453f0c7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Lr6vmV/SRI15F3FfKyQrwpp8VAtUxEY0HLN9cNutNLcar1DoyK3X4/oUrYHp8EuOxkuehPjjHV3J9mjimsPsBLuvG8NgaymdeYbta7ZALvFZCf6dc9zQC1958kegfsAiwghG3mwnMfQvOlAax6ojyWZgE1qIDCl0xtedEKgv3SL7bDZ0A5B+5F5iFgYRhF8m2UFcaIaVTfMYAddZFn1ek2XrvHBmIH3pDcAXEuxtVs3VjFo0lkU7fkm/kpl/x7bnhWcbWiDsVjyiz+6RssWUhX0g37MpwLNep0Smng4Ays7+CZJH/P4C2omx8KIEGEwBD+HshZj1Ib1r6GRbql8MjqDrdvtWyJm6lju/0AUKYGWZSxz5LFMbINoEWZe/ogucofslgOx1E3sLab8wnK7rPHNeYy7ZlbWLux3zuRJd7lB4yMgQ881iRGydzc9cFUeCpVJBQo7eO+8BuQkJ8YrTAdCohURTI3MLWXuGAj1PlQcpNA+0hEgQutgv1LoLBpF38vAC0IESX4R96MKLrzpIUEFS6o9gZ+zmiOf8g8OOkD9bqX0dLVbVChAHiU0MxwoBcq0CtzPp6xYrxTspYwST1rN72/4FtBnDfdQd3+zD+HY8Na1CLNR4GyrhxQqF1Yh9Lcxoelol93xfdDbbRHDM/A==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(396003)(366004)(136003)(346002)(39860400002)(376002)(451199021)(6916009)(8676002)(66476007)(4326008)(66556008)(66946007)(478600001)(316002)(54906003)(8936002)(41300700001)(38100700002)(5660300002)(186003)(2616005)(6486002)(26005)(6506007)(6512007)(86362001)(31696002)(36756003)(2906002)(31686004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WTN3dDNJWGFuZXozd1lkZVlwSEtuRHBVdWxCMGVuakE4Vm1nK3IzbjBiU2lk?=
 =?utf-8?B?YWcyVmRxUXFQbzBSZ3A5elo1ZzV2NURPTTJTVGo3REt6cENpSExjRGlzb0tW?=
 =?utf-8?B?UjFHSmtDUXZ4YkM2Uzl1NTFtSS9zTWdrQ2J2UG1aUFNoRFEzRXJ3MHNGWHl4?=
 =?utf-8?B?S2N2Wm9pOTZsc0NKamw0TkNCQWVtV1gvUGtLTkIvRVhuREkwSW5sVlhZOGYy?=
 =?utf-8?B?OEd4Tk1qaDRYUHdvSVFwUWFLT3VjR0V3dmYwWGUrRkZzSXh5RUt2YUg3ZGNR?=
 =?utf-8?B?QzBHcjZaNmIvVnAxeUcxU2JIYmF6akx0WEhNOFJVMnlBYjdEazlqdzhNbXR0?=
 =?utf-8?B?dnhXU213WFZkeEthL0dNT2dWWGJaMDJPZFdtb1VxNUFkRmhRNGkwSXFSdTdG?=
 =?utf-8?B?TlhkR1NBQjNSKzBma2tMNFJYRTNkMHd5U2oxYXk0OHpUUXZxQTdINWErdmxS?=
 =?utf-8?B?bjlVVHo3SStKblk1NlBsY0RxR09nanZpM01BZEI4cTRKcENueVBtaHZhVkhj?=
 =?utf-8?B?Z1d6VXdYYmRwQWt1N1E4a0VsZkFpaDZHeHkvd0ZISVVPQmVHVlkvTm9pRlcr?=
 =?utf-8?B?TDVNaVFtZThSbHkyaHZtRnF6cER5K0hpampKamlVejBNNE5EcWZDVFIyUkgz?=
 =?utf-8?B?Vm9aTTBNTURWUGRBTHIvOEtUcWM3b2pkQ3JIdEUyOFlWMXVpLzVzdWN0SElO?=
 =?utf-8?B?OFZnOCszbGtaUHlOd3pvSWxoVzJnZm4rTmJTVEVoaEQzaWhzMUVhbndzTnJW?=
 =?utf-8?B?Q0dWNVlTVWxiY3FPSTZVV1dUL1Ixblpwc0ZySWUvT3ZhRzI2Y2xudy9ZdzZw?=
 =?utf-8?B?c1lIL2ZpaXFiZmQ2cnJpamduZUNLTmxWejg3VERhL0F0ai9zRkFpZnY0TkFj?=
 =?utf-8?B?TnhpdVhCQloycHFmOW9FSjZzTDRVYkRyRHJEZDBHTFFjbFZKQWd4Z0JXR2d4?=
 =?utf-8?B?MEhUYmdCS1JZNDJXcWIzakhma1U1djhZUU4wUGgzZ0lyL20rNHZVV1ZCUWk3?=
 =?utf-8?B?SmZHT212V29TL2g4NEpsZ3hNejVGLy9rTWF2SHpRZ2twOG1xa2w5aEJBMjFQ?=
 =?utf-8?B?NDQzN0JTQWNVZ0lkMXJ5RHQxS3MyQS9BWStzWDhsZzlqL0xuZUFzditrSmtW?=
 =?utf-8?B?M0NHT2FzVVpLaHpCdTZmOGdyREx4d2tyeU10L3B1UkpzbGNscDBOYzFuaExG?=
 =?utf-8?B?SjZUTGZkemNuZFhDU1JvUWlYR3cvR1VmVUlZV1B2WDljaUtUU3djSENjSFVh?=
 =?utf-8?B?T280TEZ5SXlpRzQvN1JGZjZxZVJZRlIwTDNUN3R3bXRpaWI0STVHVmR3LzBO?=
 =?utf-8?B?UXJJVWhXMWYzRjE4RUxOaVFJeXdnS3lQaXR1MVluQUZSN1JsZ21LU21WSmQ2?=
 =?utf-8?B?N1FZZk5BRzlaL1V0NTI5REtRQkdCWWEyaStxRnZrYm9WdFB3MzVnN0JYUDZq?=
 =?utf-8?B?U0NRZy95Y0NNYmFuanZRUVFmVElHN2xnZmtPRVJPU1lZUFM0YXQvTjduMjZ5?=
 =?utf-8?B?OHlIUSsyQkhNTmVWdlNFY2JBYU92bEdISWVkeU4wMEdLZFBxS0VjZ3ByWnp3?=
 =?utf-8?B?dnZ0Zjg2VmVMZm8yZ3VkZFU1VnhTYWdiMFREbzNFZ2NWZExDUlVXanVaMHZj?=
 =?utf-8?B?cUtlZnVSVTZMZytVK2RSVEJ5Zy8zeTdOSE9uOW9hNUprZFVZbWlFQ3k0dTJs?=
 =?utf-8?B?UHRhL0J2MTVoUU1NVEczZ3lWeERFVGpOZEYvR25yZ2J2Y0w4UVZyNGVoS3RL?=
 =?utf-8?B?b2lCU0RQcGxza2FtbStqL1hob0R3ZFdZS1BQclp5a1ZnUmVVdXkrSll1TzJN?=
 =?utf-8?B?empBdFI0Q2dIeW9BRU9BaXcxNTNJempQcVVGazZQV3Y3WjhEajZsRjQ0Y2dD?=
 =?utf-8?B?Q1c0bGRHWW8yckhjb1ZRMitlNzVlbmdrUURPczg2SDdydklOVmRYMmx3NVY0?=
 =?utf-8?B?TGF0OGdiR0czcXMwL2xtL3djUlJERTQxb29Kb2ZBWEFGT2lPNFdlbmYzNTE1?=
 =?utf-8?B?MlVBUmsxRU1kajk4YnhzdjVJUzcvWVBzeVVzMTBzSmdKNHRYeS9BZWJrYWF4?=
 =?utf-8?B?RFpCNThxR1FRdzVWSVVVTnE0ZWhaWnBDSEJPOEprTnl3VHhiZUF1WnB1RnZv?=
 =?utf-8?Q?D0K7e2lCTDSF6OGOsayxzOjGH?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 15772e1f-0528-4b4b-fe97-08db3453f0c7
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Apr 2023 14:58:53.1131
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: B6UULQsSi7mTUNiwDQAHEc20BBkBIHgMVVZqT5PX9/wk/EvpkS6aTfve4DFD6/g/psa0BRP3MTaoneKFH1bN2w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB8760

Aspects to consider are that these have 32-bit element size (pairs of
FP16) and that there are restrictions on the registers valid to use.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>

--- a/tools/tests/x86_emulator/evex-disp8.c
+++ b/tools/tests/x86_emulator/evex-disp8.c
@@ -614,12 +614,18 @@ static const struct test avx512_fp16_all
     INSN(comish,          , map5, 2f,    el, fp16, el),
     INSN(divph,           , map5, 5e,    vl, fp16, vl),
     INSN(divsh,         f3, map5, 5e,    el, fp16, el),
+    INSNX(fcmaddcph,    f2, map6, 56, 1, vl,    d, vl),
+    INSNX(fcmaddcsh,    f2, map6, 57, 1, el,    d, el),
+    INSNX(fcmulcph,     f2, map6, d6, 1, vl,    d, vl),
+    INSNX(fcmulcsh,     f2, map6, d7, 1, el,    d, el),
     INSN(fmadd132ph,    66, map6, 98,    vl, fp16, vl),
     INSN(fmadd132sh,    66, map6, 99,    el, fp16, el),
     INSN(fmadd213ph,    66, map6, a8,    vl, fp16, vl),
     INSN(fmadd213sh,    66, map6, a9,    el, fp16, el),
     INSN(fmadd231ph,    66, map6, b8,    vl, fp16, vl),
     INSN(fmadd231sh,    66, map6, b9,    el, fp16, el),
+    INSNX(fmaddcph,     f3, map6, 56, 1, vl,    d, vl),
+    INSNX(fmaddcsh,     f3, map6, 57, 1, el,    d, el),
     INSN(fmaddsub132ph, 66, map6, 96,    vl, fp16, vl),
     INSN(fmaddsub213ph, 66, map6, a6,    vl, fp16, vl),
     INSN(fmaddsub231ph, 66, map6, b6,    vl, fp16, vl),
@@ -632,6 +638,8 @@ static const struct test avx512_fp16_all
     INSN(fmsubadd132ph, 66, map6, 97,    vl, fp16, vl),
     INSN(fmsubadd213ph, 66, map6, a7,    vl, fp16, vl),
     INSN(fmsubadd231ph, 66, map6, b7,    vl, fp16, vl),
+    INSNX(fmulcph,      f3, map6, d6, 1, vl,    d, vl),
+    INSNX(fmulcsh,      f3, map6, d7, 1, el,    d, el),
     INSN(fnmadd132ph,   66, map6, 9c,    vl, fp16, vl),
     INSN(fnmadd132sh,   66, map6, 9d,    el, fp16, el),
     INSN(fnmadd213ph,   66, map6, ac,    vl, fp16, vl),
--- a/tools/tests/x86_emulator/predicates.c
+++ b/tools/tests/x86_emulator/predicates.c
@@ -2058,6 +2058,10 @@ static const struct evex {
     { { 0x4d }, 2, T, R, pfx_66, W0, LIG }, /* vrcpsh */
     { { 0x4e }, 2, T, R, pfx_66, W0, Ln }, /* vrsqrtph */
     { { 0x4f }, 2, T, R, pfx_66, W0, LIG }, /* vrsqrtsh */
+    { { 0x56 }, 2, T, R, pfx_f3, W0, Ln }, /* vfmaddcph */
+    { { 0x56 }, 2, T, R, pfx_f2, W0, Ln }, /* vfcmaddcph */
+    { { 0x57 }, 2, T, R, pfx_f3, W0, LIG }, /* vfmaddcsh */
+    { { 0x57 }, 2, T, R, pfx_f2, W0, LIG }, /* vfcmaddcsh */
     { { 0x96 }, 2, T, R, pfx_66, W0, Ln }, /* vfmaddsub132ph */
     { { 0x97 }, 2, T, R, pfx_66, W0, Ln }, /* vfmsubadd132ph */
     { { 0x98 }, 2, T, R, pfx_66, W0, Ln }, /* vfmadd132ph */
@@ -2088,6 +2092,10 @@ static const struct evex {
     { { 0xbd }, 2, T, R, pfx_66, W0, LIG }, /* vfnmadd231sh */
     { { 0xbe }, 2, T, R, pfx_66, W0, Ln }, /* vfnmsub231ph */
     { { 0xbf }, 2, T, R, pfx_66, W0, LIG }, /* vfnmsub231sh */
+    { { 0xd6 }, 2, T, R, pfx_f3, W0, Ln }, /* vfmulcph */
+    { { 0xd6 }, 2, T, R, pfx_f2, W0, Ln }, /* vfcmulcph */
+    { { 0xd7 }, 2, T, R, pfx_f3, W0, LIG }, /* vfmulcsh */
+    { { 0xd7 }, 2, T, R, pfx_f2, W0, LIG }, /* vfcmulcsh */
 };
 
 static const struct {
--- a/xen/arch/x86/x86_emulate/decode.c
+++ b/xen/arch/x86/x86_emulate/decode.c
@@ -379,6 +379,8 @@ static const struct ext0f38_table {
     [0x4f] = { .simd_size = simd_scalar_vexw, .d8s = d8s_dq },
     [0x50 ... 0x53] = { .simd_size = simd_packed_int, .d8s = d8s_vl },
     [0x54 ... 0x55] = { .simd_size = simd_packed_int, .two_op = 1, .d8s = d8s_vl },
+    [0x56] = { .simd_size = simd_other, .d8s = d8s_vl },
+    [0x57] = { .simd_size = simd_scalar_vexw, .d8s = d8s_dq },
     [0x58] = { .simd_size = simd_other, .two_op = 1, .d8s = 2 },
     [0x59] = { .simd_size = simd_other, .two_op = 1, .d8s = 3 },
     [0x5a] = { .simd_size = simd_128, .two_op = 1, .d8s = 4 },
@@ -441,6 +443,8 @@ static const struct ext0f38_table {
     [0xcc] = { .simd_size = simd_packed_fp, .two_op = 1, .d8s = d8s_vl },
     [0xcd] = { .simd_size = simd_scalar_vexw, .d8s = d8s_dq },
     [0xcf] = { .simd_size = simd_packed_int, .d8s = d8s_vl },
+    [0xd6] = { .simd_size = simd_other, .d8s = d8s_vl },
+    [0xd7] = { .simd_size = simd_scalar_vexw, .d8s = d8s_dq },
     [0xdb] = { .simd_size = simd_packed_int, .two_op = 1 },
     [0xdc ... 0xdf] = { .simd_size = simd_packed_int, .d8s = d8s_vl },
     [0xf0] = { .two_op = 1 },
@@ -1515,6 +1519,10 @@ int x86emul_decode(struct x86_emulate_st
                 if ( s->evex.pfx == vex_66 )
                     s->fp16 = true;
                 break;
+
+            case 0x56: case 0x57: /* vf{,c}maddc{p,s}h */
+            case 0xd6: case 0xd7: /* vf{,c}mulc{p,s}h */
+                break;
             }
 
             disp8scale = decode_disp8scale(ext0f38_table[b].d8s, s);
--- a/xen/arch/x86/x86_emulate/x86_emulate.c
+++ b/xen/arch/x86/x86_emulate/x86_emulate.c
@@ -7838,6 +7838,34 @@ x86_emulate(
         avx512_vlen_check(true);
         goto simd_zmm;
 
+    case X86EMUL_OPC_EVEX_F3(6, 0x56): /* vfmaddcph [xyz]mm/mem,[xyz]mm,[xyz]mm{k} */
+    case X86EMUL_OPC_EVEX_F2(6, 0x56): /* vfcmaddcph [xyz]mm/mem,[xyz]mm,[xyz]mm{k} */
+    case X86EMUL_OPC_EVEX_F3(6, 0xd6): /* vfmulcph [xyz]mm/mem,[xyz]mm,[xyz]mm{k} */
+    case X86EMUL_OPC_EVEX_F2(6, 0xd6): /* vfcmulcph [xyz]mm/mem,[xyz]mm,[xyz]mm{k} */
+        op_bytes = 16 << evex.lr;
+        /* fall through */
+    case X86EMUL_OPC_EVEX_F3(6, 0x57): /* vfmaddcsh xmm/m16,xmm,xmm{k} */
+    case X86EMUL_OPC_EVEX_F2(6, 0x57): /* vfcmaddcsh xmm/m16,xmm,xmm{k} */
+    case X86EMUL_OPC_EVEX_F3(6, 0xd7): /* vfmulcsh xmm/m16,xmm,xmm{k} */
+    case X86EMUL_OPC_EVEX_F2(6, 0xd7): /* vfcmulcsh xmm/m16,xmm,xmm{k} */
+    {
+        unsigned int src1 = ~evex.reg;
+
+        host_and_vcpu_must_have(avx512_fp16);
+        generate_exception_if(evex.w || ((b & 1) && ea.type != OP_REG && evex.brs),
+                              EXC_UD);
+        if ( mode_64bit() )
+            src1 = (src1 & 0xf) | (!evex.RX << 4);
+        else
+            src1 &= 7;
+        generate_exception_if(modrm_reg == src1 ||
+                              (ea.type != OP_MEM && modrm_reg == modrm_rm),
+                              EXC_UD);
+        if ( ea.type != OP_REG || (b & 1) || !evex.brs )
+            avx512_vlen_check(!(b & 1));
+        goto simd_zmm;
+    }
+
     case X86EMUL_OPC_XOP(08, 0x85): /* vpmacssww xmm,xmm/m128,xmm,xmm */
     case X86EMUL_OPC_XOP(08, 0x86): /* vpmacsswd xmm,xmm/m128,xmm,xmm */
     case X86EMUL_OPC_XOP(08, 0x87): /* vpmacssdql xmm,xmm/m128,xmm,xmm */


