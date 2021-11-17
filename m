Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B027454241
	for <lists+xen-devel@lfdr.de>; Wed, 17 Nov 2021 09:01:06 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.226627.391676 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mnFsC-0004Za-9u; Wed, 17 Nov 2021 08:00:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 226627.391676; Wed, 17 Nov 2021 08:00:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mnFsC-0004Xf-4t; Wed, 17 Nov 2021 08:00:52 +0000
Received: by outflank-mailman (input) for mailman id 226627;
 Wed, 17 Nov 2021 08:00:50 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Ayfn=QE=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1mnFsA-0004Ww-QJ
 for xen-devel@lists.xenproject.org; Wed, 17 Nov 2021 08:00:50 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7a939fff-477c-11ec-a9d2-d9f7a1cc8784;
 Wed, 17 Nov 2021 09:00:50 +0100 (CET)
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04lp2054.outbound.protection.outlook.com [104.47.12.54]) (Using
 TLS) by relay.mimecast.com with ESMTP id de-mta-5-YkO-zEWiOFO4iSk9FEkqKw-1;
 Wed, 17 Nov 2021 09:00:48 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VE1PR04MB6480.eurprd04.prod.outlook.com (2603:10a6:803:11d::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4690.26; Wed, 17 Nov
 2021 08:00:47 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::8062:d7cb:ca45:1898]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::8062:d7cb:ca45:1898%3]) with mapi id 15.20.4713.019; Wed, 17 Nov 2021
 08:00:47 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 FR0P281CA0058.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:49::19) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4690.8 via Frontend Transport; Wed, 17 Nov 2021 08:00:47 +0000
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
X-Inumbo-ID: 7a939fff-477c-11ec-a9d2-d9f7a1cc8784
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1637136049;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=v97bW+vQJx1D0j8h3u6Qf9S2JVDKpRDR1gplq3wrWHU=;
	b=E7TGCuYGSgDvbKO0NbgjDWSlPH2nrdJuGOk63Zo7ukM4+bsvkh0/WCUnzEoRnHIYBOnpmD
	RP/Q9Or/Ve2zmj3sLZbeRHESny6s0UeX0+LNN9x+FIFwpYOOLdTO3NNe5KLyBCiua5DMfn
	7zjnkGk9F9Dl62IBZxIyWwRCe6uceo8=
X-MC-Unique: YkO-zEWiOFO4iSk9FEkqKw-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DFQ0x6sWZeLU76k14tJMqo3PvBkrd2Ylxu4Lc2vIi06D8zVvFq/aWXxCfwEYwvjbPACtv50hWwLOqGvEVc7JZkMbtKsCZ24DFUiFmKJm58FTJBv53ismmv7oL1VCToj+SczWdKifwPIGEXmLdFR+XQC+IimvX/CAw6m3v7+1hiAuGZNGFm2atghgbNCgZFbO/LJ+TpVX7ydcXPm7DAHz3ZiC9qouoSgNF2nysLMusBK6efZ+5gYj8YsTHc+yTxqqRzk1pbHuAs3Lx/2MpTs20maRsrtUAkb1VfwBqnDknuZW6PjK7ZzjEWQruWW04o7jw5Qfh5CG56Bn4W2RLVU1aw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=v97bW+vQJx1D0j8h3u6Qf9S2JVDKpRDR1gplq3wrWHU=;
 b=g4+NnDZHpgRC5MqiadkDctY9jPQifMVMPRIz/XxcXc1KBJYpCVttcTHA/K555wppdG7+MSQbjTM9p0CpiL4I2VXa/9SRQZlCkBuQ9peQ+WSgfiZgDnk0MJnaou6H3/bYQrjNNVH0C+nhjsAO4yNFpKiN+WdeRfPp4AuK5zV1lJ2YfSnX2fI8UeqrQDzUnb+uuYul5NXeeMYkTiwly9Tani+4UlLbRFtdHdd3pRsoMT4QsYorY6QL7Ak0kwksseFxx1QTVbmbRv7z4Yyfn1O2eA10l0xT/SPxhIQMtCc3wfsc+xGQbZrxOIsQEysFzuNdGx7H7xYrCq/lbo4s6dld4Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <9b6620ae-308b-c1c9-939f-74e24c647e5b@suse.com>
