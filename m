Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EE935B374B
	for <lists+xen-devel@lfdr.de>; Fri,  9 Sep 2022 14:14:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.404277.646694 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oWctf-0007ww-IS; Fri, 09 Sep 2022 12:14:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 404277.646694; Fri, 09 Sep 2022 12:14:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oWctf-0007tY-FB; Fri, 09 Sep 2022 12:14:11 +0000
Received: by outflank-mailman (input) for mailman id 404277;
 Fri, 09 Sep 2022 12:14:09 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Oy8C=ZM=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1oWctd-0007tR-Ms
 for xen-devel@lists.xenproject.org; Fri, 09 Sep 2022 12:14:09 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2044.outbound.protection.outlook.com [40.107.20.44])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e7d4be44-3038-11ed-a31c-8f8a9ae3403f;
 Fri, 09 Sep 2022 14:14:08 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by VI1PR0401MB2382.eurprd04.prod.outlook.com (2603:10a6:800:23::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5612.20; Fri, 9 Sep
 2022 12:14:06 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::59bc:901a:98a7:76d4]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::59bc:901a:98a7:76d4%5]) with mapi id 15.20.5612.019; Fri, 9 Sep 2022
 12:14:06 +0000
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
X-Inumbo-ID: e7d4be44-3038-11ed-a31c-8f8a9ae3403f
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RteA2+wYAKaVHXHF6l7Xyc2YGEusYuUn6JoCsjDLu/XjghhS0mY5dpk+05baooZe1NW314ncmHmfogUGvyVr5zPCZnqrTYe/w0nEN0+oCX2OfSu88Cd7Lzg2huSGsV0wX10CI7tEumVKyv6b3JRhZ27ZUA5CS2/RGmb45xHX0rlbG2mdtFRJvEfyPlr0Dv5sBso/fHQ+x67VEDubVydwrIFB1DqQ8XAzjf5XgmWlM4Qc+JojI4wOTNa1HRY3rV5JT3n9kAAwiHRP5yijFiLNfHgBBr2pzWCcVvanTQgKYDsifCB+CL8VOHUCz8X/Loz2XSAspfktk5iIPnrubocCtQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AeDyfZx8AvLEIZUYNderXlon8dG0bY8Eyiwiv/Ay7lg=;
 b=I0Jz8ShgVZuy0IJ9qQj5bZme+ACQr4OAjlLVFdEkKOPQz8L1y3qTc+jU21W0Y85u3pkL+Urf6H7dwMwqDb4cLsWvdy1+NYr05YwmFZkgpkjaXwaubCDiyRyCEPY/uRX2vYtCF1y+f8hHgCMMPQMYweopyDxWwOoZO5pdL/pBgE3RcvQR3YhSJXwcInAU15UKr8HRUrYzgS0OhngqrugY8KgKPvkV/u8MhdMTj5wRyPFDu7eBThonHWYmEezGYAVS5VWNwpmQt51S3bAvgA3a3o6OlIZ50/GhkcTvh9Z2sb7TPv6y1m+9ETHlthmomE+EEhiMzNkYAbMcGq8Lnp7wSQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AeDyfZx8AvLEIZUYNderXlon8dG0bY8Eyiwiv/Ay7lg=;
 b=YgWYcPjZ/pDGAx/t8TxW04Sp2C6lCOpOUIPIh4XRmstzsjsit9IWVeq/alJ0kStxNq9sE0NPSUKhtHo9d8dbtqabwGpoOuNSQzPPjprW1bbVa4+OPdQsp+F4/SVUA/IM5YXrlmwKgywtLEQKUikxX9UHdLHph/PDrfRU+1sdt/I07HsDa4D/mMUs/HqeVAiX85CkfbpjxZGvJUTC/oPVZN6gD7TO97iZYHyhRZXj5UipNn/jqVi2FPwjBUx35jGfEYQ2L8dK+588mFfR6TQ7qwQRuvK/J6f5J7gbMudATU/ah3jULys+igKRZ+Xjb3Y7aklge/6A63HqhwDlHKEv2g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <6da822fb-e900-156b-334d-8bc573b74aee@suse.com>
Date: Fri, 9 Sep 2022 14:14:04 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.1
Subject: Re: [PATCH] core-parking: fix build with gcc12 and NR_CPUS=1
Content-Language: en-US
To: Julien Grall <julien@xen.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <1c23930f-e809-d623-18ec-599a0e983b7a@suse.com>
 <bf0d5470-efce-c7f7-d429-78d7fb9517d1@xen.org>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <bf0d5470-efce-c7f7-d429-78d7fb9517d1@xen.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS9PR05CA0021.eurprd05.prod.outlook.com
 (2603:10a6:20b:488::17) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|VI1PR0401MB2382:EE_
