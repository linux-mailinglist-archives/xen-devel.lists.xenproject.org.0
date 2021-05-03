Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F9E4371306
	for <lists+xen-devel@lfdr.de>; Mon,  3 May 2021 11:30:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.121474.229145 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ldUsm-0000fP-Kx; Mon, 03 May 2021 09:28:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 121474.229145; Mon, 03 May 2021 09:28:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ldUsm-0000f0-HI; Mon, 03 May 2021 09:28:52 +0000
Received: by outflank-mailman (input) for mailman id 121474;
 Mon, 03 May 2021 09:28:51 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=iacE=J6=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1ldUsk-0000ev-Vj
 for xen-devel@lists.xenproject.org; Mon, 03 May 2021 09:28:51 +0000
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 05e3430f-de8f-4771-aaec-d6d2c661cba1;
 Mon, 03 May 2021 09:28:50 +0000 (UTC)
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
X-Inumbo-ID: 05e3430f-de8f-4771-aaec-d6d2c661cba1
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1620034129;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=xzwvYaLoVXYRdhMYB3H29yYEV6go5oWRT/nfLjDaI78=;
  b=agOFg6KS/NusuzDN8C5tEtdMuX/PKCuF3SX7DaDtggy9S9A5a8eHFzRS
   O67HSpiE6CxDtx4KRS+ES8xbXEGzNtPs7FJn7HHdatvhDFJniJhEjoIpv
   Qn0kBgaUpe/0pEmYeh0nW3EFI/mIef71ddQTYKP4TMN2icS5GegsMtzkP
   A=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: 3s1/vaJtYC7YHP9js9sRHnafOMfC/88T35deNbb6toy7WiBnURkXrYaitIJw3ZT9c9ZYcRqk4a
 //dk40FWYT3pHtNmYhPRhIS0EHqg0yR4mVIPgibl4aWSxsAvk3HNurvXqil6yDwxOn2J5aLcKx
 k1XwWjNK4eL2aBu5yq+e+oZVFqSIrJGDRa/2cibtnFU0x6Uk+Sp8TDxKWVuO2T1MwvoTNybPrE
 tYtnjUTE/wEozs4fOCoR7gN/QQk/SyvtJSuqgx8mEJ7kQ4RIgGPpjgoNjq0Q9D5hEcUuNStXMx
 Zpo=
X-SBRS: 5.1
X-MesageID: 43304593
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:uho5oKhxtIbXjb6jFFMRaJXZWXBQXwh13DAbvn1ZSRFFG/Gwv9
 yynfgdyB//gCsQXnZlotybJKycWxrnmKJdy4N5B9efdSPhv3alK5wn0Jv6z1TbaknD38N+9Y
 MlSahxD9XsEUN35PyR3CCUG8stqePpzImGnuHbpk0CcShPS4VNqzh0ERyaFEoefngiObMcGI
 CH7sRK4xqMEE5nDfiTPXUOU+jdq9CjrvuPDSIuPBI79BKIyQqh9b+SKXOl9y0DWDBCy6pKyx
 mmryXF4MyY0s2T+1vn+EL4q79Xn9bgzdUrPr3wtuElbg/CpyztSIBoW7iptC04rue1+D8R4a
 XxiiZlBetfwTf8eXy0vAvM1mDboUkTwk6n83C0qz/CptH0Xz0zAcYpv/MmTjLpr3AOkfs59Y
 Aj5RP/i7NnSSnusQ642v3zEzZtrUawqWpKq59ps1VvFbEwRZUUkZYS5ypuYfE9NRO/0q8LOs
 90AvrR4f5HGGnqFUzxjy1UzNugUm9bJGb+fmEy/sic0z1hlHtk1UcvxMsGgnca9J4mIqM0n9
 j5Dg==
