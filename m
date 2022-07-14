Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FE5E574B30
	for <lists+xen-devel@lfdr.de>; Thu, 14 Jul 2022 12:52:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.367531.598587 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oBwRj-0000vN-Dc; Thu, 14 Jul 2022 10:51:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 367531.598587; Thu, 14 Jul 2022 10:51:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oBwRj-0000su-Af; Thu, 14 Jul 2022 10:51:51 +0000
Received: by outflank-mailman (input) for mailman id 367531;
 Thu, 14 Jul 2022 10:51:49 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=kqGS=XT=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1oBwRh-0000si-H3
 for xen-devel@lists.xenproject.org; Thu, 14 Jul 2022 10:51:49 +0000
Received: from EUR02-VE1-obe.outbound.protection.outlook.com
 (mail-eopbgr20077.outbound.protection.outlook.com [40.107.2.77])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f598a57c-0362-11ed-924f-1f966e50362f;
 Thu, 14 Jul 2022 12:51:48 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DU2PR04MB9145.eurprd04.prod.outlook.com (2603:10a6:10:2f4::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5417.21; Thu, 14 Jul
 2022 10:51:45 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::60ad:4d78:a28a:7df4]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::60ad:4d78:a28a:7df4%4]) with mapi id 15.20.5438.014; Thu, 14 Jul 2022
 10:51:45 +0000
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
X-Inumbo-ID: f598a57c-0362-11ed-924f-1f966e50362f
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ofAfOwJ4c+lZiEzxqE6twSO4sBiFI6K89z4JS3sAdWxB/e5yv3Yolz1fnvR3fCcbpbl6vxy4RgfQ/ZfkWLzmxFwRLtQnWdctMT6QIKcHUNlnrwwWtgLlytBj7Nl8Bu4PKaqkUq7QfiXgrFAco7kibfGF0PJA9yAyipcqwQLGTxI6ektMkM9tiklgjOwdt4obnaf72gSC76lKZh4Vcyz60FZLhGUPv4yKsh/h1OVEEhZT+Bc9H4ZicBRMq8Igem+m2TnOfhoOMv7MzLb1i648nyKkzrcvz8Tzpa+P8GiPSU+ZNF5f6Tr5O0j34wRPDD990cZwAZn5GQRcZ+fkpMq3DA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tfx2gLiDdbTQCZftkUnqkWcZ0L9UfsBF/czeE5UqdVw=;
 b=PyYcebXmpYaEyW+zhBiw8HcqIjHMQVwdAMUaReMS+QeeSNRPG8ld9qsXknTJy9wkzhQuF/STNV/2lM9/+WgPbXpFxg2GH0EcK0SC4mVvg/i7WQHV1T+6ExSYNJBS2SsnMhiXiBJ0e/+AgkQDN8J3h40ZspWvvzsXlYcUiBJLidsPvh7yc/qlXGr1rFiXCwUyBD+dUcN4+o1myTQYOqRgpp/BcUhrOvGbotF/52a/vW3GfnnnuSjfU6w6/SvedklLZm62o42MvOcwahsTHnGTHcHPSQhqJn6gigcmT9+ahAoDVTikHeOtXwA+uTSroha044OQP3kEC4ZuG6JQ9/ssnA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tfx2gLiDdbTQCZftkUnqkWcZ0L9UfsBF/czeE5UqdVw=;
 b=iMGBE5XOYWoQ4WmU/cwxWPcO0PYEaaU1G3BzHQrtGtREHlwyH92HfbrA4UPWYQl9p8gzVr0/DlJ7ZLfZrFUihkRhdRBB938rRe8dlDAwgA5LFe42sWR312eqm866V/Tpmp6VjOgwXUMPWXAYmvR0H+yD/Kuya3uW6m+Un7VfDaMrx493uynKK3KQC91BrPilunjmLwIRD07j6ys2D7hapk/o2CVHQXmtRFVHezEmhcyUvE8sDrrRc6e3dBjd4N6LMLnsHLAJ7lAR4L4iJaSCAPmgEXlJAUEEsJXG84GW+6+UG7VU8ZTpm5M6VajUye9hu0VLcoe4SynUtrNJhiZ09w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <41876fdf-862d-bb6a-7a34-0d1db9183716@suse.com>
