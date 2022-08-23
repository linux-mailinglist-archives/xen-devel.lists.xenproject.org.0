Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 59E5C59D164
	for <lists+xen-devel@lfdr.de>; Tue, 23 Aug 2022 08:42:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.391684.629613 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oQNc7-0006CH-Aj; Tue, 23 Aug 2022 06:42:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 391684.629613; Tue, 23 Aug 2022 06:42:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oQNc7-00068y-6j; Tue, 23 Aug 2022 06:42:15 +0000
Received: by outflank-mailman (input) for mailman id 391684;
 Tue, 23 Aug 2022 06:42:13 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=TRIX=Y3=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1oQNc5-00068q-Eg
 for xen-devel@lists.xenproject.org; Tue, 23 Aug 2022 06:42:13 +0000
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 (mail-eopbgr150043.outbound.protection.outlook.com [40.107.15.43])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b6a94b7d-22ae-11ed-bd2e-47488cf2e6aa;
 Tue, 23 Aug 2022 08:42:12 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by PA4PR04MB7566.eurprd04.prod.outlook.com (2603:10a6:102:f0::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5546.22; Tue, 23 Aug
 2022 06:42:08 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2d5d:bae0:430f:70ad]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2d5d:bae0:430f:70ad%4]) with mapi id 15.20.5546.024; Tue, 23 Aug 2022
 06:42:08 +0000
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
X-Inumbo-ID: b6a94b7d-22ae-11ed-bd2e-47488cf2e6aa
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=f1hnIrpIsINeEBB+Rorp4W4bnWuwXX/UGxmY7WLvulgYTezmglfUnlmqmfxhcIyeqDws8MSugwVNHjiaB178Iw6bIHqaGKAUtRRTauNt3dgM11QHNR7Jz/4Glmp7AR7845gJTkZz6rFhhxBbbmUqGDqmmtJMCZ1ysR2NqggW5Pp19gQEwraCIdZ/itI23MU/z7HcPtG3FD9WYBSuheqAHwiwnYu/i2goVTjJofnoob09N4gkOMR75q0a9Ik6mHX5AKWfl73TeQVKbjqXqV5ZZLmjIcqc8b2mrOOV/9TgEhwOhsMu42pla762M3jAj0kW8fm/fVPwt2zOrJZsXh5XdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PeyNdVHIMsRcEMFZol+09wsslgm7WcGos5XT+veVb0o=;
 b=CiH7lgUwgy0vHYm/u4/jMkWBAfRsmw3v1Ndyt46PqRIvwwHkB3yxqyYGx5Si+q8RpExY4CGkbM1Av5Fq037T0WjE1Y2/VEBguqcTO3BllENuE+xawcYkZQHBngv/DDXt+pNRPiZXXfxLLRn7k/O6Nst5bHqCh+Q5lCGnpJGlpxIwRmQFH6heXD/SyR7chs3El3CHkguetoMkZx98GYkBlgeRIAjHEpt3lVP/LhNM/0uNbd9GXtTuecU8/f6OO2Mf22insspCg1kxsoC7s1Y7K9Yoy1wyJdiZOImcEEZ/28K3TD/0AyCNMxZO9NmBSLqYCAXWnEgHiDXbP6mHjHq8ug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PeyNdVHIMsRcEMFZol+09wsslgm7WcGos5XT+veVb0o=;
 b=g7oyboje0NoMyuOtvUlERmK/mJENsBZru7CnKKEjd899/7eAjA0lLnHMuG3K4Bw0Zd6LUWiPi81cEPjJpyLUUkAOzSpW85UhK0ZwPr85pxoiWi2X7Z8oBwhK/oD1dwhf+oEUYO/btU60PUZ9ZjTaeXZJ5UOTiBzxNCVkgJRlFpbhTYAqd7Ck/IIDrxjMfdDOyEKu/3qYkA9OGNlmau4xKPNPTiQgIhHI9U8M2w/wKJVrhpHNbXtpbhGCavxWy5vjk/6YOVyoDfDPz3zVdrDqc7KCwFRJ51SwLaarKzstUENy/mQV3HuvD9J+Oq2sNNUNTCX0k8841oqZT4E5QlW4XA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <a4ec41e6-16cd-4452-19c1-5d6d9e3bddf8@suse.com>
