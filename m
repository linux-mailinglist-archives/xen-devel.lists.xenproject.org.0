Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0061B574B10
	for <lists+xen-devel@lfdr.de>; Thu, 14 Jul 2022 12:46:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.367495.598553 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oBwMg-0006P3-6h; Thu, 14 Jul 2022 10:46:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 367495.598553; Thu, 14 Jul 2022 10:46:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oBwMg-0006NE-3Y; Thu, 14 Jul 2022 10:46:38 +0000
Received: by outflank-mailman (input) for mailman id 367495;
 Thu, 14 Jul 2022 10:46:37 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=kqGS=XT=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1oBwDs-00008g-Hk
 for xen-devel@lists.xenproject.org; Thu, 14 Jul 2022 10:37:32 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on2069.outbound.protection.outlook.com [40.107.22.69])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f6c0f091-0360-11ed-924f-1f966e50362f;
 Thu, 14 Jul 2022 12:37:31 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by VE1PR04MB6591.eurprd04.prod.outlook.com (2603:10a6:803:123::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5438.12; Thu, 14 Jul
 2022 10:37:30 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::60ad:4d78:a28a:7df4]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::60ad:4d78:a28a:7df4%4]) with mapi id 15.20.5438.014; Thu, 14 Jul 2022
 10:37:30 +0000
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
X-Inumbo-ID: f6c0f091-0360-11ed-924f-1f966e50362f
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=izH1WXrDxOxyLBl0ZOITAHFTqG2cTYMqGN2tAAa3gVq6hkeDtKyYGMFT7uxmACPriHRF6N/fea2+NNDsCKX6ULIBEgAxu3tCl+z2Qi/63/jArAO2QgIOwLslJaEgV50O2Ii4zC0OFBNd8bTtNnsbMX9tRu6V1hPp9w/oz6DpyMvGJiSMfuOoEPVSPmXXD4hdPX8807iCDAhm3RFy3Zv6oQY9JgNC1BFKhZHppUQsrjSCzNEGFsjv5DBNnpZ3oBHJAwCGoxgm1DX0JeWr47K/AMjgg/s+/m6ieFw32bKr0sWtxXH3ODEtNAgBpVv1EsIl8DZicRAiRNmr7OLrWG8iOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LVsHDb5UE2EgU0row//0YNCGlvcrSgWlyewvZ2FYruo=;
 b=EN1er7g15WJocCzqQgFlebsbCx/rdBN0QuYGLVSuCNSrdwZGXwBfBwlGu3mLZykyqTaX1IO5ueFldGaHhNYhZmUhqshVR/7/yq0DKd1HBt3httC6hvpncBRan4lXGqOKngaLnr86YpEMTb/9sfWEIBYBC0/mhWoAuDGk8e2JbqQErvjWQLHU8D0aiw9fmFAP2Hcpc6TEDrij77QMpXW37KtvUQS2iTdx4QzyoftwtZ4zhapRLUxuOfu1EZs5GNDpeLYgP71z0kjQiPocnZeB7nmyTh+B8VL/kAJIOTfPB3NeCPF3bMhL+FerUrTSL11/WSzFIh1YJeHXW3QAk3Z86w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LVsHDb5UE2EgU0row//0YNCGlvcrSgWlyewvZ2FYruo=;
 b=MJIl7dR0zZH3iVfGaDOr7fLNqfXyqtVLVERd1WRrDeMk2ZlD0X6gqpFYH7H7TCNxn3hO+2UN0a1Os2ZMB+fu4iItnCnpaZFiMvmtkDkSpI2oSvCfzfKw+vw/nujm1JOEWRK1DQUjY66Pwwa5a2HOsvalAUytDLH4ELVxeVPwcCrLIC/P18ObUlK4eQF/9Fndop9guIFwtfSOHE8JNOABGRRoV8l7h4fffYEiEleeQYkpBXCtv+hZTdtKp2oz1M8rt7jbE1C5OXgJfb1q45ncPJoo64JLaLXAseXWZY48DwCnUCndh9Y4kvT32dvciX7mj9SNfB1QiccglF5eEGrSBw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <66b4ce65-037c-a8cc-ce17-adfce7828a2f@suse.com>
