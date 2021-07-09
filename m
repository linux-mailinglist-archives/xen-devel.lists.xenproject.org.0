Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 716FB3C236B
	for <lists+xen-devel@lfdr.de>; Fri,  9 Jul 2021 14:28:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.153633.283819 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m1pcT-00010o-LC; Fri, 09 Jul 2021 12:28:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 153633.283819; Fri, 09 Jul 2021 12:28:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m1pcT-0000z1-Hk; Fri, 09 Jul 2021 12:28:37 +0000
Received: by outflank-mailman (input) for mailman id 153633;
 Fri, 09 Jul 2021 12:28:36 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=iqbd=MB=citrix.com=Andrew.Cooper3@srs-us1.protection.inumbo.net>)
 id 1m1pcS-0000yv-3Z
 for xen-devel@lists.xenproject.org; Fri, 09 Jul 2021 12:28:36 +0000
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 2dcbe844-e0b1-11eb-85e4-12813bfff9fa;
 Fri, 09 Jul 2021 12:28:35 +0000 (UTC)
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
X-Inumbo-ID: 2dcbe844-e0b1-11eb-85e4-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1625833714;
  h=subject:to:cc:references:from:message-id:date:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=qZIpxNz5S7vxlr6U/6C4q/EeeNlbnsZjFUafPE8UC5w=;
  b=eSPZ+W9H81/zFVhE2zujazYqn1xLrZhUJQ1SUQBI6RVS7wNA7j+igRT5
   3P2FLmLeMA4bM8cGg9KVkoEY97uDNz5AKDWe3DLqGoMu2f0FwHFvhtGsF
   KWwejSHJlXhTGbHZTITrqWKSORV3BpEYF8kl6ybA8RjiQyNt2cComvJwS
   E=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: k9VC9Q6oOItfahc0WPKqEt2Z8vrkp+PK/aaAmSamaaJE1OsBMiogqC0epIo3KxvSs8aiQoO7x3
 kF3qod1+EC03Vg2BPL1dmGHV9kZUpImxQo8l7kPqD4EOUhpGDVbwpvRwyB7gfwEASp4PlS4WPK
 aCFoO42wVwTz641+yxrGqh5PD+sUBMeuDz/2soyRplU6v/DXFoPe0dbxK81wR+nYT+YJNUr/fI
 8WyzK9R+pCcrCebp5ddv3JYJ+5pPwT5L9rxBsVbJ6J/iuNoRlBeYAAlGGrsQtkXuj02IGvX/1H
 reY=
X-SBRS: 5.1
X-MesageID: 49568524
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:00ylt6HDw8GdU5H4pLqFH5HXdLJyesId70hD6qkvc3Jom52j+P
 xGws526faVslYssHFJo6HmBEDyewKjyXcT2/hvAV7CZnibhILMFuBfBOTZskbd8kHFh5dgPO
 JbAtVD4b7LfCtHZKTBkXGF+r8bqbHtms3Y5pa9vgJQpENRGsddBm9Ce3am+yZNNWx77PQCZf
 6hD4Z81kCdkSN9VLXLOpBJZZmOm/T70LbdJTIWDR8u7weDyRuu9b7BChCdmjMTSSlGz7sO+X
 XM11WR3NTsj9iLjjvnk0PD5ZVfn9XsjvNFGcy3k8AQbhHhkByhaohNU6CL+Bo1vOaswlA3l8
 SkmWZuA+1Dr1fqOk2lqxrk3AftlBw07WX59FOeiXz/5eTkWTMTEaN69MFkWyqcz3BlkMB30a
 pN0W7cnYFQFwn8kCP04MWNfw12l3CzvWEpnYco/jxiuLMlGfpsRLEkjQdo+M9qJlO81GlnKp
 guMCjk3ocVTbvABEqp+FWGqbeXLwYO9hTveDlIhiXa6UkOoJlD9Tpu+CUopAZJyHsMcegx2w
 36CNUfqFhvdL5dUUsvPpZNfSOIYla9CC4kdljieWjaKA==
