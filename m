Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BE0EE77F128
	for <lists+xen-devel@lfdr.de>; Thu, 17 Aug 2023 09:27:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.585183.916221 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qWXOO-00059k-SF; Thu, 17 Aug 2023 07:26:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 585183.916221; Thu, 17 Aug 2023 07:26:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qWXOO-00057n-PV; Thu, 17 Aug 2023 07:26:04 +0000
Received: by outflank-mailman (input) for mailman id 585183;
 Thu, 17 Aug 2023 07:26:02 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=aH5n=EC=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qWXOM-00057g-K9
 for xen-devel@lists.xenproject.org; Thu, 17 Aug 2023 07:26:02 +0000
Received: from EUR03-AM7-obe.outbound.protection.outlook.com
 (mail-am7eur03on20624.outbound.protection.outlook.com
 [2a01:111:f400:7eaf::624])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 50b81998-3ccf-11ee-8779-cb3800f73035;
 Thu, 17 Aug 2023 09:26:00 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by AS8PR04MB9045.eurprd04.prod.outlook.com (2603:10a6:20b:440::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6678.29; Thu, 17 Aug
 2023 07:25:58 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::79a:54ba:8003:fbe7]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::79a:54ba:8003:fbe7%6]) with mapi id 15.20.6678.029; Thu, 17 Aug 2023
 07:25:58 +0000
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
X-Inumbo-ID: 50b81998-3ccf-11ee-8779-cb3800f73035
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Wa1UOBVLXNuu1lGYMZnBpSrgQJg9vb1nQGB44w7xyWTK5BHTJiaIy+xICwsJREzalDLfn0G3GnG5iY1jEBMe5fD3QPYta3BWmUNnGrsZwZCQQuYGSugPBSk2Y13lL9VNzEevFVXRAuynX86armZkGsnustMEO4KdMx2dvs+qvCYoVK+21UwOsDnc7SOek13RDxfDikhEQ+QKwaBJiRhYGVpNbHFYYd93OZsgcXXepst7+cVqslQTAUbq9gulHhQlMN4vqTNMneIL3njcQfYJunM64TyJJfHlUbfT/Qn/UoItHTwqqlStga4NIoNcNQ68wN8MTbahbGw+nbt3xJ5LDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CyDc78t3Wi3bKP0WICtCTdLDXetl0D57ArMRu7OsZew=;
 b=PfBsEhGHPBI7EQGAdmZeEqolkBXqk+xPC4PbtnGl+Nv9MBFCq7EQd4GQXSRQveM3KbC80zroZugU3RSS3qIQpKgUgX3EsPlMPSTmlmghdDA7pRrkuRxI9xacskEL91SVREUuQKScG9tOxiR7AZM3mGM5z5tEkoCUaY1d5c/7sByWS1KA6LSWF/rM2FRvrr+GJvkPdxy8rtnrjggJM83M4rXWTGfxxiG/Zzx2Y2afjNyQsHTO/sLh7YzFKuJA/+0c/q0za2uXNrXQD5eu4QPVIPZBwu3gzN2bJGY2rGjKSVGFow9gjg8xGPaYWTUYU9Ew44VnI+c5GkLYGNdoRY0C7Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CyDc78t3Wi3bKP0WICtCTdLDXetl0D57ArMRu7OsZew=;
 b=Y8MJuJjllBIF5S6uckmoGaoJYtQD9vZGzKoWjHt7wQnTnvyIqo+rN4FBTAnwhZr4pqKWd79Bf6I0fZRHge9Fd/URvLfWSbu3K6UG5YeO/TxO00iicyS0dEl7pVNMsYWo12++gdHeUHuWYDmYtBO0ZGN6UaKG4oxrpbiUOFWMNeusZJHXzhhNMBJeuLYf113aWGqTrtUWlB2F+d1UBxMarVfXsb/sQKImdtJIdZbeGww/5ObafcCZdee+LKuwLO6bs4zqvuYLaSPL3nR4uUd1oL0B8wxOd3iomWnYvNOZKcdQWbjJKvL0EYdLb0ee9smHrAzW6uMuQrf9RqiSWppS0w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <adeccc9d-52e2-8c5f-30f6-5dfa67047740@suse.com>
