Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 85ACD574921
	for <lists+xen-devel@lfdr.de>; Thu, 14 Jul 2022 11:33:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.367146.598209 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oBvDU-0005oA-U5; Thu, 14 Jul 2022 09:33:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 367146.598209; Thu, 14 Jul 2022 09:33:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oBvDU-0005lf-QB; Thu, 14 Jul 2022 09:33:04 +0000
Received: by outflank-mailman (input) for mailman id 367146;
 Thu, 14 Jul 2022 09:33:03 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=kqGS=XT=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1oBvDT-0005lZ-H2
 for xen-devel@lists.xenproject.org; Thu, 14 Jul 2022 09:33:03 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2061.outbound.protection.outlook.com [40.107.20.61])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f4913cb9-0357-11ed-924f-1f966e50362f;
 Thu, 14 Jul 2022 11:33:02 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by PA4PR04MB7998.eurprd04.prod.outlook.com (2603:10a6:102:c5::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5438.14; Thu, 14 Jul
 2022 09:33:00 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::60ad:4d78:a28a:7df4]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::60ad:4d78:a28a:7df4%4]) with mapi id 15.20.5438.014; Thu, 14 Jul 2022
 09:33:00 +0000
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
X-Inumbo-ID: f4913cb9-0357-11ed-924f-1f966e50362f
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TJt4BkVggjUpXAIezAAB9JtzZwX0uH+pqfbRo01I6oZJMXHaHtw2GMaWf+kATY4WlZsvuqJ1JSxAbfIMHwm10mykRFV8WJObweT/uN7EpuAqo02XcKu8pV2grKzXbTqRzxqWIEUFrtE31wHU9ddXIFxVbnD2CP6w9iK8HhiYLjx8t07mFRG+Jw8SUfxJ0KdNp8kp3CsakpP429BeQcufrOe0G4WE601Da00nJ5E+KftCsw85TZRoD47Ozr/L45oMX3uLZny+JPvvKqCGKpllIySCzNWf9A2BNK3U1/56JaqZ+/0GNGANtv8dX8YrsNTHRxhN5YE+VwbdKUnoV9DtNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=94XitmqY8VfE62voQ/Qdjh+YoxzpIhHUJZ900TeyxGQ=;
 b=O45jHPFGvPoPCOP3re+rHRMu+DA0CLzMPNnlKeYR5hDiPXOJ31fhlFnUTlWp/jRHpwKqQD2+fRguAgxbKdAuS1263YQlg9GAJtWUlfJ1FFTxTkmJiKFluooL/3wjhPFk9E82hC1G+F24tQpq5hXgnFsIfUPWQIJrdhDUl3X6BisoT/hoqUoBNMfeQgdxqV6QxFjmUKStb3WPbJqWsFxDDFpHOVq74114z5LD1vI4BjWzXD+gV/MS2C7uqJWnESYcFwsfjZ6joNAtyB6wmIs/HY8O07/esriDRwhj+fqLQwer94xGpqlP5JOfNeLHpt0s/FeEZQ3VIYX4UhMOF/KA0Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=94XitmqY8VfE62voQ/Qdjh+YoxzpIhHUJZ900TeyxGQ=;
 b=Cq7yOw6TJ5qx65Zh4UopkiML10h4fIwvBXGQwES9rWV2hDQHs3SCHsvIoY3FLColR7Pt80sRiu/iWLazRNj1ZoadBvPIKc1Dh6rJBVyWZ5LPFfRWJmSogZbshjm9xxylpe3hloeiWtt7GiNRa8r4s+xal3FnP6o42WMgUgG+eUuOKbsO/W3lvFdzaB1Y0x6ud59IKNc1yBqYfP9a95dnkaxXdWcuIParuoujrgvJG+1r8xcrqSNJ/i6VSEoNDEMk2suOARF/8Oh0KSIdhDispx+o3R2Sxu6kgFHyFlByZyqhDy9L5ftY5WSs6N3Z0Pbicxxk11L6gdcuKDHL8MVuWQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <a0ffb1e5-1052-1f8c-355c-5a3acf7f9da8@suse.com>
Date: Thu, 14 Jul 2022 11:32:58 +0200
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
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <PAXPR08MB742028368F9F42899E876F759E889@PAXPR08MB7420.eurprd08.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AM7PR04CA0025.eurprd04.prod.outlook.com
 (2603:10a6:20b:110::35) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: fc5ca24c-0fd9-44ca-08a1-08da657bd7e7
