Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DF2ED4A5B6F
	for <lists+xen-devel@lfdr.de>; Tue,  1 Feb 2022 12:48:13 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.263553.456287 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nErdN-0007VB-H2; Tue, 01 Feb 2022 11:47:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 263553.456287; Tue, 01 Feb 2022 11:47:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nErdN-0007TL-C4; Tue, 01 Feb 2022 11:47:41 +0000
Received: by outflank-mailman (input) for mailman id 263553;
 Tue, 01 Feb 2022 11:47:39 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=0oSv=SQ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nErdL-0007TD-Ru
 for xen-devel@lists.xenproject.org; Tue, 01 Feb 2022 11:47:39 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c154fdc0-8354-11ec-8eb8-a37418f5ba1a;
 Tue, 01 Feb 2022 12:47:38 +0100 (CET)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05lp2105.outbound.protection.outlook.com [104.47.17.105]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-4-r3V-N44FPmualzorSAiCkQ-1; Tue, 01 Feb 2022 12:47:37 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by AM8PR04MB7953.eurprd04.prod.outlook.com (2603:10a6:20b:246::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.11; Tue, 1 Feb
 2022 11:47:36 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::7cc2:78a3:4d40:9d45]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::7cc2:78a3:4d40:9d45%6]) with mapi id 15.20.4930.022; Tue, 1 Feb 2022
 11:47:36 +0000
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
X-Inumbo-ID: c154fdc0-8354-11ec-8eb8-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1643716058;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=pDwqnYfO5PggWep5MSjL+lELl+vzJJSRyHeY63WURWQ=;
	b=LsuNSF1gEd4I1pXBf6gupydkHKXi7TNU2NkqL9WJulngX4iaZ7vL+D9ur+c2v7ZsOIeGlW
	lVvL8Nqlv9skZTJ4eGa2CRjnzYhEL00XBEbWcw36r+9FnFw2E1fi8Ncn0MLwvXcmteWtpM
	zh0F7wbWfJCgoXHr/IKiEJNuu3To9n0=
X-MC-Unique: r3V-N44FPmualzorSAiCkQ-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JzCAtJ48EfBzo9eIqR/JYntWrfxY7kS8tiMWL072rLKpG5GlCVshLwN9Ojm8r1VDRS/jhEgsH9PbWI7OyEGEvbFRH2AUobgRpPVRH+CzourXnRiBBAbvkHYADzyyMrXtHEsuaFdp0jajApl7OvQ8szWNr4BUt9A5omdeDoJJ9WrotBtXFh43Mqw9c/RIpAoPV2D+upaNcwf04J7bbHAcrbxjx/ncRBz2U/qrwH6SeWUznjb9ZJ2q8GMgDzJThDM9M8S1k+QQK6ATWQY8AhaM2tszN9PrVMh+zU3E7ZN0jwnW9+hoY4BIlvH/WVLeCmdByHzirfmlIj3DIVTYYnwTrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pDwqnYfO5PggWep5MSjL+lELl+vzJJSRyHeY63WURWQ=;
 b=O/qTIWf59p+hMGGeoQk1MAiTlAMsyvejWMyWP385WXygDEZrOAzQ954P/GnYsF6y6jONRnd2nXfSte2Yx6gg3Il/h/UFlyqFPneMA5eQJ0nh5/NO4zcKZDO+2fkGmSCdawmJb/+nuGWg5XsOY97CEzLVyqOPnxEtWa1bnL6D2Ca3LIwdj/ryFcCkhbdqgRaHK0aaZwiOgsEXf2DCrji0nkwwZoWuNG2dF1cTA/OgeU28gsszE05axUztzDGGSmiCs4KkL9CEDOx7Xpv7XZlGTahmV2GBlA/iqHc4wM5yQ2Sfu00QFeXRGAsYSiFkYZaRIDIDp0IP3x25hYMHouvNcA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <00aa1f8a-9f2a-96f1-b088-e34c9ec76f3c@suse.com>
