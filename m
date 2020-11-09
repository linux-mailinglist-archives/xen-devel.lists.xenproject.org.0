Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 59C612ABAEB
	for <lists+xen-devel@lfdr.de>; Mon,  9 Nov 2020 14:25:27 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.22565.48941 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kc7AJ-0008Ec-1L; Mon, 09 Nov 2020 13:24:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 22565.48941; Mon, 09 Nov 2020 13:24:59 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kc7AI-0008EG-UG; Mon, 09 Nov 2020 13:24:58 +0000
Received: by outflank-mailman (input) for mailman id 22565;
 Mon, 09 Nov 2020 13:24:57 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=caUz=EP=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1kc7AH-0008E9-6O
 for xen-devel@lists.xenproject.org; Mon, 09 Nov 2020 13:24:57 +0000
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 7bd53ffd-6d33-413b-a7f2-a60cf05eec33;
 Mon, 09 Nov 2020 13:24:55 +0000 (UTC)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=caUz=EP=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
	id 1kc7AH-0008E9-6O
	for xen-devel@lists.xenproject.org; Mon, 09 Nov 2020 13:24:57 +0000
X-Inumbo-ID: 7bd53ffd-6d33-413b-a7f2-a60cf05eec33
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id 7bd53ffd-6d33-413b-a7f2-a60cf05eec33;
	Mon, 09 Nov 2020 13:24:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1604928295;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=mxx0fLOA0uXdvrCL1KCXe5MIQGok5t7yZxpb49blu+k=;
  b=Gz4GukSmjgljcIKJWljrQP+4F6FDui+5QmRaDxTgc0mgkGHF9q40Yg9d
   mD6jWtpk9gEP5dwYY2SLvBG8OW/nJkgajZFXSUVlfBfxMo/riXxtBXS6Z
   tH0COklG2aJatfSHZnkS4QlOio6oS5M04F7CScT5fpgOzrNUCn4f2pe4M
   Y=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: N1S5wNWIcahSkRSRiCn/eK/QO1S8f+saEtpl1JuIhiF21FEWe4hVpFPQLjc3BEZzQiUWZH8YIx
 vSP1TCYxUz8k6atWCJVve3yrMHhn30w0QAxEiyrRWjTAfdX4uv0WMbnxo5kE2/Z3TGX3gj7T6v
 IeKpHuzgsAG4YrcQR9atcHaPgRNCAwPqH/gdqr147qVSgdEorUxNwzpjJKpCro1cZk4VBX3yZ+
 J8jzSnnUaYEfpK7dbBXRpmCI4QFZdY2c+vwt1mEklxTYSxWqh+x8qLGBjWKWuXR2pcko/dqia3
 flo=
X-SBRS: None
X-MesageID: 30754426
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.77,463,1596513600"; 
   d="scan'208";a="30754426"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gkzvC8YAG8M8LhI96Bfw3EaYc0nSrpkiY6ZHI2kUiJXAXXvtUVIgqYlsbsK9CfZP8Hcbcw6kA/MzDLekADJfPLJRSlVrgFs6w884RCRy2tZM3ETN6F8WOtQYV/dFh5O/RFgK3SHEwLtxcsjHQX1El0ifhCNtkCMykqGPsfqHWGy2oBUoHExoHOGEWXz+GWvOgHkjskUxusIaZyy8lPEh5gmdzQR+2JKTGNcB7Dg0nb6Ta07s4Z5zwb/ezSu8K6bxnsdI7QmbOmZXPLzSLBn4TRlaAt2cjin++V1KX4/t+4bGrkFofltiJKhU0oGALkC4+CWJzzK+2m7aXUL1F0w4hQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bRvQ7DYZZl9FUqe+EmSipHERghk/4Z1blarS5+Y0UCI=;
 b=K9m1VQSm+DSZTLv10D1lw3APUZMaI3KRkng3ar0XwsqlojCFh7nVNpWxikrhfvDYu3kMpWKq7NlNNRN8TRFUS1gp4mRvpvO60pcC6loYncpBnJOOFa3YcE3dSct/Y3L40PyjSaxUkytGhnhTR3E2NohQSlYDr/oc6PfjOnZc2+UcLqM9wgau7BBfH4py6aUKddOnhtPeJJ5BcPXbL78J5I2/kHHVrMDA85gIcRmzYWwYpq4+CD1u0tdMWHRQ38E90HNzvhTLAnMSb8TRtCmzB6niE48qoDyaK/4AUoXP1yMjq3sDSH2bwmB6V6bw3lISzbHEqRcNvZTFqrX8GPt1bg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bRvQ7DYZZl9FUqe+EmSipHERghk/4Z1blarS5+Y0UCI=;
 b=DFMHKozHkGcmWzA/tl3WnWDgMJcH8XRSHsyWbABvxpULqAmWexo+raUxQ37wMKuDZTZKIETY9gME8OgoQok8LovBryl9dVJNH7tU6efo/D1HeKzt/gMjVHPzZ9dxPMjPKGbbWSpltvQaqvoKBbvKxFho3R4wBMWQnQKgdXkpjvE=
