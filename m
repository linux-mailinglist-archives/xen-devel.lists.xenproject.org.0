Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BA493ACA5E
	for <lists+xen-devel@lfdr.de>; Fri, 18 Jun 2021 13:46:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.144513.265981 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1luCwr-00063K-Lm; Fri, 18 Jun 2021 11:46:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 144513.265981; Fri, 18 Jun 2021 11:46:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1luCwr-000613-IJ; Fri, 18 Jun 2021 11:46:09 +0000
Received: by outflank-mailman (input) for mailman id 144513;
 Fri, 18 Jun 2021 11:46:08 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=CUMw=LM=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1luCwq-00060x-E3
 for xen-devel@lists.xenproject.org; Fri, 18 Jun 2021 11:46:08 +0000
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id b022b560-f00f-463a-8052-c34740875931;
 Fri, 18 Jun 2021 11:46:06 +0000 (UTC)
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
X-Inumbo-ID: b022b560-f00f-463a-8052-c34740875931
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1624016766;
  h=subject:to:cc:references:from:message-id:date:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=iC8LLHdweiPa0bZPM+F79j66kYNsC0f2oGJ8k0LDe2c=;
  b=gnpnlmNi8gz6OcTT8hzGL57ElHFDVcG/1ARmLlEmXnw2vQlXYXEYZhPy
   ssH4vQ5UDWwtBHVpoohSVJOFrNZNHSMfRfBFcsZE6WUFwO7y9QfPQLTGB
   SsL4uoFP6lMycE7wDNXWy7ZUdZaTu8K77AaQsE2hw+0o2woiqxV+UXEg5
   4=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: 5TD3GT5ZDzb8axULyBOFaU1woHobxXWN1sQrSwJSq6gKCkadtO5SiZkpVVR+QXDyWgQEw4KH4A
 Yv4QaMEkvjKww7IusSKKwvVHCvcrBY+ACGPEktCL5L8jML3W5/y+fuoCFEFEa2JsL1frgSDuto
 45m0qTHor7tVZ1bCqWji0Q2ejozMI08RkFj2Liinrr/XZaSADO1wPyya/aGp0rqTw4h3cZ4KsM
 Yg6zzcym6eW1Xf8EdGqAnZgiFr20lQjfs5bVEzvXjwIzC8qT94TfODmMQU7QNjGyA8mlLIikZl
 2SQ=
X-SBRS: 5.1
X-MesageID: 46437686
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:+P7hNq0/LRHXDPfG7OOxqgqjBSlyeYIsimQD101hICG9Lfb3qy
 n+ppsmPEHP5Ar5OEtBpTiBUJPwJk80hqQFn7X5Wo3SIzUO2VHYUL2KiLGC/9SOIVyEygcw79
 YYT0E6MqyMMbEYt7eJ3ODbKadZ/DDvysnB7o2yvhQdL3AfV0gj1XYeNu/yKDwEeOAsP+tdKH
 Pz3Lsim9PtQwVsUiztbUN1L9Qr6ue71a4PJnU9dlYawTjLqQntxK/xEhCe0BtbezRTwY06+W
 yAtwDi/K2sv9yy1xeZjgbontdrseqk7uEGKN2Hi8ATJDmpogG0ZL55U7nHmDwuuumg5Hsjjd
 GJiRY9OMZY7W/XYwiO0FvQ8jil9Axrx27pyFeej3emi9f+XigGB81Igp8cWgfF6mI71esMlJ
 5j7ia8jd56HBnAlCPy65zjTBdxjHe5pnIkjKo6k2Ffa40Dc7VcxLZvuX+9KK1wWh4S1bpXSd
 WHVKrnla5rmBKhHjLkV1BUsZuRti9ZJGbcfqBq0fblpgS/nxhCvgclLYIk7y09HD9UcegO2w
 3+CNUfqFh5dL5aUUtMPpZ3fSKJMB2FffvtChPcHb21LtBIB5ryw6SHqonds9vaCaDgiqFCxa
 j8bA==
