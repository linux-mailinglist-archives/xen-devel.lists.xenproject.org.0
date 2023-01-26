Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A6E067C580
	for <lists+xen-devel@lfdr.de>; Thu, 26 Jan 2023 09:07:12 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.484811.751627 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pKxHe-0000QC-OO; Thu, 26 Jan 2023 08:06:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 484811.751627; Thu, 26 Jan 2023 08:06:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pKxHe-0000OU-LO; Thu, 26 Jan 2023 08:06:58 +0000
Received: by outflank-mailman (input) for mailman id 484811;
 Thu, 26 Jan 2023 08:06:57 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=71dA=5X=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pKxHd-0000OM-Al
 for xen-devel@lists.xenproject.org; Thu, 26 Jan 2023 08:06:57 +0000
Received: from EUR03-DBA-obe.outbound.protection.outlook.com
 (mail-dbaeur03on2076.outbound.protection.outlook.com [40.107.104.76])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 653d5620-9d50-11ed-b8d1-410ff93cb8f0;
 Thu, 26 Jan 2023 09:06:54 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DU2PR04MB9097.eurprd04.prod.outlook.com (2603:10a6:10:2f0::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.28; Thu, 26 Jan
 2023 08:06:53 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2991:58a4:e308:4389]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2991:58a4:e308:4389%7]) with mapi id 15.20.6043.022; Thu, 26 Jan 2023
 08:06:53 +0000
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
X-Inumbo-ID: 653d5620-9d50-11ed-b8d1-410ff93cb8f0
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=I6WiUg7FTfkkYqIuA4DYn350H6oXBK6EgP+UCCr9QaoRBu0+wr2LHd9CKEgBXC7ZKlmntdMNuZ33VcwBMeUkti5ML9supqQ3NWmA/ZHF6VQ9W+rz2tExE/F/K9+6ok3XmBYukEPyepeTNBIUEog+uYHkCCfcjMCznsixb63vD+3kvE7Ii35qd8mjpmTDLZ9cEgreNO/hcwavRB2X+Jy/PeUxdGmw0IfKaWcVo5awr7s76YxyIbEs2elY9i9mKMx3JWLcx+osZv+I4hrVQJ6D8k9BH0UhbVcusdO6cwdxlC9qqQW+bfcB5X+InsbSt2pxhIHfohklmAhsvEOwEsgXGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xDfyNhPkcKIS1cxazSpqnUmPOl/7JM90WKSm92OYybk=;
 b=LRPASgZ0BPnZC1dblSCtDJ1wd4m68ORSX+5o8hWIEh64/6rlMnZCz7strAvKI3Pwt03ygjMd19q6CrNIjIwQAQHLYXGJKJjg978CKEX1cg9DYb9pXAJe/PTAICPDOdmVMmnyNYwIYzZBzWtPZOnTBHyj2kKaPHIYuhhKQCpRB8/e5Or4x63myQYFr1VSRFSDXnAvIbijv2XQs9/gsnxJwH083iLBpLvMcd1enJE8n8p2aDQ+GuFglb7jJPgoq+0f65SZOw8C1/fWD+WjFSeKkv3kufUhWbtCn9XaBaQkbl+IGQn/eL5g1LHkbE2uqWNMdDgeo94IcireVe8pqSMdwQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xDfyNhPkcKIS1cxazSpqnUmPOl/7JM90WKSm92OYybk=;
 b=Zr4Dpaq4bas4lkUGYg26dl+xfTe15ztBL4KzEOqr4F4vZShudMjjqaj1SKyb1Pg+nPV4Rc6K3l6RiSmDqJlpWuQRBAFF7XlHeS5ee1UYDzVEL502apJ6zXWbs8Lkhju/c9OP9HQokMNgDhjIaS1UirMGorQJUWGG3xENuk3jxlG51N7oXFzhhbbRGEVxPP5IntAZ2PrgjRF+xWeK8K1zHPmWXxSfxhk0WJK/xkrFbz5FUGfwo2vUocgVkC8f1cTSrXD7OGhIWZs780145zWHr/ETPutU2sFU3qtgX7c8Kgmu3dc66NdmjjiN+qHaSHw88JycYKQDJlZYzUB5bfYRBg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <bececcba-7606-924d-aba1-f51134414fd0@suse.com>