Date: Mon, 9 Nov 2020 14:21:45 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
CC: <xen-devel@lists.xenproject.org>, Jan Beulich <jbeulich@suse.com>, Wei Liu
	<wl@xen.org>, George Dunlap <george.dunlap@citrix.com>, Ian Jackson
	<iwj@xenproject.org>, Julien Grall <julien@xen.org>, Stefano Stabellini
	<sstabellini@kernel.org>
Subject: Re: [PATCH] x86/msr: fix handling of MSR_IA32_PERF_{STATUS/CTL}
Message-ID: <20201109132145.lwjh3i6msx3ltxlw@Air-de-Roger>
References: <20201006162327.93055-1-roger.pau@citrix.com>
 <a98d6cb1-0b1d-8fb8-8718-c65e02e448bb@citrix.com>
 <20201007164117.GH19254@Air-de-Roger> <20201015133412.GC68032@Air-de-Roger>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20201015133412.GC68032@Air-de-Roger>
X-ClientProxiedBy: LO2P265CA0509.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:13b::16) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c54fae49-a572-4876-36f4-08d884b26b45
X-MS-TrafficTypeDiagnostic: DM5PR03MB2841:
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM5PR03MB2841A3A1C6B98A1109AE3F198FEA0@DM5PR03MB2841.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Rl8ixv5OUerlvOY7fJQZnVQtiDap11yOQmD2Wsh3pPaA/BCKC9aHKvaUEpndwh6qKXD72H4NNNo6gqXH0wbBdGttGcZLTNdLKiCQOrjzC6GuCjBJYQpZm3PQ0qnvXOp2+gTgHSAZP3ZVh9wTH6ZkVOWYRDBm+YVB7RO0k5R2+v9z7ecchjjU0YzsG7jNZOzTiwcXvACgOXyY5LvsB7GMk94+htVErxZ9PB/ACrYfVoVcIPqOf/JTVGBoYkH0xAsMcmtZpS18Tkez/KGGlFihZ/mFEyla1Opb7o8wxiw70lm9fphBMjxYJpPKYuchdgJgrKp8D6H12X0H0Vr9mg3fVE73dsjL9itYP9A5GFSTaiNt78TSXjfDiHevh3c92yfa4AJM3lC6nY/hKAmuf3ICTw==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(7916004)(136003)(39860400002)(376002)(366004)(346002)(396003)(4326008)(8936002)(956004)(6862004)(6496006)(2906002)(6666004)(33716001)(9686003)(16526019)(316002)(54906003)(26005)(186003)(86362001)(5660300002)(66476007)(6486002)(478600001)(1076003)(6636002)(966005)(85182001)(8676002)(83380400001)(66946007)(66556008)(53546011);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: vpR1D0D5ZJ1qCtf5X9bg3S2sgu8PvTZgXIPPsBDrSIg6Lg3qAZP1RPEek8d/98PI9NnMMcKHTSvSwsx4oD9unRiiG4sCyhEhe+FxKAzbT+Bn/UoFMTHEi5rn2wRfqx1VW0Ke4VJyokltwcQK/XP7MIbH9SOsdgPt6kW6CtLXi61EZX4XVIoCBto7coS94VPyc9Hlji/pmGSu3Xk1Ty01HPComLwj65dOAj+ThSv+/rMCwsukF/PJTzQrAPDh8uoXsYPHdMAxzfE9hj9CTpq/4PiAz96vGXUcTrjTxEWL4FsO5EWnUTgF067pCf4MxJFd4aflxwCsYifklPb9W0HCIu8itpcTj6YQdckZu1wjzsmrG4q2YzWn/D/Zg/Dt+J6rfTtZR4wFAxiqr2C33Qk7syZG0yaW7eSMDZCtjQvaOxKsBqE0vpu94yCS5wH9+8DFsjIWDF0/hrKw8DreOKYkzTD2d9euS1gK/l4WuepPeOVR466GvxuU87zOoIExGDoO4MWc48SWXaY8knhhLHjv8ewsdqfrWKroPoFIeNAyvszpxbQLu1gMcr/F7uE4MybH4SD0MZLR27dl4phamx8g6OxzKcW7R1ag5WjMT5dmYfuA4g0qoxgOnqjhl6DaTRuRPzLdHx3bkkCvLEIuPBgGzA==
X-MS-Exchange-CrossTenant-Network-Message-Id: c54fae49-a572-4876-36f4-08d884b26b45
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Nov 2020 13:21:51.4376
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LLJ6f+mD6Wsb+ddQalY8M5XakbWfIRFOKX5QYRH2MW8j0UCsW9e2bhZCIxyQctXCO+j2jPjChc4n/HtahNLzBg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR03MB2841
X-OriginatorOrg: citrix.com

