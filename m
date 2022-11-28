Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 46ED463A2CF
	for <lists+xen-devel@lfdr.de>; Mon, 28 Nov 2022 09:23:42 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.448772.705325 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ozZPA-0002Ib-9f; Mon, 28 Nov 2022 08:22:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 448772.705325; Mon, 28 Nov 2022 08:22:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ozZPA-0002Fu-6S; Mon, 28 Nov 2022 08:22:20 +0000
Received: by outflank-mailman (input) for mailman id 448772;
 Mon, 28 Nov 2022 08:22:18 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Emon=34=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1ozZP8-0002Fo-KT
 for xen-devel@lists.xenproject.org; Mon, 28 Nov 2022 08:22:18 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04on2080.outbound.protection.outlook.com [40.107.7.80])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c3ebf7f2-6ef5-11ed-91b6-6bf2151ebd3b;
 Mon, 28 Nov 2022 09:22:16 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by PAXPR04MB8815.eurprd04.prod.outlook.com (2603:10a6:102:20e::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5857.19; Mon, 28 Nov
 2022 08:21:46 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::4da2:ea8b:e71e:b8d8]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::4da2:ea8b:e71e:b8d8%4]) with mapi id 15.20.5857.023; Mon, 28 Nov 2022
 08:21:45 +0000
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
X-Inumbo-ID: c3ebf7f2-6ef5-11ed-91b6-6bf2151ebd3b
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=d7LCkV+wna0NeuP1mD0eQQBXllPDzL/3ISZwcyZVRMGQI4h8RsTufkhBtgGoBggOSlw0/pivC8+1IJEvsiqafK8yQVoSk3qMHgw3wdC4LNXxre0gvwEdbhHPrlZWeD4QOArY38yRcZ5yr3wm02CCx08mbNowfp2iPp8rXeNFTN94hDZlCvVIPd4/x6w78MSendOD3SUdksEhpULJA4XR3xzdDov/625d0ETZkHK4qvg6HkhaDPSCmU1DZDnV8VhRFITKUx8hRWut3mgnuKRdY5l9F3qI7FnW9I1zMJ8g/FVzZCikCIQUfHuRMVkIAms6JPy53+vqxmixbaKnugtsNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hUMt+uhMEJiOxGAdTL1j8fORPcbsuFo+ih4nfw1jzyg=;
 b=isqp+CY7N+YODy1GCUDUJQ57OCm0H+K98geMwLdSfy5kCAJBnAzPOjEfD6Sy51VnHdYRuf8Z8iR5AAZ7XQ1+3torziTyJBit8a9rxLspOB/9n+bmen19Pqo+0DllbQFLFmHLXmL3p/OJExa9UQft5iTr/GTJoJP+p2Q2TubM8ETsm0nAab0uHmyRe5WFpUCimME9ORk/LhCok3kwg+9wDE4461/pccYey9CjoKchpz0by+ZYoPhwPezWUzQPT2ZzpeW4VJs/S6AXFRSeA5Gw7Efy9CPYYibegMmgAiOhzQiI0p3gIskvF12gkjMUI7GdtPX6igC5CpB5e1e6KHOPtg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hUMt+uhMEJiOxGAdTL1j8fORPcbsuFo+ih4nfw1jzyg=;
 b=x9Z26caiQ3k//GXJ6KQz735jL4/nv6jADdRvQhAz8TpobicZJ8xsYARwJmwz44fU2VxOlPtdRdUQktAzbDWHwFKoZ5BJbooboqzOwyQD7sQG+5Hfji6XhhWZ2oIZCVpJraVtEnKAw70dAlIQSdCq7UbzRnCPK/H4HLzHiBAjEASmOoB2cnkXRCsJHkA8DUDCfKKlQH0yYhTegxY3GhbDV18sWmqBg/hnny/S/TRTyfvRg6iCuRouUXg6iAziB47cnC131bQ5z0sm8gSd8O9NOGStUdBBoiTPccBu2qNINuZ77MDzUgPw2v8F9NcNHdnauWcvFE3novZo5OIktXexxg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <fdc2eb93-2b8a-f3c9-82b0-5d4e90ecda9c@suse.com>
Date: Mon, 28 Nov 2022 09:21:47 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH] ioreq_broadcast(): accept partial broadcast success
Content-Language: en-US
To: Per Bilse <per.bilse@citrix.com>
Cc: Paul Durrant <paul@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, Julien Grall <julien@xen.org>, xen-devel@lists.xenproject.org
References: <06ad4b3a67a15192fc986b35e3f2fcd35b2f4c2f.1669383767.git.per.bilse@citrix.com>
 <d7a42f21-6dd3-108e-9278-74d756d941e6@xen.org>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <d7a42f21-6dd3-108e-9278-74d756d941e6@xen.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0010.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a::20) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|PAXPR04MB8815:EE_