Date: Tue, 23 Aug 2022 08:42:06 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Content-Language: en-US
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH] x86/CPUID: surface suitable value in EBX of XSTATE subleaf 1
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS9PR04CA0095.eurprd04.prod.outlook.com
 (2603:10a6:20b:50e::7) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 756c7ca0-2efc-4ba2-fb8c-08da84d2999d
X-MS-TrafficTypeDiagnostic: PA4PR04MB7566:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	ung1rWT5gpj+Zl5/iqf+ZXq3xr0nvlwcRhLQn0ueIMgwPcyT09YeU8J22ib+QA6s9ZeBzhlVdtCSwgHVCqSPWG/7yTHDNESXywT/3Lvt37jaglhlqIYYAOKQNGXg2mbCwlrqUmM/IfOiGY67gAa2b+Qz2VvOF9wHntqJFLpMhyPU0z4zroVE7Ze+a/TkJZOKZbEwAolTBMHB0fcKLOTrsuRDzrBkofwpNu/I2EbhqDW+an5rs0/tmn/jvzj+e+vg/Sn2HVw6qDzGmkcXCmhxM90Lg0hSqjl8pOBBWflvCOumXE6jmYVt3b+a+cnZpdWW6L0KjIWwWw8iztI4a72WPqju2hEC7tU5AnSk9DNtjBGOrosus0LwvHY7tXXyQD70fh7n5/dd+nDHWzan7cv/aNZ8GAXkhD4xEOgTqUchKesfcm0caIsXvBoPd5Nj3SxcS/pBc4N4OvTCMTawvj/ALZ3IsqZyXB7wkm7EvjiYKwcqsWGlMGrT3mL7Wu25vxzABk1ZcytvCCRxy8qqLRhofCserXtpcKCHP64Ij1k8k+7eyzCTdcQltW5IOT26vsvy45dTMFPBBNBUaPSrcs0aheGeFgcKUJ8JPRxhhDUzDBX8kgqJRBSfJc2Hs0tph7XdrsFcSMldj7mo6pYMtdzy63i6/TZ8rZS57zUwubrpAlCXuYd9yKx0jVyzyXRwY9WUA7tY4R7keXgldxA5AqoY66OEhlMFCMEKaxZkFpDy8eHI/ppqcxOn7P+jzv3aHCOUr3Mt9e/LCkCkJIz3R68M89H1SoMX1UYML8U1VvVeRxU=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(376002)(346002)(366004)(39860400002)(136003)(396003)(66476007)(54906003)(66946007)(8676002)(6916009)(31696002)(4326008)(86362001)(66556008)(6506007)(316002)(6512007)(26005)(2616005)(186003)(83380400001)(6486002)(5660300002)(478600001)(41300700001)(8936002)(31686004)(2906002)(38100700002)(36756003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?OXNHaGUvdFFQeEE4a1hSQlVoUHF4Tkprd0xZeVlGbmlzdndpSlVjRGJkMU9Z?=
 =?utf-8?B?d3VKQ1NNWGFKZENNZE5oUG84bG9WaVdyQk1icnd6S05ORFVja1dLMFBKRnpo?=
 =?utf-8?B?V0l1RXZoVW5ObDRFOVNsZGU1dmJqMFZFTDF3NU5HU1JwSFBDSlVOODE2ODhY?=
 =?utf-8?B?RWVSaStFaWhZWGQzZUxuTWp0YTkzcnFXcm81QUlOVXpGVHUrc3owNFNIa3hw?=
 =?utf-8?B?SjV4R3UzNkJ1YkNJY0hoVTZLc1lRUzVGdkF0NEcyYkZ1TmNIOEhXQjViWGdY?=
 =?utf-8?B?c1BXV0pNZ0hPTHljVW1Fd3ZPT09UcFowVEFFcVFGZXhqTHM0WWpmVjlkRjRo?=
 =?utf-8?B?Y1cvVjRsMmQ2bnZNV1didEtJZ1FJS29zaG4wb2xNS3M2d29CdkdvK0ZmTHp6?=
 =?utf-8?B?Mm9qVllMbUttWDI3OFI4ZVdiWFU1UjJ2YTNRQ3hpUjJBMHcyZnVtQ0RvWTRP?=
 =?utf-8?B?ZjdrbUZoWHd2WE44L3YydEFreW1DUGpLMmVJS0w3T1pzU2RHTHBTOVg2SEZk?=
 =?utf-8?B?WG5VSUF2dWJaTldxeU5FcUJBcXE0dmw0d1kzM2NVUVdhbmg1ME1MQ05FRC9L?=
 =?utf-8?B?UnZaRC9zWFAyVGh0U21MWXRibVA0cXBBZXJOYXhBcFpIQ2JWTHpCVmNDSWE5?=
 =?utf-8?B?RWhIRG80N05EVHZYNCtNUEQwVFpITkREc3dZTTg1S0M4SytWNHI5NkwzajBW?=
 =?utf-8?B?NjBGSjN6NGZLV1RBODRPaUFTbHJLbXVVN1MvTy9VUDJSZHF3Ny8rempCenEv?=
 =?utf-8?B?SUtKMnEvSUUwYzFseFJha1F1cWo3Q01OdVZnUzZYWDAwcGZkaUhjSnFVVHA3?=
 =?utf-8?B?SURya2ZzajJLTHRvUEpLV2hhdm90dlRHcGNvU3ZsWm9GQ01IV3lMY0xRNUJX?=
 =?utf-8?B?TlhKdVNQaGFuS1puZVhoRWNxKzFUWVZwWllBMlpOTjRvV1FkVjliVmVIMzlu?=
 =?utf-8?B?R0c2d2NHb0J1QWo1Vm1XOHdjSEpJc3JFV1dYRkdHdzBod0NTS2tZZkhoYldz?=
 =?utf-8?B?RFdjNmlBMjNQd2M5SUwxRk11RDBkcmpWVzNWUmxzVHl0Zk5CSUxCaSt4Qkdi?=
 =?utf-8?B?OGNTZEVPb3VYYUtBaWtkWVdFcnRnU2wyYTVTOHVSNmllaEVnSmdBb0xta21C?=
 =?utf-8?B?dlB3ODZibjQ2NFkvRE1lUWE4OWxGazZnRWorU3NFblpNTzhhWXRkOG01UlQ4?=
 =?utf-8?B?aU5NZkwwYVpCUjM5MWowbkFvdTBCZ0pNL0p0QVg2WjF4TFdaZWJ3ejdyZkFN?=
 =?utf-8?B?NmVMQ2pIM2lhNE5lNVFHeVFlTjRkTEk0YU5JMkZKOE5QUm10US9YMGFQakpV?=
 =?utf-8?B?QkQ0VEZJRCt1WkptQk1YRkE0THl0aTNoRkZ4U3hjRVlhTnJpT2F5cVNtelRR?=
 =?utf-8?B?VEZLMk1NTXFTNnBsWTdERW1ZWkUrV1pYSFl5YzVGN2M2UlZzQU9NOHBoK2pU?=
 =?utf-8?B?K0pqMkFUdEprOGJtODNJTGM2RGQ1dHk1N0Z6SDgwOVg5YlQ1Z2dYcW9ZcHpp?=
 =?utf-8?B?NUpJNEdWYWkzVkpkWU0zOFFnU3hWYnArSjZzZ3FvajRDZEYyWGFNTzdOeGxv?=
 =?utf-8?B?OUZTYlBIMHFmak9FazltaUg4cXd6SThKTVE3NG1iZVBIUU5uRkoxb2xOTDhw?=
 =?utf-8?B?TnU2ZUR4ZG5UVGFoalVUVHRUeTJlQS9WYVlTSWhDSzFseHVyQ3Bmc0JGWGFw?=
 =?utf-8?B?YUlSR3E0TXF1ek5PTThEdVBnNE9yVFhNNXE5WG9ZeTNvWlp2SEpvUjc5UmtJ?=
 =?utf-8?B?T1BkMFZSTFN5aGZ4N3dqN0RtUHN4U0xzS0VnZGJYSXptZGpvbjdvQUVUdVBM?=
 =?utf-8?B?SU9ZejljSTRtUE5mbmVDYkh2bXpUVnZaK25MWkFFNm50SVdsMXFZQ1B3M29W?=
 =?utf-8?B?bGFJN0JudUp6bXJHeVZkRndjRk9LTFhOSjM0LzBFcnpCSDNYTmQzVXZGZTI2?=
 =?utf-8?B?dzI2cmcvb2lvVDYyYk0wRXBNUGdCWnhNUE83WFJqQVBVbWJEblN5VTZxOEMz?=
 =?utf-8?B?Vy9sQXRKNk5FNzgwZTZyK2d0eHV3dkxIY2ZFdTlRS2x2WDNyaGFsOHFDRGVP?=
 =?utf-8?B?RDZBL2wxM2toZFpZQ1ovNW1lMEdtVTVNTGt6UEMzU2RsNitBWmJPSGRXbGNq?=
 =?utf-8?Q?lfrf7JJ+C+X+qZkhC5KcvmnMK?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 756c7ca0-2efc-4ba2-fb8c-08da84d2999d
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Aug 2022 06:42:08.3018
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0U31/7rRIugmGlPW/qxSIiqAezTCspsq/hY1SaKU6MuXzdBdEHE1tx95p597fGJbI+q0F2O19pl/LBjSM+gADA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB7566

While the SDM isn't very clear about this, our present behavior make
Linux 5.19 unhappy. As of commit 8ad7e8f69695 ("x86/fpu/xsave: Support
XSAVEC in the kernel") they're using this CPUID output also to size
the compacted area used by XSAVEC. Getting back zero there isn't really
liked, yet fpr PV that's the default on capable hardware: XSAVES isn't
exposed to PV domains.

Considering that the size reported is that of the compacted save area,
I view Linux'es assumption as appropriate (short of the SDM properly
considering the case). Therefore we need to populate the field also when
only XSAVEC is supported for a guest.

Fixes: 460b9a4b3630 ("x86/xsaves: enable xsaves/xrstors for hvm guest")
Fixes: 8d050ed1097c ("x86: don't expose XSAVES capability to PV guests")
Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
I actually wonder why we surface the XSAVES feature bit to HVM domains,
when we don't support any of the features. It's solely because of this
that by default only PV domains are affected by the issue (HVM would be
affected only when XSAVES was hidden via guest config settings).
Wouldn't we better mask the bit (e.g. in recalculate_xstate()) when we
find that no features requiring XSAVES are visible to the domain? That
would likely come closer to real hardware, which pretty certainly won't
offer XSAVES without also offering at least one dependent feature.

--- a/xen/arch/x86/cpuid.c
+++ b/xen/arch/x86/cpuid.c
@@ -1142,7 +1142,7 @@ void guest_cpuid(const struct vcpu *v, u
         switch ( subleaf )
         {
         case 1:
-            if ( p->xstate.xsaves )
+            if ( p->xstate.xsavec || p->xstate.xsaves )
             {
                 /*
                  * TODO: Figure out what to do for XSS state.  VT-x manages

