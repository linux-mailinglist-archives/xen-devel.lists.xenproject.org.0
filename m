Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C87E485697
	for <lists+xen-devel@lfdr.de>; Wed,  5 Jan 2022 17:20:20 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.253643.434873 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n590K-0003lT-QY; Wed, 05 Jan 2022 16:19:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 253643.434873; Wed, 05 Jan 2022 16:19:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n590K-0003iz-NO; Wed, 05 Jan 2022 16:19:12 +0000
Received: by outflank-mailman (input) for mailman id 253643;
 Wed, 05 Jan 2022 16:19:11 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=VMO2=RV=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1n590J-0003it-44
 for xen-devel@lists.xenproject.org; Wed, 05 Jan 2022 16:19:11 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 35b11b95-6e43-11ec-81c0-a30af7de8005;
 Wed, 05 Jan 2022 17:19:09 +0100 (CET)
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04lp2054.outbound.protection.outlook.com [104.47.12.54]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-30-YXoqPl2kPIGGj-jcQ1gzFA-1; Wed, 05 Jan 2022 17:19:07 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR0402MB3774.eurprd04.prod.outlook.com (2603:10a6:803:1f::28)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4844.15; Wed, 5 Jan
 2022 16:19:06 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe%6]) with mapi id 15.20.4844.016; Wed, 5 Jan 2022
 16:19:05 +0000
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
X-Inumbo-ID: 35b11b95-6e43-11ec-81c0-a30af7de8005
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1641399548;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=4rQhLGp70ru/tHxpdlOmg012WlKRsogkAHdcqm6PA4o=;
	b=J1rZtWQ66YMfcU2nLJ0r0lFLChWiJ7fR2D43bcWytZRcKRuj454ojDSg2LAYGC3/yWOqjO
	kSY1UfNcOWVbVa7d5NH5r/JsYBM+XRobA16N8mCvFHF6QYQAMFhe4O9ELC9SpG7EgXV7nV
	tlgNiwdVpcGlXMGSU5ghlUA5NoXpPUQ=
X-MC-Unique: YXoqPl2kPIGGj-jcQ1gzFA-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SCH3dyUrZMDpOFdKqvrF5wSMoZLx1W58mMiyzh5Pn6ALC7y7Gb75RL2bHn0Jb0Ns4s5srGL37r1TQPRp6RG8iIHwTfb0Ur9yRflkqcDbBhIqUM0IQ2cn/kVDHARkVz5Ygxaf0GDZsYVEmAZODOssisg36+bqJ6tHExOC3gJvPs3CBh3UopUPHhq95qxkJPnllGLY7HyqvrwYEjZPT8s+4yuFIyYKiTztDYtA3H/1V+F4KFjA3Dx/N5RNXZ5l1oL2KGANyqS6YLXe20fgAkQ4hngf0xuWiXdffNj99VK0qXQ9ZEKe50IX661a7NTVa9gpy1fRrr1VhXNIvTq++ZTCMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4rQhLGp70ru/tHxpdlOmg012WlKRsogkAHdcqm6PA4o=;
 b=AxZPhcFUStXZDk8R1U1eUE8ivK6Kz7fYdvt5VX+PUAPXHZMMARy4td5z463lalN0GYdJZw9yA+sGEeDfodMpgfYz/iDLvtc/FAShUUxiTOGUmeCJWKA4A3IqQHcxVdRHsrUtPoQ0WjhbxRTQ2KKVlloKf7iGP7xRiRW1h7QcvwUNJ/QyH3E+0LLiMq/rJOaHZWXWIvmrKpho5jSkh5HznEnrwg4dYWW1i8P9C1SziKO+K74fNldi/Yezmh9EnqMc0fbTln2UOFpbYWFjJu1tbULMrK1Ahu7ugCpKUhwtPMSOYBSEOrE4iV8r5/1k1rKg5djHDQjBjEv2gmUFlhMBMg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <27266e85-672f-af5b-49f3-784ef262cc98@suse.com>
Date: Wed, 5 Jan 2022 17:19:02 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.1
Subject: Re: [PATCH] x86/spec-ctrl: Fix default calculation of opt_srb_lock
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20220104144422.29989-1-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20220104144422.29989-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS9PR06CA0264.eurprd06.prod.outlook.com
 (2603:10a6:20b:45f::9) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 44e4a45e-0055-4722-55f2-08d9d0671825
