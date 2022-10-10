Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DFF385F9843
	for <lists+xen-devel@lfdr.de>; Mon, 10 Oct 2022 08:21:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.419111.663836 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ohm9n-0006Bb-4V; Mon, 10 Oct 2022 06:20:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 419111.663836; Mon, 10 Oct 2022 06:20:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ohm9n-00068Y-1L; Mon, 10 Oct 2022 06:20:55 +0000
Received: by outflank-mailman (input) for mailman id 419111;
 Mon, 10 Oct 2022 06:20:53 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=zSpT=2L=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1ohm9l-00068O-QA
 for xen-devel@lists.xenproject.org; Mon, 10 Oct 2022 06:20:53 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on2083.outbound.protection.outlook.com [40.107.21.83])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id acd8f766-4863-11ed-9377-c1cf23e5d27e;
 Mon, 10 Oct 2022 08:20:46 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DB9PR04MB9380.eurprd04.prod.outlook.com (2603:10a6:10:368::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5676.28; Mon, 10 Oct
 2022 06:20:51 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2459:15ae:e6cb:218a]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2459:15ae:e6cb:218a%7]) with mapi id 15.20.5676.034; Mon, 10 Oct 2022
 06:20:51 +0000
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
X-Inumbo-ID: acd8f766-4863-11ed-9377-c1cf23e5d27e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DKGdVrUIlGHSC0xUXrbY9eAsx1oUB957ET5pAyvv+zea3uE8jox208G/wwXTeTkJ3HTOHdBy9Jazl4aJTlTgCpzs8v/F03SXVZbucOBBuIh3iPNOeeZvgoAkIqWrwd0Oa1pBA/mBfIMRjw4jEkco21Qfij3R81cKxcXQERJdkmRFuEM0mg1beG9qyqNO59veHnomT9UrrrDFfhkaQf6d83cGN6+OEiwm9lkXjm/c3yU5vuhjR7qPxwmC2/YI9BmpOwbI/hiR8I7XgpdJAvAQFXQKfBGoL38zfOp1cpTIl1PFmpM0+gmUK6Vx4hePgUHsiuP3tIb+SmZjaSA2JKrrHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=G8uhotMRLEWevni8/P/wrPFXh2RFR72AYYIlNtVhUnw=;
 b=IMk3EyFCK9+VfzVQ7jZSyKJfilwQcBipxs0JKN2Ff49mwx99l0c88Oz9l6y8wadhuNh7YTjBGVMBCaXXi6JkD6NdoSuR9uRz974yCgz8zb7OoVnWRNt5lDycT9gMPc+1yE43OI40janrmS0sS4eyxFLFf9hk1JaeFJRQYM1OnrHlYojJZFrvWB2lOZimO4BaIAmIrMljTi/k+m4JJqMwwWx8NAT93SqaA9l8c20vYBTZj1xEDvOBL0ggaakQ3WFzCfS3GiZSI3rAjh+h6iYPr60e0s8o1D9tNuEL2UVOYBySrSLSGKrODBi9Pz4JvPeF/P4XC0QEN3nhznqLHcvdIg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=G8uhotMRLEWevni8/P/wrPFXh2RFR72AYYIlNtVhUnw=;
 b=YojT2RLLL3x2Ybi0//o3GMJhUnIeUS5kesC2k4UFjWx1UDgoUkyGq2pF7UoMD5WGsaFXYsaHtpVm/S4pEW6uZFzODPaYT3W3s8l+2seVQI7EiBntcAKS5pM+lwZteSt8NMH0ZOcUzpsnm6nBnBzgFmkBNpOO30588QJ+tlSGcBLud5/N3vpiqtQCpotd2F9jVyXlC9Rc7/vKVUPuwMSOJLN003s4xID5e9aS3Rgz2uaowYa/joFkcbU+GHb7yajmua312+a48L/Ffjue7E10dozVtBBnpAwZB/2+uJd86jPZdhQB48r8rNRGO/YrdF0LeV+j1FgK7b4yra7IbkP4ZA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <319015d6-ec1c-3500-2437-00d40fe4d2c3@suse.com>