Date: Thu, 26 Jan 2023 09:06:51 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v4 01/11] xen/common: add cache coloring common code
Content-Language: en-US
To: Carlo Nonato <carlo.nonato@minervasys.tech>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Marco Solieri <marco.solieri@minervasys.tech>,
 xen-devel@lists.xenproject.org, Julien Grall <julien@xen.org>
References: <20230123154735.74832-1-carlo.nonato@minervasys.tech>
 <20230123154735.74832-2-carlo.nonato@minervasys.tech>
 <a470be46-ab6e-3970-2b04-6f4035adf1cb@suse.com>
 <CAG+AhRX9DVW5EfXKQoDG9hmcE0FORydTZd0pNm-0uqwddaN9NQ@mail.gmail.com>
 <6c952571-6a8d-e4fc-36ec-b5b79dac40f6@suse.com>
 <CAG+AhRUOBgPsT9yU3EtqSPj5VX70H1DsUL_dOWguapC+u3iSvw@mail.gmail.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <CAG+AhRUOBgPsT9yU3EtqSPj5VX70H1DsUL_dOWguapC+u3iSvw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0134.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9e::13) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|DU2PR04MB9097:EE_
X-MS-Office365-Filtering-Correlation-Id: e67c2169-5f5a-4afe-7bba-08daff7448d1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	TuBIkMOW+5Ql7aoDlT4iSjUDL2RRiRgXjeHF/IEOhq+dUE7q+rIN/ZJS6LuXcUPWvUyKKa9tOJrXfkejfRjwSjZtl4He5oOC+PBHEKaqtH8h6a3XSNXKCPEDvW6d+5pA8fgugSkBkXpkbyN8+tuZL4TBjW08JKRXksEzuyhoIcJa+NnPK5I8d38SxhJwcdLa6XXSypWEVpE/GdXtXMp3ow6/wXkUYhJlNRlo3Oy3woHErmc571eZm/nz4M2I9dRVuZQvwJ3//Va/dP6PkRGS2ugx012Vyvsum/umVCSAOYQ8AgBdoYjtU8Vv5xmKxcgCizYthOIvMMMRa5StzQ/fu+xo6NYuHrNBQNyBIusH0Ev5RQ3KDg130/iWImBomqi5dHrcRztVryW1F7ulcZNKACjap8nTFmEGXL63x9t33zOV6Wu14b8+5nlkmlkkFSwxDDsmCfMVOaKMTWcoiVFfhbaIHdIOVUWCKYhqW6sTsbZ6mwXQYJwjBmFg8de/YRpOohKAhOy1mTUG3+MQtgDt/5zI7hgAmSkunA08kmSyo4V97A0HddKTJugDSZi+IMXtw1XsKG8+l4YYIRpCLFygJbbSmgpDKERa/jkSmc+TRDTr4eXfv1oPWa1GPhoJuur53cPmi41hzNk1V3JUk+WvV3quJ3GFcWBr2Fm6CUS+T4MzRMJy408pSoBwkgGxeH+Hvy5oKRQh20h6UkN22+GEKJyLvpYqTt0JPQkYCheTkfV8VvS+lAg/uPlN0hy4oaYy
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(396003)(376002)(346002)(39860400002)(136003)(366004)(451199018)(66899018)(31696002)(2616005)(6486002)(2906002)(8676002)(4326008)(66476007)(316002)(478600001)(186003)(83380400001)(41300700001)(26005)(86362001)(66946007)(6506007)(38100700002)(53546011)(6916009)(54906003)(966005)(6512007)(8936002)(31686004)(5660300002)(36756003)(66556008)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WmVpZWR1dTU2M2RGZGYvTmtkSEYxZHIwQWpIcFA4dlZ4UHpmT0Z1YW0wVDVB?=
 =?utf-8?B?OU04VXRJL0dmdmdIekpzQTFHdDhacmpmRndKS3B0cGpMcnVZSENMNTVZVVhk?=
 =?utf-8?B?dXA5Y09lRzBibDEzR2NOTml4RlFQRDlXb1RGTk1GWE03OXVJU0piZWgzb2ds?=
 =?utf-8?B?alg1dmVCU3FETE0yUjBMNmZRU3p3VDE0VlhWKzlPV1FhTVhpWkpweWhOc3F6?=
 =?utf-8?B?TU1kcHlXWDFNL3RTaWc4NWxOY0VrMVQwZmZDMlRaQkJtMjBLb2FTQ0xiRHhN?=
 =?utf-8?B?UHhqUGFtZEdMUWVhcm9pbGdGdkFKMnpvWlNNd1d4L2Y0M0NUd2ZYOThXU0Mz?=
 =?utf-8?B?NFMrbEZodVRRS2FrZDNzbjRhRmtzTVc4dHU3RUl0dnJtZGZhd2JscjJvZHlw?=
 =?utf-8?B?Q0gyWFRockM5NVExZlVXQ2FvT2NzbWRJcmNUWDlWa2cxMGxUc01ueXRPSGN4?=
 =?utf-8?B?QThBSHVkYUFZVGtwQjZFbnpRNlhOU1JVNjRpeEliWmtjOGt0eklpdStrRjRC?=
 =?utf-8?B?L1J0Rkt6U0lBSG1rVURXb2xmSmxoSFMvMjFXdkExT21qTmtEa0pncnVwR3dt?=
 =?utf-8?B?NjZnbGM2cktNcUVFVTZTbzZ4ME9EK0ppNWJWbVpzaHF5dXN1dExuempwOWVR?=
 =?utf-8?B?ZzN5cnNnSko2bkhFbWpqaHA0Y0ZIUVU4REpoNkx0TGVMbHQ3YnlHREVDUGtp?=
 =?utf-8?B?VzgvYXRqcVBvQkdUeHRaMDNxMStDKyttKzNzMnMrS2lsbUlYMGo1OVVucG81?=
 =?utf-8?B?MkYrUXhBYUpNUXl2bGErbFFLbnhNbHAyYlFlTVFhelZVUzlPYXFwenJjN0Nn?=
 =?utf-8?B?ZUU5a2NRQ3o5angvMkQzYXBid2Foc3BOM0dxQ3hJTjJSeTFaMTZtOHc3M25B?=
 =?utf-8?B?N1hPaXZBdS9xQnZML0dTZW5PK3Z4R3BDdnlaV3VveXhGUVErVUV0b2JObnNi?=
 =?utf-8?B?QXROZWNCdVdMZlMzcmh5Wi9QYkxPMFlzOC9rZ0wvdFdSRG1SeWluTloxZk5O?=
 =?utf-8?B?cGgwZWROWmVCemRsbTZXeEdaQ0xEV01jOUFSdG5Jc0VhdDVnd1BCZTVlT25Q?=
 =?utf-8?B?YzBXS1hraC9tOXZndFhTZE56TmtXNHEyUGRQY0J3VWRCUTZBQmM4K09JNkc2?=
 =?utf-8?B?cVc4UTlSc0FDSVdMTGJscWlvajN5NFkrTW9hNWM1OUVPUzBjRWtndEVXQ1NR?=
 =?utf-8?B?NUpncFdhOVZRL25WNDlQdTA1L0tyNDdwT1BVVXlnNjNEYkdEWDFZb2Mzd2F6?=
 =?utf-8?B?TWhxRzRsS2NwalVlbkxtVmo1SHNhcUQzaFlUeWdBeHdLa0R6NnJjNjdLcTVB?=
 =?utf-8?B?T0k5U29KY2VIYnhlMytDWGVyZzcyV3dyNkF5Yk5CR055VVZYMDFETjBRdmpJ?=
 =?utf-8?B?N3A2U3lWU1B6NDZ5YzA3cUpmS0xjMGRMSmNvYjR4OHBrTDU5WlJNMEpuOXla?=
 =?utf-8?B?RXB6ZHdQeU9LRkVsT1B2ZGZheitWZGQzckJNNU1yY280KzRiYzFxMkJiRkFi?=
 =?utf-8?B?bjRxYWdtOWNkSUZMbmg2UFBiVGFhdXpGNWJqamZjdURDUlc2dlRvZmN0SGVj?=
 =?utf-8?B?emRoeFh2dmdCbTNoVjlxOTc1Mlpad1hLTSt4NktXdFduMHZxeVdwQjM3ZGhB?=
 =?utf-8?B?bnp5TXN1aXdOdVpJQ0pWLzFOSjNxR21lMmhVY3NLU0E3THVoZk9LVmt3Qm5N?=
 =?utf-8?B?N09nOFlNR0crcmVmdTFXMGY3V1FGemVORVNEeWhiOGFMbjNldEJHdzEzSzJ6?=
 =?utf-8?B?ZTgweHpDcHVkVDVCVWJheTFzWkhtMlZLT2hoWEd6a1NKNjJqWFZJQUh3dHpW?=
 =?utf-8?B?MkZDQ1RWUFdoN0d3QVdWUCtabTcxMU5hMTdnVlJ1OUVxYitMdGwxajM1YnJG?=
 =?utf-8?B?NHpSTlI0TXp0WUhOUkxKRk5yUDNpQlBRVXdZa2VEOEtnLzg1anJaR2xDYzRs?=
 =?utf-8?B?cXFieU5makUrVUJReVRqSnEzdnVMWGc4Y09iMENid0srZVRicytpTEtNakFQ?=
 =?utf-8?B?ZkVVRGlFcnBHR2crYmlWb1JKeEc0ejFiK3IrWkVWT0Nkbjk5NlRPL252bHR2?=
 =?utf-8?B?Tm9ZakNKTzZodXo2OExTeVl0THVtbmJ2aDEvREhuUVZzQ0dYYjZhc2tUNTVi?=
 =?utf-8?Q?jxoBfXc3807U3OjO34j/7I4om?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e67c2169-5f5a-4afe-7bba-08daff7448d1
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jan 2023 08:06:53.0886
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rTEIzw9co5Hy7LWWcRGKflNn6rLUPP/8v+8OlkSA+nB91iR+jBOUu1i0YWWCjnsapH7kHS3tECdvayGHBwzI5A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB9097

