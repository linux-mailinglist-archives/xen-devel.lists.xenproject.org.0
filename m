Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 53233627925
	for <lists+xen-devel@lfdr.de>; Mon, 14 Nov 2022 10:39:35 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.443216.697757 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ouVw3-0004wz-OZ; Mon, 14 Nov 2022 09:39:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 443216.697757; Mon, 14 Nov 2022 09:39:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ouVw3-0004uy-KV; Mon, 14 Nov 2022 09:39:23 +0000
Received: by outflank-mailman (input) for mailman id 443216;
 Mon, 14 Nov 2022 09:39:21 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=b4jG=3O=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1ouVw1-0004um-TK
 for xen-devel@lists.xenproject.org; Mon, 14 Nov 2022 09:39:21 +0000
Received: from EUR03-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur03on2083.outbound.protection.outlook.com [40.107.103.83])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 36ce8db1-6400-11ed-8fd2-01056ac49cbb;
 Mon, 14 Nov 2022 10:39:20 +0100 (CET)
Received: from AM6PR04MB6551.eurprd04.prod.outlook.com (2603:10a6:20b:fa::20)
 by DB8PR04MB7002.eurprd04.prod.outlook.com (2603:10a6:10:119::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5813.13; Mon, 14 Nov
 2022 09:39:18 +0000
Received: from AM6PR04MB6551.eurprd04.prod.outlook.com
 ([fe80::48df:9a8c:c706:36b5]) by AM6PR04MB6551.eurprd04.prod.outlook.com
 ([fe80::48df:9a8c:c706:36b5%3]) with mapi id 15.20.5813.017; Mon, 14 Nov 2022
 09:39:18 +0000
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
X-Inumbo-ID: 36ce8db1-6400-11ed-8fd2-01056ac49cbb
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=L8G73hh6YgpGhJBggZXpmrFjoKS8n+FD+1Gk6QNgbmk2l7H+v84coDndIJ6Ey3P59nW4GJsMj7CbZDgwfKx9GiGs+jl6vfpyIfV6y4OGOrdMOPM1HsnjPqHIooQ6B9sv+X6XcsrVWLyblxF3uSrdv+mapEhjux+ysy4Zx0rZGLOJbOmtl9CZBDmYXOz9lftKDVrBZneAzWiiZLWN2Lngp4GiSVeG30g81r0/CDjRqwQoslrUrK2guVy5CqkEL1fRiJOucs6u+Qhc5fZw/iBNGcPayoZxO7UzpbOfQqiKh0kRcDSx2ddep7iEDeH4051uFh02Q+yUKwgqq9z8/HyO+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Leacm4iRByqnWFw5F+GclDO3j67JX2ZwadIo5qzMmRc=;
 b=eBsXNK8b0zq+fY2CxUPe3W2cGQZNOY4VrY7amFHULzYiIWPGHVaiYSX334kWkRZfEVBVxYqsx3eFqVMt46koxHgoADXR1hNyf95MqMOT3E3+bE9HMQb9MRH9E7p2bIaaYKvsxU0Gnki05xNMXC8JRQiYjJbs7Wjhpc/9Zxy38PEQJk8e1gQhA1LvEY1mXgjQqpNPfgCdk+bqPx3qYXqx3CzG5PFC/09Ip4dbtcqKRLnun1KTaiRaiPhgGymVoLii02mUmdo7U1p7qa0G9jtjVvrwUSo4BCy7HcJBofr/pccZhZDJqfu7pFKatYvX8v7HqZdJsCi/FA+exXtPazVDwQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Leacm4iRByqnWFw5F+GclDO3j67JX2ZwadIo5qzMmRc=;
 b=bE5O5klJ7ivzy/JrYzKf1ER61aBIPb52tZwe79im8TgiiqkIAbS7FpePq9JmxBg266E5P4ksZcFn4WAIxJGIAyb9klWmHrWeY09/lp+k+n/ngacHr/cTMe3+SK9oaqTxB4zaP/G7x/nqJ9Wxeor4o5CWzG0GwU57qE2jicziqtsZF4FYrsyKqyV7lFrJ6fA/ZRuRM90lyJqkV9TgeFhhDajUspNqsN9g6hj25XvtTqG7B0D0U7mys6u+0R7+YqcvnvLc2Yp+tnjw6S39uEo8yQ/d1xn+6dy8Y13Y8Ve37cuEE6EGke4alXXd9cloR8SRPqYjKYiEqbQ98MO8fS1hXw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <6592a385-296e-dff6-f6f3-3f8fecef5174@suse.com>
Date: Mon, 14 Nov 2022 10:39:19 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v8 0/6] Device tree based NUMA support for Arm - Part#2
Content-Language: en-US
To: Wei Chen <Wei.Chen@arm.com>
Cc: nd <nd@arm.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, George Dunlap <george.dunlap@citrix.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <20221114063451.473711-1-wei.chen@arm.com>
 <3aa067b2-fa49-326a-c5a0-6735bc95951e@suse.com>
 <PAXPR08MB74209231BFD7E8C3004C55A49E059@PAXPR08MB7420.eurprd08.prod.outlook.com>
 <2beb3d17-99f6-77fe-a5d6-d60e665f01d5@suse.com>
 <PAXPR08MB74205604C48B1D2CBB7A135B9E059@PAXPR08MB7420.eurprd08.prod.outlook.com>
 <73becaf7-8c94-1261-f504-865cc0425c79@suse.com>
 <PAXPR08MB7420A563C58E6EEBCC12932E9E059@PAXPR08MB7420.eurprd08.prod.outlook.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <PAXPR08MB7420A563C58E6EEBCC12932E9E059@PAXPR08MB7420.eurprd08.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0009.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:15::14) To AM6PR04MB6551.eurprd04.prod.outlook.com
 (2603:10a6:20b:fa::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM6PR04MB6551:EE_|DB8PR04MB7002:EE_
X-MS-Office365-Filtering-Correlation-Id: 9322d59e-9932-4c6b-e283-08dac6241a26
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	h+xjglSDDGvj1FTlGyyqjYjnJhcRzlgX4hCSY02TVfwL/9opK3msZiDFIuYJgQLDofgDH8p+dhzVe2VEeZc+GlC5nqzFUAI1pxc+K2PCxm1eRTDBXDNx7in0Nu1lS4DTgkZeELtPCkcT2VqXQBm5xBVLmZiLvvS16T2zN42fFw/+CZ3EIJ2WLJwZjH2asbtv5ap4rQaXzt5SJgXxj7+bw73H4XtY2qu7Hyp07Vchrg7Z84hpO768ed26436KRIzGBRejpzxGKvW4PfyX062QB3gYxEc1d1xOKBe3/cJ6KD2yiK2GyL6AXlmnvPtFsbMJA29+O32MoOWowasva3way8EC0rH0G9/n+6cIsMLBqyXBT4VmPmc22NKc9qfS1zvbiT6abUTY7vILtUvaUr9irbuk62Twg1cCczcbBfV5X4kPFc2JlUqQqaOi50z1LKMXlvtIxyX00yF6E0Gz7kKNZG5qPhd102KNZV/c1/5TUN3WbAx50a0Dr/qwl5ew3dpEXiJE2UfBop3st7AtPJtEAQzQk8BFm2RwcuvXbEzF+7VnQrOGFRFDdTwSHOeSmkOvqJYBGLrxAqx7ALus/q1wSY45+qEzsCQMBI7EM2LRw/MBwpD9xFndTG+TFDZOXXdfczmp0P/nZ9VEjP2pktVRg0t0evPwJGXZu8GQT3z+ulQtofqq7jIYsMHignK/Rz5mwjSJK0DljHuuE49JUTQzymc663wE5ng1XKylvoYINNUyaFWxwU8xksZs1pJZa6cjBtyln2N5i4t4EVYd3iCgEIRkcLmRWz/1acodnefflw7EVL7/pfBp50Vxg8TyTIEXN2gs6Uf2/u8Lq5UQU0SqTQniNv4KPlJw8BF/w35ViIk=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR04MB6551.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(39860400002)(396003)(376002)(366004)(136003)(346002)(451199015)(31686004)(2616005)(8936002)(478600001)(6486002)(966005)(6506007)(53546011)(54906003)(6916009)(2906002)(316002)(36756003)(41300700001)(86362001)(66476007)(66946007)(5660300002)(186003)(66556008)(31696002)(4326008)(8676002)(26005)(6512007)(83380400001)(38100700002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?K3RpR0x0WVhyWHRVRTMvZ2lOYkpkNUFKQ3ZRMWtIam9UMTFqZkFkTUI2UnRw?=
 =?utf-8?B?S05hLzRJbU44bG9uV1ZQTVFWbFRzZ21WYjk4Z0wzRVpONEp2dXREU1dnczhC?=
 =?utf-8?B?NUZ2bXUrN3dRWktPdVNhR0k1cnlTSWNuUVo1SmM2SnJjaWpweUVadWxTUUVC?=
 =?utf-8?B?ZzZUQ014Y0drOVZxb0dqMmdtNTY2emRJcDlXcXdpNVVxOUFtWnZtTktsU2hl?=
 =?utf-8?B?UjV3L2Rpc2dMNjQvcVFEQTg1cWdtd3FIYmhKQVRTdlpkM0FNTVRpRjJlTERT?=
 =?utf-8?B?MUdkM2lJd25EdGV1c0VORys3elFIRFFabEZGYUluTkEyL3RBbis5NWdmeVZm?=
 =?utf-8?B?SGUwdnExV3FGK05iQnd2M3JBaGp5L09kZzI5ZlFxUG5UWmgwTkkvaUQ0VGRI?=
 =?utf-8?B?ZExVcVQ3WThxc1Y5YXV2QTdoKzh5SjNnWk16SXA1aStteEpia0E5MFFpckFh?=
 =?utf-8?B?RFhlbFJOd0ovZXdTN1RBNUMwcUs0U0JJNTQ4dmNsUVY4dWVXSVVMcklsWlZ3?=
 =?utf-8?B?K2xDczc0UFZxaDRLY3g2MGdpdnVnM1l1NUxTdHBBd1ltaHZXbUswSnFzNG9I?=
 =?utf-8?B?ZWtld3dHbUcxZitwdXZJTG9rZTl6ejdNSlpSOFVlMlpPMHhjNDB4VkJ4ZEpy?=
 =?utf-8?B?S3hOdjJzbmFnYnZDT0pOZVFaV2pHS3pGaU5RR1hMSHV0MEtNcStBak1rNXBQ?=
 =?utf-8?B?YjEwWWIwSyt4UVR5VFpnU3N0UUtBRkU5UXE1MklGaFFpZnd3MnpnTjhNdDZN?=
 =?utf-8?B?WE1iYjRFcFcrOE5zdHpaSW42M0V5aWZPMjNDV2pKOHhpaFBZaktyRFlNMlky?=
 =?utf-8?B?MVpGVWJySHczWEZsT090Ty81cEg5am1wRUt4dm9tOS9ob0gydFpDaGZmclVP?=
 =?utf-8?B?TWNhZWthYmIzOXJoNnA5NzgvRWkzR0tkblcyQ0pqbjNZb2RMQlhQbllJKzdi?=
 =?utf-8?B?c2hZQ0JndExPcmFWc3prQnQ3S0t3aXQydXdYKzBxaFNjMldBekg3UFQ4M0tZ?=
 =?utf-8?B?bW5iOWNHNUN3Q1VJWVZ0S2xwdFozanlRYzIxT3VIVXBwYUM1Q3Y1bUVzU0VE?=
 =?utf-8?B?dUdTVHV1a2Z1SFA4WlVDZHFwVDByTmx6czFwU2xsWncwY3htY0tHazE0WmtB?=
 =?utf-8?B?cHI2bUFmV0VIWmVaV1NUa3BscHlrN2pLUkhJcStQeVdhYjJYQXUyazZVcE93?=
 =?utf-8?B?eFZOQitRZVZwQUNVY2ZTNFlzU0pDM1pvOFF0QUFiMkIzK1h2UkNmUEpHSzJD?=
 =?utf-8?B?K0hLWWQ2NWo3L3RVNGhYRlBvZXlOdXl0SXRycnhITnduN1VTTmxuRzRSaUs3?=
 =?utf-8?B?V3doYWgra1gwMUpZTDVTRFFtcUI3RUdqVHc1R1hNUmMzNHZhQmZZb3YwaHY3?=
 =?utf-8?B?aG1iKzNMZUd6ekJnRXZJSU9VMGtONDFZT05HQU5EMjlWS09pNXhOWVN1MTNs?=
 =?utf-8?B?eERnYy9tdFVwbStxeE5ybEs2V1JVdXorWHJDVXNYWlJZWVJHM0diRndSaGx5?=
 =?utf-8?B?Vk5PazY0NFBJbmVTM0NxRXJYVm5pekZ3V0RaWWZBS1l1NW1NVngwdHZGZEda?=
 =?utf-8?B?Wkx4SGZrUkFIc25pd1dRWlRBb2xKYzZ4VmVXWHFScUI5a01MNk0rS01McVE4?=
 =?utf-8?B?MmowbkMvSU0rRnFzSXh6THVQcHBsaCtyQktaR1NINnVZRUR5Ky8ydC9oeXNt?=
 =?utf-8?B?YlRrQkRyQ21jdlIrODlQVW8yc2tBRDM0QmJGcWRFV0JsMElzMy9PSjFJbWpk?=
 =?utf-8?B?VHZSNS9jcEhKYmtzREExR1FLVmZmM210U0J0Nkp6MmxSKzRkMUZrZmF3YWh4?=
 =?utf-8?B?UTF4OFFoYUVCbEtseFNqZlJTSkc1Mm0rVkN3MXpBWW5JVW9qdGQ1VVV0NHhM?=
 =?utf-8?B?Y0hKak9OZDBBZVpYMFBtLzFuTHM3a3k3YjJUREdRdVlwZ0ROUmsrY2ZtakY1?=
 =?utf-8?B?N3F2Vzc1R1ArMW1xUXNJYW1GWWEyYjNhSHU0d21XMnpCemlOam5BR05JaWo5?=
 =?utf-8?B?Y1hGU1RPQkFKRnJrM3VnMWxaUWJ5QlRhS1ZwcFV6OW0rRVpRU1N5S0VGOEFw?=
 =?utf-8?B?NXQ1b3BuWFc3TUk5VjZKNDdueTFsaTk0RlRqTERYMU45VXg3TXNHOEloRmtt?=
 =?utf-8?Q?YDFFk5fncoBQj4hRXYGpK55hG?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9322d59e-9932-4c6b-e283-08dac6241a26
X-MS-Exchange-CrossTenant-AuthSource: AM6PR04MB6551.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Nov 2022 09:39:18.7162
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9u4f+WhqYPcGnGtRTE61ez+TwL3JYxfn2OKWcthgLk86TsMq66eTq/C9pJVZyGIwswbzu5h1bHBes2Rkm+RJ9w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR04MB7002

On 14.11.2022 10:37, Wei Chen wrote:
> Hi Jan,
> 
>> -----Original Message-----
>> From: Jan Beulich <jbeulich@suse.com>
>> Sent: 2022年11月14日 17:29
>> To: Wei Chen <Wei.Chen@arm.com>
>> Cc: nd <nd@arm.com>; Andrew Cooper <andrew.cooper3@citrix.com>; Roger Pau
>> Monné <roger.pau@citrix.com>; Wei Liu <wl@xen.org>; George Dunlap
>> <george.dunlap@citrix.com>; Julien Grall <julien@xen.org>; Stefano
>> Stabellini <sstabellini@kernel.org>; xen-devel@lists.xenproject.org
>> Subject: Re: [PATCH v8 0/6] Device tree based NUMA support for Arm -
>> Part#2
>>
>> On 14.11.2022 09:33, Wei Chen wrote:
>>> Hi Jan,
>>>
>>>> -----Original Message-----
>>>> From: Jan Beulich <jbeulich@suse.com>
>>>> Sent: 2022年11月14日 16:23
>>>> To: Wei Chen <Wei.Chen@arm.com>
>>>> Cc: nd <nd@arm.com>; Andrew Cooper <andrew.cooper3@citrix.com>; Roger
>> Pau
>>>> Monné <roger.pau@citrix.com>; Wei Liu <wl@xen.org>; George Dunlap
>>>> <george.dunlap@citrix.com>; Julien Grall <julien@xen.org>; Stefano
>>>> Stabellini <sstabellini@kernel.org>; xen-devel@lists.xenproject.org
>>>> Subject: Re: [PATCH v8 0/6] Device tree based NUMA support for Arm -
>>>> Part#2
>>>>
>>>> On 14.11.2022 09:14, Wei Chen wrote:
>>>>> Hi Jan,
>>>>>
>>>>>> -----Original Message-----
>>>>>> From: Jan Beulich <jbeulich@suse.com>
>>>>>> Sent: 2022年11月14日 16:05
>>>>>> To: Wei Chen <Wei.Chen@arm.com>
>>>>>> Cc: nd <nd@arm.com>; Andrew Cooper <andrew.cooper3@citrix.com>; Roger
>>>> Pau
>>>>>> Monné <roger.pau@citrix.com>; Wei Liu <wl@xen.org>; George Dunlap
>>>>>> <george.dunlap@citrix.com>; Julien Grall <julien@xen.org>; Stefano
>>>>>> Stabellini <sstabellini@kernel.org>; xen-devel@lists.xenproject.org
>>>>>> Subject: Re: [PATCH v8 0/6] Device tree based NUMA support for Arm -
>>>>>> Part#2
>>>>>>> So in this patch series, we implement a set of NUMA API to use
>>>>>>> device tree to describe the NUMA layout. We reuse most of the
>>>>>>> code of x86 NUMA to create and maintain the mapping between
>>>>>>> memory and CPU, create the matrix between any two NUMA nodes.
>>>>>>> Except ACPI and some x86 specified code, we have moved other
>>>>>>> code to common. In next stage, when we implement ACPI based
>>>>>>> NUMA for Arm64, we may move the ACPI NUMA code to common too,
>>>>>>> but in current stage, we keep it as x86 only.
>>>>>>>
>>>>>>> This patch serires has been tested and booted well on one
>>>>>>> Arm64 NUMA machine and one HPE x86 NUMA machine.
>>>>>>>
>>>>>>> [1] https://lists.xenproject.org/archives/html/xen-devel/2022-
>>>>>> 06/msg00499.html
>>>>>>> [2] https://lists.xenproject.org/archives/html/xen-devel/2021-
>>>>>> 09/msg01903.html
>>>>>>>
>>>>>>> ---
>>>>>>> v7 -> v8:
>>>>>>>  1. Rebase code to resolve merge conflict.
>>>>>>
>>>>>> You mention this here but not in any of the patches. Which leaves
>>>>>> reviewers guessing where the re-base actually was: Re-bases, at
>>>>>> least sometimes, also need (re-)reviewing.
>>>>>>
>>>>>
>>>>> I just applied the v7 to the latest staging branch, this work has not
>>>>> Generated any new change for this series. I should have described it
>>>>> clear or not mentioned this in cover letter. Sorry for confusing you!
>>>>
>>>> But you talk about a merge conflict. And that's what I refer to when
>>>> saying "may need (re-)reviewing". The same happened during earlier
>>>> versions of the series, except there I was aware of what you needed
>>>> to re-base over because it was changes I had done (addressing
>>>> observations made while reviewing your changes). This time round I'm
>>>> simply not aware of what change(s) you needed to re-base over (which
>>>> is why I pointed out that it is generally helpful to indicate on a
>>>> per-patch basis when non-trivial re-basing was involved).
>>>>
>>>
>>> I had thought it was a code conflict before, because our internal gerrit
>>> system marked that this series has a merge conflict. But the actual
>>> situation is our gerrit setting policy problem. There are no code
>> conflicts
>>> in these patches themselves. We also did not modify the patch to resolve
>>> the gerrit conflicts. Regardless of whether it is a new or old version,
>>> if I modify the patch, I will remove the reviewed-by.
>>
>> I'd prefer if you didn't unilaterally. Instead I'd like to suggest that
>> you apply common sense as to whether mere re-basing might actually
>> invalidate previously supplied tags.
>>
> 
> I will keep this in mind in the future. Since for v8 there is actually no
> change (except patch 5 to fix the comment) compared to in the rebase
> compared to v7, should I invalidate your tags this time?

No (with me now understanding that the statement in the 0/6 changelog
simply was wrong).

Jan