Date: Mon, 10 Oct 2022 08:20:48 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.2
Subject: Re: [PATCH][4.17] EFI: don't convert memory marked for runtime use to
 ordinary RAM
Content-Language: en-US
To: Julien Grall <julien@xen.org>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Volodymyr Babchuk <volodymyr_babchuk@epam.com>,
 Henry Wang <Henry.Wang@arm.com>, Bertrand Marquis
 <Bertrand.Marquis@arm.com>, Stefano Stabellini <sstabellini@kernel.org>
References: <cc0fbcb4-5ea3-178c-e691-9acb7cc9a3a7@suse.com>
 <9C12552C-0A64-433D-9F0C-5672281DD45D@arm.com>
 <73faf43d-56e2-2bbf-6336-f6420a1aa0c0@suse.com>
 <f1a71d28-ed04-0936-47e3-aa7a9f8c6dbc@xen.org>
 <0d33ecc6-898a-9379-f934-fe569cbdc8f9@suse.com>
 <3b3f6e1c-4f41-6b1e-b226-f0dd515d14ca@xen.org>
 <7d152954-4f5a-2833-f974-442c15f4e8b9@suse.com>
 <82963a1c-3301-72ff-e995-77c30ec5a64b@suse.com>
 <a957dfbe-c4c4-c8cc-93c5-616a44fe1797@xen.org>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <a957dfbe-c4c4-c8cc-93c5-616a44fe1797@xen.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AM6P193CA0137.EURP193.PROD.OUTLOOK.COM
 (2603:10a6:209:85::42) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|DB9PR04MB9380:EE_
