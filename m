Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EC05F1A42A8
	for <lists+xen-devel@lfdr.de>; Fri, 10 Apr 2020 08:49:53 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jMnTv-0006rv-Eg; Fri, 10 Apr 2020 06:49:39 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=ievq=52=bitdefender.com=aisaila@srs-us1.protection.inumbo.net>)
 id 1jMnTu-0006rq-3P
 for xen-devel@lists.xenproject.org; Fri, 10 Apr 2020 06:49:38 +0000
X-Inumbo-ID: 705fc909-7af7-11ea-83b5-12813bfff9fa
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (unknown
 [40.107.22.108]) by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 705fc909-7af7-11ea-83b5-12813bfff9fa;
 Fri, 10 Apr 2020 06:49:36 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CQmEJBGoNvfAErpPz1bFvHQhLvmdcM7osWln+t3DfYR5vEUgNOgIk6Aom56Lfhi0ziGdN3dgDlEqx0lBxREmc9lhes3tTzbObRZCEhAG4oTZnJnIJpYmhNUtT/5KoowjPFwWgb/6n3DSz3qomubhwDNZvGThYq8Fv+3s6givhoSnQvGeRfzVnHoTnZvxPxH2evX9ku+U+3ZqVn7MuxfoFMT09IgYtTUHWIeipGb3MHEGyjTVRcsy92a/PdLqQ5x2qAzPrx3FIUQEIv23O60YAPSTvAXrGJuEXTMb4F6dn9zRdzRBKNMWEIAelNw5iqdeJ4Iiv3MqfUR4eE0HZ5z0+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eNXxErwibcVBbWqFcwxt1afnMzaxHzBRJ2aM0urBRwg=;
 b=lLTs+/7x86WNmF4BdSfPqA0EyaBw++KpsvgBgADXO5o12HOgfUBXfZb4cvbk0B2Zi+laRZ075RlXs+Hm7svrOh3P8IkT8BZfbLDBKIqj869IQURCfygqXPMqrrBiWTuUxozRljkdFnbjHDhUpKGWzrAGXyHq1RM4Ve03a25oq+cDTB9M/qrZOfB4uxRVi7+kYz4ULbaAKWrxPA4Kof5PLXo0n58rwMcOZZ9b5z+SA07GP6bUv9ZmJAhq6lFT6GZ3AwzGTZ+Ycv7qRQOQ3sZ9jVuzeK69ZtiTHFqQcsuhwD6zBuLysL518yzsJI4go16acgir3ws78xHvQBrCKPcMHw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bitdefender.com; dmarc=pass action=none
 header.from=bitdefender.com; dkim=pass header.d=bitdefender.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bitdefender.onmicrosoft.com; s=selector2-bitdefender-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eNXxErwibcVBbWqFcwxt1afnMzaxHzBRJ2aM0urBRwg=;
 b=VBmY9QVlAUxCdJCr/egPqj6d/fg7Z6srxz5oE52tiWJN75cWz+WDD2dP4XoV9wzG9fuAjhKjj85PIklHRnaoRpsgk35Gp9beReQbl1UCBx+0P19zk4n+0cl9Agzy+OVvuJhYGZ6gXPo46wupdIhRwySqqMfB6qpgVDk39quZcZg=
Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=aisaila@bitdefender.com; 
Received: from AM6PR02MB5223.eurprd02.prod.outlook.com (2603:10a6:20b:86::23)
 by AM6PR02MB4117.eurprd02.prod.outlook.com (2603:10a6:20b:42::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2900.15; Fri, 10 Apr
 2020 06:49:34 +0000
Received: from AM6PR02MB5223.eurprd02.prod.outlook.com
 ([fe80::b189:1c2:ea70:d208]) by AM6PR02MB5223.eurprd02.prod.outlook.com
 ([fe80::b189:1c2:ea70:d208%4]) with mapi id 15.20.2900.015; Fri, 10 Apr 2020
 06:49:34 +0000
Subject: Re: [PATCH V7] x86/altp2m: Hypercall to set altp2m view visibility
To: xen-devel@lists.xenproject.org
References: <20200330065434.5952-1-aisaila@bitdefender.com>
From: Isaila Alexandru <aisaila@bitdefender.com>
Organization: BD
Message-ID: <b5e549ec-f4a4-aca8-ff14-6bb09a601c40@bitdefender.com>
Date: Fri, 10 Apr 2020 09:49:32 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
In-Reply-To: <20200330065434.5952-1-aisaila@bitdefender.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: VI1PR0501CA0045.eurprd05.prod.outlook.com
 (2603:10a6:800:60::31) To AM6PR02MB5223.eurprd02.prod.outlook.com
 (2603:10a6:20b:86::23)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.107] (82.77.232.39) by
 VI1PR0501CA0045.eurprd05.prod.outlook.com (2603:10a6:800:60::31) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2900.15 via Frontend
 Transport; Fri, 10 Apr 2020 06:49:33 +0000
