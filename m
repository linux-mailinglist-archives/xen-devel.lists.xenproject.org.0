Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 28B4330F4A1
	for <lists+xen-devel@lfdr.de>; Thu,  4 Feb 2021 15:10:51 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.81316.150081 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l7fL5-0006dr-31; Thu, 04 Feb 2021 14:10:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 81316.150081; Thu, 04 Feb 2021 14:10:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l7fL4-0006dS-WA; Thu, 04 Feb 2021 14:10:30 +0000
Received: by outflank-mailman (input) for mailman id 81316;
 Thu, 04 Feb 2021 14:10:28 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=KAxh=HG=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1l7fL2-0006dN-J9
 for xen-devel@lists.xenproject.org; Thu, 04 Feb 2021 14:10:28 +0000
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 26f30117-d8bd-4aba-9e37-e0ee7b81b215;
 Thu, 04 Feb 2021 14:10:26 +0000 (UTC)
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
X-Inumbo-ID: 26f30117-d8bd-4aba-9e37-e0ee7b81b215
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1612447826;
  h=subject:to:cc:references:from:message-id:date:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=mXg3pdca5qjkelDHIP/8BM1Qa2LMYqk2wsfT4UaRLxg=;
  b=L2mk8dY095RBGYZIDxJSeYlmrIRhbuTK758AJbqLLP4Dih+kH0OXEmN1
   JWglInCUZ5GWLrsMFwjyX00gL/xFChTwZ7C2WAC/Yrl7CCc/JNkJ8hgXI
   7+2fHp+VXB1eB1beFaYcZ31X2B5AZjLJdGKFF97bRw6I9MKqW7b2FpZYw
   A=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: v/wqT7AszrOmRlqj7vbRBa/RCTVc9Ro5Sn3N0ggZUsivQ6ovggm7oGJkNAY2s+lPdx97nqmfJ2
 NDFZzX99/5q1A8upXzqgKXQu1ec/WoGjMVCtUMeZXh4sSqOBSJGe+UzqsWw0dTUClxm9C9I3MM
 maLX4B2/eFEztGTDx3GJYnqIhffTt4ObHL6gxKtKdthi70ZYZsjcdi5Uh2raE75jvBU46AYJEe
 /It8OMEBNB6hV8cY/EYoqa4Cudt6iXSuCytFySioyVSn1NyqjoAsa6fvpzaVobtZa4nU2Lk4yM
 2S0=
X-SBRS: 5.2
X-MesageID: 37896267
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.79,401,1602561600"; 
   d="scan'208";a="37896267"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CjDRUH4A+yDLFCwYGTNnkVZctqW5VGPMNlkuAkSYU7/qNfYClzY7bzpXyECRSorTRJO+DTJH46aHreP3WMr3sLqzuDZWQNlWqT+8S8AtDxzQhxkhxHjF2e2Iel1d+NsmJUU0GSoQAK6M/bl5LYdrs+3sgblrpl3UFDwBCkf21ONb1R5BAi4jB6Z01LCfPjLfoy+OSKjWAKr3e/Vc8feoIP20J85uT+p1i80o9PskM8CBHFAW/+m1VCevFqJL8nacKIGkeO7I2mh4wM82vDZul9ct99tuwmNoCDdRGtNfM5vN9VvB8Qxg/gVOKnZkp0RNe9wb4DH7zlrkbDmEwH5hCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oxpNE2g+n8xSmWCluve2WuH5dPuFNvsuDYvcWEDrpfo=;
 b=InsJcDbieWeeFjdY4/inttwdpqUzmNAt1rJ6Mc47x6AKzRkdDeWMOwVzOc3s/FLS6hEoRrgCf2vMnCLH2w+IqT/VQdxd/nZex86ubBnVoxfys95DNd+GcvDHlH1qZQooyHB4gGVwVttQz/aOpa6ZzcPY1SDCTiTpWz/i3HzUvLd7VR79yZ+TAu0tbs2iPorOWrWI9vWVJvjNVWlvlhGDWPt3OgxwQO/tcav2/45zMMRft4Sy/dxfMfSd5825DH7sKQ1bgJcmL+YBMJIcg9syMMmrYfuwwJRrqGNEojuvGBItNlh6HNoXy+28Y0IOa8zIszvihzoVm8xYrUsltnrxKw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oxpNE2g+n8xSmWCluve2WuH5dPuFNvsuDYvcWEDrpfo=;
 b=Bq44WTtNnRUbsyrBm9yuNR9ERVwlInS1EpIBJx7asbjAYDPRPnkp7WXzJaoXcRdJfDFISO52F/uc31K5eqPxeKen5pfwzeRV7FvtBnY8H3Qdwjh8D7bJ3P46bfxFRO40c6l7LAuYa15/COsSLbhyLJNt4tDUHR8Y4W93b6JodAw=
