Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 31FDE63CFB1
	for <lists+xen-devel@lfdr.de>; Wed, 30 Nov 2022 08:26:15 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.449741.706662 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p0HTL-0006zj-UV; Wed, 30 Nov 2022 07:25:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 449741.706662; Wed, 30 Nov 2022 07:25:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p0HTL-0006xe-RY; Wed, 30 Nov 2022 07:25:35 +0000
Received: by outflank-mailman (input) for mailman id 449741;
 Wed, 30 Nov 2022 07:25:34 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=4wzj=36=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1p0HTK-0006xY-Oy
 for xen-devel@lists.xenproject.org; Wed, 30 Nov 2022 07:25:34 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on20624.outbound.protection.outlook.com
 [2a01:111:f400:7d00::624])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2cb1369e-7080-11ed-8fd2-01056ac49cbb;
 Wed, 30 Nov 2022 08:25:33 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DB8PR04MB7067.eurprd04.prod.outlook.com (2603:10a6:10:12a::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5857.19; Wed, 30 Nov
 2022 07:25:29 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::4da2:ea8b:e71e:b8d8]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::4da2:ea8b:e71e:b8d8%4]) with mapi id 15.20.5857.023; Wed, 30 Nov 2022
 07:25:29 +0000
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
X-Inumbo-ID: 2cb1369e-7080-11ed-8fd2-01056ac49cbb
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ke1AO1CO3Sq/PGZbdGg/a7YPnFUsqEXTRZr1+D7NsXjNUgcI35f/KcbSSKt83cfSh3F4Mkm59qU133pU5/jET1A1Pse3p2PT1xTewM/Pltxl5bR3T70cpW6cQQ+9qNTSScaBb7SJs9lcLWXbO2Rhgv3+Wq0XvcakKBZpvy2Rnp6jbXt9XsjvSJzBoxwDhTKz384URNZFSeg45QKXXs/4tbWfzi8B8NTQDHh67/MbND3l2fhrptrmPC9ePvNZZIa00CQlihxfCUuJjBze09DXjNv7zGK99+znYXPz1nyYH1k139QuzcAIvGLhsQXFhRTQnuV+6jh5l2HgtO4oMtBXqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dJ9PrBSkrW2ppIwtgQz1wrj1/Q0AikNZTBIKhY0dmNQ=;
 b=iVlOJu5dz+2GFQWLjmSTThvIYGm6k3QFTuQPPFKJO8hKfrIh9LtMr8c5AjnVvX9c62SsRYh7KRKaNAR+35poNA9s7bPpv8t68fvAuLfvKGB5JKhLbQULFcdKg97pOtuM1XXIJFGgtURJvtqpP+GzGNLhGGXtCbkzBo7i5rtQGU7+uWa7TaphNS81fefWnQi2nuzGaMZQpU0SFReTSQUtr0HaJTd8c007Px/4VQrlNCQupasJYXQw1drU+8uarF2bTibAqEchUFQ2cBG/a4UBKSL4Cb91axCFxM3Fxfe7cDHPRTOt37Sw4Y5M9EprwnAJRiGmnQWvj+H/sS17bPbCBw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dJ9PrBSkrW2ppIwtgQz1wrj1/Q0AikNZTBIKhY0dmNQ=;
 b=HALlrnnNAtdmSSEHnQyyzwd4iAfLK77CznNJn8HX9Mu0baw4LB2zlwhQXUPvCdZNLJD1ZJRC1lHxis2S+l4vYYDplQZvCZGrLEL8YOMjJ1yPPcUgIKdcwJQmNBXnXLscYp98Qv3+Bp4o/SAwsqhYXbjAvVFBjAlrRERv1LqH0L4htHiNvUtrt6qJmPZwA9imNs4wfHVI8ZD+JeGOmb7tQtOK5Rw6sxX6hoWC7aiFRnaRPWiVQfoa5u1G3wfbLRsAHB4ubN9C308Y5IpOYCXpMJR1kbYZclQNmwDBcFSLSQS0t6cPcRy2h8AZYL+fMSrAjFexoqEWFmXlHuHV6sGUKQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <a4613bcf-6a78-b3f3-20f3-959333df1dc4@suse.com>
