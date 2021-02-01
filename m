Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 91F0230A9B5
	for <lists+xen-devel@lfdr.de>; Mon,  1 Feb 2021 15:27:49 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.79909.145727 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l6aAw-0006r6-2A; Mon, 01 Feb 2021 14:27:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 79909.145727; Mon, 01 Feb 2021 14:27:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l6aAv-0006qh-V6; Mon, 01 Feb 2021 14:27:33 +0000
Received: by outflank-mailman (input) for mailman id 79909;
 Mon, 01 Feb 2021 14:27:32 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Dub/=HD=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1l6aAu-0006qc-CP
 for xen-devel@lists.xenproject.org; Mon, 01 Feb 2021 14:27:32 +0000
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 4834ab1d-ba13-4c25-92e9-d886850d56f5;
 Mon, 01 Feb 2021 14:27:31 +0000 (UTC)
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
X-Inumbo-ID: 4834ab1d-ba13-4c25-92e9-d886850d56f5
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1612189650;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=Ob8RLq4BB/B8dGEbt7qAiulpcg4OPRplWuekIBJLkEo=;
  b=HA6UdEvpbmWhxXMqcyPjBHztgrKk8MpjpsW3V+3x1DXoUZYuF/26V5xB
   o2e5zbwKF4Mw03YrFaBOAP/SFUKFpNxOLxNxPpESJOXY+1XfiI6ZI7iU5
   jwkbTaoJQz603h0SEIKvu4M4xET/3qg6tf34seMuNS9AHNJMjK4VvqZAx
   0=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: l1D5xyjDSB8M+V2nwZPCbxwVCLgBmqaliz72pKtWIosb+AMK9BA4FyJIoLDfOC55jR1nr6eNdc
 GC5fXh907pmDTQ5/1XvvBX7vPu1yLCF55syzqAqZjedZPaIQ5RYaLjc0ZE9qAM5Mrm0R9SVP82
 hV5ZyHXBFPoq6VG7MatFS9XiPZNvbvrdP3LT926ZkCs/FTgXbYNJBue+jgLAdIa9HC2tq7wjCr
 UWZ8pp12aV7aGxUmATzi2yPlifK7hYXFTN9nP3QKM5onWq+bO7gZ6qtUgASNv32zl9X4dNZLC0
 A/k=
X-SBRS: 5.2
X-MesageID: 36236266
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.79,392,1602561600"; 
   d="scan'208";a="36236266"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hayBnQ542UlliqkIMDI5zCoNP8/RswI/Z86sUz5FWYLLDbvifOV5zJr1hu1hBlPzXJs10OF4eBcAL7qsjyjti+/zTFqi/eX/BvFSSckpJfrYkKGWGS04G01M+XuqqTwGNlHOagwfvzbZnyMVkQ3szkhFgYAPVcf24V33zM9PCQbwM6xP4cd7hDoGqir3GC75fETBA31cEfxFQ5n9LK0dQRxOJ4ERWGS2FYAoqN/RV7aWpiIvBW6dLnT5mhpape+M2AoABqJdtHJSMjKTOY1YLGc6dXn5SFvI7cHK4XScP8X9g5PrnRZ/UAy9QMSMa+D25ynYgSIFBHtUT+VqsTSkpw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=b/3YTPFMnKzL432BWu94ZdEMueSSPJFLNvFpTtef/kE=;
 b=kE802x7lcJAmQuCgNhMpmJ5a8snQXxLtLI2/Gv2utqMlw2NpX+kQYM+DOIg/tvZ3R8zM0GOFW7ToUArkbQMQZL/YynUzV6Mm2iZktX8uvS83sd+hTiz4RBUZtJHM7nTItJx3IaeyGVxbx/+BlL0TjKMpDXutV/8Cn20SiOQf9uoINCiNh6PBJZioM8ivNpdNjo9aDRYxrkpLD9d2VfTdYhBLsUMC37av8HqWteV6mBkidrZcX1uwXWJfCc64j24fZUx7ia9CbouOwRG6V6BDdInbXswMXaYSze2lij+BvmmHowFo8RDRpvNvGBlrtDAYvJuh50OGTkEmmnlNEztkUQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=b/3YTPFMnKzL432BWu94ZdEMueSSPJFLNvFpTtef/kE=;
 b=DKTpm1z/8xFcSnbtsqRQR07/VlnOVf8OQ4QOd6XK5Y50Efk89rQUnwZpjLXr33wdW7B4lh0kWYScX96xgM12iHpQpgq+J7bEDlxBS/S3WYNtFZq3lmyrVc0kV8pZd2ck+9Tg+DZKo0XRJQV0DlyW2fju48YsebIhJR6QyIarbtU=
