Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 210E01A635D
	for <lists+xen-devel@lfdr.de>; Mon, 13 Apr 2020 09:00:45 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jNt4x-0000Ne-3g; Mon, 13 Apr 2020 07:00:23 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=n3x4=55=bitdefender.com=aisaila@srs-us1.protection.inumbo.net>)
 id 1jNt4u-0000NY-TN
 for xen-devel@lists.xenproject.org; Mon, 13 Apr 2020 07:00:20 +0000
X-Inumbo-ID: 6f26e9ea-7d54-11ea-83d8-bc764e2007e4
Received: from EUR04-HE1-obe.outbound.protection.outlook.com (unknown
 [40.107.7.110]) by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 6f26e9ea-7d54-11ea-83d8-bc764e2007e4;
 Mon, 13 Apr 2020 07:00:19 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WmHsnktGpm/4RtRCqmwPItiFu0h9lQ7xjpp+mhVQlIwS7b/I2oMoN51q1ghyT2HzxyM/3V5UGZrHG5tOU1PF0tGs7j9qo8EQFKopBIRAGcYNT1cC3zWjdQhOsN0BoGTCe21/5vc8+HXIUfxVRNwMBG+JJXp/zrybfD4amy5mGEon52v4IUo37ixJ+IwzIyWAFyvJxUEdAVH187QOdzuG0D2Oab0a+EFJZyCJH2Jq8NFiXi2N4z0BsqApV5IihoXSnTaWKmP3YQGMB9ffD82F4olZjhe/QCslOfSkbHQCVOXBB9vM/Mpr4KFzwaav5/vOWt4t8sZVAmVNS0sazxj0mQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SafQphNT1Pm3M9lWzNSligRP0oeu4NwqvRmlAwwQqZE=;
 b=Fpgv5Oa/6pGNxDsRoydOxtQnkeo4gBx5IlTjTR0YiADdRDbUTA54EgdGNo7kBpicO2lxjD0pLaRJKxQSENPXcjYAuFpWuoyPaPeDXv+hI5VM7HHxnGg3YhbgWfzAaGE8Vg5DQ8I85myAxEQ2eFvinpNJfbcNjUFTqO4rfcH30NyFlhuI63x0dHbT5eQJ+ZhMtJqaTcQfLy1DicUSv9YCVb4k6tMzewnrSl26kuQcTW1YS5+168Ev86hRXJjUBaR6aHT/3oD6Fx007PtKiJ1r/PRi0Jel1Ft9XIj8whQEVuiV+a3rzwVDIvMy7VZH7fY+VWkTY/1L9hpyqb1JbB/nlw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bitdefender.com; dmarc=pass action=none
 header.from=bitdefender.com; dkim=pass header.d=bitdefender.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bitdefender.onmicrosoft.com; s=selector2-bitdefender-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SafQphNT1Pm3M9lWzNSligRP0oeu4NwqvRmlAwwQqZE=;
 b=Kn6uuU0R4hXtTloVsxJls4gJ6R4k67QQxRgckQa1JowUm93Tq98rKl7dA7+iFa3nGKMbFN7dLLRpEMTMSvfic3V6qGme5YHXbEXcXUafLkr7D4Tp6RDs52phatpZ/srxsFeO3w95W/DX9UguxfS5lKVbNZ12mvou/KW3uhrsvic=
Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=aisaila@bitdefender.com; 
Received: from AM6PR02MB5223.eurprd02.prod.outlook.com (2603:10a6:20b:86::23)
 by AM6PR02MB5285.eurprd02.prod.outlook.com (2603:10a6:20b:6f::31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2900.15; Mon, 13 Apr
 2020 07:00:16 +0000
Received: from AM6PR02MB5223.eurprd02.prod.outlook.com
 ([fe80::b189:1c2:ea70:d208]) by AM6PR02MB5223.eurprd02.prod.outlook.com
 ([fe80::b189:1c2:ea70:d208%4]) with mapi id 15.20.2900.028; Mon, 13 Apr 2020
 07:00:16 +0000
Subject: Ping: [PATCH V8] x86/altp2m: Hypercall to set altp2m view visibility
To: xen-devel@lists.xenproject.org, Ian Jackson <ian.jackson@eu.citrix.com>,
 Wei Liu <wl@xen.org>
References: <20200413065113.27744-1-aisaila@bitdefender.com>
From: Isaila Alexandru <aisaila@bitdefender.com>
Organization: BD
Message-ID: <3da2ec70-bb04-08a8-6c23-824155f464d3@bitdefender.com>
Date: Mon, 13 Apr 2020 10:00:14 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
In-Reply-To: <20200413065113.27744-1-aisaila@bitdefender.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: VI1PR0901CA0096.eurprd09.prod.outlook.com
 (2603:10a6:800:7e::22) To AM6PR02MB5223.eurprd02.prod.outlook.com
 (2603:10a6:20b:86::23)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.107] (82.77.232.39) by
 VI1PR0901CA0096.eurprd09.prod.outlook.com (2603:10a6:800:7e::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2900.15 via Frontend
 Transport; Mon, 13 Apr 2020 07:00:15 +0000
X-Originating-IP: [82.77.232.39]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ab6acadd-d046-42af-39da-08d7df7851de
X-MS-TrafficTypeDiagnostic: AM6PR02MB5285:|AM6PR02MB5285:
X-Microsoft-Antispam-PRVS: <AM6PR02MB5285F6C67641BA0ED7EF6A31ABDD0@AM6PR02MB5285.eurprd02.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:538;
X-Forefront-PRVS: 037291602B
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM6PR02MB5223.eurprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(10019020)(39840400004)(366004)(136003)(376002)(396003)(346002)(26005)(66946007)(66476007)(66556008)(316002)(2906002)(36756003)(54906003)(31696002)(16576012)(478600001)(110136005)(86362001)(36916002)(53546011)(52116002)(30864003)(186003)(16526019)(6486002)(2616005)(956004)(5660300002)(81156014)(31686004)(8676002)(8936002)(4326008)(7416002);
 DIR:OUT; SFP:1102; 
Received-SPF: None (protection.outlook.com: bitdefender.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: +15Sx42RVVrQXhoMGQccMYKD5fHO7eDQ6FCQsqiOWAQlF3ltX/hfEmtb2Iu0c1Mdd9oMApQZBMfhPdoat+ff7Q+/GgGSIIqFWjL2+Fk20MZ1OkwCF4sOPkr7ZQ2E04m7bFkAAwCnP3759k/VawrxbYR3RqS5ori1puR/I7W4dO7Mg68nuZKQYbUMhFDKerrYYfaXwCfGTYdwCLB4iqlJqo33gyYousk9nDMf7JIaOHbS6IBKKBQgs6FJ7APuw/dWBo8Y2bDBx4M0F+V0fZHeCsBRRhg0dTVirtEtkTxSQd/PG4wisrNWYmJJ1Z/3vMuV9JiK5isc0aRqhkWlJHbVT/p35pMN8aYy+zZIDsHi1gdtYRhi4lOIDT4C4fbCeNEV6JeBBVpK5hqYyqsqKll9JOjie8Z90IUcPn5MHUUMUG2xeNIIpkgf7XPvARQqx9P+
X-MS-Exchange-AntiSpam-MessageData: W5hzGOoRjX7gIa8edJPu6eXkHBR8x8S/ngBjSCva2nUTaSuOnr0qCuMBc+CT3Y+0ZjKNAIsxc9lb9WpODcbGxaNVxQTV3s73jLaERxNad4s3vocb5Ab78dFzfwu6oUmxCvjAlCxZ1QvXH/KHBjuiuA==
X-MS-Exchange-Transport-Forked: True
X-OriginatorOrg: bitdefender.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ab6acadd-d046-42af-39da-08d7df7851de
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Apr 2020 07:00:16.4229 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 487baf29-f1da-469a-9221-243f830c36f3
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: agB1O05PRUu2udmz9ggw2FQwHMB7EtVvTPfANGnuM6gKL3uOcmZ60QhvLhdJWFvCdyrzeNKTRUCfM4oiZ1FVylQzf8bpNHa281CNcVtwZf8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR02MB5285
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
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
 Jun Nakajima <jun.nakajima@intel.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Hi,

I need a review for the tools bits in this patch.

Thanks,
Alex

On 13.04.2020 09:51, Alexandru Isaila wrote:
> At this moment a guest can call vmfunc to change the altp2m view. This
> should be limited in order to avoid any unwanted view switch.
> 
> The new xc_altp2m_set_visibility() solves this by making views invisible
> to vmfunc.
> This is done by having a separate arch.altp2m_working_eptp that is
> populated and made invalid in the same places as altp2m_eptp. This is
> written to EPTP_LIST_ADDR.
> The views are made in/visible by marking them with INVALID_MFN or
> copying them back from altp2m_eptp.
> To have consistency the visibility also applies to
> p2m_switch_domain_altp2m_by_id().
> 
> The usage of this hypercall is aimed at dom0 having a logic with a number of views
> created and at some time there is a need to be sure that only some of the views
> can be switched, saving the rest and making them visible when the time
> is right.
> 
> Note: If altp2m mode is set to mixed the guest is able to change the view
> visibility and then call vmfunc.
> 
> Signed-off-by: Alexandru Isaila <aisaila@bitdefender.com>
> Reviewed-by: Jan Beulich <jbeulich@suse.com>
> Reviewed-by: Kevin Tian <kevin.tian@intel.com>
> ---
> CC: Ian Jackson <ian.jackson@eu.citrix.com>
> CC: Wei Liu <wl@xen.org>
> CC: Andrew Cooper <andrew.cooper3@citrix.com>
> CC: George Dunlap <George.Dunlap@eu.citrix.com>
> CC: Jan Beulich <jbeulich@suse.com>
> CC: Julien Grall <julien@xen.org>
> CC: Stefano Stabellini <sstabellini@kernel.org>
> CC: "Roger Pau Monné" <roger.pau@citrix.com>
> CC: Jun Nakajima <jun.nakajima@intel.com>
> CC: Kevin Tian <kevin.tian@intel.com>
> ---
> Changes since V7:
> 	- Change altp2m_working_eptp to altp2m_visible_eptp
> 	- Rebase.
> 
> Changes since V6:
> 	- Update commit message.
> 
> Changes since V5:
> 	- Change idx type from uint16_t to unsigned int
> 	- Add rc var and dropped the err return from p2m_get_suppress_ve().
> 
> Changes since V4:
> 	- Move p2m specific things from hvm to p2m.c
> 	- Add comment for altp2m_idx bounds check
> 	- Add altp2m_list_lock/unlock().
> 
> Changes since V3:
> 	- Change var name form altp2m_idx to idx to shorten line length
> 	- Add bounds check for idx
> 	- Update commit message
> 	- Add comment in xenctrl.h.
> 
> Changes since V2:
> 	- Drop hap_enabled() check
> 	- Reduce the indentation depth in hvm.c
> 	- Fix assignment indentation
> 	- Drop pad2.
> 
> Changes since V1:
> 	- Drop double view from title.
> ---
>   tools/libxc/include/xenctrl.h   |  7 +++++++
>   tools/libxc/xc_altp2m.c         | 24 +++++++++++++++++++++++
>   xen/arch/x86/hvm/hvm.c          | 14 ++++++++++++++
>   xen/arch/x86/hvm/vmx/vmx.c      |  2 +-
>   xen/arch/x86/mm/hap/hap.c       | 15 +++++++++++++++
>   xen/arch/x86/mm/p2m-ept.c       |  1 +
>   xen/arch/x86/mm/p2m.c           | 34 +++++++++++++++++++++++++++++++--
>   xen/include/asm-x86/domain.h    |  1 +
>   xen/include/asm-x86/p2m.h       |  4 ++++
>   xen/include/public/hvm/hvm_op.h |  9 +++++++++
>   10 files changed, 108 insertions(+), 3 deletions(-)
> 
> diff --git a/tools/libxc/include/xenctrl.h b/tools/libxc/include/xenctrl.h
> index 58fa931de1..5f25c5a6d4 100644
> --- a/tools/libxc/include/xenctrl.h
> +++ b/tools/libxc/include/xenctrl.h
> @@ -1943,6 +1943,13 @@ int xc_altp2m_change_gfn(xc_interface *handle, uint32_t domid,
>                            xen_pfn_t new_gfn);
>   int xc_altp2m_get_vcpu_p2m_idx(xc_interface *handle, uint32_t domid,
>                                  uint32_t vcpuid, uint16_t *p2midx);
> +/*
> + * Set view visibility for xc_altp2m_switch_to_view and vmfunc.
> + * Note: If altp2m mode is set to mixed the guest is able to change the view
> + * visibility and then call vmfunc.
> + */
> +int xc_altp2m_set_visibility(xc_interface *handle, uint32_t domid,
> +                             uint16_t view_id, bool visible);
>   
>   /**
>    * Mem paging operations.
> diff --git a/tools/libxc/xc_altp2m.c b/tools/libxc/xc_altp2m.c
> index 46fb725806..6987c9541f 100644
> --- a/tools/libxc/xc_altp2m.c
> +++ b/tools/libxc/xc_altp2m.c
> @@ -410,3 +410,27 @@ int xc_altp2m_get_vcpu_p2m_idx(xc_interface *handle, uint32_t domid,
>       xc_hypercall_buffer_free(handle, arg);
>       return rc;
>   }
> +
> +int xc_altp2m_set_visibility(xc_interface *handle, uint32_t domid,
> +                             uint16_t view_id, bool visible)
> +{
> +    int rc;
> +
> +    DECLARE_HYPERCALL_BUFFER(xen_hvm_altp2m_op_t, arg);
> +
> +    arg = xc_hypercall_buffer_alloc(handle, arg, sizeof(*arg));
> +    if ( arg == NULL )
> +        return -1;
> +
> +    arg->version = HVMOP_ALTP2M_INTERFACE_VERSION;
> +    arg->cmd = HVMOP_altp2m_set_visibility;
> +    arg->domain = domid;
> +    arg->u.set_visibility.altp2m_idx = view_id;
> +    arg->u.set_visibility.visible = visible;
> +
> +    rc = xencall2(handle->xcall, __HYPERVISOR_hvm_op, HVMOP_altp2m,
> +                  HYPERCALL_BUFFER_AS_ARG(arg));
> +
> +    xc_hypercall_buffer_free(handle, arg);
> +    return rc;
> +}
> diff --git a/xen/arch/x86/hvm/hvm.c b/xen/arch/x86/hvm/hvm.c
> index 827c5fa89d..6f6f3f73a8 100644
> --- a/xen/arch/x86/hvm/hvm.c
> +++ b/xen/arch/x86/hvm/hvm.c
> @@ -4509,6 +4509,7 @@ static int do_altp2m_op(
>       case HVMOP_altp2m_get_mem_access:
>       case HVMOP_altp2m_change_gfn:
>       case HVMOP_altp2m_get_p2m_idx:
> +    case HVMOP_altp2m_set_visibility:
>           break;
>   
>       default:
> @@ -4786,6 +4787,19 @@ static int do_altp2m_op(
>           break;
>       }
>   
> +    case HVMOP_altp2m_set_visibility:
> +    {
> +        unsigned int idx = a.u.set_visibility.altp2m_idx;
> +
> +        if ( a.u.set_visibility.pad )
> +            rc = -EINVAL;
> +        else if ( !altp2m_active(d) )
> +            rc = -EOPNOTSUPP;
> +        else
> +            rc = p2m_set_altp2m_view_visibility(d, idx,
> +                                                a.u.set_visibility.visible);
> +    }
> +
>       default:
>           ASSERT_UNREACHABLE();
>       }
> diff --git a/xen/arch/x86/hvm/vmx/vmx.c b/xen/arch/x86/hvm/vmx/vmx.c
> index 1c398fdb6e..869339062b 100644
> --- a/xen/arch/x86/hvm/vmx/vmx.c
> +++ b/xen/arch/x86/hvm/vmx/vmx.c
> @@ -2140,7 +2140,7 @@ static void vmx_vcpu_update_vmfunc_ve(struct vcpu *v)
>       {
>           v->arch.hvm.vmx.secondary_exec_control |= mask;
>           __vmwrite(VM_FUNCTION_CONTROL, VMX_VMFUNC_EPTP_SWITCHING);
> -        __vmwrite(EPTP_LIST_ADDR, virt_to_maddr(d->arch.altp2m_eptp));
> +        __vmwrite(EPTP_LIST_ADDR, virt_to_maddr(d->arch.altp2m_visible_eptp));
>   
>           if ( cpu_has_vmx_virt_exceptions )
>           {
> diff --git a/xen/arch/x86/mm/hap/hap.c b/xen/arch/x86/mm/hap/hap.c
> index 814d0c3253..052ae35c6f 100644
> --- a/xen/arch/x86/mm/hap/hap.c
> +++ b/xen/arch/x86/mm/hap/hap.c
> @@ -492,8 +492,17 @@ int hap_enable(struct domain *d, u32 mode)
>               goto out;
>           }
>   
> +        if ( (d->arch.altp2m_visible_eptp = alloc_xenheap_page()) == NULL )
> +        {
> +            rv = -ENOMEM;
> +            goto out;
> +        }
> +
>           for ( i = 0; i < MAX_EPTP; i++ )
> +        {
>               d->arch.altp2m_eptp[i] = mfn_x(INVALID_MFN);
> +            d->arch.altp2m_visible_eptp[i] = mfn_x(INVALID_MFN);
> +        }
>   
>           for ( i = 0; i < MAX_ALTP2M; i++ )
>           {
> @@ -527,6 +536,12 @@ void hap_final_teardown(struct domain *d)
>               d->arch.altp2m_eptp = NULL;
>           }
>   
> +        if ( d->arch.altp2m_visible_eptp )
> +        {
> +            free_xenheap_page(d->arch.altp2m_visible_eptp);
> +            d->arch.altp2m_visible_eptp = NULL;
> +        }
> +
>           for ( i = 0; i < MAX_ALTP2M; i++ )
>               p2m_teardown(d->arch.altp2m_p2m[i]);
>       }
> diff --git a/xen/arch/x86/mm/p2m-ept.c b/xen/arch/x86/mm/p2m-ept.c
> index eb0f0edfef..293f3e9419 100644
> --- a/xen/arch/x86/mm/p2m-ept.c
> +++ b/xen/arch/x86/mm/p2m-ept.c
> @@ -1368,6 +1368,7 @@ void p2m_init_altp2m_ept(struct domain *d, unsigned int i)
>       ept = &p2m->ept;
>       ept->mfn = pagetable_get_pfn(p2m_get_pagetable(p2m));
>       d->arch.altp2m_eptp[array_index_nospec(i, MAX_EPTP)] = ept->eptp;
> +    d->arch.altp2m_visible_eptp[array_index_nospec(i, MAX_EPTP)] = ept->eptp;
>   }
>   
>   unsigned int p2m_find_altp2m_by_eptp(struct domain *d, uint64_t eptp)
> diff --git a/xen/arch/x86/mm/p2m.c b/xen/arch/x86/mm/p2m.c
> index b8727e267d..4c1507d3a4 100644
> --- a/xen/arch/x86/mm/p2m.c
> +++ b/xen/arch/x86/mm/p2m.c
> @@ -2533,6 +2533,7 @@ void p2m_flush_altp2m(struct domain *d)
>       {
>           p2m_reset_altp2m(d, i, ALTP2M_DEACTIVATE);
>           d->arch.altp2m_eptp[i] = mfn_x(INVALID_MFN);
> +        d->arch.altp2m_visible_eptp[i] = mfn_x(INVALID_MFN);
>       }
>   
>       altp2m_list_unlock(d);
> @@ -2652,7 +2653,9 @@ int p2m_destroy_altp2m_by_id(struct domain *d, unsigned int idx)
>           {
>               p2m_reset_altp2m(d, idx, ALTP2M_DEACTIVATE);
>               d->arch.altp2m_eptp[array_index_nospec(idx, MAX_EPTP)] =
> -            mfn_x(INVALID_MFN);
> +                mfn_x(INVALID_MFN);
> +            d->arch.altp2m_visible_eptp[array_index_nospec(idx, MAX_EPTP)] =
> +                mfn_x(INVALID_MFN);
>               rc = 0;
>           }
>       }
> @@ -2679,7 +2682,7 @@ int p2m_switch_domain_altp2m_by_id(struct domain *d, unsigned int idx)
>       rc = -EINVAL;
>       altp2m_list_lock(d);
>   
> -    if ( d->arch.altp2m_eptp[idx] != mfn_x(INVALID_MFN) )
> +    if ( d->arch.altp2m_visible_eptp[idx] != mfn_x(INVALID_MFN) )
>       {
>           for_each_vcpu( d, v )
>               if ( idx != vcpu_altp2m(v).p2midx )
> @@ -3163,6 +3166,33 @@ int p2m_get_suppress_ve(struct domain *d, gfn_t gfn, bool *suppress_ve,
>   
>       return rc;
>   }
> +
> +int p2m_set_altp2m_view_visibility(struct domain *d, unsigned int altp2m_idx,
> +                                   uint8_t visible)
> +{
> +    int rc = 0;
> +
> +    altp2m_list_lock(d);
> +
> +    /*
> +     * Eptp index is correlated with altp2m index and should not exceed
> +     * min(MAX_ALTP2M, MAX_EPTP).
> +     */
> +    if ( altp2m_idx >= min(ARRAY_SIZE(d->arch.altp2m_p2m), MAX_EPTP) ||
> +         d->arch.altp2m_eptp[array_index_nospec(altp2m_idx, MAX_EPTP)] ==
> +         mfn_x(INVALID_MFN) )
> +        rc = -EINVAL;
> +    else if ( visible )
> +        d->arch.altp2m_visible_eptp[array_index_nospec(altp2m_idx, MAX_EPTP)] =
> +            d->arch.altp2m_eptp[array_index_nospec(altp2m_idx, MAX_EPTP)];
> +    else
> +        d->arch.altp2m_visible_eptp[array_index_nospec(altp2m_idx, MAX_EPTP)] =
> +            mfn_x(INVALID_MFN);
> +
> +    altp2m_list_unlock(d);
> +
> +    return rc;
> +}
>   #endif
>   
>   /*
> diff --git a/xen/include/asm-x86/domain.h b/xen/include/asm-x86/domain.h
> index 105adf96eb..4192c636b1 100644
> --- a/xen/include/asm-x86/domain.h
> +++ b/xen/include/asm-x86/domain.h
> @@ -327,6 +327,7 @@ struct arch_domain
>       struct p2m_domain *altp2m_p2m[MAX_ALTP2M];
>       mm_lock_t altp2m_list_lock;
>       uint64_t *altp2m_eptp;
> +    uint64_t *altp2m_visible_eptp;
>   #endif
>   
>       /* NB. protected by d->event_lock and by irq_desc[irq].lock */
> diff --git a/xen/include/asm-x86/p2m.h b/xen/include/asm-x86/p2m.h
> index a2c6049834..ace3573ae8 100644
> --- a/xen/include/asm-x86/p2m.h
> +++ b/xen/include/asm-x86/p2m.h
> @@ -898,6 +898,10 @@ int p2m_change_altp2m_gfn(struct domain *d, unsigned int idx,
>   int p2m_altp2m_propagate_change(struct domain *d, gfn_t gfn,
>                                   mfn_t mfn, unsigned int page_order,
>                                   p2m_type_t p2mt, p2m_access_t p2ma);
> +
> +/* Set a specific p2m view visibility */
> +int p2m_set_altp2m_view_visibility(struct domain *d, unsigned int idx,
> +                                   uint8_t visible);
>   #else
>   struct p2m_domain *p2m_get_altp2m(struct vcpu *v);
>   static inline void p2m_altp2m_check(struct vcpu *v, uint16_t idx) {}
> diff --git a/xen/include/public/hvm/hvm_op.h b/xen/include/public/hvm/hvm_op.h
> index b599d3cbd0..870ec52060 100644
> --- a/xen/include/public/hvm/hvm_op.h
> +++ b/xen/include/public/hvm/hvm_op.h
> @@ -318,6 +318,12 @@ struct xen_hvm_altp2m_get_vcpu_p2m_idx {
>       uint16_t altp2m_idx;
>   };
>   
> +struct xen_hvm_altp2m_set_visibility {
> +    uint16_t altp2m_idx;
> +    uint8_t visible;
> +    uint8_t pad;
> +};
> +
>   struct xen_hvm_altp2m_op {
>       uint32_t version;   /* HVMOP_ALTP2M_INTERFACE_VERSION */
>       uint32_t cmd;
> @@ -350,6 +356,8 @@ struct xen_hvm_altp2m_op {
>   #define HVMOP_altp2m_get_p2m_idx          14
>   /* Set the "Supress #VE" bit for a range of pages */
>   #define HVMOP_altp2m_set_suppress_ve_multi 15
> +/* Set visibility for a given altp2m view */
> +#define HVMOP_altp2m_set_visibility       16
>       domid_t domain;
>       uint16_t pad1;
>       uint32_t pad2;
> @@ -367,6 +375,7 @@ struct xen_hvm_altp2m_op {
>           struct xen_hvm_altp2m_suppress_ve_multi    suppress_ve_multi;
>           struct xen_hvm_altp2m_vcpu_disable_notify  disable_notify;
>           struct xen_hvm_altp2m_get_vcpu_p2m_idx     get_vcpu_p2m_idx;
> +        struct xen_hvm_altp2m_set_visibility       set_visibility;
>           uint8_t pad[64];
>       } u;
>   };
> 

