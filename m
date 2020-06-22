Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BFE52037E2
	for <lists+xen-devel@lfdr.de>; Mon, 22 Jun 2020 15:25:26 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jnMRp-0007Jz-Te; Mon, 22 Jun 2020 13:25:17 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ahnO=AD=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jnMRo-0007Ju-NM
 for xen-devel@lists.xenproject.org; Mon, 22 Jun 2020 13:25:16 +0000
X-Inumbo-ID: ce6c9710-b48b-11ea-be8f-12813bfff9fa
Received: from EUR01-VE1-obe.outbound.protection.outlook.com (unknown
 [40.107.14.40]) by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id ce6c9710-b48b-11ea-be8f-12813bfff9fa;
 Mon, 22 Jun 2020 13:25:15 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WXzTW0ZXn/0xE2NDPpQaIKFMCxWlIv2mwzj/NUzOBpuhWlhUSadhDoSoSn5zYeZXRa1CafYkGejwd1ZwqECcJc/cZwbsn3x1nvmsaYQEgU8otmhxWZfvOWk8lF8zwpSmDycgpuXm1zw0QoVD7ogslkPs5QHruJt21LMlbaytZI4x3+7C39WAl65iJl7pBkGm3H6lV1/46xH+ZlUjfrHavgEDTRx5X7IPIhbkMdfL0luBjpOzI8fTB6Uz3fFosgaGB+nVmO3edKUz5hPLuF+yvwIzpLIKtUTzcfT0ZUN0MZUUtjIIyKTj01mclocy5DA09I57eekfUYbRxGPLWwggcw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=h/3qiXh/KRx32LrOeslzu7ZsTcQLk4cSzuTZWmdNvO4=;
 b=Nx7Ky2UR/tkzPsc4dmXkv309cFP19gMTym3rdcLTXls+8zZmgJmMep5UuYeQMZ6xg3aCg6T62VX43p5rB1qSpGB3K+hyVjcjm8w+RiJOoR4HocbtYvk1TIkFBg5EpjSV2aTQy8e4AYyvUDnilgoQJHjBkrs2wimlsBe8yshbxNZhkibUd/zMCSW5Ogsr16gaoOMCRbvT7Q0sCUiX+a0ymdw23e1hqFnwFsKYCSmu5F3puDHK+Imenf7qRjN5qioVPsbbSGkjYkhlKkpmWr1+IoBBiFN4LFpUCVlWtA2t+SOJ0UNzwoF9bhW/cK5w0t5V1GxItY8hqyDsAZncneAWtg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mysuse.onmicrosoft.com; s=selector1-mysuse-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=h/3qiXh/KRx32LrOeslzu7ZsTcQLk4cSzuTZWmdNvO4=;
 b=Lv/mZzYcRZVReji8eHPRcCE0cPr7N7+AaPhcQKvEfRDrDLJnSw+z3Tlgxhg1WW/1369qMIxp6jIYhB+tOZs/tOhpioytaP7w5zX73NQxWJ/b+e8ZX84w8cAAK+8rq2+lYU0P6JWzI1qWpUEcTg4lShMWn/1Yu5L9TxurR4Nk16vOFI3sM08pM3dCGnQBpHI5QR909c848kuhjeW647U65E8bsWUbYO1fSf3vPjtsLVGaR6oDB5V/56WGC6Dqp6v9tJOMN335VjnXav71vgctlMt2olSL18MNU3nJQrC9nUAYPNwUfS09wL+zfNKiX15eq3JjQoDSpCmoSxH14YBxQw==
Authentication-Results: intel.com; dkim=none (message not signed)
 header.d=none;intel.com; dmarc=none action=none header.from=suse.com;
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB5421.eurprd04.prod.outlook.com (2603:10a6:803:d5::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3109.23; Mon, 22 Jun
 2020 13:25:13 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::3de3:8e44:3eee:8600]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::3de3:8e44:3eee:8600%6]) with mapi id 15.20.3109.027; Mon, 22 Jun 2020
 13:25:13 +0000
Subject: Re: [PATCH v2 4/7] x86/vmx: add do_vmtrace_op
To: =?UTF-8?Q?Micha=c5=82_Leszczy=c5=84ski?= <michal.leszczynski@cert.pl>
References: <122238637.9820857.1592523264685.JavaMail.zimbra@cert.pl>
 <1005194077.9820950.1592523663199.JavaMail.zimbra@cert.pl>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <4e040500-0532-2231-f5b7-c61e97a0a0c5@suse.com>
Date: Mon, 22 Jun 2020 15:25:02 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
In-Reply-To: <1005194077.9820950.1592523663199.JavaMail.zimbra@cert.pl>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AM3PR05CA0124.eurprd05.prod.outlook.com
 (2603:10a6:207:2::26) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [10.156.60.99] (37.24.206.209) by
 AM3PR05CA0124.eurprd05.prod.outlook.com (2603:10a6:207:2::26) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3109.22 via Frontend Transport; Mon, 22 Jun 2020 13:25:12 +0000
