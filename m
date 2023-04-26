Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BFCE36EEEFA
	for <lists+xen-devel@lfdr.de>; Wed, 26 Apr 2023 09:12:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.526512.818317 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1prZKC-0002Bs-Cp; Wed, 26 Apr 2023 07:12:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 526512.818317; Wed, 26 Apr 2023 07:12:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1prZKC-000299-A2; Wed, 26 Apr 2023 07:12:24 +0000
Received: by outflank-mailman (input) for mailman id 526512;
 Wed, 26 Apr 2023 07:12:23 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=dTkW=AR=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1prZKB-000293-HB
 for xen-devel@lists.xenproject.org; Wed, 26 Apr 2023 07:12:23 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on20623.outbound.protection.outlook.com
 [2a01:111:f400:7e1a::623])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b03f10a5-e401-11ed-b224-6b7b168915f2;
 Wed, 26 Apr 2023 09:12:22 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by PA4PR04MB9661.eurprd04.prod.outlook.com (2603:10a6:102:273::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6319.33; Wed, 26 Apr
 2023 07:12:20 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::52b2:f58:e19:56ae]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::52b2:f58:e19:56ae%2]) with mapi id 15.20.6319.033; Wed, 26 Apr 2023
 07:12:20 +0000
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
X-Inumbo-ID: b03f10a5-e401-11ed-b224-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dDeCbMVupOIu9yGJzLKIYQqsWiN8TdenrQRnfrrdSI6A8QBAx2LMbDXiGQQgHUxzBqnzyYy3t8WmIYhCPnr9Ieqjzzrkw7r6qU2GGm7aX4/UWbtQa/JB4fwwjBkjlRZs+7aOwmPE2daOkvkCFeYT/rHRPJ0QtUCnqmQKrnC8tgCWynDJH0EoHg00QyIileA9K1zf0FjqftaHlZkOC0Cs3vClFfyEmksoviUSlU9E7gksDcjulS0ZfAnn/kwphWRJYsHRvgMKKFOTHEbMwUikAQBa4DBTPHATr1Z53Jc3Hguv2b/GsdaK5YKqrqEhJgpQ5wH4FAi3KjoKnlZrhGcfig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yMlC3koo35lzX30uCGzeg4nhB5M3NCgIdTaFQJUOAK0=;
 b=EyO69XKNFp0Y3B3dmlGTDP9Ghlo1mkyOdjKUz+92jGDy+IfLt6CwIemsqvYSHEwO0KOl9ylYPEA0W7kVQ86rCGY3tZv0wByAA8BxrFnYrhAKU7k9iYSCX0VTqJbkbjpB+5tU9y9c4KoTQKyTHltyR77NmrBbv+JymMnMHONON6qwYVt3152ZIsWHZlvsu12UoZSMljlr+ovm2vqQpShM2ghtWDFJ72hs+L3GH71raW4viHOaEvojA/Y3ezE72XJmkEfdN4iHZffgxtRjEDnY3GzOypsdv8A4tEHlT3PANVmopMeE1Ro6lTQ9TJHsZhqPStBnCD2ocd+fC2ybbPL/Gg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yMlC3koo35lzX30uCGzeg4nhB5M3NCgIdTaFQJUOAK0=;
 b=wMCWFKRhYohyWeU6I8sYinLWu3Qsa3KSH8gURYIDgIsaCQ/A1KxOpFg5hhSDcG35gJD5NY2PhC/QUWKBuo3WnVNJR9ue3sXEVShGfh+PCQwVeoYWpCPubQV9EqTsVMaLpWvfo7Eu5/23K+nECuPyHM40DJj/4tV7YZ8igXhYFFyYPghzyqTcyCFHZnFyVwb3bWdh0v8lMxqimI8CVC2kv2z/y5EfZ33vfo3uPvtp0GLt5zEpir/6CyGLS2Zadi+EcwSw57nIzTWiw9vXNIgi3qFHglz2R2CTyZF0E8oP1K5mkr40QecbM0/nsHBVOEeZcIADx5TeRB5yD+ZLGeKhsA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <c195ef53-1151-1fb2-0cf9-f6f47d20b75e@suse.com>
Date: Wed, 26 Apr 2023 09:12:18 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v4 09/17] xen/arm: introduce a helper to parse device tree
 NUMA distance map
