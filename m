Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F1B46A8427
	for <lists+xen-devel@lfdr.de>; Thu,  2 Mar 2023 15:29:10 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.504968.777454 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pXjv1-0003Ht-5a; Thu, 02 Mar 2023 14:28:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 504968.777454; Thu, 02 Mar 2023 14:28:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pXjv1-0003EV-2S; Thu, 02 Mar 2023 14:28:27 +0000
Received: by outflank-mailman (input) for mailman id 504968;
 Thu, 02 Mar 2023 14:28:25 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=qSkR=62=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pXjuz-0003EJ-5l
 for xen-devel@lists.xenproject.org; Thu, 02 Mar 2023 14:28:25 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04on0612.outbound.protection.outlook.com
 [2a01:111:f400:fe0c::612])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7d296bf8-b906-11ed-96ad-2f268f93b82a;
 Thu, 02 Mar 2023 15:28:24 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DU2PR04MB9210.eurprd04.prod.outlook.com (2603:10a6:10:2f9::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6156.19; Thu, 2 Mar
 2023 14:28:22 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b%7]) with mapi id 15.20.6156.019; Thu, 2 Mar 2023
 14:28:22 +0000
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
X-Inumbo-ID: 7d296bf8-b906-11ed-96ad-2f268f93b82a
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=H0GDSqaVY/pX9mHYKbYDouZRGugFBxGu4C73OyS5IRNv0pFraUCL8aAxd71EUhyZsPS6YDTWU+IAdX8678d8qb1mUoCC+5BOI98HMfqnyFFmRf3rcJEBh1gvdbmCDa6aLMtF6CZrzEjSVlsWi6g6J/tW991nOHB+lOuqT6pKbdNaEs5v0tQIxiO0ApMwgwSkhznsagCZUSsvTHbdAOfe3AHaPRr0aeZthylhyeYC+JnWkTs8AMiFP5vEg09ke12IwsILzn6Q6TRHogBiYtqezpYPXYjvFHiQL/qoBYoyyTpXFHnr2OIK5NnE04o+kYnWNDm/LZZJFCMU3WnsZJhIWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kfm9uMF70+d2IOZPPQI5T/zd8bek/4f4z0JwNpGc9Rs=;
 b=hedWNQuXyJNc+G7aBxlnzToUyTNz0lvlY8gjltKRQ/BlVNXyxLFZr4dLE1bHClgHBtQk7SRp6IcdRsVFetJAIrqi0ixFtzwVKEGLWcqcGnfY2ozIRdxPyLVsQ/7ImkINzJ2cxvYbSPTNqQnOjrEnbGoaBverKawwHriI9nAppaKkgHHbK2+iq/NmgGJnec8XqDv+z8HrsaRidwh23toyUrBPggbQPqcWe80pvnTsUi6WaeURjS1EJ9pJgzxz4ne36jrdNasOeXGiHMLrMMyCGJ6xlIbwNuPoOiXbzdkYWyTbji5f0D6Ox881hEmDrkBoHnL2efYjtRZERldk/Sv3cA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kfm9uMF70+d2IOZPPQI5T/zd8bek/4f4z0JwNpGc9Rs=;
 b=w6lXEsezU/FYkcB09Vtt/4MtAkQ91f2pcd6SdgDb4EfpZ1WHuCKrKPEW5ngHyMoct6vZYNeUGrc7j2I16BRI75yCi2J7QGRwQoobM/LpDaS8Pk/Qwy+iZj4djoXGvd2wEm+jx6RHTfkEcKVkjKSfT2tDc5G+21huGl1UmfA1aMa5SRDCHNzYhOuUc4i/n+c0wVNcAGmi8oDoN0ojzvGpBTtmNVlD1voENwIFapx/bG6S5QDMPoMoaiEmQAs2u/U3Q1dcV27FAPGqJYzmVWJEThahAp9akW51ton5nPmvffxt70u+Zd2Y7l+MSX0pYLxksuzVepD8YOSVnlVhW8YzRQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <3ca5b1e3-918f-0369-4368-749bbf363cd3@suse.com>
