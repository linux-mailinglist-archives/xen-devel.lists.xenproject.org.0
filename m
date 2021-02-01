Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2000230A712
	for <lists+xen-devel@lfdr.de>; Mon,  1 Feb 2021 13:02:33 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.79809.145384 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l6Xu6-0007GS-Ty; Mon, 01 Feb 2021 12:02:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 79809.145384; Mon, 01 Feb 2021 12:02:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l6Xu6-0007G5-Qu; Mon, 01 Feb 2021 12:02:02 +0000
Received: by outflank-mailman (input) for mailman id 79809;
 Mon, 01 Feb 2021 12:02:01 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Dub/=HD=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1l6Xu5-0007G0-3G
 for xen-devel@lists.xenproject.org; Mon, 01 Feb 2021 12:02:01 +0000
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id f310392f-0058-45d9-810c-ff6cb676d535;
 Mon, 01 Feb 2021 12:01:58 +0000 (UTC)
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
X-Inumbo-ID: f310392f-0058-45d9-810c-ff6cb676d535
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1612180918;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=pEmJHvnpvhnxSN0K1Pw1fw/sCUSG7qwjuEy7nvEn5lc=;
  b=AeP01b0lZLfoxbs3A/Gx7aKAQvDVbtOMpa7DjP4Ddt/1O0eSE8Lscy8x
   X48AV4m3mPouPkwaEuZN3+fNM3Re++h7utjO04y1QgagfojyjAE0eqnQL
   a6PZd/tobeU3GXJPcuQ2cLopX7O5k0EInNP2sRVVn+gxGDKyhHZ4G8uhs
   w=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: 27X+8H/vSHJyFvUg9iqvwAIbGVc9jT64oyDYHZt8JlQB1+30KEwmFy4sY5124KBcBmWbWSdp8J
 DteaPlZdPgheN4W2Jm/fk3Qc4MyQf+LtZUOwLx0MIidEjROE01wuF/B06Ay0qu8NkDZl0QdhA4
 ZjqVbGJmcGxtLc6yPNeXFk9plgBFGqUAFcWYcoLl4HqozvK2L1f2792QuCJO13GAEXCXviSXxt
 8B2q1X+EIisHxUN5QtbJkMiEPOQV09peMzRzhs8GOgdsMpQOi/QTstEXSjBcWTR7fHgXnTfycX
 ugY=
X-SBRS: 5.2
X-MesageID: 36466771
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.79,392,1602561600"; 
   d="scan'208";a="36466771"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PKQq6uAklNpjYkR3dgGGQWXShFJzpbSBhvFhN1V5AElPvERyVdFV7umln+4ReeO/9zBhHlUL24y66DKoW0IXUjgzc0MXBFJAwxHz2p13QhI4x0iLwdljF+yYgPTBz7KE3n3fi0vQlkevBEjKZHDzmtUMOy1tnBV0SKY2NbL9EWJgRLfRr1lK2kMYV4Shw0wkCUq32ciFN0+EsL3Y4DGa+1KVha+bIXSkR8XtGITu0RytpQH96BfgCbweWz5/ZoTNJJuyd9nInDf05gE4ioGOKJiXTPh0ULTeg3edJHKYWtlG0Zry8cNbeMjImhMmUd251D6Nh3QCghMcDESQRZLscg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Wb6ot+QJdkaYDefg/rBunuBoFJoz9ePHqO3a3cXrWYg=;
 b=KSULxET2KxlwOgezFzVoWFV9eRjyJUUhsglQ9peYAf5Xz2WgIBJsCYQQ42H+SMXFbKzMYJb1fzEA73nl07AJ4z5TCkKBszIQUhjnFHRJBHWw8tDSu4468YrRtzUFFlJetAir1KU8XGSocUOmveSMSuFgIO/X4Rb7etLA5rhQkqzdDeZjz4zMFhxjtmJfjhDIrKpCcoBVdZfbS5xuUgNxA90+1CGI54AFB7lZ/VQM90cT+lkjGDy0WtdhzwiDYzFtGWF5dkTV0RinMaVsR0MUEUN3er0eaL1ILTUsMjYBdwv4B97r7A9Z0FNfrZqRTQZCP+cyeRhz7kkK97b578v/rQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Wb6ot+QJdkaYDefg/rBunuBoFJoz9ePHqO3a3cXrWYg=;
 b=tfFhKCE+CsS7204yOp5OHI6xHosMYgrKrdRRw0l2lzrWh4dN8/s59/I68NHvhPzoNkyMPQebn0R5NJRfA1v/y6LYxz1zxgQWYmtBRSAIH122IWeYTyylsLUtUNtGOB/JiTuSwa9O8nEyzVs4+OIqKliP7Ctk7bRI2e6QKG9jFQo=
Date: Mon, 1 Feb 2021 13:01:22 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>,
	=?utf-8?Q?Micha=C5=82_Leszczy=C5=84ski?= <michal.leszczynski@cert.pl>, "Jan
 Beulich" <JBeulich@suse.com>, Wei Liu <wl@xen.org>, Jun Nakajima
	<jun.nakajima@intel.com>, Kevin Tian <kevin.tian@intel.com>, Tamas K Lengyel
	<tamas@tklengyel.com>