Date: Thu, 14 Jul 2022 12:51:42 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v2 2/9] xen/x86: Use enumerations to indicate NUMA status
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: Wei Chen <Wei.Chen@arm.com>
Cc: nd <nd@arm.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, "xen-devel@lists.xenproject.org"
 <xen-devel@lists.xenproject.org>
References: <20220708145424.1848572-1-wei.chen@arm.com>
 <20220708145424.1848572-3-wei.chen@arm.com>
 <aff4a02b-6700-8b5e-5c2e-bf419a9e1b82@suse.com>
 <PAXPR08MB742028368F9F42899E876F759E889@PAXPR08MB7420.eurprd08.prod.outlook.com>
 <a0ffb1e5-1052-1f8c-355c-5a3acf7f9da8@suse.com>
 <PAXPR08MB7420F531ECCE4106BE8227D49E889@PAXPR08MB7420.eurprd08.prod.outlook.com>
 <f263956a-aa5b-e71a-ed96-c8f50ebe0d1b@suse.com>
 <PAXPR08MB7420ACF437B10A32BF09689E9E889@PAXPR08MB7420.eurprd08.prod.outlook.com>
 <66b4ce65-037c-a8cc-ce17-adfce7828a2f@suse.com>
In-Reply-To: <66b4ce65-037c-a8cc-ce17-adfce7828a2f@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0154.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a2::7) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 62739ffb-aed3-4b79-243a-08da6586d807
X-MS-TrafficTypeDiagnostic: DU2PR04MB9145:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	CX501OCnkrH9YkLZaW1evndzSZ1i4ebFiV0qeW2rvrWmefVNcyp4qwSmzx/NmRnC6zWum/lbKO5hxDrhRX4dvvSBFJ/7jFdhTvvw4xwMqbfqveucLrMSEHGIA/boKaUfw+I4ggX55BcHxAFqHlgeMI2mLbjI7rHvEsN0GWSHxTsSebhugnuX4XXobXNPVQiayZvqRfYOl/3qxAUy/Q8JaI0iN8sadd323dpPmXU2rYIOjioOWmeGwOs/4t9SwCQncfuqJTkmLprJGwi00KduZGKYh9aohDWAIHTxAayVq7WRrgOKM133TyXwQxUXgzksYv1RcXp1hVaqvVi/X6h82GO9y/QJ1KNcKHWokx8Yl4UyRSuXhP3p01aqpxcklF5KsZjbBdwH7JEjIUHyE2e2Thx2FkmZbaCXEk9PqKIkqJ2UG6TtwbbHydYb0nOG4epndGJxy/ma2mRXghZ3W+vfYL8pQCi49KqZ/mVOhHThPS5iwjgC6DkItY+WrWIys1l4bDZNCdlVeOs+HadM2eSE5v4kgXtrLxi/keSPz/YoiyQcmjtF4giTGcOHO1rImJfF1kxYZY3ByMSf4OHFy6341/DmKM/D07F7wFSVLiPAWEd7SVzb2nU3VGYuSLkmtb/I1sO7ttTcLLMqPiNQ9E34Ri5wlelI0NrE4rnmujcWUIxERpeoxLH4wWPkYNfjfvaqhpRxmnIdcgfZM07smFJhLiUISVJvfDQsdPuf6AZHPhvyGcNTsjsatI0nwaiP10ScDGO11+wB8ttlX6JbS1raQyH+26WsNj0YevULpcP88wwXZ7waecAc4zWxr3CBoI5OzkvcdpVrxVezJIMpjK0Q/l4QD0Ze3/QbkK1wK1W5BGo=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(346002)(39860400002)(376002)(366004)(396003)(136003)(31686004)(36756003)(8936002)(186003)(66476007)(316002)(86362001)(31696002)(4326008)(6486002)(6512007)(54906003)(8676002)(66946007)(6862004)(66556008)(26005)(478600001)(5660300002)(38100700002)(41300700001)(83380400001)(2906002)(53546011)(6666004)(2616005)(6506007)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?eGFhcFNSVjgxOVBGODRJaXhQVFJTU3pGRXV6eEdkZm90c1NOQ3JxMldvT0JC?=
 =?utf-8?B?YkF4WjVBVmdnVFhYdVF3ankwZGFIQjc4Q3FoeURzc3d5UXA5L25YVVBRaEl5?=
 =?utf-8?B?WmdGL20xd014L1VWVXRMSjY0Z2lJSmxHd1NSNDNESWphN3lKZTFQOFBsY3VR?=
 =?utf-8?B?ai8xZGVnQVNqU0MxLzJnOGtPMk4zY2NEbTNBaWJyRlorcitqMkZxQWN0L3p0?=
 =?utf-8?B?dFdCbWhjd1N3d2RESGFzT1E1djlHdFJRRGlQYnlUK0hsMmlJOUhvNFRxR0t6?=
 =?utf-8?B?SDdNa2pNU2hjY0VJa055WklwL016TXRKeHJZeEo1VHM5eSs4L2FsTmdtT2g5?=
 =?utf-8?B?WlZvSzhlVTRYK0dFRDcrU2x1dVZXQ2EwTVlMa0pSaHRpMHI4NEVQSjVIbGtJ?=
 =?utf-8?B?UUVTdXlQejRpcThFSXVVUVhEeTJUOW1GZTN4Y0dvUHZ6dzhJVExzSkg5ZjE3?=
 =?utf-8?B?QUtTRGdYek9wTisxN1BCV0JVYnFEWFBIMDVpblg1OVR5dVEzek1SSXh0OU45?=
 =?utf-8?B?UjNrcHV4NktMMFBkenhXSWFKWVBpN0ZtNjVTeUpmUmJGZ0xVV2RXbkE4VWNF?=
 =?utf-8?B?UmpUUUZwVWNhTXQ2UDRoNlFlb0ZKUzI2QmZOTzZCV1RYSFk1YjVscWVFTWlE?=
 =?utf-8?B?VHNybVgwSC9tMmNqbE9ueEYvWnZEMDhUeEY3eWo1MmVYYmdrZURQclZicWZU?=
 =?utf-8?B?RGJmalZZd1o1dWZWcENjL0dTZjRhS1NsSmxXQzFyb01qdVFrMVlQcGRFK0dM?=
 =?utf-8?B?L0drZStuWlh1ZmlyRFk1OHRzUG4wVEpMR3ZCdUYwN21JVGFJbFY0clJhMGNB?=
 =?utf-8?B?dyt4aGZqYlhaRlgvRzdUL1ZtWE9lQklnZXByNkUyLzRPUG13Uzk2M0hoLzd5?=
 =?utf-8?B?eFRtL3FqQmRUMnVCNkJRQXFCMUZmUm5SRmc4VGxJRGxJWG01a1FyaUZBVVJS?=
 =?utf-8?B?SkNpNUxpWTI0YmJla096cEs3MVdCRWZubmkvOGtocWZVZkZtMjlSbGtteGxU?=
 =?utf-8?B?S0RlbDZ2U1IwRkpPTU9sVE16bEJRRDVIWFVJMFVOZUE3blNiTEI1dkZoT29K?=
 =?utf-8?B?b0NMR0U3bzRzYlExQnphUWpQWCt0UUJGUlNRbVdBMW9odjA2M0syL0p4UXVw?=
 =?utf-8?B?RjJMTEhxNjhRRk1CM3FibG1jSlEyS1paZk9hbWlUQ3RHVWR3eWd6VVNrUCtT?=
 =?utf-8?B?NWVxam81Ny9ndFo5Q2tLMC9aMDhXVkZnZDNQdU00V0VmeXJBOUplRnZmc3Y0?=
 =?utf-8?B?NXFiNWFZUHIxUGdzQ091c1JraXR4WFdKT0twbGVyRUdmZ3dZaDFyYk03bUpB?=
 =?utf-8?B?Ylc3TWFuZmZRMWRBa1lzSmZjZ1RoYU8zZkEyeVJMc0prWldWa3RuNzMrblFN?=
 =?utf-8?B?WWpxZ3dpK0dGaGFkOUsxTnU2em9Ddjc1cEw2dzFjTVBNNzdDMExjbGY4UFFU?=
 =?utf-8?B?cXhuaDhlTGNMUHRPSEV1V2xCWHU0dmVtU1dvTUtWNFFyV0s0Slk0ZzYvYVh1?=
 =?utf-8?B?ZzZyQWh6dnRQS1NsdzdRWFRQV1dtK3ZVWGNtNXM3aWU1U0NUSUhRRWxtcHRo?=
 =?utf-8?B?U3FQRGU1Q3V4MGFzUzdpdnhVNlZsalJBRWRHVzhRTjZQYjZwVFBhM3RHcitD?=
 =?utf-8?B?NzJFUmNlTmdzZjJhRTJTUGNva0NqZTBvOW53elFOWk00UXRrNVNSUEt2RjdN?=
 =?utf-8?B?NkVZN1dCalVSajhnNk9ZamM0c2N1QitiTWdCaEJzSTZkYjNZYzUvVERpZG9Q?=
 =?utf-8?B?bzVWL1pSTjd0VUN4SEk5dmk1RTN0ZEFnZ0lBMFkxT2lzYWl6aWVTZzM1WG1M?=
 =?utf-8?B?aXdoU3ZadzFpLzU2M3RlNjVYcnVpZlNFMW41MWJTWW9VU1pnSkdXWUdUQTJ5?=
 =?utf-8?B?dHJWU09OU2JoWm40WU5NMFhBM2hzOHduNXBpdmJSdnhRYk5MamVpN0VoREhP?=
 =?utf-8?B?RHc4L2R5RkJMazRINTZ6SXZYN1I1b3pIckk0YkExTzZIVDhBSkY1bWFZeDVp?=
 =?utf-8?B?NVZWeGJVTHpubEZkY21QakZIdUhKblNjRm1zN003YWU4dm4vRFNlSFZUV0ZQ?=
 =?utf-8?B?a1VZNjdCZ3RnaXdiUTdMNVV5QjBwSG9iYWpzQ2JDWFVRUWJFR20yMTliWVdF?=
 =?utf-8?Q?Z+nYgV5z1WHgBrR4f0+HyqAlR?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 62739ffb-aed3-4b79-243a-08da6586d807
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jul 2022 10:51:45.1653
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Umm/OcyfOZ5O/49DmQ03zAKXQtsQdvkdlQEMyuneGEy4Y0Srs823L9PrM2EQOcR4MQKwApBHIZ8KZVGhI6c5/Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB9145