X-MS-Office365-Filtering-Correlation-Id: 6794fcb5-eaa5-447f-bb12-08da925ccac5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	RfINwLZB6ZQ+lEj8OK8dm968JeU+whSVq2YlKpA6LAIvrlHFG8PE0/wFQqsPs9CnsZIfLSKHkykCLwEmi4D3FN0aWGpvOkcKaFqPpAuhqrJFEVKmZyRmjbkxnTBxpHtM8lNeGoAO5kWDaJncAt2TUHvEDhzbbfbfalQpT5iFcW7epuEVDnrDBbj4UoO2aIfgMdY83Y0Lif9uCmevg2qHVh2dp5x35UWhdlEE5t45i4Ydc+bSdJMvgoYCU6q3J8yNX1CHSrDkeFH5pnnCBoOG90H3zfTJwmAfgK6u2kGRhs4q3zbd8sNYjvUh/ewsmRggF/3Foe7A1FnTgQpzJAavsnFEqRJvFNtI8ErW65cF9jVntOcQiAQMGGiKxN1EMZ5XIWnHeUzhFU1zcCkvbAlsaLD9k8P8QdUKGVk4nZl/mH1Qg+pn7f3Y0dtWZqwNESTd69KpIEA/4KPgxEVjaKBZIapPSaSdL24CUBJO1giig1UccDc1Ta1X2X+g3PKWrkzuvNc9g3hoPyAgGCNWTpB6Y/XFka518s/p2be/gaQBhboLGLkvnnqcyV8HnhKW86eUjTxAIdQEtabLyBxGAdcNYRE43IaHiJYDt3mQeO+f7jVx9yTB4N0QshmFoyRmJ/Pn2rp9GmMzVDSqz+ZhEINlAuD+Pk0UcUz1S0CYbw1QSd4F29YcFZyIzr1xqEhVji89DXdAs8pbkSYkhEF4kltaUv3rDRm1sCRFiRBPPlaZC8UU5Cl4tFmHzV7IMqWUsGt2++MX6yQjqBsGZDCRXsV+1iRIVbRam7x6RggFTCQe8dQ=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(39860400002)(346002)(136003)(376002)(366004)(396003)(83380400001)(54906003)(6916009)(478600001)(316002)(6486002)(53546011)(186003)(2616005)(36756003)(31686004)(26005)(6506007)(2906002)(6512007)(31696002)(86362001)(66556008)(66946007)(4326008)(8676002)(41300700001)(8936002)(66476007)(5660300002)(38100700002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UFpoMUVuUm5SanU0RWl4alFIeHppM2VwcnRKZENnUEJqNWN6ZTRXUWhTTDNI?=
 =?utf-8?B?ZG9jeEpjM3NhZDdObkdYNmFEMWZwMkh4RFppVmV4RU91SSswOWt0UGl3Tnlt?=
 =?utf-8?B?TkNEWjNYQzdQMmxuNGx0aGgrTUhmR1p5VHRlRVhZWHZMK0d6d0x5SUZRNEU0?=
 =?utf-8?B?NHRBTXhTNi9uaHg2YzRaM28xdUlCTnJiMHR0ZEZ4cjBmSVFIOW41RCs5dmpw?=
 =?utf-8?B?RjZ4SzZMZ2ZMMEwzWEhaaC9obm0wTzh0Q1lXUy9LbkpnNzVNbE1ZZzhZaWNv?=
 =?utf-8?B?anZqaVJIODRUUlNNa1RINGlpbGxWbjRUWUh1ZDAvU2dWZGhIZzhjRXZXUldS?=
 =?utf-8?B?eDFlQnVrdUVqT0VlcGg3NlV6L1IwTzRyM1R6bGZjdzRsbUwrNzRXOXI2OGFC?=
 =?utf-8?B?VCs4RGdKUFNtd1pNVms4a3JYV25vWDlBR25SVi9SdEJaU2g1c3ZDK3E5Zmw4?=
 =?utf-8?B?NzNjVWpDZlFtK1NXdEM3cmRaaFA0Zmoza00wdlQ4VjBNenQyZGQyQlpBQnVp?=
 =?utf-8?B?aEovTFIxMkZCdXk5dEFkVklrVVJvU1Mrd3VrNm9DTHl6VGEvQ3Q0VDFuODZB?=
 =?utf-8?B?ai81NEx2NlFFNVQwbndjUjJzdTlwK25GUGtPUzRqbnd0Y0kyS29KNUlSZjA2?=
 =?utf-8?B?cnFtUDNaeWkwaVFBak1maUVFV01ZU1pLWFFMRG5xam5HZ01XSEk3MnQ5WUhT?=
 =?utf-8?B?MzRhOWVsY2NkT0NINUwyR3VHT3NJK0hRNnJ6Q3RwUkxRZXozNXBITDZHZktW?=
 =?utf-8?B?Q1ZhM013NGZvMDFBaFF5c28vdXRnZ2NIdmZVQkU3cnpSN3A4VWJUL25ObGZx?=
 =?utf-8?B?NU9meHEycE5nY3hPK0tpVWFkR3JxUmZncFp6SXhZdjd1YU1VWXZyTXJLSGJq?=
 =?utf-8?B?Ry8xVmdtVldhSTVkR21yaTJ2YVhTTGlERkF1NmNxOGRRTksvam9uTTJBUlVh?=
 =?utf-8?B?RXpIR2RqSFYwVHN1U2crYjI2TXVOMmhxREU3a3RtVHlVeU1xNTFnVUY4SWFG?=
 =?utf-8?B?bDNOdW91WkJZRGUzMlp2UVRCMnorR21jcGdhTStNVzgwd0MyZk02SkNrcmJU?=
 =?utf-8?B?ck9rbEVTdTdYZHhiWTgzTncxMjVZRDBKenJYWlpZZzc1QUVRemE1QUthYnRk?=
 =?utf-8?B?RFBXNys1aWh4bW4yL0RhL0RBVzNDOTFOYWZlNVhkWFMvOVJKNEVDTzBiWDAw?=
 =?utf-8?B?dC82SG55dWpJWWs4L1FhSjFYUzF1MCt2dlBnMGkzTkM2bjAyQXZLcjRobjdT?=
 =?utf-8?B?WnpFcXlOekVYdkQ1dnovdFFsWW4vMDJOV0Q2ZDFZeWc1MG1IZ1FnRCtac3JN?=
 =?utf-8?B?b2JoVVFMN1J2c0QyYXN6aVZLUU9ybkxxZ21hMS9LdVlJU0U4K1BVQWFJTUVU?=
 =?utf-8?B?RE5HdzNsdjJtTThJMkdtT2VENS90bUpha1NwVWtsK0NEaW5vQVo5bm9QRzJj?=
 =?utf-8?B?ZFlDLzBlUis5czFJZ0VMeElWcG9NS1FhdCtuOEM1Tjh2MGJ3VCtoM0lMek54?=
 =?utf-8?B?WUYxT0ZoOWMvUlJYN3pzVE1PSEVZRG9tUEhNS3BheEc1Wjh1MEZVb0JseWts?=
 =?utf-8?B?dFZXZkQySjE0bEF4MllmYUxVZklCYWVxaTlMZ09MamhiTFczSUhsLzlCYkkz?=
 =?utf-8?B?TTlyY1BpYVVoK08wbzV3RjhMT2dZbFUwZXREZ2JCUCtIMXV1NVVhdEtIdEZD?=
 =?utf-8?B?aDhnaXhFNXV3aGFzbGwvREJkRnVlWEE3SkVycE0xQkZFU2p0YVpZWjJ4S1J4?=
 =?utf-8?B?QlhhK2dZMUgrM1hDVXFjVVVodUF0UFhqYkNKaEVtSDRxTTIyTWlDT0t3blRF?=
 =?utf-8?B?aGEwbnFiK1JXSGdnWmVvOE5ydExiVWNyTzN1RklldkJjZVM3Zzl3blAvNXk5?=
 =?utf-8?B?Qi9kM3ZwQ0w5b0RNZklONFFNZ0h2L01wQ25pai9RQzIweTFSV3gzRkd1WFlx?=
 =?utf-8?B?ODRFNmtDQTdFUUp3aWxJMkNqcmcyT0NoQzJ2dDZaUVJsN3NEMXRVdWlqYm1y?=
 =?utf-8?B?cEF4K0tFaTJVQWhZV1c4ejhxdk1nSjJiZ3JXTzE2Ylk5VHNRQ2JnbDZoME5J?=
 =?utf-8?B?RHlxY1QwaGRlazh4M1VVOG1TRFlxSzdKUkR3d3hQb1R6djFzRmhiOEswR25R?=
 =?utf-8?Q?UApQbCXMd1ebSlVdyHsEHlP9Z?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6794fcb5-eaa5-447f-bb12-08da925ccac5
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Sep 2022 12:14:06.3886
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BDoZJl2Xj7LVhJOUIPYq1O9bX09mmTr1DD0CR7xOzejCBIP7S9iPRs7Rb00RKJIGwdUa1Pv70nXvTH+Q3qBidg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0401MB2382

On 09.09.2022 13:00, Julien Grall wrote:
> On 09/09/2022 11:18, Jan Beulich wrote:
>> Gcc12 takes issue with core_parking_remove()'s
>>
>>      for ( ; i < cur_idle_nums; ++i )
>>          core_parking_cpunum[i] = core_parking_cpunum[i + 1];
>>
>> complaining that the right hand side array access is past the bounds of
>> 1. Clearly the compiler can't know that cur_idle_nums can only ever be
>> zero in this case (as the sole CPU cannot be parked).
>>
>> Beyond addressing the immediate issue also adjust core_parking_init():
>> There's no point registering any policy when there's no CPU to park.
>> Since this still doesn't result in the compiler spotting that
>> core_parking_policy is never written (and hence is continuously NULL),
>> also amend core_parking_helper() to avoid eventual similar issues there
>> (minimizing generated code at the same time).
> 
> Given that CONFIG_NR_CPUS is a build time option. Wouldn't it be better
> to set CONFIG_CORE_PARKING=n and provide dummy helper for any function 
> that may be called unconditionally?

That might be an option, yes; not sure whether that's really better. It's
likely a more intrusive change ...

Jan

