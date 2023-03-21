Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B75586C3771
	for <lists+xen-devel@lfdr.de>; Tue, 21 Mar 2023 17:54:29 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.512874.793213 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pefF7-0000Qu-80; Tue, 21 Mar 2023 16:53:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 512874.793213; Tue, 21 Mar 2023 16:53:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pefF7-0000P7-4v; Tue, 21 Mar 2023 16:53:49 +0000
Received: by outflank-mailman (input) for mailman id 512874;
 Tue, 21 Mar 2023 16:53:48 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=NAJ/=7N=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pefF6-0000P1-96
 for xen-devel@lists.xenproject.org; Tue, 21 Mar 2023 16:53:48 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04on0612.outbound.protection.outlook.com
 [2a01:111:f400:fe0d::612])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f149f93f-c808-11ed-b464-930f4c7d94ae;
 Tue, 21 Mar 2023 17:53:45 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AS8PR04MB8913.eurprd04.prod.outlook.com (2603:10a6:20b:42c::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.37; Tue, 21 Mar
 2023 16:53:43 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b%5]) with mapi id 15.20.6178.037; Tue, 21 Mar 2023
 16:53:43 +0000
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
X-Inumbo-ID: f149f93f-c808-11ed-b464-930f4c7d94ae
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GZ1VkEWNLV/yn6/0jk6eOGNf3G1duDA+5tf5JnKZSZShMB5uM72LvZG6sIeFWbV3WUTBAyQ2+SKkcGI+/dJBmvkFbWkCAlCS9An5pZkgaPdfRa7dblUx0NR+lLyh1QuL/4nghcM1aewP+6FFHcCmoaIpETBrIOncMAIO+2IeOTKjzkzf+2kVa16ylxdwcvubEfoBsAzVnmQ2H27udMb5GcV+E5pV74XsebTgXo3GWvpYNEv6t7pplJMkgnMRpDIo/yFKSe0IrjQcxu6nn/599XuXoNeGFMAByxY/fiPx+pgtYlNyQK4JATIM8HLEEcIePt90D1swUX+4q+Mz8povaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ov2QLAsh0Ur82YKHKClnz/dBB/typ6O84bEaZ56jzRo=;
 b=OYkag5pfpofnEEZ9guMpqbiIPkHPytXyvlnTJ2Mf+dmKePCelkD7D0qjxlYGHSe6CoLi77r1OJj5RngB0FKL+idxO5V5rtg92GmwIEQpg5+qOL9vSTVY/eAaidOKovu58yhMC9TCWSsajJPGryVIoR8xfBpZR1kIoIY7KXPont+GUn9Xf/WWJ7iQ0IzSkaaiZ7f1O8a3oiOg0JHxvCIK0RwM5OGnO3a98+2UgtsiLMf44YcMGR5IHJIWsPFdBSzZym4Fi5epnmQNIf0o97WFE9NmCLYM/XuBqtXkXu+GR10yoT0igRUfqy4Z4KAolNy+aGUALbFT3ExAgXRQmInDEw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ov2QLAsh0Ur82YKHKClnz/dBB/typ6O84bEaZ56jzRo=;
 b=kSmqKuL8cI/4hy9KoYV65b1Z+tPBdhbijNjCpU9IOeLek+dNX9MawIpFy+Saf7Cra5nwEgRg2o0OdVPHx/rRiTxI+y+eC4FQh+TWMq0fNDTz2oK/AhdBm1gZUn8QRdY2pENR6udfmvMriOv41+LJgvayOfuPN2fvJgVkd7UXxN4JiSyE91i1bqElw8A5bRbsR3MqbAM9YcH3crex1n/AzedpWedk3pAl5zwj+ZcsoucNxncdABVFIo8s9EkXZ6xClLULVEMQ7BZUE34Q7BBcVpZ91RuM+58On+xxg+NubKjtSyI/nNjZteu55/CL/hO8hXlvfePtaIyMZzAbrUdEpw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <1883c9a3-ad25-ac45-b1fa-d29e19b3cc14@suse.com>
