Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0497C6E4BE5
	for <lists+xen-devel@lfdr.de>; Mon, 17 Apr 2023 16:52:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.522239.811458 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1poQDI-0006cx-V5; Mon, 17 Apr 2023 14:52:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 522239.811458; Mon, 17 Apr 2023 14:52:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1poQDI-0006Zt-Rx; Mon, 17 Apr 2023 14:52:16 +0000
Received: by outflank-mailman (input) for mailman id 522239;
 Mon, 17 Apr 2023 14:52:15 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=S5Vl=AI=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1poQDG-0006Zn-RU
 for xen-devel@lists.xenproject.org; Mon, 17 Apr 2023 14:52:14 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2077.outbound.protection.outlook.com [40.107.20.77])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 702b023c-dd2f-11ed-b21e-6b7b168915f2;
 Mon, 17 Apr 2023 16:52:13 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by VI1PR04MB6912.eurprd04.prod.outlook.com (2603:10a6:803:134::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6298.45; Mon, 17 Apr
 2023 14:51:45 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::52b2:f58:e19:56ae]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::52b2:f58:e19:56ae%2]) with mapi id 15.20.6298.045; Mon, 17 Apr 2023
 14:51:44 +0000
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
X-Inumbo-ID: 702b023c-dd2f-11ed-b21e-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZIjZL3qvVsJtwAESoND4tMX6wP+dVBa1qe1OFw7tF3+ioMTjnNE1Vw/2MIWv6G0rkpSrwM/09UOBeuuhpXSOkc5pKB7Rg1CDrYIRLswrIEY7oMoXsjzJdCfLLr46oL+FKOJ+DUjUBRPp++pHhPgiJIN/+2xhdvfZvEzieSXNsEU3QGMfYaqo/GGhugz/i1F6SsYT1HOLSfNuvemV+FgpGfpO5gR/OyxOd6jZCyJi3X6I/XSalT/L637Jn2nPKaGKvq45JC2PWGehpyir43L64jfsGF0BgX2pkd7Ycq0FcvQIxzYrHU45lg4XonCMJ3AAja+NMMD3YpGTPTGpRXD3aw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jGs3nfNqAPwJY3bJq44yxmf503e25eaRRdy+jNP8/8c=;
 b=bpE2fPk8Aw8/zuJfy3AvFC1n9RBgdIp+eHSam6yQ7BOCFpXYEFD5tepKKjoJE1xPN966E0rdRZ4HoNySJ4qT92GvwLrxCaPJt+m3tNd60goZ4kS5hrysIGCvjjWGDs+j2LEJl4HA9ZqJ+t4/1Qk4ZJ22AF0kV8Q3Z849FuEx9OOlFR7g32Go0OC9vr8npyDTC2ysAkHGSFmoTwzfFI5zIW3JNYybEz/GJOpfkeUkUXH5LfBpqv/SPYsgmxxUQu+3+rIZmGv/tWrOUU9ai6zxsJd1TlIEG1Y9iTT0+QOGe9YsKW2yDNs2DNwB0RTml3NeQzvnua08neR7uJcpVldyxQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jGs3nfNqAPwJY3bJq44yxmf503e25eaRRdy+jNP8/8c=;
 b=Dfw6kNnCqL8g3EIadqP8NQCGcdE49iOR695oStNk41mQe8TGbFG1HzL0iBjEDd3Pz0UBpeRspCaaJLELrW14nhPsX3DndXyRYxLX8xgq7NOu19HHX1rUdrxXPwO/88A6hxitBG4qrfbK0Jl+ipIShjmTwqzFgvU8OmgTY0TxMnbu85lZ8jiQUNj4v6r4GLXrWH4D/+Fyf3YQdRmAvsv1rbW9dy7PmnxBmBYQRRwaYE3SvISqrQCZzmkRuEvY5nyUyAou2gVpAAFLA8pkK2kLD86GJL1HcFdMWukk1bwy8jg3f7KDLVLyQ6JbYslQfqfHQWRPJYVBC18rc0yLAg5kLQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <3ea38da5-70a9-6887-5384-fe002d8568c4@suse.com>
Date: Mon, 17 Apr 2023 16:51:42 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [PATCH v2] x86/livepatch: Fix livepatch application when CET is
 active
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 Ross Lagerwall <ross.lagerwall@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20230417135219.3776777-1-andrew.cooper3@citrix.com>
 <d83288c5-6247-ef7d-b9ba-8bf24c7831ac@suse.com>
 <22179eac-4fc9-1521-2a83-2313b8c44a2d@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <22179eac-4fc9-1521-2a83-2313b8c44a2d@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0003.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1d::22) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|VI1PR04MB6912:EE_