Date: Mon, 1 Feb 2021 15:27:22 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>,
	=?utf-8?Q?Micha=C5=82_Leszczy=C5=84ski?= <michal.leszczynski@cert.pl>, "Jan
 Beulich" <JBeulich@suse.com>, Wei Liu <wl@xen.org>, Jun Nakajima
	<jun.nakajima@intel.com>, Kevin Tian <kevin.tian@intel.com>, Tamas K Lengyel
	<tamas@tklengyel.com>
Subject: Re: [PATCH v8 12/16] xen/domctl: Add XEN_DOMCTL_vmtrace_op
Message-ID: <YBgPyi0IZSRmirTB@Air-de-Roger>
References: <20210130025852.12430-1-andrew.cooper3@citrix.com>
 <20210130025852.12430-13-andrew.cooper3@citrix.com>
 <YBftkqLHfwIzpaN9@Air-de-Roger>
 <316b907e-ff40-039c-374a-c07fbb33bbc2@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <316b907e-ff40-039c-374a-c07fbb33bbc2@citrix.com>
X-ClientProxiedBy: MRXP264CA0016.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:500:15::28) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: eff26337-857d-4d32-6925-08d8c6bd807c
X-MS-TrafficTypeDiagnostic: DS7PR03MB5608:
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DS7PR03MB560889880FAA9FCFBABF395E8FB69@DS7PR03MB5608.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6108;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 6UF8LMT3t6vs3UkZ3UQImTS7JO3t65aRhFjJWeAJmqK+bRW5gayoK6lM2Pq6cygCiW4chT/0Nn7dht6NWBYhJLhhcsx89OCNwslxknrQ0PtixhllekE3jBbbN3KdupBQ22N2ghLBMCXlBifsy7bNLcCl/BN436VSi31A9B2uSdnGGLa4Z3vybgC2KQ5y3nse5sNVE7Aj0MlqOVPV1r9hTkTmm86YLz3DjCzUyKqVBA2WagoCIk6r0eklicTjfTbRsSeIMntfvySe3AGwlpEc9XjTD76souXkR+0HRghUPkSqhcFocyLNdjUABb02ecdMZb/Aonk6Qcfocp04UM4zgPLUEVICNbKMX6yN0MoVTx+kUd8MhCYieg+jcWzzKEsCwFOpV2z462elqT9+ahDhIAwBmjlDP01boT9kWVWM7WkEHRPyb3Zwt5SJLaGFGdflod+JK6OmPrOQ1QrQfhEAMRPh2ZKPYov8tXxHAw0uATLel6kkCJ1L8M+qtmkhplkGEqYJIrpiuOHysd1Ptl7VVg==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(7916004)(39860400002)(376002)(396003)(136003)(346002)(366004)(4326008)(478600001)(8936002)(53546011)(6666004)(5660300002)(8676002)(66946007)(956004)(86362001)(85182001)(83380400001)(6636002)(186003)(6496006)(54906003)(66556008)(66476007)(316002)(9686003)(6486002)(33716001)(26005)(6862004)(2906002)(16526019);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?VTlRWTR2dFAzZk1RcnpPb0dlNkI1L2JZakt3bzgzMS9takM2bTlTaGdpTlZt?=
 =?utf-8?B?cEFhUlJOUU8wWnJjcWp1SFJBUERjc0cyNDR0ajlBRDJZOERmT2tYNHZLbnEz?=
 =?utf-8?B?T3Z6dS9tUllsUjdzR0RXOWlHUXpjVmxDTy84VGV5b21FVG56dkJOVkZESkNv?=
 =?utf-8?B?bGxhaHp5elFnZUROcUVxWHRLa1I0ZzRsZ2JaSVNEUlFCaGtFdE1CRGNCNGpr?=
 =?utf-8?B?a2hxUHlOTU1nU3YrT0lsT1R3MjhWN3FsY1d0b0hWbnRpNFZ2NmlyLzdBNllv?=
 =?utf-8?B?c3ZxSFdGck9GbmNKSC9FaVltSnFyb1VNUkdvMXkvY3BaMkZzcnRtYU8xeDdy?=
 =?utf-8?B?Z3VzMUl3OXN0SzZOV2lYVlNHT2dQVjRUbDJvaGUxdk5GY3Uya2VxOWdDRCtO?=
 =?utf-8?B?UURjdUYvSmlHK2N6N1llRlB5WDdGQ1pReHltWVc3clBqRlRyZWRZeDZQd3E0?=
 =?utf-8?B?ZnZvdkg3bVhKUTZoNG0yN1I1VXppd0l0bEFtT2doL1R0OVpmWTRmamwwSTEw?=
 =?utf-8?B?SjB0VXk1ZUlhWjR3SGhJUFp1V29UREJObVNnSEtMMGpacXBqcm16SW1mQnRU?=
 =?utf-8?B?c0VyaktITW5ocjF3K29kdjhOUlVpbHFodzlWYTR0Wm9WaXphcXNtNXpPU2Fx?=
 =?utf-8?B?YVpsYTJaRXUvdGo1WUhaMkxUWFdMd3lDNk80VU51UmM5b0FTMTMxMlRJOWw0?=
 =?utf-8?B?RjRpREdEeUV6Y3ZvbmFNL0cvd2VuMnA1UTRmdHQ5QWJIbDQvalZtNzBxVW1a?=
 =?utf-8?B?TWszSHpMaXI3T2xOVkQ4d3hhb2Y1NkovUUhoUmFMTzZRaWdmL0w2UnZFeHdL?=
 =?utf-8?B?U2JVTldvZmswLzI3U2VOa2tROGxpOHRzVEdQZk9KK0hSYmM0QmxBNjdSK1dm?=
 =?utf-8?B?Vmg4WnpCaWVGaysyblpGSFQzRnR0RjhCeVBhb2pia3lrVFhqR1ZjSzcrMHlz?=
 =?utf-8?B?M0oyekZPcXY4ZTZKK3RoRU1pMWR5QzlwVHV5N1BEQytad3pHcnFvNzUrdkQ5?=
 =?utf-8?B?MmxqSTRWc05UVU5ob0MrajhHWkxITnhrU1p0dEZOYThVaXFrdDBGNmwrQVUw?=
 =?utf-8?B?SDFaQnZBVEtRdWJhUWFYWmE2VU9yTEFVT1B5UzdwaFpwZmw2eUppTlVqc3hr?=
 =?utf-8?B?aXFNZGpVdXdNRlMvUitrVU5BZnVoWUM1UWxSS0QxeGszN0lzaFl2NElVZ3h3?=
 =?utf-8?B?enlDQkllT2dtSVMyT0RUUUQzZHRNc0VxcG5YUUNyeHJERVJFa2ZPRzRoUktX?=
 =?utf-8?B?OVRHd0FkcFIwZk5ZUTRhVEJMTlIrSEJEdmExM0grTnMrNHVvWGhJdnJYVW1s?=
 =?utf-8?B?N3FCTFc1RkJGS1NQM2JkNTBTeUdCcGNtcmZGc2VyeElYN2JuaXdMOUx0Q3VF?=
 =?utf-8?B?Q295bGZ1V0xncDJsQXJrV253V04yVkFFdDlERWdOWXRXS25XVFUrTGRBTDdM?=
 =?utf-8?B?RWpJaU9jWFZza2hHdUY4Ukx4elRsRnRubTdkNFd3PT0=?=