X-Originating-IP: [37.24.206.209]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: adfe08e7-065c-42c3-6a60-08d816afb1e3
X-MS-TrafficTypeDiagnostic: VI1PR04MB5421:
X-Microsoft-Antispam-PRVS: <VI1PR04MB5421EA53322F6C1D50C8FCEAB3970@VI1PR04MB5421.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-Forefront-PRVS: 0442E569BC
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: MLZynMEBLRNihZzKpzp8MYIfHXe6FuZCuvX4E3FMyrf/oXvAqMtoYWBPOM0xmZT4EQvCyKUZQ0Vra0QUfr/MZZ5xMesYGtQmXs3hTQe2alYqZUNFXaMT5uFiR4EyZEuKilNRKNlmK2yMHeKK4jNfuNzZhunKAdOIV32rELnQMAzp3kcoqhfb5LBzJUraR8Y9UZ98FUZ8e/YbHCR0M7E0BW3aWJKPUotQ15Ydvd6DOomE5TIA8aSGG7i5p5VIz9BUqtoxs7umR5E4Jq2cEyhBzkDOmLfHtwBBbUdgZRw7Oz7yBAVUD20E6ieLa90pgW9M2cajGzBj8APt7rG1EwgoOcGJSQt51ssqKTUuqBiBqivhupgG1qh1H1ZTD2agQV/T
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR04MB5600.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(136003)(396003)(346002)(366004)(39860400002)(376002)(7416002)(5660300002)(6666004)(6486002)(16576012)(6916009)(316002)(8936002)(956004)(8676002)(2616005)(66574015)(66556008)(66476007)(66946007)(186003)(53546011)(31686004)(54906003)(16526019)(52116002)(26005)(2906002)(36756003)(86362001)(478600001)(4326008)(83380400001)(31696002)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: xQuexSc+MAH+doJ4yTKngv8bnSjdEBHOWA9yJAzLZVFr6hEpRfapL2RP1HgIurQMz4gRqbu8GlL+31mLhJixVWSyZB1j8WJAh3i5nI73nJaVsQs47fKo18chfdyxdhzXpsLB4wNXUo3ksSAl1snmP+c3/LdgRXzqpTHyma0jHCH5ki/iRIzhpH0wPRNvyD+8JljC0G/f5S4XLc6xS+LsOFV/HR02stHhwfMWxBAs0O5MxBJIvq8osASIZKdnEXfDs5EH0WZaCl2+D5219X+ZbNjd/KroHc4YB3cs+uvRbaGHQo3k+LtRYQYt2b+kzY/LkKYYBeKpHh+Ru8r/SpUN75ttwFtmmOPM2BIb/n+N4aWqHtTUj0TyEWzRABwP8xsrN3hKmkWT17NqCUN2EQFprX68QvmwMDkARXUB9prxk2KUUXRKA6Uds8IDESEjtMqxKCyCKNck2sUbeutcP9tK4RPRRqCFVRHaK/5n2cdDrjU=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: adfe08e7-065c-42c3-6a60-08d816afb1e3
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jun 2020 13:25:13.3853 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EdqMKHyD+oFkXcm/aQv1u9VVsn2aGf3zqh178vsqNafLMPDtHssBLCox7vCgyCpDnuPh8pBBbKuQKuZDWqLxng==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB5421
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Kevin Tian <kevin.tian@intel.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, "Kang, Luwei" <luwei.kang@intel.com>,
 Jun Nakajima <jun.nakajima@intel.com>,
 Tamas K Lengyel <tamas.k.lengyel@gmail.com>,
 Xen-devel <xen-devel@lists.xenproject.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 19.06.2020 01:41, Michał Leszczyński wrote:
> @@ -1631,6 +1649,8 @@ void hvm_vcpu_destroy(struct vcpu *v)
>      vlapic_destroy(v);
>  
>      hvm_vcpu_cacheattr_destroy(v);
> +
> +    hvm_vmtrace_destroy(v);
>  }

Whenever possible resource cleanup should occur from
hvm_domain_relinquish_resources(). Is there anything preventing
this here?