X-MS-Office365-Filtering-Correlation-Id: f07f9d3a-dc06-4f16-931d-08db3f53431a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	sFk/f6fvXzJTL0i38NNa9HlVYOltCEih3FSmeDQ1RbWxg9I/euH+O1Xr4BMwJ801FzPli8qp6RU1MmZU67QNogspVPYqvglIMinS3JU0qdB+aIeqE5Wun4n2vPreuwEdJQyVERuEBEL9LyFfE+70rMh/itGz9E68u1IjguoAzwUv+3aDooAozzZARgwHXogd0T4X+fI6Zx1F2OUcjKJbLCKLij7XFTYG+SyNnBXcBewdAJKAjR4/BFTxGtriLDtXrf2KlPkJNRBjzhqyiFrIFbFF3TX2FgIcJ5Hw5jhtqKUsIUsFVN+o45mp2gBRWd2zYmcKrJ2/sI3qS+NmTZUyr35yo58WHyEXG0m4LaOeT6ZNyGX7Db35WmiZ6DxyRZgQRtR44uR2oGdqZWVbMiFp/07td9M3MqSRZgeQYNfcKOr2NaXWt03k6OcUPW3jmqSgtX4WApFFcGU7qVO2sdSNvgGz4KuOA/gcxJ0Cvmr4Vz4pOYyl0RJnac4BRihVoicG6XHpSW5Ex4kikJ5nl26+hSZ64gF4iU94oGSnCGcielgAOT679Ec1vEuDpd3MfoJ/XL6WkSgcliypNlCX/pmM4QGqsCVPW7TirWjQPqTcFKibNhtQextuY+OCX/9Sn0Xnb/PLlgCYH2vF54UMOzsB5A==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(376002)(396003)(136003)(366004)(39850400004)(346002)(451199021)(6486002)(86362001)(478600001)(31696002)(2616005)(36756003)(83380400001)(26005)(6506007)(186003)(53546011)(6512007)(38100700002)(6916009)(66946007)(66476007)(66556008)(316002)(2906002)(4326008)(8936002)(8676002)(5660300002)(31686004)(41300700001)(54906003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cVRZdHg3czJ1V1pTSDk4MXUrK0p0bnJ5MDJPbEhnekJjczlVZFduMFcxT20w?=
 =?utf-8?B?MGpXT1ptbGIxaWtMNVZKZCsyQTByNmM3Qnc3R2dSSnBLQnp4ZXhsUmdrMG1t?=
 =?utf-8?B?RjZTSERvQ01sTXlNS09YbFVKVC90RVRGZTQ4OWhma1BBeEhqOEpoTG5MRzQv?=
 =?utf-8?B?Y0tjakxCWUE0b2lXSklPdllnUUxCSmV0U2Iya0pTc29zNEx0NVk0ajZTUVc5?=
 =?utf-8?B?S2xrK0FjWm1CMC8vdGdlTkFUMVU2Uk9welpvbnI5N0Mvb21RTHowdzZ5WFZG?=
 =?utf-8?B?Qzd6TTlzSm5iRXZORVdDL3M4UlM5U3F4U1p2aHl2bStlSUs2aDdMOTZCeElQ?=
 =?utf-8?B?ZjB4cXVIWlhDaWo1R3lBVDhCMllXOUF5azRaWVFJVTI1d201blhRTXJIOFp4?=
 =?utf-8?B?ODZiaWtrcy92WnFpU1djbEhuTmhGYmdpSXo0b05xWlZyNWg5R0Rsb1pZN3VV?=
 =?utf-8?B?N2J5SmtpZVFWcjVndWVuWXJIWVdkOGdKdFlZMHk5YlpSVGNEOCtrMm1oeG8z?=
 =?utf-8?B?ME5pYjVBQmpPNjAzVzZ2RDZ2amxoWDZJNGZlOEF4aGF4RkVCaHZQNUUrUjMz?=
 =?utf-8?B?ejJySldMSVNaTlVzOVYrcVVlSkp3N3JMd05xRzRRcHNrK01kVENFUi9rYVVJ?=
 =?utf-8?B?dzRFL29zejM1MTRURnNmU3o2d2hJZTFjNWZjcGM2VWNDRXNWNGg0bWJkeFNr?=
 =?utf-8?B?WXg2eG14dnd3bDJSbmkvYVdTamVvbzJhUEs5eHN0U3dQWnJ1Skh2Z203VEVw?=
 =?utf-8?B?SnQ3T092cUdFckszWkM4TFkxNEpBSkxXMzRKY205akFzbFVESzJNaFVsM0du?=
 =?utf-8?B?RUFVb3czWDBKbHJoN1I4SGdycTZuSUFPZURFMlBWZ1pjV2IyTGxDNWVUM09X?=
 =?utf-8?B?dUpoYmRsQTZpRjdGU2lCQVBhV1NBYUhRQzBQVnkza0VhSjNjWTY2TlBJeWI2?=
 =?utf-8?B?d1lZRnMza0lHV3MxMWVxSmZLemFYMFM5UzNGb0hlME81VzFlMElKWUxwRWpM?=
 =?utf-8?B?RjFyWUZwK3hkK29zb1ZydWZ2dDBmTUhxeTRhZWJwZGlxZ09SL1puWVE0Vkcz?=
 =?utf-8?B?RDlaSnJNLzI5VDZHLy9kMnhaRWlNTzVrWGNmM0pwdVB5OURuUGhWdDdTS1JW?=
 =?utf-8?B?d2ZxN296RGpmQkFJdXN6NEVrU0V4MTVaNFlmSXNzTGx4cXhlVEM5dVZyQWRj?=
 =?utf-8?B?TEtFdjFJZVhQSjlFb20wdzhKc2NoZE91SVBZTER4ZDI0aE10d1FSaENWYWpD?=
 =?utf-8?B?T00yVkFvcHFoVFpPN0I4VzNOM3MyMUZiY3Fra25rV2QzZUhOWHpSK1Z1ak81?=
 =?utf-8?B?dE1XV0JtcTlhd2hmNlh2enpIQjU2OUJUYVZobkdkNTdxM2FJbVpqNFR3Wk56?=
 =?utf-8?B?b2lBRW9aVHo0OXhQaXNWWnlqTnFQZ0tqV09yMGYxYkdEbGxaN3pQb1hJMGlD?=
 =?utf-8?B?RllwZ0hSV2lrSXlCZ0Z5b09Qck1GK25SVVJmc09abXNNbU5pN2s4dERab3Fr?=
 =?utf-8?B?bDg3d204NXl1aWFtRWxmeDdobWM5ejZicDZIZCtueFpTMFd6eFJzcW9YRGRU?=
 =?utf-8?B?NE5FZjl0bnU5dTRseC9KS2pTWEdKL2I4QW9JbEs5K2ZVTlFpTklYaURQVDJr?=
 =?utf-8?B?bFhPNFZ0eWZnN2NRMVloeVBJck1RZVp4Z2I2VTFvaU8raW4rMWhxa2tTUXAz?=
 =?utf-8?B?aWZoT0ZOY1dGUUNjcGFoOTJKNHphN1Q5VjRHNnBFRzIrVGRjZExGTnpVaGYv?=
 =?utf-8?B?OHdJOWdYenR6bE50R1Vmek82dHFLUG1NUk11VnFhRVFPVjdNWVR3MGZQNWU1?=
 =?utf-8?B?N0JSUGdOYzJlVmp1Wis4REJWMHhUcU5wMmt2SVRmTld2L3h1dGNyRDlWNmVU?=
 =?utf-8?B?V0F3UUg3Z1FhQ29yNUZFTVQ3dC8wL3o3VGR5QThoSTBIVUVwNzkyK3FpRXVC?=
 =?utf-8?B?cmVRSDMrWEU2MTF2eXhrdERaMGZLNC80SStlWE1FTXM4NHIvMDBISFhGY2N6?=
 =?utf-8?B?NjltR29VS1NYOXFuWFBvY3AxYUdxWkFqeFRYcUQ5NUtwVVA5c25LbGdoQnkx?=
 =?utf-8?B?Q0JoWUkwZEZrZUE2bHhhYXM2K2VBdzBuNWtiQUNkdDZsb1V6UXJVSG5sOW54?=
 =?utf-8?Q?FNI2Ur9uxfbGsPHK4WJgJgOuK?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f07f9d3a-dc06-4f16-931d-08db3f53431a
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Apr 2023 14:51:44.5672
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0x1qphYs72HvOckxLvyHVfBDVU4+PHLnRBT10eyfouue9gf3R8wxVv8LmkJGwWOn28/sjuHfDvR4KjxNtkzUEg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB6912

On 17.04.2023 16:41, Andrew Cooper wrote:
> On 17/04/2023 2:59 pm, Jan Beulich wrote:
>> On 17.04.2023 15:52, Andrew Cooper wrote:
>>> @@ -5879,6 +5880,73 @@ int destroy_xen_mappings(unsigned long s, unsigned long e)
>>>      return modify_xen_mappings(s, e, _PAGE_NONE);
>>>  }
>>>  
>>> +/*
>>> + * Similar to modify_xen_mappings(), but used by the alternatives and
>>> + * livepatch in weird contexts.  All synchronization, TLB flushing, etc is the
>>> + * responsibility of the caller, and *MUST* not be introduced here.
>>> + *
>>> + * Must be limited to XEN_VIRT_{START,END}, i.e. over l2_xenmap[].
>>> + * Must be called with present flags, and over present mappings.
>>> + * Must be called on leaf page boundaries.
>> This last sentence, while wording-wise correct, could do with making more
>> explicit that it is the caller's responsibility to know whether large page
>> mappings are in use, due to ...
> 
> The meaning here is really "this doesn't shatter superpages", and this
> was the most concise I could come up with.
> 
> Would ", i.e. won't shatter 2M pages." as a clarification work?

Yes, that would definitely help. Nevertheless I was more after something
like "..., i.e. for 2M mappings on 2M boundaries." Which, thinking about
it, points out that while you have a respective check for the start
address, the full 2M page would be changed even if the end address wasn't
2M aligned (but fell in the middle of a 2M page).

Jan

