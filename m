Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 005EA609B4A
	for <lists+xen-devel@lfdr.de>; Mon, 24 Oct 2022 09:26:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.428758.679229 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1omrqd-0001Xb-Ff; Mon, 24 Oct 2022 07:26:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 428758.679229; Mon, 24 Oct 2022 07:26:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1omrqd-0001VA-Cy; Mon, 24 Oct 2022 07:26:11 +0000
Received: by outflank-mailman (input) for mailman id 428758;
 Mon, 24 Oct 2022 07:26:10 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ny4u=2Z=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1omrqc-0001V4-00
 for xen-devel@lists.xenproject.org; Mon, 24 Oct 2022 07:26:10 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-eopbgr70081.outbound.protection.outlook.com [40.107.7.81])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1c8f5b8d-536d-11ed-8fd0-01056ac49cbb;
 Mon, 24 Oct 2022 09:26:01 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by VE1PR04MB7325.eurprd04.prod.outlook.com (2603:10a6:800:1af::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5746.23; Mon, 24 Oct
 2022 07:25:59 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::4da2:ea8b:e71e:b8d8]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::4da2:ea8b:e71e:b8d8%4]) with mapi id 15.20.5746.021; Mon, 24 Oct 2022
 07:25:59 +0000
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
X-Inumbo-ID: 1c8f5b8d-536d-11ed-8fd0-01056ac49cbb
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Yu1OAr9bbNPUeIz3liHC+lbbzWZav4XNvf+JvBZfrcIMs5M45dfM9mESU0P0mA1jlMWoZc2sB5E5stNKGmMz2/FbrAmvMukpEv07Zt1KYzbFj2C+34/JWcE49YArXD+rgaWKZBiyNTuhA5WYcJJQw8qb/3cbd02uZDuAJaLec8WJut52ZQYPRoncwb5B8Eqf6lphOfQwSvf1n6hXwDcwiiSXJNbsIDDPYgCgj7aIl4fu/bLk0ZzIT0PXZ7YMvHNhI41zIhAAYHwUxyNc1PNMZ2uFNmuVof01lM1aPqjUxKUbXwmrKclACtD3wjpZA+H6+4W7mcYSn1Whp+s3L3dzRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uPaDHwW2Nd27hbTBtl7yBYj4ui9VHqKZz/zBBXiF8uA=;
 b=W0KQHi3vnEOJm8oCijW9TtWOYlQqoXO50S3cuC4RQqQHu4IpzxtsfckMN9YG2Du8RwozL90FYA3VZOxwMRsAZOTHyaro5j/Dj4fmnPYaIXahMv1Ppw+v6tzLup0jIwYi9eDAFLtjtu+UTsqKugke9YP1+YRp5iaRBQA7KN12hNKSkT0ESKQ328ISgBf2r+yTlW8YO/Nt7nO228SpmVX0ZZvELdpEPuQDV5ABMN7ycTvKkQJ2OwltHK7ldS/dpXPTt8oYiczehLYsxOITrRWpXrki6YhETYBOOAZfhF1QuG9tfEvGpLUVg6URuZnKwcWM50ZKeFyC2DIzNHcIruemJA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uPaDHwW2Nd27hbTBtl7yBYj4ui9VHqKZz/zBBXiF8uA=;
 b=BOC2U0Mqz2XR1sgEPiKie1uybj6YEtQO0DcWtnO5bqcdD80MZaJa8qMdwZzFhDJ3vGaFHrU1+iAMd4DmU/hQTaTk1j7TvDoOfE+g4UtUNyJ+Vfi4/4xESWnHQnpyH9A/jFLLOBMSSnl0PljbxP90+CKzSWxLUMEcBPbJfT/DRiTKOaYVntRxuuzRU+b+c9dxxMke89j9dVr0uHDFSRL2ouHNO3vKw+Arkz2BHl5SBpSkOyvENQ6hhwFPMn2WGwyt3BXT52tPuMuExmjn8/oQmVJZ3Lgav6QT7YnwvlIvEZUtfeCe+Mr9OmLjOzc5OPXPXLrk46MZkb3Yy4iGaWL5fw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <8b2d008b-526f-dc36-71d6-81b653bbf467@suse.com>
Date: Mon, 24 Oct 2022 09:26:00 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.3
Subject: Re: [PATCH v2][4.17?] core-parking: fix build with gcc12 and
 NR_CPUS=1
Content-Language: en-US
To: Julien Grall <julien@xen.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Henry Wang <Henry.Wang@arm.com>
References: <3e72f386-7afa-84a5-54c5-14d17609dac7@suse.com>
 <61e8475d-868d-3ff0-041f-8f6790990ce4@xen.org>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <61e8475d-868d-3ff0-041f-8f6790990ce4@xen.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0061.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:49::16) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|VE1PR04MB7325:EE_