Date: Thu, 2 Mar 2023 15:28:19 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Content-Language: en-US
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH] x86emul: rework compiler probing in the test harness
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0124.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:94::15) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|DU2PR04MB9210:EE_
X-MS-Office365-Filtering-Correlation-Id: 78122d1a-a7e4-4874-5284-08db1b2a601d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	KcHAapbCe6/u35kNAi3+H8Rmmt1Mn9OVIj4ygB9JJZaJwqlmQzXQilTfF2rj7MvQBFJMXDfAXLcZ3PIKSEGLorkR+GTmWKFCS3JHAK3vDJpufttkipfwLti/wN5Mx+q9b/LNAJyy5mi/HX7iv1XHhfAyyYmPNOG9tzDdQTDwZBcs5Nh2Tg+SeuM5QKfatU7AAbYBg9pkgnYEDGCi2MSvOHycjstcsP1PvnWJ7UOJWpMZKrev6yMI9Y1NNCzcFJPRsym7PUMVcfGudDby7Sm0CRqBh3ZnV9EkgAKIJzVZHG2yhV34mhXunQxGza8Nnetig+RqMRttkHe/h5wU4eEjlNQbcgylzydKts49BsNjIdcaCL2BA3WgNQgD01YoCgRZlEi8YJtmzk9eG+IJKteMVJ1XGLAIKJ81V9T9i+7lvGlFi8WC1mtxIo1VROBoFZ0raU1A502u6lqaffVHCr3OCvcXRUxn/YDQD7cVuKrmC3FZ1V5ScFMFmkTCPf8hm9Yvx0cU898rWp4PIWfdKYDPkrZFuyr/7MSMLzNZPia3Lp+MWXkd5uUpmwAGFsYQWeGvyVv5wVVStEY561cYMwqNTiz0WbD04nAcM/4hJucfD3eerky3Tl9KHBtD14TLHhWeiIDKDa2UiFVFSRgbVMwiUeMAzO5hXpC578svl40zyarPWtgJM3rfeJm5kCtnjnvXdzDupns4MNjbY9iBm085cRFhBBV5s+sSnd5qfP0ip+4=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(366004)(346002)(396003)(39860400002)(136003)(376002)(451199018)(31686004)(36756003)(8936002)(41300700001)(2616005)(54906003)(6512007)(66476007)(6916009)(8676002)(66556008)(66946007)(186003)(4326008)(31696002)(86362001)(2906002)(26005)(316002)(5660300002)(6506007)(6666004)(478600001)(6486002)(38100700002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VVJxOVBRNmxmSkIzTU1DTUcvVUMrbER3QkJiUnVDaGRlNEhLSnVHMGFBUDZE?=
 =?utf-8?B?cEJ2UitFeHhib05qYTRJZ1Zjdi9tVmh3cHFqRUcrRkVJeEk2V3RMYTAwaGFz?=
 =?utf-8?B?WkhLQkgwcHpBc0FuQVlXY2M1YzVMT2pHRTlza3BzcnBuc0d4aDhrMDlNRitU?=
 =?utf-8?B?V1RsSDZrRHhITHl5QmFBbUhqTFdQVUNub0dYd3EvY0dYdlYwNXlWM2Y4cjRH?=
 =?utf-8?B?R1JRZkZhT04vVmtiRWtac0pVaytPanhpR0w2aFM4MjBRcml2eHJ0RTY4UmU2?=
 =?utf-8?B?ZmhhR1hPZWIySzFuajJ2MFRXckEzNVRyZFNiRWxZU1VHbE9zaHdOOUZNMUMz?=
 =?utf-8?B?TTJBeUNVNXR2WVByam1zdDdobmtFOHZQTXF1ZTZBVm0wNzR4RlpuZjR5N2dr?=
 =?utf-8?B?bTN4OUVYU1VwWVVjY3FGeDF0SmttNWxMSElHT2ZoWkI1VXV0bVRIRFE1Y2JT?=
 =?utf-8?B?L2FOK0YrdzBkRG5EM3ovQVhCekVrV3hHVHBTeUlrWnVLT2lnSkk5bEdiamc2?=
 =?utf-8?B?aGQzT01QTWR3TC9tRFBDTVd6QWRBTlU5TmwwVzR4eVBwL0NaekRHY2hrVlEr?=
 =?utf-8?B?dXcxVTQxZlJxVzlpdTA4UVFLNlBWckh4MVVFL1c5MEYwSkF0cFkrNm9MdWZW?=
 =?utf-8?B?ZkdDMFNJNnBHa05vb2ZhVWREdXpUaytncm5KUnJ5YWxWWS8yNXdIRlUxcHZF?=
 =?utf-8?B?MXUxR1ZaZFNsTTZWQUpuZ0t6clJmRHB1Q1hMVC90ckR4NUc0bjJkMnE0ZDNV?=
 =?utf-8?B?U0JwMG5PUnMvVi9UaWY1RUZtWkU2TTdaSnBGNWx2a01ZaGNLL3NVQUJ0dXAz?=
 =?utf-8?B?ZXM5VG1TM1ZiSWRNYUpDWVVYYWg1dTRudW9qWnZwS01RSjdrYzlEa0N6LzlW?=
 =?utf-8?B?Z2ROeXZhSWhDTlJlbllNSmtLTHA3bHAvcnVZOTRjOUdOdWRFYTlvQUNOQ29j?=
 =?utf-8?B?SXdFYWx1c3dZRHpRTTNhTnJKc0pHaDJSWDlHT1BwQXZRMjk3SjRlZmwrSjJJ?=
 =?utf-8?B?Ykd0VFArSFo0SzM0bWp0VWJDTzkxVm83U1ExZE9sNFZLV2JQWTJGaEF4MTlH?=
 =?utf-8?B?L2Rkd3hzUXRYTEZheFM5ZVZBMVlwR3lSeEUyaVNKWUJGeW1oK2dkQ25BVUMx?=
 =?utf-8?B?VUFiWlJBZyt0SXBJNm9vcWV6WjBPNllCc09hdmpFNGRFbXBrZ3Q3Z2cxSXdC?=
 =?utf-8?B?aGRuVGFJdTlnODRkSTBrSTBpZXl2d21abVZ2VFJUaTBGNzlxNXBjVUlIUnZF?=
 =?utf-8?B?ZkJiSTNpRmFZcTVjQnJtNWEwR3NkeEF4ditRK2F0NHBkQWlvbzIrVU01YXNI?=
 =?utf-8?B?YUJ1Y3VBVG0xbEs5K1VPU3RLRnVkTk5lUWpkNWYyUldTUzE5UTFXeXNLZUZE?=
 =?utf-8?B?aW9wUDhwQk5mVndQQkl0bmlINVNBWmtEZWJWcVRvWFR1ZGZZeUhwTGRQeU9G?=
 =?utf-8?B?L3RDa3R6T2gzOEx2SE1BRjF0UXZmNTNmbFhCQjhabVhDU1J6N2VzSmwramdU?=
 =?utf-8?B?V3dOdGRCUk95d0NIc01FWlpjV2VrS1pCVHVIQ1RsZ2w2TjAzSzVkek4zR3Ux?=
 =?utf-8?B?cGx4akdNbGhGTXpaSE9xN1RhWE1BN2dGbXcyV0gzM1NvVnBXNlVqd1FCMnJq?=
 =?utf-8?B?L21wMnhzNEMvMHB4aVFMcDJjSXhVRmM5ZURnZ0xKSFV1R1pzLzZoS0RhakZX?=
 =?utf-8?B?MVRsSVo0VW9ES3RhRkFlWFZua3dHREJqREtCRDRsTEZlY0dXQ2NQSzZDR3V0?=
 =?utf-8?B?Rk1vVmJsaUs3MnQ4UlRSQVpKNDk3S0F6MVMwNDUvSzF1VU05TGFFR0pEWW5r?=
 =?utf-8?B?Ym9qTVVTaFlWSDFlck1nc3ZTNGM4WXRsTklLT0RqNmFMZUNoUm9CRFhjeG9Q?=
 =?utf-8?B?UXhNRHhnNDZWakpWdmtpN1MwWUJDUjJCM2puTGcxZGZjcW5FZUw0WDF1UGV1?=
 =?utf-8?B?b01vRHRJb0ZZNFVrS1hiVXUxRWE4WklXTEhnN2NKSG5NYk1YR0dPZlVPTmJw?=
 =?utf-8?B?c1QvalZ0YVNhd2o2L0lDUnhueFp1V1BRYy9yaDN1dkw5SVhBNVNwaU9EVW53?=
 =?utf-8?B?ZUtNMmVKSUx3aFdXZTk2WWdHSkcvcnFuNGFrRDVOeTZ0QTBEOXl5YmY0cHll?=
 =?utf-8?Q?iPcbJv802DNXv26R8AMfw0jfh?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 78122d1a-a7e4-4874-5284-08db1b2a601d
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Mar 2023 14:28:21.9730
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: g71NPFIXQQfPqA5UTg8YZhV4if3L6Fo8FAKEfrQS7GWvZe3JNee1E2L2rnHXx336j8eJf7TY0TQPlQ3ObVi9BA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB9210

Checking for what $(SIMD) contains was initially right, but already the
addition of $(FMA) wasn't. Later categories (correctly) weren't added.
Instead what is of interest is anything the main harness source file
uses outside of suitable #if and without resorting to .byte, as that's
the one file (containing actual tests) which has to succeed in building.
The auxiliary binary blobs we utilize may fail to build; the resulting
empty blobs are recognized and reported as "n/a" when the harness is
run.

Note that strictly speaking we'd need to probe the assembler. We assume
that a compiler knowing of a certain ISA extension is backed by an
equally capable assembler.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
A little while ago this would probably have enabled osstest to actually
build the harness. Luckily meanwhile a new enough gcc is in use there
to be unaffected by the inappropriate checking.

--- a/tools/tests/x86_emulator/Makefile
+++ b/tools/tests/x86_emulator/Makefile
@@ -104,11 +104,13 @@ TARGET-y := $(TARGET)
 
 ifeq ($(filter run%,$(MAKECMDGOALS)),)
 
-define simd-check-cc
+define isa-check-cc
 TARGET-$(shell echo 'int i;' | $(CC) -x c -c -o /dev/null -m$(1) - || echo y) :=
 endef
 
-$(foreach flavor,$(SIMD) $(FMA),$(eval $(call simd-check-cc,$(flavor))))
+ISA := bmi bmi2 tbm sse4.1 sse4.2 sse4a avx avx2 f16c
+ISA += $(addprefix avx512,f bw dq 4fmaps)
+$(foreach isa,$(ISA),$(eval $(call isa-check-cc,$(isa))))
 
 # Also explicitly check for {evex} pseudo-prefix support, which got introduced
 # only after AVX512F and some of its extensions.

