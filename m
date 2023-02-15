Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EA17E697C13
	for <lists+xen-devel@lfdr.de>; Wed, 15 Feb 2023 13:43:35 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.495967.766443 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pSH7j-0005DP-Eo; Wed, 15 Feb 2023 12:42:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 495967.766443; Wed, 15 Feb 2023 12:42:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pSH7j-0005Ag-BX; Wed, 15 Feb 2023 12:42:59 +0000
Received: by outflank-mailman (input) for mailman id 495967;
 Wed, 15 Feb 2023 12:42:57 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=7OvG=6L=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pSH7h-0005Aa-8J
 for xen-devel@lists.xenproject.org; Wed, 15 Feb 2023 12:42:57 +0000
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur01on062d.outbound.protection.outlook.com
 [2a01:111:f400:fe1f::62d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4435939d-ad2e-11ed-93b5-47a8fe42b414;
 Wed, 15 Feb 2023 13:42:55 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by PAXPR04MB8557.eurprd04.prod.outlook.com (2603:10a6:102:214::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6086.26; Wed, 15 Feb
 2023 12:42:51 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e138:4fc3:705c:d178]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e138:4fc3:705c:d178%7]) with mapi id 15.20.6086.026; Wed, 15 Feb 2023
 12:42:50 +0000
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
X-Inumbo-ID: 4435939d-ad2e-11ed-93b5-47a8fe42b414
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Dsh7bksM21W7LCtR0Q5EpITxuZzzSXQFeZOkpQLfi/Pm8TGiHtfjfM/ySQWq918X72rG+hMrdhwW40royOsBF5OINWSadzr9L3/aan1YQtPK5qO45LLA86QukU8VuHRt2oBT4BAhL8btksOmiLXwm7QONm2cLnXg1uqcVNlCdMBDVvR5DtSpQVSncBFBer4LN7NwlvhD0ibYmTw+OF2U/YSpjt0K7J/EuLs4K9dJnIRXdMvihAkAzPcQ1/32vXU+0ZNu3XhSPijCw9DO/R7V1Pxzh3x+I25+GVK1H8LA3CM7tkq5fj1rK4/rwFacrqyzEqI6zyT462dRKR4uC72b7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GzgKugyULcfMWfiFKQIeuCMTvQaR8HlUPhzFny/tWps=;
 b=l87SvHgOa6HOMVjyCd6zhLuJFno22wOT515Nh93R1hnSshn6xQ24LeE6gGjYVgrB+ZlEarB7zkUgy/x1pWsUfbfleykZzEwHoJ5qmmcsM2p7hsl+hKZEoSFbYdQrrK8ts7HDzU0Wx9SdcCobUP1fvtRthhG59A2dwUURShxCIUjIPU7CoWRC+ljvUGdz3/lN/ln0qyhwQxWGHfLeKtYc/bW/sRQBPLnkRcFCth58diTVUtPRIY96XG7kzNBdWpuRFEGB3xYk+Y1kKGn+8sIcOHPPapte+x8vrhkkFS6ZraBHXinDfpoxWFibMk1DXyylXi1UyMKXoE+qMQdRR6BWRw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GzgKugyULcfMWfiFKQIeuCMTvQaR8HlUPhzFny/tWps=;
 b=qTeX/ZP4QeNUb9WBJFzgBvZOgpkb0yU719T8VauWKmeHB4ybJ+wMgGuZNLs3/irB4uJuSRIdwdgKGJCLzDPugdMR7o4vdAhhGsfAvDO1EBkr6x77Ae+VTbksFVWQK/3OTSD7SFSsqiBB28rHwwQJA/NacChtF5LRnjAX6O+DeLS2grWZd6vomSEFnnU/ceDGkVT0lS42Bx+0wKflrK0XquoigVKir3TXFVeAwmXNfRKNJ5qGyMtGuVnuXL5XHmJSrmjtVE7+lngzjKfeyQTb9r4SWkn816e9nj3mh1km5GlPMHT3pdDVdVzqQpYNPPudz5wdFksvBMsR60ukYlVuqw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <7b0ddd99-4093-b72d-ba5c-ea145c0bf2f4@suse.com>
