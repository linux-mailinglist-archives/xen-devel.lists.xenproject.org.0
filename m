Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A7EC4617BE
	for <lists+xen-devel@lfdr.de>; Mon, 29 Nov 2021 15:14:29 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.234576.407097 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mrhQ6-0000vy-Te; Mon, 29 Nov 2021 14:14:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 234576.407097; Mon, 29 Nov 2021 14:14:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mrhQ6-0000tK-Q9; Mon, 29 Nov 2021 14:14:14 +0000
Received: by outflank-mailman (input) for mailman id 234576;
 Mon, 29 Nov 2021 14:14:13 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=LLD+=QQ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1mrhQ5-0000tC-On
 for xen-devel@lists.xenproject.org; Mon, 29 Nov 2021 14:14:13 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a074d0e9-511e-11ec-976b-d102b41d0961;
 Mon, 29 Nov 2021 15:14:12 +0100 (CET)
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur01lp2059.outbound.protection.outlook.com [104.47.1.59]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-29-_D9rlL5fNEm3svZUeb4O1g-1; Mon, 29 Nov 2021 15:14:11 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB5741.eurprd04.prod.outlook.com (2603:10a6:803:df::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4734.23; Mon, 29 Nov
 2021 14:14:10 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe%5]) with mapi id 15.20.4734.024; Mon, 29 Nov 2021
 14:14:10 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AM7PR03CA0020.eurprd03.prod.outlook.com (2603:10a6:20b:130::30) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4734.21 via Frontend
 Transport; Mon, 29 Nov 2021 14:14:09 +0000
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
X-Inumbo-ID: a074d0e9-511e-11ec-976b-d102b41d0961
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1638195252;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=8zqj4lACxr1pCBahFuYGmCtNNgQ/IZice66D19Ean/8=;
	b=nh3TZMHcTW33JOG3CmWUCVKzfxI4o1RoHYtjImYq7/vv7DRMmK34nIV5i4ppHFrSu2yKA2
	Iw08xRrimehbHvQnetvFX7CG2tLQ9UJbD9zUfsdMRME1Zw8UYNtvXBRu2QqiSzo0wW8SuT
	apMGsImNuB30IHxoRe1bUHUq75Of2u4=
X-MC-Unique: _D9rlL5fNEm3svZUeb4O1g-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XwHddQ4UyPJcAs3dWKBZuZnKDly5IwC6FnIrDKPYeaYIiEeu8BCgGf4myzk66po0gAyW0mskyjrVenrxJmgnS54yl/61LI3EP23ymW/HoAoZ/d7fGyOPqgNRvXAd4ml1a8F4N5PHatwOHf8vdTjuSNe+iMRfavE0rhKHxUXIWlhuoN28ahPTIKUqDdua5r9jj0CSod5BkZ0pXiKaoE/v756yaXcgB37KUCzI6L8/FMZTbnTLBAgyGjKw7UqqZW/54ierCJ8soxz7K9brDUAZg9b3Ols0KEoQY4V+nSXOEdCrpUNIa4VgF2Fn3Rq02cF3KuwKl78FLvcCYsE2NN+cbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8zqj4lACxr1pCBahFuYGmCtNNgQ/IZice66D19Ean/8=;
 b=cu+RUHsNKsiuU4q8yvGkcR4QbrXmCpFlRUVjck2KxViiCpcoHa1MLatX05Z70uOpJKzZ3dlBIom0pAyj2z0N3Z6t4Ea1kF0Gf6glBHmNeIhuyHiCvsnZbkiXPcwZ3geh0uvZ4/qDQNO40c2PxCtIfM+3zWOb9/K4E+++EdL2DDjtA/UsMScvDC2tOJSWCRwAzOAlxtvSq3A9LRXwingYdX6nPolKium7h42Kev5dZJB/6WgKiaL93LluWsAeXn/FtTx7ybLBjaJyoFFpyOBOFSiNei/VY1IaqxroQKY3SlM7jr+tDKbfYD432QdPIz9AJDnomp+PTz44oD3mKbuXqg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <9d777064-f721-8594-7577-ce0cbf67c36a@suse.com>
Date: Mon, 29 Nov 2021 15:14:11 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.2
Subject: Re: [PATCH 28/65] x86/hvm: Annotate fnptr targets from hvm_funcs
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20211126123446.32324-1-andrew.cooper3@citrix.com>
 <20211126123446.32324-29-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20211126123446.32324-29-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM7PR03CA0020.eurprd03.prod.outlook.com
 (2603:10a6:20b:130::30) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a9658e12-de01-4ddf-6798-08d9b342832e