Content-Language: en-US
To: Henry Wang <Henry.Wang@arm.com>
Cc: Wei Chen <Wei.Chen@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <Bertrand.Marquis@arm.com>
References: <20230425075655.4037980-1-Henry.Wang@arm.com>
 <20230425075655.4037980-10-Henry.Wang@arm.com>
 <e03bbb52-1a19-7d18-4abe-75bbef8a0aee@suse.com>
 <AS8PR08MB799117EDD6BAB892CAB870A192659@AS8PR08MB7991.eurprd08.prod.outlook.com>
 <13635377-e296-370d-121b-5b617dc210bc@suse.com>
 <AS8PR08MB7991DCE0DFC850FEA920BF8C92659@AS8PR08MB7991.eurprd08.prod.outlook.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <AS8PR08MB7991DCE0DFC850FEA920BF8C92659@AS8PR08MB7991.eurprd08.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0049.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:92::9) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|PA4PR04MB9661:EE_
X-MS-Office365-Filtering-Correlation-Id: d799c1ca-5b20-469c-2753-08db4625937f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	cF4Zq3yM1P2xuUTcDuBUytSpGDfVqb5Yx5Qe/ZIQXkYs5q0vIcKO3JWGIoOX6/IGjHnClLKAVrsUcyIjU/BK9fyTmdodB65WVqO91aZlzm9flEYhm/5UqlYhg3+n8wndgk/LngwirtA/l9QYA4ynZjU0cAm6/4AAStLBHEriRla3ZZ7c6ZWJe5OHSBehGJV2AXSfZUCkYLqwFRgGWrQ0EULWUSLzlYkym/3Mh0asYJ4EXyS2DgNB84y12yFJYGxwa7AqExCPudURTXLzK2B+6zkSBptAD9Nzy9nGyL8XeA1T7o9jbFpEJQyineC+DrrxzXTExLzk85VrQraDfyKWfLmdebZ174VjFjYpN4A3Qq6ngmLTBPTNoPIZV8Br3vpSVCfr0kM6hpz5NImqAosvZbiDF0OQsCkJ+Ph8aE+vBEju6Vkz4Crc4CC/0/iiw3HaXrTPAGLadTp3n2jEJux3yC843kyxsYt//C8l0RfRxtFnVL1J4/1Cq7alxihAzAzKTVBWCKhoQ5TK2rzivsdHAziSr8/lZgFC7bwVtTbB7ijI360uPC3j4glbrJ4eaabDNs6QyGi5Ne2Q2byXCOPFTJpjBI/SENk0IEQ8S1N3nA4KmrkGVqC58BZUn5/WSqvOMROiBUt7eV69jny5gYtiTg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(376002)(136003)(366004)(39860400002)(396003)(346002)(451199021)(478600001)(38100700002)(6486002)(26005)(6512007)(186003)(53546011)(54906003)(83380400001)(31686004)(6506007)(2616005)(5660300002)(8936002)(8676002)(41300700001)(2906002)(316002)(4326008)(66556008)(66476007)(6916009)(66946007)(31696002)(86362001)(36756003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?L21aSllrVkFUUURMbk9LTDJkZFlqcG1xOHdUamlEUkJmOEVuL2k0TmJaNjEz?=
 =?utf-8?B?aUtNS09xd3ZWK0NPUThOeGdrR1FUcUIrekREb3dseC9ZcHlMYmpGRDNvYStL?=
 =?utf-8?B?WVpvcHBPRVFLaDhHb3VxR2pCb0txWVI4RzdXWHozcVdWeFNXa05MUGxaeUpV?=
 =?utf-8?B?MytxRzNVZ2NJTmJ4akJ2a1ZhUWN0bHk1b1k3ZHZvaU1VOXV2a2xjeERkWGNu?=
 =?utf-8?B?R1NqbDhnVWs5QUJ1YS9xOW1VRGJMUkdBRTFLWEZaaGFHMlNCVWs2MFRLTXdO?=
 =?utf-8?B?Yjl5dUcvK2xCMFB4WFZNa2hPN2FtcEM0bmZzZGNyUEszbzE5MUgxc2FRMGxE?=
 =?utf-8?B?VUxRbEZ0OWgrY0k1dGNwRXArcGVhMW92NEVmdGQ3VlN4QlB3YWFJWGIyN0Yr?=
 =?utf-8?B?eWU0MCtNMUpJcS9mVkdUd3dPSExwcmlrUG5KNGFuQVd0UkdWeVBMdjloaXBp?=
 =?utf-8?B?MDNRMG1US2lQWUJlSllhMmZZQWF5VWhlbjlOZm9URFBtZC8wZENTb3V4bEJ1?=
 =?utf-8?B?aWFQWCtkZ1FGN3l2OGtPWERreXErd1lOVjVWQXNGYjVlWkVrVmFUbWwyZjUz?=
 =?utf-8?B?a3JpM2NZcmtFSFRadHMwd3d6ZlVyaGJFaVJDem1wMWFoSTY4YmVzZ0sxbUto?=
 =?utf-8?B?aG9ZZEw2OXhWSFJUSy9RTWZsSzJsbVorZmJMeWM1VFNabDhyUTlkRHlZemxI?=
 =?utf-8?B?RkZZSU5DSFlJMXRBMUpFZENKajVDcHZVYzd3US9tODAvN1dLcFNxQTUrWVVT?=
 =?utf-8?B?MnhvcklmbUNya1BtUVpZRy9CcTN5b3BlelRZbDJON2l2Z1drZW9EWmVEWDZr?=
 =?utf-8?B?WUJFSU1kNitSMkFoeHoxS01vNkMvVGxrbWFyVWM4SytkbFd1QlJFVFhGTUNQ?=
 =?utf-8?B?NEdWZG9QeFdKQ0w5bHc5cjFvcXYyRWI4ZllQRG1qM0F2RjZRUGNTcEhQQkMx?=
 =?utf-8?B?cUFFbGxhMDRTSnh3QVlTS1lyMW5XZ21MVkRYdW5CcW4zcHVRSHY3SHB2UU9K?=
 =?utf-8?B?cklnVFErZ3pFZFEva3R3YWtJT2dYdU5XZmJocEZSenpZT0Q2aTNiaVFUbllx?=
 =?utf-8?B?aVFKQWwzalZ3UEU5MGo0ajRQME55UnlENlhWYmNPdnNnVXdSVHgxeWxxYjJp?=
 =?utf-8?B?U05wTEhVYnM4QXZQR0JTRU1UVjhtb1NTVFJVbG91TGVYWlpBOE5CeUluOSsv?=
 =?utf-8?B?bFhJUk5iTGV0amZaMHhXRFB0ZzhXbzVLeW51ZmF0TW5STHUvSmZzMG1teVV5?=
 =?utf-8?B?WWRadk4yUTUraDk1ZS9ET0I5MVg4Q2dnVi9rb1l6MmUrTzh5RkxPdzd2Q3ov?=
 =?utf-8?B?T0x3STRLK0xaZXcwVzR0M0RDS0h5aFNpdTVtMno5Ui9mNk41c2lZbFZUQUhw?=
 =?utf-8?B?MmlpcGFVRGNIS3JkVWY0Tm9jQzFZRWw0SDVrN3JCSUo3MG5HUjk4SnUxS0JB?=
 =?utf-8?B?VEJwOGhrNkdaQlR6eGk2M2VQc0lsR1FEeUpiYzFsVEZzZlA4bG93aG9pOVdw?=
 =?utf-8?B?R1FCSTdEMm5BUjNid1VxZVNsdGQxV3hoQUV4YzcyWVpJbUJneUxlZzI4Mjd6?=
 =?utf-8?B?OVY0b2FzRlNocE1ncHJHdGlXeWJaT3BtNHc5STlubWtqN0hES1JMZnhUTlp0?=
 =?utf-8?B?L3QvdS9QdE1Dc1pidHJWS0pGRHlkbG10NnBWYmdDN1Juemp4QlBpMHBUUjZW?=
 =?utf-8?B?Tko2Y0Vac1lFSGhKM0E3NFp2T0E2OURxUVl5V2J4SHlYL09Vb1BjSHFSejZM?=
 =?utf-8?B?d21lRTJlYjJWRWR1SkV4NlpkdUY1cUtHR0hlZ2czemtxL2pMYmgva3I5bmlH?=
 =?utf-8?B?RCtFYlN6bGZDd3FqZU1ENlVhdDRUYytKQ2VtOXJHYXlXQXkrb2s0Q2FHbFNs?=
 =?utf-8?B?Y1R1SjYwSHprbzEyQUE5d3h2VDRXaERFUmFmeXpjMFRaZzhoT3VlNlZmb3Ni?=
 =?utf-8?B?YnRzcEtRRkpCaFExazk5ZzgwN001QXVrWGppdG9PQVQ2VjV0aUxaM1BGRkJJ?=
 =?utf-8?B?QTZNTnJTQkhCMG8xSFMwaHpZd0lHRnpuVWRsNHI3eEgzVDRBME4yTnREZ1BO?=
 =?utf-8?B?TFNkZDlCUGd6dnAvQnFwdG9qelpnTEM3YlB3QXBsdXdlUjNuWFVpaUd2eXBP?=
 =?utf-8?Q?7gEClZ7KHizVKiv7eJKRfDHw+?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d799c1ca-5b20-469c-2753-08db4625937f
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Apr 2023 07:12:20.6893
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6lgakOPIwxd3r9KNXprPR8dCchkUb7ZbivZS4/SNq5xJcsPK2hsQNmf4o7hTS8rNaAa/+Fl+qWaTkQi9wja6sw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB9661

