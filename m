Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 43FCA629F69
	for <lists+xen-devel@lfdr.de>; Tue, 15 Nov 2022 17:45:29 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.444025.698805 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ouz3V-0002t5-TO; Tue, 15 Nov 2022 16:45:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 444025.698805; Tue, 15 Nov 2022 16:45:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ouz3V-0002rE-Q1; Tue, 15 Nov 2022 16:45:01 +0000
Received: by outflank-mailman (input) for mailman id 444025;
 Tue, 15 Nov 2022 16:45:00 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=iTa/=3P=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1ouz3U-0002r8-NO
 for xen-devel@lists.xenproject.org; Tue, 15 Nov 2022 16:45:00 +0000
Received: from EUR02-AM0-obe.outbound.protection.outlook.com
 (mail-am0eur02on20610.outbound.protection.outlook.com
 [2a01:111:f400:fe13::610])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d7a64e82-6504-11ed-91b6-6bf2151ebd3b;
 Tue, 15 Nov 2022 17:44:59 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by PAXPR04MB9219.eurprd04.prod.outlook.com (2603:10a6:102:222::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5813.13; Tue, 15 Nov
 2022 16:44:58 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::4da2:ea8b:e71e:b8d8]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::4da2:ea8b:e71e:b8d8%4]) with mapi id 15.20.5813.018; Tue, 15 Nov 2022
 16:44:58 +0000
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
X-Inumbo-ID: d7a64e82-6504-11ed-91b6-6bf2151ebd3b
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JO/O6lZlrfuDjIAm5UZSjvKP30SSgEi2Vw8xF1B3RmJSCv/p5/ll+ZYTJ8nyzg6hClwQ6R37choEjHQlRgNZHv1SAiyIv+7KTDkoUuALOEdeH4Xys918xY96nyZEEcuWzQTEWxmfSm4JAC03jxhaLmz431G8VQZnLf7Sn4H2Ql0rKSEXxrAsU/ztDX3Px8mJWS+Wkvd9fhhroHgY+vPp3VbK44jC5A2xjXUMtCmQnIB5ymS2eAhb0xjwPGzMIajvpkcC+tpITe/KrIIWuhx7K6i/EJ17+A2GgpJsR7q9OUtUjUHPWatVd8Slq3qKP0D962BicSRYwYwsJppw9SE6BQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wGhslgKI/dGUIazKz+iL2ZtC2TcXPMBaZeUDTEtHdOo=;
 b=fIUYDZtxVyCcqgWqzNj7xcRcxok54CnLwQov7Cxvb3aLQSXU6iVGV3Y+PeqgaqKkgtGYzjS68Isjv8YmQkSB4bE1fiHKylYMTs/nrF/oB8FosIaHw19NELSZWPcVflb4wSGUaTF6GVnDU+N4PHAfsO508P/oEfnC/IJX85mwNNQvPdFYZcTOLpTXDtdi4IvnWw9j0ehMbQq0D3gS7fErzZHCUi/Vq1ZJJMTJkguiqaNc/dGDiEnwNO+c4h/0YgBKjmYEC3Z647GlXM97TG4KQXobpubiPLNPcuEC6KYboKR4/etituhxh0ypyTMamVrtt1gErkZFdazbjG/9sONgAA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wGhslgKI/dGUIazKz+iL2ZtC2TcXPMBaZeUDTEtHdOo=;
 b=iLcFmFFOfCVlYE7h2K5LjdaF0QkZmo22i1vrLmCQaxDfq9hO/sZQTH0rIsV2RFsGxO1IIdxJfHJ9MqvjEDeb347ug2JfuM/ihNuAaRX4Rzya1SzLkc5aHMJO8K7pJkteH8NnHvcTT6yQBxKOj6pgn/TfrevBL0EYChhoQM9l64FnkaHqY/08sv6UffBNapmy10Z7kUdBSZl4Zshfg82VD4+uGLg4mJ8RC9eK9Jre3CDhcUQS7VMkyDpiIi2YQh+BtWpdKFqM+/SKEpCHkcoOAy32bKjMH0n6+gj9Gq3ljWrgpJwymohe/O2uCpyINv9/Bo0+5TpxHPRv7WY6D22iOA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <5caf3930-ea8f-6e68-326f-93cca1fa210a@suse.com>
Date: Tue, 15 Nov 2022 17:44:56 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH for-4.17 v4 2/2] amd: remove VIRT_SC_MSR_HVM synthetic
 feature
