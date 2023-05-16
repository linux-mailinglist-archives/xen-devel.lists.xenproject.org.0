Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 17737704EDF
	for <lists+xen-devel@lfdr.de>; Tue, 16 May 2023 15:11:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.535198.832847 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pyuSY-00089P-Ay; Tue, 16 May 2023 13:11:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 535198.832847; Tue, 16 May 2023 13:11:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pyuSY-00086i-7i; Tue, 16 May 2023 13:11:22 +0000
Received: by outflank-mailman (input) for mailman id 535198;
 Tue, 16 May 2023 13:11:21 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=00Q8=BF=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pyuSX-00086c-D5
 for xen-devel@lists.xenproject.org; Tue, 16 May 2023 13:11:21 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04on062b.outbound.protection.outlook.com
 [2a01:111:f400:fe0c::62b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2622397e-f3eb-11ed-b229-6b7b168915f2;
 Tue, 16 May 2023 15:11:20 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DU0PR04MB9322.eurprd04.prod.outlook.com (2603:10a6:10:355::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6387.30; Tue, 16 May
 2023 13:11:18 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c%4]) with mapi id 15.20.6387.032; Tue, 16 May 2023
 13:11:18 +0000
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
X-Inumbo-ID: 2622397e-f3eb-11ed-b229-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iXoqJhqbVA6DUnI+BXLib8gsYcwKU45x0wuB8wnUByKpf7LlPCGwNgIl/XO09lxfUk7pZqO7frHEfAuIdSS2uqVCswx/4p1exFYPMhYWv0aCud7XaBPLpFgm65uXhyxJNTGTatetcpG+3Xz+0D6AJOvrGHhg39A6ChrFOR7o5AOAY0yrNsvzDZcEopyx5docWgLqwfcN0j0Rt572fztUk3S96bipk+qTjhw6GgKB2p4BQmlFtRU6WNOa0WrTt0VT+DzcjwerjuSG3oYeVMyZzAZb5JuD43jc4bjIL3NQtKjYvqSHTbuJZ64P6yrjas3F43mkOjkKs/06yWi7yoHNMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tjDZJNXkCgyD5Ymk8/LhGwAm0IRVp8gLqlRdhPiW9Z0=;
 b=AvmZSf3ZodxEIi2dX4UoQvL7HdxY/96IzENZikdOhtf25I0eY82gDC5750H15Hm7D9PjbPM2O2mV0COEF87FDvsUgUW5HrEUKL9n/g+C5XAeakQ7iyENfCSAFjJGdXDiPf7uWX37ePLkmIYtJdMc+YP9r0MLVftBrChujadaNACii42cDaiLj9jBr9XXZvHIZXj9jOcPjntGdSCD2p7boUE4YA7hUR7h0KX+IS2bwoza1oqcyFXNT0o1rO9pwY7MqAVT1CUVhGJ6XeZ1i6+qrQvbAehtLIe6LX14ARyWg4H5B5vyXrzUF+T/uKNfoXy0S7CAUXxVNZIBXVnnpvE/ZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tjDZJNXkCgyD5Ymk8/LhGwAm0IRVp8gLqlRdhPiW9Z0=;
 b=KjN35QwlgS9DOM01Fa4PrMXZuXuOk7XWmGjmUosI1DtzihQnER+ake0OnAbYcfPsn01LHc/oeYSZq38XkbeW12V0/pkC26h87QY7SXzz5wcG1iKur4RTyOIMa0Z51cHLW6Im2KmA1JL/mpYSrf2n7yHkQJZcFOcdD4scluBJ4m8Md7gblMJaLjn1DZ0GZc1nsfY28I6O9GygaE2hQ3+mxstTIuI5dw9/+fi28QwjFsta5xLaaDFTpRCm/Xw35+piHI51s5lzOYumJUxIuSm0wfOSKzdoyuCd1PotQaHMeSWgmu4CqmTILkgdLvzOpHQZhflUv2shy6IIZC1OBVLm3A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <49f8909c-6b65-4225-40f2-6ee347399a24@suse.com>
Date: Tue, 16 May 2023 15:11:15 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
Subject: Re: [PATCH 4/6] x86/cpu-policy: MSR_ARCH_CAPS feature names
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20230515144259.1009245-1-andrew.cooper3@citrix.com>
 <20230515144259.1009245-5-andrew.cooper3@citrix.com>
 <20a1b108-68a3-a200-1d0e-390cd20b5500@suse.com>
 <85a04714-c8e5-de21-7722-cd1ff715448f@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <85a04714-c8e5-de21-7722-cd1ff715448f@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR2P281CA0150.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:98::11) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|DU0PR04MB9322:EE_
