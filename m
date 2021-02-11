Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FCAE31866A
	for <lists+xen-devel@lfdr.de>; Thu, 11 Feb 2021 09:46:27 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.83784.156761 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lA7bd-0001Y8-Vb; Thu, 11 Feb 2021 08:45:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 83784.156761; Thu, 11 Feb 2021 08:45:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lA7bd-0001Xj-SD; Thu, 11 Feb 2021 08:45:45 +0000
Received: by outflank-mailman (input) for mailman id 83784;
 Thu, 11 Feb 2021 08:45:44 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=szQa=HN=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1lA7bc-0001Xe-JV
 for xen-devel@lists.xenproject.org; Thu, 11 Feb 2021 08:45:44 +0000
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id a5a98f4b-21c3-4b26-9b9a-fe1fc103eabf;
 Thu, 11 Feb 2021 08:45:42 +0000 (UTC)
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
X-Inumbo-ID: a5a98f4b-21c3-4b26-9b9a-fe1fc103eabf
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1613033142;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=YCiIoVLGNZJZ69t4uAsXuQqnYJJsrgsT/WwnSrlDw8s=;
  b=OeOa/fG3rdgHGfwiGHTZORCOdQZ3QxiXsBttx1fJ3Vp/+66ey/HsuAae
   XgCEEVbE9sOwsalmAPa5YWcg9y4QAVZTx9DrPhWvaTV/yaW0dkdfjJuCM
   LbH2KilHK0o4dtM1dgRTw9YZO84hPSJJn0tms6JrT6OvZDoXym9guThw1
   s=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: luGaybCio+dwxHAEdlfbG/A99XLAeIBkTvPdOPBdx9MHbKxoQ9L1sP318SwapRkgTa5RD4DHoJ
 neYl2nqV6xFNK+d+MAh+cOUtWcejlB7wrq004tu4JYHKsZ7M5iEHQqlRmOpYMskCgmjT8/ZglY
 D5NHxn8gANvBP18NcBxQB5niVWAaY4BGftgpSGV1puFnSdXf3wmMqJTIbl8fi31xEna3VZNLmB
 MOhFXMhgplV6b5h1JdALr35oqnNDPX+zOaXyMjDJjk/D7EA/jxrG5f1yxYCQUqHJ6H9NA2V2W9
 xzA=
X-SBRS: 5.2
X-MesageID: 38379951
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.81,169,1610427600"; 
   d="scan'208";a="38379951"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JL5JQDOVG6gPi0UhS1EJk2FQUPYpotEq/3xo0PSRgvixtRsBduB4tYEqSIq/TQ9+EjBWbkp2Ynw+iuHY3ry9Cag3FuH6IZBIXnwLcEl47HYx9wNYqk6MeqJhWzospDeT+cGJyCjjoPprZoG8JglPbyo5ZLVHcuxWoWrFF2YpzvzjQ3WQvx8B23R7ZNR0XehUCQ2uMXDAc6fVgzCbq2KFX/FvxpuvqRfDzR4xJ+jEix21g4U5qM5XjDIpSJdMhsGrqYZUzBK86ts+7P1xqOB11Kv/R31w3pyjFC1KG7DGow2GYB8lbazTKhW+ouoQ1/hCXsXaZ8FtCzkFPFkpooUA0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EWLfxRiPzPQUxaYqEvh2+Vz1QyXxG6AASbN+xoP5nJ0=;
 b=EkmxQGiPGBZLcCg73zsg2AeLb3ipn9UcHmQvo9BeL3Ti/pnhqvbkChKJPfawmn5hh4RN4kD1mtg8zNk1/tMuMJHBmhlQfgvPJYsOjNg7ZrJmLir3uUJjbdcLcfIHPY5VJAO1fQ0h5A7pblVQmHbCicjOi08sxfbOZC9czFtzijy++bDMb7MACt+RWmPy21Tk14d5+qoai5fsGbAxAUF+LLh7QCBUbhFovL5bkxyfsFY7jHPMr7jCXMP69E81HQOF5Sz+lrdo8wGk1gJw7USRmBuDBlXFfLerr5bplkb2knVMNd/RJaQfD3YR9Qxu9KjHt3eMwm72ydlGY4J227Ot4Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EWLfxRiPzPQUxaYqEvh2+Vz1QyXxG6AASbN+xoP5nJ0=;
 b=RTVgIM+n2RT+TcSBQ41TFkZST89XwLVBFHkjcaXbfE1+0K5Nkefk7smO3rxoOYH8qZJI/cMy0PwK0RgPQPLA7xUXohHlsHs8UdA7v7ukHm32x9gL98Fa0VXDU5lW+kLrHMQHhygcgbSPuR+sUrdjlZXbvMkrM3Lodc0YD60AFr4=
