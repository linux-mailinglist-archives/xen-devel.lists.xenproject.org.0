Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E73896EC74D
	for <lists+xen-devel@lfdr.de>; Mon, 24 Apr 2023 09:42:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.525155.816166 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pqqpf-0001oP-Os; Mon, 24 Apr 2023 07:41:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 525155.816166; Mon, 24 Apr 2023 07:41:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pqqpf-0001l6-Lq; Mon, 24 Apr 2023 07:41:55 +0000
Received: by outflank-mailman (input) for mailman id 525155;
 Mon, 24 Apr 2023 07:41:54 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=0Hh8=AP=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pqqpe-0001l0-2u
 for xen-devel@lists.xenproject.org; Mon, 24 Apr 2023 07:41:54 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on20621.outbound.protection.outlook.com
 [2a01:111:f400:7e1b::621])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7aa44a5f-e273-11ed-b223-6b7b168915f2;
 Mon, 24 Apr 2023 09:41:52 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM8PR04MB7889.eurprd04.prod.outlook.com (2603:10a6:20b:24c::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6319.33; Mon, 24 Apr
 2023 07:41:51 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::52b2:f58:e19:56ae]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::52b2:f58:e19:56ae%2]) with mapi id 15.20.6319.033; Mon, 24 Apr 2023
 07:41:51 +0000
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
X-Inumbo-ID: 7aa44a5f-e273-11ed-b223-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MgSAb5kjAxsFdggzGHOXIAFcZh1G+HKgySFx01iKA8NDPCVfd1z2gUPEd5zoluL+PG/bDZ+HN7HM41Y4MWtkifx1Z/IFo4k7cGgCqREPWcBajywcPZWs5l11+zJf5Ff/U0CtFAFr9W5YiBIdC9uuikvjcRpf8HJiDUXT/z1s9Aw5oByjvYkoYAZYVLb6nB8dbgZG/97ABR5Ih7mjzYkQervSzWV96Iykkno/Ny8B1lF8fqU+QGZoNmecpDu7jmDfQzclRCa1bE+8tovgns3pyvrIeU0L6RStJ02M5h/tPHafSRy1aaCWwRnaM9wmX3Y++02DYhgG7wNU+81/oIqnNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9O3QSKKiMQmag2nEoAv4P6qdeA1sEqoAcHERrvq+sQM=;
 b=LoepIrKTgZkDrK/hSKPMVMavFwrj5HRj530K3LDceOR9J1LTuH2HwIXL3mzC627HzbuuvfYpZiUrzkH/DSI6r+A83w07UnqSNAKeLkhJ/crLve/z+HfAmbM7FMP4FBepAouUwU/tWMp4D63nUCtXG9WChxzjVh3EDr9ZGCHO8ZtulPCb2Yd37pBbnOY/oQjRe2+kPkKMIOgLH73cR12NxbHnDGFFYix5dN23HrU3jlZlva6oZvFya/FYXIkmkhLNe+HoZP7pcN76ck894dF50REAtJuQ81I+K70RRR0CbIzxWkthB8+Xi6/zsEj/mANjptsgIs0vAw8UClGF1wUKgA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9O3QSKKiMQmag2nEoAv4P6qdeA1sEqoAcHERrvq+sQM=;
 b=rkqA1dOUkSf20mSaNEV02uxC5ud9hSAWvoRA6nk/EVgmU+8+5jAU4t3580ldU6QqUUwCjiAobwwj4fMxWBOg5UZe2MFrQzr62P8wGT3eb1n0XfzAjE5c2elawOD8HYSvl3lmrK9P4vYWZf+ib7ZwaQcIqFf4LrLjkpPCKp7KGahql1c9o9FqdHpjtf09kZ/beaj6FKLDVEFjsQLZ14pp9G+k+n8hfgUTCHAO72WmeGH4Q+txmPA0SoxXysjz553k9DklryOp0XLKBllrqmpt1Iaep1FsWPTXPfPTtSxvhMpZpBWXTPcVXpabJ0E2cHiebZsUnjunXbTTa8nhzZVM8g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <e06fc93f-293f-a873-c9b9-2d5c941168f9@suse.com>