On 26.04.2023 09:08, Henry Wang wrote:
> Hi Jan,
> 
>> -----Original Message-----
>> From: Jan Beulich <jbeulich@suse.com>
>> Subject: Re: [PATCH v4 09/17] xen/arm: introduce a helper to parse device
>> tree NUMA distance map
>>
>> On 26.04.2023 07:33, Henry Wang wrote:
>>>> -----Original Message-----
>>>> From: Jan Beulich <jbeulich@suse.com>
>>>>
>>>>> +        /* Get opposite way distance */
>>>>> +        opposite = __node_distance(to, from);
>>>>> +        /* The default value in node_distance_map is
>> NUMA_NO_DISTANCE
>>>> */
>>>>> +        if ( opposite == NUMA_NO_DISTANCE )
>>>>
>>>> And the matrix you're reading from can't hold NUMA_NO_DISTANCE
>> entries?
>>>> I ask because you don't check this above; you only check against
>>>> NUMA_LOCAL_DISTANCE.
>>>
>>> My understanding for the purpose of this part of code is to check if the
>> opposite
>>> way distance has already been set, so we need to compare the opposite
>> way
>>> distance with the default value NUMA_NO_DISTANCE here.
>>>
>>> Back to your question, I can see your point of the question. However I don't
>> think
>>> NUMA_NO_DISTANCE is a valid value to describe the node distance in the
>> device
>>> tree. This is because I hunted down the previous discussions and found [2]
>> about
>>> we should try to keep consistent between the value used in device tree and
>> ACPI
>>> tables. From the ACPI spec, 0xFF, i.e. NUMA_NO_DISTANCE means
>> unreachable.
>>> I think this is also the reason why NUMA_NO_DISTANCE can be used as the
>> default
>>> value of the distance map, otherwise we won't have any value to use.
>>
>> The [2] link you provided discusses NUMA_LOCAL_DISTANCE.
> 
> I inferred the discussion as "we should try to keep consistent between the value
> used in device tree and ACPI tables". Maybe my inference is wrong.
> 
>> Looking at
>> Linux'es Documentation/devicetree/numa.txt, there's no mention of an
>> upper bound on the distance values. It only says that on the diagonal
>> entries should be 10 (i.e. matching ACPI, without really saying so).
> 
> I agree that the NUMA device tree binding is a little bit vague. So I cannot
> say the case that you provided is not valid. I would like to ask Arm maintainers
> (putting them into To:) opinion on this as I think I am not the one to decide the
> expected behavior on Arm.
> 
> Bertrand/Julien/Stefano: Would you please kindly share your opinion on which
> value should be used as the default value of the node distance map? Do you
> think reusing the "unreachable" distance, i.e. 0xFF, as the default node distance
> is acceptable here? Thanks!

My suggestion would be to, rather than rejecting values >= 0xff, to saturate
at 0xfe, while keeping 0xff for NUMA_NO_DISTANCE (and overall keeping things
consistent with ACPI).

Jan

