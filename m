Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DDECA5AE047
	for <lists+xen-devel@lfdr.de>; Tue,  6 Sep 2022 08:52:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.399409.640571 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oVSRb-0002U3-L2; Tue, 06 Sep 2022 06:52:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 399409.640571; Tue, 06 Sep 2022 06:52:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oVSRb-0002Ra-Hj; Tue, 06 Sep 2022 06:52:23 +0000
Received: by outflank-mailman (input) for mailman id 399409;
 Tue, 06 Sep 2022 06:52:21 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=o/Pp=ZJ=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1oVSRZ-0002RS-ON
 for xen-devel@lists.xenproject.org; Tue, 06 Sep 2022 06:52:21 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on2081.outbound.protection.outlook.com [40.107.22.81])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 74171a60-2db0-11ed-a016-b9edf5238543;
 Tue, 06 Sep 2022 08:52:20 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM6PR04MB5957.eurprd04.prod.outlook.com (2603:10a6:20b:9e::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5588.18; Tue, 6 Sep
 2022 06:52:19 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::59bc:901a:98a7:76d4]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::59bc:901a:98a7:76d4%5]) with mapi id 15.20.5588.017; Tue, 6 Sep 2022
 06:52:19 +0000
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
X-Inumbo-ID: 74171a60-2db0-11ed-a016-b9edf5238543
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HdmDYn0PyVMUeuEMq6Rvkw5GKAIXQ93uWZK9sc9/oN2bjmoCHi5/rC0qdc61b2nC8pBcywrqDE1NxBMH0nW/1fxs1xAUDN/2Fv5/IKiKdv6BksEX4eSPx1V8HJVipQSvNkHJO31VyRD9c2FVfADd2MmJZFxaRCkwE0d1WUahWLi58dhKWeVsZTYULlCPVjaP7NlxQTk+8ESsm+hWpcACvgZY2P8SihAJWMCDgjfx6leweayua1uFT9LUdSiMs+HxT6JddJDo/wUYKF3euws7FxMRXCbNyHAnOqhziDwtdO/OnPBdl7N4sft4Lbs+8NfaPQmI+V6BssQ3D1mrLLScEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ytRg+7SBo4U3Tgcagqli6pR6ip8yI/MJujbsIYjbjEA=;
 b=m2g4oBWcx0izBJ9UoRQe4Vdgl29Zwkqs4qTN3D8qQEkKBYWNmmghnJomEcAtZ8YX3TlhRwAtpx1TvC6TRhoUuLUmBvgkfweac9Iurjnyf79PKHSmU9p8m6Ig9hG18WmmkOPZdPV17M8vfvHJI2OgEn/xjABSe621jQKAcd0VVK7/8HHFVrgM34fdoyvEFnjx7bweC0HbAutGV5RfkliYs2DYooZ0THZoHkFju++luLrDJG8m7n/n8Akb6gR63Y6DVyZCVoDmSkhRmh5aqsH82UpMgydQu+fP7S2HUSGOOmOIOwn7aC2rNLJur+h70C9/b6SaQFZFVk5RA+oZKHDBEQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ytRg+7SBo4U3Tgcagqli6pR6ip8yI/MJujbsIYjbjEA=;
 b=qDwJGjBE0uPmLUlQV1bdop8kksaXEonAhEB8AehY7Fp0VXJe1azwqp1aOx3Ul5fRYkH+Rz9ZR70XRzTqaJ43BWzN3eDz5dYRiYXN7KRdVBGfQKDUDglpAQEsl6364+QNBb8AqB/omVgCoPd2Iukg/UEyTGMFWiKno8okCS2NogChaur4Gpfpn+4YqYPEObSliAqPoOneqd2DBKJlPlpOn17OJBAlbH9Jm3SOHb4ScV8r6gRBlAm8c9bv2Gh3tQ4jvC17XKu2wgPsHMOya8PuV/ov0z/Ydh5taOvPhHG15Si3k37suULmXVU1hLLfB4s7sDuGTcAeapEg4B7yBZkbQg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <9cefce23-a903-9ff0-2690-ca973432cb82@suse.com>