X-MS-TrafficTypeDiagnostic: VI1PR0402MB3774:EE_
X-Microsoft-Antispam-PRVS:
	<VI1PR0402MB3774242F2EC5BCB2AF1E126AB34B9@VI1PR0402MB3774.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1850;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	9yaHVABA1qbZKkcD2HOGaSqVohGPXKulva3xGokcDIf9l6fVJfM+1m0ZWGXGf742ibGHLjnNDfMdSYO+yMOwaiOjeaFIcKzGs7aX+bGL/f9oQ8+LT06pNHQOxa/Okm4v8SU1XL1BnjsM8t/DgyL6V/mFBeO8zNW0J9jCNBvCru7A4CDecCeHc+Ir8+7ir80vE6g3D1c+VvcN7j++6RTm71VzAeAh/J1IkU0qdQ/Z9kLMS/7PQMFtOlgoFGIP0C9zhtXHbnyQweldh/aegvZJO5Ylg/+gpo5bt4XHqsonDKld0wltt9FiEF9AnmFwhRODiHynIB+keYyJRYb1TSMrDGmARRyhPbyhyImlVqeTOOQl6X3lt/gkaS/Ui8XOYWqYFsFVXXlX7UY2eKV2FB5ZHhXly2yPM2IMCrMO/r6r+v4o4hmYMSTVQ2/z8hQ4AlcFCrbFPWFskEPZ2SCfDgtsqlmJ3rJsCbAY3QizenX0MFbSiVGJlTS1mH2KXYqBJGP6kWYN3JLwY59MhGc9x3Lfv6MfrLdJUwMte+0w66FBTMfQZ7muoG9WCh9wdy/28xutQflKjC2nKop+CdovOc2hJgLXOnJWZMS16JuiTr/bGYFFdjxRuDRvvPsBJhJJ0pIIvyGpxQJJuCJV2l58BYf+nGceq2CoShg6flmTXHBszF8+HQyrJd3HAU6zml/Lc0FrOxYzlQFRDP48dF9ovEl+vsDcACfcjzKazM6B94iaK/4=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(2906002)(31696002)(36756003)(66476007)(66556008)(186003)(316002)(2616005)(83380400001)(6916009)(508600001)(66946007)(4326008)(6486002)(5660300002)(4744005)(31686004)(26005)(6512007)(6506007)(6666004)(38100700002)(53546011)(54906003)(86362001)(8936002)(8676002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WjBIWVFyY1RnRGMzSzVyRVZXSE8zd2plSEVLT0FCMTZXSzd3MTl1QVBQR3Jq?=
 =?utf-8?B?cXNmQWV5TUpGNVBsTGwzdUt5MUtibGxNY0dXSStHSnk2WTZiRTBBY2NaQVFk?=
 =?utf-8?B?NzRFbDh1NEl2NjNSOCtlMFJrbDI5T3dBR0JVaXcyYzZQdHM4d0hDcXM4U09l?=
 =?utf-8?B?UTR4dDg1eEtpcXlKd1Z6UDV0YlpmRXZ3cEkzak82ME5ZNytreUViZThNSUdC?=
 =?utf-8?B?N0NoQlBkeTg0cVMzU3NHOWdxT2VIWHNaZjBtbi91N0Z3TG9MbndVU3lMZ01i?=
 =?utf-8?B?SFVSSnhtS0dLVFQ0LzhQZG5EdnE5S0tmNVpIOVUzNmk0eXBRN2x4b3oyVjRN?=
 =?utf-8?B?c3RGaTg3Z3h3SlB6V0xveE0vWWZNUnRDbGtiVGNJMU42OXFXQVlsaHVyWWJ6?=
 =?utf-8?B?RW93U21HK2NyTWI4YkhBNTFNMytxUFlxK1grQVFKbnFqbDh6bWhTUjdnbyt2?=
 =?utf-8?B?dUtDNmdjSE9MMFhMazM4NWhnaC9aZlE5T0FqeXJ4NzRIaWVRS0hHMzVqaU4r?=
 =?utf-8?B?VnQrNFNnUlR3U3lFMGpaU1hhZUdtcXBseisrNUdOYlI5OFA4cE5RU25ZVFgz?=
 =?utf-8?B?Q2FUSU56QllpbGpuanY0M0U4Y1lJWXJiVFczWHErSVpZT3FYaUFyTStVRWVo?=
 =?utf-8?B?WHF1V0JyTCtodHRnQlhxK3pkSWEyaWJ3aExhVjlBSkZ5MnZCTy9RUVlRdXRq?=
 =?utf-8?B?R093bTRnY0JNQVo5c2dmbWxoaWZ0RkRHNkJ1MjZUeVUxQXlLV3Q4OCtWUzND?=
 =?utf-8?B?Tm83eHV5elE1eHhqMHZIWVZaNWx6T2x3OWlYQXNWR3BlQVVHRzhSK2w0MHRs?=
 =?utf-8?B?VlB3SzVRYXFVSDllb25vbkNESjhNY0xpWDRtSSt4cVJ5bnVIV2ZYMUVTNU9j?=
 =?utf-8?B?dWdKYlk2Q2JPQWIyU21QWVV4N0FVdUJBVzd2Ym5UMkM4U1M2TzZ6R2N0VkVU?=
 =?utf-8?B?Skh3VG1DTlYxOCtnejkwTzVpTm1jdnBlYXJlZEVpUlVTMThTcGNUTzNQZzNC?=
 =?utf-8?B?bTNDQlo5c05XdjVrcXQ1WThZbDl2VUJZWmQ2bWVSak1lSUdtbHpLVW1UQ0JV?=
 =?utf-8?B?TjBoanI5Umg2ZytOVXF6eGZnVUJza1Y5eW1SZTMxYzlvc2VDUGE0MFovZCtp?=
 =?utf-8?B?WFlHRkdSKy9LOGJYNzJwcERoZ3VOUFFqa3o3Y1JqQ0trbStmL0dPcFA4LzRH?=
 =?utf-8?B?VWVZS0NQMTJRVzBNLzNsUDE5UmRhaitSM242RUFyZlFxalA0c2NqYWhwRDkr?=
 =?utf-8?B?OElpQUROcHRBbVFSMUxJdXAweDZjNHpIN1lEclFxM1NqRDhrQmtHOXdxTlll?=
 =?utf-8?B?RitEV0JjTWF2WjhCY1hpVjRrcXFmSkw1a0hpR1IwR2IxTUYyU2llSm9GZVBM?=
 =?utf-8?B?WXpmZC9wZk16RkgrM0F4TG1OWFpnbUFNN0NlSTZZOHozT3hpRUwzYytCcWdL?=
 =?utf-8?B?VmRKbHVmTDRkVUpheXJzTTlYNWpQWDFUUi9TcHUrTGJVYXhUTFoyRW9KMkM4?=
 =?utf-8?B?YlRDWkJyTmNwUTU3akc4aU1FVnNoVFp6cGljRW5GbjBmODVmQXJ6dW45K1Vu?=
 =?utf-8?B?MnBNNFYrZWlXeCtOTkswaUMrRWJ5U0VSQVJENndDbzR4TktPUlFWK2h6aUw5?=
 =?utf-8?B?SktDYmpDRG9zV2pDRERGTEJRcUg0UEFPV0UrN2M3YS9BZ2pwZUxDWVNPTWU3?=
 =?utf-8?B?MDhoL3JFejA4OTRPanU0R0RQZFQ3ZVV2TUxiN3RlVVBoMSt1OTlGZXFkeGNs?=
 =?utf-8?B?ZGVzcGlBblA4dGJuT2xqTkJVUTNKcFg2THdjd2R0SGhTVVQ0VHAzVGU4a0hE?=
 =?utf-8?B?eHhNbzlFbkFuaHp4MkZMNjNUQ0dxYjhDY0xGejhBdFRMZWZ0WHNiSTY5Z1lH?=
 =?utf-8?B?b0hsYllzd3djR0JIWHZEdGNpWmg4OWVVaFNwSUcwaXI1dU1iTCtmd3JvNTYv?=
 =?utf-8?B?NExkMzV1YTJWbGd4YTBhcHU4cHgxM2MxUE9WajY2TC9HdDZXUDJ6NE5xQXMv?=
 =?utf-8?B?UlhIRkVIM21ON0U5cG9VOVlOYzRUei9UVmlkTW1YWFlid0lFT1RsSUVZNVJN?=
 =?utf-8?B?UHRCWVc4ZkJudmxhb3ZMT1YwU1ArVTl4eno5K2wvbXR2cTV5ZmlPYXlWSXBX?=
 =?utf-8?B?eEJmRTI3eWNsazAvQWdYN0M1MEIrYUh1WVZDNmZFeHpqMzZoRDl3V3dBVjVj?=
 =?utf-8?Q?WTfwJODluLJGZfuUPzwpdyI=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 44e4a45e-0055-4722-55f2-08d9d0671825
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jan 2022 16:19:05.7353
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rTSdNts8qLKdERrn/7VQXKfCI6s5qFDeWF5Z9I4ZbMH0aH/x72M7pETo3z7ZGlA8N5m4+Fz3eDK7bqYrF4BIaw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0402MB3774

On 04.01.2022 15:44, Andrew Cooper wrote:
> Since this logic was introduced, opt_tsx has become more complicated and
> shouldn't be compared to 0 directly.  While there are no buggy logic paths,
> the correct expression is !(opt_tsx & 1) but the rtm_disabled boolean is
> easier and clearer to use.
> 
> Fixes: 8fe24090d940 ("x86/cpuid: Rework HLE and RTM handling")

Is this accurate? Backporting the change to 4.13 locally, I notice that
commit (and hence the rtm_disabled global variable) is not present on
that branch, yet opt_tsx already has the "more complicated" behavior.

Jan