X-MS-Exchange-CrossTenant-Network-Message-Id: eff26337-857d-4d32-6925-08d8c6bd807c
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Feb 2021 14:27:28.2299
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /d2xoArTmr6Pg/X1YoAR68DqIrYUvgvW8ZzBDImonINmhOrg8SOSMtDlaA9UCXFlFAQ9fdemu6WRNk2aoKd3xQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR03MB5608
X-OriginatorOrg: citrix.com

On Mon, Feb 01, 2021 at 01:00:47PM +0000, Andrew Cooper wrote:
> On 01/02/2021 12:01, Roger Pau Monné wrote:
> > On Sat, Jan 30, 2021 at 02:58:48AM +0000, Andrew Cooper wrote:
> >> diff --git a/xen/arch/x86/hvm/vmx/vmx.c b/xen/arch/x86/hvm/vmx/vmx.c
> >> index 12b961113e..a64c4e4177 100644
> >> --- a/xen/arch/x86/hvm/vmx/vmx.c
> >> +++ b/xen/arch/x86/hvm/vmx/vmx.c
> >> @@ -2261,6 +2261,157 @@ static bool vmx_get_pending_event(struct vcpu *v, struct x86_event *info)
> >>      return true;
> >>  }
> >>  
> >> +/*
> >> + * We only let vmtrace agents see and modify a subset of bits in MSR_RTIT_CTL.
> >> + * These all pertain to data-emitted into the trace buffer(s).  Must not
> >> + * include controls pertaining to the structure/position of the trace
> >> + * buffer(s).
> >> + */
> >> +#define RTIT_CTL_MASK                                                   \
> >> +    (RTIT_CTL_TRACE_EN | RTIT_CTL_OS | RTIT_CTL_USR | RTIT_CTL_TSC_EN | \
> >> +     RTIT_CTL_DIS_RETC | RTIT_CTL_BRANCH_EN)
> >> +
> >> +/*
> >> + * Status bits restricted to the first-gen subset (i.e. no further CPUID
> >> + * requirements.)
> >> + */
> >> +#define RTIT_STATUS_MASK                                                \
> >> +    (RTIT_STATUS_FILTER_EN | RTIT_STATUS_CONTEXT_EN | RTIT_STATUS_TRIGGER_EN | \
> >> +     RTIT_STATUS_ERROR | RTIT_STATUS_STOPPED)
> >> +
> >> +static int vmtrace_get_option(struct vcpu *v, uint64_t key, uint64_t *output)
> >> +{
> >> +    const struct vcpu_msrs *msrs = v->arch.msrs;
> >> +
> >> +    switch ( key )
> >> +    {
> >> +    case MSR_RTIT_OUTPUT_MASK:
> > Is there any value in returning the raw value of this MSR instead of
> > just using XEN_DOMCTL_vmtrace_output_position?
> 
> Yes, but for interface reasons.
> 
> There are deliberately some common interfaces (for the subset of options
> expected to be useful), and some platform-specific ones (because there's
> no possible way we encode all of the options in some "common" interface).
> 
> Yes - there is some overlap between the two sets - that is unavoidable
> IMO.  A user of this interface already needs platform specific knowledge
> because it has to interpret the contents of the trace buffer.
> 
> Future extensions to this interface would be setting up the CR3 filter
> and range filters, which definitely shouldn't be common, and can be
> added without new subops in the current model.
> 
> > The size of the buffer should be known to user-space, and then setting
> > the offset could be done by adding a XEN_DOMCTL_vmtrace_set_output_position?
> >
> > Also the contents of this MSR depend on whether ToPA mode is used, and
> > that's not under the control of the guest. So if Xen is switched to
> > use ToPA mode at some point the value of this MSR might not be what a
> > user of the interface expects.
> >
> > From an interface PoV it might be better to offer:
> >
> > XEN_DOMCTL_vmtrace_get_limit
> > XEN_DOMCTL_vmtrace_get_output_position
> > XEN_DOMCTL_vmtrace_set_output_position
> >
> > IMO, as that would be compatible with ToPA if we ever switch to it.
> 
> ToPA is definitely more complicated.  We'd need to stitch the disparate
> buffers back together into one logical view, at which point
> get_output_position becomes more complicated.
> 
> As for set_output_position, that's not useful.  You either want to keep
> the position as-is, or reset back to 0, hence having a platform-neutral
> reset option.
> 
> However, based on this reasoning, I think I should drop access to
> MSR_RTIT_OUTPUT_MASK entirely.  Neither half is useful for userspace to
> access in a platforms-specific way, and disallowing access entirely will
> simplify adding ToPA support in the future.

Exactly. Dropping access to MSR_RTIT_OUTPUT_MASK would indeed solve my
concerns. I somehow assumed that setting the offset was needed for the
users of the interface. With that dropped you can add:

Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>

Thanks, Roger.