Date: Thu, 11 Feb 2021 09:45:31 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, "Kevin
 Tian" <kevin.tian@intel.com>, Julien Grall <julien@xen.org>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH] VMX: use a single, global APIC access page
Message-ID: <YCTuq5b130PR6G35@Air-de-Roger>
References: <1b6a411b-84e7-bfb1-647e-511a13df838c@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <1b6a411b-84e7-bfb1-647e-511a13df838c@suse.com>
X-ClientProxiedBy: MR2P264CA0042.FRAP264.PROD.OUTLOOK.COM (2603:10a6:500::30)
 To DS7PR03MB5608.namprd03.prod.outlook.com (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 88e7dd79-7be9-4fc1-34a3-08d8ce6966ac
X-MS-TrafficTypeDiagnostic: DM6PR03MB3483:
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM6PR03MB348309D2AF5B12D71AF8C22F8F8C9@DM6PR03MB3483.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: f1oCdYJFc4/03S2yT2t4MkqMxnwCekfraPdDdalp2UUpkbBmrZ4QfcxqF8sxNd71KwPuReSzUlB0FuiCBPu7PCpvfsFThbDPwiuvF/6ppdWD7fC1/UTUlYuierI8z+JmzB80v4PgwPQQ00p5MRyVSdF4t6DbloDmYMa1c6N6QbI2/N1fVU9M1wfeXdWMsg+gq6gpfFPFeEgjf/CU1rWFFf0NkwnOhi9blld6rQfoGCcfsxnVydSvURME6l+jjsc7cDTuCeOdeYyzb8dK62kkpe9FshfUgrzTJmhWMhVbF7zLGSGR3AX0zVRc5edzgn+Q0QbVVJMT3NCNpBchHEeof1bL8MunlZnXwrC0i4uw4kmt1GMgNOKNMaBV+27U33cK2BYLU2m7YEt1kJomioVS5v8bJ0ShIZIiPL4XQXwRZYKki2KGmieBuPhJpkm3Poa2gIY9OkoaAvTzTYDhAhu7ON5vCVuMOtyPXdTZkF5dK4eryH7cHtRZ79hkqY1vEUZ8cotvpRHm3ESymYYPvMpULA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(7916004)(4636009)(366004)(376002)(346002)(136003)(39860400002)(396003)(6486002)(33716001)(2906002)(6496006)(9686003)(186003)(85182001)(956004)(478600001)(83380400001)(5660300002)(26005)(86362001)(8676002)(6666004)(66476007)(54906003)(316002)(8936002)(16526019)(66556008)(66946007)(6916009)(4326008);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?bFUrRXhLcFNPU0I5bHhSNFgvSkhNQ2VmZkpYMlBkTXRxSk9hYmFyRlY3T1VT?=
 =?utf-8?B?elQrNE9aMXRxQ0kvYk8xSzhLTDh4RUhpVDEwUk1GYit3VzhkS1I0cDQrMG43?=
 =?utf-8?B?RWRtVHhMS2hIdkJzQU9TNnMrUWhUa0taMEpQeTFLeEc0NnF6SkgzMEpkOXd5?=
 =?utf-8?B?U244K2p2NHYrTFRtbTl1eFRPdklldmROUjZPa3dTOHRsK2hEVVBvNmp0cWhX?=
 =?utf-8?B?U01VU0xHUnVWVGZnTGtKWEtlZjBPdURiT1ZSd2FiM1k2QnFGOTB0SFFIak9r?=
 =?utf-8?B?YzA0SWMxK21FQ3dVTmJlWFp4MWtGUTQzQk9pa1JXV0toeGxHckdsbVVkR3Vq?=
 =?utf-8?B?R1BCMkovYWYrVFB5RUVjOGxHVkJsRTVPcFF5RFYxUVRwR2RoeWcwczh6NGJM?=
 =?utf-8?B?L1NRSStqcFRQUkFPL2hzL20zd3loQXUwTEtzWnJ4VkVaeUNiUVVNNWw2eXl1?=
 =?utf-8?B?UmVuMDErcDRXWVFxSzBRUHZYZ1R0K2gxVFJlVW9sYXhrRVB5MkgyNW5OTUo5?=
 =?utf-8?B?QkJjVzB4TmRlZm1kU1RxQTB4REQwMGF1blhLeHBuNkpISkV6Qys2T2hlZTJq?=
 =?utf-8?B?bzNDZ3R4V2lRdk1OMmJNWHYrVlRHNWZTcnRXV2ZGTitwMGF5bUpQbFEvbndH?=
 =?utf-8?B?c1lVUm40TFEvQ3lxRkptcFBDN2kwbzJBcmpuNFpPY24vcm5EUkVaTSs3RTFP?=
 =?utf-8?B?bUZtbWhWWUJGNk9YWjQvWUdYMVR5WWgzSW9kMUF2MlNOQVoxeDRTSk1nZjdm?=
 =?utf-8?B?VUdEQUdjd2txN21oWHVBVi8xd3R4VFFneWM2YXRkV3o3cDFNS0dRWExsdmd2?=
 =?utf-8?B?R1FJdjVmRFowbGh2NWxQQ0xVRWpzc0o4S29XSWdzVjVzdHpEZFZNN3R3d2Vn?=
 =?utf-8?B?TVRBTXZoQUdIbEFXL0VUUFhFdS93M0Zxb2JyQmc2S2ZKc2RxY0tPek0yZHFZ?=
 =?utf-8?B?WlJaYXRIS2IxWkhjTkNQQ1MyUDkxL0Y5cWVwSy9jRm0zb1JGQ2Nwc25HbG1l?=
 =?utf-8?B?aWsyaG1IMGowUDcxblI4YzBLZ1NkMlZvRjNKdzZoZjlVOTlQUnVYZjVTZm9B?=
 =?utf-8?B?WUR1MmtZeWdRSGtQcksrT01MZDNGemFOUE1tWGZZQzVUVnZOeXo2QTNqWlg3?=
 =?utf-8?B?RVd4Q2NLNVJjdi9ldmZpY3c5MWNkWVlCcjhkRDFKRU5MaWtBMVVxRVZVSm9V?=
 =?utf-8?B?cnhiQmZvejBnMW1uSS9oQkdldTBTVlRhT3JpTUpTS0VVNDdIaFB2MGRkUmZu?=
 =?utf-8?B?RC9nNW41bmtqYlRzNHhuSlBZMjZ0ZDgwRGdnQlNhczU1UzBUK3NIcitOY1F3?=
 =?utf-8?B?S3hUQWJoUVdXcFcxei9yVzZLTUN1SWdhNXJFdWk3cEF5ZEdyVWpWMm4vK2hu?=
 =?utf-8?B?NVl2SVdVWXJYOU9GbUl4QVQrZ09mM2l3NzhsV2ZzbTFRUThGejlqbmZWNEZ2?=
 =?utf-8?B?K1k1MHhRWlZLcGRhRGhrYURYQnU2bGVvQlpUWm9oTVVPc2xuS3FLNCtrT21y?=
 =?utf-8?B?Z3lhb29TTjk5a0F2OEd6dVVvMTFCVWswNUErOXY2VGdaWjlDc2tMbVJKb1kx?=
 =?utf-8?B?eFRGdkFSdUF0NGV4ODFPSkVkekZ5WWFoQmVTNStub2Vmem1YcE5SVXhrWHNC?=
 =?utf-8?B?TjEwV1puRndqTFhOM3gydmhXTU5Kc2NGcFhmTXY4SU9WRThEVU9teVpCUk5F?=
 =?utf-8?B?U29hS28ya1JwQ3dhdTNPY09oKzVaK203TWpleXlYSEhFcGRUUDNFcXlWSzF6?=
 =?utf-8?Q?Y+gVZQjkgw4m1A0Mem8vRhToDdC+Xq030WgYBHI?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 88e7dd79-7be9-4fc1-34a3-08d8ce6966ac
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Feb 2021 08:45:36.3947
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5QkETuRKivQQ9yKwKjLQVegorhze4ZQGHUV3Hg+874/M3VrTD/ONeyOdc/xIEuxnoQh2Ym+SvQxW+akP1a5m+w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB3483
X-OriginatorOrg: citrix.com

On Wed, Feb 10, 2021 at 05:48:26PM +0100, Jan Beulich wrote:
> I did further consider not allocating any real page at all, but just
> using the address of some unpopulated space (which would require
> announcing this page as reserved to Dom0, so it wouldn't put any PCI
> MMIO BARs there). But I thought this would be too controversial, because
> of the possible risks associated with this.

No, Xen is not capable of allocating a suitable unpopulated page IMO,
so let's not go down that route. Wasting one RAM page seems perfectly
fine to me.

> Perhaps the change to p2m_get_iommu_flags() should be in a separate
> patch.

Maybe, I'm still not fully convinced that's a change we want to do
TBH.

> --- a/xen/arch/x86/domain.c
> +++ b/xen/arch/x86/domain.c
> @@ -1007,6 +1007,8 @@ int arch_domain_soft_reset(struct domain
>  
>  void arch_domain_creation_finished(struct domain *d)
>  {
> +    if ( is_hvm_domain(d) )
> +        hvm_domain_creation_finished(d);
>  }
>  
>  #define xen_vcpu_guest_context vcpu_guest_context
> --- a/xen/arch/x86/hvm/vmx/vmx.c
> +++ b/xen/arch/x86/hvm/vmx/vmx.c
> @@ -66,8 +66,7 @@ boolean_param("force-ept", opt_force_ept
>  static void vmx_ctxt_switch_from(struct vcpu *v);
>  static void vmx_ctxt_switch_to(struct vcpu *v);
>  
> -static int  vmx_alloc_vlapic_mapping(struct domain *d);
> -static void vmx_free_vlapic_mapping(struct domain *d);
> +static int alloc_vlapic_mapping(void);
>  static void vmx_install_vlapic_mapping(struct vcpu *v);
>  static void vmx_update_guest_cr(struct vcpu *v, unsigned int cr,
>                                  unsigned int flags);
> @@ -78,6 +77,8 @@ static int vmx_msr_read_intercept(unsign
>  static int vmx_msr_write_intercept(unsigned int msr, uint64_t msr_content);
>  static void vmx_invlpg(struct vcpu *v, unsigned long linear);
>  
> +static mfn_t __read_mostly apic_access_mfn;
> +
>  /* Values for domain's ->arch.hvm_domain.pi_ops.flags. */
>  #define PI_CSW_FROM (1u << 0)
>  #define PI_CSW_TO   (1u << 1)
> @@ -401,7 +402,6 @@ static int vmx_domain_initialise(struct
>          .to   = vmx_ctxt_switch_to,
>          .tail = vmx_do_resume,
>      };
> -    int rc;
>  
>      d->arch.ctxt_switch = &csw;
>  
> @@ -411,21 +411,16 @@ static int vmx_domain_initialise(struct
>       */
>      d->arch.hvm.vmx.exec_sp = is_hardware_domain(d) || opt_ept_exec_sp;
>  
> -    if ( !has_vlapic(d) )
> -        return 0;
> -
> -    if ( (rc = vmx_alloc_vlapic_mapping(d)) != 0 )
> -        return rc;
> -
>      return 0;
>  }
>  
> -static void vmx_domain_relinquish_resources(struct domain *d)
> +static void domain_creation_finished(struct domain *d)
>  {
> -    if ( !has_vlapic(d) )
> -        return;
>  
> -    vmx_free_vlapic_mapping(d);
> +    if ( !mfn_eq(apic_access_mfn, _mfn(0)) &&
> +         set_mmio_p2m_entry(d, gaddr_to_gfn(APIC_DEFAULT_PHYS_BASE),
> +                            apic_access_mfn, PAGE_ORDER_4K) )
> +        domain_crash(d);
>  }
>  
>  static void vmx_init_ipt(struct vcpu *v)
> @@ -2407,7 +2402,7 @@ static struct hvm_function_table __initd
>      .cpu_up_prepare       = vmx_cpu_up_prepare,
>      .cpu_dead             = vmx_cpu_dead,
>      .domain_initialise    = vmx_domain_initialise,
> -    .domain_relinquish_resources = vmx_domain_relinquish_resources,
> +    .domain_creation_finished = domain_creation_finished,
>      .vcpu_initialise      = vmx_vcpu_initialise,
>      .vcpu_destroy         = vmx_vcpu_destroy,
>      .save_cpu_ctxt        = vmx_save_vmcs_ctxt,
> @@ -2653,7 +2648,7 @@ const struct hvm_function_table * __init
>  {
>      set_in_cr4(X86_CR4_VMXE);
>  
> -    if ( vmx_vmcs_init() )
> +    if ( vmx_vmcs_init() || alloc_vlapic_mapping() )
>      {
>          printk("VMX: failed to initialise.\n");
>          return NULL;
> @@ -3208,7 +3203,7 @@ gp_fault:
>      return X86EMUL_EXCEPTION;
>  }
>  
> -static int vmx_alloc_vlapic_mapping(struct domain *d)
> +static int __init alloc_vlapic_mapping(void)
>  {
>      struct page_info *pg;
>      mfn_t mfn;
> @@ -3216,53 +3211,28 @@ static int vmx_alloc_vlapic_mapping(stru
>      if ( !cpu_has_vmx_virtualize_apic_accesses )
>          return 0;
>  
> -    pg = alloc_domheap_page(d, MEMF_no_refcount);
> +    pg = alloc_domheap_page(NULL, 0);
>      if ( !pg )
>          return -ENOMEM;
>  
> -    if ( !get_page_and_type(pg, d, PGT_writable_page) )
> -    {
> -        /*
> -         * The domain can't possibly know about this page yet, so failure
> -         * here is a clear indication of something fishy going on.
> -         */
> -        domain_crash(d);
> -        return -ENODATA;
> -    }
> -
>      mfn = page_to_mfn(pg);
>      clear_domain_page(mfn);
> -    d->arch.hvm.vmx.apic_access_mfn = mfn;
> +    apic_access_mfn = mfn;
>  
> -    return set_mmio_p2m_entry(d, gaddr_to_gfn(APIC_DEFAULT_PHYS_BASE), mfn,
> -                              PAGE_ORDER_4K);
> -}
> -
> -static void vmx_free_vlapic_mapping(struct domain *d)
> -{
> -    mfn_t mfn = d->arch.hvm.vmx.apic_access_mfn;
> -
> -    d->arch.hvm.vmx.apic_access_mfn = _mfn(0);
> -    if ( !mfn_eq(mfn, _mfn(0)) )
> -    {
> -        struct page_info *pg = mfn_to_page(mfn);
> -
> -        put_page_alloc_ref(pg);
> -        put_page_and_type(pg);
> -    }
> +    return 0;
>  }
>  
>  static void vmx_install_vlapic_mapping(struct vcpu *v)
>  {
>      paddr_t virt_page_ma, apic_page_ma;
>  
> -    if ( mfn_eq(v->domain->arch.hvm.vmx.apic_access_mfn, _mfn(0)) )
> +    if ( mfn_eq(apic_access_mfn, _mfn(0)) )

You should check if the domain has a vlapic I think, since now
apic_access_mfn is global and will be set regardless of whether the
domain has vlapic enabled or not.

Previously apic_access_mfn was only allocated if the domain had vlapic
enabled.

>          return;
>  
>      ASSERT(cpu_has_vmx_virtualize_apic_accesses);
>  
>      virt_page_ma = page_to_maddr(vcpu_vlapic(v)->regs_page);
> -    apic_page_ma = mfn_to_maddr(v->domain->arch.hvm.vmx.apic_access_mfn);
> +    apic_page_ma = mfn_to_maddr(apic_access_mfn);
>  
>      vmx_vmcs_enter(v);
>      __vmwrite(VIRTUAL_APIC_PAGE_ADDR, virt_page_ma);

I would consider setting up the vmcs and adding the page to the p2m in
the same function, and likely call it from vlapic_init. We could have
a domain_setup_apic in hvm_function_table that takes care of all this.

> --- a/xen/include/asm-x86/hvm/hvm.h
> +++ b/xen/include/asm-x86/hvm/hvm.h
> @@ -106,6 +106,7 @@ struct hvm_function_table {
>       * Initialise/destroy HVM domain/vcpu resources
>       */
>      int  (*domain_initialise)(struct domain *d);
> +    void (*domain_creation_finished)(struct domain *d);
>      void (*domain_relinquish_resources)(struct domain *d);
>      void (*domain_destroy)(struct domain *d);
>      int  (*vcpu_initialise)(struct vcpu *v);
> @@ -390,6 +391,12 @@ static inline bool hvm_has_set_descripto
>      return hvm_funcs.set_descriptor_access_exiting;
>  }
>  
> +static inline void hvm_domain_creation_finished(struct domain *d)
> +{
> +    if ( hvm_funcs.domain_creation_finished )
> +        alternative_vcall(hvm_funcs.domain_creation_finished, d);
> +}
> +
>  static inline int
>  hvm_guest_x86_mode(struct vcpu *v)
>  {
> @@ -765,6 +772,11 @@ static inline void hvm_invlpg(const stru
>  {
>      ASSERT_UNREACHABLE();
>  }
> +
> +static inline void hvm_domain_creation_finished(struct domain *d)
> +{
> +    ASSERT_UNREACHABLE();
> +}
>  
>  /*
>   * Shadow code needs further cleanup to eliminate some HVM-only paths. For
> --- a/xen/include/asm-x86/hvm/vmx/vmcs.h
> +++ b/xen/include/asm-x86/hvm/vmx/vmcs.h
> @@ -58,7 +58,6 @@ struct ept_data {
>  #define _VMX_DOMAIN_PML_ENABLED    0
>  #define VMX_DOMAIN_PML_ENABLED     (1ul << _VMX_DOMAIN_PML_ENABLED)
>  struct vmx_domain {
> -    mfn_t apic_access_mfn;
>      /* VMX_DOMAIN_* */
>      unsigned int status;
>  
> --- a/xen/include/asm-x86/p2m.h
> +++ b/xen/include/asm-x86/p2m.h
> @@ -935,6 +935,9 @@ static inline unsigned int p2m_get_iommu
>          flags = IOMMUF_readable;
>          if ( !rangeset_contains_singleton(mmio_ro_ranges, mfn_x(mfn)) )
>              flags |= IOMMUF_writable;
> +        /* VMX'es APIC access page is global and hence has no owner. */
> +        if ( mfn_valid(mfn) && !page_get_owner(mfn_to_page(mfn)) )
> +            flags = 0;

Is it fine to have this page accessible to devices if the page tables
are shared between the CPU and the IOMMU?

Is it possible for devices to write to it?

I still think both the CPU and the IOMMU page tables should be the
same unless there's a technical reason for them not to be, rather than
us just wanting to hide things from devices.

Thanks, Roger.