Content-Language: en-US
To: Andrew Cooper <Andrew.Cooper3@citrix.com>
Cc: "Henry.Wang@arm.com" <Henry.Wang@arm.com>, Wei Liu <wl@xen.org>,
 Roger Pau Monne <roger.pau@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <20221115132657.97864-1-roger.pau@citrix.com>
 <20221115132657.97864-3-roger.pau@citrix.com>
 <c698b1e2-c047-1197-9c26-2239ea56c30a@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <c698b1e2-c047-1197-9c26-2239ea56c30a@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0114.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a8::16) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|PAXPR04MB9219:EE_
X-MS-Office365-Filtering-Correlation-Id: b4ee4748-4d4a-4ae4-2de1-08dac728bb1b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	j9vBlSaymn2GPpdN/ss6RvNg6gEmnU2Bpkmplj9NZysMZ+Rw/aVUDBmp0coWQuu+JZvPF5DjhJJVV4cp4C4LywNFdoe/33GZwCRUAp1Oljb0xF6CUgqDraT/ItZFgm5T2OyGzm5zMCnh/PNeYguo5gLjzEtnmd2+OOG0qvrBt71vyePwWi25n5D+EyBK4w1mBCvRyN11vmU6i1sQg/auE2IS2bv90sclHlSak35WSCEh6hMaqx7+cFqSGjrgcX2eEhJdwbSo9ECPpmdx5Kn31BItV9PmK+R/b9Y7aMCyifpKFqt74HyuggiA43PxuvzAnytTPCowxe4d/spmDJ94wwlDaq3B06+AQ0FUwkArJbZRSLmAkvIEqnvksWLKPcfCUk1KE6wF/goQp8dOIvcUyfFh7PaaReKUiINJWmgS59silCeO0vrqPqswPOBxkXWx97AM3gmPwSkeGgD19zfi1D34nkuEaJKNCfeewveLSM5t16rlgHdKEsZyEOVB026bvFYgay8W3zIWcThYD9AsO1UxdtYquUS+Z45v5nbGH6MYc2na5onu2Btw64BaFB/0Po7XSOfnkiGOMLWxQDzi+NaKXf5KPGXV/SpC3N16ZeXdvkFBIB158k1w+2pt38Dm8krWTM4NSI/5JPZvhWH2H8Y0/R3mR6qHcTLY7E3tlm80YuBrup+1hZWLhlGFU5AQZr4el4YKH+Rjo0g84UXUsmgtKpQUOsfcR05rfx5tU7TXy/Z8Rflx343AuMtYU7jPLR2lvo9wlFdf47VA2cJMSN88TH8ZuRM0lLQ9UN6pmPc=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(366004)(346002)(396003)(376002)(39860400002)(136003)(451199015)(6506007)(2616005)(6512007)(186003)(26005)(53546011)(38100700002)(2906002)(5660300002)(54906003)(6486002)(66476007)(41300700001)(316002)(478600001)(8936002)(4326008)(8676002)(66946007)(6916009)(66556008)(36756003)(31696002)(86362001)(31686004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?KzgveEVQSVFEcjFwYlBwdWl1OERvWVJERkpKVHRpZFUyNGtna0grVTBpTHBP?=
 =?utf-8?B?TnRDYkRlUE84Y1hXRmlOQzEweU9ZSi9odU9Eb1U2OWNXb2pFRDZmekp1Q3l0?=
 =?utf-8?B?WFl5b2ZaTXo0eEwwYjVlRlQ4UUNtVVlSZmRHa3pvcTJrOXpRcW1DeFpsZWRh?=
 =?utf-8?B?WllHZUNyNFFzekE2ampkOThtaGdFTTZYdjdoYjRxcnBaUUZJZnE4ak43UEIr?=
 =?utf-8?B?T1RWVE1qVnVJanVrYkFYRXpKaXptSGgrRUhQcG5zU3BZRU9palZGQWJZYWtH?=
 =?utf-8?B?U1NLZTN1ay9nZ1RPWVJLbllGV0RUOWVsV2tPU1lrL3piRnhWMC9MWWsxUXdz?=
 =?utf-8?B?Y2crRndWUm42TEEwNE5VUFF1Z2ticXpGYnlQdUFoRXR6TS9pbHZWRjJnbmdW?=
 =?utf-8?B?eVRDL0QraEdtR1FCZjc0WjdNV01mS0dpRUVsWjdpTy9vMGh1VFdWRkZXY0ZK?=
 =?utf-8?B?VDQxU1UxaEtCQTZJNWpUZTEvNGVLZVUvcW1GRi9xRG42enR6YVJvakhVd0xq?=
 =?utf-8?B?Mk43ekw4YUZkS1FDUG9Oa1FaSnFQam9tbHhVQy9rOHR0ZTlqZ0x4UStBZ3Iy?=
 =?utf-8?B?aitnc2V4aWV2QU9GaUxxS2laUHFCUVAvZ0pJLzlrZUZIaHhzSjBkM2ZKbmJv?=
 =?utf-8?B?TlpFbWtXSHo3SmF1dGxJaXJSd0VoTFhZMWlPWm9Nc1BFajd2b0NlTGh2NXlT?=
 =?utf-8?B?bVBiK3FtZk9IZXlaeERNbGlKUEFaaEJyTTBtajZuaEE4cnhMRDFPK1krRDNS?=
 =?utf-8?B?eWo2MkNMc3E3Y3N5dE5GRFRQdjdpTEV2L2xWaFg4L1VJeDJTUjZtNnVGZ2Fa?=
 =?utf-8?B?VWR3VTk3RlFVWUZaQys5cW5uQml4cFdocklocjZ0UE5yM2ZwZDNVaHFBWVdR?=
 =?utf-8?B?aG1mZXRhNmJkV2tLK3R5cDBVZzdhL3NoQzhKcndYbXZlSUlVRzhleGtoSysv?=
 =?utf-8?B?VFhOQ01iWVZncHhhb2JMUmk5aDlSZkFOU0owVUdRZmlWM0RBRW85OXNpL1dw?=
 =?utf-8?B?UEtJQnUzeEFQQ0tnSW9TdDRCRU1kbXRSYkZnWTZhZy84LzZEbXozS0ltS1Ra?=
 =?utf-8?B?WEJVSWZrb3BnZWRNR1o0cVlhdEQ0VHg0d0EzeVVXSHBqMno2cHo3andGbFdF?=
 =?utf-8?B?NmdlcjM4ZXNDZGE5S0JXZFNlbHdZVXFzKytxazE2YmdmMDRkK1N4aHVxVDFI?=
 =?utf-8?B?c2NOYXk2NlFaaGpLbTMzdnVrVHJFYW44SEhTd2k0MkFxQjdENEViUDdMQ3VL?=
 =?utf-8?B?SE1WWk1UYlpMN2N0WDZCbkJFNEFlVlNFcmdCdFhjT0dnOXNubU9ua1A2ZVJr?=
 =?utf-8?B?LzNDQWp1Tnc0VFBkZmpmcVZzTmNBcFhtQ1NKbUs4S09DWXlZQ1Y4NzhyWXpU?=
 =?utf-8?B?K1o4WnZrUUxVYVQ0c1ZUUnd0ZXVDTFo2Q3lGa1ViR0gyT1lOcFU4TzkyelpH?=
 =?utf-8?B?MGtVcEVqTms5czROdERYczNnWmRXd24zZk4rR2J4NGdXbzR3eUo3UHFwWWVt?=
 =?utf-8?B?QlZXc0lpKzB2dmJPWTM3NXVQQzl4SGhQSUsyZ2dnQlducXNmeTNKd01yYk0r?=
 =?utf-8?B?dC85dG11YVlISFBIYVFVSXZZNXNQMzRNMHFjVit6Qi9DYUpxQ3JUMVRWN21V?=
 =?utf-8?B?dXJscWo5bHRJWVFwMW1zamhMM1lGbURUU0JYS0NVc21sSUtzN2pvTERnTjA3?=
 =?utf-8?B?Sks5b1VNWExGSnNrUVd0b0ZneUhtZUM2VmtXM3hjem5EM1JUUnJ1TW0vclA0?=
 =?utf-8?B?YldRa3p6aCtKcTBoZ21PeGJUbzBzN2pZcVpac1h5RFdDd0ltQ1hOa05XZHhC?=
 =?utf-8?B?SUxoT0EzR0FYcFYyeE9ybDc5OE9hVVRVb0VTWVhXa3owUTh2ak5RUzRVUnJV?=
 =?utf-8?B?ME52R0ZlRFNFZ2Ryd3RHQVpnbFQzWHJQR0ZkcU1lc3N3T1pIY2Q4NUs2Rkxm?=
 =?utf-8?B?cll2QTNYUDBPd3V6TDhub0JMUTdnOUdjdFFEUisxVFNLeis4ODVhMkQ0R1ox?=
 =?utf-8?B?aUZjNlFUcDVqelgzZXI2RU9CdHJHM05xZmo2R0FTTDZUeDVpWnBzc001TVV1?=
 =?utf-8?B?Mi9PZy95bDZ4OXRkY0hPUSt6c3c0UnVnQ0ZGWVRIL21UOVpzME5OTWkvbjlF?=
 =?utf-8?Q?YsjUpEnpzrBZEEffZaw9m+EFe?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b4ee4748-4d4a-4ae4-2de1-08dac728bb1b
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Nov 2022 16:44:57.9180
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uV0zJUzEHrMOh4exFPQSvswR7rwKfPmnpvkR9OE1RLdCqjv2n4HXOzh0ggyWNkJVqPpwCwEfDpA6RHh//aFZCA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB9219

On 15.11.2022 17:21, Andrew Cooper wrote:
> On 15/11/2022 13:26, Roger Pau Monne wrote:
>> Since the VIRT_SPEC_CTRL.SSBD selection is no longer context switched
>> on vm{entry,exit} there's no need to use a synthetic feature bit for
>> it anymore.
>>
>> Remove the bit and instead use a global variable.
>>
>> No functional change intended.
>>
>> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
>> Reviewed-by: Jan Beulich <jbeulich@suse.com>
>> Release-acked-by: Henry Wang <Henry.Wang@arm.com>
> 
> This is definitely not appropriate for 4.17, but it's a performance
> regression in general, hence my firm and repeated objection to this
> style of patch.
> 
> General synthetic bits have existed for several decades longer than
> alternatives.  It has never ever been a rule, or even a recommendation,
> to aggressively purge the non-alternative bits, because it's a provably
> bad thing to do.

There we are again - you state something as bad without really saying
why it is bad. My view is that synthetic bits were wrong to introduce
when they don't stand a chance of being used in an alternative.

I agree though that there's no strong need for this to make 4.17. It
may end up making backports slightly easier, as no such bit existed
in 4.16.

> You are attempting a micro-optimisation, that won't produce any
> improvement at all in centuries, while...
> 
>> diff --git a/xen/arch/x86/cpu/amd.c b/xen/arch/x86/cpu/amd.c
>> index a332087604..9e3b9094d3 100644
>> --- a/xen/arch/x86/cpu/amd.c
>> +++ b/xen/arch/x86/cpu/amd.c
>> @@ -49,6 +49,7 @@ boolean_param("allow_unsafe", opt_allow_unsafe);
>>  /* Signal whether the ACPI C1E quirk is required. */
>>  bool __read_mostly amd_acpi_c1e_quirk;
>>  bool __ro_after_init amd_legacy_ssbd;
>> +bool __ro_after_init amd_virt_spec_ctrl;
> 
> ... actually expending .rodata with something 8 times less efficiently
> packed, and ...

... as long as you're talking of just a single CPU. The break-even is
at 8 CPUs (8 bits used either way).

>> --- a/xen/arch/x86/spec_ctrl.c
>> +++ b/xen/arch/x86/spec_ctrl.c
>> @@ -514,12 +514,12 @@ static void __init print_details(enum ind_thunk thunk, uint64_t caps)
>>             (boot_cpu_has(X86_FEATURE_SC_MSR_HVM) ||
>>              boot_cpu_has(X86_FEATURE_SC_RSB_HVM) ||
>>              boot_cpu_has(X86_FEATURE_IBPB_ENTRY_HVM) ||
>> -            boot_cpu_has(X86_FEATURE_VIRT_SC_MSR_HVM) ||
>> +            amd_virt_spec_ctrl ||
> 
> ... breaking apart a single TEST instruction, which not only adds an
> extra conditional merge, but now hits an cold-ish cache line everywhere
> it's used.
> 
> Count how many synthetic feature bits it will actually take to change
> the per-cpu data size, and realise that, when it will take more than 200
> years at the current rate of accumulation, any believe that this is an
> improvement to be had disappears.
> 
> Yes, it is only a micro regression, but you need a far better
> justification than "there is a gain of 64 bytes per CPU which will be
> non-theoretical in more than 200 years" when traded off vs the actual
> 512 bytes, plus extra code bloat bloat, plus reduced locality of data
> that this "improvement" genuinely costs today.

I don't see Roger stating anything like this.

I think we need to settle on at least halfway firm rules on when to use
synthetic feature bits and when to use plain global booleans. Without
that the tastes of the three of us are going to collide again every once
in a while.

Jan