X-IronPort-AV: E=Sophos;i="5.82,268,1613451600"; 
   d="scan'208";a="43304593"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DuaWpL0iSEv70wi3RbmsuTh1KHsC1e/2eJti0nxqZLMk0wJSYJa0jduMM2hmQlSP0KkA+090sNXXaYNCc5t748iixUpIffUWwmfYlyB3wBaEGzqg3upQZlf+U/uRkqWKShHkD3e1T45SOJpdQU9ZEdDGxF+dU0BzIUKqFTALMRE23w2wXhjpjdf6qrfzv5oj/vvHOo/H0CIjawMhlfSeIVe6VbO+U96GjL98HFBPPx06dS6/93Bm6K0z4MYC/es5kMuvFC8REhI8yYi/dFzWT4AUKx/Wz6EPzjBKUEJxoI1l/GaOu/6x7lSfC6bgYwr9gVlA/PK3/FvwDrOWu2x8sw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NspLC+R+2PU6t7UpGfybhUhxS/7Lh2pavD59GqGib4U=;
 b=g/IADqZo1IBZSScnjWg3/FncI6RoDSTA76DJ4zFaih6lI609EVIvyadm7LEfARPsXhU3q1ll2L7Uf70PCOdKWrhcFsi/P2cWcNHvSUh2jhHQ9JsdZtqvcHrWDlEUNufe/op9Dg5P+m43FZ+DobL8xziD44f+JjwOtRIzXV1HidZMkGB0r+a88sFN0gaAX1EgQNXtZ3kuOWIY3Y97kG9LBHU6zkUUl+DVhvP972U39UwU1NKuTitITjBVelyVTwTLe77Ml2n1gKhp9rESFRNOnGBLoRJJQ1vMjl2eYpP7U2SgK0QCpBlXWcWx9Unm/b4DO/oySMbC82o+RYJCdKmaBQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NspLC+R+2PU6t7UpGfybhUhxS/7Lh2pavD59GqGib4U=;
 b=eODaDdtWmVOwYURwdXG128fP5L6Ib7EuIfesegZYDVS/+T2rh5hG8XfMfnyyggIjdUgObMGq1WQFSiihyFEQg6Ucb73G2t2OK9gqk2HhDAEZWmkE3+ERwnsSH26Bnxm04fH7lTaBttxS7gLjia1LmFaMOF1TjqNYGR1377vh/5k=
Date: Mon, 3 May 2021 11:28:40 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
	<xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v4 01/12] x86/rtc: drop code related to strict mode
Message-ID: <YI/CSKpqWrilNKi8@Air-de-Roger>
References: <20210420140723.65321-1-roger.pau@citrix.com>
 <20210420140723.65321-2-roger.pau@citrix.com>
 <f282a2a2-e5cb-6a65-690a-b9c27c03089a@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <f282a2a2-e5cb-6a65-690a-b9c27c03089a@suse.com>