X-IronPort-AV: E=Sophos;i="5.84,226,1620705600"; 
   d="scan'208";a="49568524"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OKRowcQU8uGfqf0IE/9WQwgqQjpR4YFbJmCBSUGOX2vFeYD7G6wsl1I6D9Rd9hA5aHzg8DBszv1HfFOtMgMGX1iAsgSNoObZK3SL7wpmXABH/DvgDh3Pw05TbSvDdBDR/DFZfjwsgd/z5a1Dc9rDBwDFpdIJAEOCKJnOTRCKHOZVui062NtrbvY/qg4rafaRLfMLSbkbiKwpKtntEHLz8RulL8xEhc9ufH30cCZ8f4y5v/gX1Dkg9U+OzbjF/1fDTuB95H8Z+U32xpv3fozRjQGKm5itC4ZNBoOztUcX4ByDuratsGX4vKnmGhkaJIvMk72zMhu+YvHW22IUE5f0wA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qZIpxNz5S7vxlr6U/6C4q/EeeNlbnsZjFUafPE8UC5w=;
 b=FZlv/mS7HEsrDQYKsA5K90/igRyKP5yP8TlUQ5PebwN9sH8cs3At5cqhv7ZzQUaSnn8h+SgjrvRP6ZCM2mRNbURLwCs/4WXZlVFJWs8t8mro5SMgoDWgmlRmnAP1oY+jLx0gZBN1aT60UF7wrDRqXLGXesg5dtJ2uw9GIjYEGGAu5k8U7aVm/rp4lLrsBgoC6BKTE9A2LBZku2LzUxLA4wZpbNVmEbh2K04r4CMx8vPEYBPw8t4BsGpqURpkpARYANO/SIpbOmffTKm6zPwMmIUzcMxs7gxnF90fehVwQ3mMo9M6+efxO/EPUAoXA7bGHL1Y3/qHA/uxjucN/dB48w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qZIpxNz5S7vxlr6U/6C4q/EeeNlbnsZjFUafPE8UC5w=;
 b=vC+qP6KNWOm3f3NjjZhl8rxNzQT452vcmiG8XoZADTMFE4T9AY0gCx/emDmfnpdly4gChWi7CEnDJr8QCwM71sX/W3OiprUiO+bcnr7Va5T6a0oeX+EPI83jQ0bCb47Vry5pVCVvSvPluypESvdNaiXrSc+LS7mKvkTBc38geaE=
Subject: Re: [PATCH v1] automation: document how to refresh a container
To: Olaf Hering <olaf@aepfle.de>
CC: <xen-devel@lists.xenproject.org>, Doug Goldstein <cardoe@cardoe.com>
References: <20210708145628.8902-1-olaf@aepfle.de>
 <b405e7c8-44ac-56c0-8fcc-3c25ac4b3914@citrix.com>
 <20210709142333.45b5795b.olaf@aepfle.de>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <befa4ec9-33c1-6bc8-c2c4-f0187d3012a9@citrix.com>
Date: Fri, 9 Jul 2021 13:28:25 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <20210709142333.45b5795b.olaf@aepfle.de>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
X-ClientProxiedBy: LO4P123CA0005.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:150::10) To BN7PR03MB3618.namprd03.prod.outlook.com
 (2603:10b6:406:c3::27)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: dbce9186-24fb-4774-536d-08d942d50ffb
