Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 004295749DB
	for <lists+xen-devel@lfdr.de>; Thu, 14 Jul 2022 11:58:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.367204.598271 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oBvbc-0003H4-1C; Thu, 14 Jul 2022 09:58:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 367204.598271; Thu, 14 Jul 2022 09:58:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oBvbb-0003Ek-Tv; Thu, 14 Jul 2022 09:57:59 +0000
Received: by outflank-mailman (input) for mailman id 367204;
 Thu, 14 Jul 2022 09:57:58 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=kqGS=XT=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1oBvba-0003Ea-1X
 for xen-devel@lists.xenproject.org; Thu, 14 Jul 2022 09:57:58 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-eopbgr60055.outbound.protection.outlook.com [40.107.6.55])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6fb0dbee-035b-11ed-924f-1f966e50362f;
 Thu, 14 Jul 2022 11:57:57 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM4PR0401MB2257.eurprd04.prod.outlook.com (2603:10a6:200:51::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5438.14; Thu, 14 Jul
 2022 09:57:55 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::60ad:4d78:a28a:7df4]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::60ad:4d78:a28a:7df4%4]) with mapi id 15.20.5438.014; Thu, 14 Jul 2022
 09:57:55 +0000
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
X-Inumbo-ID: 6fb0dbee-035b-11ed-924f-1f966e50362f
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=H+/MJ/uri/zZnnvASeWLcdbiSfRzcpOSNVlJAMlnoyvYUB0/Wq/egAmA4GM16pXqtwQo/4bdor8y1mrXdO9w58xPMSxp28b0dcNg9+X9FMDKSZKTJxfhoQLka8WqlLCOBQcTfVVPP/ng8E1UDMgcNaVV+gwErJBn0W1FukEE5qPZuVI1MERW9i1kjoRZvFqdt4LN9jbzl/chQOAlurUS8pKWLrGTiSPb4ScsQ/xgOWlAo19iy6sJsA2mjEkYNMtWl1Kw2Y0CVY6hcHX7NataTzeVxeGsQDBaHboe+pUY3IA2mvYH1Q0KucDFhYMhl5DmmdAsFMC5OUWF7XAyLEHP9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lLzcafsrwjrqsew2vwdKnFBz6cWZ1azva8NG24mJ74E=;
 b=Qvi5f2YY7qwB0Yaa0YShCee3BcZ/ivpvq3RRpLRlIhTn6JaDpWddd28Z3/Vkyt32DRw8uo/qZ3q1iwlqbogkJQhBcMBpNCZhh1MQ4YKAJFqu+eNuzOPwNq8oonvFrFTg3jwc+pwNcoB0hQY8yRuhvXE9ZYRb5PItOjgE3JtK0UQR/oxR8l/9OXefYM6oaegc6z0EvpN1obIXlcNGLo24zRuj5lW9Vq6Ww1qxDTGiQZEEO+EujW02i9cn3+6kVu8uaIaYeKzekcKV7YBs/Dbfae1KRbvB26VIrOOdjEz9szOT0VXOdluRl0kFTawlRhFfRa6voCqF4/TvNBjTDzJrPg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lLzcafsrwjrqsew2vwdKnFBz6cWZ1azva8NG24mJ74E=;
 b=RGIxBAW5FmC/xvUDOvMGd6ee1Tag/UfYEyeQ6lZ7dfBdrT9AHtJ+iudAxUVChEaOcmVGtsUXGMdfyoqQwioonOHxhvMTSxWb9s4G9hLY5e3qw1V1LC4wUtSa6FBruoMl0MTiIyTb8jsLtXUk9MRp6UG6RyLGjFztLWWB5JcZ4KBlarWlGgJrHh1fbkyerfuTVFmFVwSat5/2mq9hf/dwG8nrswMy8FDret/bVNv+vVBhmdzJXcu1WPrEcbltymPGLhAIqP/MuNm93fueVlVfmy1Yz9syuEQ2qLPciCi5ztLlhbKuRkLQfi2RUffEi0Iat4gWEKNhX6aeeP9lnaq12Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <f263956a-aa5b-e71a-ed96-c8f50ebe0d1b@suse.com>
