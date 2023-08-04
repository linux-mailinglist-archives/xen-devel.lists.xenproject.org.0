Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C073F76FF8B
	for <lists+xen-devel@lfdr.de>; Fri,  4 Aug 2023 13:37:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.577106.903991 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qRt6c-0002X5-06; Fri, 04 Aug 2023 11:36:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 577106.903991; Fri, 04 Aug 2023 11:36:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qRt6b-0002Ud-Tc; Fri, 04 Aug 2023 11:36:29 +0000
Received: by outflank-mailman (input) for mailman id 577106;
 Fri, 04 Aug 2023 11:36:28 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=VoTD=DV=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qRt6a-0002UX-JI
 for xen-devel@lists.xenproject.org; Fri, 04 Aug 2023 11:36:28 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04on0625.outbound.protection.outlook.com
 [2a01:111:f400:fe0e::625])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2575518e-32bb-11ee-b26b-6b7b168915f2;
 Fri, 04 Aug 2023 13:36:26 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by AM7PR04MB7080.eurprd04.prod.outlook.com (2603:10a6:20b:11b::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6631.47; Fri, 4 Aug
 2023 11:36:23 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e%5]) with mapi id 15.20.6631.046; Fri, 4 Aug 2023
 11:36:22 +0000
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
X-Inumbo-ID: 2575518e-32bb-11ee-b26b-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SvVLZxD/lP36qNJrPkTgikBncJ+6uZBfdTHgav/2hUXoZdMJx7f6irDAQvr/sKKgczm1f3yQY7pj8eJAza1zwMZluPO6od2iH0k91B8WySuLPDYHhVCWCXH2O4AGD9ehEQpU97ZwtTC7YjMX5WrOrQSfAgc6PaqSIe2LTEd/xEJz0Pz48b98xGt21zfENNPsddSgUBr9d9n1PFvWsrfoepjVccJMWMkHGePMWiVbfK7JoPsSl5ML7Jlpi36XQYeM6Kp8JLk1F5qAFozRFFlXT9P7dxcmAwdOHFGMa245LA0IPeUBsGAbzLNAyBlnrOjn1MKok8XoWPbGVYJBTk8RMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HV54gh0Z4zJqoYvIH9ELbPuFlkJX6szzPHSkoj+N1V8=;
 b=Q8w3x2oAlAbB/UcNEkz4XOkTIs8NlnXLyPrdzlrjXLaYMMuLiPaO7gmMBDdzDHlKjC9KoYdRIYQzkitQcq2jLfLkbQ5mNLQ79xwk+dKgP0wl249xUKMGXkfPQ88ibUywpEtQVNCG04sCIDhVJwsUOjldX7EzBdaelIFIZjBRBRpDkYCLoxaS1dc1JR22XA5BVN1f2qSFO09wu7LV9i6FOS9yaPCGOd3JWvFMmGlKk1/hPjX1YfCdCv1pbuhw+weRT4OxZ8LjTvq2E80jA9c3QyPt7NcjTCwjjKxrxikdsXzWjqtchHy4bFGiRLPHw6ci0xP4KRib6Ei6X2d1rDJN1w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HV54gh0Z4zJqoYvIH9ELbPuFlkJX6szzPHSkoj+N1V8=;
 b=XsT+YLTcXn95sj0pRr8mwZVw5OSa2rN614ON1L3w1Vs/WoWDMbqdfu0n9ta4cPKVTTZ2wivXrxFUrWEo0RY6pcCx4pCWlhJABGBHk+JIdQhO8wL6wwHq5VFH4QUvChCm51VxU5DlqzcH/RzFtd9lnrIS9xp4jh9tUUgoWXH8K1IJOA8y9RUHNxNriZKfUyUQk6B3loNLS8VS1pAZKZQ/EkSZ5ze/o+M+IBxVr8Z1SCcfqPrMNWQo1Nw1e9TyYuQMqrkO7mP0dLQIPZ4dybUJ3GIwdJLkisiT2szzF6PTrVm05nsLq1dhZLwckIwGLGlkHeQoBVFa/Ko8NoCvhkTP3g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <464d71e4-9047-0461-afdc-8df8b8f569fb@suse.com>