X-MS-TrafficTypeDiagnostic: BN8PR03MB5140:
X-Microsoft-Antispam-PRVS: <BN8PR03MB5140C537507056F0540C8516BA189@BN8PR03MB5140.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1148;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: xWB/DCapqDLdaHWzFWZjp+v72yjHF47IMAFAHTBZI6ficBU03P+bFNWjy+B6VYdBO0a/fO+FUqkodN0JtlNF+cSkyHiUf5sqJEBl3acEEW+8wSdY2Ghj32/c/sRqUlgSH0ENUp3Btody9XIuMyWU2j9gGXog8p2yVr6S274lgU2QePXyQbzAksIgks3siF3mq4WVWbliM2hRnx95u17wOJhFuB/HLfpMAozhiOzJBwHbjZI7yT4E05ybiANW37TQ7l/xviqU7V2+PKRZ9vRg25qkkRKU5u1GRPKJ3Jk0EK3/tYGpUrg3BM22MNd/Nd8pVfM/btxjLa00+h8Cs/ey/DO4kJtHAX3aUAJx4yMhJOLTCzhGmW9kEeoacKv6VyoW0sfYycSMzAK4Id1GidR6VXItUhruFbpLe/reds3LuMrUiwIxxePVzZDiBhwUE8aT6DP1j+xZn8VRTNybxUIMiOcQxhlXgkoY7TnPNAfvjVfHxLmPul64DCIwfjFjk7OkTVdb905pny/rmSMry4a3MNE0QFZcHQUzITTBsTdklkxyNFxTIpfkAH4qc3jzjVCleZcALBWjVp/rF0JviEHcPl+GE/2PyPgab1uVRGPKt2umhq/HKzfd+K/wMjF/NvgtV5wuaxytjJ5vGoTZ5RpbHc49aYpv6KdVJ6wOYeSsC7fGI4UPLdx6zrL5r2lVrhDb/zZ6JmZCp5wNLvsOhO2IkHYMdDg0yX0iMFdFCkX7NDs=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN7PR03MB3618.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(39860400002)(366004)(136003)(346002)(396003)(16576012)(316002)(38100700002)(66946007)(66476007)(66556008)(5660300002)(53546011)(8676002)(2906002)(26005)(36756003)(6916009)(956004)(478600001)(4326008)(86362001)(4744005)(31696002)(6486002)(83380400001)(31686004)(186003)(6666004)(8936002)(2616005)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZGsxbTk2MWpzNTFDdHh0ZjV5aGl3MnhpUkdyM2dtWFpONGxQbFRHUnpxR3lN?=
 =?utf-8?B?MVRLVmNSTnVNZUdpK1hDd3NjOUdKYWY4TUxhQ3g0ZkhKLzd0QzlBUm5MLy9N?=
 =?utf-8?B?czllTU53QWNOVEdLdDNScVJhRC9Tam5VbVoyUXJPMmM4L01TQ3hEZDV4MDRm?=
 =?utf-8?B?cGQrenBkbkZKRFhzYUxLTGtFenFxZmRVellhRHlLSjVtY1N5Q0FLK2wxODBC?=
 =?utf-8?B?blR0WTd4and5Q3lmSUh4M2o0UEJmcnJxbUV1NFA1QWxJbStFaHgwTmdIWVM4?=
 =?utf-8?B?Y3dJNFNuOVZ2b2FSQmdQS1JQcnYrM3RueE5WRkNmSE5jUldrc0ZsdTZFZXpq?=
 =?utf-8?B?QXVyVGNUdzJ2eDladklUWjBOdzV2am52MTRCVTBKVnpFUmg1V09PajJ4dFVW?=
 =?utf-8?B?YTk3NGpUY3ozRjU0UitNekw1b05KSTFOcE9LVkljUDBSaTU3akVkR3YycVgr?=
 =?utf-8?B?UTFXNGNCQ3dvaW1EdWp3ZC90SGd6dlJaL1NZNk9VT2J5ajBmMnVhS0krR28r?=
 =?utf-8?B?TGFGQ1FjYXZJREJ3eElkTEZISktGS2R5a3p1TC9QNUltNGlSOXNRYWZQTG1X?=
 =?utf-8?B?YkpXNENrcDJXNzN6NzZ0UXZ1K3VVOWNsM3ByamN4SSs4dXhtbms2OGhxaGRT?=
 =?utf-8?B?V0JmMTBYclArSDFMWWZCR0JIQzFiMVNBN0dQb0Vpd2wwZytGeXJ6bEJOcDFO?=
 =?utf-8?B?eGZDZWVPZk1aRkxOMGVid1YyaE1vTFVkRi9zQ3Z6eDRaUGlmQi9WS0JuMHJ1?=
 =?utf-8?B?OHpyNGJBOWxaSnVqK05vd1dCNHZieEw2b25Mc2gwb0paMVhpN2hnUVEwd3RS?=
 =?utf-8?B?V2l0Yk9zZTd4L2pIRGxnSDBjYVZMRkY0cVZnTWt1bnhnbzVFUTFsRXZCeVN2?=
 =?utf-8?B?RTEvc2RnK25aeEJ3RGVubEluZmhEbXhIN0V5NmlaOEhNVk5ydXl2VkUyci96?=
 =?utf-8?B?UW5tazBGNjJRYkpGS2wwL1RQMW15Z1N2TGVXdDdIbmpxb0RUOHpOTmtqR1Rr?=
 =?utf-8?B?STd0VHJoNUhXaXltUjBuR2lYSUpkUmRYU0I2aGw0MXp4VGVJTkh2dllBRFVx?=
 =?utf-8?B?YlNpNG0rOU8vck4wU2srUm9NTnF0OWVrZWo1QWVqQnlCak5TRklSbE04NmhB?=
 =?utf-8?B?NTlUSVRWUnJPdnlYMkhwdjFLWDRSY0tMbmx2M0VwbGFSelFjRDdjdUkxR3BP?=
 =?utf-8?B?K1pvNzhtbkR3Q01WVmVaODdqSXBPcnFOeFFsMitWT0lxR1h3cUc1OURHa1N2?=
 =?utf-8?B?ekN0M25JMUNOeXVzNElwYkdxRUFIVzRDdG1BcTMybEdQUTUxSVYzL0tVdVhH?=
 =?utf-8?B?QlFibEtBM0tPTDRGNFprRXhYS3I1Q2RjZnNwTXprUVR2czBIOWIwLzRkV2gy?=
 =?utf-8?B?ZUFWRnd4Y1NzNmVKNE8rdjV0bGV1ZU5LWlk4Yit4c1kyOFRTclFGcGROZHI0?=
 =?utf-8?B?K1pYaWQ5RDBLeG1udzlVaVNTRnp1R3FUQXlRczM2RGtaeTZwT0tsdXl3TzJj?=
 =?utf-8?B?d0RuK2xQQmlIQjh5NTZqRytHRDZPUjVjclNrVzJtMDk1NXdFSGlKTHdpY2pW?=
 =?utf-8?B?ekFCVFJVT0QzRkIvbEtGVWZQSEZiellVZXoweCtqTnZoT1dQM2ZWTWFsSkVV?=
 =?utf-8?B?SWxpN3NRaVl1Qjk1eVNRdERjSVF4VldEcm81a3BCSXVKQlZPYmdhc0E4dkhM?=
 =?utf-8?B?andMNURCNUM0a0NvanpyTVZUZ2xHVXZsMnM1MXd6R0xlQ2pDaGhsQnFvRWVh?=
 =?utf-8?Q?2y75OPcFanDEVhfjMVkjj8PAvBch2nv6fZX1fc7?=
X-MS-Exchange-CrossTenant-Network-Message-Id: dbce9186-24fb-4774-536d-08d942d50ffb
X-MS-Exchange-CrossTenant-AuthSource: BN7PR03MB3618.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jul 2021 12:28:31.4061
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: O8kgdlnpxBiEpQEodkBZb7PTSK2kzVa1eaAg+Q+wNvp0CX3UQdGOVWrFVatUcXquGXoWaWK498b9r6KLwb0dswT7AIjPXpGeNya0JPaC/3M=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR03MB5140
X-OriginatorOrg: citrix.com

On 09/07/2021 13:23, Olaf Hering wrote:
> Am Fri, 9 Jul 2021 13:02:54 +0100
> schrieb Andrew Cooper <andrew.cooper3@citrix.com>:
>
>> Do we need the ls here?  That sounds a little like debugging.
> Maybe not, it may show a long list of unrelated stuff.
> It is just to verify a fresh container exists, as you said, just for debugging.

Ok - I'll drop that line and commit, then we can see about rebuilding
the container.

~Andrew