Date: Thu, 14 Jul 2022 11:57:53 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v2 2/9] xen/x86: Use enumerations to indicate NUMA status
Content-Language: en-US
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
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <PAXPR08MB7420F531ECCE4106BE8227D49E889@PAXPR08MB7420.eurprd08.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0073.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1e::13) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: dd184eb9-56f6-4aa3-5b60-08da657f52e1
X-MS-TrafficTypeDiagnostic: AM4PR0401MB2257:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	4MHHLWOzgvmOUrjyb6zYwPoNJLoFxjkIB2ZpqvEMu5Ea9fiD1bcTCLeeM5e4d6yeefK8AzdTl1vBR67uEevPVmggMBb8Lb7a8PU33dmzmQ9VrY1qird3ZF0RCKc1IOdsESle+yf4JkJ9vj6u23zYPjacfdb3vP4l2TrTqerZ+iLs/71smz+du4XBqwcA9yaPIgdvlNT4Z8SWs2guUZ9OhEZLpmI470n6hHaOzv/U2dM+9gEK4yLQmWIJqEuL1hWEkMe9Ffgv9fmPNb8dfShYMLQK5JQxlqCD4y1uHkZ41v6qMZAuXQLHpWEybxW12V02xN+puP5qtHbS94jsO3EKO6COqrIq+2BdQ0Y6YD7DTLzElkd9RiUC2kGzrUrQCoTXzNEJuwkuyPLrd7D1DZXL3NMxL1hb3cPhfMNwooqiegy6pmAYIIKc/zofnQIFe3hPDWpnsBWMjazCJn7vndOXyUjjDpFbysIF9gHwF3iwEDahpuD7eVo9qCpuKq9YVHhGiksiOSoAGnCwNTtl1/6yMmfJOovZmvMIQLXgctdZnH0pKR8f3gdcoD3Qqqqm8hPBP85BfyB5ZLohsTHtm2j0w087KreQcOyEQigGvGyv4SFZWUbU8/an/PlM7OVoIs0GJjouqdrt/HFOXhieNd9yZBgVKOiDZBVF01geZyW7h6Di3S6yXKnledZtrISawu1EAkXyy4sq++3zcWkiUbiEutFJcoy403vXDyLc3vH7La59WToePLvhIk6RkADMQ+0EMQvEGS0TlWzjRJOyta2b7dPDMpwHfuhvGZNUeSG5SuAYZ39aaoDiXdJyaejOMRNH+J3qjlCsS63H0TvGyaouHYKb9hOe6Ce2ZIPp3/t3i48=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(366004)(396003)(39860400002)(136003)(376002)(346002)(66946007)(53546011)(86362001)(6862004)(66556008)(8676002)(4326008)(5660300002)(66476007)(31696002)(6506007)(41300700001)(478600001)(6486002)(8936002)(83380400001)(2906002)(186003)(38100700002)(36756003)(316002)(54906003)(2616005)(6512007)(31686004)(26005)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TWwrTTJEWklyenppT1lvN1pkR2k5WFpzL2YvaWg4dWU3bXdvMFRQeWg0WklJ?=
 =?utf-8?B?SkNUQ2dRK0xXQTQrc21WNGJ1YlQ3R2xIekZRMDJsM2hJRTcrTTM2NmhHTFR3?=
 =?utf-8?B?RnI4cFJuMjZIUGhtVHpRRWJWRzhPaC9OZjdzRHF1eHhqdTkzeks4dlhyeXps?=
 =?utf-8?B?Ulo0eklpSWM4b2VoV1FvUTdURldEWXd6TUVYeFRyUlFvcGQyMWc0aVdVOGJG?=
 =?utf-8?B?UDJCZXdTeG5pNWp1S0J5SG0vVFR2MndXdVpHQWFQNDZHN2JIRTl4SWpPT1Bj?=
 =?utf-8?B?K2hKdzNoVUZDZDExNm9LVmZSUkxTeGM3SFF2c09TSDYyQXlSYXUzTXVZU0J6?=
 =?utf-8?B?am5PZ1FIeFpDRUo1R1d0Nk1mRVpScHdlVHlzSHc1b2xMc09PREU0dGIzQ3dv?=
 =?utf-8?B?eDhhUENURjJjZWY5a2Y0UXJyRldoUGFRWkdJVFB1ek9VWFUxZkhCSDI3Q29Y?=
 =?utf-8?B?OVFNcDlXVFd2eUpqaU1vM1lXMTV3aWZUb2ZMZHFiQ3RZS1NlbXFqcDR0WE53?=
 =?utf-8?B?Z3AzQnVVOHQ1clNIc21NeTA4MlVjQndTQ1dNVGtMckVGRUkyUzFhUW04UFA3?=
 =?utf-8?B?Sk9hRU5qY2xta09WSnhmL05hRnpZbm90dVJRUjJOU1dGcElSb0xFQU9HRXhQ?=
 =?utf-8?B?MC9PNVg5UlZBK0tPWnZncXJCT291V29vWnBnSHVCUU1kcmlWdlZCY0xCcndu?=
 =?utf-8?B?ZmZtd1AwZ21XY1IrQTBFVFRORE5RVStLem44VytiOCtrQ3g0Vld4cm9ScEFx?=
 =?utf-8?B?STUyRXNvaTg0cklTeEtFSTN1Mi84VHhWK0lCeVJFcHQ1S1VyV3FYVHRSb3Ax?=
 =?utf-8?B?V0g1WUVCeGQ5WFVVSXJCU0poWEZCdzR3MzhqbWFWcnV6cjBTL2RaN01Ka1lE?=
 =?utf-8?B?eE9uQWJZaUM0Z2FNb2pRNHhZOFRPSVFTb3dTS2d2QTVvaGlXNWdLSXJ3SW9z?=
 =?utf-8?B?VXVOcEZxZEJGZktpbTFheXZ2aFdpdHo0L1R3OVZTcHZTOVJtdVREUGRNaVhC?=
 =?utf-8?B?WmlJOEliek1saE1xdUQ0ajdoR0orUDBJaWpqUXZWWlFLYytmMmxVWm1EQ2g2?=
 =?utf-8?B?WGdqbm1pL01qR2FSUDhWbHNzYVJVNnRzV1dXYTVVcW5rdkU5WTlYL1AwR2Rz?=
 =?utf-8?B?NVBSSE55NEk1SUVsUFJTK25kemNwa2FFZlZuaEZxUUs3Q0dicTY3U0U5WmNN?=
 =?utf-8?B?MkJwS1pWaTdPLzNmZkRkNFgzNStEUjh3UWVuM3NPbmVtL1BZVVp1Tmt3R0Zp?=
 =?utf-8?B?MDNSYTFjbHVuSWpmRFNtYlFmT2FMeVN6U0g3cHk2QlJyR0o3RUhuUDNjNUFZ?=
 =?utf-8?B?SWJYTytnYldpZGRTZXBRWXdZK2svN0p3d01jK2hyUVJFVDNYTzdLc0loem94?=
 =?utf-8?B?UEE3azBPVWRoYkhIbHB3YmZ5bEg1SjhXdDJzc0psT2hVMnVnUXMyM2V4QmxN?=
 =?utf-8?B?NGQ0Y3RBYlQyWUxvSlhNYkpuN1Z3V2F4WFROOW5Pb3NmWnQ1VisxQXo4d0J1?=
 =?utf-8?B?RmUvbURZNlQyU1dSK1NjOU13eGhjZmoxUGxjN3Z0ZVlaVkpLVHMzNjI2ZGg2?=
 =?utf-8?B?RWZLMW0rcklhZFk4andGR293Q3U5M29CQ21la09jamUxUWtvcEcyMyttS0tv?=
 =?utf-8?B?UE9nNjhGTjhQMTRmeFplWURRRG56c2ZyREJRdkd3bVJFTkZjaUEycVlXNFlE?=
 =?utf-8?B?Ynd0OGdsOE9tcGZtbndoKzZCMi81Zm1KN1R1REo4RnZOYmRVUHpRZTN1MDZn?=
 =?utf-8?B?STlnWWtYTk9oalJJVURXY2VaWkNJZGlHdHpkb0QwbTNhRjRKK1R5bC9aMkpz?=
 =?utf-8?B?RzBNR0ZwRURmNGRsTGc3TUlYcUFIK2oyeW82WldMemo0NmNXd0JzUjV2eUgz?=
 =?utf-8?B?ZEdmZXNTcit3ek54cml1MWlXK25PTEROVXR3SDhEYzcxNW03cERUWVQwSytr?=
 =?utf-8?B?UHp6OWptWnVyNEE2RnBSR3pnbXRPb2daK1lEVjFFOUtqQ0JCL2ZRaGZ5Y3px?=
 =?utf-8?B?UzhCTVhodlpYNlVJYmU4ckExSGRrTExvdkNidGFTWTlTWE1BUUtJSjJQbWs0?=
 =?utf-8?B?K2VCbmtzVlpkRTNrQ0p6Ui9qamoxTzFEa3IvRGVFUW9PWEtKOXdpZWlPSVAv?=
 =?utf-8?Q?zCYdzRWWC4vRXWjnQwCUEcg3C?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dd184eb9-56f6-4aa3-5b60-08da657f52e1
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jul 2022 09:57:55.3192
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qElgW9t80JFSCizqwTJFjEfheR0rY1lEx4ZgLIHqa/HXzKRGBToMeLOC4Lk4Za0NSCzfPiLta9O4G8U5RXCxdw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM4PR0401MB2257