Date: Thu, 14 Jul 2022 12:37:27 +0200
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
 <f263956a-aa5b-e71a-ed96-c8f50ebe0d1b@suse.com>
 <PAXPR08MB7420ACF437B10A32BF09689E9E889@PAXPR08MB7420.eurprd08.prod.outlook.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <PAXPR08MB7420ACF437B10A32BF09689E9E889@PAXPR08MB7420.eurprd08.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AM7PR03CA0024.eurprd03.prod.outlook.com
 (2603:10a6:20b:130::34) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: aed88ac9-4a30-4801-845b-08da6584da3e
X-MS-TrafficTypeDiagnostic: VE1PR04MB6591:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	j/afxU4pmzdIA8a/ttBWRoN4cEtGSPfGorqsvI2Dxj1g7ug61P2/E1Ckr+Ilz228Xvj+o1VhD8o+QNsTO8BlpI24fBGlmbbD8ll+ySbE9Noq6563sCQ2x+DWnlfVj6ZuHn7FZLeTYr0i56r357EfwFC7XWFy9CO96FJ3jmdqrRRcDoTYrxPru3M71VeJiCEi/a0LqWX9odB/shosmG60iEH6wXDnSbW7qUz1avuueLxZrzxZ/xYmUpYrMlxrf0Sq5Ml/DOvIwioIROzgZmY8SAemXY3VdGmSfDVY0hm1JeZ/hpkEeTyOGVpm1C77YgjT8I7YFZwmN7TA4et/PbPfb6VbSWxXHoVmzGh80tryBDhD+IQ/sUbagN4iGBpd0HGpdoRFvvsLe/cegIzwL3ZI6LboJ0L0mP3RJak020vbsEQ0yK9Q5SzDW4kJh/sqHZBPi/rZWmM23B5O8bzKRfCJd7va5oJF/B6PKCDtBqj34dZxlTabSY4CR/+cvohZQ8BIZwmYX3epkkuDxPfYiGMetKRcexHTtaKtfqibAG+cVbGkYvjgtDsTVMdLP+mQ1uUvjvgoZi438Bkbr1hLVhbUXFWpvI2QxxDqM+MH4ej60VnBxsHN0dVVc/m/zUj7817CNAEFeLSugcdEzsST+w3+5VWwKTv97FKr3iJwvVXuKylNd7ZMaW3RI+dpFsRCcOLa0mHdiuVa4z26IXLHDQYN4KZc9J1RyQtQou9J8KKN27K596vKk4oCNITnM501LrVOWJ/QPbswuTjWXOqaPuIif40w3RIzrKO+5CccR0+9rWzWTzZiE953Ie+S6eJzKLZeMOLddydz9bdVdU/WijyiZkz7XTYU87vgqQhfZmMNYgA=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(396003)(39860400002)(366004)(376002)(136003)(346002)(6862004)(2906002)(5660300002)(53546011)(8936002)(83380400001)(86362001)(31696002)(36756003)(6486002)(6506007)(38100700002)(478600001)(66556008)(66946007)(8676002)(316002)(186003)(54906003)(2616005)(6666004)(6512007)(41300700001)(4326008)(26005)(31686004)(66476007)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NEhRREd2T3BrUFBrdlBPSEQzKzVUeE9lbkhmTXh5SzBxQ2lQbnJ1OUtoUnJk?=
 =?utf-8?B?SUt1bklDNW1rbmw2UlVwOWFMUDhId3NJS3JrQzF5VGtoNkVnRXhlOHJ4aHFr?=
 =?utf-8?B?TnlGZ2NFQkpQajFWRDdYYnN3UjZ5Vld3NlN6MkZSTWJsdW5jVTdLY2NVb1Zi?=
 =?utf-8?B?R3dZYlZpQU5HNGkyb3puSWtaZzBDVkprdkZNajJKVEhvUjkyb0tSRXMrakRv?=
 =?utf-8?B?ci9RZFgyWjJGOHVQa056bVVXUW9PZGNzWE9RcTN3Wkw4eWxicnRsenN2VTFj?=
 =?utf-8?B?Y09FTU10d1dqejdlbFNjdHNNV20xaFVtN2owazQyK0Z0cW5nenZjV3ZlOEti?=
 =?utf-8?B?NHU0d21BejRxcS9mZjErWEtiWmdhdm1Rb2JQWHU4bWlSb2ZTdlFDdVVyRWVF?=
 =?utf-8?B?QzNSblgzMjRsVWdDWXFId2lHZ0hSN0VaK0FWWDJxc0o4T0N5a3NTMlBaS2ll?=
 =?utf-8?B?WWQ1ZkYyYXFhTzE2MFN3NVN1TnVicGJkNXJLQ3phSUdjT0E1NDloSmFTaFBE?=
 =?utf-8?B?SVVWREhmbEpxY0FKdGNzcDdqR0lRTnZQR1hCZG1PV1YxeTI1K05idFV2V2la?=
 =?utf-8?B?SmptdnR2dXE1dTZIeTRIMjcvVCsrRmo5NWpmdlgwaVdyejNrYkdWSkdiNVJt?=
 =?utf-8?B?UlRpdXVMd0FjakVWaUxiUWM3T2VlRGhtVnBiNndjNHBxMSs5eVh6NXZCancx?=
 =?utf-8?B?TWh2d0tGc1hmbjZjdEVmSlBFYldxVG5IaGxkU2xqK0psWjlqMmpCeTYzdXFX?=
 =?utf-8?B?MDJ0cmF3SHZLQXdTTzlZcmI4VmpyMmtBaGZiWTE1RmdaODZrWDB1Y0tyYyt0?=
 =?utf-8?B?aFkxVTNBQms5OVhwSHlZT28wOXRyVHFIalZQSGpxZ0N1TTUwOHQwcmF4QzF6?=
 =?utf-8?B?a0FuMnNEOUNreXRJQjhtbm9OODl6bjZaTWdKZHlBRUd4QnlYYW5kSXRmbU5K?=
 =?utf-8?B?WXFnMk9aUUNjdG00c2E4WWtwTERjeE1pL1VmRUZNMkNiakhEeWM3WHFnZmt2?=
 =?utf-8?B?bXZJQ0twUnpJU3J5b0tDd25vL2VaWXIzWnp1Q0xrWnBLYVZFNTN0MGdNcm5R?=
 =?utf-8?B?UEgwQ1Q3REFBYUhsMW5rbmxqM2p3RUNHMk1SYi9GOTFqNktXWU4zUEx6eisr?=
 =?utf-8?B?MUVXR1VwMVFXbFFHNm9OcVliekI2Zmc3NDQwaWJIalBjZGE4d28zMVJPUm9q?=
 =?utf-8?B?Rm9PZzBVNE13RUNZRlBKNHdFWXltMUpNUUZuWjRzZ0xDYlRrUmFRU1RwcFUw?=
 =?utf-8?B?Qy9USkw3OFVyeHA3ME1LY3B4K3JUVzZxZ0ltc21KRnd6T2dlZDk5b241anhE?=
 =?utf-8?B?TTlTQVFyRmUwWkJickYxQ21LVVI3RXJZd29FMksrL205TkRKWmlmOVcwOVpk?=
 =?utf-8?B?WU50WVZGaGpNTXNXN1hnU3RYcGhTcWR0QzJnbm50TWxXVEZXd2E5YW9SdERI?=
 =?utf-8?B?Zml6VmpyZDM3c3BVZXI1cThlWkR2cmJ0SmxoOTF3NHVSOWNOMXRkR3dBcXMx?=
 =?utf-8?B?Y3N0Nk44ODdmMVJVUExsOVpQKzVKUjYvQUhHZ0huaTBmUVkvMmhQcGI4R0pq?=
 =?utf-8?B?Y3dSbFNwVVl4cGs2K3B2bVRkQnoxcCtMRVk2L3VaNWg4V1l0d0V4U1ZTRFk1?=
 =?utf-8?B?YWYxQVhpSWVnMDd1d2lmaHprYXFvR1R3cnlRT21KbG81Q3I5T3FyRFIyMjRs?=
 =?utf-8?B?bFg1ZUt0bUlrUVNPeE9EMTBIK25tdzJUUDZ3RnBLREd2ZmNkYVNQWXQ2RmFW?=
 =?utf-8?B?WG9DckM0cytuQW04TUFLRjd4MWRPZ3ZKT2xDZHdkSUFFSTFyd3ZiTkp4S2s0?=
 =?utf-8?B?bDllMUlCU0xHZVJsSW9keGdITWF4VGhqb29rekFFU2E4Sm1YVC82WUNTUXF1?=
 =?utf-8?B?SlNETUlBc2pRZm80YkxQUURSZmg0QmRNdnNIQ09WSEhYaFFoV2Y0Sy9hSzNh?=
 =?utf-8?B?Vm1taVgxendydmVsdU9wTTl4WVdsd0djTzNmYW9vN1hlM01sU0xrdzVOcEFk?=
 =?utf-8?B?ZUtqRzBqMkVkNGtDR1AwckVzbUUwdnhHcjQwMEllU1NrRGlYM28vNkF1a2Ru?=
 =?utf-8?B?U3p4dXpYalFCMVdFejhBVmkrVzgzVDUxSi9kUWQwMWpZVXUzMTRkR01KUWRG?=
 =?utf-8?Q?Zlc6Fz0VmleCORkDKRT6HOJnv?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: aed88ac9-4a30-4801-845b-08da6584da3e
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jul 2022 10:37:29.9215
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ktSF/L0TXImNE0Hhuea7xLyIsmCKt9P4uEDtvvllVoyvB0g9NctvyfECDKgVETMXpoXubCc8VG0H/y2fGfmm8w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB6591