X-IronPort-AV: E=Sophos;i="5.83,283,1616472000"; 
   d="scan'208";a="46437686"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RnTj67ZdkGp5V5ibX0jI+qKQRD9HRj8jcdmkgsQI9Cr2XuDZLSwsDt+zFCGztGE4CIDDzLWqAxy9qaiJb/eLTTE+ojreg5KmMB+QNjxAOWBKonUwGlvzG4zL/yXqf9IN4Oo1jlEKKlmsKUiOb5IxGRJhp+YDK9yysMOaI+JLsA5/t2JRs9g7GrSO5GcEyyKMaLkC6R/2kcD1P238tj/m1IQfpp39dO6d4ZbEoo9QvKmfIwbjkBsvNQPc4gZGteLYMmhVXEVipT1J0OR49thQjPVujgNChNiO14LLTB+dmZS08c3NMKKE3X4S5ZPnduXxMcTqqGsANFoENhN9ZcpC+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QGKFxGyTtatTV1/5mlTLYWzymcf6l52Oic+FjnOF2/U=;
 b=bkIMTMUeKZnW5SzEjjFWlm3EMdcQm3W0PN8k/TmAKPmHAVOwGH1mHHSF0FPvfJIOIvWle04BZIVoyuVhNMd3u15fGyKoik1mSpihrAKMK6vM0autf3d4Wb8i/tVERqC3xq2LZe2fsUdjDL6EcXxUZLXcyTfcbfDbAbqmLWqRlyulGhBcQuEWFP7lFFACm7RyvQLLDS6CvJIawIcSFhE+EMNtlY7jZ1Kp+LGr+Tm9PlBwecRPRGS0deXEK74LH7PkjhQQGcVYeB61+UYz4YEBTS5Z/lnID/5inS/KyjgfmFoh6RgCU8cm6OwVfZSaGQmNB7IdOYOA6AmtJJCoxGNlEA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QGKFxGyTtatTV1/5mlTLYWzymcf6l52Oic+FjnOF2/U=;
 b=PkWgQJJ2/8dGIFiYEvP4YQHLmM0Ue4wHTu691YrBkPFas01DT6Pe9DspFxlZq/BZfVMqyjdeStWQoCzjj8jGpPqPq0ZrfsB6J4469eWGRRyIcCE3WgBCN2g115pUPxvcpEI93esOXYzh6WUD1UOUDExJU+NRMeQ2dAlbZCg8QBo=
Subject: Re: [PATCH 1/6] xsm: refactor xsm_ops handling
To: Jan Beulich <jbeulich@suse.com>, "Daniel P. Smith"
	<dpsmith@apertussolutions.com>
CC: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
	<julien@xen.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, "George
 Dunlap" <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>, Wei Liu
	<wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, "Tamas
 K Lengyel" <tamas@tklengyel.com>, Tim Deegan <tim@xen.org>, Juergen Gross
	<jgross@suse.com>, Alexandru Isaila <aisaila@bitdefender.com>, "Petre
 Pircalabu" <ppircalabu@bitdefender.com>, Dario Faggioli <dfaggioli@suse.com>,
	Paul Durrant <paul@xen.org>, Daniel De Graaf <dgdegra@tycho.nsa.gov>,
	<persaur@gmail.com>, <christopher.w.clark@gmail.com>,
	<adam.schwalm@starlab.io>, <scott.davis@starlab.io>,
	<xen-devel@lists.xenproject.org>
References: <20210617233918.10095-1-dpsmith@apertussolutions.com>
 <20210617233918.10095-2-dpsmith@apertussolutions.com>
 <07566583-d4bc-dfb8-eccd-d779783d959a@citrix.com>
 <3345073c-45ab-b875-6d3c-32dadfb63fc9@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <d26ee7f3-4840-a601-7447-cc4d97e23dae@citrix.com>