Subject: Re: [PATCH v8 12/16] xen/domctl: Add XEN_DOMCTL_vmtrace_op
Message-ID: <YBftkqLHfwIzpaN9@Air-de-Roger>
References: <20210130025852.12430-1-andrew.cooper3@citrix.com>
 <20210130025852.12430-13-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20210130025852.12430-13-andrew.cooper3@citrix.com>
X-ClientProxiedBy: PR3P189CA0113.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:102:b5::28) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 12594a62-c8d2-408b-bfac-08d8c6a91b71
X-MS-TrafficTypeDiagnostic: DM6PR03MB3916:
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM6PR03MB3916ACBD2AEC52DC1B3E4EF48FB69@DM6PR03MB3916.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4714;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: V7IEpkf8o1AWl0PfYppMZ4NBT8ylqufaN9AJOnG08SWZ45enpVVGBsJ8irCo7IA7xUDqR1P4B0+v2QL5Iu7vjejd2I4pAVjY64eVyoQKcchBTCj0/RjvAU6rj0kLZGY36SepU1EpiKnRO6eNK4zhg7YcFPrGKxBa4FEcGP9zEOczzVd3LswSRpPbZ0/zWh+Ha4egzvcd0eAmbI4kFY3LBnzMWFMJxLdtU0r4VvHmrWHtJhEmeAozjE3KTql3Ls4bAarrvpw71WwXl9IGQilFhNQ5Izn4RkqQEd2kik6D/Ip3LjfUQF/dn2rmy5T82Mqb7aX+hilj1horHK4nvdx1SP2hvz2OhnPzPh9+B2XAwsRjH8hDdOZ4O4xXYByghYHhn5el3GOqZw4ZpFwBLWU016oH1zNGw8XJbn9pWjln2bafjxNCJz4rVvTa2hwNG6k0lm0pmpWSZ+1ZHbYC+mYGYPhwt+GW1Y5MaZ44Nb2bX0J3yUGJHPW2N8AnEWePwDgRm4sX7UhI5iB/EL8DqXs7cA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(7916004)(4636009)(396003)(346002)(376002)(366004)(39860400002)(136003)(66476007)(316002)(16526019)(186003)(9686003)(956004)(66946007)(6496006)(33716001)(8676002)(478600001)(26005)(85182001)(66556008)(5660300002)(6862004)(86362001)(83380400001)(4326008)(2906002)(6486002)(6636002)(6666004)(54906003)(8936002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?ekI3ZVlEYWR3anlYUkFYVE1LMFY5R2Zhdng1dndtZ0hQblQ1UVE2S1JqYXpV?=
 =?utf-8?B?Zkd0UDlyTnpPRkFweVE2Qld3eFBYWU1SbXk4Q0xseE4xVWFNTUJ1QW11RXNS?=
 =?utf-8?B?MUQ2K3AzVlh3L0dsMTJrWlNkeDJLTUo2Z2F4bEN5VkRtQUJaR3VDa2UzQ1hC?=
 =?utf-8?B?ZGFnTEZSbDFLREVzWUtXeGdCT0VQMEFzUkhnUVBkMGRFbFVUMWVZWXVjTE5L?=
 =?utf-8?B?UUlsWndpSlYrOG5wbElzVGg5YWdlbytYMXltdEgyUlNOaUdmczZTdHd6cWZw?=
 =?utf-8?B?L0c4QVdJZHBabzBVK1BPNWJPU2V1ckNjOFFPeUlKcitGRk5YQ01GeFkvWkxl?=
 =?utf-8?B?VmNPVzBwaDJORHlVVnYwdlByUnpXZHVKVm9NdXFReUdzcTA4YUpDOW9GTHBn?=
 =?utf-8?B?MlFyem9zSEwzKzFPVXdGaGxlVnpzUFZRNE0zMVl3RFNJYUxaYlZCakJIN1lZ?=
 =?utf-8?B?OFo0SzdBeGw2Rm9WZ2VLdDZON0dKT3JLSS8wQ1NSNWEvZU84OE5mNWRVdzN0?=
 =?utf-8?B?TDExVS9JMjRBMVQzWVNGUnF1RmMrSDlLRjNIT3FwWkpnS0lBQWtxdUJ1YnRw?=
 =?utf-8?B?eEg2OHRDVVZmODVYOXdGd1F6eTl5a3hIR1Z0SmRIa1NENmpsMXhNaDlvcXBG?=
 =?utf-8?B?T0FFRFpPVnMrdkxRaG1rd1BDRUVhNlgrY2JNVXBia0UxL0ZDZ3BRMldVWGlB?=
 =?utf-8?B?Skpmd29mc3l6RVNIN1lHdVlyWUt2TUprVk00M3FCNzNCbXgvN3NrT0ZnVXlw?=
 =?utf-8?B?bjl1NFRrMHkyMmlZNSswOU9NYmNreHRPdndxVFdmcmFQNUdnQ2Y2dHdBOThk?=
 =?utf-8?B?enlZbktML0N4OUxaOCtNNnlWRWVoSm13NmdOblBUa0N6MnZHSldEWTdHSHpQ?=
 =?utf-8?B?S1JjM2JFUG5WdUVHMUZzMUIvVjJ5Y3dreDEwSHpTZXlhZVZMYjZwSGgvZnVQ?=
 =?utf-8?B?eTZGVk0zbUJzUXVGTC9VOGhZeGI5SmMyMm1xcVBVcXYxL09CWENqS3RIQTNS?=
 =?utf-8?B?dXhtN3AzdUVCWmgzYjdZWTVUeWxYMVduZGVmUTBJOHNBZjNDbE9ibFlBLzYz?=
 =?utf-8?B?R1NPYVF3UEowMmpuUmlrNGg3N05ZUitDWmNIYjh1UG1Ld2haOU5PVzRhQkx2?=
 =?utf-8?B?Q2xLRWg4R3RvRHpMZEcyUVV5YXpHVUVUbEk0eDdzclA0MnB5QnN4SHExK0lQ?=
 =?utf-8?B?ZjRya1hoM1grQ2JReFdmaElRc1BiU3lwSVdVa0ZmZkRxYmYvUmRJZ2M2d2RL?=
 =?utf-8?B?SjRLc1BVR1JqWFh4RlVVY3NDUGNiUlpIZmk1ZmVXL1Y5N0pnZW5adkFieUE0?=
 =?utf-8?B?ZkJuVFUwWCtYKzVqZGRrQ3JRbVdQcmxsMjFVb2dYd2Rxc0hRSUluOGZOVWtv?=
 =?utf-8?B?cVRvM2l2ZHVpOTQ1SmN3L0o2bGtyRUx2SWNnd01tSVFEQzhrSlRJdkpIQWdl?=
 =?utf-8?B?bFJwU05nd0owSWFxejlWVFZJT2Njb1cyRDNUKy93PT0=?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 12594a62-c8d2-408b-bfac-08d8c6a91b71
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Feb 2021 12:01:28.7248
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: B0f4XLNtkonW5+qEI1aXHrxXoyxEEHEihcA18egCvOuMFvhAseBqZ13mSt8ucxCbnNFxAqKxy+ov4kjIPY2WtQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB3916
X-OriginatorOrg: citrix.com

On Sat, Jan 30, 2021 at 02:58:48AM +0000, Andrew Cooper wrote:
> diff --git a/xen/arch/x86/hvm/vmx/vmx.c b/xen/arch/x86/hvm/vmx/vmx.c
> index 12b961113e..a64c4e4177 100644
> --- a/xen/arch/x86/hvm/vmx/vmx.c
> +++ b/xen/arch/x86/hvm/vmx/vmx.c
> @@ -2261,6 +2261,157 @@ static bool vmx_get_pending_event(struct vcpu *v, struct x86_event *info)
>      return true;
>  }
>  
> +/*
> + * We only let vmtrace agents see and modify a subset of bits in MSR_RTIT_CTL.
> + * These all pertain to data-emitted into the trace buffer(s).  Must not
> + * include controls pertaining to the structure/position of the trace
> + * buffer(s).
> + */
> +#define RTIT_CTL_MASK                                                   \
> +    (RTIT_CTL_TRACE_EN | RTIT_CTL_OS | RTIT_CTL_USR | RTIT_CTL_TSC_EN | \
> +     RTIT_CTL_DIS_RETC | RTIT_CTL_BRANCH_EN)
> +
> +/*
> + * Status bits restricted to the first-gen subset (i.e. no further CPUID
> + * requirements.)
> + */
> +#define RTIT_STATUS_MASK                                                \
> +    (RTIT_STATUS_FILTER_EN | RTIT_STATUS_CONTEXT_EN | RTIT_STATUS_TRIGGER_EN | \
> +     RTIT_STATUS_ERROR | RTIT_STATUS_STOPPED)
> +
> +static int vmtrace_get_option(struct vcpu *v, uint64_t key, uint64_t *output)
> +{
> +    const struct vcpu_msrs *msrs = v->arch.msrs;
> +
> +    switch ( key )
> +    {
> +    case MSR_RTIT_OUTPUT_MASK:

Is there any value in returning the raw value of this MSR instead of
just using XEN_DOMCTL_vmtrace_output_position?

The size of the buffer should be known to user-space, and then setting
the offset could be done by adding a XEN_DOMCTL_vmtrace_set_output_position?

Also the contents of this MSR depend on whether ToPA mode is used, and
that's not under the control of the guest. So if Xen is switched to
use ToPA mode at some point the value of this MSR might not be what a
user of the interface expects.

From an interface PoV it might be better to offer:

XEN_DOMCTL_vmtrace_get_limit
XEN_DOMCTL_vmtrace_get_output_position
XEN_DOMCTL_vmtrace_set_output_position

IMO, as that would be compatible with ToPA if we ever switch to it.

Thanks, Roger.