Ping?

On Thu, Oct 15, 2020 at 03:34:12PM +0200, Roger Pau Monné wrote:
> On Wed, Oct 07, 2020 at 06:41:17PM +0200, Roger Pau Monné wrote:
> > On Wed, Oct 07, 2020 at 01:06:08PM +0100, Andrew Cooper wrote:
> > > On 06/10/2020 17:23, Roger Pau Monne wrote:
> > > > Currently a PV hardware domain can also be given control over the CPU
> > > > frequency, and such guest is allowed to write to MSR_IA32_PERF_CTL.
> > > 
> > > This might be how the current logic "works", but its straight up broken.
> > > 
> > > PERF_CTL is thread scope, so unless dom0 is identity pinned and has one
> > > vcpu for every pcpu, it cannot use the interface correctly.
> > 
> > Selecting cpufreq=dom0-kernel will force vCPU pinning. I'm not able
> > however to see anywhere that would force dom0 vCPUs == pCPUs.
> > 
> > > > However since commit 322ec7c89f6 the default behavior has been changed
> > > > to reject accesses to not explicitly handled MSRs, preventing PV
> > > > guests that manage CPU frequency from reading
> > > > MSR_IA32_PERF_{STATUS/CTL}.
> > > >
> > > > Additionally some HVM guests (Windows at least) will attempt to read
> > > > MSR_IA32_PERF_CTL and will panic if given back a #GP fault:
> > > >
> > > > vmx.c:3035:d8v0 RDMSR 0x00000199 unimplemented
> > > > d8v0 VIRIDIAN CRASH: 3b c0000096 fffff806871c1651 ffffda0253683720 0
> > > >
> > > > Move the handling of MSR_IA32_PERF_{STATUS/CTL} to the common MSR
> > > > handling shared between HVM and PV guests, and add an explicit case
> > > > for reads to MSR_IA32_PERF_{STATUS/CTL}.
> > > 
> > > OTOH, PERF_CTL does have a seemingly architectural "please disable turbo
> > > for me" bit, which is supposed to be for calibration loops.  I wonder if
> > > anyone uses this, and whether we ought to honour it (probably not).
> > 
> > If we let guests play with this we would have to save/restore the
> > guest value on context switch. Unless there's a strong case for this,
> > I would say no.
> > 
> > > > diff --git a/xen/include/xen/sched.h b/xen/include/xen/sched.h
> > > > index d8ed83f869..41baa3b7a1 100644
> > > > --- a/xen/include/xen/sched.h
> > > > +++ b/xen/include/xen/sched.h
> > > > @@ -1069,6 +1069,12 @@ extern enum cpufreq_controller {
> > > >      FREQCTL_none, FREQCTL_dom0_kernel, FREQCTL_xen
> > > >  } cpufreq_controller;
> > > >  
> > > > +static inline bool is_cpufreq_controller(const struct domain *d)
> > > > +{
> > > > +    return ((cpufreq_controller == FREQCTL_dom0_kernel) &&
> > > > +            is_hardware_domain(d));
> > > 
> > > This won't compile on !CONFIG_X86, due to CONFIG_HAS_CPUFREQ
> > 
> > It does seem to build on Arm, because this is only used in x86 code:
> > 
> > https://gitlab.com/xen-project/people/royger/xen/-/jobs/778207412
> > 
> > The extern declaration of cpufreq_controller is just above, so if you
> > tried to use is_cpufreq_controller on Arm you would get a link time
> > error, otherwise it builds fine. The compiler removes the function on
> > Arm as it has the inline attribute and it's not used.
> > 
> > Alternatively I could look into moving cpufreq_controller (and
> > is_cpufreq_controller) out of sched.h into somewhere else, I haven't
> > looked at why it needs to live there.
> > 
> > > Honestly - I don't see any point to this code.  Its opt-in via the
> > > command line only, and doesn't provide adequate checks for enablement. 
> > > (It's not as if we're lacking complexity or moving parts when it comes
> > > to power/frequency management).
> > 
> > Right, I could do a pre-patch to remove this, but I also don't think
> > we should block this fix on removing FREQCTL_dom0_kernel, so I would
> > rather fix the regression and then remove the feature if we agree it
> > can be removed.
> 
> Can we get some consensus on what to do next?
> 
> I think I've provided replies to all the points above, and I'm not sure
> what do to next in order to proceed with this patch.
> 
> Thanks, Roger.
> 