Date: Wed, 30 Nov 2022 08:25:28 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH] x86/p2m: don't calculate page owner twice in
 p2m_add_page()
Content-Language: en-US
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 George Dunlap <george.dunlap@citrix.com>
References: <3876e026-2a98-b74e-2f49-4bed8fc0a224@suse.com>
 <Y4Y3ByLHD4RaL5eA@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <Y4Y3ByLHD4RaL5eA@Air-de-Roger>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0124.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:94::15) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|DB8PR04MB7067:EE_
X-MS-Office365-Filtering-Correlation-Id: b2bebbcb-55f9-4f1d-75e3-08dad2a40f1f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	6/ls7qPKLPImIUu2hMDy3E01uXakA5PKdwE7wpUHGxkRz2pe90WV4tUt5UJqnSUYUbkAlCo2sb4RiGw/C8r7tlN5Qh1QNJwyB8gq3LULILJ2dHBDmrZ67CCV4LUeylGy11KrbXg1IMStcY+jbos4OLO/OLR+/Z9xKFp3MDqkeL3VglomKpN21MKvfLbT8nbVueuUtnT4flLXe85xtiXrSTvJbdtG2I7o19KujdyvdgcQtNdl4awT2x1j3wY/BV067hk3mrT02C8AI3DEP3uGz45MoxnGnGoDyEU5catO52UvDt9ihsHl7jmr6KjOEQ5htjcDuZUHYVwHuZAUumnz6XUzqk4v1tSKNL8v/JLOJ71dFvw2YNTGEcxErqOi7lIX5yz5SbMQLIXyfpxroaNLm6ix8BMxLwPGs02J4Iqx5JVoIg2slLvvxa2Hv53Rn0ptywWAATKDIAhxwl3pkknujfHwwrEXYnt1hza+mGgkVAzkiOhk+huXkJj5XYMdGAFI3WtYjsGS+FdL7Gtl3gkhzSdHweQAklGQmiDP7wCL6BUoNH63hXA9CSP4xOhchqwQXWVUmuRHFfRLFG6vt8N3afJPBT0Yr91JSqbOoXBPiYR/ta4AincGp4LMT+gDP5IKijloVuJ6OQdRWWIwgkhUjthNRYk63+xIyeS+sQ5kU4mBB9DokT8XboqzLn+bAI2USKrRmc12DONrHmMr/TGqFF8bQ0iRSSdDANI31c1fPpc=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(136003)(39860400002)(376002)(346002)(366004)(396003)(451199015)(36756003)(8936002)(41300700001)(53546011)(2616005)(66946007)(478600001)(66476007)(6486002)(316002)(4326008)(26005)(8676002)(31696002)(6506007)(86362001)(6512007)(31686004)(2906002)(66556008)(186003)(5660300002)(83380400001)(6916009)(54906003)(38100700002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?R28rTjNOcExCbjBSb1lHbmpqV3V0L2g1a0dJNUFodnk5Q2xva0JSMWNUOVNU?=
 =?utf-8?B?Q3lTZTlzOEZnSk52U0hKZFdyazcvQ3dUellaZnlSNm1ObmUxVE5iOGU4bTN5?=
 =?utf-8?B?M0hRdHlGN21xQ1dUR0hxMFFib2dDSUU1TVB1YW1MdXBFdldCTGtzQUFTVHJ0?=
 =?utf-8?B?b2ZTb0g1VVJ5RjZiQ1VUK0lmZzdycG1BSEFQUXlWenVKY0RsVEF4MUNmN1Zn?=
 =?utf-8?B?TGJJZXN0dnJ5TFRudVhtTnRsMko1Ymk3RWNmbm4wQUdCTTBLNURvWTZBa2oz?=
 =?utf-8?B?WU1pMkxweFZEbVVBLzdHQmZyVGlNM2J5Tkl6L3hvbTdsKzROODZDbkpqc0Z1?=
 =?utf-8?B?QzNDNTFvSWxZYytGZEtzYnl2QjBNVk53dTVjUWpuWlNrbklBT0Z6eVg5SUVW?=
 =?utf-8?B?dUhyZkhhTTZibmNwTzlNRERjVnE3VXl0bDI1ZkhmcEUzdFlNTkZLT3oxcWgw?=
 =?utf-8?B?NG5qUVpOVXhGMWZHVWNCWlRrM2RkMXBiRW5mdzBVOXVqUkpMQnBNVnVrLytD?=
 =?utf-8?B?dFpzczVKZGpjOG41MDBTekg3TnMxVEd2QlZwb1Q0YVBBRkh5MFFSa1VEdzNm?=
 =?utf-8?B?azRJaGpsRG56N3hiUEhhaitzMkhZUEdza2ZnMTU0cW9mNk5haXVpcUI5YXcv?=
 =?utf-8?B?N1VoVElXaDVSZDBOR0phNUFsaFBvcGRWZTZ2SjF3ZjdJc3BxNFJlWTlpQW5Z?=
 =?utf-8?B?Sy9iM3VsZU10SDdPWW40WVR1WHkrR3VlZGVmaFJTMkdUN2EvOXdjQ1d2cDVj?=
 =?utf-8?B?VUs3cFZHMXlHbkdKUDhPMk1wSEp2bUE0UlEwSWFoOFRKbWkxRDV6NEZHVld0?=
 =?utf-8?B?K29WcmJweHVwcTBOUHI3VC80aVY2OEJZSzRUNTMwdDJGd1N4S21jWE5qRWFk?=
 =?utf-8?B?b3JZUm9CR0QyZjRPWW5vd0dYMnVvZE5xL2pXSXlhNGJ3bXo0QWxOUDlXT0tu?=
 =?utf-8?B?akZRZzFRZkVqTVYrMzEwdTRXcEZYVE81NnBLK25tR205ejVVeGVPYm10eDYx?=
 =?utf-8?B?b3FCWi9HVU5vWDZBTEhkQVV6YVN6NEpJTUFrV1ZwaURZaE5NZCsxUTVDTjB3?=
 =?utf-8?B?Ymtra3IrRnI0OENWSCsvOVBqckxhSE1BSk9qUVhzS3dIU05odkp5eEpUaWhU?=
 =?utf-8?B?YVlvNTJBTkVEdTk1SHFmZk93SXpXWWF3QlNqQWVUaVhOTXEwWDhLcHpnbm9Z?=
 =?utf-8?B?Vm1lN3ppb3lTd09mNi9LOVlnUjdjVHpWRU1RbW5Wb29JbmROR3AreUNZMy9o?=
 =?utf-8?B?MVdPNFltd3FwQmhnbHlUcW1pcE0xK1VJU2dRTm5PQUNWYzRONC9sc25VY2tX?=
 =?utf-8?B?TnltZWc1OExXbjUybEdrdFJuSlR5dHRvOEM0NFhJT2puVWwwSDhrcHdCN0k2?=
 =?utf-8?B?Z0xScXpOQmhiUnNLVTBnQ1Z2L1BCRG80TVd2OWRSUi9vM2hhUmlqTEpDaE5j?=
 =?utf-8?B?SzRMSDV1bzV2V3FETmRIeEkybU5UQ04yYktLOU5tZmMyZnJHNk93UVlTNnZO?=
 =?utf-8?B?OHFXTVJJb3VYbFhuZGpPalk0S0M4dTUrZGJTbGlXaTA3NkhJSS9kNmNVYllx?=
 =?utf-8?B?U2NlUU1rcGVXMzhtdGgya2JONlBjZDROV0ZUR1hSWDhIelRDOVVaUXhiZUQz?=
 =?utf-8?B?cHduK1lQQ1U2VmhyRkNCNW1UZWFEOHhTLzFOdzNmRjF3YjNqYTl3d1FiUExS?=
 =?utf-8?B?QXk1S3pjSnI4bk00aWF0UXRpRzBHMytQQWNpN00vVkYzc2ZXbnFoS0hMM0Nu?=
 =?utf-8?B?MnYzclFQMVlXQkxIR0lzNkc4ZlcvZXY0SzVQVjM4QUNKejBxWTdTVXI4QTZJ?=
 =?utf-8?B?NHczY01ETnl2aDRoV2RvRGVvWlVUVHU0K1kyOStpMzA0R1RPSlZjVTdDa3pC?=
 =?utf-8?B?YzV1Q3BZVUtkN0J0bFdORUNURGFPYnM0eWZBOU14dFlhdG1LSXRFQ2x6eEF2?=
 =?utf-8?B?eng0eXR1NDExbjRNOFZDQ1Y3Z2JsSVZHRGROR3ZPMWM3SHk1YkdBdDg4NXZJ?=
 =?utf-8?B?Q2lseEt4Zng2RWQ5UFFZZXRWeFFzTnZMeHVPeXRybnlmUWRDSTF5SkM3WnJm?=
 =?utf-8?B?dDNFSXRZR0paSGJLdWVoOXg5VkRQWkJSYlpiRVJaYW5ydkgrZ1lTRjFvOFBG?=
 =?utf-8?Q?ywGV6wh2sIVSg612QgW/LXiXX?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b2bebbcb-55f9-4f1d-75e3-08dad2a40f1f
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Nov 2022 07:25:29.8254
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xbEFUcZdx+SZ/lwLrBkes0Wum7vhetP3wI5WDuHJPaxPxTKRY3ZhbtjM8bQZ5nbKHOPM1+kCI/8H1ig7i5kYYw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR04MB7067

On 29.11.2022 17:44, Roger Pau Monné wrote:
> On Tue, Nov 29, 2022 at 03:47:53PM +0100, Jan Beulich wrote:
>> Neither page_get_owner() nor mfn_to_page() are entirely trivial
>> operations - don't do the same thing twice in close succession. Instead
>> help CSE (when MEM_SHARING=y) by introducing a local variable holding
>> the page owner.
>>
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> 
> Acked-by: Roger Pau Monné <roger.pau@citrix.com>

Thanks.

>> ---
>> According to my observations gcc12 manages to CSE mfn_to_page() but not
>> (all of) page_get_owner(). The overall savings there are, partly due to
>> knock-on effects, 64 bytes of code.
>>
>> While looking there, "mfn_eq(omfn, mfn_add(mfn, i))" near the end of the
>> same loop caught my eye: Is that really correct? Shouldn't we fail the
>> operation if the MFN which "ogfn" was derived from doesn't match the MFN
>> "ogfn" maps to?
> 
> Getting into that state possibly means something has gone wrong if we
> have rules out grants and foreign maps?
> 
> So it should be:
> 
> if ( !mfn_eq(omfn, mfn_add(mfn, i)) )
> {
>     /* Something has gone wrong, ASSERT_UNREACHABLE()? */
>     goto out;
> }
> rc = p2m_remove_entry(p2m, ogfn, omfn, 0)
> if ( rc )
>     goto out;
> 
> but maybe I'm missing the point of the check there,

Hence my question, rather than making a patch right away. I was
hoping that maybe someone might see or recall why such a check would
have been put there.

I'm not certain enough to put ASSERT_UNREACHABLE() there, though. I
might make it a one-time warning instead.

> I have to admit I
> sometimes find the p2m code difficult to follow.

You're not the only one.

Jan