On 14.07.2022 12:26, Wei Chen wrote:
> Hi Jan,
> 
>> -----Original Message-----
>> From: Jan Beulich <jbeulich@suse.com>
>> Sent: 2022年7月14日 17:58
>> To: Wei Chen <Wei.Chen@arm.com>
>> Cc: nd <nd@arm.com>; Andrew Cooper <andrew.cooper3@citrix.com>; Roger Pau
>> Monné <roger.pau@citrix.com>; Wei Liu <wl@xen.org>; xen-
>> devel@lists.xenproject.org
>> Subject: Re: [PATCH v2 2/9] xen/x86: Use enumerations to indicate NUMA
>> status
>>
>>>
>>> How about update the table like this:
>>> +------------+----------+----------------+----------------+------------+
>>> |  original  |          |                |                |            |
>>> +------------+----------+----------------+----------------+------------+
>>> | numa_off   | true     | true           | true           | true       |
>>> | acpi_numa  | 0        | 1              | -1             | x          |
>>> | numa_fake  | x        | x              | x              | fake_nodes |
>>> | enum state | numa_off | numa_off       | numa_off       | numa_off   |
>>> +------------+----------+----------------+----------------+------------+
>>>
>>> +------------+----------------+------------+-------------+------------+
>>> |  original  |                |            |             |            |
>>> +------------+----------------+------------+-------------+------------+
>>> | numa_off   | false          | false      | false       | false      |
>>> | acpi_numa  | 0              | 1          | -1          | x          |
>>> | numa_fake  | x              | x          | x           | fake_nodes |
>>> | enum state | numa_fw_nodata | numa_fw_ok | numa_fw_bad | numa_emu   |
>>> +------------+----------------+------------+-------------+------------+
>>
>> Well, this makes the table complete, but it doesn't explain how you mean
>> to fold the settings of the two command line options into one variable.
>>
> 
> No matter how many separate "numa=" parameters have been parsed from
> Command line, the values of these original variables are determined
> after parsing the command line. So the determined status can be mapped
> to the new one variable from above table.

Hmm, I was partly wrong - the initial values of both variables are
indeed set from just the single "numa=" parsing. But later on they
"evolve" independently, and multiple "numa=" on the command line
can also have "interesting" effects. I'm afraid I still can't
convince myself that the new mapping fully represents all originally
possible combinations (nor can I convince myself that in the existing
code everything is working as intended).

Jan