Date: Tue, 21 Mar 2023 17:53:40 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [XEN v4 07/11] xen/arm: Introduce choice to enable 64/32 bit
 physical addressing
Content-Language: en-US
To: Ayan Kumar Halder <ayankuma@amd.com>,
 Ayan Kumar Halder <ayan.kumar.halder@amd.com>
Cc: sstabellini@kernel.org, stefano.stabellini@amd.com, julien@xen.org,
 Volodymyr_Babchuk@epam.com, bertrand.marquis@arm.com,
 andrew.cooper3@citrix.com, george.dunlap@citrix.com, wl@xen.org,
 rahul.singh@arm.com, xen-devel@lists.xenproject.org
References: <20230321140357.24094-1-ayan.kumar.halder@amd.com>
 <20230321140357.24094-8-ayan.kumar.halder@amd.com>
 <7d90ad7a-5daf-915c-2055-a27ca50d8581@suse.com>
 <e268e11b-8e93-c506-668b-c5c004b3aa06@amd.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <e268e11b-8e93-c506-668b-c5c004b3aa06@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR2P281CA0031.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:14::18) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AS8PR04MB8913:EE_
X-MS-Office365-Filtering-Correlation-Id: d2e41ffe-59ae-4646-ed96-08db2a2cd455
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	ZbLGtN2Ty48j3bNVigoFOHr1Jv789qtN4Zoqcrh9jPytSIkFJb7u4a+wzYghC9cDbJMhBr81PMFE416q/cVjhtEt/LV06M2ZOr7UgXXWW0FEkqkLmhHvJfl0aIKeVnlvGWlkkwg7F2Yo/qE5Xs4mT/ey6iWhIVUP/K49H1Emw/PMAYQhihFJWiT0lNHp2oFtyHpP21vLiX89D2Bmqnu2GdhAD+z9v6M2IDUOmH6YX4JcOsNm4UzhnMkGFFUK8wI8P94vmK0uSJuWRcPscPAfjY4YNb4FIdZhG0eTiiz7ZVT8NL+d5pLPa3uTAHyWBipiyxWLVrtDfRXJv263SbBbVv3J4VTm+f1DNYUBVXwLZJHpz3SV9mLOpAGsoB0+55ukrg/TVnxU8q+to0nONy2Y0QWRYKCJmSIs/eA2/JvpLmC/o20G1N/uB4y2chPtVTNZZMKGbNpd8ClrGie5DyPiJmrZpzH7UO6AivTLyzukofcah3msmcRPcohR8af1QmgqIw1uaAz7HQyZLAZlDRnYF4DH8Yl6U1GYKIhzt2Rno7bsP6/Eag1yYXYN6XjIQg6hKdgTaY0Ftz0OdB8+F30G2VLP4IFGbwIBXZP7r7McCciKDCCoi9LShsgS3tM3MliQEAKV0bENS3MFE0DDR404y/nbSCQDdolVFIaFUCAp1GEykCl1Q9u1tBWQIYe62yhhBUCy2yXU2c4w5C46mHswejFCzhsFCi+v2uuvTEMm3JY=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(366004)(396003)(376002)(136003)(346002)(39860400002)(451199018)(31696002)(86362001)(36756003)(316002)(4326008)(66946007)(66476007)(186003)(478600001)(66556008)(110136005)(8676002)(53546011)(6506007)(2616005)(6486002)(31686004)(6512007)(83380400001)(26005)(38100700002)(7416002)(5660300002)(8936002)(2906002)(41300700001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UTZaSmd3U1BKVm15S0hacnRDSGlOMFVsTUxha0lvMTVvMTRidnVTVUMzaDZO?=
 =?utf-8?B?Uytkc09yVU5ZM1d3Y1ZuSytvc1c4dXBUdkdnYjZiSUZlYTF3SGZsTm16aE9h?=
 =?utf-8?B?NDlOMVVOcXU5WEI4Y1FVdXlhOG8vbmIva0VLQkoySi8vK0twT0RaSFNxeXJr?=
 =?utf-8?B?L3U2U2xpaTFYVjk1OFNuQnlUNlNlVW03aWpmOW1Gclp6VmxITVBHNEpWYmhj?=
 =?utf-8?B?Z3FKM0xwR3FHU1BxVWFYMGEzbDB5bkRhMEhjb1Z3azlUSGNGUDNWMmN6QW54?=
 =?utf-8?B?QnJ0d2YvR1JnZE5STnc4NndiVDlicm54REo3QlhxMHVacFpyeEJSQ3BCR3FW?=
 =?utf-8?B?ZGljN0M5aXIveDIwRSt6Q0xVeGhTODJheXJBRzd2aGJ3Q2dkMVFCRnJGZHlC?=
 =?utf-8?B?OVF1amNqUmtsMEpiWU1vMjBMMmxPbGRNZ1FKRlZoVjBzVkZkYkxCSHNBN0VW?=
 =?utf-8?B?dHZYR0tJNTRoR3Fhcnlqa2NwZ3F4QlF6ZW0zaEhTYzQxajM5VVIwNzlwdFVN?=
 =?utf-8?B?WGs0Q1hhZE9qUHFzU2ZMUmZuWEQ4ZTRhN3ZRdTRqcVVMcUs2cFo3ek45ME5Z?=
 =?utf-8?B?RGt1QzhVUnZ2b3RrVUphU3lVZ0tPVXF2VmYvZzM5YnNNeEdvZ3VJbEx1RldY?=
 =?utf-8?B?UHJzaGhFVlhocytKb3VoSUVJcURJcGtMNkt1c1FGbndNVm1zME1jQ012L0NS?=
 =?utf-8?B?QXdISytjTk5kMmxUbk9DZlIyTGxveE1la0RMYVM0R2xiUitTQ3BSVWZVRlVl?=
 =?utf-8?B?cTdBWHBWSldhd003WmozakVnUDVRNVNZQXd4SmtNc09BTmFFYlQ2UlBJZkFw?=
 =?utf-8?B?OUlwRXlEN1VUMnhmWTd1dHUzR0lGZXR2YmhOVURwbFlKM05UWXFZTnp1UzY5?=
 =?utf-8?B?UFBQRnMwT1hubnQrVWxTNUZUcVV3aWhwMXcvelZNNE1nc0NjU3dwZmZLYTJB?=
 =?utf-8?B?QlZYZEIrc0RLcVBsTFJ0MmdhMUduSjlZSncvaWwxWmVnNEtFWW5CajUyQ2xu?=
 =?utf-8?B?Sklxb3ptbmJIcFBNdUlhMjlXWDlxUDVORjBEMzc4VGM1S2Y0MmdQbDBROGRY?=
 =?utf-8?B?K082cEdUUG1vYS8yQlhJcU50WlkzeGdxZzFYSjgzRkV3Y2dhSml2MDM4bGpx?=
 =?utf-8?B?ZVBqMjlBeG01SGxkMk5Kei92bFE5U3NkQm10YlQ4RUIrOHFsQnNuVzhzSDBV?=
 =?utf-8?B?UTZtZUJiVmREdmtpV1hzYy96WUV1Z3BPVlM2THdDZW9aMTVFdEIxS3pRdDBM?=
 =?utf-8?B?eVJHR3ZXTFFEY0hhTVBQdEZnNHdmWVVsQVJDa3FhekRGYUc0UFIyMVFDemhz?=
 =?utf-8?B?dW9Bd0J1MGZOR2k3cGw3aUhxclJkMS83dHF1ZFJkMHBNNTU2enEvRXl2UUhi?=
 =?utf-8?B?Q0YxMXZUaElXTTR0S01ndlh2Z0xpNTFlYklEUU43U0VWcEk0QjlpcG1VL29W?=
 =?utf-8?B?VDQ5Wm5mMFd1V25ISUlQeEtEdElYcjB5b0RjNHFiNjJlbmtxbHBjMUNOQkNW?=
 =?utf-8?B?V2pNakVCNmVqMXhVeHFYKzByUHh6SzAxNVhydVZXTlZlbGRGWW1yb045eEVi?=
 =?utf-8?B?cDZYanFSb1FWYUxiME9BdUYwMVFUekpabDVDeEFwbG12UHJEa2JHY2J5UlNw?=
 =?utf-8?B?YkQ2QUdZK0c5TEFUWFB3WFV2U1lNSjliaWl0cjlnYTJkR1JTOG1zQWxEWEJt?=
 =?utf-8?B?Zmozc2lXT0JuL2hJa3Jzakw1STJsaXpYcjdKSHE4YWs1b0pOZVlpSjNPb0Vs?=
 =?utf-8?B?amJTZmhtbDBwMHVBNkdQSW1zWEM4NURBNmp6U1dHWTduUVRhTVV3eUFFZ0ZS?=
 =?utf-8?B?UEc0WEZmckM4WWgxMzMyM2lrWUZPb3NoZkh5QXBxMC9Gdm1ZbzI2ZWtzV0tw?=
 =?utf-8?B?VHc4NlFGcDNmcnhnK3d6U3hPdFJXZUh5SHEwTHNjUVZ5YjIvUEViNmlBOXFJ?=
 =?utf-8?B?U3lLWjVlSUFGdFZZNFFWa2FHOUEwV01IZTkxS3cyME5ZQ2RKbXNmZ1d1Qnl1?=
 =?utf-8?B?cVNFRlhPeThueEdVQk5uejVFQUdaVXg1OEVoQTdsRXJJQTF2NDJjR3lURkdF?=
 =?utf-8?B?VkdSdE8wUHBnbHJPcEFDNE5hTUY1bUw3Qk8raCs3MUROeHhqNTQ2L1RIaDVn?=
 =?utf-8?Q?e+q4ipYt49lSHBw4eprKZas92?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d2e41ffe-59ae-4646-ed96-08db2a2cd455
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Mar 2023 16:53:43.3792
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lPg5qjzwmldRlRwRlNCpqsfFKaJQ5l9yeAIBY4jHxSRHCzX2jZbILJd4TcQyG19sGTPaoMUdNb1oAV57lUlHGA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8913

On 21.03.2023 17:15, Ayan Kumar Halder wrote:
> On 21/03/2023 14:22, Jan Beulich wrote:
>> On 21.03.2023 15:03, Ayan Kumar Halder wrote:
>>> --- a/xen/arch/Kconfig
>>> +++ b/xen/arch/Kconfig
>>> @@ -1,6 +1,12 @@
>>>   config 64BIT
>>>   	bool
>>>   
>>> +config PHYS_ADDR_T_32
>>> +	bool
>>> +
>>> +config PHYS_ADDR_T_64
>>> +	bool
>> Do we really need both?
> I was thinking the same. I am assuming that in future we may have
> 
> PHYS_ADDR_T_16,

Really? What contemporary system would be able to run in just 64k?
Certainly not Xen, let alone any Dom0 on top of it.

> PHYS_ADDR_T_128. So, I am hoping that defining them explicitly might help.

Yes, 128-bit addresses may appear at some point. Then (and only then)
we'll need two controls, and we can then think about how to represent
them properly without risking issues.

> Also, the user cannot select these configs directly.

Sure, but at some point some strange combination of options might that
randconfig manages to construct.

>> If so, what guards against both being selected
>> at the same time?
> At present, we rely on "select".

You mean 'we rely on there being only one "select"'? Else I'm afraid I
don't understand your reply.

>> Them being put in common code I consider it an at least latent issue
>> that you add "select"s ...
>>
>>> --- a/xen/arch/arm/Kconfig
>>> +++ b/xen/arch/arm/Kconfig
>>> @@ -9,6 +9,7 @@ config ARM_64
>>>   	select 64BIT
>>>   	select ARM_EFI
>>>   	select HAS_FAST_MULTIPLY
>>> +	select PHYS_ADDR_T_64
>>>   
>>>   config ARM
>>>   	def_bool y
>>> @@ -19,13 +20,48 @@ config ARM
>>>   	select HAS_PMAP
>>>   	select IOMMU_FORCE_PT_SHARE
>>>   
>>> +menu "Architecture Features"
>>> +
>>> +choice
>>> +	prompt "Physical address space size" if ARM_32
>>> +	default ARM_PA_BITS_48 if ARM_64
>>> +	default ARM_PA_BITS_40 if ARM_32
>>> +	help
>>> +	  User can choose to represent the width of physical address. This can
>>> +	  sometimes help in optimizing the size of image when user chooses a
>>> +	  smaller size to represent physical address.
>>> +
>>> +config ARM_PA_BITS_32
>>> +	bool "32-bit"
>>> +	help
>>> +	  On platforms where any physical address can be represented within 32 bits
>>> +	  , user should choose this option. This will help is reduced size of the
>>> +	  binary.
>>> +	select PHYS_ADDR_T_32
>>> +	depends on ARM_32
>>> +
>>> +config ARM_PA_BITS_40
>>> +	bool "40-bit"
>>> +	select PHYS_ADDR_T_64
>>> +	depends on ARM_32
>>> +
>>> +config ARM_PA_BITS_48
>>> +	bool "40-bit"
>>> +	select PHYS_ADDR_T_64
>>> +	depends on ARM_48
>>> +endchoice
>> ... only for Arm. You get away with this only because ...
>>
>>> --- a/xen/arch/arm/include/asm/types.h
>>> +++ b/xen/arch/arm/include/asm/types.h
>>> @@ -34,9 +34,15 @@ typedef signed long long s64;
>>>   typedef unsigned long long u64;
>>>   typedef u32 vaddr_t;
>>>   #define PRIvaddr PRIx32in
>>> +#if defined(CONFIG_PHYS_ADDR_T_32)
>>> +typedef unsigned long paddr_t;
>>> +#define INVALID_PADDR (~0UL)
>>> +#define PRIpaddr "08lx"
>>> +#else
>>>   typedef u64 paddr_t;
>>>   #define INVALID_PADDR (~0ULL)
>>>   #define PRIpaddr "016llx"
>>> +#endif
>>>   typedef u32 register_t;
>>>   #define PRIregister "08x"
>>>   #elif defined (CONFIG_ARM_64)
>> ... you tweak things here, when we're in the process of moving stuff
>> out of asm/types.h.
> 
> Are you suggesting not to add anything to asm/types.h ? IOW, the above 
> snippet should
> 
> be added to xen/include/xen/types.h.

It's not your snippet alone, but the definition of paddr_t in general
which should imo be moved (as a follow-on to "common: move standard C
fixed width type declarations to common header"). If your patch in its
present shape landed first, that movement would become more
complicated - first and foremost "select"ing the appropriate
PHYS_ADDR_T_* on x86 and RISC-V would then need to be done there, when
it really doesn't belong there.

>> (Using "unsigned long" for a 32-bit paddr_t is of
>> course suspicious as well - this ought to be uint32_t.)
> 
> The problem with using uint32_t for paddr_t is that there are instances 
> where the paddr_t is modified with PAGE_MASK or PAGE_ALIGN.
> 
> For eg , handle_passthrough_prop()
> 
>              printk(XENLOG_ERR "Unable to permit to dom%d access to"
>                     " 0x%"PRIpaddr" - 0x%"PRIpaddr"\n",
>                     kinfo->d->domain_id,
>                     mstart & PAGE_MASK, PAGE_ALIGN(mstart + size) - 1);
> 
> And in xen/include/xen/page-size.h,
> 
> #define PAGE_SIZE           (_AC(1,L) << PAGE_SHIFT)
> #define PAGE_MASK           (~(PAGE_SIZE-1))
> 
> Thus, the resulting types are unsigned long. This cannot be printed 
> using %u for PRIpaddr.

Is there anything wrong with making PAGE_SIZE expand to (1 << PAGE_SHIFT)
when physical addresses are only 32 bits wide?

> I remember some discussion (or comment) that the physical addresses 
> should be represented using 'unsigned long'.

A reference would be helpful.

Jan