On 25.01.2023 17:18, Carlo Nonato wrote:
> On Wed, Jan 25, 2023 at 2:10 PM Jan Beulich <jbeulich@suse.com> wrote:
>> On 25.01.2023 12:18, Carlo Nonato wrote:
>>> On Tue, Jan 24, 2023 at 5:37 PM Jan Beulich <jbeulich@suse.com> wrote:
>>>> On 23.01.2023 16:47, Carlo Nonato wrote:
>>>>> --- a/xen/include/xen/sched.h
>>>>> +++ b/xen/include/xen/sched.h
>>>>> @@ -602,6 +602,9 @@ struct domain
>>>>>
>>>>>      /* Holding CDF_* constant. Internal flags for domain creation. */
>>>>>      unsigned int cdf;
>>>>> +
>>>>> +    unsigned int *llc_colors;
>>>>> +    unsigned int num_llc_colors;
>>>>>  };
>>>>
>>>> Why outside of any #ifdef, and why not in struct arch_domain?
>>>
>>> Moving this in sched.h seemed like the natural continuation of the common +
>>> arch specific split. Notice that this split is also because Julien pointed
>>> out (as you did in some earlier revision) that cache coloring can be used
>>> by other arch in the future (even if x86 is excluded). Having two maintainers
>>> saying the same thing sounded like a good reason to do that.
>>
>> If you mean this to be usable by other arch-es as well (which I would
>> welcome, as I think I had expressed on an earlier version), then I think
>> more pieces want to be in common code. But putting the fields here and all
>> users of them in arch-specific code (which I think is the way I saw it)
>> doesn't look very logical to me. IOW to me there exist only two possible
>> approaches: As much as possible in common code, or common code being
>> disturbed as little as possible.
> 
> This means having a llc-coloring.c in common where to put the common
> implementation, right?

Likely, yes.

> Anyway right now there is also another user of such fields in common:
> page_alloc.c.

Yet hopefully all inside suitable #ifdef.

>>> The missing #ifdef comes from a discussion I had with Julien in v2 about
>>> domctl interface where he suggested removing it
>>> (https://marc.info/?l=xen-devel&m=166151802002263).
>>
>> I went about five levels deep in the replies, without finding any such reply
>> from Julien. Can you please be more specific with the link, so readers don't
>> need to endlessly dig?
> 
> https://marc.info/?l=xen-devel&m=166669617917298
> 
> quote (me and then Julien):
>>> We can also think of moving the coloring fields from this
>>> struct to the common one (xen_domctl_createdomain) protecting them with
>>> the proper #ifdef (but we are targeting only arm64...).
> 
>> Your code is targeting arm64 but fundamentally this is an arm64 specific
>> feature. IOW, this could be used in the future on other arch. So I think
>> it would make sense to define it in common without the #ifdef.

I'm inclined to read this as a dislike for "#ifdef CONFIG_ARM64", not for
"#ifdef CONFIG_LLC_COLORING" (or whatever the name of the option was). But
I guess only Julien can clarify this ...

Jan

