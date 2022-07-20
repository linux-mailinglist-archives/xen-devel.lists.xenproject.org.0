Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C16C57B786
	for <lists+xen-devel@lfdr.de>; Wed, 20 Jul 2022 15:30:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.371776.603629 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oE9mU-0007FJ-Uy; Wed, 20 Jul 2022 13:30:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 371776.603629; Wed, 20 Jul 2022 13:30:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oE9mU-0007Cj-Qw; Wed, 20 Jul 2022 13:30:26 +0000
Received: by outflank-mailman (input) for mailman id 371776;
 Wed, 20 Jul 2022 13:30:25 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=H1QO=XZ=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1oE9mT-0007Cd-Bv
 for xen-devel@lists.xenproject.org; Wed, 20 Jul 2022 13:30:25 +0000
Received: from EUR03-VE1-obe.outbound.protection.outlook.com
 (mail-eopbgr50056.outbound.protection.outlook.com [40.107.5.56])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1bea42f0-0830-11ed-bd2d-47488cf2e6aa;
 Wed, 20 Jul 2022 15:30:24 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DB6PR04MB3272.eurprd04.prod.outlook.com (2603:10a6:6:10::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5458.18; Wed, 20 Jul
 2022 13:30:22 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::60ad:4d78:a28a:7df4]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::60ad:4d78:a28a:7df4%4]) with mapi id 15.20.5438.023; Wed, 20 Jul 2022
 13:30:22 +0000
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
X-Inumbo-ID: 1bea42f0-0830-11ed-bd2d-47488cf2e6aa
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VX3D8StgsgPxvjFwq5G4a8CnBh5u2PdpoWi9MSn+8e+ru9rryyLPs3CsNnL2Wt61Htr6vIYC/li/472LbtFZIwtNrxqCZTPteG8KPAAGdhoSybtTRaiDVVRXAqQn+85Yqi/uun+AER8h70KXKgi5gZf2yda/2ID1iERb9CesG+9TphFExqrvTja2kuJEmoBQ0czvXs4QyzFNulCzyxLux2si5w7cqXTit+NnSfjJ1RZLselgg3PyqhJ15SMMhUwhkI5mk813HqCEw7eqskZZFKg8NfTh6iYR12tpRgVTG8C5q08hYNkSoL+6YQBoAR2qQJdTxiOI3SmC6m9YIIMCUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ai2kHb5xY3mXJsaE8dKL6c2HKnZO7qf+tGSpE0LkuW8=;
 b=Eb0jbRdApBcjSZtTAvfs3tSmVyYyhVt2PNk54VRRhghusmL7E9+kGOJtDSlXHsyn3tSABapEgLZkfuZZeCb38+7+nW3bTjz3/W/2ONg4vKViyCDuwo29948n8dbPoaF+NZnEEw8Itnmz2cQjj28Ejq+MJcu0RHlgU2p9Z5D5P7RXDnd6aRu26M6uR1L+MFOnGsZ9LkNy1g5EQ+IuXVgaTR55TIR/EiziEYlqkKuR8eYQLfdqd68nFk19n3tx9IJr+pvdKvK4CjxYh9Klpbr9xFXLc3XYyk868i63Er718d7PlescAm0T3sdX+Mx/KdzsKlBR1uLHZ+CuUeoekH20sw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ai2kHb5xY3mXJsaE8dKL6c2HKnZO7qf+tGSpE0LkuW8=;
 b=VzBKL2ytXbRU58fFVzavqEi1VZoveVtSv6GtPvvEGyXI1Ej6VWqj6vR0yNzNk7JuXBBgkj5c5G78cxzOLu6P1pjUqixwGrh3a7squfJdS+3bDb+um8dBnCIfQIYwdC+QpTfMBfTdlk0yPn1EEyiaiG5cVe4YZwmnCMrxtcI3wPJSoVaHNiLmZeza/g8GP68xDuWBrh1lWPRonpASdR3nLD3Dlk2zD8kY4xm9FJPb8RSjdAP+DsnScBsIK2HvayWDXcKDB7UKMJiVkpCu+ys7tVssWGLpuiw80Yu0AFyR1fUOrDo00uV7Ko4YkoGsBpygghX4XoaP/8e4xCG3I20H0Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <c35482f1-f1a2-5326-2ecb-9e97881fab01@suse.com>
Date: Wed, 20 Jul 2022 15:30:20 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Content-Language: en-US
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 ChrisD <chris@dalessio.org>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH] x86: also suppress use of MMX insns
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM7PR04CA0012.eurprd04.prod.outlook.com
 (2603:10a6:20b:110::22) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: de63d4ab-20ae-4f42-3647-08da6a53ff4b