X-MS-Office365-Filtering-Correlation-Id: 42d430f3-4df5-45c3-1c16-08daaa87943e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	k+3mpoAV9IlBd3Vf/tKO526IoUdJm3u5dDdQfbASyvGTYnpmtDlEiEA3Xq1zXQaHEvcSBoYdELaU272hNRoc85o+gNAR89J3njRAtBkwlTpMUH78VlWMO5lbNI8/4i07wtsFSxluDFnp9GKgj+bFfZbS1rFG9YX8pJuEFwjkmFp4m+7tdUE0epbJ+6WsywmYulALd6EKAw5TFejYYW8Ivh/bGQW4edAUv3Gpy7sLb99LA34q9+wyHHMGmJ5ktvh4TBTMNgRsqZSXWMxRARi8+IVA7mYjEYNVE7gmMV9OVufOV+U0kSJ4pAqkkE66IyT87qimMmu6sQ7JC1kRagBDTKjkYi9B2jhj3xZ0g6+nJxrFo5Rx/kG+qkz0AsZKbci0PYa4aF+mLwkad8qRNyOrkRvY2qnn9yncjVPyhxwxh959tEirIfpAG5ItwGh8sSymhaBIXkprWnUBUDEWsieGc/h21J6JlbaslUNk8vAOTramCTSV3oOnUyundLuZwTd5Gbv0md7Bq+u0+3uEb/PmiojGMUqLpAFFP3COq9bx4+hVd2K0WjzZL2mh+DpfvB7xpgrrU6DqIicIQ/NoJL3e9Iksj4kMwed/UGYR9cfMIWrDX2rX0omatNKFdqg1rsC2SXdpBpW6C+of3VdmPiYz5lZT2uqrzbAKOa7LYqY0P+VNKBUEQKIcBJOWNzfdQ/UqfiFy9vwTUlFngAkt9KoEd0Szj4BzaeC7UKXP+lAhoFUd14MnkWXAefIz/NsKLRmiuf/KvsHztTVONDunpEoMCDHdK6c52N8a/NdDk7FGSxk=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(366004)(396003)(136003)(346002)(376002)(39860400002)(451199015)(66946007)(2906002)(36756003)(8936002)(478600001)(316002)(6506007)(6512007)(66556008)(31696002)(6916009)(6666004)(4326008)(186003)(41300700001)(66476007)(2616005)(6486002)(8676002)(53546011)(54906003)(86362001)(5660300002)(31686004)(38100700002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZWw0SFNBdHNocUJaSzBCakdUdzZEY0hrMHY4SFlqNmgyLzY1aFZWVWY3SjFz?=
 =?utf-8?B?OGZLS0ViOTNaMnJ1cjEzZms3bWtFRm90ZUE4ckNMV254dVZ2Y1RFWnBBeGpo?=
 =?utf-8?B?clpzWThXWThRelFSY1pKNnZjN2c2akxrUXM3M1g5YXI3K1NPMm9US1pzSHh0?=
 =?utf-8?B?NFcyYTg2NngrK0Yzd0NOM1JWL1p2bml2Mk1zVTdjQS91NFJzekZhb1RSNXp6?=
 =?utf-8?B?cjJua3JpYld5b05DSGsvSzNDczRPWEdxTFY0RmtuVmZyL2hLaytrK3h3WjIz?=
 =?utf-8?B?TjN3Z0FjcXNZYkdzenRpYmZwbkRqRkN0cWVuQXZHb2xkeXJiRzA1YXE1RERU?=
 =?utf-8?B?OXBwY1F5bVhlL1h0elR3ZHpIbWhkWGNvN2VqRWUzMlc1U0wzclZ1Z2V5QnRP?=
 =?utf-8?B?Z2R2bHJMSkdleWgzU21CWTNyTE93TERXcjlhRVFldjF2VWZiUC81Vmd2M1Rn?=
 =?utf-8?B?a09Zb2h1dnpvUmsva0dHZ05CYUNZaEw2cFlFWXJ5L21SbU9kL2wwMVRLeC9F?=
 =?utf-8?B?TzNuZkFpcVhvR2o3TnZybHlWbFRFaHJ4c0ttYWZYdXZJVURUUElaRXJQaXpt?=
 =?utf-8?B?aURSNkVEaWpibjB5d2o4aU9LWEMwTkRGQkI4NENLVHAvNDhjVHJBdVJGRE1L?=
 =?utf-8?B?a2YwZ0lSUkpBVHVFc3FlUU02c3FKRnFWMVRYc2VVcng3eUJBRlkyOHcweEJh?=
 =?utf-8?B?ZDVmNkk3bUUrUDkyMVpBTmVua0hhUExEZE0xSDJMR1k5S01xMHVDdG1POHhT?=
 =?utf-8?B?Uis4TGJLb3d2c3lwb3BGampuRkp2MVJjQ1F0NU93c3h4VDhoM0Q0RDRsc1gx?=
 =?utf-8?B?SUJ2T3FzbkVic25EMDhGOWhwK3VKdUJ4Q1pudXQ4QWVQTjlrVERUdzBXSXJO?=
 =?utf-8?B?SitFTGJuNWUwZFVNQ1pPTy9mcHA4RnBIb2piVXV0Sk5VM25vQ2QxcFhraW5t?=
 =?utf-8?B?ckFLdDUyMlNQeXNjMjArbC9JemJvREt3MU93ZDZFdStYRldYbWhZcGZYZnBz?=
 =?utf-8?B?UW5hbTZaRE4xaXFCTStLcEh4UzlSaGE2K2NZc3U0N3V1OXVjek5JZjJCemF1?=
 =?utf-8?B?ejZQeEVJdXh4R0V5eWJOQlAxZXlOMWVzcnRCblh1dno5dTV4QjgraDNHMTB2?=
 =?utf-8?B?K0lkd0cxV3RVZXZ0bkJVaHYyR1VVMjhrVExnVkd6c0RPZ1kzano1NWRpVHRZ?=
 =?utf-8?B?bE1yNmlqWVJPOVFPOGVMRGNWRkhBTUgzc3NYbXkvTmQ2SXFjdWpnc3RyNTFy?=
 =?utf-8?B?d29MVzYvMDRqck9rOTVzS25mUzVSWVJjRmZVZHZJSkpOdjBxTjhZdHRCcml6?=
 =?utf-8?B?SVZraFZheXpwOTJ4bzJPR3JOd1dIcFE2dnQzMTY4ODhjbDlhVjE1aVJYVnhB?=
 =?utf-8?B?TzJ1LzJxVS9aQ28zZEhOSVBwcEEvU0ZtK2t5UW82QTRiajlIMEs4MEN4SDdp?=
 =?utf-8?B?a21KT0I0VWE0bGNQQ2dJQWRhanllSHFKZFRPc2tQdTNhMWJjQ2pKWkFMNEFV?=
 =?utf-8?B?cEc4Y1MyaVduT0JpbGRYL1RqNzZzV3NUOGZ2WkhDSnIxT2ZIUXZlRHdhamph?=
 =?utf-8?B?SUY1ZmY5TXprb0ZvNU5TanVaODU5cHpOemo0am5vQWFlbnI5VUl3a1lySWtq?=
 =?utf-8?B?QmlLQjliSTU5UlZTOGxTRGhyTWVsa3NvTjhYVGZ2VTZJNEcxOHVjZWE4WXRW?=
 =?utf-8?B?K09RN2dsanhaL3RtbXVYS3gzLzErNmNJdXcvQThNcVYyay85dGNCRW9HU2o2?=
 =?utf-8?B?UkRCRXc1cExDenkvdWpxZUhjb0IvVStXc2lDdjJmYXVENHc4bHVNUlhiRmNr?=
 =?utf-8?B?WnUvZVZ3RmNUd0RVczhHT3BkMTZvckdsaklNQlNQYno3L0xNdmVJMDdxU2I5?=
 =?utf-8?B?YXpFbG5aYk1BZ0tRZTNLbDdQM2JBQ1ZHTUdLOW9oa01WeWxTVjk1Rk1xK3ZJ?=
 =?utf-8?B?OE9FeHE0V2d1dGpzT0dXbzRJOWJwclhGNmhSdFp4SjlQYXJBMG12c3pJcHpD?=
 =?utf-8?B?NWVhQWFJWlZaTFdHYWw5eEkyQ3FTQXNJR2FOVVF3QkxoSHlGcVBoNDFDUGlQ?=
 =?utf-8?B?R0QxYVpNWU05RHVsUzZvMmxKZzFrQms3ZUZJYU14ZDUzWm5wQ1BvUzBVVVNy?=
 =?utf-8?B?Unp4YWFSWFo2Q0IyT1NRUGdNVURKU0dlc0RPejN3ajl0SDVjREVwTDJwZnlT?=
 =?utf-8?Q?NkVKWxITTZEsC6M+o5PZaiY2EcbbOhMysqCU0YO/EY5j?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 42d430f3-4df5-45c3-1c16-08daaa87943e
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Oct 2022 06:20:51.2157
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wk8okW8+0QOHJmFIuk+yGNSDo4yYgu0CUfIGHlreTzeM9p5Y7S2qavwKKN/EwWHEQ74u2rsOzsyr+s4ROZ5cWA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB9380

On 08.10.2022 21:08, Julien Grall wrote:
> On 06/10/2022 15:11, Jan Beulich wrote:
>>> ... the space cannot become ordinary RAM, then such a precaution
>>> wouldn't be necessary. After all hiding EfiACPIReclaimMemory from
>>> Dom0 just because it can't be mapped WB wouldn't be very nice
>>> either. I guess I'll submit v2 with this part of the change left
>>> as it was.
>>
>> And while already in the process of committing the patch I came to
>> realize that if the WB conditional isn't supposed to move, isn't
>> the change done for Arm then wrong as well? Shouldn't it then be
>>
>>          if ( !(desc_ptr->Attribute & EFI_MEMORY_RUNTIME) &&
>>               (desc_ptr->Attribute & EFI_MEMORY_WB) &&
>>               (desc_ptr->Type == EfiConventionalMemory ||
>>               ...
>>
>> leaving the EfiACPIReclaimMemory case entirely unaffected by the
>> change?
> 
> IIUC, the concern is the region EfiACPIReclaimMemory could have the attribute EFI_MEMORY_RUNTIME. Is that correct?

Yes, ...

> Given that the memory is reclaimable, I am not sure why it can also have this atribute set (to me it means the opposite).

... at least on x86 all sorts of strange/bogus type/attribute combinations
have been observed.

Jan

> But I guess for hardening purpose it would be better to use the version you just suggested.
> 
> Bertrand, Stefano, what do you think?
> 
> Cheers,
> 


