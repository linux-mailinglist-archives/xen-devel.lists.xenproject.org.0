Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 99A566CC2C6
	for <lists+xen-devel@lfdr.de>; Tue, 28 Mar 2023 16:48:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.515913.799273 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1phAcT-0005i3-R0; Tue, 28 Mar 2023 14:48:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 515913.799273; Tue, 28 Mar 2023 14:48:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1phAcT-0005fb-Nd; Tue, 28 Mar 2023 14:48:17 +0000
Received: by outflank-mailman (input) for mailman id 515913;
 Tue, 28 Mar 2023 14:48:15 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=6aKL=7U=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1phAcR-0005fV-Qq
 for xen-devel@lists.xenproject.org; Tue, 28 Mar 2023 14:48:15 +0000
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur01on0626.outbound.protection.outlook.com
 [2a01:111:f400:fe1e::626])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 90f27e36-cd77-11ed-b464-930f4c7d94ae;
 Tue, 28 Mar 2023 16:48:13 +0200 (CEST)
Received: from AM6PR04MB6551.eurprd04.prod.outlook.com (2603:10a6:20b:fa::20)
 by DU2PR04MB8936.eurprd04.prod.outlook.com (2603:10a6:10:2e3::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6222.33; Tue, 28 Mar
 2023 14:48:12 +0000
Received: from AM6PR04MB6551.eurprd04.prod.outlook.com
 ([fe80::4189:2d2a:eb83:5965]) by AM6PR04MB6551.eurprd04.prod.outlook.com
 ([fe80::4189:2d2a:eb83:5965%3]) with mapi id 15.20.6222.030; Tue, 28 Mar 2023
 14:48:11 +0000
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
X-Inumbo-ID: 90f27e36-cd77-11ed-b464-930f4c7d94ae
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Mngg55R+igaRtMd9gTVp7PofMk39IdBtWH9aaPqnfpSkl+S9aXIyEjPmk5LWiXUQpDS0ERNJsVnho/W2u1WolAWtJaLl2EmSpzR8AbKNYVj4I1OA+cY6VbQi+gZpePHg8YlhOr/BKR2usdXdBd6kDrA3mMYxPfcLnyLMh8r0JoDFjsIFJPyXOS6BYWEGrc11tS11QzpSjSyDOw9pCibqD2kNZKNxsTw159cp+IrUrVlQm9sHQ0LIc6rEiPbUVSYt8qCPxXwSwHFhrgtP8J92tH2mmh1oM+Lo8tMysVgrOfc2lYK+ZoOPRhxUHXNWcy/UBYa5HobM/S9c+aN+jHKdyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5UIawk3+xYUwRZCBPDDulIciXc9qVGYaLjQgqgvF/qA=;
 b=QdjzNtLAcOGTf4fCMmoeosusNQY4k2ITT2kHofohnXcoc1XHGisro4vD7qNo+nEYFx2OqC9qHSkYdSmE91TUqyH1hfu8uwSgIUjMDFrOg6mO4Lhgm4kqMqOH4mma1tUbVNrueSUh9e193qUZQ4FNueWn6hPOZ5bv0PT/1WBBGkWy2cnCjI49UwCdVhc4Du/EhBaWDJpHzPgRRvVbmR2UhFqMS1I8VUzhhKtwv4wszssOzml55QoEZBl4kRK3FTbGFHj0ZRSHHLeD52IqWmIiNjvwI88iDTYVqx+2+u3zA69PLxovQt7kA10LVOzO3IzthC9yAeMvjRZNHb14AAnheQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5UIawk3+xYUwRZCBPDDulIciXc9qVGYaLjQgqgvF/qA=;
 b=rLvofGJKuKSpexyDScaGnPUISuKjveoAXbsB/ZLdzlr5mn0dW5McOi6FcZednjxJiliXB0u/PD3oRMe6PfFC1aYtHmNUAKm3gtMo58Gd+vXXZEyr0xX56xmAMlQ32B2EwnO8dNJ84e76/Mfb3lsEuWe/6VSoyv/dHFq/R+lkKERV4LlpU/j4LVPifOAtsz1+DiZ+2lXbDpV71lMtkHIRpnW8gA+3SF3IVPVQ5g0lJ7WgXDaLHHgJtB79wZaZMkIQvGx6/k76e3Abgv9ZIHUnQujcEP5r39x9RvfPLzAI9P6iC8ES3IEJABYu3aGEsSvrvkobWe52hDWFb0UJX45OFg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <40d58ac1-d0bb-afed-c0ae-c545c7bff30c@suse.com>
Date: Tue, 28 Mar 2023 16:48:10 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v2 0/8] x86emul: a few small steps towards disintegration
Content-Language: en-US
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>
References: <7f5287ad-8442-6c53-d513-f9a8345c4857@suse.com>
 <ZCL3W/HrwLANuE/0@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <ZCL3W/HrwLANuE/0@Air-de-Roger>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0136.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:96::10) To AM6PR04MB6551.eurprd04.prod.outlook.com
 (2603:10a6:20b:fa::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM6PR04MB6551:EE_|DU2PR04MB8936:EE_
X-MS-Office365-Filtering-Correlation-Id: 6bb2683b-c230-4518-66a3-08db2f9b741c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	fR73QbNk0Mj9V/O5IwNgYc4ndcjA8nlxgn+fngI544Ghj5y+6rZL8xSptArQ2dLHY/5ERXt/Ri26kecbHMikDcJD/UYQ3DZRKXedq90RtgRF5mgBTGrBIfTkAxtIxLl2bEayU2WZMsJ3r048cmuPQnOwMeenZzZNEOOpRH0DricdtN1pNWtxJGDL2mhpTyab+DGp4RwHWP2jBafeQDE8A4bk5lAH2YcJaviS1Yk1ZAt4tlWL1hq5vM/iEoZ4KMk7HR9y3zYEJU3335Za3CX7T7e9P603cVlrsVuDu7vgnzMKRO7TXGtNB/wsWnpepg0MjPYYhEQGb82oV2BNaRDHeclU9RKIkU2/rhicwQbPDRrz3a0fXpMZrV2qqMDJpI0mnIssW5JO9rnaWMbYwQ76ykC3yCdMJUfpjXGU2PWe6K/bXbRM+QKSMZs4AN6H3c/gyzg+Tq5lzP6vXp+6feTbu+knlJyzYYPAAXGF9PqcWnkbi0dII0exctqEEJP8h+bH7FqitGis+VcDiLBcM9XHqNlZKBA56oCWwLLBMI60sHK+5Z5XFoMNT3C7G46AH9ps/6fowfV3OnJgRROszoQsBxFalkK2uwPVe7f7rAseDPDTNSwZu3NnQbDpNERzzXMTH4TB2QjNiyIWqr7UA+HQ0Q==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR04MB6551.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(136003)(366004)(376002)(39860400002)(396003)(346002)(451199021)(31686004)(36756003)(186003)(6512007)(53546011)(41300700001)(6506007)(26005)(83380400001)(2616005)(8676002)(4326008)(5660300002)(66556008)(66946007)(66476007)(6916009)(316002)(54906003)(8936002)(4744005)(478600001)(38100700002)(2906002)(6486002)(86362001)(31696002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cjB1OHhyUHFSc20xRWFWV3JxUTFSVUk0S3J2aTZsT201RzRSazhoSVFpRGNp?=
 =?utf-8?B?QkdCaVRRMlIyODg2ZHZwR1ZoY2wwb3pYY0RZcWlxRG5aMXlZdVdMWDhONTdo?=
 =?utf-8?B?RnFhSm1zQW5tWjNaRks0ZzZKZ0luZ3dpOFpTSFAySkJvVmF3RnJJSldxUGg4?=
 =?utf-8?B?T0puY0U2YTFWM1kwc1ZUc3VuRWlZaDNaQm1nRlQvRnVJSi9YcTArUzk4cXBD?=
 =?utf-8?B?c2tsQ1dpK2ZXbHYvUmltNS9sOHU0dDN3blpnL01Xdkt6VVhwaEs2UHlVM001?=
 =?utf-8?B?YndKS05NTFgrWlp4WXFnblZHSTBZU2dsQVBxalNwbnRWTXdrSHp6SHVOUjBy?=
 =?utf-8?B?RWVRbktLWDZOcjl0bUR4ejY3TmV6UTg2SkV3L0dvMDkwcy9MSUlpbis0bU9n?=
 =?utf-8?B?L01zL2pDOUhvYVc0c2tSemFlWTNlMHc1YWloQklPRndxU2ZYOTZ3SHpna2NU?=
 =?utf-8?B?TFNsS216MW5va2RqRmduUHNzVVA0RlJ3V3BiSysyU3VHS0NwNWxCbmxqWUxJ?=
 =?utf-8?B?MFZDaHNrOVJ2R1JNUFdTVkY3Y3ppeFdEcHBhYkxvd2NhNHJac2NPZTk3aUhv?=
 =?utf-8?B?Ly9SbzJ4NGs2TEU0R0JmdVE5QTBYWjJjT1JVV3dUWk5XclBZYU51NjJmTHIv?=
 =?utf-8?B?R2phek5jYUZFaXpORHkreENBVnRteUtUamlRcWdvbmh6QVFOS05XR001QVB1?=
 =?utf-8?B?N3ZWUFgxUk5YRlk2Unp2OE9wdVo5TC9qM0JaTmFFREc4eU91aTZtMWcxWUxM?=
 =?utf-8?B?bzVHZ1BYelF3TFRMb1pVMHp3MFNmK0NpQkc1ektnS1JkVmh3WElYMmUxUCtD?=
 =?utf-8?B?UUg0bVpaYlk5V3Zva3FsS3ZBOXBGc2xQVkphTGo1eGlRb0RpRm8wdEJHSHlY?=
 =?utf-8?B?aUI0RmFuSDBXakJrazh1TVBrcXJIUi9YTTRFTzVWeGJEMEdVaytKUmtObWk4?=
 =?utf-8?B?UDZJait2T1Q5N2p3M1QrTVdPZ3ZYcmRpWkNEdUlrRll5WTBCQ3YxVzNLa0Zy?=
 =?utf-8?B?SEdsSXZEM0VLNE5GN29TRWdYSUpvdFVpRXdKVk1LaW05RFViaVpNZ0JCQ2px?=
 =?utf-8?B?RnJsNjlWdWlSc3RGTzZqOFUveTA4Uk52dFhJTzVWbWFLMXhqdFRhckhzL09C?=
 =?utf-8?B?VFNXTDIyZ3AwRWp2STV4SGF3SEk0Z3ZCd0ZWNFdyVDBwbkNHbWZSQjJ2WXF6?=
 =?utf-8?B?ZkJWZEpmakJOQXFaMFpNaUZ5UXBhMDArUmRWUGFydGl6UG5sTVkwTHZOOXAz?=
 =?utf-8?B?RkJWaEV0bXBrbUxleWpzc0pzcVBNS0VyeVkrTTNONFZOTzlmdXlEQlpId2Ju?=
 =?utf-8?B?RXduSXo0T1JXK3A0SCtPQ0Z2OUhQNW9BNHo3YWd3bHFmVEF3ckdVRUYrRXJG?=
 =?utf-8?B?T1VzL1BKZlBYNFVtcmk0Mk5hVmdkM2xWZElCdTNDVlZzd1U1OFVFdGpaNlhF?=
 =?utf-8?B?ZWZGVVVKV0dhZW0rVlIzLzFXVUMvUXVOekgzNjQrMVU1YS8zZU8zTFlBRnZv?=
 =?utf-8?B?cEc3SWEyVkFWV3psTFNta2hVSzRjVTRtTzdDSzZFbTg3VmpySEpPaTYyOGJV?=
 =?utf-8?B?NzFjYXJ0cWpNaFRYaEhtY2FhSzBzZHprMTh3VnZ0eVF3TGFnTlZxM242czl0?=
 =?utf-8?B?WmVFTnMxd3VjVW1RSG1vSzZSOEplRXoyRTdacGFsRkhsQUZCRDhESDB1UENn?=
 =?utf-8?B?cms3Qmg0Z2hpVy9taUVKaXB4UWtGV051cTErM0UzazhmT1NidFQyWUJBZis3?=
 =?utf-8?B?cjJTN3BwekZEZjV6dWx1Um5aWDJGZUJJVEkvZ2NsVXNodThjMWRXRjVQV051?=
 =?utf-8?B?QlN1TlpFMkZrbS9WMU0zejlSSG5DQUNVRFU5TEY2SlMwQ0ErOWkzM05acWQ3?=
 =?utf-8?B?TnF4cGZvTzcyTGRRaHpJWjhOMGJpMkxLZ2hISGJuVEJmbU1YdFI1ZmFpVTlJ?=
 =?utf-8?B?SCtXVkxOVHBQUkJaZkgxUEFQOGFFYXpBeWlEaEFud2Zwb2xkUWMzaGZySUEy?=
 =?utf-8?B?bGlmc3ByRUI4UU5mb0ZIczJyeHBPVWJNVUxxNGJxQUp2QjV6MTZLelZEeHNB?=
 =?utf-8?B?NVRsT3loOTRWd3ZZUkNidlJkeDkxRGJpbmlvZGJ4WHRGcGN5ZzdBRzNzNnZK?=
 =?utf-8?Q?cvz76B0f6+hpnYfKEKZSCnwRk?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6bb2683b-c230-4518-66a3-08db2f9b741c
X-MS-Exchange-CrossTenant-AuthSource: AM6PR04MB6551.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Mar 2023 14:48:11.8795
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: e/mnkpGAJuRQ3/4CcLp7A84Gef6arPn1RdDMGAFbrdCcR6gndjtr1l2K0lHQmRMdKYIsNjfzIBxJTqPfgH0jPg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB8936

On 28.03.2023 16:19, Roger Pau Monné wrote:
> On Wed, Jun 15, 2022 at 11:57:54AM +0200, Jan Beulich wrote:
>> ... of the huge monolithic source file. The series is largely code
>> movement and hence has the intention of not incurring any functional
>> change.
> 
> I take the intention is to make code simpler and easier to follow by
> splitting it up into smaller files?

Well, I can't say yes or no to "simpler" or "easier to follow", but
splitting is the goal, in the hope that these may end up as a side
effects. There's always the risk that scattering things around may
also make things less obvious. My main motivation, however, is the
observation that this huge source file alone consumes a fair part
of (non-parallelizable) build time. To the degree that with older
gcc building this one file takes ten (or so) times as long as the
entire rest of the hypervisor.

Jan

