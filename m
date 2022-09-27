Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B454F5EC69F
	for <lists+xen-devel@lfdr.de>; Tue, 27 Sep 2022 16:38:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.412721.656135 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1odBjG-0000KE-TY; Tue, 27 Sep 2022 14:38:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 412721.656135; Tue, 27 Sep 2022 14:38:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1odBjG-0000HH-Qd; Tue, 27 Sep 2022 14:38:34 +0000
Received: by outflank-mailman (input) for mailman id 412721;
 Tue, 27 Sep 2022 14:38:33 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Kd8q=Z6=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1odBjF-0000H7-TK
 for xen-devel@lists.xenproject.org; Tue, 27 Sep 2022 14:38:33 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-eopbgr60064.outbound.protection.outlook.com [40.107.6.64])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0f180e73-3e72-11ed-9648-05401a9f4f97;
 Tue, 27 Sep 2022 16:38:32 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by PA4PR04MB7696.eurprd04.prod.outlook.com (2603:10a6:102:f1::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5654.26; Tue, 27 Sep
 2022 14:38:30 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::358f:58dc:c0c2:1155]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::358f:58dc:c0c2:1155%7]) with mapi id 15.20.5654.026; Tue, 27 Sep 2022
 14:38:29 +0000
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
X-Inumbo-ID: 0f180e73-3e72-11ed-9648-05401a9f4f97
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Za0r6dVn29wcvWU3JDso1EyZ4RaSwhvIEPEhkX/aGs7XX0nM3Ai/ALUZwVC9uaEo8hZ2oDt8aGeL3ZfjsOwq1dFKxah4xEmRBNjU3MeYlmYG78zRddJ/DG3RfXG++nlJHJiaqn574XcpuMvzI/kmHQ+IIpnm7NPCMRfRzLV5ob55kEABPD33kLTyaTNAjmsUsTn5FrCGys3ZaJu382o6jE5n82XljzNcRA0ge0wozzTdzgGxQjzfvY/xf0kKPPqLoFlLylOI++kjr0Cu7C7D0+oUzdzUb4aIb0ZcLwDpkbLu4sAD9Ta0w2tYsgMTMdX97YSForrshOvcO7dko7Caqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=65M9lXvXBp2v5RsA2yy8iL3oNSjyXqFGYBQhf5j/OBo=;
 b=aiBO7NUxlkBfX2i2tVQsPoljL8bmKcMk8M8tp+9FeCTDxVXBCffMLQo5VU6XGckMKznOu8Bi3KR4R2s2+0KVznG7sUygIyqp03MqjZ2mPsdA9PLwv0+FF6uqV9sP8kQ2FboDHO579KzBN1b9INk7he1RQgYaAUAC5tLkmEfKes7IbXU5ig1cI8arIIKS2kVTKSQHP138oe9fUvSQtaQzybSBl9FCyfqjSo8OPEW+vWqx+ANMjd7Zd5/FwJXqCnF4E49otOeKg/whycxOG7K6pYdn+uhzXY2unJ2PkW99Dp6dY52V22/+iH3iZUFB04MslEHfVwsCXlIp75DLKGQgbw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=65M9lXvXBp2v5RsA2yy8iL3oNSjyXqFGYBQhf5j/OBo=;
 b=pYD7cZ05kfoJ7V1EoN4AOakdX9MHoK9tGHV5Pg8aEvghLxXYWUtrN3g+XI2KARMSSzhabOqcg0JRwUvsPdZINEcHO3zPQ9E3djZdfSQPmvHCQqoMI/lzA0kVHRTV0Rn3Zed1+SCiijxk5NpO7X80UVAbzzzekuvC+IaRGqmkrtBYfHiWtNqbUpiGlW8y5i154aGXQfFSz1QRfaTQdpu/2vPtXJ6WCIQKe7eQ4Yr9UdS7Ceieec/9jaBilEbCfW/aNmXjNoTMRdS9/Reyans70YqkR5f20TSrpPwdOcqEE1bmcP5uE4ryxgMrJoEXDqYLiHPGPb9nfvnMkd08O26wNQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <ed906c15-692b-ca28-5b41-5c40ae9d1131@suse.com>
