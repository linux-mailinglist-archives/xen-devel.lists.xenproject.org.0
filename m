Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E2B679E97B
	for <lists+xen-devel@lfdr.de>; Wed, 13 Sep 2023 15:37:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.601331.937347 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qgQ3t-0000z5-J8; Wed, 13 Sep 2023 13:37:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 601331.937347; Wed, 13 Sep 2023 13:37:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qgQ3t-0000w9-Fr; Wed, 13 Sep 2023 13:37:45 +0000
Received: by outflank-mailman (input) for mailman id 601331;
 Wed, 13 Sep 2023 13:37:44 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=qJrE=E5=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qgQ3s-0008TF-Cm
 for xen-devel@lists.xenproject.org; Wed, 13 Sep 2023 13:37:44 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04on0606.outbound.protection.outlook.com
 [2a01:111:f400:fe0c::606])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b6d70727-523a-11ee-9b0d-b553b5be7939;
 Wed, 13 Sep 2023 15:37:42 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by AS8PR04MB7525.eurprd04.prod.outlook.com (2603:10a6:20b:29b::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6768.31; Wed, 13 Sep
 2023 13:37:40 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::f749:b27f:2187:6654]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::f749:b27f:2187:6654%6]) with mapi id 15.20.6792.019; Wed, 13 Sep 2023
 13:37:40 +0000
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
X-Inumbo-ID: b6d70727-523a-11ee-9b0d-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iNgPffM/2Cf7h+CAXfM6JRocnn2eNYvfVvdBIKeaJb1LBPdxpUNIG/uXQ3N482SNNX12+yFEGMEerl0TNY/8pGnBQqjEwCAQLM14p/6ZcJIIURpi4YGs+6OoMP/KFOOxT9b1/O0YXou3KWrZixcdoLbR6dXuhccJRJ4Mu0jgDgiIeU0mIoaRww+txw/ksOF2/aIvBGnQxLvAKoAXHZK5uyZcGniKLrZhdIfJycW/ajJGNN4jNdaMDIi18HlZuCNGLV1n040mystNcxXMndeMHJzB2z/h7cbPeZ7yTRxjxSXR5kblkYfp4Q/SlmO7s9vhLgv/3cF/GHagaz2qXtC9vw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZA7t/E9t/cNfydu1d7GFtNZQutZdcGQqfpHO+wJT5F8=;
 b=adfUZNSfh1FVMiT2GTSjZ4tyfIxV2ARlLyvRaaOPOptYTQsW1PXXpqBmm38HJ7HOmcr8VsjrBN1iwjlt35vu4HAU3GVA2zXNl03YWkwivGgmG0y5YBH39FJJN1VXsSeFEdkbhretfvM5fv5qjL2fBZb9mI+MBdjWsa6wZQKZTFUG5bxxZV7azhVUdNNtZUG2/kToTSZvNbZiuySVLs2SyVd0oCbdIo2r2i3qrHPLEVJh64IhyIsovtU81ePz5K/L62lOMEbTASICO0iwNiG5e7C0Shqn08SAOSQH6Eacffgjgjw4Nf5AWIJ44RIvbIhchcozSDw5TKut5zRFFRaQZw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZA7t/E9t/cNfydu1d7GFtNZQutZdcGQqfpHO+wJT5F8=;
 b=h+1Q+3iTCj5i7C7AiaCxjlGA0rucl4lYWx9/AqtI9tOr7oESHPfjBlt+NWd4npfj5PqgmDZ5MCeFksJvwaAPzpAvHqVXAL4PTBM4Og5o2HM6Jneip/+x1u3nhqUsXl6+1m0OYR4yPX2tfKxNuEaxdgM2Vs+JOOS23f1WioM8iM7+Dx/tXQHOiGBJwKtcEXrBhBxaU322FXqhmeTtpGs1qxYamB2ZQnnjz3hMtxoSewVtN5klMKgYZZF6YGj5YkR5dP7RyzDvV8WZGbP9RMc9U3owLmsAX1Sl0gCz3396IAuu+Q8AeAFKsZr1+vi6N4YZHWtyaxv7iGXTAiiVq3DsHg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <7d56e320-df64-7177-e076-67c477e20dd8@suse.com>