Subject: Re: [PATCH] x86/HVM: support emulated UMIP
To: Jan Beulich <jbeulich@suse.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
	<roger.pau@citrix.com>, Kevin Tian <kevin.tian@intel.com>, Jun Nakajima
	<jun.nakajima@intel.com>, Tamas K Lengyel <tamas@tklengyel.com>
References: <5a8b1c37-5f53-746f-ba87-778d4d980d99@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <c717bd30-27b2-625d-576e-eb41a7192c55@citrix.com>
Date: Thu, 4 Feb 2021 14:10:16 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
In-Reply-To: <5a8b1c37-5f53-746f-ba87-778d4d980d99@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
X-ClientProxiedBy: LO4P123CA0245.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1a7::16) To BYAPR03MB4728.namprd03.prod.outlook.com
 (2603:10b6:a03:13a::24)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4e40d794-fbff-49bb-6077-08d8c9169c9c
X-MS-TrafficTypeDiagnostic: BY5PR03MB5185:
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BY5PR03MB51857BF4BBA6953978286ADABAB39@BY5PR03MB5185.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: NBL5/ncZCsiHFASFnmbA5Lrfj4DiE6PF2bG36lauo84j31MY7U+Csm1nKKUy18X5nWQBD1xpPTq0ImbOLtzU+cLuP2rK6T997BLDHX+x1n3jU6YzxpBffl2NHA/jreRxdQ5RScnT7qEiIYANzbeCeJ2t8c0kixW1+3tcpisLbYH73A5R3cgC6mCnwIeOjWHTdaQwyGwpPjw+/h5fPYzh02dKSwviHiNY1rUq6S28tXCkyR6qROcDwhTzmgjE6IwP5WF0sgy+fazqfrSGEPHOuNbzsbjl3DJPSAEezZQuhYP4GE2pIFQH+MqcsHspXj8A7ncnmE+0WL6Bi/h3xNuPQGCX+rGR15ta6AXKMXLoDpSaHcGMneONlZK2P46pgOEt1HCt4rCrG8VUYkk4eZMt9xuOfNajCf/P1jYUs1nRkLvLBdQ/LlYszwloKO/FS94eiGPkpsJhlH3c8iMbA/EUDZxvuDbAXUw242Ycf+zh0TFwzrUKVIwoJZ7lfHYqTCrfYB3Ykdby+uoUnzcNm5fv4T14GLjOxZSPsFOnOtaWCLUR8ug9FIrIQ3CXqXn4VzY01DYNRH9BOvxlCH/N5qvrAWTJHmbEfOL8d/2lNFZ+VR0=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB4728.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(346002)(39860400002)(366004)(396003)(136003)(186003)(6486002)(36756003)(2906002)(26005)(6666004)(16526019)(316002)(16576012)(53546011)(31686004)(83380400001)(86362001)(5660300002)(54906003)(478600001)(8936002)(8676002)(956004)(4326008)(66476007)(66946007)(31696002)(2616005)(66556008)(110136005)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?THpoWE12aDJaYkRGWmhTZVJqYnVEVXo5anlRT3B6NTBQMzVJaDdOMmZhc2c0?=
 =?utf-8?B?YmdKOUFXRkM3N0RaNTJLWWtkRTVneVpnT2JxU0RCdmg3OUFNUzFuY0h3OEVl?=
 =?utf-8?B?YzBwMFR2cytjLzhxRkd2bDY5SHdscEowQ3A4TS9aOU1CcXhQY1BwK1h5MXBW?=
 =?utf-8?B?OVNCYlNEc0ppK0l5ZlJYUmxMczkxSmd4cWxrK0xhOHJiM1AzZFN3c1NxbVpi?=
 =?utf-8?B?RHk4TnAxSHVWQ1krMUc3WHpHOHBqS1hiQnNTQytNTkNvM0RVSkZjY1BuakFm?=
 =?utf-8?B?RTlpeVBVOGVhVm00T1dGNHZWYzRNK3FZV0szVHFBMG82bjBYSEMyQjdTRHhw?=
 =?utf-8?B?N3ozS3NmSTV4K3M2MnBidENDM3BqcVRCWGJYd1BUSFlxZGErRWZ1QmVYV2Jz?=
 =?utf-8?B?akJGSS9LM1ZNdis0NCtlYjYwdEVTa2NnR3NVMzRvL1FaMTdZZ0QwdktiRzY2?=
 =?utf-8?B?M3MvNXk0bW90bUg1Qmx4NW53b0VzYmpTT3RxU0Y4MUNBS003TTdZTWM0VjFt?=
 =?utf-8?B?YVVMbks5K1ZuaVN1V3lWcnZEMjUzczZFeHA3bTJOS1RpcUt2bTQ0cUNST29E?=
 =?utf-8?B?UFZlRVRrOFVZNHhiZFFqenBWM0xmU0xnaEU5cXpoU3A2M0RpV1huak9WRUlz?=
 =?utf-8?B?VjZpNC9NRm5YQURmTHk5OVdlSWJQODVha3BaUFU4eTc4S0JiYUZtWCtrdXNT?=
 =?utf-8?B?R3BxWWt3K0d3SGc5UzVWWkNTMHZ3UGhVbTY4bnh6WHJZSFE4a0FmS3JwaEdO?=
 =?utf-8?B?ZmQ3c2R1RXM2RUdoRmdodFFVVWErcEhWV0lEM0tOUUhOODhad2pFUDhRQXhR?=
 =?utf-8?B?dWRBS0IwcVhFVW1qTW9hU09CRmFTUEZXNWNwcGZHWTN3ZHRLSG1hUHZMZTZt?=
 =?utf-8?B?dW5qV2cxU0VCcWY2aS95cWF0UmhWK2d0bUNNQXBKUy8weVFPSjFnempGL0NH?=
 =?utf-8?B?UnQ5d0xObmtvaFBnOTZTVXV2OHRVUDBzYlgyMHNCU3VKRGlkdEl0SFVpc1Ar?=
 =?utf-8?B?S09hTXp1emZIWjR6VGZXLzl2SjgwQlNBbmJ6WlNQWUVENENHbVJtS3grOEto?=
 =?utf-8?B?M0ZWUFVreWd1Y0trbmx6Z203TXNyNUhVdnk3MnovZnFTQUhlTjBES0hHK21U?=
 =?utf-8?B?RStUaVZZU2tpSW14MFZNVllVWjluazkzblpXUzhRUmMyd0NDWkthNjZYNEpr?=
 =?utf-8?B?dldvMjdvRzdKZVFPTlZYVno3K2FManVuMW9xWEw4Wm4zYUp6WEJUbUlSMlRj?=
 =?utf-8?B?RkhPcFBzSWc3UXl1eUFGZGxVTWp0c1ZESVpqdjFnVTFEMW1xWFVwNkcxS0hP?=
 =?utf-8?B?V1NhYjl5RmRmbU5XRlBHMkZ3Q3lQVE9zbnFaSXF3aUNRSk1Nd2pQeUR3Zys5?=
 =?utf-8?B?QVltK3hOL0VSMS80dkc4b0NpYkxjbmR0d3Jld3J4L0tWSFBna29XOG1Da2ZU?=
 =?utf-8?B?WENLcjhrL1NDV0lxOU1ZMkdVelBEVXgybWVaNDZRPT0=?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 4e40d794-fbff-49bb-6077-08d8c9169c9c
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB4728.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Feb 2021 14:10:22.8411
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7jDkSgn3ySZLhzvGPeiryqjGATC1+8aQPU3x2iEHsIJ2yUx+tBDlnBZ/5l24t1EsT7BM9gg7QQbHE4E3u111cQ+cnRUcpnYSHv7DfSwE9IE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR03MB5185
X-OriginatorOrg: citrix.com