X-MS-Office365-Filtering-Correlation-Id: 1d0a05dd-3914-47c3-bcc0-08dab590ff5f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	UxClFyCk8Lvs+LqQTG0Ggt9zxEp/PUwiKH0Fv11c17UCw1zO7VR+VH4LpxmSY2la7E/q3hbCkXSl1ziKzq7sXY5JNT6XsC/YIo5qw3MHq0bOyUOgbCx4JreyvWxtJ/bxgGIEskh1a2ctShxKBSE0ABLgtMCmWKRnXlqzY4ag8tfuenPQSr7Mf9EwySNBA3OVr2w4b1El+xDfYGX5ETbu5hgyieN2EFlsEw0I4AE+749z7l2KgFQFxyfECoYF4wpsxh+o2sGWzXCyjHyanxO3J/gNLBMS4lVoCOtw3JrekZlyDiioTklRfnecyVxGqD7bNuNw3qgr8+W9DVLQFbjMNsM5/Ufg8/0VRhFY2Ew9TGqSh1E2wfwwQG9LF4P9DuLvCow40jIcsVTJioBJjGdIOG5nefsCNIDaEpXgJlrGYqRArQduhZZfqChsYOdhUHLDN3wDMsmAlsB6mXso8Uzm1yQg+Ho+oZJTiiEMw9XSE3D4PFV/k1aK9M7e+xm6RRuxxz/98Iuzdn6RVlfnp6NV2LHzi66OInj/i/1VG7Fe1lYp0CRmzEftm3AqZb2CWKAF4C8jinTy0gG5jCDr4ZQlsEyi/FlNcJVOAizl837paHqoat+xUAAki5rhADKDEZW5us605ZA3YvGBLLaExGZSK/tdSCBRuMiuzFdXuZ8Q1Xqrv83YPt9kLOLTzTioAvyFtTqyQBAMbCqKoiYKdttrKv+1RGCS8mHK/UOabni8di1sjhDYxOg5yHamhSl0sB0zOzlS0DcpXp6r7UGOa8qfEzEnr/zJE8U+Ph55jJw8s/g=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(376002)(136003)(366004)(39850400004)(396003)(346002)(451199015)(186003)(2616005)(83380400001)(31696002)(86362001)(38100700002)(2906002)(41300700001)(8936002)(54906003)(5660300002)(478600001)(53546011)(66946007)(26005)(6666004)(6486002)(4326008)(66556008)(66476007)(6506007)(316002)(6916009)(8676002)(6512007)(31686004)(36756003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UGE2RDRkem5nYkdwZHFuVXRacFNReDNzUjAzcVYvQURGU0FXUUJWbDNTaU1a?=
 =?utf-8?B?YnVhYWpnQWlOUk5uMC84bC9JSkVtWjFTRGJwYWJVNFZCK2VxMnEwWTZIRUN2?=
 =?utf-8?B?K2MzQTZEMmJQMFNUNHFQcnVqZC9TcXJRc3lEaHRuV0NPNXpJeTA3K2tOSE81?=
 =?utf-8?B?QkZ2WVo1QTErTVRMMHJGMjM4Rjd6c25KUFhONHZFdlgrV1FBZUlCSThjbUJ0?=
 =?utf-8?B?bGlVdFJFSUlPVmRtaUU1NDJpYmRmOGdMTkdYT00yaUVVbVdTT01ndEh5RjdZ?=
 =?utf-8?B?WXIwTGx0cEJobDdBKzg3c2ZpMzNWN0w3SlE3RVlUakdGdzFDTjYxbVk5UUdH?=
 =?utf-8?B?UTR6R3lTQVpoVjE2dm5HVTVma3lsdFhKU0MwaTY1M2Rid2t2WThvT3NxTDZn?=
 =?utf-8?B?VEJpWjBtYzJvcFp6RDlQTWgzRHpzM25tRkRZdlFRVnBabWJJV1pPZUdJTkZo?=
 =?utf-8?B?c0ZhdUlWSFRJSEU0MENWVHdJdmxuVkxyeUdSMktWanJuQzl0eGh3WFRzSDB3?=
 =?utf-8?B?TldvRVk5MEV1bk9jSFVUdDV2WGtqU2lUeHhGd1RMQ2ZSTklKSnVObCtrVGl0?=
 =?utf-8?B?YXpBL3F6aE95SW9BcFdGQi9kbkpBZzZKUklaMFpzNDhMbVExcFd1WjFFTCtR?=
 =?utf-8?B?bEhlQUVKZGlnUFFpdnJHWnpkSmpvRytveXQySFV4S2Fkb1NvQXBTSVNtQklF?=
 =?utf-8?B?VXZlbGFHcWEzQUxUTk1vWlNOWmJJMUt4Rm9xZk1WUnowYXZpQTJyaytvWjNi?=
 =?utf-8?B?eUVOWGNrREdKdzVwWERBcmNlU2N6dGEwbG5YcU5vb1ZpLzZHN05zakdoY2pi?=
 =?utf-8?B?czZJdkFvS05nWmQ4bkhLRCs5cFIraTZJaUZ1NlhoZnY0MGwrOXJjVlUweUJj?=
 =?utf-8?B?QnM5d3hmM3NTSm1pNThURlUySjRibitZdXFVdW9id2xxSTIwNjluV1ZjRUw3?=
 =?utf-8?B?WnZnbXo1NkhGcXhtWk5Pc0Z3eWNFQjlsR290UTZ5ZVNhWU9xUXk5eUhaSWxm?=
 =?utf-8?B?WkhwL05JWFJOcFRuTWp1V21JbTdTZW1yaVk4ZzFncUg1UlpPeGs1NDdRUkZi?=
 =?utf-8?B?SC9mbUpLSDRyREFXRVYvWHJkZDc0c01WWlVEWFBhWkY3VWNqSjhwUFRPTk1X?=
 =?utf-8?B?WUp1YUNQb2NjYjF0U0VIelJDTkQyRkxSWWpmYllGM2R5MlBnOStjY1oraW8y?=
 =?utf-8?B?UVk1VU1mN3NtcFVDaWgyV3pWRVNMQ2pZYlZGLytVYmI0UFcvdWMvWGFkbTB1?=
 =?utf-8?B?eStVRFF0Umg4L2x4b0NhYW5UZVh1OWtoWVorcXllSlkwUmhweTlZd3pzNGNJ?=
 =?utf-8?B?aUtnY2pzZFBUKzhIVVpSTHVxcHFFVHlGalpGY3FaY0FUWElMeUhNdkduNHJz?=
 =?utf-8?B?R1gyMlV1Zi9QdGNOMG0zS1dWUVc3S3ZTM1B0R2ZOZHdtbnE3RFB2amwzNW05?=
 =?utf-8?B?cUh2bGZKNTNJa3ErdHJoUUdUdUh6TTdQOFplZU82d0hDejFNV0xuUTZicThw?=
 =?utf-8?B?VG9sQUhxS2NZNXZyODFML1laUS9KR1NHK2d2N0pZRno4Zi9JZzJSeWx3Yzkw?=
 =?utf-8?B?Vzl1YkwxaXArbkFrSFA1c3RKakdvRW9jVkpyZk5hV2YyRUU0RUJUUTQvbC9r?=
 =?utf-8?B?enFzUkJIMnVoN01vaXZnMCtMaXJSemFuMDl0cEZpd3RwaGRpdTlWVHRqcmVt?=
 =?utf-8?B?aDg1ZkZEQTRWYnhkeUhvNXora0FPbVBKRW5PT3g1WU9FYVJyUmVITkt6Yk10?=
 =?utf-8?B?d3RWOUttNjNUeFZjZ2RxclErazRhR01wcnB5eWsxTVROMjdLdktOQUtjZGRY?=
 =?utf-8?B?Z2w3SWxKMEYzeGJGdHdvU1EwS2xlUXNBbHBybUFyQ0dpV2JhckZOSGptWFJR?=
 =?utf-8?B?WHd1WkFZOVplUEZ4ZHlvNHYyMTlVdFlZd3lpbkRTVzU5VVgvSjBNbWNvT2lX?=
 =?utf-8?B?Q05hdUdlQkVFMVNxYkNHdm4zWUcxRUJNT0Y4ejdQWVlTcHVKci91YmsvZ0JG?=
 =?utf-8?B?M3VodURWeG1sdXoxTkVEQUtVcUMxaTlXY2x0V1M3ZWd5NG1hbW5tUnFZTDhj?=
 =?utf-8?B?WnNIK1k1eEVMWjV0anBWMER5dU0rbHkzaFNxYjhDTCtPS3BoTkFFTkZSNEdO?=
 =?utf-8?Q?vK5bKBYQJv5dKvuJajgI0oElw?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1d0a05dd-3914-47c3-bcc0-08dab590ff5f
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Oct 2022 07:25:59.1978
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Yn7EDE3qrN5pUK7mylG6DeBST1ccRUs76JQR8CwsN8dY37YjsSfgZeMMB0TbhrkuHSJVJUfZrAd0UIb7tYg7Mg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB7325

On 22.10.2022 17:30, Julien Grall wrote:
> Is this intended for 4.17?

Well, yes, it was meant to be - it has been ...

> On 09/09/2022 15:30, Jan Beulich wrote:

... well over a month since it was sent.

>> --- a/xen/arch/x86/sysctl.c
>> +++ b/xen/arch/x86/sysctl.c
>> @@ -157,7 +157,7 @@ long arch_do_sysctl(
>>           long (*fn)(void *);
>>           void *hcpu;
>>   
>> -        switch ( op )
>> +        switch ( op | -(CONFIG_NR_CPUS == 1) )
> This code is quite confusing to read and potentially risky as you are 
> are relying the top bit of 'op' to never be 1. While I am expecting this 
> will ever be the case, this will be a "fun" issue to debug if this ever 
> happen. So I would suggest to check CONFIG_NR_CPUS == 1 separately.

You're aware that we use this pattern in a few other places already (I
guess in my local tree I have one or two which aren't upstream yet)? Just
grep for "switch[^_].*[|]" to see them. Also note that it's not just the
top bit of "op" - we merely assume "op" will never be ~0. Personally I
prefer this way of coding the logic, but if at least one of the other x86
maintainers agreed with you, I'd be okay to switch to using a separate
if().

Jan