Date: Tue, 27 Sep 2022 16:38:28 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.0
Subject: Re: [PATCH v2] x86/PVH: restore VMX APIC assist for Dom0
Content-Language: en-US
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 Jane Malalane <jane.malalane@citrix.com>
References: <59767cf0-8b1b-4418-db31-6b711518c044@suse.com>
 <YzMJi3q7fNIiWL8P@MacBook-Air-de-Roger.local>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <YzMJi3q7fNIiWL8P@MacBook-Air-de-Roger.local>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AM6PR10CA0050.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:209:80::27) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|PA4PR04MB7696:EE_
X-MS-Office365-Filtering-Correlation-Id: f3502afc-7b76-4f0c-eef7-08daa095f1f8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	yq0+9MCjWCghJ/cCdzl8bwd+bAXfRUSIIyAZiB61AsUu44CsZG9niU4EIPpJ/l8NsYpz0GwJmXBgFaEBRCbtBEXp0j7IG0iPyAkgn80JIm1SzbEQCNZRj/dCzjcyxOczUGCpoBO0yWPW9/sADkSHqkQmtHnNue8F2hYtKfPAhI1ZzkzfiHrRsUsCM74PqcxdB8pdwe1225Qut9hVBAkxSZA0ULMdGR8bDheR0TQ6aZwXpPTN0wEfOkJFLDfmOgEpgU/gbUB/Yb9OX1wHnFRrEWbXbxVaH/iEoy2o84Iopz2b6a68KycagIqimyeps/NwZUp16m0Hpvp4qet1TPclxRKlCM1fMyrtAU3NjM4K51u3WFgvYv5EIAwaNzm+ziieCJzLkMPAryGcRiecoGacxtbwwMqj4+HZGcxUUy05aZqRPDGXLgwY3TU1+zuj4RH7CFaiEaL9mb4c6+7y+j47AtZlAio8xEDxzYGnYs6+LAzs1X2aR0iZNb9ZGOalXae4CQztykNC3hRf+e44l73eqTkRh/6Rb8yFxjxDsXrVCxJ3OnSwJzgq8ai5VdTJ0NyNcvnJgOks65AHG20bNth4qwdG8hxRw6pT6ukzpZIikNSJaIctEgMjvGDDVCSXqO3zO/ZT7izBBqaoQPK4BNEhvM/TzUeU0PkGmwOsbyPxGTeRR3WpyaAX8ROousuU39GmF4j4orEO4ePHD0VUzeOdDfn+p4d+xFl/8dmb9AenWANzYNKXsKZjbJvtiAPTg3GEpdD0dXitoFD7Gn3v2r5ntedqjz0IK7oPwvUizfsceL0=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(39860400002)(396003)(376002)(346002)(366004)(136003)(451199015)(83380400001)(4326008)(6512007)(26005)(478600001)(86362001)(316002)(54906003)(66946007)(66476007)(8936002)(66556008)(6916009)(31696002)(2616005)(2906002)(38100700002)(6506007)(36756003)(41300700001)(53546011)(5660300002)(66899015)(186003)(6486002)(8676002)(31686004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?OW5TRVo2NmhEVGpRN0pxK2kxSWR6enZwVlZGVHZHYjZiZVAwUk9ZZnlrMStE?=
 =?utf-8?B?R2V1M2VWeXpKU01ZN2RzNnczbVBQK3gvRXREYnVTdlNmc0E2V3NCSnMvcFhO?=
 =?utf-8?B?MU8zVFJlNFBjbEtxanJ2TXM5bGVPbDVEb1VIc1RvdkJtaVZmME9PTUsyRjEz?=
 =?utf-8?B?ZmdQTXpqdmlRWEZCNytzQ09zN2t2QXlrRmV2MkZjVjJXRE1kUzZPN1hGQmVE?=
 =?utf-8?B?bmJDTFgvU0pMdUtUSTllQXIwSlpUQzc2UkRMK0JTckhtQTlvaVR5UUdCUkxh?=
 =?utf-8?B?MUxHVlJVQ1JCNVI1MVdqNXVZa3Y0NzFCTmt4RVRHVGNaS0pnN1VjYTIvUFBu?=
 =?utf-8?B?eHZ5UGhaYWJyK0FFUXNIQkE4WUdUaCtVaElwUDFtL1JMUFRvSzROSjNuTjlE?=
 =?utf-8?B?bTVZS1BlakdMeFYzSGNsdFZzb3ZmUjZ4MEJHa0dNcGxHcGpCMFV0eG8rWTFZ?=
 =?utf-8?B?dGZlY1k0WldXVWxQbWx0MHlWT0xrNThtajYrdVlmcjVjeVdzeG1JR05VeFdQ?=
 =?utf-8?B?RDBBSUlEL2F2d2VuUHNCTnNMQXNpY1VsK21UVTA1Y091MmZlWW9teUU3OGs4?=
 =?utf-8?B?SExhcVNCaXpNVStRaG5wZlNqVkZ6bWdVUnY1c3U1WmJKOGRLNHAyZ0JOTDVw?=
 =?utf-8?B?cHNxdW81NFpwbnVJejNoVTQ5alZRZ1NGbTMvZTl5YXVBR3kzK1FHaVdCVEoy?=
 =?utf-8?B?Yk1MYi9MQ3dMN2M2bWpXOHYrY2xKOVl4TVphVHNCSlA4ajVvY1czV2dDek1K?=
 =?utf-8?B?ek5OUWxuZWlucXEzR2toQnE5ZHBackdOcWxweGh1NnJISGJldDJFZjl5VWk2?=
 =?utf-8?B?OVNYK0p1WDZlQVpqWEI2ekVlMHRrYjNpQmkwTWJabFA4OVZoSHB6MDJ0bzVG?=
 =?utf-8?B?NjcyODVSaC9NekJ0Z3NzdTV5ZjdVMHZmSlJ5UUlOWWVlLzVWT3JuUHo4aE1Q?=
 =?utf-8?B?bkcrTVMvSVpaRTNGWDhoOFNNWUtOYWRlcnp3Q2lIaml4bFdoOFpPb2tzOEll?=
 =?utf-8?B?QnZtTEZ1R3YwejduU3ZQK0hhVkRTVENmZVZIMDlmbDFnc2ltSzIvNWNhbDVC?=
 =?utf-8?B?SVZTRlZ0V2V6SjZVUUJPSkRicjFnd3h6aWlyelZyVUszQVV6YmpiYmo4Sy9y?=
 =?utf-8?B?NVlpN09kcWMySmt5L0wwMHdZbUYvbmlTUlJVakNhUEROdkNBb3JQQVZQUGVh?=
 =?utf-8?B?VVpzdW5UVEFxeGs3aGE3Ny81WFFUQ1RQOEJ1Y1IveWg2c0dqd0N3R3pNaTRU?=
 =?utf-8?B?ZFVVelZpa0p6T1QwVWJpSWpTYUN4WVlMeDNPQms0Rm55blMySTlIY3Q3T3NQ?=
 =?utf-8?B?ZW1jWHVRQWRpTkN3ais4WUxIbGxOMGZxc2Faak10WjU4M25OZW5uOW9tRW9D?=
 =?utf-8?B?QVhwNTJYVmNNZmNNTDZoR2ZBNU8xSEpiTHc3dkttYU0xUEs0QjNRTkxQdGZ3?=
 =?utf-8?B?OUFTbm5mbHlUV0s5QXlISE1heklDZVZaMjlhYmdPU0JLVkhnT3dPQWRkNG56?=
 =?utf-8?B?VGV3Y2RSZmJEVDFPaGZ0U3IyTG9vVEpTRkhrWE1mL3kvY3E3cXdsVzZVallM?=
 =?utf-8?B?U1NZWmo3MWQ3TGxZQUo3M2hHSmtDeW9OZzFjL3lRRzFUNWcxUThkakpPU1A3?=
 =?utf-8?B?WDl2S0dvZ3N3MjM0SEI2aGM1NTN5UHgxSjZGUEw5bm9RallqdGFIOWFQaXN5?=
 =?utf-8?B?ZW9zdnhLZFE2MEs4c3FqZDF4YTVIWGkrM0NTMmxaSFRhUXlRMWV3enZVZGxG?=
 =?utf-8?B?RFNCUkZZYy93WHZqS1RHaTVPWHlQekVMdmtlNysrbEJtZVBnNm0rZW9iQ0hy?=
 =?utf-8?B?OUhKYTBUY2VYVnFTVVFCbk5maEZMMm1peUZLMzlvWENPZlZXQ3kzcGNseEt2?=
 =?utf-8?B?R09RVkFmaHFiUld6TU5iRFRtdFVTQVFKTUk4bFdTQ2NlbGlUVzB1RTFhRUJN?=
 =?utf-8?B?blVUcE9FQitvN1JwdjdkSnRUNzNKaVJTVmRZcVpxWXBMNTVMVnVMblY5V3lJ?=
 =?utf-8?B?Ykh0dllDNExvSFdjRnpwMnZiVGNaTnFscXBXQWlvUm9aNWN5TDZqV2RCTitG?=
 =?utf-8?B?YVI3b1hjOHBYQ211aEpDeElzZ1p0b1FxSUt3amE5YWZncEVudUNLUFJsTzhm?=
 =?utf-8?Q?vy7LlJqXzziUGYWRuJzeTaWsi?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f3502afc-7b76-4f0c-eef7-08daa095f1f8
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Sep 2022 14:38:29.7947
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: j7n+iNcRy2vsbhdtxEOSGOzZnR07OplxMspoeg7Ti44N1Y2aqXm0BPuB5qvQYdHwFrQsMSZNqsom+Pd1mQqt7A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB7696

On 27.09.2022 16:32, Roger Pau Monné wrote:
> On Mon, Sep 26, 2022 at 11:58:34AM +0200, Jan Beulich wrote:
>> I don't expect it was intended to default PVH Dom0 to "no assist" mode.
>> Introduce command line (sub-)options allowing to suppress enabling of
>> the assists, paralleling the guest config settings for DomU, but restore
>> the defaulting to "enabled".
>>
>> Fixes: 2ce11ce249a3 ("x86/HVM: allow per-domain usage of hardware virtualized APIC")
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> 
> Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>

Thanks.

>> ---
>> v2: Guard the setting of XEN_X86_ASSISTED_X{,2}APIC by assists actually
>>     being available.
>> ---
>> Besides the issue caused here (the manifestation of which appears to
>> correlate with the other fallout Andrew is trying to deal with) I'm
>> observing further warnings, but I guess these have been there for some
>> time (perhaps forever): When parsing AML and encountering the objects
>> describing the CPUs, Linux would find entries with the original APIC
>> IDs. If those don't match the ones we assign in pvh_setup_acpi_madt(),
>> the kernel will wrongly consider the entries to describe further CPUs,
>> which it therefore would deem hot-pluggable. This again results in
>> warnings, this time "NR_CPUS/possible_cpus limit of ... reached".
> 
> Hm, I'm handling this differently on FreeBSD AFAICT, by using a Xen
> specific driver for the Processor objects when running as dom0, which
> replaces the usage of the native driver.  The only function of that
> driver being the uploading of the performance states in the Processor
> object to Xen.
> 
> I think we ought to do something similar in Linux and just use the
> Processor objects in order to upload the performance related data to
> Xen, but ignore anything else.
> 
> What happens on PV when the number of vCPU available for dom0 is
> smaller than the number of physical CPUs?  Does it also consider the
> unmatched Processor AML objects to be hotpluggable CPUs?

I have to admit that I don't recall for sure, and I'd rather not write
something I'm not sure of.

>> --- a/docs/misc/xen-command-line.pandoc
>> +++ b/docs/misc/xen-command-line.pandoc
>> @@ -767,7 +767,8 @@ Specify the bit width of the DMA heap.
>>  
>>  ### dom0
>>      = List of [ pv | pvh, shadow=<bool>, verbose=<bool>,
>> -                cpuid-faulting=<bool>, msr-relaxed=<bool> ]
>> +                cpuid-faulting=<bool>, msr-relaxed=<bool>,
>> +                assisted-xapic=<bool>, assisted-x2apic=<bool> ]
>>  
>>      Applicability: x86
>>  
>> @@ -828,6 +829,10 @@ Controls for how dom0 is constructed on
>>  
>>      If using this option is necessary to fix an issue, please report a bug.
>>  
>> +*   The `assisted-xapic` and `assisted-x2apic` options, defaulting to true,
>> +    allow disabling of the respective hardware assists.  These are applicable
>> +    to PVH Dom0 only, and their effect is limited to VT-x.
> 
> Explicitly mentioning VT-x here is likely to become stale if AMD is
> also updated to support the options.  I might suggest to leave it out,
> albeit I won insist if you have a strong opinion about it.

At this point the statement expresses reality. Imo the half sentence
wants dropping when AMD gains respective functionality.

Jan

