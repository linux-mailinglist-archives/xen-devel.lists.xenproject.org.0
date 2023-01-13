Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E9646669361
	for <lists+xen-devel@lfdr.de>; Fri, 13 Jan 2023 10:54:15 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.477012.739506 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pGGlB-0007Jg-2a; Fri, 13 Jan 2023 09:54:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 477012.739506; Fri, 13 Jan 2023 09:54:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pGGlA-0007Hh-VL; Fri, 13 Jan 2023 09:54:04 +0000
Received: by outflank-mailman (input) for mailman id 477012;
 Fri, 13 Jan 2023 09:54:04 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=grKZ=5K=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pGGl9-0007DD-UR
 for xen-devel@lists.xenproject.org; Fri, 13 Jan 2023 09:54:04 +0000
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur01on2044.outbound.protection.outlook.com [40.107.13.44])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 35b4ebe3-9328-11ed-91b6-6bf2151ebd3b;
 Fri, 13 Jan 2023 10:54:03 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DU0PR04MB9250.eurprd04.prod.outlook.com (2603:10a6:10:351::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.18; Fri, 13 Jan
 2023 09:54:01 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2991:58a4:e308:4389]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2991:58a4:e308:4389%7]) with mapi id 15.20.6002.012; Fri, 13 Jan 2023
 09:54:00 +0000
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
X-Inumbo-ID: 35b4ebe3-9328-11ed-91b6-6bf2151ebd3b
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BVdoENX27JL4Mrz/aOpEKhUxpM7RQ1IVOUK01w2nrtcFGoEeqcm2uLWjXvAQIoyLSqIJ4TnRuBqsCqjmPY1FDPvBuAHQcO1UnG4KPtlH6iqWbzrRo2edR6F6Hqw/Y7eQ3jg6WqasqsR8WPHHfIHSoXJrmjbQOCCWdOvGgsfhjOFLqKf79mtvvjT3TeXW8arAHdqKo5A0W36na+Kks9SMQW/p+nvoJ+hQtggF/JvRxHxTAlGWXEe1KSHSZxC22EtyETotV19fIGMfxbF5CmKVgHdJSn5uULIBo8mln2YSIEqhCYPU6duU7eTrqHlwVFRM2iGKCHNt0Qos0Ggh3B9W/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FJyyx2XM3spic2azCfq9ReCKuK7+wPLVqDPl28tL3ao=;
 b=KhXemElA0fHyYlcJXXXohF0HgaE4gI/Og9+2ELYeqzqV8mSaKZ6sMLWWF/bmSCFaUJ5viVqe0lsgfwoSon9dmTeyRqmesrMvv9OeiQCV6uJRpZwCsUEo46GIdJY7FtBDO1q1CCf0ID+VA0FleswS9JNGiFtvUijYvGRLSKbCrp+QBnf1ob93ikDT/JOths+/Y+soRIc19UIrsol/cPxqeBZ/e9WP4BzGTc3j3rp3SXRCaB0pVRaC9z15Zz2KWiOm4zPS0OI0Rvh8BDdSDL5+v1zTKBtMd7o2SaDoxWt/VmZSTvBWJOmHcjSqwLQ1plavdr0sPhC/dWBNzmrHgNxmaQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FJyyx2XM3spic2azCfq9ReCKuK7+wPLVqDPl28tL3ao=;
 b=RjmVNvc7KkHQt5OQnNRyKs6QXrOJ3Eyk9uqfBCZwfV+zPxRGXgMkN8D7Roy9owbRjImzNdlDa2aYmhJxbCHb/72ad5xOeEDKrA09GZWKc8y6uxzI85YZNufImCHE0R/9JYATww/8GhSLSml6UjkRTrSAPxfiZnTuQYSEKZvEp+e/SAdHIkLHaMmnFggCgoNa6545ZVymo7J7vKUrlkzoTGJtBVej9RXnY1tYy18a5hRrOT1bSKTViKey6QeNL6Z1XGZGqrgFHUhDoHvpLe490Z/X8EuigUH8AKfopvKin6zf6TB5llFt4f8VI5PPWv3uTqfff4sbR2AJa0p3GAnVuw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <88e3ec77-587a-ae68-a634-fed1fa917cd7@suse.com>