Date: Tue, 6 Sep 2022 08:52:25 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.1
Subject: Re: [PATCH v5 9/9] drivers/char: fix handling cable re-plug in XHCI
 console driver
Content-Language: en-US
To: Andrew Cooper <Andrew.Cooper3@citrix.com>
Cc: George Dunlap <George.Dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?= <marmarek@invisiblethingslab.com>
References: <cover.4afa0fece5b70e838e4f1c7c7f25d0fa3d157073.1661181584.git-series.marmarek@invisiblethingslab.com>
 <bf26655295d0d85b1718d60f2e4390da7ec62b93.1661181584.git-series.marmarek@invisiblethingslab.com>
 <cdbe1100-0a28-cb4d-6a89-5efc5838f4c4@suse.com>
 <6ab5ac63-becb-3635-20f5-dd0f03188003@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <6ab5ac63-becb-3635-20f5-dd0f03188003@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AM6P191CA0075.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:209:8a::16) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c501e395-4676-471c-fc4b-08da8fd457b7
X-MS-TrafficTypeDiagnostic: AM6PR04MB5957:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	i/rfHAtGQm1XxTiITPu9BfbfqJfoJN9YKVVFwjbNUlOZOYHIREx3NaZzMlgirbPlBQryz1BkzuWLIPYu1xbRrK3G8CQIZWY1ksIxkh5lH3IR5VegEQzEGooQlxm2OiadTvFt2reSrjpbtnKoF/SbLjRpR90QmRxN29FzIoFBkGu1f7xOeKVsgPKqBbOOOopl/LBRNfPogv6mqe2anJfPRRt5YC9orj6fb63bIkItiY+eA43O4WbRIP8rYRjNYGEEWfi79ODPncLCn2NpBlaHV28f3CgBF540k5xQsEwhmrkgFaPxpm5CzwCpu1qrIsyqd0ttV8dDWP2+rz7oDhPhLE19/GkXN7AAscYrYVINdi6bvHEZQaHE18LTPm2Fv7acb/rDP3xel3F+FVkcUBnkPjL9kCCebjEjwUmwSGKna4rOD9+Zlolr0a6lVY+QXXrGzdFOWjG1vw5HHYaRsqJ4q9e4UUlUS5+UUhhaPv1MDXmlPkVA5lp2jYHkujUvak8lMuXRqvJloIIKQrKIFDMSveRyeb5GeesOkcYcbQkVuDGbvqLYot5KCRqkfZ+VniYrOASk1nPJv01S0B7cqavFrhxmr+CtJnyw8F5iTaOQIyKNWEg4uiPKXLGAtDRtIRpPYgG9fCrjM2GrWbdNdVE1YWmzclTllv6R9ORlq+pKq5zuwrrdUFyYNnJu+aX0f7crX4XgYYor52QHqZO7ia8dj4sCdn+/vDMe5uBKA/W4UJP7V2YS9r2LSlkwMkuAH0fdEqg/JE9+O5OdC7amgVh3m/o5mwDeLsH7oiddbx6SBTY=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(376002)(366004)(396003)(39860400002)(136003)(346002)(36756003)(38100700002)(186003)(2616005)(4326008)(8676002)(66476007)(66556008)(478600001)(66946007)(6506007)(83380400001)(31686004)(41300700001)(6666004)(6486002)(53546011)(6512007)(26005)(31696002)(86362001)(5660300002)(8936002)(54906003)(6916009)(2906002)(316002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?aDRGUXZzOCtmWnQzMmpYNjU4RTJxS1F2aUJtcjFGSjlweUc5TDZtVm1JY1U2?=
 =?utf-8?B?OGI0ZzhXVkxsWXZCSGZrTEZLNEZ3R3Bua0wyWW1RcFJ3dVpZblAra1dCSkpj?=
 =?utf-8?B?cUozdnJtZzJHZXNhS1dzRUVHelB1SENwZi9lcE1JMkgwY00raUYwblpJRGph?=
 =?utf-8?B?ZWJPSWhwWjZBdUhwaE5GTCt3WFRFT0RRSkZYZmJ2WGg3WjdORkVtSDAwL3Fu?=
 =?utf-8?B?d1doeFdiWXZHTnZMTUpjT2k2YklXMzdrSkIzRmo3TnBHTmI1MDUxYjJjZ1Yy?=
 =?utf-8?B?R3h0U3orNGU4SVU1ZERmODVIRXkwTmMvVmM0dXZnNEI2eVFwbEVqNHRxVjV5?=
 =?utf-8?B?U3hBT3Y2OXdrUVRiNmpuSzdsRE5YWVp5UHI1Z0VUYk9vMnVzU1JWQzlzME84?=
 =?utf-8?B?ZmxuTmQ5aW9LM1Nja2l3TWtwa0RhdXluWGNCRU9rOWFiNnJySnVBcnBRNmNW?=
 =?utf-8?B?VXE5SnhJSWZVU1ErV1BodjhoNzhBYnZVV2ZJcUhuYVdEd1l2WkplYndtTGVJ?=
 =?utf-8?B?YnByS3d2RDk1NlZhZHZMVzlnbjRoWkJkZzhMYk9TS0ZUZFI1YytrYTBrU0NZ?=
 =?utf-8?B?dUI1ODJsV1YvNjJRaEVEaG5FMmVFM04zRThqdG51b3A4YSt2OFlqbFpCS2Zt?=
 =?utf-8?B?bk5aQTRLOVdBa1N6L2hlcnUzUktleUVueVdrZnhYaFlEcmZwdWZRdkhPdjNC?=
 =?utf-8?B?VUY5bXVQaXNKbG9scFlUdWNvZm45RXZ4blpMTTR4LzZiMUNSNnNlWXNodzAv?=
 =?utf-8?B?c3U1em92N2llZkhadlh0Q3RrVnY4RzB6UXNXOHRwOG5YdTZqRnRqU0Viaytk?=
 =?utf-8?B?MDE4VWYreWFKY3JWTWpXTEVRaUY5ajFRTlU2YTB0ZGhodmNpcldrd0JtdEhR?=
 =?utf-8?B?d3lwcUNRTDFlTWhuNEtyb1R5dGhNd04zVTFVRUJGNHlGeDFqRHdreDJmUDBh?=
 =?utf-8?B?ZUNOYXliMy9hUlVEOXYwY3RHK3VFdmFxNXJucGRkT3lZL3JhNXhHMmN3amY1?=
 =?utf-8?B?RExDK3BUZENKdGwrNk9yZG16MU1mejJYcDdtWmExaFBGMm1KbE1ocFBrZHVa?=
 =?utf-8?B?aTRMNm5sVWJRZ0l1RTFtYjNaOUJ0ZDhqcUI0REVTOWQyNG81OFg5b3Z0VXQr?=
 =?utf-8?B?b2dtZEdRN1M0V25XOHFhUjBaV1NBMDdEaC93bmNwWENPS1d2MDNxU0pZOTl5?=
 =?utf-8?B?OS9PS1ZXS2o5Mms1Y2FjV3psZWIreDJ0eW5TSGVJOTA5MG9MQ1VzWHl5TEtM?=
 =?utf-8?B?U0ZtVjFhSFJRckVEWWE2ZHJ3MmphUmcxSjYwSkd4STZyZ3B6TVdQR0dyTjdo?=
 =?utf-8?B?NlhkRkJVSWMyRXVIdVcvTFl4ak96eEdJMy9uVy9XMHNFc0pjSXVjdkJTVm5Z?=
 =?utf-8?B?VUVLL2dndE43RHNEYXA5bjdUNlJYRnRPcmxDb3RsZHNTWWR2U1VERHVkZ1Nn?=
 =?utf-8?B?MkwyMGYraFpnR2lHWTltUUNsVzdRYklIV0dFdWs3N0owakFidHQ4c0FpVHZm?=
 =?utf-8?B?ZFFVSGJKYktEOVhEZU1Ha3pwb3JZSGJQdFREdjMvKy9haTBORm01Tlc3K05j?=
 =?utf-8?B?SXJIVHA3RmJWbHNnOHp0OEdjUkNlejFpaUgvSGJXbXZGMmEva29yOEtYUFdU?=
 =?utf-8?B?VGdNUlpBLzVrUXdVQk5OK0N2TFNVc0p5czVxN0RIbmMyOXhXS1NVQXJjeVBt?=
 =?utf-8?B?KzlGTTJWYlVUS1dCSkJueFZZQ3VXMUthMjZEbUdzOFM2MHNVZisxNk9RdjNB?=
 =?utf-8?B?ZEpOMXpRaGp0Yk80YjZTSjhkT003NHFGT2VQbkpzOXNrQnFlcE1CZnVZWEt2?=
 =?utf-8?B?UFNMUnJMOENpdVlRL0ZyQkVsOGVpWWc2SmVybHQ3UW91b2VDLzZkZG1QZUlW?=
 =?utf-8?B?UzdVQUplK01XT0ZySjI5Nk9DU3A1RUNJNmRvVjk5Z2s3eDNYbm1MTjYzUHFG?=
 =?utf-8?B?ZVY5RFgxQVpJN1llYW9xblptaDY3VDl1RGpHRDVocHRlZzRYMVdqcnpxWldF?=
 =?utf-8?B?Q0U0T2ZUb3MybGd0OWxWWnFQVHNTRjgzV2hFSTduZlFSM0lCTmx3MkZiSUU1?=
 =?utf-8?B?L210U3laTExzYkJYNXNxNWpPR1kwS2p3VUYvSlFibTExZG1TYmVsQ1FjRkpy?=
 =?utf-8?Q?tWhVX4TMPx7qb64/mLc1w2Jcd?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c501e395-4676-471c-fc4b-08da8fd457b7
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Sep 2022 06:52:19.5110
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wo0RikG85/4m/TxHckS0AIGgkYCmXJnkrns7qYch4AttzgvBltmlgnPZg88NyerGkDGOBOgV3CGtfLbjRIt9ng==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR04MB5957

On 26.08.2022 17:44, Andrew Cooper wrote:
> On 26/08/2022 15:50, Jan Beulich wrote:
>> On 22.08.2022 17:27, Marek Marczykowski-Górecki wrote:
>>> @@ -1023,6 +1032,8 @@ static bool dbc_ensure_running(struct dbc *dbc)
>>>          writel(ctrl | (1U << DBC_CTRL_DRC), &reg->ctrl);
>>>          writel(readl(&reg->portsc) | (1U << DBC_PSC_PED), &reg->portsc);
>>>          wmb();
>>> +        dbc_ring_doorbell(dbc, dbc->dbc_iring.db);
>>> +        dbc_ring_doorbell(dbc, dbc->dbc_oring.db);
>>>      }
>> You retain the wmb() here, but ...
>>
>>> @@ -1066,8 +1073,7 @@ static void dbc_flush(struct dbc *dbc, struct xhci_trb_ring *trb,
>>>          }
>>>      }
>>>  
>>> -    wmb();
>>> -    writel(db, &reg->db);
>>> +    dbc_ring_doorbell(dbc, trb->db);
>>>  }
>> ... you drop it here. Why the difference?
> 
> As a tangent, every single barrier in this file is buggy.  Should be
> smp_*() variants, not mandatory variants.
> 
> All (interesting) data is in plain WB cached memory, and the few BAR
> registers which are configured have a UC mapping which orders properly
> WRT other writes on x86.

But such drivers shouldn't be x86-specific when it comes to their use
of barriers. For this reason I specifically did not complain about any
of the barrier uses throughout the series (with the further thinking
of "better one too many than one too few").

Jan