Date: Wed, 17 Nov 2021 09:00:46 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: [PATCH 2/2] x86/alternatives: adjust alternative_vcall0()
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <8ef681e6-0274-7b84-494d-29d2c3b3870b@suse.com>
In-Reply-To: <8ef681e6-0274-7b84-494d-29d2c3b3870b@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0058.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:49::19) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a76ae1c3-db01-4dcb-de3c-08d9a9a05d55
X-MS-TrafficTypeDiagnostic: VE1PR04MB6480:
X-Microsoft-Antispam-PRVS:
	<VE1PR04MB64806F96EBA8B5A0B1771F7AB39A9@VE1PR04MB6480.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1227;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	ObZn8YUzsp3ssTMozwfX6U7aSyH/ZJpd4XO/gIHrigh8Kwer32POpArQC+gurmVsEdrp6iz4GDMOOzGdkg6fGyQfgHSRQFYqkmzTHut9AIOYZV1t3+P7o7JJwdn2Wxyc5yVfiwKp+VKzcM7gcAE/fzCQvG9ElXdFFEg47heNQgtLyidCxfXiCohGuJOY05BnGHvuZxEMXTSIKKUb/2n+JKDlmvbOkah2Z5MtdswD94AAqo1DJHeGrPvO15iOPq7AanEUc7zoPZXzkQBW1EaUUBSFgMNSThSkrzCOt8qrqyh9AHddrXQlg6nnJYMkxqRjl72snSTumCER+OWVm7PMZ/kLUrMZcrEogHdeqtuubE3Mjj0XmrK222/WWQtH5cyt1dyqpqlMR343s0xPutXWsH65GIXXHSSl1CVv92uOQPSKjFqeWhIAWv5ayDBWokVea7Qas4Z4bkFV9ZTNfq21eSu/x3mgvRRCFjcZ5HpFUpcyXPLx5w8lXpemX/kRTbAPNy1WEfxJjgHSu+sJsKlx1v63/ULkO9s7Qs2XwBE5dmNluw+BIgdjXvWj5PEXg+ZzV67jjndonm9DTahiK07aE+LsyVyB1bM5j6STy9gvU11cv0PBoClYXmCEe/qYS6E0+TZ3qek9iWQRihdPZYRQSdZ7ukBIc9y4ZVC8SBndmT0hQhohHh5IUyoaREOn/dZXyFM4QFFjNJpo6vv6UpKyxPxbFZYf0w8/wUm0+Ku8rLhslYyMYdd1tV7uul/lKHjr
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(4326008)(86362001)(36756003)(5660300002)(31686004)(2906002)(6486002)(54906003)(6916009)(316002)(16576012)(38100700002)(2616005)(8936002)(508600001)(956004)(66556008)(186003)(66476007)(26005)(4744005)(31696002)(8676002)(66946007)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?M1R4cVBqdmhBczh6OUV4ZFlmMjZTTWZJakJ0bEE4bVZvYzdpbXE5UktoZXM1?=
 =?utf-8?B?RXhEdWdWNExOZlBsLzBMN0YxSG1kYXB5VWtER0Zwc01JYTF5NzBaQXF6aFcz?=
 =?utf-8?B?WjEybjJUVFcrWWE4eGMrd0hLSHNqWFh2cHBBbDIra1lQa3RKc2xCTnFSQVIv?=
 =?utf-8?B?YXBhTEQ5MlFqRGZybzdDTWdSaUhIb2EwdXBFdWJxWVBGM0RVeGdlWENjdlRH?=
 =?utf-8?B?bnYrSEh6cUNLUnRWSDZYaThjbU02anRtenJxUnlRRVFxUW9WWmYrallxdEVX?=
 =?utf-8?B?RnVuMFo4LytLaC9PU3pQK3RlcFhSOFlLVmdpRjFKKzNMRmp0NnI5RllqWEVO?=
 =?utf-8?B?Yml5T0cybkorU01rY3B3V1o3UUQ0UGtvRkpkT09FdzJlS2lYTU1vZlgxdDZ5?=
 =?utf-8?B?RFZ1TUFzMG52U3p5MnVXZ2hRMDM0RVU3emRJUnM5VzJxamttM2dUMDdDVmlq?=
 =?utf-8?B?OGtCZ0lNVmp5SkZhanBOTGRvcDlmeGdpamNXZXRRNTlWV2RJTkNjNjJTT0dh?=
 =?utf-8?B?M1V4djhjL0ZQWW91b1RKM2twZlN0aXNtWlBMV2ZXVUZLNDJWRTlzNytDSENF?=
 =?utf-8?B?QmFJcGpuRkdOYzlQczBmRG5wOTlvQWVEcXJjZ1hRNlVjS1M2cE9BM05rM3N1?=
 =?utf-8?B?MFVzQ2V5QXVsNmlwbmY2ZDhIczZ3TmVCVk41TlRXQllFK2pxcmdTcGw0RXc1?=
 =?utf-8?B?OXJCVi9ySFhRdi9wMTFmeDJQN0JxbmRLMDJUM1gwaWE5NEtNWk51ZEdicklx?=
 =?utf-8?B?QkFQMDdtKzQzMXVadmx0blIxUGVlSG5aeldOMS9jS2RmUFpON0xxWkFoTklE?=
 =?utf-8?B?Vkl0bktmY3FLTlpWSGVUQVdXQUVTMExPYnZsci92ZVpjbkNwOXpUd1NjMjhw?=
 =?utf-8?B?QVFuOUNPZDVCT21jMU8vT1pTK3M2RURNdHpyZDJaNXBlUkZ2NUpGNE9hYzlm?=
 =?utf-8?B?ZjVVYVowdzBKaEdkUHJOcjFFTkQ3Ui9Sem9QR2pZRms2aDhpRFNtaTQ0cTdz?=
 =?utf-8?B?SVpyWGE3MGk0Vmt2bFR0YjIvV1l6dzdIR3RQcFJGRjk2NFQ3R05ZSFdjM0p3?=
 =?utf-8?B?d1hZTDhYOUpVTmgxeXRjUXFNRms5Tkg5ZkZOazlKQmYzcG43UXVYbG1RSUF0?=
 =?utf-8?B?c3JLaTUyTWpBdC9pbWZqRDliR2kzeDl1S0xpYncxTllJaERJd3NrbTFCazJu?=
 =?utf-8?B?ZmQrcGordVVqZ3JFWDhuUEVDbXlxUGl2N0lMWmIzRXYwazRjWFpCNEUvV3I3?=
 =?utf-8?B?MGl4MW1qek9COG1qY0dFaGhnbjNLNTV3NVNxUFNQVU1WVlpERlFpcXFvMnA1?=
 =?utf-8?B?YkdBLzRXVWZ2WmRNem13SFZ1aVhBOEU1U1BYTzBKM1JZeGZIWlE2WXAxS1pX?=
 =?utf-8?B?TVBwRnZtWjk1clB4M1pWbzJ3ODhJWUtMdVNoN2tDOGhBN0I0MjYwNmliU2hj?=
 =?utf-8?B?ZUJ3VElsQmdHUS9HV0Z5UTNGTUhCRkxqamp5K2hkcjdQUWNkdEFrS0JIbGs2?=
 =?utf-8?B?bEY0a1VCNWI4eWtnV3Q5eDlyTjdnazUyL1RTUWZCTEt4L0RlVUJDRVYxRUtp?=
 =?utf-8?B?YjluN2MzV0h2ckE5RE9Zb1VyQnhkUU9ybktQMk44cytwYVU2Vm1Db2x6OXBG?=
 =?utf-8?B?dVpFenl3T3lORWxoSEVTMFBsSlV0QnJqUDBGZ1RCVENGbncxd3dvMUozd3da?=
 =?utf-8?B?WmxXWi9UUzhhT1FXZFRTRmJWbmMrMHV2UytNMURLcHlrMWFGMGJaWTh5ZzVO?=
 =?utf-8?B?N0grQjJuRlBzTzc5ODg3Wi9Bb1pXLzFNRDVQcUpYYS9WMjRuWDd5K1dpaURF?=
 =?utf-8?B?K2VaaE96dnNqdjZTUml3WEU2cURHZ3ZCRGlUelFJaGkwRmJlQVBpNkVFcDdC?=
 =?utf-8?B?MkdYL3ZkazRxWkhQcGF6cUV3dHYzZ3JoKzgxTDRGazFvMTR0M1NOejJrd1Iw?=
 =?utf-8?B?dmFTSzVDOTBRSktuVkFMeUMzdkRHZVVDY2dNWm90TjB3NUlneVRHelUwQVlq?=
 =?utf-8?B?UFptbC9kSDBOa2tORGVhQXBRWDlyN0duNmxVSnVtMU9IMXRIbGloemZVSk9C?=
 =?utf-8?B?WUxjcDZNSGt2c043TDV2dEpGbVJab1BwL2s1UXg2T1AxY3JEVzkvcU1YQU9P?=
 =?utf-8?B?ZEgvUEttT0JKdEtJcFZ5NTVqVDlTN0xMTmRPYmx3d3Rva2ZReEtlQkNXNGl6?=
 =?utf-8?Q?65MZcXTzRnoxPdq17jgCMAM=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a76ae1c3-db01-4dcb-de3c-08d9a9a05d55
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Nov 2021 08:00:47.6425
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UaVqxcKY3TPCbci4o64p3RqRhv2T/kgJbJQbQiEHUKxPYxS4y2rcxY9EfkgjxalgZtWkNO9utMLdSXvcL2tqHQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB6480

I'm puzzled about two inconsistencies with other alternative_vcall<N>()
here: There's a check missing that the supplied function pointer is
actually pointing to a function taking no args. And there's a pointless
pair of parentheses. Correct both.

Fixes: 67d01cdb5518 ("x86: infrastructure to allow converting certain indirect calls to direct ones")
Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/include/asm-x86/alternative.h
+++ b/xen/include/asm-x86/alternative.h
@@ -218,7 +218,8 @@ extern void alternative_branches(void);
 
 #define alternative_vcall0(func) ({             \
     ALT_CALL_NO_ARG1;                           \
-    ((void)alternative_callN(0, int, func));    \
+    (void)sizeof(func());                       \
+    (void)alternative_callN(0, int, func);      \
 })
 
 #define alternative_call0(func) ({              \