Date: Fri, 13 Jan 2023 10:53:58 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH 1/2] x86/shadow: sanitize iommu_snoop usage
Content-Language: en-US
To: Xenia Ragiadakou <burzalodowa@gmail.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Tim Deegan <tim@xen.org>, George Dunlap <george.dunlap@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <01756703-efc8-e342-295c-a40a286ad5f1@suse.com>
 <cf0ed06f-4d49-0f73-cfd9-eb49e951048c@suse.com>
 <6596d648-6400-7907-bc21-8074dc244247@gmail.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <6596d648-6400-7907-bc21-8074dc244247@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0039.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:4a::11) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|DU0PR04MB9250:EE_
X-MS-Office365-Filtering-Correlation-Id: d456853b-779b-4734-1e83-08daf54c185e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	/ZrCWPwd0hPwJIRSkBxu2uXJbu6oXfxO1SKN3TQYTpSAGWEe9ywGxhLO0NaKZma7DgyIjYcBCSkKuhB7GfuAxr0feczrW5abwicHY8IG5FaoG3nwaMh0DMaufCz0XinAh1+f19SJPEvu7dh6laXgSi5nxXNgvSyrcY+RzeqFEAmcwZHKhlSQOTDguZQxVIn4FQSYPBvQC5nMcpamAIrHgcJny0RySE3YHGQRsLaZJFEfK5Mgyo2D59rrNyT1ONDZ5+g1GympHDlYmwHzcKgcaQLEoAAP1r4KDyRKed4uxz5A2bzpp8l62a3TFK/YPdRldH+DQnL7LZv6VMpmkd9VkvKQuFINo5l9vsBzmSjKg4B6m+lxO6UC1Y1hZYrqIpZGrEo1iaj0JR6Ers5opwLewhqPjztwe32S2d+bvItTgHgd7zP09te6dXywkmV39vJKwm4Eun51dLrg3bb77S1SyJu6NHFAw+fSkAgx4ymc2lyXAZ6HR7WCJhKx+JQp0ttLz+5COh3zgo536nveHr8e1hyIuWSgkdoeVqNOacxvEWeaeTtOUDdYcBLFPDia5QlzQua856Wr1XSsmpijN6Fv2WrMcAx/IdG0EjAvNlK3L61gTEI5/R2xU0oq8HVhZVhZB6evnScfywn1kBCqPLs6pMXCCeKRn7rwn/zNjV8LQ+sjG2jD4NfGoO+vVCHPMLT6voWjruAM53980iwmEKXIEOs9Q0vyBtgxfe5fHnlWj9QY837CBy//PHndZ3TRce39SdAEfwuNJukw8GT5fz87HA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(39860400002)(396003)(376002)(366004)(136003)(346002)(451199015)(53546011)(2906002)(6506007)(966005)(6486002)(478600001)(26005)(6512007)(186003)(31686004)(54906003)(36756003)(4326008)(6916009)(316002)(66946007)(66476007)(2616005)(8676002)(66556008)(41300700001)(5660300002)(83380400001)(38100700002)(8936002)(86362001)(31696002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?OS9hNThWMHplek14VUlzK1N2Tzg2REtKZ2Z3TUR2ZVh3N2ZHU0wxVWFSVjEv?=
 =?utf-8?B?YkRwdkhzcS9SMWFKNmh5VHNPd3JOMGQ0djRISmUwL1ZhUjAvQ25mcjBNeHlU?=
 =?utf-8?B?THYxRVJqTkV0amdNU0JuVDVXbm5FanMvYVhQaUpiaHpObzhLYkVZNWFjVUlR?=
 =?utf-8?B?WW1qQjdGa0tsS3hwL0JtRzVPV1prUDdTdTU2L01EenBJSFY5K1JCZ0tzTUI3?=
 =?utf-8?B?SElhM1ZHaFlBQ0kzUkZuUUM5bFBOMkhoTGcwM2ZSS2szTG5KZGJLL2xjWmFO?=
 =?utf-8?B?SUtGdjg1NzF6dlZUNmJCSk9VNFNDM1lWUzFOZlNtaDdDUktGWG5yTFNrVEYw?=
 =?utf-8?B?aFR2R29uT0dWaERHUC9IYnBHcWYvTTIySzVhVzBhcnpTMHQ4QkRVcENyekFM?=
 =?utf-8?B?Nk10LzJrNk5Jc0JzMmVpSmYyZnlYK2x6SUUyamk2UlJUMWl1THpPamsvRjFB?=
 =?utf-8?B?RFBWbVIxeUt4MDc4UGN5Q1c3K3o3bTVRNi9GZ0VlODBiakJnY2N0SSttaEgy?=
 =?utf-8?B?djNIcHZ3L2haWS9ZT05JQTRIamlRdFBuOEV1UjZPUGV2cWdyUTdCMEhXMENi?=
 =?utf-8?B?bmlkejFJMzk2b0xZN0JhelBVcDg0ZG4yemcrTzJ6aStkTC9CYWRhWFZVVzBN?=
 =?utf-8?B?MEZTNFUyTEVkL29VNGdDUkZkbnZ2Ty9NcXZYbjhta2dsV1VoVTJVR1Q3aHJM?=
 =?utf-8?B?bzUzeXU4VTRMSkxvYlkxZE9nL2hkSW1DU2c4aFlzc1QrNGYwYWJ2aVBHcFVC?=
 =?utf-8?B?MTFPNmxoV3lBcWhoODM0YlRROGhRbFU1OHZaUDRWL2xyMTlVa0t1ai9KVExK?=
 =?utf-8?B?Y3hqdkg3WHA5bkU4aWxtS283cERGbHhmUUJmcmF3TzZoSnI3dytJajlmMDZn?=
 =?utf-8?B?d2hCM0JxQ1grQyszcERjNHcyUk5qaWQ4dXJwZUZBWHpxRFBtQlZHc0gwb0Y4?=
 =?utf-8?B?bmZoSHdscHo5OU1Lb09XQm9oWVhDdEgwWmVQcENFcDRyUEl0U0xvaXpHSkd6?=
 =?utf-8?B?c3dUenhOS3VIUFdmTHdhNXEvV1l2UUREbU9MVVNaNDZDd09yZms1ZnlCUUIy?=
 =?utf-8?B?Z1lCNnMzQ2FJMGRmd2FoTGhqMU8wSndwYmZsNlJuZVVJS2N4SFZBZU1VaCtm?=
 =?utf-8?B?WGlVWkNTNEttQzdFZ0srVURrS3g2YU5iZ3pHNmM5K1E0WXBienZxRGYyZzNF?=
 =?utf-8?B?OFo2bUdZZEU5dW1jRXZXTnlmSkdjU0xPOGhaTWlURm16Y1NhN1BVcFkwaURP?=
 =?utf-8?B?dmd2bmc5QTNpQWxVUndlSGVhTHBsRUpCR09zZDNzSWRSRWZaOWtXUlJQb29K?=
 =?utf-8?B?WSt2SCtmeCtaVlNZY01iUVRobkQ1bFdic1BOTzNqTEs1SHBxY3RzM1h4amZq?=
 =?utf-8?B?Y0RuWHNmY0ExME1vcDJIb2JiRHFYL0J4TWFZQmNmTGN0UGl0aHk0UFY2cUg2?=
 =?utf-8?B?UjEwZkFCeWxRM3d6eHJRL21FQ3c2NUZlZnJrNTFlSjlpL2NkS2diNkVxWjB3?=
 =?utf-8?B?cnA1NjZKZ0Z4K0YyL2hTV0dYNVFpclhCdVdpdmo3cVRVRjg5Y0ZlNU1HRno1?=
 =?utf-8?B?TWVVNjJBek0ycEFqYzhYbGlybjB3cmRBUjhaSU9QbnNORWFXUGFuUWIvUC9o?=
 =?utf-8?B?WWZBQkdEaXhPT21RenhCeHcrREg3dWFXWEV4MnNUY0tRSUpjOTZhc0pDaWxF?=
 =?utf-8?B?WG00N1E4Um1vNXM0YWFHN0xLalp1OHU3R2J2MUVWNXNYbEt1c3BRT3VYRk5Z?=
 =?utf-8?B?dDgwdkJOMzgxWEJiZUFzT3VkQlgwWDBJWjY3Qy9KVmRTRVkvSzlHc2tsSzZ4?=
 =?utf-8?B?RFMrcmRKbmJ2SEZSOTFFTG95ajdtWWQwd3kxMSs3MTEyMjBKeDc2WTczMC9B?=
 =?utf-8?B?dzlDYVBBKytkbUVuSmovbWt0R1Y0dENCUm1pS3JzaUVYR0g2V1B2N3Uxb0Ex?=
 =?utf-8?B?dEpZRjl2UU91bnZFQTJaa29XMjViSGhoenR4Q2dadTE3THdyYWVhZDExVlZt?=
 =?utf-8?B?VjZmV2ZZM2c0UXNMNzRZNGkzNXZCcVpwQ1M4dWE1WnkrQzJYMmQzTnpVV0xG?=
 =?utf-8?B?TE1mYWtuZncwQkZobmZ3Mmt2cWpYNTdyRHpCd0xyVjN1YUFOVFBNcDNCSGI3?=
 =?utf-8?Q?dG+QeccbWhy5v0EDFVsTDtUyk?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d456853b-779b-4734-1e83-08daf54c185e
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jan 2023 09:54:00.4143
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 208b2rHInIfjXRQjYl5zDRsdes5SvlWPvMvGwPHqZ1+Z3vbhbCG9ey+czWV7a46bQ//Ra19oR3XgJ0gi3Fc0Pw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR04MB9250