Date: Fri, 18 Jun 2021 12:45:48 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <3345073c-45ab-b875-6d3c-32dadfb63fc9@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
X-ClientProxiedBy: LO2P265CA0037.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:61::25) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3ac35b83-0ebc-4c21-e467-08d9324ea40a
X-MS-TrafficTypeDiagnostic: SJ0PR03MB5837:
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SJ0PR03MB5837796A32ECC929B010EA8ABA0D9@SJ0PR03MB5837.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: HttNjEl/+CQGPBPWf0JgUqaz9mF/oKUMhdSWwSaamFwlJbBut34/2/HJ0ufYLv3OjfhaRXd7a40Rc/DIJSLFWqtaQ5/cxUrU2F8VxCoO+adO3FvC9bem9t6fs3jQSQmTMNJEOWWnM8nnlbuAuDJhgqe9rBjurSUdvSzqqFpnJ0j6iZoLN5yQJ3UTYuvN/zKWKEziLZEy53HKbPUDXX0Ld5sH+WY/h+tzkf7ZHZq+2s86xSYRB1MGKVChivHfObk1aR+UbM+aTQl+EpBF/4ywh0udw2dEMjhaKOEYe4+fFBLa9X32V9B2X6AS84zjrABPcoxAr8ObRfoP0L2y/I8gREpFpHZOmYUUcCTfhy6A8/QDbYYKz/qEHBMe5XtyZS5hJx5pNXYgpGR7Ng2IXK6/XBdxVkD3mbR3d2lLYJfpydQy0KDmACoEXO5EWBgJ8DC5FkjesLgf9KS+tBjpEwjhX3d1dEGxn18OMcKRDtq35iDecLmv68c1EJhcQW1fRiLJHwmCb/u2L6wuUaxkZDH3GYL6J3u9GQWi7c3Pl27s0joZbS0+DY9ZI3jVpKSoyJtgEdPnhnZziyyexohrnqRU6ss08qwubqkYGrbaunF1ZhJt21EvnUKuBpocLKfm4TrOtc0GyfTnOoOdRyOrsZ3BLxdcZbSMaHXb7B2Kd4mS4i7g9GCqmg43bGcPdUcDLSug
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(376002)(346002)(136003)(39860400002)(396003)(6666004)(83380400001)(66476007)(66556008)(7416002)(16576012)(2616005)(956004)(8676002)(5660300002)(66946007)(36756003)(31696002)(2906002)(38100700002)(6486002)(316002)(8936002)(110136005)(186003)(16526019)(53546011)(86362001)(478600001)(31686004)(54906003)(4326008)(26005)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OUxOaSsxUTBkSGlmeXpadDV5WnowNlY2TGVYSW5JN2pGcDc0Rk51NVZ4eGU1?=
 =?utf-8?B?NFQ2VDNtM3BSa1NnaVIxV0NEb1lTZXB1aFFIU005SXMyK1pmcEZnMWpsTXBz?=
 =?utf-8?B?QUZrbzRHaHdtdFpBWWJBM1VXdUc2bXZvZ0VnN0pPeThVaVJKSmtiU25ERmd2?=
 =?utf-8?B?cE8wbzlUaFlZTnE1cXRob1NVaEx2SVRKMStNZnRGbGkwK3pUU09jM0R0QVRK?=
 =?utf-8?B?RnF2djlXRHBwSlRLYlYrVDRITk41NVZHZnROSUZxMjl3STYwU2hwNTlsem4r?=
 =?utf-8?B?dHExU1NyWlcxVXg4RUpvSzE4dElKNDdMdTYwY1lOU0g1eU85THJCM0Fuc3la?=
 =?utf-8?B?amszVTM4VXpHL2tqcnl4MXJZb0RlSXYyaXdQUlAzZVJCNThTNnVLc1dTWVI1?=
 =?utf-8?B?bFhKdklJc3BEeUpVbTNPV1pYQmN1NDMzbzk3TGhxMmFadXZGZWpaQUhpWTgz?=
 =?utf-8?B?clNjT29GUGd0V1pkci9iZ1ZCVEExZW5MQ1JlckxKRlp4MDNDdjBtRzJaVDE3?=
 =?utf-8?B?R2p4aUxwR0hFWFdVRVR2OFZFTllYWVhBV3NObE1TM29QSkR2Yi9DZGVTVW9i?=
 =?utf-8?B?alVma0UvUVVVWmZoUWd2cHZzU1BYVGxJZzVqR2tvWFBhR0JBRXFyaWZ2NEQ1?=
 =?utf-8?B?UHZkL1hIYXhnUCtmNFNQSXZFdWJMZjdpeUhPTG51ZkVJWmhYRStlT2RQdnhT?=
 =?utf-8?B?TENvVndxbmd0YWY2S1BGSTFZWUZqMlFqVjNMV0J4M1FrcW51UUlJa2oyekNZ?=
 =?utf-8?B?M2xDODZlaVhyWWN2NTRxMFlzOTRvYVdKUVJVNGw4bFdOMWxuTDU0WDJCdkRZ?=
 =?utf-8?B?TlNNY00rdkRYYUVTanVqaU1IQ3BkdzNPV2ZJMGo3eWYwREpKOGtSWFVySW9h?=
 =?utf-8?B?MFpQdWZGNG9zSWQwUEZlcFBhVkpoT3V0cHJnNmFIQ2t6SVNGK0FKcG5TNDhj?=
 =?utf-8?B?UUxydXU1dzRtai9STm40RGtvWDlZTldKekVJSGhGYWJBT0k5UFRJWElwcHFR?=
 =?utf-8?B?aGtVNUVKenlGY3FUZnBlY1lPa29qQW9PaUlFdUI2L2Q2ZndhMVFZWFpqRFJ6?=
 =?utf-8?B?aXhLWTI3Y1dwcTV4N1dObkU2YWxoSkk3SnZMTUFCUkZZZ1ZIUHZUUmY1SWRF?=
 =?utf-8?B?bENXWVBIMGMwWmV4V1k1SkNZSS9aNkJ2SW9IM29oZ1NBTTl5d1QzaHVpTjdz?=
 =?utf-8?B?TmVSWDF5L1ZEY3duby8vaHE1aUJUUTkyVk9yRWhFc3QrZlRrUExSMENvL1lu?=
 =?utf-8?B?ZC9VK0U1OUpmVHRBN2p1cmZPbVdZVDFIeDhRWEhiL3VmOEtNT2kvbkVvL1Jm?=
 =?utf-8?B?T2Zqd0s2QWJieHEvbWF1Rk1Dd3ZKY3k4ekZsKytQQUQyd3ZhKzJmZk4yanpj?=
 =?utf-8?B?dDltNmgrVlYyZTlnbjZsN2tnK2R0R1NtVlByN3lLeVNTajJMNGk0Wnk0SDRC?=
 =?utf-8?B?enhpYkl2RWhVV2piU3krTkh0cVdob3ZFSFBrZjNOU0ZFK0VTWDA0SGp3NExX?=
 =?utf-8?B?QnVtRU1IZWZvMjVGSlNpSVpqaXphNXlUUmtGRmRLNGJoUURwY25Ed2daanM3?=
 =?utf-8?B?NkxZVVk0dnZyUUN3aWpYLzVETG9PdzlCbzlBeC9WQVEzaXl6aWcyeENGZ2wz?=
 =?utf-8?B?ZFNMSUU1RkFrWUM4N0dvTkh3MjdJUWVXMjQ1NlI1RnlxLzlFd1VCZGVoV3JF?=
 =?utf-8?B?Tllsd21vVWc1ckVvMHNvU1NUYU1JUTdvQ1BhNklBZXZCQlc1QlZ4SUZLZWN0?=
 =?utf-8?Q?x82Dfq6KWXJM1FlcpFmchNEmH7sExbuhCd3dvst?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 3ac35b83-0ebc-4c21-e467-08d9324ea40a
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jun 2021 11:45:59.3899
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SPdSgiknxPCG/Be1Fzb/rwkncFbvtaadLDBlbkwiyffq5JK3UbARyb1iZ8OV45gbwm2U0Kb1ur5FIp6OATex3FpBj7rWJiR1eVHiwjN4Nbg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB5837
X-OriginatorOrg: citrix.com