X-MS-TrafficTypeDiagnostic: DB6PR04MB3272:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	HZF79HSnRfPjerikhECQVxMtRSF4rxeRsXhN+Z5QXznOoEg+KY3TnzjMNQuUlR4zPQRmeyPTbiSmVg2ifKP3cXQbijNqVEKmBzezg1FPVoFpkXbQEVUbfscIUK5Dql23diL9zf0EKi8yJC5Jrx2OoSSW1j44gdeINi0wij5rVCbr2ZaLAlFe0JBZbEwnD+IVLjvhyZgOxbdEofgi/h+0/Bnf0DMykiVnXfmPF8MSYwX+dh6105gkWv862gW5SQnEFh123gGHHjgcpfQP0lfqWlAnxYg2JQQhZHCYze9K+ft0Rkpk50yOvkAMvK0NpiEWW+ywnyYKCNqV7StmhL/Lc0wUE1d+t3s2ggRv8A1ie+klJF6fzoaOgGVJGQ2aL1mchncadwYcgDMnaGWu0HiV4T4+WhTMK2lhcNOJC1T02kc9IAQEObhEk/b60lRgNmFZHLKYiKJyd4NKCxZ9Df+LvqYnpiXCTWawT7d7NYZCgQJYQ3fM/aOCQrPxZt7CqQiL2YJILGq/ktDq3EbOe6Q2+gbAcOM0gOBG8HBOeH/b/5AbVdV+eSUwLnLW53qGiAdQPVXICpu8h6gKu1Q1TpVI9ZjvcMOjb6i4nglTB2dyN4EJA7eQ8NjSK14QE6DOY1w0FgvdZbY1UB5xaVVCf0CeaelO7XXci2A7nmpttTP8j7jrlSHXx89iA+yKtlSGMrNIGpbI1Y+ves7Q2RY8lON5jbTT7yDqZbVwBd0w58TO1el4DM6IpDTv8L6srq2Fthmwh08/e59KrXwEvKV2JokMiVVq4pAZoZOKXiDqMuyfQm58RNLlPwr3bDVy1ysYZLZuImA+or3Gt4aa0AIrnMUzqA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(136003)(346002)(39860400002)(376002)(366004)(396003)(26005)(6486002)(31686004)(36756003)(8936002)(4744005)(2906002)(41300700001)(5660300002)(6506007)(31696002)(2616005)(186003)(86362001)(6916009)(54906003)(8676002)(66556008)(316002)(478600001)(66946007)(38100700002)(4326008)(66476007)(6512007)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MDhGZXV3eG9IM3oyNTMzVERRSzJ1YXF6SjAvMmdIQlBvQ3NZYXB5RWZFcldD?=
 =?utf-8?B?bi9IZ3IweVJhVXI1V3daU0o4OTR1SkdWaFJwL0xaRU1VT05qS24wK08xa2I2?=
 =?utf-8?B?VEJya1ZqWjNKQWpjMGpZcXM4Q09JV2VhK1B5OE0wTURDc0diZ1M2VUdRQkRB?=
 =?utf-8?B?MEpTclBNMlB3a0VxM1NZb21pb2x6c1dCVU9zUi9LVkRvU2IrYUtXS2F2TW1V?=
 =?utf-8?B?VkRONFE2L2FMcE9ENEdnQllpOVZKeHhXVTdrZFI1ZGVWZzNITXZxZ2wrWjVF?=
 =?utf-8?B?c29Ba2FsZGNrZTdxaUNJbVJNYUk3VUtSV2JQM1RTRHcvcjRMeXIrSk9EREQv?=
 =?utf-8?B?ZjUvYnAvTEx2bXd2UGV2OHZhK1duYWF2aEwwNnFiSVhxc0VPT1BmQWFhZXdy?=
 =?utf-8?B?bW80ODdPeWg4UWROK2VVNWtxaFhVYmJRc2lldER4aEptTkZIOUw0c2o4ZzBk?=
 =?utf-8?B?bjBCZFQxV1F2Qm9INjRKOXo1NmMxN3pCdGZvYWtEbDl5MGh1YjVYL2VkWGNY?=
 =?utf-8?B?a2hIMFZLeFoxZmlhaUtzMloyYmdJdVVJNnQ1aE9iWDlCS09MeVM5ZTF6cDQw?=
 =?utf-8?B?K0FabTNwZ1djSERRYm16M3RaUnZubHZpYy8wb1R6QTlrZ25SK3dSUFVFcGx0?=
 =?utf-8?B?K1dJb2h0QnFodm8vVGhFeXNOUjhnRTU1UDR1VXNnakFZWDU5NU51NGdyZXJG?=
 =?utf-8?B?cXNtcUlTOVIyUC94KytKU2xxc21SbytKc21sMU4vRFAyODJKSGpiaEJMblBG?=
 =?utf-8?B?ODllQ3krWlU3UkcvR2FwMXZJTVlmZHhLWlQxS3RZS0tCSXFpeVVSeVp0VWx5?=
 =?utf-8?B?MXdaeUFSV1VzaVdnVkpLWTlrbVdRZmQrVFdkRElOeDF3emNtRHUrdHZEZWhK?=
 =?utf-8?B?Tnp0WFI0RjZ0d05XakkrSlltM0RYRWtaYzNVd2h2TVlmMDE0WUlIUzVxejZD?=
 =?utf-8?B?UTFxam15QjRHY3lKdjZXdjZmNndSb3liN1kxQit2UThEMnI2RlNiU2czVW1p?=
 =?utf-8?B?Ykoxa1UzT3krUkJEWGkycmRZYWNpYzJITmVTaTNRNHJjQXppWXh0MG1kRE4r?=
 =?utf-8?B?VFpBbjdPdGh5V2UrRTJiRGVFM2gyOWhiWHBKV0kxR2xFNk84VjVIMzdETXVt?=
 =?utf-8?B?b1REYnZPNlBlc1RFSmNrL0xOUnlnTHI4OUNoVzZNOC9JSFZsdTlPdWt4Vi9l?=
 =?utf-8?B?RGFvV1ovL2k1Y1NKOTdmZFZUcVFlVkZvbTliTkF6UGZpSmhxRWxPZkw2Tk1W?=
 =?utf-8?B?R2pnRi80R2RYZ0dUS0VqTW5HUHlLaHdZTHpYNjNlVHdwbGRrVnA2Wm5pWTZC?=
 =?utf-8?B?Zjd1KzE1ZWtGQ2ZYdG1OcFk4dFlmR3U4N2lGdFhKQk1pSkRVL0JFT2NRZVRj?=
 =?utf-8?B?emJUbmhxVGpVN1FaSmlNSmtvWTNPaVpDYkZlMjVYOUxzY09xWmIxczdzamhJ?=
 =?utf-8?B?MTN3UFY5QUhMSkVwTmNwWlgzejN3bmdFeDJka09KTGREenNrdnFEUnhicXJ1?=
 =?utf-8?B?OVpZNS96cGRnTXlTNnAxczlvM04vZFM1UTBZY2V1ZnJsS2VNZndDOGRTTVZS?=
 =?utf-8?B?RUtQZ1hRcUpRY2tNTXdZWEZCd3BBeFVaMExGS25zc1pzUnhkOGlXSFhNVUNj?=
 =?utf-8?B?OUtVQUN6ZmpyRHRqeTFnZmo4cXQ0R3pUays5L3J0aGFlcENDZkZJWUNHT3lV?=
 =?utf-8?B?dnh0VEdXVVJ6R0FXS21XamlVc2wvcUIzM2xkZmZSSm9yUXd6Ny8ybkdjeWR4?=
 =?utf-8?B?MmhueXNoNWtLRlZ6YlJjM1lKSGtycEZadkZRd3FqYXpwMXpzRjFlNTg2b1Zu?=
 =?utf-8?B?WFpmSDdPdzdzN0xNQlFHcVlja1N2ZGdxYnpCL0hFTzhGUThEUjJaYXgwaHdi?=
 =?utf-8?B?NGxUcnNsWWhOVkYxZllwUFg2amdRRktyVjJlcXBJYnZoWlJmMnE5aDZJUnVt?=
 =?utf-8?B?VVRnTHNEbXlaajQ2WnFRNzM3bjl5MkZycFFVQVg0clVLWDloN2lWeXVpR3Rq?=
 =?utf-8?B?Y3VDZk5FeGhwT1MvVEMzNElYMi9TVWkyRzAwV1JlWVlCNFc2MU9GNWlrSHBh?=
 =?utf-8?B?UzNFdWdYZ2dRU0pUYjd2cHM4dVFrSEhwd1QwdEh5aUtyRjBHR0pPbjhKelVv?=
 =?utf-8?Q?OASKK4L2IzMyd3aLNcwp/kK9C?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: de63d4ab-20ae-4f42-3647-08da6a53ff4b
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jul 2022 13:30:22.5545
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tWTNI03xOAnMKviuftSQTth6+P4bIZv8v8BQVFJfxfFgkwC8HkECMI2Aw+nV0g49mDtdb9tvfF6gCMtekIfIGw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR04MB3272

Passing -mno-sse alone is not enough: The compiler may still find
(questionable) reasons to use MMX insns. In particular with gcc12 use
of MOVD+PUNPCKLDQ+MOVQ was observed in an apparent attempt to auto-
vectorize the storing of two adjacent zeroes, 32 bits each.

Reported-by: ChrisD <chris@dalessio.org>
Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/arch/x86/arch.mk
+++ b/xen/arch/x86/arch.mk
@@ -36,9 +36,9 @@ $(call cc-option-add,CFLAGS,CC,-Wa$$(com
 
 CFLAGS += -mno-red-zone -fpic
 
-# Xen doesn't use SSE interally.  If the compiler supports it, also skip the
-# SSE setup for variadic function calls.
-CFLAGS += -mno-sse $(call cc-option,$(CC),-mskip-rax-setup)
+# Xen doesn't use MMX or SSE interally.  If the compiler supports it, also skip
+# the SSE setup for variadic function calls.
+CFLAGS += -mno-mmx -mno-sse $(call cc-option,$(CC),-mskip-rax-setup)
 
 ifeq ($(CONFIG_INDIRECT_THUNK),y)
 # Compile with gcc thunk-extern, indirect-branch-register if available.