Date: Mon, 24 Apr 2023 09:41:51 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v3 03/17] xen/arm: implement node distance helpers for Arm
Content-Language: en-US
To: Henry Wang <Henry.Wang@arm.com>
Cc: Wei Chen <Wei.Chen@arm.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Julien Grall <julien@xen.org>, Bertrand Marquis <Bertrand.Marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <20230420112521.3272732-1-Henry.Wang@arm.com>
 <20230420112521.3272732-4-Henry.Wang@arm.com>
 <ac54e04c-58b7-d0c9-2443-bb09258c8bc8@suse.com>
 <AS8PR08MB79912F294EDAC48F835FBB7A92609@AS8PR08MB7991.eurprd08.prod.outlook.com>
 <bdf33169-4e29-8c50-ff76-16d05df81a14@suse.com>
 <AS8PR08MB7991576C75D0D4482595E7E292669@AS8PR08MB7991.eurprd08.prod.outlook.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <AS8PR08MB7991576C75D0D4482595E7E292669@AS8PR08MB7991.eurprd08.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0173.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9f::8) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AM8PR04MB7889:EE_
X-MS-Office365-Filtering-Correlation-Id: 43692ca4-97b6-47d7-dfd4-08db44975e06
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	sLORtVpC/focrFTn97Il6bF7MmbHhCrlgTBQv8rUBGknhFW1RCE1vwvKbgBVvaYLuCkXmXYyhVscZZn4KIaL/b2jfVzmvI06IAFzoKsEDZYNLGBcsyd2rR+SL8gA5Losf4s1wGeYY6J2pofnHlShBYC4tYLj61GqeO31OAwxnhzHLse/+hcSO9FoiC+J2ZIEuZrWxfDEopAjkj5HiOyQEHewP5guC3d7TgY+0FZE9wfsSiLJ6knso+QIzJcqGURo3iL4pVqPVSfq/NRbiXCPpM3/7I47yG/LfYo+KUgR1PWO2m9Hv/bAu3grTDK6g2Tz+sI6Xw7h/hU1+PQ87CJXf+WKLPwAcvucbqVLTxQUu8YPu8DQE6+BKViS1DyfHjg844TedQ5SwtKQMzKJ12TVAjGogM2H17hVaj991dCwCiWJZh3lbfPoEqSrP3MQq0AL2DN4lJc87EnLNK4GLvtL8tR9/IO3NLuzDPFMQP1Im3at2z43EfeI3ffUsxOCACoGUXuIZZysZTBBClsj3LBlIFkSeQ1FB17qZdXUdrbK4tyZgS+9wzY5NdONH5XhK+ZXMJ9/qp9BQg4kGGQFhqnLTJLfRuuI4grAq/6UqIkGjLYzbHyANnAgfeotHOMyq2oMlrI/mpYKMVVDp59EgIpveA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(346002)(376002)(136003)(396003)(39860400002)(366004)(451199021)(5660300002)(7416002)(2616005)(86362001)(31696002)(83380400001)(53546011)(186003)(6512007)(6506007)(26005)(38100700002)(8936002)(8676002)(54906003)(478600001)(316002)(6486002)(41300700001)(36756003)(4326008)(6916009)(66476007)(66556008)(66946007)(31686004)(2906002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RHJWdXFyeEtkdlVFWWoyN21HaG1QWmkwcjFFY2JOOVovUUladG9WbkUyU2sz?=
 =?utf-8?B?RUpKUHRGc1NzNEt0UDZOQjNwdWw4Szg0Wll2Ny9IcmtmWXkwWThXdXpVVUZ4?=
 =?utf-8?B?UHJCSmRRbXcwb0t4S21RZVpHVitCMEdrcXF4VG1iSlNXbkNJZStFKzVJdkoy?=
 =?utf-8?B?NGhJN3owZzdlaFZDeDdLdXNJK05aRVpuSWtLVmVHcjFoa2RsTDdwc3BvK0l5?=
 =?utf-8?B?Mm8yR3Q5TDNmRG1Oek9zT2pYeTRsU05LRUY0Ym4zcm5MMzI3Y2U1TUQ1Tkc4?=
 =?utf-8?B?alFFK2ViK08xZWxMYnhXVXNsdXdWbjlpdDhMSmcwbDRCRVBNclJWNkVwWXBr?=
 =?utf-8?B?Ynp2TFVjaUY2cTNKOXFhWVVxS2laeUVnZVk3blZ6akJSWXkxOXNiaFhxL284?=
 =?utf-8?B?ampNZGtoS2xnSXM4SlJ2K2pxTGFsbFgwdW01alpvQVg0dUF6MmZyaHJXcFNI?=
 =?utf-8?B?bllQU1lLL1lwZFZWaUpGWlZvWG5hMldRTE9XM3gyMk1QcGh1UTZPWDlPempM?=
 =?utf-8?B?SkliTG1TTjBvMnFmK0hpYmozcmpQRS9OUlFRaGR6UnJXRlRNLzJyV2o2K0p1?=
 =?utf-8?B?T2UvSHVYemJWSkVOamU3dGt6M25WblhRZTI3dVlaTnd3QzVwMW51S2hxUzNI?=
 =?utf-8?B?Z1gvcmpYcWQ3eHBCYTgzaE1TTkFISTlVSXMrOVRsWXZjSzY0cDdiMUptWWpM?=
 =?utf-8?B?L0dWMzdpMXlpQWZ3S2FJYnlDVkhuTlFseFlHdVA1c2dqS2lWVmVDUU5OUmUw?=
 =?utf-8?B?MTBNLzlJemU2Yi9OcDFubGVaVXp2VGVEcVFzc0U1TXlHaGNqRFdIVElMeTIv?=
 =?utf-8?B?S25XemkwVUd3cVp5VTE0UXg0TEY0SExPZDhIZWwyUEdJbG5zZzh0Tm56bWRS?=
 =?utf-8?B?UzFIajhtVUZJcDZLa28zQXpwVjA4SndtZHhETWM2ekpoN2ZPcXlQUUlCNVg1?=
 =?utf-8?B?UDZOUmtIR2NJRTZ6RnVERFZmMUVhczVCKzhKZTZWN0NzRHY5QkJzT0d4VWNR?=
 =?utf-8?B?VTNsaU41MFhDcTFDQnRHcVJ0R0dIME5TcXFKcFpCNHhaOGRwVnNRcW5xZFBG?=
 =?utf-8?B?TGMxRXRoWENCbi9NNnNqVnY5eE1qZjVmWGhsbjIvQTIzLzZMQVRwYWV0ekU4?=
 =?utf-8?B?TUJyRDlxalBuUWYyaENPdk1IaUdIVjk1YVh6aHU5TnlLak54YkhzMndOSTlM?=
 =?utf-8?B?NmxHcDRScm04Yi9NQ1pscUkwdXU5ZkE2RU84bFc3ZWF4NEJ4WlBjdzlJclFs?=
 =?utf-8?B?TzFSeWxWR2dmQlpwbjkwZmNGckZwRWg2c0JHa09DeHh5OEVadHhnUXY0STI4?=
 =?utf-8?B?TGNPSjE2K0xVTmNqakdhb3U2ZFhzRFpTalYrUTVoV2JqWVU5UGxVbUFJVnRj?=
 =?utf-8?B?V2tWNXV5YVpBUTBOeFBHeWRKcEtFYitKZXVHbWczRzFiZzgxSmduZUJQMkhB?=
 =?utf-8?B?MFlEakM4WXh3SUl0a1QrdjV6RnNaS0JmMWNhRFp2SXNyR0RCWitlNXp2R1FL?=
 =?utf-8?B?VzU5WFhLVEh5MnRUc3hNREpkQzJOejRVVmxwdFFRNzVlaFBuQlp5YTFnNGdv?=
 =?utf-8?B?R0lGMzh0eTdUUlNsQUdpZHFCcXduUTdCMmhSRkY4bmZtRWtkT2lWUkcrcHZ1?=
 =?utf-8?B?a05WeDZBd2Q3YTJna2RocE5TcDNHTFZUVlozWVlzSWoxL2lRWDdXbkpiL1dn?=
 =?utf-8?B?b0RGYUxtY1JDK1Avd2F2MEdqTmJMdEhjTE95NE14c3U2VndkTFNZdXdqOFly?=
 =?utf-8?B?aFNkbnlvVzZXcGdNWU5peTVrUEIwOUNQMTEzT3JIandGQXlpWFhDZmJJMFpU?=
 =?utf-8?B?WjJycUdHazltRmxFeVdZamdUL3hNQmU0dTJ4YTZxMmR0clJoNDhYeDNPR3lz?=
 =?utf-8?B?TlhhMmNNUk1Id3doMlAycmxwcWd2bDk4cnBLVWRtOEVvOHprcklMSmR1ajU3?=
 =?utf-8?B?U01yQ2NYcWpIdXBIaDdRZ3VFY3g3UTFLQ0RWd3pwNXZKajJVN2FmVEhSZWFX?=
 =?utf-8?B?UkprdHB1N0d0NkhLd043NjFLVUtFQ1d3UGpuem01R0FvaG5QQlNWTFQ5MjFo?=
 =?utf-8?B?aHdFekFQYmhGa2tEV29CVndIYXdocG9hSU0xU2hDenUrMkpJSk5HZnRodGti?=
 =?utf-8?Q?QSG3xcMriXdnB9RXh1l64k89v?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 43692ca4-97b6-47d7-dfd4-08db44975e06
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Apr 2023 07:41:51.2873
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 05EMZEM+YS+f/0Ldmn84KDUbS3FhgH2sgiWEtWcrwYaI1N+smSr6Bd5OeZEbgusw526XIJPAP82DwX1MJf8oRw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR04MB7889

On 23.04.2023 07:36, Henry Wang wrote:
>> -----Original Message-----
>> From: Jan Beulich <jbeulich@suse.com>
>>>> However, looking at the code below, don't you mean to have the array
>>>> pre-set to all NUMA_NO_DISTANCE?
>>>
>>> ...I am a bit puzzled about why pre-setting the array to all
>>> NUMA_NO_DISTANCE matters here, as I think the node distance map will
>>> be populated when parsing the device tree anyway no matter what their
>>> initial values.
>>
>> From this patch alone it doesn't become clear whether indeed all array
>> slots (and not just ones for valid nodes) would be populated. I think
>> the code in the patch here would better not make itself dependent on
>> behavior of code added subsequently (which may change; recall that a
>> series may be committed in pieces).
> 
> Correct, I agree. I added a numa_init_distance() function (in patch #12) to
> set all values to NUMA_NO_DISTANCE. The numa_init_distance() will be
> called in the beginning of numa_init().

Why do you need a function for this? As said, this array can be pre-set at
compile time (unless I'm overlooking something).

>>>>> +unsigned char __node_distance(nodeid_t from, nodeid_t to)
>>>>> +{
>>>>> +    /* When NUMA is off, any distance will be treated as remote. */
>>>>> +    if ( numa_disabled() )
>>>>> +        return NUMA_REMOTE_DISTANCE;
>>>>
>>>> Wouldn't it make sense to have the "from == to" special case ahead of
>>>> this (rather than further down), thus yielding a sensible result for
>>>> from == to == 0? And else return NUMA_NO_DISTANCE, thus having a
>>>> sensible result also for any from/to != 0?
>>>
>>> Could you please elaborate a bit more about why 0 matters here?
>>
>> When NUMA is off, there's only one node - node 0. Hence 0 has special
>> meaning in that case.
>>
>>> As from my understanding,
>>> (1) If from == to, then we set the distance to NUMA_LOCAL_DISTANCE
>>> which represents the diagonal of the matrix.
>>> (2) If from and to is in the matrix range, then we return
>>> node_distance_map[from][to].
>>
>> Provided that's set correctly. IOW this interacts with the other comment
>> (which really I made only after the one here, just that that's of course
>> not visible from the reply that I sent).
>>
>>> (3) Other cases we return NUMA_NO_DISTANCE.
>>
>> And when NUMA is off, it should be NUMA_NO_DISTANCE in _all_ other
>> cases,
>> i.e. ...
>>
>>>      /* When NUMA is off, any distance will be treated as remote. */
>>>      if ( numa_disabled() )
>>>          return NUMA_REMOTE_DISTANCE;
>>
>> ... this return is wrong in that case (even if in reality this likely
>> wouldn't matter much).
> 
> Thanks for the explanation! I think I now understand :) Would this diff below
> look good to you then? Appreciate your patience.

Looks largely okay, but possibly one part can now be omitted (see below).

> unsigned char __node_distance(nodeid_t from, nodeid_t to)
>  {
> -    /* When NUMA is off, any distance will be treated as remote. */
> +    if ( from == to )
> +        return NUMA_LOCAL_DISTANCE;
> +
> +    /* When NUMA is off, any distance will be treated as unreachable (0xFF). */

Please avoid mentioning the actual value of 0xFF: This serves no real
purpose (afaict) and is liable to go stale at some point.

>      if ( numa_disabled() )
> -        return NUMA_REMOTE_DISTANCE;
> +        return NUMA_NO_DISTANCE;

With the code below this is now only an optimization. Might be worth
saying so in the comment (assuming having this optimization is deemed
worth it).

Jan

>      /*
>       * Check whether the nodes are in the matrix range.
>       * When any node is out of range, except from and to nodes are the
> -     * same, we treat them as unreachable (return 0xFF)
> +     * same, we treat them as unreachable (0xFF)
>       */
>      if ( from >= ARRAY_SIZE(node_distance_map) ||
>           to >= ARRAY_SIZE(node_distance_map[0]) )
> -        return from == to ? NUMA_LOCAL_DISTANCE : NUMA_NO_DISTANCE;
> +        return NUMA_NO_DISTANCE;
> 
>      return node_distance_map[from][to];
>  }
> 
> Kind regards,
> Henry
> 
>>
>> Jan
>>


