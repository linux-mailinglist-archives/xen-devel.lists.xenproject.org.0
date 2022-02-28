Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DA304C68D0
	for <lists+xen-devel@lfdr.de>; Mon, 28 Feb 2022 11:55:34 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.280384.478314 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nOdgb-0005cP-Hl; Mon, 28 Feb 2022 10:55:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 280384.478314; Mon, 28 Feb 2022 10:55:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nOdgb-0005a3-Db; Mon, 28 Feb 2022 10:55:25 +0000
Received: by outflank-mailman (input) for mailman id 280384;
 Mon, 28 Feb 2022 10:55:24 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=A4HT=TL=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nOdga-0005Zx-QN
 for xen-devel@lists.xenproject.org; Mon, 28 Feb 2022 10:55:24 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id edacf5ee-9884-11ec-8eba-a37418f5ba1a;
 Mon, 28 Feb 2022 11:55:23 +0100 (CET)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05lp2113.outbound.protection.outlook.com [104.47.18.113]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-11-_a3Mkq0eMPGKcom7fCeXjw-1; Mon, 28 Feb 2022 11:55:22 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by DB9PR04MB9380.eurprd04.prod.outlook.com (2603:10a6:10:368::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5017.25; Mon, 28 Feb
 2022 10:55:21 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::d479:b728:345c:bd65]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::d479:b728:345c:bd65%6]) with mapi id 15.20.5017.026; Mon, 28 Feb 2022
 10:55:20 +0000
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
X-Inumbo-ID: edacf5ee-9884-11ec-8eba-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1646045723;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=AWMAvVLUzAlPIALvxFzTyfDprfwHU18wpSDT0wk2wt0=;
	b=LtqSeVtIxP3CoBlx509DfXq3RIrDkx/ZCc+kvknz5Bte+R0cKsNwGj1YD0mYPOq1NL5wP/
	rgNcqusuXoxooB95PPrbzKpf0ZLIGeONVhAcqORcW3FKDdAi2eUgyfJdyUijg48OZ8XChK
	Ro3cNGjKSUvm6RTmFxoUB2P0XV9/oew=
X-MC-Unique: _a3Mkq0eMPGKcom7fCeXjw-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EfBxvATKfa3Gza0MUFDkrJFzdi9WJRtWmA0tHhxb2ihU8F8tf4Z4hfyNOmyttMSaz7fI/ftfJM/ZhlBD3iOuYxrMONEv5lUxGBYqJD7Ru/75rXThmkzMyQHFurGuSY0Z74rupAMoYxrI4XDYOU2EoPYNfJuyN7ganCQf3vsDkeOhyb+slFEhWjvka8VCJOwZq/ENJTy1lKZpyyaPMJh+Ln1XVnma1Txd7as/z8FgQle7HmICzSoKotQNeCiJrpJBAiBdTeTkJL0edDm/zpu5FIqpQCmdcWK0lytH8r3mwPn/ZMSBGyueePOEsKCoG8SCTnAE1pjUJbDoStm4mE753g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AWMAvVLUzAlPIALvxFzTyfDprfwHU18wpSDT0wk2wt0=;
 b=QaEuMa2RwH1z2lDu/EbJ+jdctrvbFOqqU7kFU8u1OMGJwpo7mUwJPT0gCCPWD6f8JRnLXrRWYovpMVB6kqz4LakvkMV8HuXOxGpKZYSU2g6W/MwNse8Am1J9rF6u7tRsfCPZYXO3/KdxW79mJrULNbE8fHI7ZJ5fOSgOO/MQpJ/3DhZcLUk4wB3Vh6hG7Cz6+2Al4rvzFiRFnQDZOqVJIfmfA50t6nXzWBf79cyNRCTHw3bvMcYiR4ApwWwkz1nLynHRIHSP6tje/CIU4MsuIDYiIwGpSzESHFNdJXEUsOKMJG1Gs3OnvNTi0DP3gjadVqUFxHDQ6uDLYXTh3tKwbA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <e9c810a1-47eb-6901-1a55-481a6bf4c0b7@suse.com>
Date: Mon, 28 Feb 2022 11:55:18 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
Content-Language: en-US
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH] x86/CPUID: correct FEATURESET_7d2 comment
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS9PR05CA0005.eurprd05.prod.outlook.com
 (2603:10a6:20b:488::12) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7c329dbd-6adc-4ad4-e240-08d9faa8d04c
