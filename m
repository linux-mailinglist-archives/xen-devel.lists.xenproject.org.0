Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6715C7DBD09
	for <lists+xen-devel@lfdr.de>; Mon, 30 Oct 2023 16:58:01 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.625236.974333 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qxUeD-0004Hj-U3; Mon, 30 Oct 2023 15:57:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 625236.974333; Mon, 30 Oct 2023 15:57:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qxUeD-0004FZ-Qh; Mon, 30 Oct 2023 15:57:49 +0000
Received: by outflank-mailman (input) for mailman id 625236;
 Mon, 30 Oct 2023 15:57:48 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Hhfi=GM=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qxUeC-0003J5-FA
 for xen-devel@lists.xenproject.org; Mon, 30 Oct 2023 15:57:48 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04on2071.outbound.protection.outlook.com [40.107.7.71])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 124a41a5-773d-11ee-98d6-6d05b1d4d9a1;
 Mon, 30 Oct 2023 16:57:48 +0100 (CET)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by DU2PR04MB8918.eurprd04.prod.outlook.com (2603:10a6:10:2e1::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6954.14; Mon, 30 Oct
 2023 15:57:46 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::d924:b650:a2ad:7b25]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::d924:b650:a2ad:7b25%3]) with mapi id 15.20.6954.016; Mon, 30 Oct 2023
 15:57:46 +0000
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
X-Inumbo-ID: 124a41a5-773d-11ee-98d6-6d05b1d4d9a1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jGv3d6Zvy8MwrvBFwOhBEMOtPEeoTYxY2xfCBJ3JRR6tsPhFwTo3UlJZmRT7ZCLXqDoD9eZMvA8x7+RliDt7uJFrc8je744J63zMV8x42Oo9ThVQF4H/djNXDtEem4NVW9yzRvlwxdjFasBY6KlwOwAPVURV9NrDtFy4Q3PdhlVLjIVNy+SFdbQPSbvyjkvdR66mZV156OmG77FWHHoTEyXsz0rxyBwysKgT5hhUJMDH6ohpdTqB+8VWOJzeNaW2JMXQ8F6fXgzPEfPRptRHa6QyEHFj/z+pAZYTIJXW35uo7iK0RnQCaQzkPb6Nj6LTSrC0jI+Srs4cW5oDXs8vEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TiSxU06r7eW9JyNJKVtrLumX8Oc3b3Q4lQ8Ys4Q0Sps=;
 b=PizcpEwKta7bdVwcH85UZW4AjxAXw/JL7iS40SPwvjrFJiV9SC8b0lNyNOjqf0UYpDcNiuHogBpt5JgWG1nhixvOBMRjZ9fiwvBwy28oqiwdwMyv+mi+LlPeq05x3nI5fubR+B+Wj9qpBocxUSWeAP2csq51JLz/CSnGYRWmNRqpj6QHpKAsTTCJU3Py6515w0mZImu2m7ZIlgDiH2SuWXUVvhVgHbuW0R/2f1TX4tsQFmsCpBIb9FKCdRFF0GKiyBlrCh+iXwQvRJBCzkf9WZmzVbfosNt3g0Bq3ZRGzphrtd9YX0uAgs2PTViKKbvGG3Db04oUS2riCizvbGY/CA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TiSxU06r7eW9JyNJKVtrLumX8Oc3b3Q4lQ8Ys4Q0Sps=;
 b=lawWOYYx+Zsx9TL0438Hr38QJYjMgbSV7Er0Un3x/J4qDttJkGP6aVWeN99O1i0Sv++tFGfC4qfaE8AAcDmuD6KRoqlrH/JaZqe7FXuGh0I2B1j4gsfY++X37Nia62CRbR3yPyJfTzJEqZa0B4j4JxYXGumkiQN3y3XFCR9YReayQr+Xo9IRyJer6KSDJNh3ZtfXNnYbtiezqzIU3RC+ycilBIHCzwJ7h+rdhMGvc1x6yDH2HdOIVR+D2jXmrquF2FRYNVCSEbsgD1CQRTBgDBkYgzoi5+wmSL18jIv9Y0DXnfDY+oUse7fpX5sxF8+r5HTfb1z8O65oXsJi5SyYPw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <d432b1e5-1c0a-b423-e109-a336da9e5ca0@suse.com>
Date: Mon, 30 Oct 2023 16:57:47 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [XEN PATCH 3/8] x86/vpmu: address a violation of MISRA C:2012
 Rule 8.2