On 18/06/2021 12:44, Jan Beulich wrote:
> On 18.06.2021 13:34, Andrew Cooper wrote:
>> On 18/06/2021 00:39, Daniel P. Smith wrote:
>>> @@ -197,16 +204,21 @@ bool __init has_xsm_magic(paddr_t start)
>>>  
>>>  int __init register_xsm(struct xsm_operations *ops)
>>>  {
>>> -    if ( verify(ops) )
>>> +    if ( xsm_ops_registered != XSM_OPS_UNREGISTERED )
>>> +        return -EAGAIN;
>> I know you moved this around the function, but it really isn't -EAGAIN
>> material any more.  It's "too late - nope".
>>
>> -EEXIST is probably best for "I'm never going to tolerate another call".
>>
>>> +
>>> +    if ( !ops )
>>>      {
>>> -        printk(XENLOG_ERR "Could not verify xsm_operations structure\n");
>>> +        xsm_ops_registered = XSM_OPS_REG_FAILED;
>>> +        printk(XENLOG_ERR "Invalid xsm_operations structure registered\n");
>>>          return -EINVAL;
>> Honestly, I'd be half tempted to declare register_xsm() with
>> __nonnull(0) and let the compiler reject any attempt to pass a NULL ops
>> pointer.
>>
>> Both callers pass a pointer to a static singleton objects.
> Why check at all when the source of the arguments is all internal?
> We don't check pointers to be non-NULL elsewhere, with a few odd
> exceptions (which imo should all be dropped).

That too.  At the end of my email, I suggested an alternative approach
which would remove register_xsm() entirely, and I think that is a
better-still way forward.

~Andrew