X-MS-TrafficTypeDiagnostic: DB9PR04MB9380:EE_
X-Microsoft-Antispam-PRVS:
	<DB9PR04MB93808CD5B990070F0891F3E5B3019@DB9PR04MB9380.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	I2M7nui6BmFQdll1VV2P1zPeZyWtTRbCAnAc6W8F9pKge2aIugoOR5gFDFGIZis/8c3TrmiaMs4AhlOpt8kK7/D2RHmI4dzl8oLU9wQZQDf4uxS19rQ8dS6bMe16EPA1s+qOSUEBnJUpyxFGjkaBAARQ+UPVQ14Uj+f4Cel4wLpJoRSgU/baVR9RyAWRkRKe6NKx03cpPVxxfA9RDcTrEA2NtV+Lkdy/m48+vj/Xsz221hqFnrHxEi4Pw8Mifb7uz2sstKh7JGaN8Ab2LdAWuFkUgOXr+LReaUXY2Sn6LCyd4fJ7PrSN1vYj5SpewopffWBGRCmNmW91s1nP/jD6bOMwtpAtq3PUViPC0EXjqq14RpVgaaEBTfK3hcvzQMDEgUPMxUBbM/UwEISK9tc4ajm7EzaWkqoA4j8cYfOq4Kv2XNu+HOepCfrhxYXGFwByl7cwZnk/pPH0m6gztTEaZIiIepQ3Qhgk/3YZ9p3vPZwpSqWthX9gPQEt7jctSttW/la5W4N1SbR9vxCLFaP4slEjRTvd3caTcJJL4ASclNkanGyOnK0VQoqTbzid0OyrQa0fiwYDbCvy6HmJFqi2EAbFchBkgwEF7baiUz7+mCnt1tuk4QteR5uSEVry67kVe79vK8ETAHhDb1jvt/VEXA/QT/YqvqrqsBhObNTkVsMSllcHnjLQwEihMcYyKvmirPd0fa7AheRPEcDzH7CvtRroV3gAyLsc5q2OT6Xue+Y=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(86362001)(186003)(6506007)(6916009)(8936002)(36756003)(31686004)(6512007)(31696002)(2616005)(26005)(508600001)(54906003)(316002)(8676002)(66556008)(6486002)(66946007)(66476007)(4744005)(5660300002)(4326008)(2906002)(38100700002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MktoTktWNlJoaEtQcEx5KzVoMmRkMGZTR1E1R29MYmlNdi8xaCtEN25nZ2Ny?=
 =?utf-8?B?cEFxQ2N5ekVZdHk4UVBSeG5DTDdFczJkaytORGpJMFNKa2pWb2gvOE8xTUJW?=
 =?utf-8?B?a01QQjdJZjkzM05KeXRydVZSNngwSTNpUXFCZENwRFpOTVM2bTZtZnhvY01o?=
 =?utf-8?B?RWhmVTNWSGhLTGtTdkF6ZVMyNndlbkVMMVJlWHdRc1hYME5OdXZuQTBQdlQv?=
 =?utf-8?B?Qk5PdnZvbzc1b2FKNFc4VGwvVHVIdzN1bXJRdkRMdElZL09yTGVsVzl0R2tw?=
 =?utf-8?B?ajNiNFYyMURNVlVnamU1dEI4TllFVlM5emxJNEJwbDJZT2s4WjVOaUNsUWV6?=
 =?utf-8?B?akpEYnNFNUdzTzg3aFRHNmZ1cUpIOCszb0xrSzlXSGFrTGVkc2x1NVZ3bzhq?=
 =?utf-8?B?UXo4VU1TRXhuWEJQSGVsUFVPL1ZvWm1vOHVrSFMrci9lQmJobFJXbi9SSjFE?=
 =?utf-8?B?SjV6cXBIMmhlNjB0eGY0Mkp4TlBNdGtkNWZ0eGhRb1JFcVNEVXRGYmpwSlg0?=
 =?utf-8?B?dlhkNWlHS1Rtc1V3RGl2LzB5cmtqRU9FZDRzMUNHZ0JEbjhjSlFVMi83R1JM?=
 =?utf-8?B?dnpSV28rcENwN0dTbWZSTmlHZEV5bkRDN1dWd2hUOXIwWnZGaWtyYnpkTmVz?=
 =?utf-8?B?NFJuc1Y4aDJIbldSUzE2UTF0aVlKQWswaHlZZmg4OTUyS1AwMThPR09WODNq?=
 =?utf-8?B?a3NCRWxhaFd1UGVNNDRQK1p5K3E5c1lneGZJWjJ5V2JULzYyV1dRUGsrNUFy?=
 =?utf-8?B?KzlrVm5VVk5NZ0MzeVNiL2FNOXFGTy9iMHNzRkJVYWxaclFkR0UwMkZUbEJL?=
 =?utf-8?B?Qi83aGJyMDEvcUs2Z1FkZUZBUkh6SVo0ZnQ3dzdYT2xHdkdtR3M2OGZXWVlx?=
 =?utf-8?B?OUJqK1hvTVVtbHNtU0dmaWFRUDNvemx5blJObmdlWXRvVkF4UStjTlg1YVhB?=
 =?utf-8?B?MFVBYWw5dTdqWnFJb2pSVGkwSFNLNFEzWUdlS0p5UmxYVUhidEtlUmd1UW9I?=
 =?utf-8?B?UXpCZWUvcjhzZHZ4YmxCTlkxN3VhbGljNjdsRjVOM1I3QURvM0VmZXFsT3py?=
 =?utf-8?B?ZEl3N1J4QU1RbERzdlZENjdtR0RFVjZHRUJ1bjVucFRZSEFHdmh3ejN3b3Jl?=
 =?utf-8?B?c0RWQWcwd0cxV1p1bkdpaFpSK2FWdmRmNEttZTk0TVZ3THdpR21PMTdMNEh5?=
 =?utf-8?B?YjVqSjREK3RrRnY4TXZua0U2b3BaSVFEc3d5TFpwU2s5OUphK3BmY1BmbjZ0?=
 =?utf-8?B?b3ozMDFkNnViSVpZc1lOMEt2SlJXODNDTThYNC9sSEEvTTdpeWoyVy9nL0NH?=
 =?utf-8?B?bXlBQXhhczFoSU1IM2hqM0RTdW5DMngrMSthYnFWWkU0WHNSMW00UGFBdWc3?=
 =?utf-8?B?bVdLTHdzWG1UMjRNZCs2YWMwT3VydTR6cGQ5a2t5NkxzNEl4NGtNSXNBRWEx?=
 =?utf-8?B?bEdTdnJnbFNRL2g5TElFZkNERWk0bmEveVV2SXhFT1R0UlUzWElyTzNzempR?=
 =?utf-8?B?RW1uaTQyeFhhQVdGOGp5WWtTVFowMHpNNENvQVkydWNnK2x4YnF5bkRMUnpy?=
 =?utf-8?B?OWdIK2dCS21nOHFqbGJBeGoxbDFqVFZKSU52MDR2M0lhWFhaOU9jd3NXK29a?=
 =?utf-8?B?Z3hzMkhVY1Fna3ByakFlcFR4MkRtdThoVHM1aUdrOVV2SFFiQmhTY0t3QXJV?=
 =?utf-8?B?Mll1K2hrQSsvOE54U1NsL3FzQVFaUTJKUHp0TGYxMG1rWFE0TDNUcTc1cWRZ?=
 =?utf-8?B?V0RmNExrOVU4MitqTlhiZDRFcEJraEwrQnpJaXVidkR5YTJBRS9LaThCUDMy?=
 =?utf-8?B?M2ZNSWxyeHpoWXV5aW54UVR5SUE2enZVSVc1MERTSDNmMFNDR2w4OXZrMVVi?=
 =?utf-8?B?Q2Z4dlVyUHRScXN6MjU1V0JMWmpkTXF1RHZ4NkdpSzJRTnQ4WWhGa0kyVkNE?=
 =?utf-8?B?RUxlR1hoczZRTXJ1TzRtWUVXc0hCZXp4QWJVbG5XVzNXaXNxMmJjZ1R2WGRx?=
 =?utf-8?B?MkdISkprSzdkbGt5ODhJKzRaQ1l6ckMyOWhnNXJPbkR5SDBQRFBpQWRPa3Rw?=
 =?utf-8?B?aUdFLzBjY2F6WDlUTWdlUzNxYVhoK3lRZkdBQVd0djFDTE56YjNKQk90OHJu?=
 =?utf-8?B?eWJ5eHpYM0pTRWw1V05jcU1GSkxIOWd5QTZSRVJOaGlQS3hGUkNvMnhvMHNQ?=
 =?utf-8?Q?jJOKdeRMtv3Lvlc5tIpG5U8=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7c329dbd-6adc-4ad4-e240-08d9faa8d04c
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Feb 2022 10:55:20.7503
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SQvQCyqW2BqjfSBhficMbrSpDscoZ4MpXZk/4RQk9N/Sez+ZnjYLM4gCpssNSClbR+jkSi9UZVwpQLmqw/V3ng==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB9380

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/include/xen/lib/x86/cpuid.h
+++ b/xen/include/xen/lib/x86/cpuid.h
@@ -17,7 +17,7 @@
 #define FEATURESET_7a1   10 /* 0x00000007:1.eax    */
 #define FEATURESET_e21a  11 /* 0x80000021.eax      */
 #define FEATURESET_7b1   12 /* 0x00000007:1.ebx    */
-#define FEATURESET_7d2   13 /* 0x80000007:2.edx    */
+#define FEATURESET_7d2   13 /* 0x00000007:2.edx    */
 
 struct cpuid_leaf
 {