Date: Wed, 13 Sep 2023 15:37:37 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Subject: Re: [Xen PATCH] x86/amd: do not expose HWCR.TscFreqSel to guests
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Wei Liu <wl@xen.org>, solene@openbsd.org,
 =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?=
 <marmarek@invisiblethingslab.com>,
 Demi Marie Obenour <demi@invisiblethingslab.com>,
 Roger Pau Monne <roger.pau@citrix.com>, xen-devel@lists.xenproject.org,
 the arch/x86 maintainers <x86@kernel.org>
References: <20230912162305.34339-1-roger.pau@citrix.com>
 <fc91c802-5f71-4ec9-8c11-68fd2c4ae672@citrix.com>
 <2cfcda8f-bd51-085b-997a-0ff31434d460@suse.com>
 <fca202a8-2716-6ed1-c2ce-707deeddb3ab@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <fca202a8-2716-6ed1-c2ce-707deeddb3ab@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0186.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9f::20) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|AS8PR04MB7525:EE_
X-MS-Office365-Filtering-Correlation-Id: a83dd9af-45c0-41b7-6488-08dbb45e99d2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	RBjCQmvSyIjoYF4zjNhi6WgdsFpSSsJnf6qGVkXXXMVBmebMDDbdACWZMFRNw6zKaVS5VgESjhw6orybu1gPpoM4deQ9FHt2G7rlmDBx8KEg5Gb2Xa5lhipljAayn3ONfAIUjyvDoCMhpIoGNBWHpVSVU97vU3wtzkGD8bPoQr2k+CZGP/JOyjLW+TeQhtmegBjjZVqk8x71m4gOQW7enb7LuMr2o0VnTjMLEtB+gUnJaflP63R2w1O2Oh/1wrZZGMbaJlLnVAxmBf2oY5H96gzPuAZFEgHy0zDSh3EsXgpK1eJwczhd5Sfozkn/UR0BzotqE5J928BHN0xcVi9kx9oTW1j6lx5J5+hX0tPohjDlCfW/GHFJrR83DU/yg69aAEQ0wMnNyk2aZKCjXuwBjt2n/RMNks31Z3DGnf/ak3pkA20F5o8uivvvyLIX+oSvRehONVbY7sU5q5SLz4TXDRizHXMc77AH9r7a4WTJf/wEC0/VOGwnGw8/cMBdt6275ddsibI/Q+gfHEzYf7Y/EBsAA8LF2CVYF4cTBKGNoiZpaDABFO2ULXbD9ySBQaNo0G5eNtzOqi0xcyyLpHUfitFpWNCl3kQYyys9HOkJF1CnfNkkBUTf7PU8088PSR4eLrSBh9h5cJhAuHLRqT3sMA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(366004)(136003)(376002)(396003)(346002)(1800799009)(451199024)(186009)(26005)(6506007)(6666004)(6486002)(53546011)(83380400001)(2616005)(2906002)(66556008)(54906003)(6916009)(66946007)(316002)(66476007)(8936002)(4326008)(478600001)(5660300002)(8676002)(38100700002)(36756003)(31696002)(86362001)(6512007)(31686004)(41300700001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?V0FEUU12bEhBYkI0eHF2bTFLWUpuUXNuNm1VUFEra3ZpenFSeXJjZmo2TXpk?=
 =?utf-8?B?ZFViV2JGaDRqUm1hZTJxcEg0WTVoWVNUZWVVSXQyQlY3eDd4eEF3dnpneWly?=
 =?utf-8?B?UmVYUGZwd2RBNFNudU9yanRkRXJ6TjV2aGhLUmJPVFlIdVB5Ny8wWFAySytD?=
 =?utf-8?B?R1RVTlNqZkdya0p6ZkJaTmp5VUpWQUtaNGJrNGZBeEdDOTJFYUMwVFE5SllI?=
 =?utf-8?B?OGVkeGJvQnIxS09vL1Y1MTR2ZThyenhGbEdGWnN5Sk04ZFliRFBhM1NpejlO?=
 =?utf-8?B?SkF2UGZIbWpmV0k0NktCbEJBVXk4UjBSZ2EwNmNjam9mWWpHOTE1QXJsVmR2?=
 =?utf-8?B?b1JmNkMyVDV5MzQwclBjWDVOTkxDTE56TlFLUzVidzdSUXZRdHpPZzhQTHFG?=
 =?utf-8?B?cTd2MGNmbTJFSkp6UktocjRRQUd2TDJGN2s1TXpvZHQ4dFhOWW1EQzg2aEdI?=
 =?utf-8?B?UUM5UVp0SzVIUTVhVUR5bDVWTE85VDJ6dEp1L1k1d3NUaS92Zmw2Z1lUOE5Q?=
 =?utf-8?B?dlZybkx4aS9SREJUWEhsWktINUREZ2RtdENLZktqMFNMUVJiUUJQWkVLdUhm?=
 =?utf-8?B?U1pqanJZVENVRGk3NWdNRDhXMHJWV2tTQVF3RlpDeUdGNTFyQllEQnJ6YVdL?=
 =?utf-8?B?MEcvVVMyRE4zOWNxNktzcGNqYWU4VkxJUCsvbFdOeEZMZ2JiZDVSRGpjQmw4?=
 =?utf-8?B?VmJtU2RFWG4vWFNjOEJGNmIxMTRvZE05ZzgyUlBPNFo4UEhHS1Z0VU9MZERH?=
 =?utf-8?B?WjdjVE9yU0xtRW1ycXQvOVRzMG85SytGWmFaMFdqWjkwZWN0L2U1ZDR2S0lM?=
 =?utf-8?B?aTFWdUZLK1U2UTBiY3FjT3h1OGl6L1BHR2JJRWcwV0dhMCt4YVY3SzJDQVVD?=
 =?utf-8?B?OTlmeWFObXQ2ZEI4c1FxcW1KVVZheWsrSlNCTno3c0c4Y0lwZnJZRVRZeFox?=
 =?utf-8?B?a1NscGRKRDNkQ3dsWDFjVllKcXJMQlh1VWpDdVl6ek9uU3hpbWdLRThoUmpi?=
 =?utf-8?B?YkRvWUlNM3RDQ3lJQ1BCWWllMFZMbE9jZ3cxUFhHUUdVcEhocWVjSlpTYmsw?=
 =?utf-8?B?Q0kvdElTV0sxS0RtNlVDbERHbnNjZzI3NlEydUZlUFdKYVptNU9kSm5oRW42?=
 =?utf-8?B?dGtpc2RxZmlVTWlGWlc0RWplZHhqR1poS09LWU8wZ3gwckdYN2lvTUR6MEwz?=
 =?utf-8?B?WmVxcWFWc3N1MU9SWGNFSHkxRmhpT1YyT2EzNU4weFdBdURuSWFiTlFiMzcy?=
 =?utf-8?B?WlJ1MGM0aXZHYlNsaXRMNTgrZjMzbXkzcXpZaVNjYzZRb2RQd0tRMDRQd3p1?=
 =?utf-8?B?TW52azE4bjc3VDFGRlFlOHJTc0ZxUHI1QkozVUx2SjJ1WElrZkYweENRRHpL?=
 =?utf-8?B?d3hKZmRCZUdHK0ovTXFqc0pVU2Zzb29Hb3NEcFEyMi9PUjNDZzcyVFN5a3lG?=
 =?utf-8?B?Vkh3Vzk2WWxZdXJoUmhZdEQzQjZHWXJ2SDNtVHhra1hJcElzemtDM0xWMVdK?=
 =?utf-8?B?U3pZakVmN3FuekgzVVRxS3RnY2hrRzhMZE5SZ2VQa2hacFlHSFIwb1BXaGZ0?=
 =?utf-8?B?RFdwZ0RvSDF2MDdFbHE4blUxZ0dyNXoxaks2anBGYWIzcTNaZWhLU2hyRUZD?=
 =?utf-8?B?UC9pVzFsQjU4YlBWRkY4d0d0cGxyZ3FWYWhyNnBMYzZYSDdRT3JCZmgzU2Y0?=
 =?utf-8?B?RTVHS2NoUjlJTVJYSlhmOHgwZ3Q1Skl5eWY5b2pGa28xOThOYzJXREJBd1Av?=
 =?utf-8?B?Ky94Wk5OMm9NOXFEREZObW5iZjdnaVBRbTN3aEdqMk5HK09VenFURXpxNlds?=
 =?utf-8?B?OWxkR0ZvdDJmR3EyOUIvSnREL1ovdWN4OW4xZ3AzSFJKdytLR1o0WlQxODRo?=
 =?utf-8?B?dGtua0JiN2FPa2xsUmtSQm1ES05RekFmZ0hhMjlVSVB0c0NTbVBjbWEzbmFv?=
 =?utf-8?B?b2hETS9SNk91Um0zSWxTVG03MHBvZ0lhdldFcy9Xcm4yZXgrU3FQalU3dnZm?=
 =?utf-8?B?ckxoRlpwRnRMcUlGRXUySDdCQXVvNCs3ZmxuU3dnODBpRTRSTWF1MUdveVBR?=
 =?utf-8?B?aEdMVXo1TDVINVZSeGFWU2s0bXRYN0hiMkJ3TkNaTVVnUXgxTHJkYUR4aHhR?=
 =?utf-8?Q?puTgX/9uHb1pOAs2DYJk1TZtZ?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a83dd9af-45c0-41b7-6488-08dbb45e99d2
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Sep 2023 13:37:40.4840
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EimTc0cmIKaP0F4F4zVN8E2cGMWIAVxw77AU1GWAnXjVfc5IzXOQiGp64tE6xrrxDPhuxFWcoRoa2DxZf3sxeQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB7525

On 13.09.2023 13:02, Andrew Cooper wrote:
> On 13/09/2023 7:18 am, Jan Beulich wrote:
>> On 12.09.2023 18:35, Andrew Cooper wrote:
>>> On 12/09/2023 5:23 pm, Roger Pau Monne wrote:
>>>> --- a/xen/arch/x86/msr.c
>>>> +++ b/xen/arch/x86/msr.c
>>>> @@ -240,8 +240,12 @@ int guest_rdmsr(struct vcpu *v, uint32_t msr, uint64_t *val)
>>>>      case MSR_K8_HWCR:
>>>>          if ( !(cp->x86_vendor & (X86_VENDOR_AMD | X86_VENDOR_HYGON)) )
>>>>              goto gp_fault;
>>>> -        *val = get_cpu_family(cp->basic.raw_fms, NULL, NULL) >= 0x10
>>>> -               ? K8_HWCR_TSC_FREQ_SEL : 0;
>>>> +        /*
>>>> +         * OpenBSD 7.3 accesses HWCR unconditionally if the TSC is reported as
>>>> +         * Invariant.  Do not set TSC_FREQ_SEL as that would trigger OpenBSD to
>>>> +         * also poke at PSTATE0.
>>>> +         */
>>> While this is true, the justification for removing this is because
>>> TSC_FREQ_SEL is a model specific bit, not an architectural bit in HWCR.
>>>
>>> Also because it's addition without writing into the migration stream was
>>> bogus irrespective of the specifics of the bit.
>>>
>>> I'm still of the opinion that it's buggy for OpenBSD to be looking at
>>> model specific bits when virtualised, but given my latest reading of the
>>> AMD manuals, I think OpenBSD *is* well behaved looking at PSTATE0 if it
>>> can see TSC_FREQ_SEL.
>> I'm afraid I'm still at a loss seeing what wording in which PPR makes you
>> see a connection. If there was a connection, I'd like to ask that we at
>> least properly consider exposing PSTATE0 (or if necessary all PSTATEn) as
>> well, with zero value (i.e. in particular with the valid bit clear),
>> rather than exposing a r/o bit with the wrong value, upsetting Linux.
> 
> This mess is caused by the erroneous advertising of a model specific
> bit, and there's no way in hell that giving the guest even more model
> specific data is going to fix it.
> 
> The PSTATE MSRs are entirely model specific, fully read/write, and the
> Enable bit is not an enable bit; its a "not valid yet" bit that firmware
> is required to adjust to be consistent across the coherency fabric.
> 
> Linux is simply wrong with it's printk() under virt, and wants adjusting.

Assuming Roger agrees with this statement, then I think this is another
item wanting mentioning in the description. I then still wouldn't ack
the change, but I also wouldn't object to it anymore.

Jan