Date: Thu, 17 Aug 2023 09:25:56 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [PATCH] IOMMU/x86: fix build with old gcc after IO-APIC RTE
 changes
Content-Language: en-US
To: Julien Grall <julien@xen.org>
Cc: Kevin Tian <kevin.tian@intel.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <bf497b79-7661-8fa8-6979-90f9951c8735@suse.com>
 <cc82ac63-a019-4243-aa2b-2a4a3a07857c@xen.org>
 <3ad06a1c-2337-fd66-cf2f-9151544dc8db@suse.com>
 <3b15eb0c-eada-4729-aff6-e1daf67fc6ba@xen.org>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <3b15eb0c-eada-4729-aff6-e1daf67fc6ba@xen.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0083.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1f::21) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|AS8PR04MB9045:EE_
X-MS-Office365-Filtering-Correlation-Id: 5892a117-6c24-4907-27d7-08db9ef33378
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	/TWJsun7YTZtYxoVd7A1y4kScOkTOSJUkqjlud/gx9XJocSHNnyWl282IzjD8f8zO2XXskX6z6iWeZ4OT15b+OhTQVN325DT1KXDPHPTmuLvB9bfzF1cuhrfUeCTgwH3FRBmjLjiiEcutiairCv22o58cVz7NTfa7bdz/yqzo7tiiKK8/zUFLCE9I8mgFB/m+j8GrtQodaR/t5dxl9jBfGFxx4GKfwMG3mkdTQI3FkMK82T6WYRTElhQOyWHAfXvUWGK/RJO1R0jBVBUC53czCkO8bWstt3m22HzylTjIrmg0Yy6sU6EGErrX0Qmw7spq2LHXtYuSAY1bqGBnG3+lLyEATjljZLiG0mf7qL9cYspFTBFaaHRrlnnAt8xcKPBPLSPwMjPgOK91VPo9yY3fkzOLjuMX0tUQ6D46rFHARTIzU7+Zz+B7vMYP6LZZIm0z1PepXWBaPAupoWgSxOcM6oeSup3h+VuMPIDIzpaQL6MLxNIlkhEJw8T5v8W2yK4pE81M6cEH5gqM4RPhU+ZF3weIyqj5rz2Ud4EaqkrTsjEts8/gv1zo5x7F17GVO3/gzFgB6LYbp23IhrWRgvvFhhADyJ2b5jitIqCyWmrGAIhGCcK5gkmTEEOT5CE0p3oItaawTJBS4J8sr0VZFqMYQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(136003)(396003)(346002)(376002)(39860400002)(1800799009)(451199024)(186009)(2906002)(26005)(86362001)(478600001)(36756003)(6506007)(2616005)(6486002)(6512007)(53546011)(31696002)(5660300002)(41300700001)(54906003)(316002)(66476007)(66556008)(66946007)(6916009)(31686004)(4326008)(8676002)(8936002)(38100700002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SitlMGVsdXk1aW5wUjJVZko2ZDFnYVh4ZnQvM014YlVIN0l1dmhUaTZmUXpK?=
 =?utf-8?B?SHEzK0lVbXpJeXBjSVNQRnllUERCenBHYUdXc0Ewd1YzTHBRZ09EdG1mdVJ1?=
 =?utf-8?B?eC90bWhMTnVWWTRCRVlRSk92ZFdkWklDVVpnQ3pUUjZ6M3ZIaEpFcXR5dVJi?=
 =?utf-8?B?Mm8rRTA0MnNXRXZ2TkFkci91cndGMUpIQ21VLzBlcDVOUmxYN3JVeTNyRnd6?=
 =?utf-8?B?Unljdjg1VzRQejdZeURmRGZXNVo2Nk1DYjlUSzNUMmk2aGdwY0tNazBndEdX?=
 =?utf-8?B?cnIzZmhnK0dPZElpUVVPYTRXbUJneVF2MlZRc282UUhkWTBpR0xwUVZCOFVJ?=
 =?utf-8?B?VnRtcjVQVkVVWHU2Y1RxbllUSjdCb3ZLT0hDRC83UEVtd0pqVmNJMzB2S1I4?=
 =?utf-8?B?YTlYYkpnaGRGSGE2Yko4MjV6QmZudXd5OFViSnZhVzUrMnhKY0xIQWRjKzBN?=
 =?utf-8?B?dVZBM2JJZXZyVVNnV0hjM3JxYnpYekU3YUkzdWlXbDBJeWh6U08rMTVmdUNh?=
 =?utf-8?B?UU52WVZBQ2dtQmJMcFZVZ2xpOTgrK2xNc1NOVE1Zc2lxeGhwODY1Q2ZNejJ4?=
 =?utf-8?B?SXUvVUVmMUNnRlpkUy9HVkxEaTlLU3NTdzY0NFk5QXhTM09qcDJQV0Vxb3NN?=
 =?utf-8?B?MlZIdzZuU3o3YW1rUmYvNWlMR1BRZDFuVDZTWS9FTzZ6YjBXVFRtZzJLcS9y?=
 =?utf-8?B?L2lvbVFLQnlPL0ZUejExcmlaNGxiYkZ1Ynl2TWI5VzJhMW9zc3ArZzlxY1Jp?=
 =?utf-8?B?alB1SjRWc0FvR2E4UlZtUUhrS2pxcVRTUDJaeTBBOWdKcHlBN0ZIS1I5c01T?=
 =?utf-8?B?V0RYZ3d5NUpCMUpzSENZTHFHM01xZ2MvUWVkaGErZUJZZmF6UEg5NkF2djlS?=
 =?utf-8?B?YjJMd2xhK3dPaTVKWklaN3BLdnVKMzgwZjN5UmgxTVcvS0NDRTVLUkxPMkxD?=
 =?utf-8?B?Ni9QVmJNTFIyNW1WYmJ0T080Q2JBQUp1OFpjZDk1SnFiYXRyQ0NCZ0xOS2Z3?=
 =?utf-8?B?eDNNUkplSDJKTCtia1pXN0ZQRW90YVBHaFo1UDF6M2NVeVRuaExZVWh4bUtM?=
 =?utf-8?B?ck8wRWZIenBva3RXUGFkTGxPbmtFUCt4YjNQS1lhQXJGYkpQSzFRTzNrLzZi?=
 =?utf-8?B?ak44a2MyZWw0VkxOVTRISDZBVGVNdGRmalZhQ3REVHpWczJKSmNKWENFWlhS?=
 =?utf-8?B?WHVBeDNLRThWNTRPN1NrcTZUbUNHV1Y4ZWUyZ01Rb2k2aHJFS29XQ1NTL2tK?=
 =?utf-8?B?RU9td1BHdU5WSHFYY3BmTm9XY3VZUVZHZ1FGT1RXQXhMaysrcEdneEhKb0lK?=
 =?utf-8?B?RGU0OE5BYWFwd1NvTkdkd3JoSFFNSGtZVHp5dlR6K0NQOS9xRlhIMEcrMS80?=
 =?utf-8?B?aHU0MXM5RUM1Zmx5azBQMWNkNGhrZE9rUUc3Ui8xeDJ3eWlBUGRubHMvMDhS?=
 =?utf-8?B?dEE4Y01FWXdaTnk4U1NkWHhjdzBUMTBMTFhlNjJwTUEzN0tNRUhmbElsbEJj?=
 =?utf-8?B?ajNGRHZSc1l2QTBiQzBQMlV1cGs5ZittT0FyUFpCYzBOczdLU1ZOa0hvbFRN?=
 =?utf-8?B?WVhCNTJZT243aVlZeTB2R2ptZ3B3ZTRrOG14aVVBL2t6MzAxZmRFYTZ2NC9Y?=
 =?utf-8?B?aHhGZ1VWK0lyKytIbnBBdk1NTFA4clM4dVBjY2RBME5helhRdzZhT2NjemZ0?=
 =?utf-8?B?cjc3TmVSSzdibnIxaGx6T1RmeFA2T0ozUk9XaDJZUWlBRVB5em8wTzd4N1Nq?=
 =?utf-8?B?eHVYdEdPVGgrQUR6dHNUbTVKajBnQUJ4ZnJKRk5yajQ3MWJoZThCTjBUY2ZO?=
 =?utf-8?B?Y090b3VFc1d4bUxKRVFpSEdqK1NlSnZzOVp6RU5MQmsrS0JSNFNWUWUwaXho?=
 =?utf-8?B?enA5d1lhQkRWMEV3RFZzakNyaHdVKzlMbStiYnJWdkdyd283TFlQT2xMN1N4?=
 =?utf-8?B?MnFDaFRNcGFDTEQrSm1lR2RXeUo3cEJ4RjQ3WXIzeXF6bHlSSWJDNkNjR0J4?=
 =?utf-8?B?d0ZJN1VGdmNWOTZ5RmIwNllneGdxSmlpd3oxcm5ITm9VZHRpRlRVOGxRaHll?=
 =?utf-8?B?YWhNVmJsZm5TZ2twMnRCcGtuTDlEeTdMdXMwSFoyYUpBRjN6QUE4WnBsOU1P?=
 =?utf-8?Q?gV2KNY8+KfScSYoBEyUGeIWTV?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5892a117-6c24-4907-27d7-08db9ef33378
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Aug 2023 07:25:58.2016
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 59xHP2rDf6x87896G8ZYTF421SaK0Vp3v0agoQV6f1TFXL3IPaNJD133t7X9ANqAaQt6JcAGysbXv7m/s8/isg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB9045

On 17.08.2023 09:06, Julien Grall wrote:
> On 17/08/2023 07:39, Jan Beulich wrote:
>> On 16.08.2023 18:57, Julien Grall wrote:
>>> On 16/08/2023 10:51, Jan Beulich wrote:
>>>> Old gcc won't cope with initializers involving unnamed struct/union
>>>
>>> Can you specify the newest version of GCC that breaks? This would help
>>> to reproduce your problem in case someone complain about this change.
>>
>> I can't, without actually putting in effort to find out. I'm observing
>> these problems with 4.3.x iirc.
> 
> You are proving my point. :) If you can't already remember which version 
> of GCC was breaking. How can you expect someone in a few months time to 
> figure out why this was added and whether and it can reworked differently?

Well, I know for sure that this doesn't work with the version recorded in
./README. Imo that's sufficient to justify submitting patches like this,
and without going into version details. Once that baseline version is
bumped, much more than just this code can and wants to be re-evaluated,
by simply trying with the then-lowest supported version (which imo really
ought to be part of what is tested in CI, to not always leave it to me to
find and fix such issues).

>>  And of course this isn't the first such
>> change, and I don't think we ever bothered writing down precise version
>> boundaries in any of the commits.
> 
> I am not looking at a precise boundary. What I meant by the 'newest' is 
> the newest one you try.

Okay, that's slightly different and hence possible to record. I can do
so here just to please you, but as per above I don't think that ought to
be a requirement (and as said earlier it also hasn't been in the past).

> With 'old', it is not clear what this really mean. For instance, 
> technically the previous GCC version is already old. So a bit more 
> information about the GCC version you tried on would be useful.

Hmm, no, that's not really my interpretation of "old".

Jan