X-MS-Office365-Filtering-Correlation-Id: d7b50ef7-28b3-4c90-596c-08dad119964d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	C/rbBZF8wr0l0Rm3Vw7f17+GkrjIgYNWmuNSCqMTN+dVX0nZC05Eyhzg6cXIqH7BzfroH3BDEjMMvnm/6L/QYw49WjFY2kce5BKCLB/qDUITGjXzy0cwvDXw0F82Hce5UgofIxHcs/98W4aHDe5vwTWhZchWT2rJrkaFsw4BfeZefJYLRnHZ6D6fbhI0nGPrkx04dfpUGmXegcNIVkalXhz0i1kuAfPyBImf/6GIZzn8yIdRnU0iimqiI8JtOeUsW6o7ufXDQbCToHYAOd/AJGedG/ojkKPPGQFGJWHtM+LNNFNnpT0+/ODbdLbJbd2KDVkK4xBn9q5fIo9pbFm41S0QMB18tvAWx+OlzhnHxr84QdTu+t+so5pXXuIg6xGn/nldAllVhJTmLU5HZb0LQHNRChXZaBD5oNv7cGckfsapuflpBngkBt5MVQ72BfCgJjpE+UYqCVcTilmhG6ie3iIiNWuFlys1xPtHHCd7BFYnnSofYgX72iA18e1F7aBNJKyqxxujZO8UHp6M5RbK/QbgPWJ/FGfdiJ2NXit/tq8ath8owuvP9gXxemg1Jg+7QFHffqYw2ELZiKMvG/z3dGxwENGqWzYGAApqokE+oFCILwPIQ+FsGdde2++swzMaBS+FyTmOI0BEFdR6DqyPaJ+q32OQBEJGljH8tdf+O5Z3doVRoFxKnw8t+7rOL0JVYVbCpP0qRDuowPChiPXOe2UNOh2NhF836v3YCQOCD5A=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(396003)(346002)(136003)(366004)(39860400002)(376002)(451199015)(66946007)(66556008)(8936002)(66476007)(36756003)(8676002)(41300700001)(5660300002)(4326008)(86362001)(31696002)(53546011)(6506007)(6512007)(26005)(83380400001)(186003)(2616005)(54906003)(6916009)(316002)(6486002)(38100700002)(478600001)(2906002)(31686004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?L2E0Mm5oZldaV0oyMW81UmhoNXgvTzhyM1ZJUUxZS0EyZG13a3Y3RWhuQUZy?=
 =?utf-8?B?ZWxqNm5WTUxuMko0RmZhTG4vNzUyOHJDSnh2akZnOTM5R0pLclZreXpYbXpt?=
 =?utf-8?B?S2RIOEdDVnJqU3VjcHdibVYxRjE2U210YTUzRkw1Uytpdi9YdHB1NzNGeWh0?=
 =?utf-8?B?bHVkazJYY0czazMwd3g0NmJ4NnhRS3lwMzl2aUFiQTNzcVFLRzRDejBoNXd4?=
 =?utf-8?B?Qy9hNUx6NnRubDlHTWk2QnFYUEpkUUpubXZ5NG5wbXZQdGRweVIyKzZwamR4?=
 =?utf-8?B?UTZHLzRTZWJGTERIcEFVRWVqbzN5MVZmQ1BLaDNYYXR0a1JwOUtXQVZWcnYw?=
 =?utf-8?B?aDJTN0M0ZFEzeXlBbVJYbFhRaEVJeDQ0WUhMMHN0K0hzS1MyTDdmejRGYUFN?=
 =?utf-8?B?Q3hjdmR4YlJzeUdqb21rbXJ1RWN4NFNlbGxPbndOSHd3L0dWMW5WblhIbjR4?=
 =?utf-8?B?YVlyWUtGVE00YWZWdStLWjAzQmQxUWU5SkEzWVk1RnZOaitGbXVvaTNpdHk1?=
 =?utf-8?B?ODl5bDR0dEZVVC9jc1NYajVvbU9maWdISUNML0RoZk9aMXdJcGR1TUVyeGEv?=
 =?utf-8?B?YXp1blk0bEVOcEdnd0k0eGZ6SlU2dWhKTUF4OHFqblBVQzQwcStiRDAvWE9V?=
 =?utf-8?B?eVJRbHV2TmpyT1NQc2djVmFpZzZMTG5HREppdStQcVVuNzNQNjNPZmd2dTdt?=
 =?utf-8?B?TTd5d3Fpak5zdkd3YjN1KzA5SmhtMHNPc2RySVp3RFI3bFZUbDVpM0NaYWUv?=
 =?utf-8?B?OGxJeGFNV1ZQRG1TNlRLajdRWDVLaHFJVjBtZ04yOHl4S1h1YlNWdEQwL2wv?=
 =?utf-8?B?SXdoQlZrd1MxSG9taC81RHpYdzd0OHpKZ05Lekl6K1h0U2hjZ0hYKzlmUjZt?=
 =?utf-8?B?WW0wemY2SE4rNzlNYWkvT1hMQW43UXlDcWVxem5MdE1KM2dFODAyYjNzYnVD?=
 =?utf-8?B?a0Q5MWEwNDlyQzM0K1VyUThQbFlWWXhZRUovY3lTRThJTXhqRjFZb0VKT3h5?=
 =?utf-8?B?bjNyQ3E3OVN0d1FqSWJEVnBjOS9tN2ZibFV5ZVZsTmcxd2dKTlJsVmlvcVhM?=
 =?utf-8?B?TlFrUHV4blZIdi9aYkZwajRWQ2x2SHpvVnZFMHdVTU1pZGhlbjZFZXN3bTND?=
 =?utf-8?B?ZXgrMG44VTNWTXRqMFB2RlBXNHlKeUtTcUFxOTF6QXBWK2lxVUVpeWRLbStW?=
 =?utf-8?B?bkhVSmRiYlF5WDFBbHlzSm1YSnlwbUgxajNPSVR6V21COG11OUlGVFlaVFMw?=
 =?utf-8?B?aFo3bEZ5MDl0NjNyaWVXZW5HSUdqcUYxc1ZFbEZSTU9wYkNseHNCLzcwZUQ4?=
 =?utf-8?B?WVFsUjV4WVhtV2M1Z0dZTWJ4QUZ6NnhQVDVlWFhlL0FoeVdNSXV4R0Zud1NF?=
 =?utf-8?B?YzlaL2s5VkQ4dG9GczN6ZWo0RXVobDZERjVzTVBrb1h5V2FhWGx0V3QwelVD?=
 =?utf-8?B?LzkyOWd3azBjaUFPbUcyUWVwZHZTRTAvZzBqQjBBTVczakkvaDBrZmhCYUs4?=
 =?utf-8?B?RlZ0eVVjd29Zd1BUWi96NWRoNEM3K2NMMjZZcCtZK2J5ckM0QnJMVkpOOUN0?=
 =?utf-8?B?VnArQU9scEhhNEZzb2JmN2lHVm43Y21GSjNtWlVpeGlxWE5TRUJiNUNjYjhE?=
 =?utf-8?B?ZDBTNDA2VUlxUlBic0FiM3hlMVkrTGFRREliWXJXVFJxZ09lV0p5MHNYdUwz?=
 =?utf-8?B?R0g1dnExUlZvL3FGa3FnSmc3VTBzTi9zSzBMVXFTSjdLdTB4VnZwU0EwMW1x?=
 =?utf-8?B?aTFFejJobGdkL3ppUkZlVS9zK015YjYxd2hSSHlJYWxYVUZmVlBleVpOcWpH?=
 =?utf-8?B?dHV6WmkyZVA5MXgrdjlESVdWSkUrQ09ZdzRQa1U3aXlPNFc5RTlqU053ZlBZ?=
 =?utf-8?B?U0VBVzM1NnJPS211UlZiaHFZU21KRUI3K0syellWejNRRi9ha3NSTDRja0pD?=
 =?utf-8?B?U09DUjdKcWFOR1FieGVBM0NqK2w4RTRxU3ZGV0F2cHlzV0E1WjRiNUsvWWdO?=
 =?utf-8?B?dnQ4Y0tMMU9QbzBqK3FKbytQaks0Z1g0Ynl0OVEvWWRWek5CUDh6RCtleGtl?=
 =?utf-8?B?T2wwRnRaVHVQdXNzZlg1NVdpYUNSZTFnanZsTXRPdmNzL2U5d0Frek42Zjd3?=
 =?utf-8?Q?JAPIqx+DAxB893VK8mfAZCyrM?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d7b50ef7-28b3-4c90-596c-08dad119964d
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Nov 2022 08:21:45.4573
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LzBDfRu3UjbNUKW3XYHNKV48wfwAZZOrR2+zoCouuofJv2eEzUErSnTrvF6ewTQGl3mNYJkDXjTsdalojBfmug==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8815

On 26.11.2022 23:19, Julien Grall wrote:
> On 25/11/2022 14:15, Per Bilse wrote:
>> A change to XAPI varstored causes
> 
> For those unfamiliar with XAPI (like me), can you explain what was the 
> change made?
> 
>> an unnecessary error message
>> to be logged in hypervisor.log whenever an RTC timeoffset update
>> is broadcast.
>>  In extreme cases this could flood the log file.
> 
> Which should be ratelimited as this is using guest error loglevel. But I 
> think this is irrelevant here. It would be more relevant to explain why 
> it is OK to allow a partial broadcast.
> 
>> This patch modifies ioreq_broadcast() to allow partial success.
> 
> The commit message is quite vague, so it is hard to know what you are 
> trying to solve exactly. AFAIU, there are two reasons for 
> ioreq_broadcast to fails:
>   1) The IOREQ server didn't register the bufioreq
>   2) The IOREQ buffer page is full
> 
> While I would agree that the error message is not necessary for 1) (the 
> IOREQ server doesn't care about the event), I would disagree for 2) 
> because it would indicate something went horribly wrong in the IOREQ 
> server and there is a chance your domain may misbehave afterwards.

In addition I think ignoring failure (and, as said by Julien, only because
of no bufioreq being registered) is (kind of implicitly) valid only for
buffered requests. Hence I'm unconvinced of the need of a new boolean
function parameter. Instead I think we need a new IOREQ_STATUS_... value
representing the "not registered" case. And that could then be used by
ioreq_broadcast() to skip incrementing of "failed".

Jan