X-ClientProxiedBy: PR0P264CA0065.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:100:1d::29) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4f4c64a2-625e-4de5-90cd-08d90e15d9bd
X-MS-TrafficTypeDiagnostic: DM6PR03MB3578:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM6PR03MB357851A98401CB9564A3AAE48F5B9@DM6PR03MB3578.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4714;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: EcMj1CiqLNUJ+5IPkvkLRG2ouIv00kg4GFIqot5HZYFYEb0I0SI8MGEO3R+RtQxG7O7Cu6HQ/vdxbjLJYilF98pjeZr+B1h11v8Gy+kqVFGyBkZfhV+6ZlDnhoSsFKMstD9CTdwbmcnN2jjBVt1/CM09P/PCfS6hKV6dRJQzH3OQGs+z5eVqq1LlnBVJvG6pfWF/dSn1IlPVdtu3ZkI0oJpjEEKRM/DgzEkOCjs60o2lrAh5Ln5U0b21GUgqpRKMokuB/YFThnXQ4hcnYsfSoOtkNzMT74ZERnY0sReq+T+IWf+CRr/OkIIXwY7Ax5P6GAeim00XrXPdSV6XvOH+9B4gYhVliRvmpNX8tFDqpoxi79sBAOZNOrNAad7A/d0HN9M8K2g5KSA1lncdE2Wnv3Lnjy0jjT7POfeYIgx2ly0WsUgqohaF3k4TWQOf06/6a29hiL0lS83E+UZBJ8UwwXE6uEbyuGHoqcwZH8P3QJEUmwt2fPXyQvg753bUsTEF4VzXU4D/xqlz7mH2Gvm2TSvLPpWQaB1GoGpLZ2fLJFdIyWgx8++Sv3dzyXRzswqASFo0GTC9RCNymEnSyM5gvw==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(7916004)(4636009)(376002)(346002)(396003)(136003)(366004)(39850400004)(6486002)(54906003)(66946007)(53546011)(38100700002)(83380400001)(8676002)(66556008)(86362001)(478600001)(186003)(66476007)(956004)(2906002)(6916009)(16526019)(6666004)(26005)(4326008)(6496006)(8936002)(316002)(85182001)(33716001)(9686003)(5660300002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?NlJCWFJKSkdZVXh0TWhmNGptUWxYUEtyVm9BQXRQRXdMc0FmMjJDUmVXMVBx?=
 =?utf-8?B?VUN0N3h0MmFqakNmR25aNTF3cForNmcvcGVvM0VZQ3AyTkcvdWp6bXlGWjNT?=
 =?utf-8?B?VXJWUTRBM2VkUm5mTXd4SlV2L0FPSklpaTl1OVQ1cXIwRzRzNVhTbUM3Y2Z4?=
 =?utf-8?B?NGVISzVxSzZyQ3ZKYWNLUnFqYXZ1T053T3pNTVVvZWxra2t2Zi9OUEprQkZh?=
 =?utf-8?B?VGdSeElBWE5rM3RHTmM4U1RCdE01VmRhRE4ycU9JZkM5V3h1Nzk2Y0I3NFcz?=
 =?utf-8?B?SmcwVStVM2tpS3JiSzRYZ3cveFBSMVZFZ1lJWVRGMk9tZ3dTWGZTbEZiVTRp?=
 =?utf-8?B?YmtjWGxWZHplY0VXSW5wTFgvTFhGRUlNZXh3OXVmZ0U2cjBrcTUrUitHSUNF?=
 =?utf-8?B?ckViZTZhUjlMSnpPYzhobXJvaEZZdTNBYnR0UUxZSTQ3dzI5cXJENkdLOW9l?=
 =?utf-8?B?Z2lZQ0xaSVNsbnFsbGdOR08vRW8xbU8vMVQ1S3lPZlhIRFQvWndNVytPQzNF?=
 =?utf-8?B?RVVtb1ROTXRXK2sxZUNrbjREakdJeDNoektkUTExSTFTVUExL01mUVFaOGho?=
 =?utf-8?B?emhMQitzWUtHcnVFL1NtM3FiWmFNaUk1cHkxNWVNcDJ2MVJwYzBUWTU5dUVw?=
 =?utf-8?B?ZUdFL3paUGpkRDFVb2xUSmVtdG53UmhRUmNEVTNOWjVQa1pkaDhNTzFPMmlT?=
 =?utf-8?B?eGpnMkVVMlR6Wm9oS1RQbVVPanNWczg4OE1Sb1ZsSnlKYi9FSmlpNUlhK3Z2?=
 =?utf-8?B?MHR1bkgyeHB6cVA5UFh1TkpnVXk2L0lpLzllTjl1SGhqQzYvN1pENjNCeWFG?=
 =?utf-8?B?aDRFUEN6QzM3WlZ1WkUwNHZrZ3RXQ2ZsVEUrMHdva2RkU2JqL2pqYTc1NGdM?=
 =?utf-8?B?QVprMVNiby9WU3lOdEp1ck5BZ1pXY25va21qNmhTbFI2TFljbXI4V2tjb2sy?=
 =?utf-8?B?RHBZMzlsVjhUN2RnRXB2QkhSY0ZvczA4eEM1QTgxbU16bXc5V1JxM0g0TzFZ?=
 =?utf-8?B?ZUd3U2dSdWtJeEpHS3JpTXZGbVdwMHlWUjhQTjZVa0MvNEtmRzBjd0JLeW5i?=
 =?utf-8?B?MGQxeVNpNlJMbEJITnZVWnpXVTJyb2c2YWxCalJlbG5aQnhuMFQzTjJSZWhE?=
 =?utf-8?B?TllqRmoza2JjWG04RDR3MElOcmlqdmgwbTA5VWNrQkluSDdUZmRtemJhWnlR?=
 =?utf-8?B?SnR3c2YyZ3JhQmt4c2kvZ2UvaHd4MDlIUjdmSm0zRm9tQVRLOGJZMU5yQ2tr?=
 =?utf-8?B?K0VSQ1RkTGNZTHY2SGl3QjJTRFR0TWRqTEFwRXZqK0tQUUZwNzdiLzNiL3pR?=
 =?utf-8?B?T2MwRzNydmdqYW15S0xaejlSSWIvSUtYdVl5WHJpSmhwYzg3VzJQcXNxbWFF?=
 =?utf-8?B?cTJIbWF6OGFDZEowRWVueEVzRWowUjY2V21ObzZTajZQSGNvbFRRbG1uRkMx?=
 =?utf-8?B?TGl2bU1UeDV6QTduMXFVRlZ1a3VseU9iOVI5b1l5YzJLcUpaanp1eFMzbVNO?=
 =?utf-8?B?TTFNaXYxbUovY2FBLzdLSHBvd0orRmVFN2tiNW9iK1hYOWlMbytXLzZ0SjZS?=
 =?utf-8?B?d2ZRbGtNVVJyNHU1TXpPaC95U2lQaWwvZklEb2NMSmg1c3c4WjladFVRTmRZ?=
 =?utf-8?B?eHVuc0doTTN0NklPRHdQeEQ5N1pBWG55TUxNYWI4OWU3MlNVeTg0Z0kvSTBz?=
 =?utf-8?B?UEcrMDBqUmhJRlNvNkluN2o5Wk9IK2FJYkxFWXZFZWFHdGVSanhwcWhFRGVX?=
 =?utf-8?Q?5YXmXpRyXKdhXkjnUGfrZFjcRU4ryDtee+CmX8S?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 4f4c64a2-625e-4de5-90cd-08d90e15d9bd
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 May 2021 09:28:46.2107
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZDkW5Te+YS6/FmUMjB4ORLi6am50Ns8xgaAYf1EcJLq4I9FCsFwMH04RvqcH8CsEYLU3Zyex+Y1C24eiuowViA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB3578
X-OriginatorOrg: citrix.com

On Thu, Apr 29, 2021 at 04:53:07PM +0200, Jan Beulich wrote:
> On 20.04.2021 16:07, Roger Pau Monne wrote:
> > --- a/xen/arch/x86/hvm/rtc.c
> > +++ b/xen/arch/x86/hvm/rtc.c
> > @@ -46,15 +46,6 @@
> >  #define epoch_year     1900
> >  #define get_year(x)    (x + epoch_year)
> >  
> > -enum rtc_mode {
> > -   rtc_mode_no_ack,
> > -   rtc_mode_strict
> > -};
> > -
> > -/* This must be in sync with how hvmloader sets the ACPI WAET flags. */
> > -#define mode_is(d, m) ((void)(d), rtc_mode_##m == rtc_mode_no_ack)
> > -#define rtc_mode_is(s, m) mode_is(vrtc_domain(s), m)
> 
> Leaving aside my concerns about this removal, I think some form of
> reference to hvmloader and its respective behavior should remain
> here, presumably in form of a (replacement) comment.

What about adding a comment in rtc_pf_callback:

/*
 * The current RTC implementation will inject an interrupt regardless
 * of whether REG_C has been read since the last interrupt was
 * injected. This is why the ACPI WAET 'RTC good' flag must be
 * unconditionally set by hvmloader.
 */

> > @@ -337,8 +336,7 @@ int pt_update_irq(struct vcpu *v)
> >      {
> >          if ( pt->pending_intr_nr )
> >          {
> > -            /* RTC code takes care of disabling the timer itself. */
> > -            if ( (pt->irq != RTC_IRQ || !pt->priv) && pt_irq_masked(pt) &&
> > +            if ( pt_irq_masked(pt) &&
> >                   /* Level interrupts should be asserted even if masked. */
> >                   !pt->level )
> >              {
> 
> I'm struggling to relate this to any other part of the patch. In
> particular I can't find the case where a periodic timer would be
> registered with RTC_IRQ and a NULL private pointer. The only use
> I can find is with a non-NULL pointer, which would mean the "else"
> path is always taken at present for the RTC case (which you now
> change).

Right, the else case was always taken because as the comment noted RTC
would take care of disabling itself (by calling destroy_periodic_time
from the callback when using strict_mode). When no_ack mode was
implemented this wasn't taken into account AFAICT, and thus the RTC
was never removed from the list even when masked.

I think with no_ack mode the RTC shouldn't have this specific handling
in pt_update_irq, as it should behave like any other virtual timer.
I could try to split this as a separate bugfix, but then I would have
to teach pt_update_irq to differentiate between strict_mode and no_ack
mode.

Would you be fine if the following is added to the commit message
instead:

"Note that the special handling of the RTC timer done in pt_update_irq
is wrong for the no_ack mode, as the RTC timer callback won't disable
the timer anymore when it detects the guest is not reading REG_C. As
such remove the code as part of the removal of strict_mode, and don't
special case the RTC timer anymore in pt_update_irq."

Thanks, Roger.