> @@ -4066,6 +4086,51 @@ static int hvmop_set_evtchn_upcall_vector(
>      return 0;
>  }
>  
> +static int hvm_set_vmtrace_pt_size(struct domain *d, uint64_t value)
> +{
> +    void *buf;
> +    unsigned int buf_order;
> +    struct page_info *pg;
> +    struct ipt_state *ipt;
> +    struct vcpu *v;
> +
> +    if ( value < PAGE_SIZE ||
> +         value > GB(4) ||
> +         ( value & (value - 1) ) ) {
> +        /* we don't accept trace buffer size smaller than single page
> +         * and the upper bound is defined as 4GB in the specification */
> +        return -EINVAL;
> +    }
> +
> +    for_each_vcpu ( d, v )
> +    {
> +        buf_order = get_order_from_bytes(value);
> +        pg = alloc_domheap_pages(d, buf_order, MEMF_no_refcount);
> +
> +        if ( !pg )
> +            return -EFAULT;
> +
> +        buf = page_to_virt(pg);

In addition to what Roger has said here, just fyi that you can't
use page_to_virt() on anything returned from alloc_domheap_pages(),
unless you suitably restrict the address range such that the
result is guaranteed to have a direct mapping.

> @@ -4949,6 +5018,100 @@ static int compat_altp2m_op(
>      return rc;
>  }
>  
> +static int do_vmtrace_op(XEN_GUEST_HANDLE_PARAM(void) arg)
> +{
> +    struct xen_hvm_vmtrace_op a;
> +    struct domain *d;
> +    int rc;
> +    struct vcpu *v;
> +    struct ipt_state *ipt;
> +
> +    if ( !hvm_pt_supported() )
> +        return -EOPNOTSUPP;
> +
> +    if ( copy_from_guest(&a, arg, 1) )
> +        return -EFAULT;
> +
> +    if ( a.version != HVMOP_VMTRACE_INTERFACE_VERSION )
> +        return -EINVAL;
> +
> +    d = rcu_lock_domain_by_any_id(a.domain);
> +    spin_lock(&d->vmtrace_lock);
> +
> +    if ( d == NULL )
> +        return -ESRCH;
> +
> +    if ( !is_hvm_domain(d) )
> +    {
> +        rc = -EOPNOTSUPP;
> +        goto out;
> +    }
> +
> +    domain_pause(d);

Who's the intended caller of this interface? You making it a hvm-op
suggests the guest may itself call this. But of course a guest
can't pause itself. If this is supposed to be a tools-only interface,
then you should frame it suitably in the public header and of course
you need to enforce this here (which would e.g. mean you shouldn't
use rcu_lock_domain_by_any_id()).

Also please take a look at hvm/ioreq.c, which makes quite a bit of
use of domain_pause(). In particular I think you want to acquire
the lock only after having paused the domain.

> +    if ( a.vcpu >= d->max_vcpus )
> +    {
> +        rc = -EINVAL;
> +        goto out;
> +    }
> +
> +    v = d->vcpu[a.vcpu];
> +    ipt = v->arch.hvm.vmx.ipt_state;
> +
> +    if ( !ipt )
> +    {
> +        /*
> +	 * PT must be first initialized upon domain creation.
> +	 */
> +        rc = -EINVAL;
> +        goto out;
> +    }
> +
> +    switch ( a.cmd )
> +    {
> +    case HVMOP_vmtrace_ipt_enable:
> +        if ( vmx_add_guest_msr(v, MSR_RTIT_CTL,
> +                               RTIT_CTL_TRACEEN | RTIT_CTL_OS |
> +                               RTIT_CTL_USR | RTIT_CTL_BRANCH_EN) )
> +        {
> +            rc = -EFAULT;
> +            goto out;
> +        }
> +
> +        ipt->active = 1;
> +        break;
> +    case HVMOP_vmtrace_ipt_disable:
> +        if ( vmx_add_guest_msr(v, MSR_RTIT_CTL, 0) )

Shouldn't you rather remove the MSR from the load list here?

Is any of what you do in this switch() actually legitimate without
hvm_set_vmtrace_pt_size() having got called for the guest? From
remarks elsewhere I imply you expect the param that you currently
use to be set upon domain creation time, but at the very least the
potentially big buffer should imo not get allocated up front, but
only when tracing is to actually be enabled.

Also please have blank lines between individual case blocks.

> +        {
> +            rc = -EFAULT;
> +            goto out;
> +        }
> +
> +        ipt->active = 0;
> +        break;
> +    case HVMOP_vmtrace_ipt_get_offset:
> +        a.offset = ipt->output_mask.offset;
> +        break;
> +    default:
> +        rc = -EOPNOTSUPP;
> +        goto out;
> +    }
> +
> +    rc = -EFAULT;
> +    if ( __copy_to_guest(arg, &a, 1) )
> +      goto out;

Only HVMOP_vmtrace_ipt_get_offset needs this - please avoid copying
back on other paths. Even there you could in principle copy back
just the one field; the function taking XEN_GUEST_HANDLE_PARAM(void)
gets in the way of this, though.

The last line above also has an indentation issue, but the use of
"goto" in this case can be avoided anyway.

> +    rc = 0;
> +
> + out:
> +    domain_unpause(d);
> +    spin_unlock(&d->vmtrace_lock);
> +    rcu_unlock_domain(d);
> +
> +    return rc;
> +}
> +
> +DEFINE_XEN_GUEST_HANDLE(compat_hvm_vmtrace_op_t);

I don't see any use of this handle further down - why do you force
it being declared?

> --- a/xen/arch/x86/mm.c
> +++ b/xen/arch/x86/mm.c
> @@ -4624,6 +4624,43 @@ int arch_acquire_resource(struct domain *d, unsigned int type,
>          }
>          break;
>      }
> +
> +    case XENMEM_resource_vmtrace_buf:
> +    {
> +        mfn_t mfn;
> +        unsigned int i;
> +        struct ipt_state *ipt;
> +
> +        if ( id >= d->max_vcpus )
> +        {
> +            rc = -EINVAL;
> +            break;
> +        }
> +
> +        ipt = d->vcpu[id]->arch.hvm.vmx.ipt_state;

Please use domain_vcpu() here.

> +        if ( !ipt )
> +        {
> +            rc = -EINVAL;
> +            break;
> +        }
> +
> +        mfn = mfn_x(ipt->output_base >> PAGE_SHIFT);

maddr_to_mfn()?

> +        if (nr_frames > ( ( ipt->output_mask.size + 1 ) >> PAGE_SHIFT ))
> +        {
> +            rc = -EINVAL;
> +            break;
> +        }
> +
> +        rc = 0;
> +        for ( i = 0; i < nr_frames; i++ )
> +        {
> +            mfn_list[i] = mfn_add(mfn, i);
> +        }

Please omit the braces in cases like this one.

> --- a/xen/include/asm-x86/hvm/vmx/vmcs.h
> +++ b/xen/include/asm-x86/hvm/vmx/vmcs.h
> @@ -104,6 +104,19 @@ struct pi_blocking_vcpu {
>      spinlock_t           *lock;
>  };
>  
> +struct ipt_state {
> +    uint64_t active;
> +    uint64_t status;
> +    uint64_t output_base;
> +    union {
> +        uint64_t raw;
> +        struct {
> +            uint32_t size;
> +            uint32_t offset;
> +        };
> +    } output_mask;
> +};

While referenced ...

>  struct vmx_vcpu {
>      /* Physical address of VMCS. */
>      paddr_t              vmcs_pa;
> @@ -186,6 +199,9 @@ struct vmx_vcpu {
>       * pCPU and wakeup the related vCPU.
>       */
>      struct pi_blocking_vcpu pi_blocking;
> +
> +    /* State of Intel Processor Trace feature */
> +    struct ipt_state     *ipt_state;

... here, the struct declaration itself doesn't really belong in this
header, as not being VMCS-related. The better place likely is vmx.h.

> --- a/xen/include/public/hvm/hvm_op.h
> +++ b/xen/include/public/hvm/hvm_op.h
> @@ -382,6 +382,29 @@ struct xen_hvm_altp2m_op {
>  typedef struct xen_hvm_altp2m_op xen_hvm_altp2m_op_t;
>  DEFINE_XEN_GUEST_HANDLE(xen_hvm_altp2m_op_t);
>  
> +/* HVMOP_vmtrace: Perform VM tracing related operation */
> +#define HVMOP_vmtrace 26
> +
> +#define HVMOP_VMTRACE_INTERFACE_VERSION 0x00000001

I'm unconvinced we want to introduce yet another versioned interface.
In any event, as hinted at earlier, this suggests it wants to be a
tools-only interface instead (which, at least for the time being, is
not required to be a stable interface then, but that's also something
we apparently want to move away from, and hence you may better not
try to rely on it not needing to be stable).

> +struct xen_hvm_vmtrace_op {
> +    /* IN variable */
> +    uint32_t version;   /* HVMOP_VMTRACE_INTERFACE_VERSION */
> +    uint32_t cmd;
> +/* Enable/disable external vmtrace for given domain */
> +#define HVMOP_vmtrace_ipt_enable      1
> +#define HVMOP_vmtrace_ipt_disable     2
> +#define HVMOP_vmtrace_ipt_get_offset  3
> +    domid_t domain;
> +    uint32_t vcpu;
> +    uint64_t size;
> +
> +    /* OUT variable */
> +    uint64_t offset;

If this is to be a tools-only interface, please use uint64_aligned_t.

You also want to add an entry to xen/include/xlat.lst and use the
resulting macro to prove that the struct layout is the same for
native and compat callers.

> --- a/xen/include/xen/sched.h
> +++ b/xen/include/xen/sched.h
> @@ -457,6 +457,9 @@ struct domain
>      unsigned    pbuf_idx;
>      spinlock_t  pbuf_lock;
>  
> +    /* Used by vmtrace domctls */
> +    spinlock_t  vmtrace_lock;

There's no domctl invovled here anymore, I think.

Jan