On 13.01.2023 10:34, Xenia Ragiadakou wrote:
> 
> On 1/13/23 10:47, Jan Beulich wrote:
>> First of all the variable is meaningful only when an IOMMU is in use for
>> a guest. Qualify the check accordingly, like done elsewhere. Furthermore
>> the controlling command line option is supposed to take effect on VT-d
>> only. Since command line parsing happens before we know whether we're
>> going to use VT-d, force the variable back to set when instead running
>> with AMD IOMMU(s).
>>
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>> ---
>> I was first considering to add the extra check to the outermost
>> enclosing if(), but I guess that would break the (questionable) case of
>> assigning MMIO ranges directly by address. The way it's done now also
>> better fits the existing checks, in particular the ones in p2m-ept.c.
>>
>> Note that the #ifndef is put there in anticipation of iommu_snoop
>> becoming a #define when !IOMMU_INTEL (see
>> https://lists.xen.org/archives/html/xen-devel/2023-01/msg00103.html
>> and replies).
>>
>> In _sh_propagate() I'm further puzzled: The iomem_access_permitted()
>> certainly suggests very bad things could happen if it returned false
>> (i.e. in the implicit "else" case). The assumption looks to be that no
>> bad "target_mfn" can make it there. But overall things might end up
>> looking more sane (and being cheaper) when simply using "mmio_mfn"
>> instead.
>>
>> --- a/xen/arch/x86/mm/shadow/multi.c
>> +++ b/xen/arch/x86/mm/shadow/multi.c
>> @@ -571,7 +571,7 @@ _sh_propagate(struct vcpu *v,
>>                               gfn_to_paddr(target_gfn),
>>                               mfn_to_maddr(target_mfn),
>>                               X86_MT_UC);
>> -                else if ( iommu_snoop )
>> +                else if ( is_iommu_enabled(d) && iommu_snoop )
>>                       sflags |= pat_type_2_pte_flags(X86_MT_WB);
>>                   else
>>                       sflags |= get_pat_flags(v,
>> --- a/xen/drivers/passthrough/x86/iommu.c
>> +++ b/xen/drivers/passthrough/x86/iommu.c
>> @@ -56,6 +56,13 @@ void __init acpi_iommu_init(void)
>>       if ( !acpi_disabled )
>>       {
>>           ret = acpi_dmar_init();
>> +
>> +#ifndef iommu_snoop
>> +        /* A command line override for snoop control affects VT-d only. */
>> +        if ( ret )
>> +            iommu_snoop = true;
>> +#endif
>> +
> 
> Why here iommu_snoop is forced when iommu is not enabled?
> This change is confusing because later on, in iommu_setup, iommu_snoop 
> will be set to false in the case of !iommu_enabled.

Counter question: Why is it being set to false there? I see no reason at
all. On the same basis as here, I'd actually expect it to be set back to
true in such a case. Which, however, would be a benign change now that
all uses of the variable are properly qualified. Which in turn is why I
thought I'd leave that other place alone.

Jan