Date: Tue, 1 Feb 2022 12:47:34 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v3 7/9] x86/svm: VMEntry/Exit logic for MSR_SPEC_CTRL
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20220128132927.14997-8-andrew.cooper3@citrix.com>
 <20220131153621.8863-1-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20220131153621.8863-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM6PR10CA0041.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:209:80::18) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f80c8be2-f20f-46f2-7c34-08d9e578a40e
X-MS-TrafficTypeDiagnostic: AM8PR04MB7953:EE_
X-Microsoft-Antispam-PRVS:
	<AM8PR04MB7953C959E73CAC11AA3E0857B3269@AM8PR04MB7953.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	pfGyc/+z9pYrhGxwi3dRa2yelbUsQiJHlkLf+ZSlsVBTc6N0A0OZXiQKdvbdWl2lXCeKpjgZRDl2kgqcbFCZxdl+GgN6agj/3yi71PZgtygpY3ggLGG+iDMiORDczcVqtA9qYa3s65gaBusx5RwZiQ12L0knulwOzG+ue3cCAfigODTpCpf/ja+8q8LhJbdeOA0EZwkNlBq+hAuqzWJ/YupeK7uEffqlrYy6Nbr4GxQjGZZo4BTkqKWHWgbo0ZF9IeTcCe1UO/GOUFJuON9HhAhRp9iK2aT0Lqb5RbA4U8m9aIhZJkMFlySzpHH/tFkijpiubHLgL/UbaerWRC4uvPYAojF/pNwFn8lZpZ/k7TDqIUZBq+v5r3MPku42eQeWN1XEKfzi9AY2lPenL+nfq0pzkQuCRtIE0MONLdZtg6S0P+oovxVhdB3k6u+Ga3lcyzp0IimXcohvCuqSeo4f3tnLlbnoYy9Z7yGEXdCUCTXSqoTvjIOWCG6e26yrJ+8MDilhykgBH+y9GgySKcRIorqmsa0mwdtk0iACQL/BKlfhWyCjEZpf54E599xJXysTwrhR7nNU4Loj62YuWUcaeOOfqDNVkqN8VlkvBI4qLgwn6b9y+sP54B6DprAUQ4Sw+mDNlqejB2w4HYd0V2B5dYZXPJ3TvXNaS6LpESlSHpaWgPR6HMuLp5gDuYzkfkQpEpzn0kPEvI4OA2U3p5hiaETbo9WWmQCwLI/fGTcoTMbUqdNW+HWi64ZVGFRrVkNo
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(6486002)(31686004)(83380400001)(26005)(316002)(36756003)(38100700002)(186003)(6916009)(54906003)(53546011)(31696002)(6512007)(66476007)(66556008)(8676002)(8936002)(5660300002)(2616005)(4326008)(66946007)(2906002)(508600001)(6506007)(86362001)(43740500002)(45980500001)(20210929001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bFNmM3ZJeTJyL05ZVnEvclJ6YXpZWFJBSGI0NHRSVXlkRlhwajVWTVY3QnU5?=
 =?utf-8?B?RFpYMTNRd3kvMEVGZTI2T2ZLTmt0dm5nUGxwdVhUTHZFY3V1UG5VVGI1Qm5w?=
 =?utf-8?B?clQ5d0REbGx0a0F5dXZOVCtnQ1g3YmhyVXcvS0pkNGJqMm85emhkNkUwNlRQ?=
 =?utf-8?B?NGdnREhIelZtS1hzOTEwR2FzY04vMVF5cFNvYzRBNTVrTHIvSnV5aGhRWWNa?=
 =?utf-8?B?WUlqSGZFQ01aUTNhOHhxSjhoeTRyZ2hvajc2Vm1GSGRHeVFxS09QQ3ZpSmln?=
 =?utf-8?B?aTM2MU14eXJKbkc0VGE3K0VxYjlTUHh4d1h1SkNLWUR4M3lYak5kTTNuWHZy?=
 =?utf-8?B?Z3dxUHIwcEppRXdwZHlFZFNZSHpuM2hPYkg4K1hiY3BYMXZVenV0N2JFck53?=
 =?utf-8?B?RTRhakxmTWZLR243VVM1WUJORnRDdzdKYTJlNXRyKzdUeEJlUEw3SCtZUmYw?=
 =?utf-8?B?NUN4NGpsYU8xSzRrKzJpZzJHOTE3S2k4V1BiK3d1Q2p3N2M4WkYwODRyRDUv?=
 =?utf-8?B?NXVjZjZCOFkxVGZwb2s1VHhqM2VRR3grZTdqY01NUWxDUUlnbS9OQm0rVXAz?=
 =?utf-8?B?N1NnYVZmelhHQmtqbHRHS0cxbXBSczcrK3lGOG9NVHlJSkJmbE5RQ29MdXlP?=
 =?utf-8?B?U3o2aElnVkE2NzM3THl3UXFhNGFqVnppV1B5d1JQckVtTHc0dkZVRXVQemtF?=
 =?utf-8?B?MlZnQ1NmN1drQ091ZWlaRVJXc2JHbnhOYlpTbjNnMTZwVmp4cG83dWxXcWVD?=
 =?utf-8?B?N2p4ejZDZ0ptK1o3UXMyRFVwa0F5T1JlZktUU1E4T28yYmhKekladEJOT2Vr?=
 =?utf-8?B?djBYT3Q4ZXl6eUJkK1Q4bGU3ZVNBMnFOdUdMQTFVeklmb1BzSUZUNEloVnhJ?=
 =?utf-8?B?OVpKSEE3dGpPOXA1dU9jUVdOdkhkOWExYm1qUm5ZYlVMenU0OWNNWGh4eDF5?=
 =?utf-8?B?WHk4TEZLZWU0ZlQrbkQzRkl1QTB1VkZFSzJxaFhOa1NIamY0c1RPemR0YmIz?=
 =?utf-8?B?WmE0blhVL2ZXZ1JrczF6NlEzTHpRSm0veGNxU3JKZWVNVkRxTk5XVUVBcVBT?=
 =?utf-8?B?R1d4M1JFbGYxMlMrZVZ5ZTBzam5GZ3FtOW5kSk4vcFlPaWRvQWc5a0VsaEcx?=
 =?utf-8?B?VVArSE1pZXRIK05ZL25tMlRlRS9PTXg3ZTkxbitJeVl3TW5obVhEVTlNTXQv?=
 =?utf-8?B?WVFINEtNREZSK1hVWU1sZDhvZUVTTHlockJvL2s4aklka2M1Q0dQUGE4RWFZ?=
 =?utf-8?B?eHBBM1BQV01yZ1JFSzZNNSt3Y0lZbmV1MDFVUS9aQ3J3elJrNW9xdjQ5NUNx?=
 =?utf-8?B?SkdKRWtpc1hhT09NVDE3ZFpDajd4ZUZDb3hTZHhuMHFsQlJvQzJueWhCS0ZC?=
 =?utf-8?B?MFo4eFQ5eXdNL2Zkc25Cbms3SzYySEFtdjREdUYxazlLbFBlUGQrUDBmTkpJ?=
 =?utf-8?B?WHFDWW9yTnRBVCs3T2tLQnpsRlVselpFRFRvcDJqeWdwN3VGdDZqcTl5VGVQ?=
 =?utf-8?B?NmxsaVU5TENHT2VJdW1nMFZVb0c5N092L2FCUTU1TG5hQituLzcybU1jakdG?=
 =?utf-8?B?T2NnaG0yVWo4UlRiWCtyZHlUdGJNT0JEZ1M5SDZSOGQwOVVpQVBBL2U1RGRu?=
 =?utf-8?B?TEEvNmg4R0loZzRnb2ZpUzZnN2xNUkdtRitxaEhFV0I0MjV3WWhwYm1rcWo3?=
 =?utf-8?B?L0gwcWZnOVBRNmRvT1ZDUVoraHlZZ1dVdkJPc09STGJrL3g5cGJnSkJONzlW?=
 =?utf-8?B?aENiSkZaNlRLMnJIVzZBNGxiNXpiUERUSWlHRHVLMCtpcmM1LytVdVAxQ3N4?=
 =?utf-8?B?eG5wbk9rWnBSdy9LVjBoYXBSQjl6ejJUeEgxQ290MEUxT0Q4RUdTbitsMWI1?=
 =?utf-8?B?TzBVVG82dmFIMWRkc2dReFZURmFaMGdhbWM3S2FvaVdXYmFrMXVDZFhxbVBh?=
 =?utf-8?B?Mkc5UEtXQW83RHNpSXdBMmF0MmNrMzZlS3I4MEFJUGV3aUpveDlnKytiYWJl?=
 =?utf-8?B?ZFc5ZjJ3YUdid00waC9HZEVFdCt6RXkxTC9PLzYxaVlGUkQ1OFMxVEdFUDZY?=
 =?utf-8?B?RnBLa3VjbzBNR0FwcXM1eU9XSTFlV0RpNnduMTVXMHorUnhUQnhEYWxYQkxS?=
 =?utf-8?B?MUFTbG9rQWxkNkkzRG12akkwRTJGOHF1UmpyNERxUjBlTTRBMFRmczRnNjhY?=
 =?utf-8?Q?eGYFX8HIArNFQhgr9jncqao=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f80c8be2-f20f-46f2-7c34-08d9e578a40e
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Feb 2022 11:47:36.2134
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QhZidrHzgZfjZVS2Oi8xEg4LQvN1nz+bdjfcwTD8FE+UjE/cgJHW7aYnJwnmiZp4JcHfhF0NabDlAS7GO68O8g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR04MB7953

On 31.01.2022 16:36, Andrew Cooper wrote:
> Hardware maintains both host and guest versions of MSR_SPEC_CTRL, but guests
> run with the logical OR of both values.  Therefore, in principle we want to
> clear Xen's value before entering the guest.  However, for migration
> compatibility,

I think you've explained this to me before, but I can't seem to put
all of it together already now. Could expand on how a non-zero value
behind a guest's back can help with migration compatibility? At the
first glance I would be inclined to say only what the guest actually
gets to see and use can affect its migration.

> and for performance reasons with SEV-SNP guests, we want the
> ability to use a nonzero value behind the guest's back.  Use vcpu_msrs to hold
> this value, with the guest value in the VMCB.
> 
> On the VMEntry path, adjusting MSR_SPEC_CTRL must be done after CLGI so as to
> be atomic with respect to NMIs/etc.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Preferably with the above expansion and with one further style
issue (see below) taken care of
Reviewed-by: Jan Beulich <jbeulich@suse.com>

> --- a/xen/arch/x86/hvm/svm/entry.S
> +++ b/xen/arch/x86/hvm/svm/entry.S
> @@ -55,11 +55,23 @@ __UNLIKELY_END(nsvm_hap)
>          mov  %rsp, %rdi
>          call svm_vmenter_helper
>  
> -        mov VCPU_arch_msrs(%rbx), %rax
> -        mov VCPUMSR_spec_ctrl_raw(%rax), %eax
> +        clgi
>  
>          /* WARNING! `ret`, `call *`, `jmp *` not safe beyond this point. */
> -        /* SPEC_CTRL_EXIT_TO_SVM   (nothing currently) */
> +        /* SPEC_CTRL_EXIT_TO_SVM       Req: b=curr %rsp=regs/cpuinfo, Clob: acd */
> +        .macro svm_vmentry_spec_ctrl
> +            mov    VCPU_arch_msrs(%rbx), %rax
> +            movzbl CPUINFO_last_spec_ctrl(%rsp), %edx
> +            mov    VCPUMSR_spec_ctrl_raw(%rax), %eax
> +            cmp    %edx, %eax
> +            je 1f  /* Skip write if value is correct. */

Wold you mind padding the insn operand properly, in line with all
others nearby?

Jan