On 14.07.2022 12:37, Jan Beulich wrote:
> On 14.07.2022 12:26, Wei Chen wrote:
>>> From: Jan Beulich <jbeulich@suse.com>
>>> Sent: 2022年7月14日 17:58
>>> To: Wei Chen <Wei.Chen@arm.com>
>>>>
>>>> How about update the table like this:
>>>> +------------+----------+----------------+----------------+------------+
>>>> |  original  |          |                |                |            |
>>>> +------------+----------+----------------+----------------+------------+
>>>> | numa_off   | true     | true           | true           | true       |
>>>> | acpi_numa  | 0        | 1              | -1             | x          |
>>>> | numa_fake  | x        | x              | x              | fake_nodes |
>>>> | enum state | numa_off | numa_off       | numa_off       | numa_off   |
>>>> +------------+----------+----------------+----------------+------------+
>>>>
>>>> +------------+----------------+------------+-------------+------------+
>>>> |  original  |                |            |             |            |
>>>> +------------+----------------+------------+-------------+------------+
>>>> | numa_off   | false          | false      | false       | false      |
>>>> | acpi_numa  | 0              | 1          | -1          | x          |
>>>> | numa_fake  | x              | x          | x           | fake_nodes |
>>>> | enum state | numa_fw_nodata | numa_fw_ok | numa_fw_bad | numa_emu   |
>>>> +------------+----------------+------------+-------------+------------+
>>>
>>> Well, this makes the table complete, but it doesn't explain how you mean
>>> to fold the settings of the two command line options into one variable.
>>>
>>
>> No matter how many separate "numa=" parameters have been parsed from
>> Command line, the values of these original variables are determined
>> after parsing the command line. So the determined status can be mapped
>> to the new one variable from above table.
> 
> Hmm, I was partly wrong - the initial values of both variables are
> indeed set from just the single "numa=" parsing. But later on they
> "evolve" independently, and multiple "numa=" on the command line
> can also have "interesting" effects. I'm afraid I still can't
> convince myself that the new mapping fully represents all originally
> possible combinations (nor can I convince myself that in the existing
> code everything is working as intended).

Maybe the solution is to make numa_off common but keep acpi_numa
arch-specific? Then e.g. the replacement of srat_disabled() could
be

int numa_disabled(void)
{
    return numa_off || arch_numa_disabled();
}

with arch_numa_disabled() evaluating acpi_numa on x86.

Jan