X-MS-Office365-Filtering-Correlation-Id: f0fcb9c5-45e4-48a6-7482-08db560f0903
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Enw++lW6JduLRRByMKdVsDBEyph2BfRaaATc/yI8VYZuD8yE0s37Wr92WLCyhXGp/9+WEZgBqFuVna3ycblC5cdgkb8vLkdiMAiOkvsSksC4FS8Nl7pgp1Hp3XoTwlFrhsvFBWasYAH1fyL06uWCHQV7oS6Q9PPArCATsDRXJdLLujnYg+mutUjgjlncarJI5yFmb3X4SVknYxGnKk1v1mf/xCklFggnG+lA0M59YeewE8ckE+TNa/BRrKS87fqDPq3Z94Po8sPmZ3d+b1CvZWQS5pR0YkzWcX04JJOwZYUJ3lxl7zghvf8uy+BPdN570DsQIIlXqcWBvpEzShekTDcQET+A1oRO87LG1lYV4W1bMiImOpjFpCofzEauZjwCVu6J1T7R8+L14Nb3DCNzZWyp6dZi4B6ZEP3Ps+rXCKKNLhm9YSoC6SnTc9jDqs2ZrAR8QatjPFKfYm1PBPQUfklATUUpI/a00UKn9mOnSlSBCnq+NYneAadsWsBgJq7hpIDpqU3V3kJ7WWGMTtXWwhf5DrXWKOda5mJezOUs5s6pllOE8GK47U4zvJlqPTDiFjf5UGAqTDp0JcQaHg4wl3YxQXetgq+oWNZdmpnVP0iE0Lgmy8QdCrSWj0fOBqY3t0epWpZZY13rv/w1YZQ0KA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(346002)(39860400002)(136003)(396003)(366004)(376002)(451199021)(478600001)(5660300002)(8936002)(8676002)(86362001)(31696002)(36756003)(4744005)(2906002)(66556008)(66946007)(6916009)(4326008)(66476007)(316002)(54906003)(2616005)(38100700002)(41300700001)(6512007)(6506007)(26005)(31686004)(186003)(53546011)(6666004)(6486002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UGdkdmc3bmZXYzBzb2tzamhnWkFRYU5vbDNIQjBoOGdzdGY5UU1QRGFaVnVJ?=
 =?utf-8?B?VW5IY1pJbk0zUURhT3UrVkNDUkNqd09QUGdiZWhxeXl2Z3hDNGJESmVJTjZX?=
 =?utf-8?B?NzkyZ1FMeVBwaDQxZzN1Tm9vSTN2TDU5bWlKTkxOOUNKVTJRT3VYMXZQMWZ6?=
 =?utf-8?B?Y1ZPU1VJTzdNUjZoNndTVnNiQ1JaaWF2Q3JqbzViRmwxbGhPVHBPV1ZBT1M4?=
 =?utf-8?B?Y3NOTVBUYzlxdjhJMGxjSGVwcmhmSzJlNGt1aVpOMzBidlRzWHI4ZjBJOGxX?=
 =?utf-8?B?dnJxNUxHWnQ4b2hjWnVCTVpyWGtOcDRMTW92RkgzNm9hSHdFNjNrNHQrMzRX?=
 =?utf-8?B?dHNSVFBvRXNiRzNEWW16Ulp2akFnaTBQeWZUa2hDZ1h2YlRadnhscjZ3cC9U?=
 =?utf-8?B?SG1tSUdhckpHaUtIaEpRSGVEYUdWSVZIU0pKb2pzdlNDYXZFV1htMyswWGcx?=
 =?utf-8?B?ZkpIdi8xaUV5M25YbHRrQnNsbjBCS0UrNmVTbXhUY1dhNEU2TTN2UERoV0dj?=
 =?utf-8?B?R2Fkck9DRFNMdmdodTJYcmZQME1Wdm1aekxWNG84VzE3YzNzM25tbTdENnl1?=
 =?utf-8?B?cXpsc0Nwa3ZDaW5uS01ZVnVQUWtYVjArOSsxR0V0TUE3OEx6VTlKODRpR0hN?=
 =?utf-8?B?dUZRYUJhbkp3dDhrMzZtZWhKQzI2aytkR3VIWHRnS2tMVHUyZFZsMjlhMGtH?=
 =?utf-8?B?T3FIeGJXQlFhRGdXT1FFNjdLcG44ZGFua2Qyb1VQN1drS29QTHJxKzdOUlVT?=
 =?utf-8?B?SWpZZWFrWnhiaVJLWmY2U3hUdHhucVBKdXd2WklQVTFudFh4SWRlZ28vTFR3?=
 =?utf-8?B?R1VvRXhvTnV0N2dYYkNrTUVmanhMM0ViTGxOZXZHSWxMYmsvclBIcnV0TnV0?=
 =?utf-8?B?cnFZYlA3aFVYMWN0TkYzL1B5bm90czJpMmI2YzRjU1hrZHlZcjNIdFJoWDI2?=
 =?utf-8?B?Q0x2ZjhJazU0YVYwRVdjK0k0ODNtS3ZjVUxwYlZkNjRHd3lPQml6QzUrNWFB?=
 =?utf-8?B?UlV3MlJEc2VTVGc2YkdTRUFuY2xJeUpkbTQranJsbHdUVWdjc2xVak55YnRI?=
 =?utf-8?B?YnZlbTBnMHM3d2ZZdDJIT0NKaVYrRzdPUGV5eG9SWFZNbEYzREdRWTRBaFlo?=
 =?utf-8?B?YUtJNjhpOEtGZDJ0OGVjTDd2cXdCRWFockxoSm9La3E4ZTVGTndLcmM2NnR4?=
 =?utf-8?B?cXNVamFOZFdNcWd1ZWszd1M4cVArOUM3MEpLYVBVY2hCdEVpZE5UU2VNWEN0?=
 =?utf-8?B?dXNnb2l2VGZ1cTZUWjlUMC9iSkhNYjYyTjB6amRGTVJaQkRlWm5qSDdteFhp?=
 =?utf-8?B?bFBydXJTUkxtU0N3R2FkTklqVzllZjhBVW5MMk5rd2pIalNaeVpzcStCYXpJ?=
 =?utf-8?B?U0pDZGtmQ3B1NmZTRzhoTEYwQUk2ZXppU3lHSDcyaFRyNVFMV2lLY0lKbnhu?=
 =?utf-8?B?QVF0ZWxDMDFxVXJqY2YramZCeXlmeGpzekVXNnByems0MEQ3T2JBUXdSQ0kr?=
 =?utf-8?B?NnVNdU10MUJ6K3lXWEZkZEVwbU1Zc21GNzBYU3BMSGRBaTcxUHhudVlpcS83?=
 =?utf-8?B?N3ZFUmxQQTV3VHFrVzEyVjV3VFdLdjVibTkyVmw2M2NlZDliYmNxNk9WSHpl?=
 =?utf-8?B?YmhkWTFJaE1kNjVjSCtuUVA5aVYzTkF3QTA1a0oxUkczbGVZNHdWcGhsTHc0?=
 =?utf-8?B?ZkR5WW02R0JYemdsMU1tL1U3M3VnVE9mSjhEVU5WMm9YaTRpdWFIeWJZeFJY?=
 =?utf-8?B?TlQwbTFaOXpJeGtXMlREMHR5YmlHeVJiUkVxVXRBVDlCWHd5cEVISUE2N2to?=
 =?utf-8?B?cW1QalV5dkUvRUMrd1NqM2p6azIrTGVmRHhqeiswRU9mNWtqaHlweURMbitt?=
 =?utf-8?B?VTBzcHlZZ2hJMWZERkhpdFZpY1NiaVphMU8xS2NkcEN4L3FycnVBTGpjVHpy?=
 =?utf-8?B?UE16bEJTSm9pYlFOOVhJdHZ2V0xXSVdnT0NUZmRVQXRvL05oSTZPbkRKbmVZ?=
 =?utf-8?B?M0xPOEFXUEhJM2dIdE0vOWx3Yzl6bDV4QXlQazFDWUdYZTNESzRIQTRmL21R?=
 =?utf-8?B?WGczem1MQXBUZjd1QU1MaWEzTVY1anJXcGlVclAvNXkrdnBJdklGRXk1Q0Fl?=
 =?utf-8?Q?lSG4xHs83xoAIc0TTmPxNvyiD?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f0fcb9c5-45e4-48a6-7482-08db560f0903
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 May 2023 13:11:18.0807
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aiQ/ivSFQcrNv97ADKF6x8qc14Ex1Lg+ZRlaMRZ+jeKZnq+QpIAGewwc/42CrcqqQaFViGStG6NhORNpz3tkkg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR04MB9322

On 16.05.2023 14:56, Andrew Cooper wrote:
> On 16/05/2023 1:27 pm, Jan Beulich wrote:
>> On 15.05.2023 16:42, Andrew Cooper wrote:
>>> Seed the default visibility from the dom0 special case, which for the most
>>> part just exposes the *_NO bits.
>> EIBRS and SKIP_L1DFL are outliers here, in not presently being exposed
>> to Dom0. If (latent) exposing of them wasn't an oversight, then this would
>> imo want justifying here. They'll get exposed, after all, ...
> 
> EIBRS is exposed to dom0.  I've intentionally renamed it from
> ARCH_CAPS_IBRS_ALL because EIBRS is by far the more recognisable name now.

Oh, of course - I should have looked at more than just the names themselves.

Hence the comment on a later patch then also is incorrectly saying "two bits",
when referring back here.

Jan