Date: Wed, 15 Feb 2023 13:42:48 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.2
Subject: Re: [PATCH] x86/Xen: tidy xen-head.S
Content-Language: en-US
To: Juergen Gross <jgross@suse.com>
Cc: Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 the arch/x86 maintainers <x86@kernel.org>,
 Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <afb02f3e-3d69-07ca-c3ec-5bbeeceb5e55@suse.com>
 <28bd8aec-cd41-7b5c-0f32-12c79595134d@suse.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <28bd8aec-cd41-7b5c-0f32-12c79595134d@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0127.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:94::13) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|PAXPR04MB8557:EE_
X-MS-Office365-Filtering-Correlation-Id: 20f5d1ed-3733-4afd-2c83-08db0f5225db
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Q4Swv2j4YNlptWhbebjbMYFXWSeKIW0OkbjGmep6cOshhIdkiTXueC5b9kGw78sesMW4d2gMb/4h5lTKt5dz5We6XG00fL7TRpZMwMtNdtaKFZDSr+tjfzufs/ypWhkJpXq1dfFAmw++GQXyN4cQimoOrh4SA/LsQrpt+6hKzRGhkkc26dT3ZoMpcepkg6FrrP2WrQCbzZLBmsYCQqQWUK0WbNHTjJw9x6+mrS9Dn9bvIdsFNrwTrLhfeaDTjPyW2b5wdzCTyYNLDTE1M2P/UPQpL/JyYGeI8OEX3/NEDcHTQvWVXoEpiFP6vFfWiT/IAyLR2ZszUZjkh5lUQecNchivb1s7sXeDx/hN6+WeWDz1xfWlraNMbceNxWZ1o7HMSZmPrCV9o4DI7pvtZordZaatfsmR+wFRurJybttzRdlsQSpVYetcBwmcIdegq0LjxUpvgP3VXC6bmCBWGiaGBtr3X+CUFms/BWJRAijKM7fzTCquUjjOiW6CTzR2If4PJPR7QVwlc2ba6X1HYs5g2pO9pLloO4OrTsV2mCi8iO+DLHl+F/8ZlD6wYSp2PdftISxzMF0jnP2UGO0egNkTnok5T1o8D3jIzMet5OCh3tGd3YxP+tsWY9gWRiCsWNCOo9tgq67bl9pOJUcDtMqAAJlOKdDVl8pVXbXHpfMTmsH/O4h9LrKEWlS1o2n1UEJF9eozr3AQW7ZIhQZLT5Gs6KsKVTW/LXe+p5FGfEJ4T0g=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(39860400002)(346002)(366004)(396003)(136003)(376002)(451199018)(8936002)(6862004)(36756003)(41300700001)(5660300002)(2906002)(478600001)(6486002)(66476007)(4326008)(66556008)(6636002)(8676002)(66946007)(54906003)(316002)(37006003)(38100700002)(31686004)(2616005)(53546011)(6506007)(6512007)(186003)(26005)(86362001)(31696002)(83380400001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SXBXUWxWYWg3WXBlTjd2VTg1MFRSUkZVMWNwZ003dEEvUUd5Z0RRS0FVYXo5?=
 =?utf-8?B?dDF1T2hIVFhVbTJkVGJqbGh3Ui9Jd295cVV4a2pkc0pqWS8wVTRROWU1a0ti?=
 =?utf-8?B?Mmt5alp4VlpadGd4WUdsSnNvdkVMWlYvQWxhSkxOUkNWRDMrSW9LUUhvYmFh?=
 =?utf-8?B?cGtKOThDNDM0NUZpdTZCQjJiZE5qeVRBY0JFdXpPZHR6UGJVV0NPZ0lyUy9W?=
 =?utf-8?B?YTg3UWxiVmltQVQ5bHRuSHg0UzJVeFcyWEtHQUpPQ1FaeWJjdTdIWW82Um16?=
 =?utf-8?B?QlZWcDgyZlM1NXpHYnJ1VEM4dlQ0Yll1S2J0M1Qxd0hJaTJQbmFpdVdWYzNm?=
 =?utf-8?B?dGFBVERUUHV3OXh6M1JoMi9UaG0rVitWbmRyM3RWVDJ1djF2Uko3OFBMUjE3?=
 =?utf-8?B?Vll1Um9FMEk3c0M4OTZibGdITXlEYzFadlhvQlBFTFpUbEFWLzA2bVppWHlk?=
 =?utf-8?B?VGpJRnFoano5cFlxbTFROFVYWWdEeHlieTUwTlFxeDZyK0dHeVdGb0xTS0E0?=
 =?utf-8?B?NnJjOGR3aGpIaEFnQ002V1V2U0lBQllmSjFNR1dGRktyVmIxbHNGalVtU2FO?=
 =?utf-8?B?bk8zcnRBNDMvNmc0OEFLZ0tUd1hsYmtoNEhKMU9aczVYYUpOT1NFZiswa0dI?=
 =?utf-8?B?dFFzSGxnL1czUGtGalJmcG9vMWpmZEhNbnljZllNNGZHcXQxUWx4aVM2WmlJ?=
 =?utf-8?B?QzU1bE1zcldTYkE2cGxEZ25XSlRtSlYzWldBMm5nS3VPVEZ1TUZ6a256OXRJ?=
 =?utf-8?B?ZGZKc0NxbjNSTk9PakJ3SldlaExrVk1LU3ZhN2FMK1prQWJXWVYybkZrU2pr?=
 =?utf-8?B?bjIzb1loSzJjbkdkSG9jRmlLRytFZUU5NmtYNVFtb1lWdWh6YjduRi9Kc3Rq?=
 =?utf-8?B?MFF1QkUxNElvSlArWGdJcTF6OEZZclBlV3N2WXZUemtOanAyUjNOUGV1Vmd3?=
 =?utf-8?B?ZnJNUEhlNXllTHQyYW0xMjA5ZldCM0poWjJDS0EwWERxQVFwL3hkTFlGTk80?=
 =?utf-8?B?MWRWZUJibDdBZUhWZUZLVXorc243Wk44ZFZMYkU0ZEx5U2FIYkVMeEcyWC9J?=
 =?utf-8?B?L2E2YTkrVkxpZHRqSjRsdTJvK2orMnp5cSsyQmZXeXdDT2w4US9KQTJKeGVW?=
 =?utf-8?B?dVNISkU4cXlqcnMzcU5TRCtKdkhPOEk5Qm1ZQy9qOW1aRWlIWnhpc21Nd29r?=
 =?utf-8?B?VjlKTzBjV1k4ay9RdGRtSXBvc0RJNXptbGRVajdoajBKNVdiVEJIMXBmTVJz?=
 =?utf-8?B?aEN0Vjc3eWJ2cG1jRkQxSGhCVytCSG9RcUE3bk9QVi9JV0lYMlFJaU1NLzhp?=
 =?utf-8?B?Z0ZzS25uSmRBM0NZL0xRaFUyNXpHYnNYOEx0cWdIeUI2WFNqRVR5dTBsNGVa?=
 =?utf-8?B?eUVRd09xMERmd1lCem1RdE9TdHFMMDZPR1hrT3NnVUpPSEk4dlNFSmo0Mnl2?=
 =?utf-8?B?OGFXZ1VkMUhYQlpPYy84SW1BZStCcGJpZnVMZUM5TWhVZVRwY2U5SjZtV2ZU?=
 =?utf-8?B?SFBocWJqSXFmdkg1OFJ4VjFVcm4vVk12NGY1UndEY1F6ZlRleTFRTUVkUVZJ?=
 =?utf-8?B?WDh2bHVVS21jK1RFY2VXczRPWURJMHFKMmVLWFlSYU1XUjc5Qk16T0d3OEJ1?=
 =?utf-8?B?NTZReW9uK1JTbDRPSm1UeFl4azVWZHkwS0liVitxdFFHOUhVajBIRGIzclp3?=
 =?utf-8?B?SS83MGVVVFcyK0ptd3hjb3N0OEpQSDF3VUdwdW1NODkzTVhhcStpTlZLY2VO?=
 =?utf-8?B?RWpZVGNiQ29jSVBZZ2xjSFJKL2lCK1BrNlJnc1Z1Q0VoSXJNYnlZQVAxTkJo?=
 =?utf-8?B?bkY1N3dnS3J0TWJMMVhweUFNK1lnUjNmTHdoRUpzTFhCN3VpVlY2SmN2Zkdt?=
 =?utf-8?B?MGNkVjJrS1VMNXQyMk9VcXM1enZsMVh3czc4M2VJTVdMbzB6RmdwTEhkeTYr?=
 =?utf-8?B?YjM1U3ZVUU9pRDF6emdoeWhpazg3eEs5Q04zbjhyOHIrUXNPZXF1bi91MVc3?=
 =?utf-8?B?NWh3VzZBV0IyNUZEUWFTVnM0Qk9tNThhT21KTEQ5S3cxSlZ5aHYzN1ZPSkk0?=
 =?utf-8?B?SktWODl6T0NhaENaZHNLUDdDeEY5NjZMaHNIVHdqTmlxTlIydWhPa1ZKSUdp?=
 =?utf-8?Q?ZIpVPigzJu3XbG4vQuZSvNcuG?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 20f5d1ed-3733-4afd-2c83-08db0f5225db
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Feb 2023 12:42:50.3506
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yNlzepQKemKMT8L8QhDgVRjEOXwAipkPIAH+Rw3HQSDEzS1nb//5ogyTVkl6y25JHzc2Xcnq/j6ZBVzc3HJJ9g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8557

On 15.02.2023 13:05, Juergen Gross wrote:
> On 15.02.23 12:33, Jan Beulich wrote:
>> First of all drop 32-bit leftovers, including the inclusion of the file
>> from head_32.S.
> 
> I don't see why we would want to drop 32-bit HVM and PVH support.

HVM doesn't use this, does it? But yes, the PVH aspect as well as ...

>> --- a/arch/x86/kernel/head_32.S
>> +++ b/arch/x86/kernel/head_32.S
>> @@ -524,8 +524,6 @@ __INITRODATA
>>   int_msg:
>>   	.asciz "Unknown interrupt or fault at: %p %p %p\n"
>>   
>> -#include "../../x86/xen/xen-head.S"
>> -
> 
> This is wrong for non-PV cases.

... this and ...

>> --- a/arch/x86/xen/xen-head.S
>> +++ b/arch/x86/xen/xen-head.S
>> @@ -83,27 +83,33 @@ SYM_CODE_END(asm_cpu_bringup_and_idle)
>>   	ELFNOTE(Xen, XEN_ELFNOTE_GUEST_OS,       .asciz "linux")
>>   	ELFNOTE(Xen, XEN_ELFNOTE_GUEST_VERSION,  .asciz "2.6")
>>   	ELFNOTE(Xen, XEN_ELFNOTE_XEN_VERSION,    .asciz "xen-3.0")
>> -#ifdef CONFIG_X86_32
>> -	ELFNOTE(Xen, XEN_ELFNOTE_VIRT_BASE,      _ASM_PTR __PAGE_OFFSET)
>> -#else
>>   	ELFNOTE(Xen, XEN_ELFNOTE_VIRT_BASE,      _ASM_PTR __START_KERNEL_map)
> 
> This will be wrong for 32-bit guests now. I'm not sure the value is really
> used in Xen for non-PV guests, though.
> 
>>   	/* Map the p2m table to a 512GB-aligned user address. */
>>   	ELFNOTE(Xen, XEN_ELFNOTE_INIT_P2M,       .quad (PUD_SIZE * PTRS_PER_PUD))
> 
> Move this under the CONFIG_PV umbrella?

... these occurred to me over lunch (and I was hoping to be able to point
out my mistake before getting feedback). I'll check whether VIRT_BASE can
also be moved into the PV-only section.

>> -#endif
>>   #ifdef CONFIG_XEN_PV
>>   	ELFNOTE(Xen, XEN_ELFNOTE_ENTRY,          _ASM_PTR startup_xen)
>> +	ELFNOTE(Xen, XEN_ELFNOTE_FEATURES,       .ascii "!writable_page_tables")
>> +	ELFNOTE(Xen, XEN_ELFNOTE_PAE_MODE,       .asciz "yes")
>> +	ELFNOTE(Xen, XEN_ELFNOTE_L1_MFN_VALID,
>> +		.quad _PAGE_PRESENT; .quad _PAGE_PRESENT)
>> +# define FEATURES_PV (1 << XENFEAT_writable_page_tables)
>> +#else
>> +# define FEATURES_PV 0
>> +#endif
>> +#ifdef CONFIG_XEN_PVH
>> +# define FEATURES_PVH (1 << XENFEAT_linux_rsdp_unrestricted)
>> +#else
>> +# define FEATURES_PVH 0
>> +#endif
>> +#ifdef CONFIG_XEN_DOM0
>> +# define FEATURES_DOM0 (1 << XENFEAT_dom0)
>> +#else
>> +# define FEATURES_DOM0 0
>>   #endif
>>   	ELFNOTE(Xen, XEN_ELFNOTE_HYPERCALL_PAGE, _ASM_PTR hypercall_page)
>> -	ELFNOTE(Xen, XEN_ELFNOTE_FEATURES,
>> -		.ascii "!writable_page_tables|pae_pgdir_above_4gb")
>>   	ELFNOTE(Xen, XEN_ELFNOTE_SUPPORTED_FEATURES,
>> -		.long (1 << XENFEAT_writable_page_tables) |       \
>> -		      (1 << XENFEAT_dom0) |                       \
>> -		      (1 << XENFEAT_linux_rsdp_unrestricted))
>> -	ELFNOTE(Xen, XEN_ELFNOTE_PAE_MODE,       .asciz "yes")
>> +		.long FEATURES_PV | FEATURES_PVH | FEATURES_DOM0)
>>   	ELFNOTE(Xen, XEN_ELFNOTE_LOADER,         .asciz "generic")
>> -	ELFNOTE(Xen, XEN_ELFNOTE_L1_MFN_VALID,
>> -		.quad _PAGE_PRESENT; .quad _PAGE_PRESENT)
>>   	ELFNOTE(Xen, XEN_ELFNOTE_SUSPEND_CANCEL, .long 1)
>>   	ELFNOTE(Xen, XEN_ELFNOTE_MOD_START_PFN,  .long 1)
>>   	ELFNOTE(Xen, XEN_ELFNOTE_HV_START_LOW,   _ASM_PTR __HYPERVISOR_VIRT_START)
> 
> Are XEN_ELFNOTE_MOD_START_PFN and XEN_ELFNOTE_HV_START_LOW really relevant
> for the non-PV case? I don't think so (in theory XEN_ELFNOTE_MOD_START_PFN
> could be used, but the main reason for its introduction was PV guests IIRC).

I wasn't sufficiently certain for MOD_START_PFN, so I'd prefer to leave it
untouched for now. HV_START_LOW might be 32-bit PV only really; I'll check
and then maybe drop (or move).

Jan