X-Originating-IP: [82.77.232.39]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7afca22d-41cc-46df-e638-08d7dd1b544e
X-MS-TrafficTypeDiagnostic: AM6PR02MB4117:|AM6PR02MB4117:
X-Microsoft-Antispam-PRVS: <AM6PR02MB41170F469666DB3FCFAB28C3ABDE0@AM6PR02MB4117.eurprd02.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:538;
X-Forefront-PRVS: 0369E8196C
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM6PR02MB5223.eurprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(10019020)(346002)(39850400004)(366004)(396003)(136003)(376002)(6916009)(5660300002)(6486002)(8936002)(81156014)(36916002)(956004)(86362001)(478600001)(7416002)(8676002)(2906002)(316002)(52116002)(4326008)(36756003)(2616005)(31696002)(26005)(16526019)(186003)(53546011)(66476007)(54906003)(66946007)(31686004)(16576012)(66556008)(30864003);
 DIR:OUT; SFP:1102; 
Received-SPF: None (protection.outlook.com: bitdefender.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 2kpMZdXzGRbSj/dG10o87G5CJ80ZtgfQIkgqNX4nT8onzjDK3O4mT+bhWUC1tY/WqDBl7p7SI5wizstrVBOLOiVAj0rp0j+nVPIaMlxSQPcNp8NMQa45LG/vbQ9b6s54OD8BvjH31RX6QyjCm2TtpfVvrE3gwF56XJXx+luclPj4K48Fyt9NOCgOlNT+iIgP3navJGRXEJ6BYXVFxj4D0Bc2tAzkZR+ig5dNc930hqPAEj5COPvNKPkLjRtv+LyDe+SLlFzXO/1ndcaifkh9H2prjh8z9xsGASrRypLPlzgmSU4G2rH9dD0qwDFj/7bjt2qyWUGeyKz70wgAnSrdQPPXT2xcplijAaK3vhU0F26XvTfP3LOcvG01FtlpI8FrNloKbXfeGfuAiVdnDyyT5AeFNp7Hw03U6MorqJXf6C2GyEdX2A2Bf86QotKe4ozv
X-MS-Exchange-AntiSpam-MessageData: 7YCXonfESXpNsnGG8R7PiwqpTU5g7X9yRtlZfObDIKdVLWcqsG6GSpM8pTy1h8Guo7qqmUzn8HS3FB9ku1QrZn3oMluwtLg2ZQ5hJY3BjRDUsgRtKPmZmtMPyaV+1XfxF83FFFiWnwiGmG28CQazXg==
X-MS-Exchange-Transport-Forked: True
X-OriginatorOrg: bitdefender.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7afca22d-41cc-46df-e638-08d7dd1b544e
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Apr 2020 06:49:34.6805 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 487baf29-f1da-469a-9221-243f830c36f3
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dYUwv0aQfaJPyYxBcYVmIkrWDlCIY471/oyHgHelzVNUdOoLXZPn5BJ/a3unByVTOYVa7ia7f3WQUpbYjI/Ycl3frZJ2yZ+SA7WN1vo+RGw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR02MB4117
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
 Jun Nakajima <jun.nakajima@intel.com>, Wei Liu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Jan Beulich <jbeulich@suse.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Are there any more r-b needed for this patch?

Thanks,
Alex

On 30.03.2020 09:54, Alexandru Isaila wrote:
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
> ---
> CC: Ian Jackson <ian.jackson@eu.citrix.com>
> CC: Wei Liu <wl@xen.org>
> CC: Andrew Cooper <andrew.cooper3@citrix.com>
> CC: George Dunlap <George.Dunlap@eu.citrix.com>
> CC: Jan Beulich <jbeulich@suse.com>
> CC: Julien Grall <julien@xen.org>
> CC: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
> CC: Stefano Stabellini <sstabellini@kernel.org>
> CC: "Roger Pau Monné" <roger.pau@citrix.com>
> CC: Jun Nakajima <jun.nakajima@intel.com>
> CC: Kevin Tian <kevin.tian@intel.com>
> ---
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
> index fc6e57a1a0..2e6e652678 100644
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
> index a3d115b650..375e9cf368 100644
> --- a/xen/arch/x86/hvm/hvm.c
> +++ b/xen/arch/x86/hvm/hvm.c
> @@ -4511,6 +4511,7 @@ static int do_altp2m_op(
>       case HVMOP_altp2m_get_mem_access:
>       case HVMOP_altp2m_change_gfn:
>       case HVMOP_altp2m_get_p2m_idx:
> +    case HVMOP_altp2m_set_visibility:
>           break;
>   
>       default:
> @@ -4788,6 +4789,19 @@ static int do_altp2m_op(
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
> index d265ed46ad..bb44ef39a1 100644
> --- a/xen/arch/x86/hvm/vmx/vmx.c
> +++ b/xen/arch/x86/hvm/vmx/vmx.c
> @@ -2140,7 +2140,7 @@ static void vmx_vcpu_update_vmfunc_ve(struct vcpu *v)
>       {
>           v->arch.hvm.vmx.secondary_exec_control |= mask;
>           __vmwrite(VM_FUNCTION_CONTROL, VMX_VMFUNC_EPTP_SWITCHING);
> -        __vmwrite(EPTP_LIST_ADDR, virt_to_maddr(d->arch.altp2m_eptp));
> +        __vmwrite(EPTP_LIST_ADDR, virt_to_maddr(d->arch.altp2m_working_eptp));
>   
>           if ( cpu_has_vmx_virt_exceptions )
>           {
> diff --git a/xen/arch/x86/mm/hap/hap.c b/xen/arch/x86/mm/hap/hap.c
> index a6d5e39b02..372c84da9b 100644
> --- a/xen/arch/x86/mm/hap/hap.c
> +++ b/xen/arch/x86/mm/hap/hap.c
> @@ -493,8 +493,17 @@ int hap_enable(struct domain *d, u32 mode)
>               goto out;
>           }
>   
> +        if ( (d->arch.altp2m_working_eptp = alloc_xenheap_page()) == NULL )
> +        {
> +            rv = -ENOMEM;
> +            goto out;
> +        }
> +
>           for ( i = 0; i < MAX_EPTP; i++ )
> +        {
>               d->arch.altp2m_eptp[i] = mfn_x(INVALID_MFN);
> +            d->arch.altp2m_working_eptp[i] = mfn_x(INVALID_MFN);
> +        }
>   
>           for ( i = 0; i < MAX_ALTP2M; i++ )
>           {
> @@ -528,6 +537,12 @@ void hap_final_teardown(struct domain *d)
>               d->arch.altp2m_eptp = NULL;
>           }
>   
> +        if ( d->arch.altp2m_working_eptp )
> +        {
> +            free_xenheap_page(d->arch.altp2m_working_eptp);
> +            d->arch.altp2m_working_eptp = NULL;
> +        }
> +
>           for ( i = 0; i < MAX_ALTP2M; i++ )
>               p2m_teardown(d->arch.altp2m_p2m[i]);
>       }
> diff --git a/xen/arch/x86/mm/p2m-ept.c b/xen/arch/x86/mm/p2m-ept.c
> index eb0f0edfef..6539ca619b 100644
> --- a/xen/arch/x86/mm/p2m-ept.c
> +++ b/xen/arch/x86/mm/p2m-ept.c
> @@ -1368,6 +1368,7 @@ void p2m_init_altp2m_ept(struct domain *d, unsigned int i)
>       ept = &p2m->ept;
>       ept->mfn = pagetable_get_pfn(p2m_get_pagetable(p2m));
>       d->arch.altp2m_eptp[array_index_nospec(i, MAX_EPTP)] = ept->eptp;
> +    d->arch.altp2m_working_eptp[array_index_nospec(i, MAX_EPTP)] = ept->eptp;
>   }
>   
>   unsigned int p2m_find_altp2m_by_eptp(struct domain *d, uint64_t eptp)
> diff --git a/xen/arch/x86/mm/p2m.c b/xen/arch/x86/mm/p2m.c
> index d93c418bcf..0526bff5b2 100644
> --- a/xen/arch/x86/mm/p2m.c
> +++ b/xen/arch/x86/mm/p2m.c
> @@ -2515,6 +2515,7 @@ void p2m_flush_altp2m(struct domain *d)
>       {
>           p2m_reset_altp2m(d, i, ALTP2M_DEACTIVATE);
>           d->arch.altp2m_eptp[i] = mfn_x(INVALID_MFN);
> +        d->arch.altp2m_working_eptp[i] = mfn_x(INVALID_MFN);
>       }
>   
>       altp2m_list_unlock(d);
> @@ -2634,7 +2635,9 @@ int p2m_destroy_altp2m_by_id(struct domain *d, unsigned int idx)
>           {
>               p2m_reset_altp2m(d, idx, ALTP2M_DEACTIVATE);
>               d->arch.altp2m_eptp[array_index_nospec(idx, MAX_EPTP)] =
> -            mfn_x(INVALID_MFN);
> +                mfn_x(INVALID_MFN);
> +            d->arch.altp2m_working_eptp[array_index_nospec(idx, MAX_EPTP)] =
> +                mfn_x(INVALID_MFN);
>               rc = 0;
>           }
>       }
> @@ -2661,7 +2664,7 @@ int p2m_switch_domain_altp2m_by_id(struct domain *d, unsigned int idx)
>       rc = -EINVAL;
>       altp2m_list_lock(d);
>   
> -    if ( d->arch.altp2m_eptp[idx] != mfn_x(INVALID_MFN) )
> +    if ( d->arch.altp2m_working_eptp[idx] != mfn_x(INVALID_MFN) )
>       {
>           for_each_vcpu( d, v )
>               if ( idx != vcpu_altp2m(v).p2midx )
> @@ -3145,6 +3148,33 @@ int p2m_get_suppress_ve(struct domain *d, gfn_t gfn, bool *suppress_ve,
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
> +        d->arch.altp2m_working_eptp[array_index_nospec(altp2m_idx, MAX_EPTP)] =
> +            d->arch.altp2m_eptp[array_index_nospec(altp2m_idx, MAX_EPTP)];
> +    else
> +        d->arch.altp2m_working_eptp[array_index_nospec(altp2m_idx, MAX_EPTP)] =
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
> index 105adf96eb..800e12eae5 100644
> --- a/xen/include/asm-x86/domain.h
> +++ b/xen/include/asm-x86/domain.h
> @@ -327,6 +327,7 @@ struct arch_domain
>       struct p2m_domain *altp2m_p2m[MAX_ALTP2M];
>       mm_lock_t altp2m_list_lock;
>       uint64_t *altp2m_eptp;
> +    uint64_t *altp2m_working_eptp;
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