Date: Fri, 4 Aug 2023 13:36:20 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.1
Subject: Re: [PATCH] subdom: Fix -Werror=address failure in tmp_emulator
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: George Dunlap <George.Dunlap@eu.citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Julien Grall <julien@xen.org>, Juergen Gross <jgross@suse.com>,
 =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?=
 <marmarek@invisiblethingslab.com>, Jason Andryuk <jandryuk@gmail.com>,
 Daniel Smith <dpsmith@apertussolutions.com>,
 Christopher Clark <christopher.w.clark@gmail.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20230803203650.1474936-1-andrew.cooper3@citrix.com>
 <f066a57c-3dcf-12f3-26b2-5f61f8fcaffe@suse.com>
 <722dfba8-a768-55c1-29bb-2d8525282b4b@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <722dfba8-a768-55c1-29bb-2d8525282b4b@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0110.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9c::20) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|AM7PR04MB7080:EE_
X-MS-Office365-Filtering-Correlation-Id: f145ff9c-e976-4d65-d7bf-08db94df078b
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	+ePjwY4U12tyhAofPxuuYm6rVetwWW5MC0DllNtqX2LH+iHZXWX6Bnh+uEJxoZO//jvjR7s8Q26qJ517SuVXSMhvG5eylDNEx9zK1RaNyfO9hJ3TH/J9KjgJYASq1ey5rWuohNo8CJoGtdHIrkYWcTR3KfVt5p4l2EoyT0Qu4ujZx1CdmoBSMx54hrTjm4GYfBO2Pz8xq6gFmRG4XGC811kxkRSYoMVVC9mB7iuyI08pzT+aa7sYTj82ELrGu8QsKwV+POF9hq9HuLZxF3dNTyHDyrqGDjy+jZ/v/6TvzFnA9/CyfOLTUzkadmpKPJVylFa6ldbhUNG8C2prEAjhdkOGoQrRGKYr9iXu7nWnfygV8eP/8FesUCxy/TqSLqUHvFL2YHAFX+KxCoAgkSMYG9Z7mLNuKPPJY15p/H+Hwlrrj7QF5NsyPmTc7bWiUOwbFS8lf+0vftZen7dTkVabyXX4YM8XAaaL0Xzme4QukPiXp9uA+7YvdrlSko8Ber4F4g/7iZZTmRz9Mx/cA5YO2KbZU/aOjlxuyQEzpXAEOPNh4Fe5snIUxLxlosXcTnLPKJqyybTvlmyUZjXWJhlq0Hf8oxoQgIloK3sQGeQc2JPzy58KKGBObrWmFqMGyxDg5nsKXle/r8x3ZtS+KT9jxw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(346002)(396003)(39860400002)(136003)(376002)(366004)(451199021)(1800799003)(186006)(2616005)(53546011)(26005)(6506007)(8676002)(316002)(66556008)(2906002)(5660300002)(66946007)(66476007)(6916009)(4326008)(7416002)(41300700001)(8936002)(6486002)(6512007)(54906003)(478600001)(38100700002)(31696002)(86362001)(36756003)(31686004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SzJuV0VPZTkrbWRQQXpkWUtDRXRvZEpRc3VQRmRxSUM0ZzlrUUZ2OHB5ankv?=
 =?utf-8?B?WVNTTHZFUis4UEx6TGFLMytRRGd1Q2dDNWpXa3ZYQzdLbC9vTy9uT1hsMDl6?=
 =?utf-8?B?R1NUWHBUYi9LVTY2dnMrRy93Umt3UHZzcUYzN1E5SXhNbmtOc2xZaFJ0cXBI?=
 =?utf-8?B?WTZydWpYdEZ2R1pNcEhONjVaamlnNWpnRm5pTzEwektmWFlmUGZJYmsrOHI2?=
 =?utf-8?B?WjU0VDEyMkFTd3pOMXg2L2tOcmhOR04vcklFSzF6dm1sNVhORldid2c2cWd5?=
 =?utf-8?B?RlhHQkZWWGxCNHQ1ZU1PQXRFZEhweFR2TVFaTkRIbHhSUFBPYWhadlE5SGsw?=
 =?utf-8?B?OTFjWS9UZjgyRUJ2Z2dSVGtNV3RRQmxiMkRIT3IwYVhZcVJoVjRmbGo0VWN0?=
 =?utf-8?B?Z3Btc2hESzkyUmJOVDBBU3RjRFBBME53ZkY0SURKR2lwU1YzQThqRzR3Y2Jh?=
 =?utf-8?B?aWxxU0FaQW50c3YzY1poQ01aN1E2TERTVHBQOHJuSXJKcFA1NkNEbFoyNGZP?=
 =?utf-8?B?K0NscU5WRVBSOVhjSmFOWHV4cU0xNEwwc3lPbnQrTTRPUWRhMFdpTDk4V2xr?=
 =?utf-8?B?bGNiV0JWZjBQVDZldHVONVc1dFVTU1hUSzhWeGk1K3N4T1ZmakJpSkxQTmFZ?=
 =?utf-8?B?OGtGMStzZDFxVzdxRHhnVjZTSzNNMDJEN2RXMGpPU0FvUWlXSFIrUnNaNVh1?=
 =?utf-8?B?WGtJeTFoSnpmb0NraEtDUXp6QUl5TEdrUlFDY05aSnlrV2FpQVRoSUlSaUFk?=
 =?utf-8?B?TFZiMzIrUE56VDZjclh1NDNwUEpjRDF3eWk1bVFvMGlVVEdGKzRsWk5LM0xz?=
 =?utf-8?B?dUhpK1ZZUlRPeC9Sd0pqT1EzRDNEL3hXblhaS3pLdWYrTVNrRlNoMmFXN1Vo?=
 =?utf-8?B?WHNWU3llQzFFcWd6amFNcEZRajI1WC9ib0Y5QzBlYjhsTHFaK1FnUkg3Smpa?=
 =?utf-8?B?S2kweE8vMWcyNmp4ZDBVanUwYzlrK1dYSFB2QmZOejBMNHpEUVhONFBvWkg1?=
 =?utf-8?B?bzh3dVIvNTNYeGdydzBoYzA2TEp3d1RjZ1M5SGpaUlRrM2JBZ3RDSThGQm1H?=
 =?utf-8?B?R2NBM3FPSnUyTVJDQzI2QmFYTkNKdnVKUlV5ZjIzQ0hLQU55Q1c4Y1hRZFRx?=
 =?utf-8?B?WkN5aTFXM3FBS21KUEV2OHdrQUZBdDFoVGI3TWxyT3kzL3lqRzRRWEs3NURn?=
 =?utf-8?B?WWFaNVJNTStzYjdQeXM2RTZKYUZDY2Z0N1ByeTFaOU5CQlVmUTFBY3FNSDND?=
 =?utf-8?B?cXRKcCtMc3VwYjNnbVhTLzNWOG5tLzJGKy9CczBNQVB0V3pCSTJJcStnZjUx?=
 =?utf-8?B?NFRyUHZuOXpoRTAvakh2NXcyeUR4aG95bEE1VnF5eTNPd3ZKYUloSUNFUWFZ?=
 =?utf-8?B?WlpvekxUeDI1SXlTY0hKbDc5R1Rxc3FNUDA2bUpyNWVVb1N1SUU0dWRpUEpn?=
 =?utf-8?B?dHZYSm1MWm1UdVF6MnF5OTg3Uk1mekV6eE5GZEZvakliYmxPWk9MdytnYlZl?=
 =?utf-8?B?M0FQNzQ0aTJrU1I0ZnhZNG85ZU82bjNBUHZkTjVUaGZkK1JyVXMyaCtmbVkw?=
 =?utf-8?B?N2VFSGozMmU2SCtVT1U0TkhmbDJuTVUvWEU0MTkyclo0Y2VCN3crNEdhYkdO?=
 =?utf-8?B?Mk9VVXR4M1ptaXJuZ2x6WDlyVllxencveEQvRkZxeHBhd3JGVTUyZjZ6NFl3?=
 =?utf-8?B?T0NoTE81OHZXeXk2dzJCamZrY2Y5a0dpS29HZ2VNRGVjbDlIclV2OC9Vd3li?=
 =?utf-8?B?eFFYbXZXblBPK2hBWVVoUm83NVJpbHFhVElZeEp5cEZUa1Y0YURON0FVTjZP?=
 =?utf-8?B?c0VSdkFTZDg0Y1NwTXNXSjV1YzNpNjZrUGVvb3k5WGQ2UTF1TUlaYUIxS1Ar?=
 =?utf-8?B?b0d3VnZLdUlvd3lBUUZzOFRJbzhNNWQ4TTRFc1FqSHBabmJHTEp0SEZ0b1I1?=
 =?utf-8?B?Y1AzV3h6VytuWEpvamo5VWIvNWFlWGFvU0xpMUp5T2RnUWFTdW4zUG5nU1pz?=
 =?utf-8?B?aEtXQ0JVZ3cyNFhZMUpBeU15NHJxNjl4TjM3eFhWaXhPWVNxeWdPbEg0eVpz?=
 =?utf-8?B?Sis2ZlViYjdiTXl1RHdKN3FHbHRoRGZvSkFSWnFkU29XWHcvdWlnd2JJVnB2?=
 =?utf-8?Q?tp1TUMDWVW3NBrYKW5aHq/Ahd?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f145ff9c-e976-4d65-d7bf-08db94df078b
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Aug 2023 11:36:22.9427
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9vrtKESVd8AsrN7AA6Jrbstg1dHD7cLQIeyCReaabjLy+nSJSNxB0SsgqYdkLxfsY2P/nPeh/sQBJTzWlke1IQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR04MB7080