X-MS-TrafficTypeDiagnostic: PA4PR04MB7998:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	/fNvKBl3gfbBKGZD4qzywWYNA/TeIsDyxPPuZvGjrvS1jfuiKrNSFa6oxnXSYFVnnJYIArvDYgLkvghdHUlKA5Pm/Ume3N2aWAATvUYNJK83mbd5I9sG09ocdaxzsi1ENYpFm+7Kw8NovMgc/ZIVJkkrZ6kmmtLUWHujCxzJA+3YuOQJ0/ez37D2rHbLFqbHLSj07sAfcixNjEpUCXLWWPiTjzZVYXtU4XqSWhQNVOoWEP/LR1PcbkDYdmFcbcLnHi2+MZ+oaIGDKSDgXaW0pCHJGbFocpsxhDfutWTzmD9mjkKhJx5xp2MPOYty/F46ypLRp04jMYyAh2RaFWu2Ey80LEb2/jMwhB6oDobODv4gPnshMoPdGcUCMwa+U2v3lHogTNyjWTEs/YUOJjyFDAmJop2+sWxbvUm2bv+U3QEVadqHZV36rKFB1SGeJaSCM725lxPKc85GOiafl7dZo5wUlWI90S/oNlL7HdcJGDPWy5xZalyCcw/3++F23BFmJkE/ODaTmHifiKwZ881Zr2OtcQtOnJKh2ErtzZWDraBRx9GoK+vneIUUrnniTcWYm4Jh6yMb1Pr0eDGvTR2ADt2S+oBWJlYqhgnpavr2/HFVVTB4jFrUSkk87W/9sYdwUOIA8WRb6s+4mZC8Tr9U9ihhInaHJNJIbTYKJS8xSjk3wqG9VBjSOG8qi77npLhWAYFaiaHB4TlLMrObrJV3GU8XFk1gyw8aGFDz3lUFei6dLuqplo6GNH1ewaCh8a/8bfB+yoFb9pzk+eaKHD1YS5hMcAinY176HqOeDNrYVdMtfr8ZZeGX7PLSO4w43QLb+Li6zuTDQu81XlMhL/oZ9QwqoHHGMe8c4tfwurFV14g=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(39860400002)(376002)(396003)(366004)(346002)(136003)(36756003)(6512007)(2906002)(31686004)(41300700001)(26005)(2616005)(4326008)(8676002)(38100700002)(53546011)(66556008)(66946007)(66476007)(54906003)(186003)(8936002)(6862004)(5660300002)(6506007)(86362001)(316002)(31696002)(478600001)(6486002)(83380400001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?N0d0RnoyZlhrMHVGS245ZnNSQlc4L3MySUxYak92S1B1V3NIbExuOHNOdnpH?=
 =?utf-8?B?cmtacmFlM3JZeWdGRGZldThvWkMrUGRPQ1NlM0FyTDVoMC9IT1RpNnVLaVEv?=
 =?utf-8?B?alkzNXprWWY1T2I1VHlSMUloWUVublo2S09nSEhiRWg1WHREL0dOcmo5Tzlh?=
 =?utf-8?B?NU5aUzEzdjFSaGo3dEZTU0RKWmcxeUN5TTFrbDFXQXJhMHl4cVpnR3BwN0dS?=
 =?utf-8?B?eStXOFdiWW5pNWNvbFd3ZDZqcjkrOHhIYmJKcStCekZGaXpBYnRDQ1MxUWNr?=
 =?utf-8?B?ZnpVcmVsZkZ0RnZFYmIrdjVCbTh6TlQ5Vmh5TzdGVnNDVElmWUJTaVgrQkQ5?=
 =?utf-8?B?cWRPQWVibHRuTU5JT1lEQlVaell1QVJGWGV2R1lqa1hMNndhMzlSVm1Od1VF?=
 =?utf-8?B?T2dtZElEeUZQZzRsWklXU05BWE1DR1BBVVdYcnoxUWd1WUxxZmJTYytmZmcz?=
 =?utf-8?B?V1g5ZURqQmxBc29zeHltK0xFTTBJOVlmUXR2bW1ZdlEvcTdWbWRaM2ZYaVh3?=
 =?utf-8?B?eTVPR1Y3VWo2Z3FycHU4SGIrTlNIZ2lGanZEWmhjdkFMVlluM3pIZVRTdGpJ?=
 =?utf-8?B?cDFsdlpFdGd6b2xWUlpkNE1ZZFNUOS9JdUsyQjBncXZxdy9PV29hZnp2NzdD?=
 =?utf-8?B?SUFzcTVwQm5wZjNmUWVsVnVhVlJ4ZlZGV3BPV1k0THprR3hNeUJmZXg2Zmtx?=
 =?utf-8?B?ek5zWFBJVEpFc1VZeTBvY1Bpd2s5MGhlbWhJcG85NEVnQVFTZHdhS1VobW5k?=
 =?utf-8?B?dU45bmVvQXkwME15cjJTRmtQcE10U1RuSnArZnVmVHIvdU9GL0haZ056SkJn?=
 =?utf-8?B?Mnk4cjNqM0I5dEoxUjQ5cU9TQ3hDS014cTNORXFJMUIyZmFCWjdyTWh0Y2Er?=
 =?utf-8?B?ZkFnQWpycEhNUWVlcXpIRGFTZDhQWUx6clRkTkxERGZKN214ZTg3eXlRT25n?=
 =?utf-8?B?b3lPSGRMMHZqbzBEZXNEbGdiS21rL2pCZXBjYlNWblQvc2poOFVFd2RVMHBx?=
 =?utf-8?B?allZeW50MU1pYkIrNG9TV0ZKTzdrM1Vyb1BYWi9uTW4wOHhVQzVjWFladkJt?=
 =?utf-8?B?SVQ3VDhLaGREdTBycTc4VktZa1NRNmNVNXVCUHJCQS9IWVp6NmFNVmRYOUtp?=
 =?utf-8?B?eDR2eWRaV2poajFEZWZUR0NDRCtrc3UyRWp0S3NkeHlDVkRKcG56VldKSW5y?=
 =?utf-8?B?S29yRmo5U081bk1FSmp3b3NIZ0lDZi96c1NUeFFQZFA3RHZ2Zm1KUEI0TnBu?=
 =?utf-8?B?djdTVFQyTkFNRGpaRFgveWd5a2txSmVzTVQrNTJWdTdDZUhrTmpJL2d2SFpq?=
 =?utf-8?B?aVAxOVJWUi9HdUpQKytUZjJ5Qm9NU1JuNE9XQktDWGlQckMxU1Zjd3VSV2R2?=
 =?utf-8?B?bGpkK3dpOEE2SUhJT1VIWk5oMTdCLzk2TlVkMSs3UzRLUzduU3U5WnAwaFp6?=
 =?utf-8?B?M0NHeW5rekFDYm5JYTFDM2tUTUxHcy9PL0k2VTdPZzEwVlFITzZ5ZGp5dC8v?=
 =?utf-8?B?anhXYkdNdm5GdTdHby8zQlhIN1VtMTNBaU5BbmpYYUNiNnVKQVdEWFB4Unoy?=
 =?utf-8?B?eWNwU0o5L045dFhqY2pKNUNLU2ZvemQvQ2F0VmYxZERlOEJQOGZBbHJDYnVp?=
 =?utf-8?B?ZStSc3puOXVKcDJYblY3cUdWSEtyTkJDUGtFYlN3dFQ2U200R1FVVkgxOGVV?=
 =?utf-8?B?SFpMbCtBSno2ZjlsWlZPN0hGZ3pTYWdBMTEwRWJhZ2lycDYxK212MkgyK0pR?=
 =?utf-8?B?RG1yZGhROUZGZnU4WTQyc2ZQdzBlR21PYlVtY3pkL011S01qVHZJTlA1TG85?=
 =?utf-8?B?dVF0cmN6SDhzdU1mT3BaY1hRREtaZWNRM1ovZmdYbktBQUJqOTZFSFNHSG1I?=
 =?utf-8?B?ZTBOaXlQcnlQbzk5YU5vQ1AveFBhT2tDQXdQUWIwanRRcjBnRW42dlJLYTJQ?=
 =?utf-8?B?T0Z1QUR6Wis3TmZWQUdTZXhrcWtrc2dDWmIxK1U5eE0wUW5mVlQ4aTJ1UlNi?=
 =?utf-8?B?K3RmbzJOZXhQZVoyTzRDMXdGb0VsT0hLSDVtY1g5RDNHSDU4RVd0Rnp6L3BO?=
 =?utf-8?B?dXBVbXY0NHZqTmpUZnA1NlM2MzJyTkU2UE91MmVqVG5QRTVRdDR5amorTEt1?=
 =?utf-8?Q?KUpvzrSoBZ0MJS7ovJbNyroOe?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fc5ca24c-0fd9-44ca-08a1-08da657bd7e7
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jul 2022 09:33:00.5534
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iz0HxGW1eEi+XmRA6M3975PvM652LgYco5w5EzelkM0qygUePMgIBmPNUz05rMS+R5QUwOFbI1poMgP6kHJEwA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB7998

On 14.07.2022 11:03, Wei Chen wrote:
> Hi Jan,
> 
>> -----Original Message-----
>> From: Jan Beulich <jbeulich@suse.com>
>> Sent: 2022年7月12日 20:49
>> To: Wei Chen <Wei.Chen@arm.com>
>> Cc: nd <nd@arm.com>; Andrew Cooper <andrew.cooper3@citrix.com>; Roger Pau
>> Monné <roger.pau@citrix.com>; Wei Liu <wl@xen.org>; xen-
>> devel@lists.xenproject.org
>> Subject: Re: [PATCH v2 2/9] xen/x86: Use enumerations to indicate NUMA
>> status
>>
>> On 08.07.2022 16:54, Wei Chen wrote:
>>> In current code, x86 is using two variables, numa_off and acpi_numa,
>>> to indicate the NUMA status. This is because NUMA is not coupled with
>>> ACPI, and ACPI still can work without NUMA on x86. With these two
>>> variables' combinations, x86 can have several NUMA status:
>>> NUMA swith on,
>>> NUMA swith off,
>>> NUMA swith on with NUMA emulation,
>>> NUMA swith on with no-ACPI,
>>> NUMA swith on with ACPI.
>>
>> Hmm, with both this and the actual change I'm not able to convince
>> myself that you've expressed the prior combinations correctly. May
>> I suggest that you make table representing the 6 (I think)
>> combinations of original states with their mapping to the new
>> enumerators? (It doesn't need to be 6 different enumerators, but
>> all 6 existing states need a [proper] representation in the new
>> model.)
>>
> 
> Sorry for replying later, I paid sometime to check the code again,
> and drew a table like below, I ignore two columns when numa_off=true
> and acpi_numa=1/-1. Because when numa_off = true, ACPI srat table
> will not be parsed:

While I agree with this fact, the problem is that there are two
independent command line options driving the then single variable.
IOW numa_off and acpi_numa both turned on may still need a
representation. In fact I'm not convinced we can eliminate the
original variables. What we ought to be able to do is consolidate
their values into the one single new variable you add, before
ever evaluating anything. _Then_ I think I agree with the table.

Jan

> +-----------+---------+---------------+-----------+------------+----------+
> | original  |  col1   |  col2         |  col3     |  col4      |  col5    |
> +-----------+---------+---------------+-----------+------------+----------+
> |numa_off   |true     |false          |false      |false       |false     |
> |acpi_numa  |0        |0              |1          |-1          |x         |
> |numa_fake  |x        |x              |x          |x           |fake_nodes|
> |enum state |numa_off |numa_fw_nodata |numa_fw_ok |numa_fw_bad |numa_emu  |
> +-----------+---------+---------------+-----------+------------+----------+
> 
> Notes:
> The following scenarios will make acpi_numa=0:
> 1. Xen disable ACPI through acpi_disabled = 1.
> 2. ACPI table doesn't have SRAT, or SRAT doesn't contain CPU and memory
>    NUMA affinity information.
> 3. Emulate numa through "numa=fake" command line parameter. But I found
>    that when numa_fake is enabled, current code will not prevent ACPI
>    srat parsers to parse NUMA information. So acpi_numa still may be
>    changed later. Is there any further reasons that we still need to
>    parse NUMA info from SRAT table when numa=fake? Or can we set
>    acpi_numa = -1 in nume_setup when "numa=fake" to make srat_disabled
>    can prevent ACPI SRAT parsing.
> 
> If meet the following conditions, then acpi_numa = 1:
> 1. Xen enable ACPI through acpi_disabled = 0.
> 2. ACPI SRAT parser can parse CPU and Memory NUMA affinities successfully
>    from SRAT table.
> 3. Pass the memmory blocks' sanity check and hash computing in
>    acpi_scan_nodes.
> 
> The following scenarios will make acpi_numa=-1:
> 1. ACPI table is disabled  by "numa=noacpi" command like parameter.
> 2. Xen enable ACPI through acpi_disabled = 0 but ACPI SRAT parser can not
>    parse CPU or Memory NUMA affinities successfully from SRAT table.
> 3. The memmory blocks' sanity check or hash computing in acpi_scan_nodes
>    is failed.