On 14.07.2022 11:55, Wei Chen wrote:
> Hi Jan,
> 
>> -----Original Message-----
>>>>
>>>
>>> Sorry for replying later, I paid sometime to check the code again,
>>> and drew a table like below, I ignore two columns when numa_off=true
>>> and acpi_numa=1/-1. Because when numa_off = true, ACPI srat table
>>> will not be parsed:
>>
>> While I agree with this fact, the problem is that there are two
>> independent command line options driving the then single variable.
>> IOW numa_off and acpi_numa both turned on may still need a
>> representation. In fact I'm not convinced we can eliminate the
>> original variables. What we ought to be able to do is consolidate
>> their values into the one single new variable you add, before
>> ever evaluating anything. _Then_ I think I agree with the table.
>>
>> Jan
>>
>>> +-----------+---------+---------------+-----------+------------+--------
>> --+
>>> | original  |  col1   |  col2         |  col3     |  col4      |  col5
>> |
>>> +-----------+---------+---------------+-----------+------------+--------
>> --+
>>> |numa_off   |true     |false          |false      |false       |false
>> |
>>> |acpi_numa  |0        |0              |1          |-1          |x
>> |
>>> |numa_fake  |x        |x              |x          |x
>> |fake_nodes|
>>> |enum state |numa_off |numa_fw_nodata |numa_fw_ok |numa_fw_bad |numa_emu
>> |
>>> +-----------+---------+---------------+-----------+------------+--------
>> --+
>>>
> 
> How about update the table like this:
> +------------+----------+----------------+----------------+------------+
> |  original  |          |                |                |            |
> +------------+----------+----------------+----------------+------------+
> | numa_off   | true     | true           | true           | true       |
> | acpi_numa  | 0        | 1              | -1             | x          |
> | numa_fake  | x        | x              | x              | fake_nodes |
> | enum state | numa_off | numa_off       | numa_off       | numa_off   |
> +------------+----------+----------------+----------------+------------+
> 
> +------------+----------------+------------+-------------+------------+
> |  original  |                |            |             |            |
> +------------+----------------+------------+-------------+------------+
> | numa_off   | false          | false      | false       | false      |
> | acpi_numa  | 0              | 1          | -1          | x          |
> | numa_fake  | x              | x          | x           | fake_nodes |
> | enum state | numa_fw_nodata | numa_fw_ok | numa_fw_bad | numa_emu   |
> +------------+----------------+------------+-------------+------------+

Well, this makes the table complete, but it doesn't explain how you mean
to fold the settings of the two command line options into one variable.

Jan