X-MS-TrafficTypeDiagnostic: VI1PR04MB5741:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB5741E767806353BCC6589F44B3669@VI1PR04MB5741.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6430;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	jM6sb/HXQs9AMKi6toVnOAnhamT3ghKwOfI3lYNQuDf953UgCTorn9Khy/4Jc3CHqpoJVLM0vD76TLHno7d5+k9QWtcEuXCCe82VUKarZGsO/KyTANbmbGfY1sswH4q7ikc8SPbUmUNgmgATJ+vrCJEH5QXz7hT2FByFgbe3UsZIX7X9FwqnpiHlhvOBk1yEQJOtmHiXQFjWUBuP/7DvURBGiwifffunJOKwM64UbkgzljuDbfOKsgaRwemZmS3AGUw3yQBkQJ6KMJwusdkkvlklke9C/FJm027joz+b7M/L13A8MnVosKQNCtGX8MdsSa9WI0OJN76FDqDcijFevlJEklwJJqBpFTZQ3V71PgFenohergmrpFcu5dDuFxhjVSC2x4/E07WpsfQXozX7HJswFmG8biyODxvlhc9PRJIy3vhU/muQuUqeKPZMa4+ME//0z4kDPOeTOfTOSbyu26SAjVptAEt7leO/IiMQ3+cxznjqnHxGmUVAP4M6w+CAvGeYls7ZJUCWUhDlKJDj4N9D9m5zgc6hqfLKHSGgpPyORSDEbNSo+rS0RoQNpk1v1P0OQH0pKRuDHJE5g0+wPKmhC5DLKwKjbyeBA+unP+PTlJMuU/V4UuZGc11Nx6GsKAqMDvbpcPSMtOTQtRk9UqQkyAajHrkoN/Kd1wydzIjiSJg638AAtPIO1dgJn0QUZFck0+TH4Dp9kRxYoJ8EPVupusmrhZRhZpKf63hyqmI=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(4744005)(53546011)(6486002)(83380400001)(5660300002)(26005)(66946007)(54906003)(8936002)(2906002)(8676002)(4326008)(66556008)(508600001)(38100700002)(86362001)(6916009)(956004)(36756003)(186003)(2616005)(31696002)(31686004)(316002)(16576012)(6666004)(66476007)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?alA2U2o3ZW9vNnhUNWhBS3dLRkF6clhoTU0ybzI2a3k3UWQ1MVZwTzJFR0Vm?=
 =?utf-8?B?TTdRazJadS93cFlna1pHd1JnWHAwMWJIaktQNDdOSXRyMFphYWZBcHdYMEth?=
 =?utf-8?B?enEzeUwyZHlXUFZTbEZlSk1qSFI4U01ZSE5RelE3OENKZFVFNEJFVFJuVURC?=
 =?utf-8?B?Q3FIQ1VKVTl3QjV3cDJ3ZUVwMmgvbU1pMEpPUzlSY0ZNd3dEQ1JEMmlaVHp4?=
 =?utf-8?B?Z3hqOFE2NEMzZnBXSEhjUkViOUdMZjRid29ib3d1KysvOWhSN0pQQTYwVjhO?=
 =?utf-8?B?eEUwL2NTbHVrZWJzbW1Vb2dCaXoyVk1vSjkreWs1V21ER3pqVDJsRisrM3Iz?=
 =?utf-8?B?Z3gya0c3Tk9MTzFnZ2ltQjNXZmdLK3BtZFI3VTErQklHUW9nQkx5ZGxqQzlG?=
 =?utf-8?B?V2lZYzBacU0zSmFadGM3NGxENm5ZNVVNRmhWT21veUNBS2VySkhtN0xObGxl?=
 =?utf-8?B?eGlvWlpaSmQ5ZXQ2V2xRb2RCTGo2SGc2anpHbG0rdGtlYU5PdVBPdmdQa2xj?=
 =?utf-8?B?dHRXcFF5M0FTcmpmSFNRQlY5YUlnZld0dDYramhJZGJRK3NDNUJUZjR5RjJD?=
 =?utf-8?B?SE95SHdmMmdFclRWVmF5QzZLNTI5eHZuN0xTc1hERkFtbEpVVXpVZ0hiQkhQ?=
 =?utf-8?B?K2k1Q3J1aHZYZkpReUFxS0h6cjJ5VFgwb3RzcFQ5b2xYZmMzQ2ttUnJVRE40?=
 =?utf-8?B?WFVWRUNOUGlPN0pFdWxvcTJIckRvaHFXZ1ZVanRPZ3pBRmpTTVFWbkZqZ3NJ?=
 =?utf-8?B?WHkwYVBPVDVPRUlJUDluaUJ0MHk0R0w4eEFqTCtuNFozRWVSaDByN0E5SUZO?=
 =?utf-8?B?MmNqc25ibHlyWjlzZS9vY3BqdllNdG9WNFJ5eWFOTFF3MjlZdUM2TlBkWjJB?=
 =?utf-8?B?RkRhUUlLWmg1Y1FzTTFrVEQ1bTg4cCttOW9Vb1FDSzFCZmxhUExJdFpKMDgy?=
 =?utf-8?B?VExhbHVWekI4c1dzbVJpS2Z3dVorZ3Z4M2M4S1VoeVBleURDZzd1R3hBZ2N3?=
 =?utf-8?B?MGM1Qk1YbVNCM0JZWHZEbUJvL3lCRlZISmJvQ2dxMTZpeU5UMVRleE9BWGdm?=
 =?utf-8?B?dVY2VWRoMlFKS2x5M1MzTVRidjRZSzgvWUNOU1BkZ3dNMm1yTjMxVVFKUVNy?=
 =?utf-8?B?N0ZGNUg3T2VXV2FYRDAwT3NVMjJRVDd5bm1VdHUwbUpqWktTdTRGd2lSL2xP?=
 =?utf-8?B?dS9HNVp0V05IU0FkNk9HdG9mRlo2T09oczRsVXp6VjgxVGpRWDc5VGpvL3Z4?=
 =?utf-8?B?ZVRuME1LRFFvWWhmNTRRQTdBbGQ4THBQMGdXb2dHODYrQy9oOTNnVVNLa1M3?=
 =?utf-8?B?aXBZby9QVVR4dGVidzRhQ0dYcVdPS1E1UG5DUXZOOGd0RnptTDNaUm9CYXJW?=
 =?utf-8?B?WHdIbG1lTUpSVGJRRm55VUhSaGdZYkZZejdiQUFGMkNQZ1pqS1h2Y1ZEYlZy?=
 =?utf-8?B?d2lOS2dSc1FTZ2dqQ3l3azIwdHNjMzIzVFFqcE9NWk9CM1JZaXQxd1hSSkZw?=
 =?utf-8?B?OVliTFBUcFV4SitKWlNMZkNWc1M3azhRemFQeEVEMys1SWp5UHQzUHVvWksy?=
 =?utf-8?B?K1Npcm93bnZSekJBNm5INTFXbmcvK0lIdjlLTDJ2ajZiTlFRSjh3eVQralpy?=
 =?utf-8?B?Zmx0Ri82Q1VkZGFsNXJvM0dsYmZlbVdwdGI5TUVzY2ZuT2c4YlIzVmp0dEZv?=
 =?utf-8?B?REVCUDRzaHB0THBHMXZxWFBPODQ5ZFRvblAybytvVUUvcWV6WTI1bkc5MXVZ?=
 =?utf-8?B?VThmOVczek9mbVg0TEREcURudEdTR1EwSnFRWmdzb0FWZjlZOTduM3E4bUF0?=
 =?utf-8?B?aGZ4bjhWb2xCQ2RVRzVqT1dwbU53RFFDR3NubEFxSFVSME1JWkFEeU1NOFJK?=
 =?utf-8?B?cnN4TXR3YzNHb0NUT1cwakhRakhYVTlLSnFHcWVxeEVpSk41ZlBlR3hhY3la?=
 =?utf-8?B?RVh1eHViV3Q0NDg0NkNzbUlsaWlsTmxmcmYxYlp2MDlYZ0ljb1FxRk9RZ3cw?=
 =?utf-8?B?bWhKVGNsRmN2eEZGNEZBRGJjV2RLWFgvcHhLTUMvQ29CZzRxR0ZKTEk0NUt3?=
 =?utf-8?B?OXRJQUNhVjB5ajA0ZzduMSt3OEpoSUdyMW9sa0pFNFJVaXpNa0dVNHFPejhT?=
 =?utf-8?B?S3FaTzJFUjJTYUNCL2thYjBldmZ1byswQXlUVEdvZ1RrR2dWajJUaTlab21F?=
 =?utf-8?Q?0ksq9wc6qYuwW6mmUi5RI5A=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a9658e12-de01-4ddf-6798-08d9b342832e
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Nov 2021 14:14:10.1424
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yguq+K7RUdVhzhv+xiVvzWEu6pu7KLbTPC2YanU9mh0HbTS+xd0PEYdBSZQ0i+8tWVHTW00oM//F7P0ElMZc2Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB5741

On 26.11.2021 13:34, Andrew Cooper wrote:
> In svm.c, make a few rearrangements.  svm_update_guest_cr() has no external
> callers so can become static, but needs moving along with svm_fpu_enter() to
> avoid a forward declaration.  Also move svm_update_guest_efer() to drop its
> forward declaration.

Sadly this means svm_fpu_leave() is now far away from svm_fpu_enter(). Can't
the two be kept together?

Jan