On 04.08.2023 11:29, Andrew Cooper wrote:
> On 04/08/2023 8:23 am, Jan Beulich wrote:
>> On 03.08.2023 22:36, Andrew Cooper wrote:
>>> The opensuse-tumbleweed build jobs currently fail with:
>>>
>>>   /builds/xen-project/xen/stubdom/tpm_emulator-x86_64/crypto/rsa.c: In function 'rsa_private':
>>>   /builds/xen-project/xen/stubdom/tpm_emulator-x86_64/crypto/rsa.c:56:7: error: the comparison will always evaluate as 'true' for the address of 'p' will never be NULL [-Werror=address]
>>>      56 |   if (!key->p || !key->q || !key->u) {
>>>         |       ^
>>>   In file included from /builds/xen-project/xen/stubdom/tpm_emulator-x86_64/crypto/rsa.c:17:
>>>   /builds/xen-project/xen/stubdom/tpm_emulator-x86_64/crypto/rsa.h:28:12: note: 'p' declared here
>>>      28 |   tpm_bn_t p;
>>>         |            ^
>>>
>>> This is because all tpm_bn_t's are 1-element arrays (of either a GMP or
>>> OpenSSL BIGNUM flavour).  The author was probably meaning to do value checks,
>>> but that's not what the code does.
>> Looking at the code, I'm not sure about this. There could as well have been
>> the intention to allow pointers there, then permitting them to be left at
>> NULL. Who knows where that code came from originally.
> 
> Do you agree that the patch is no function change, or are you saying
> that you think I got some of my analysis wrong?

Oh, I'm sorry for the potentially ambiguous reply: I agree there's no functional
change. I'm merely not sure about your guessing of value checks being meant.

Jan