Content-Language: en-US
To: Federico Serafini <federico.serafini@bugseng.com>
Cc: consulting@bugseng.com, Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, xen-devel@lists.xenproject.org
References: <cover.1698045505.git.federico.serafini@bugseng.com>
 <064278aecf69859c664784ba18a7189d885112c0.1698045505.git.federico.serafini@bugseng.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <064278aecf69859c664784ba18a7189d885112c0.1698045505.git.federico.serafini@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0193.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:ab::19) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|DU2PR04MB8918:EE_
X-MS-Office365-Filtering-Correlation-Id: fd9bffdd-14d7-411b-4f95-08dbd960f56a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	hXLFG/PaFRbjOrkBdmtuIWpSRIVf9Bd+emE6fHtl4Pb4cLjU4IbHPP/5QXhZ+/nAJGNsNFO3STEXAb9fv2BkxUfS0De5mMf0XCedEFj3/rr/1o5DGbAYy9pXohZZOYWaBzqGLjk678VoxjwdtN1KmT28gbnMqVLA+6qFT1mUKOx+qhypqQGE1JUGSQq2FM24JvylIU0IM5iiuvmdbj7+RgAIvWaHc35JQtbEY1u3oOa29H/JD/Bdl7DQOb+nK87yAlqJY+8VgXmjaKdu5tDensrfhQG9+TNEOCzjkB/U6QeJGCbrlSCjzdKCdO+bQCG4jAYkeTJXUx86PQuKv0AJg0WB0kBrxrs+GdeydXVp9JxG+SzkJO0dVMaOopvM2ff6VxlPUhlUXiRlTWrbNIMDVzkDiuxML5Y5g/3R04i9QUUQ+l9qtDcOy8zmaO6XsrmvWnj84/p0ZYInk24opukGwfoJ/RGo3HizMNTcgf//at0ZBUxssaCPi7+qyccgWOXqXlMVjqV8kAgjsAUlHyu8yxHIsKn+fRetJQMOZFFBQt+DMG8z8D/hh286epu30AE5xBu4RfiqhWoPHanNjVSameas2jX2FrNAxDTgmbnXDF5EElEDToFUO+TM8GLOmdIZp5PlrUNLu6iESsNXoOOSpg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(366004)(346002)(396003)(376002)(136003)(230922051799003)(64100799003)(186009)(451199024)(1800799009)(6512007)(2616005)(26005)(53546011)(478600001)(6506007)(6486002)(2906002)(66556008)(41300700001)(66946007)(5660300002)(8936002)(66476007)(4326008)(8676002)(54906003)(6916009)(316002)(38100700002)(36756003)(31696002)(86362001)(558084003)(31686004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RE1xbHlEdm9VT0UvY1hxMmJ1RFBENENuK05ya1pEOW1GYzZ0L1pTM1RDK1d6?=
 =?utf-8?B?ZTB5M09uTE1FUU83MFNmRWxpbTdTNjFiWTZmUUFVQTQ4REJwYjc4TjhDelhp?=
 =?utf-8?B?N2twZGF2elVMNm0vWklTMDNMTVpRRitZNHQvbG5HOTN2Y2NRdysxZnhaZEJJ?=
 =?utf-8?B?WXlvN0I3Y09ROGN0ZHlWdDh1TWtGSFBqYW9oS3drdVFvZzZXUWV4blovSzlh?=
 =?utf-8?B?NVorQmU5RUN0VVBPRHJXUFhkWWtlSUd5Y1doWWdlS3B6cjU4YXc2eU0wUXNK?=
 =?utf-8?B?M2IxU3VDM3RHanQ3MnFWVEl4K2ZxQktQMSt1T0hSY0RVQm1jdHEwQmxzZWJj?=
 =?utf-8?B?eE9CNzBYOGl1RHRYakNFUE5xdWk3dzNTVEtBcGVXUEJEYlVkTGxFemxTcG5l?=
 =?utf-8?B?UlVtZk84eE55djV0aFo3KzZzdGtpZ0NweUdhbngwVHNzQjhlUDM1ckdXTUtN?=
 =?utf-8?B?YUxrcDNwY24rdEMybGMwWllHamVubzVQUGt3ZzQyNWFLU3U4Y1kzVGgzRTFS?=
 =?utf-8?B?Y01WeHp1TVRFNFZTN1R4M0VIWnMzemFVVmQ1alY2R01WVC9DWjNWRjRveUlB?=
 =?utf-8?B?dzlEb3V1SzVYTWMzd1FUMGZMc3ZCOTBsZ1NxazhYR1NuN01uUE1LVTBrVlI2?=
 =?utf-8?B?b3JIV2pXTFpDbXpIeFl5R3FSTUNLMmpBaTJ0cnFtZ21kSk9hd2JXME5sNEJ2?=
 =?utf-8?B?MnZJU3lDZ21ocjlCQm8yc21qeWRNOEViVGpXazlLRVNkNHIvNG5KRTNrL3lL?=
 =?utf-8?B?cy8vNjBOeUFMUlRUb2o3c2lmTWhaTkw0Q0NXNjRTMDhUMWxaSk9GYU5tM0tF?=
 =?utf-8?B?bGlTemxzTytCMThUNzZ4Q0htSGdqbkdxMHBCSDBWSG9mVEVtTkxza0h2Vlh4?=
 =?utf-8?B?eEhGRnVCU1lEeEt5eVRMa1RMU0E5UEo0Z0YrQ2Fxd1Q1RTgzc0xwWGhRTC9u?=
 =?utf-8?B?WWowd3dRYUlWcXFCa0Z5elRNYzk1aXFpNnpZTTZCSjlhdWFOMU9TV3RkUThp?=
 =?utf-8?B?WFptL3dMVUhyNEZFK1NjK3o4bWx1ekNZZVFVRHFzUEl2MXRsNnlGRGl4TGh5?=
 =?utf-8?B?ZTYzMDBJNHBsa1FxWlhXRnFrdFpaMmhIQWVKNjBsMTVHVG9sSjdVN0NQRHZV?=
 =?utf-8?B?bUtvdG4xN25YY21CNXhvbGVlWGxiNHFGdGY0TXFGNG5IY0ZwL055alJsMDgw?=
 =?utf-8?B?SzJOeUhoVVVxb1YvZExZTkpBejRHM1ZxTGVvTTVQSzYzemR1QW1kSVBGVndV?=
 =?utf-8?B?dVVVNWFwSFZjZHA3WVRpSE5nbTMzN2xGTjFvK0RheHJ6anhhamxWOWVqdkdW?=
 =?utf-8?B?eDVGbFpzREYyRUVnMTJ3ZU0raEFLU2N0U0pmYVJMMCtuRmVSK3d0STVsQ0dP?=
 =?utf-8?B?eldrR2NYblBiL3ErVEJEdXRIQUxtTkRqNG9PdkJNQS9mR2Z0blFxNm1qNlRo?=
 =?utf-8?B?blY5NXRZYlN5azZVc1I3dkIwWmtCU2k3Y3lOdnlESE9UNzhlbGNabSt0QWFy?=
 =?utf-8?B?MDNVaHJCS0U2VzFDajFFUUpWK1ErV1IxRys1dXJCeDloTk81YnF5Vm9QN2hW?=
 =?utf-8?B?QkJUbitaRE13c21HRDRRSld0V2hRa1luUHFEUElxc0s2dGtUSmpSazFoVGpt?=
 =?utf-8?B?YXBWNVRhMjJ0UUNMYWk3YXArZ1MyLzRWblFBK2szRTIxSDdqZjFzK0Z1NDBt?=
 =?utf-8?B?NkRvdWVzRFhaQ1FOUE5RNkdRUkRPTE5lSGdtQUZtM1V3NStmcUZwRFIvU00v?=
 =?utf-8?B?dlBxWlRXb2lnR3FDeWp4NXRrM0dpdWRpN3Z0U3YzYUhaTFpKNUpvN0tvUWQ2?=
 =?utf-8?B?SmVaY2dkSGNRekhqR2ZibDZHb25UYnArTzc5NG40eks2ZlhhOUUvd3dSa2FI?=
 =?utf-8?B?V2Vac3NSMUdHeXJjdTV6QWFWa3U3K0UwTy9odkRoejAyWmFqWXErRkNXZ05W?=
 =?utf-8?B?djBCdWJ5TTFRbWdkUlcxSVRJTDVvbldZa1ZzYlo1QkxaUjRyTzVMMGNDNk1F?=
 =?utf-8?B?aCtXcFVlRWlCZDkvTTJ3cVJFeEViUmxjYkdmTS8rUmJWMVM0OHJLNW8xRGpD?=
 =?utf-8?B?TkpSTVd1S0tKU05sNURJM3h1dmsvTUJLMkhTWWtnVEJTTnBRTTdHNitscWJI?=
 =?utf-8?Q?3DWEO/fk3qvCon/JQ6A1z10hG?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fd9bffdd-14d7-411b-4f95-08dbd960f56a
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Oct 2023 15:57:46.1936
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Z7ZLhp6jBiWQlCJgUCF8wV9GBLvMsIWaVPbeQcUvMkpK27CJNfa2jRuQmhefRU7PG8EHqK4w1uwzZGfu/6lioA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB8918

On 23.10.2023 09:22, Federico Serafini wrote:
> Add missing parameter name. No functional change.
> 
> Signed-off-by: Federico Serafini <federico.serafini@bugseng.com>

Acked-by: Jan Beulich <jbeulich@suse.com>