On 29/01/2021 11:45, Jan Beulich wrote:
> There are three noteworthy drawbacks:
> 1) The intercepts we need to enable here are CPL-independent, i.e. we
>    now have to emulate certain instructions for ring 0.
> 2) On VMX there's no intercept for SMSW, so the emulation isn't really
>    complete there.
> 3) The CR4 write intercept on SVM is lower priority than all exception
>    checks, so we need to intercept #GP.
> Therefore this emulation doesn't get offered to guests by default.
>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

I wonder if it would be helpful for this to be 3 patches, simply because
of the differing complexity of the VT-x and SVM pieces.

> --- a/xen/arch/x86/cpuid.c
> +++ b/xen/arch/x86/cpuid.c
> @@ -453,6 +453,13 @@ static void __init calculate_hvm_max_pol
>      __set_bit(X86_FEATURE_X2APIC, hvm_featureset);
>  
>      /*
> +     * Xen can often provide UMIP emulation to HVM guests even if the host
> +     * doesn't have such functionality.
> +     */
> +    if ( hvm_funcs.set_descriptor_access_exiting )

No need for this check.  Exiting is available on all generations and
vendors.

Also, the header file probably wants a ! annotation for UMIP to signify
that we doing something special with it.

> +        __set_bit(X86_FEATURE_UMIP, hvm_featureset);
> +
> +    /*
>       * On AMD, PV guests are entirely unable to use SYSENTER as Xen runs in
>       * long mode (and init_amd() has cleared it out of host capabilities), but
>       * HVM guests are able if running in protected mode.
> --- a/xen/arch/x86/hvm/hvm.c
> +++ b/xen/arch/x86/hvm/hvm.c
> @@ -991,7 +991,8 @@ unsigned long hvm_cr4_guest_valid_bits(c
>                                  X86_CR4_PCE                    |
>              (p->basic.fxsr    ? X86_CR4_OSFXSR            : 0) |
>              (p->basic.sse     ? X86_CR4_OSXMMEXCPT        : 0) |
> -            (p->feat.umip     ? X86_CR4_UMIP              : 0) |
> +            ((p == &host_cpuid_policy ? &hvm_max_cpuid_policy : p)->feat.umip
> +                              ? X86_CR4_UMIP              : 0) |

This hunk wants dropping.  p can't alias host_cpuid_policy any more.

(and for future changes which do look like this, a local bool please,
per the comment.)

>              (vmxe             ? X86_CR4_VMXE              : 0) |
>              (p->feat.fsgsbase ? X86_CR4_FSGSBASE          : 0) |
>              (p->basic.pcid    ? X86_CR4_PCIDE             : 0) |
> @@ -3731,6 +3732,13 @@ int hvm_descriptor_access_intercept(uint
>      struct vcpu *curr = current;
>      struct domain *currd = curr->domain;
>  
> +    if ( (is_write || curr->arch.hvm.guest_cr[4] & X86_CR4_UMIP) &&

Brackets for & expression?

> +         hvm_get_cpl(curr) )
> +    {
> +        hvm_inject_hw_exception(TRAP_gp_fault, 0);
> +        return X86EMUL_OKAY;
> +    }

I believe this is a logical change for monitor - previously, non-ring0
events would go all the way to userspace.

I don't expect this to be an issue - monitoring agents really shouldn't
be interested in userspace actions the guest kernel is trying to turn
into #GP.

CC'ing Tamas for his opinion.

> +
>      if ( currd->arch.monitor.descriptor_access_enabled )
>      {
>          ASSERT(curr->arch.vm_event);
> --- a/xen/arch/x86/hvm/svm/svm.c
> +++ b/xen/arch/x86/hvm/svm/svm.c
> @@ -547,6 +547,28 @@ void svm_update_guest_cr(struct vcpu *v,
>              value &= ~(X86_CR4_SMEP | X86_CR4_SMAP);
>          }
>  
> +        if ( v->domain->arch.cpuid->feat.umip && !cpu_has_umip )

Throughout the series, examples like this should have the !cpu_has_umip
clause first.  It is static per host, rather than variable per VM, and
will improve the branch prediction.

Where the logic is equivalent, it is best to have the clauses in
stability order, as this will prevent a modern CPU from even evaluating
the CPUID policy.

> +        {
> +            u32 general1_intercepts = vmcb_get_general1_intercepts(vmcb);
> +
> +            if ( v->arch.hvm.guest_cr[4] & X86_CR4_UMIP )
> +            {
> +                value &= ~X86_CR4_UMIP;
> +                ASSERT(vmcb_get_cr_intercepts(vmcb) & CR_INTERCEPT_CR0_READ);

It occurs to me that adding CR0 read exiting adds a lot of complexity
for very little gain.

From a practical standpoint, UMIP exists to block SIDT/SGDT which are
the two instructions which confer an attacker with useful information
(linear addresses of the IDT/GDT respectively).  SLDT/STR only confer a
16 bit index within the GDT (fixed per OS), and SMSW is as good as a
constant these days.

Given that Intel cannot intercept SMSW at all and we've already accepted
that as a limitation vs architectural UMIP, I don't think extra
complexity on AMD is worth the gain.

> @@ -2728,6 +2767,14 @@ void svm_vmexit_handler(struct cpu_user_
>          svm_fpu_dirty_intercept();
>          break;
>  
> +    case VMEXIT_EXCEPTION_GP:
> +        HVMTRACE_1D(TRAP, TRAP_gp_fault);
> +        /* We only care about ring 0 faults with error code zero. */
> +        if ( vmcb->exitinfo1 || vmcb_get_cpl(vmcb) ||
> +             !hvm_emulate_one_insn(is_cr4_write, "CR4 write") )
> +            hvm_inject_hw_exception(TRAP_gp_fault, vmcb->exitinfo1);

I should post one of my pending SVM cleanup patches, which further
deconstructs exitinfo into more usefully named fields.

The comment should include *why* we only care about this state.  It
needs to mention emulated UMIP, and the priority order of #GP and VMExit.

> --- a/xen/arch/x86/hvm/vmx/vmcs.c
> +++ b/xen/arch/x86/hvm/vmx/vmcs.c
> @@ -1537,6 +1552,7 @@ static void vmx_update_guest_cr(struct v
>                                               (X86_CR4_PSE | X86_CR4_SMEP |
>                                                X86_CR4_SMAP)
>                                               : 0;
> +            v->arch.hvm.vmx.cr4_host_mask |= cpu_has_umip ? 0 : X86_CR4_UMIP;

if ( !cpu_has_umip )
     v->arch.hvm.vmx.cr4_host_mask |= X86_CR4_UMIP;

~Andrew

