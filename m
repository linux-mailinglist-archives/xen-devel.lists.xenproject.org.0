Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3761133991F
	for <lists+xen-devel@lfdr.de>; Fri, 12 Mar 2021 22:34:37 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.97359.184940 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lKpPa-0004Po-E7; Fri, 12 Mar 2021 21:33:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 97359.184940; Fri, 12 Mar 2021 21:33:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lKpPa-0004PP-As; Fri, 12 Mar 2021 21:33:34 +0000
Received: by outflank-mailman (input) for mailman id 97359;
 Fri, 12 Mar 2021 21:33:33 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=arNz=IK=zededa.com=roman@srs-us1.protection.inumbo.net>)
 id 1lKpPZ-0004PK-2S
 for xen-devel@lists.xenproject.org; Fri, 12 Mar 2021 21:33:33 +0000
Received: from mail-qt1-x829.google.com (unknown [2607:f8b0:4864:20::829])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id b13f16f5-680d-4955-9582-8100ca4f8f57;
 Fri, 12 Mar 2021 21:33:31 +0000 (UTC)
Received: by mail-qt1-x829.google.com with SMTP id s2so4978993qtx.10
 for <xen-devel@lists.xenproject.org>; Fri, 12 Mar 2021 13:33:31 -0800 (PST)
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
X-Inumbo-ID: b13f16f5-680d-4955-9582-8100ca4f8f57
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=zededa.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=BM3TgQ5bmQYp6+zaKTHpy/qR/6BDMxW0IXigCdZourc=;
        b=TbS5J14MfX6lOhRKTRptFj8VbuGZyEyu91j2dfMkbgMPwFYn16Wa4A4LXjg4MC1mXO
         xTTGqpsGMNJ20aUm23b8bBvd0oYzxDZK0qFPd6N7SYFMC6bLc4ScOD3TuzkkCKal0YT/
         q1U1EPb1xBlzQvRLHbyWvgxvFNXZFHYPmOeI7QzB2eUWtTShPZQ1yK08+YEP9wMVOa4V
         RoAwUtkj3oofs7JpX8lFTyuoscslmjf7GMlAdhzGnggzAvAcAqgMNhG2jG2V+hMpcVc5
         4K8C7kE5avWclmrp4i+Nqcghnt6m28Gi3l+wOQrYvPc0Drb4/GjXygA8ahcfAcHMu2nh
         vLPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=BM3TgQ5bmQYp6+zaKTHpy/qR/6BDMxW0IXigCdZourc=;
        b=IF8gbhafuPYgQAXFOS4FVywyfJXRlqzOwvNsAAKl0nGVzNGQz5XTk9brhzuDYXcw4E
         GHeOprsULoksjKSRul9ZpdscPhsu2J06gZ+yOs1o3ARzWAWXKerqPy1mg1fOsfxr4xSb
         +xqs6pnQblI9i8HJKMbcw22nQZUu4i3dL4EVlVJFgh5jQoEzGZHVKawd+YxFnCnC60v/
         YsxEzxgwaYEITD/r6oLfqiHsrWryDcfR/r0kYS0cDPsk4oPX8Rs/tO0kpGckG9NK+wII
         ywr0/kdn4o4L8b6wvq3l8WCLd+WOBGgZfBFMeS6qnv3QiP8vKAKAbWPmEEZ71XbobAut
         3ayw==
X-Gm-Message-State: AOAM530/LzuaLYJ85QYOTY1zcy8ChML9OBWYM/OwtiL5qL5oyN0RJGAx
	iHu4e50ARHGiGo8zc2x7+b7zMW1iZ+Wdo8GaoT4B6Q==
X-Google-Smtp-Source: ABdhPJwAMciMM96AwaEKkCvGawTDOs/HneURHRPx8MPDNE8HehMQwbwCbeYnYXy2as5mmVirM7vEPXTmZeEX/WdXL30=
X-Received: by 2002:ac8:1403:: with SMTP id k3mr13947354qtj.266.1615584811461;
 Fri, 12 Mar 2021 13:33:31 -0800 (PST)
MIME-Version: 1.0
References: <CAMmSBy-_UOK6DTrwGNOw8Y59Muv8H8wxmsc4-BXcv3N_u5USBA@mail.gmail.com>
 <alpine.DEB.2.21.2102161232310.3234@sstabellini-ThinkPad-T480s>
 <45b8ef4c-6d36-e91b-ca1a-a82eeca5aaf5@suse.com> <CAMmSBy8k0Y50Xkq9Kq+oES27gsoG==T++Hz9SiR0gDgAKnpvRA@mail.gmail.com>
 <49344e8d-5518-68c6-a417-68522a915e72@suse.com> <CAMmSBy-3y+Y3nhyf1uGN6KB_wNLVAqYRfc0hpkdKHtvdGSM5wg@mail.gmail.com>
 <b6b694f6-61ed-c0b7-5980-88ddb5e1616c@suse.com> <CAMmSBy8pSZROdPo+gee8oxrU9EL=k+QTJj0UxZTi3Bh+S_g2_w@mail.gmail.com>
In-Reply-To: <CAMmSBy8pSZROdPo+gee8oxrU9EL=k+QTJj0UxZTi3Bh+S_g2_w@mail.gmail.com>
From: Roman Shaposhnik <roman@zededa.com>
Date: Fri, 12 Mar 2021 13:33:20 -0800
Message-ID: <CAMmSBy_0zCa1D5dpw4VFAcJwSiE6RAQoBk5vAJzW1ZPk5Zaxww@mail.gmail.com>
Subject: Re: Linux DomU freezes and dies under heavy memory shuffling
To: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Xen-devel <xen-devel@lists.xenproject.org>, 
	Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>, 
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, Wei Liu <wl@xen.org>, 
	George Dunlap <george.dunlap@citrix.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi J=C3=BCrgen,

just wanted to give you (and everyone who may be keeping an eye on
this) an update.

Somehow, after applying your kernel patch -- the VM is now running 10
days+ without a problem.

I'll keep experimenting (A/B-testing style) but at this point I'm
actually pretty perplexed as to why this patch would make a difference
(since it is basically just for observability). Any thoughts on that?

Thanks,
Roman.

On Wed, Feb 24, 2021 at 7:06 PM Roman Shaposhnik <roman@zededa.com> wrote:
>
> Hi J=C3=BCrgen!
>
> sorry for the belated reply -- I wanted to externalize the VM before I
> do -- but let me at least reply to you:
>
> On Tue, Feb 23, 2021 at 5:17 AM J=C3=BCrgen Gro=C3=9F <jgross@suse.com> w=
rote:
> >
> > On 18.02.21 06:21, Roman Shaposhnik wrote:
> > > On Wed, Feb 17, 2021 at 12:29 AM J=C3=BCrgen Gro=C3=9F <jgross@suse.c=
om
> > > <mailto:jgross@suse.com>> wrote:
> > >
> > >     On 17.02.21 09:12, Roman Shaposhnik wrote:
> > >      > Hi J=C3=BCrgen, thanks for taking a look at this. A few commen=
ts below:
> > >      >
> > >      > On Tue, Feb 16, 2021 at 10:47 PM J=C3=BCrgen Gro=C3=9F <jgross=
@suse.com
> > >     <mailto:jgross@suse.com>> wrote:
> > >      >>
> > >      >> On 16.02.21 21:34, Stefano Stabellini wrote:
> > >      >>> + x86 maintainers
> > >      >>>
> > >      >>> It looks like the tlbflush is getting stuck?
> > >      >>
> > >      >> I have seen this case multiple times on customer systems now,=
 but
> > >      >> reproducing it reliably seems to be very hard.
> > >      >
> > >      > It is reliably reproducible under my workload but it take a lo=
ng time
> > >      > (~3 days of the workload running in the lab).
> > >
> > >     This is by far the best reproduction rate I have seen up to now.
> > >
> > >     The next best reproducer seems to be a huge installation with sev=
eral
> > >     hundred hosts and thousands of VMs with about 1 crash each week.
> > >
> > >      >
> > >      >> I suspected fifo events to be blamed, but just yesterday I've=
 been
> > >      >> informed of another case with fifo events disabled in the gue=
st.
> > >      >>
> > >      >> One common pattern seems to be that up to now I have seen thi=
s
> > >     effect
> > >      >> only on systems with Intel Gold cpus. Can it be confirmed to =
be true
> > >      >> in this case, too?
> > >      >
> > >      > I am pretty sure mine isn't -- I can get you full CPU specs if
> > >     that's useful.
> > >
> > >     Just the output of "grep model /proc/cpuinfo" should be enough.
> > >
> > >
> > > processor: 3
> > > vendor_id: GenuineIntel
> > > cpu family: 6
> > > model: 77
> > > model name: Intel(R) Atom(TM) CPU  C2550  @ 2.40GHz
> > > stepping: 8
> > > microcode: 0x12d
> > > cpu MHz: 1200.070
> > > cache size: 1024 KB
> > > physical id: 0
> > > siblings: 4
> > > core id: 3
> > > cpu cores: 4
> > > apicid: 6
> > > initial apicid: 6
> > > fpu: yes
> > > fpu_exception: yes
> > > cpuid level: 11
> > > wp: yes
> > > flags: fpu vme de pse tsc msr pae mce cx8 apic sep mtrr pge mca cmov =
pat
> > > pse36 clflush dts acpi mmx fxsr sse sse2 ss ht tm pbe syscall nx rdts=
cp
> > > lm constant_tsc arch_perfmon pebs bts rep_good nopl xtopology
> > > nonstop_tsc cpuid aperfmperf pni pclmulqdq dtes64 monitor ds_cpl vmx =
est
> > > tm2 ssse3 cx16 xtpr pdcm sse4_1 sse4_2 movbe popcnt tsc_deadline_time=
r
> > > aes rdrand lahf_lm 3dnowprefetch cpuid_fault epb pti ibrs ibpb stibp
> > > tpr_shadow vnmi flexpriority ept vpid tsc_adjust smep erms dtherm ida
> > > arat md_clear
> > > vmx flags: vnmi preemption_timer invvpid ept_x_only flexpriority
> > > tsc_offset vtpr mtf vapic ept vpid unrestricted_guest
> > > bugs: cpu_meltdown spectre_v1 spectre_v2 mds msbds_only
> > > bogomips: 4800.19
> > > clflush size: 64
> > > cache_alignment: 64
> > > address sizes: 36 bits physical, 48 bits virtual
> > > power management:
> > >
> > >      >
> > >      >> In case anybody has a reproducer (either in a guest or dom0) =
with a
> > >      >> setup where a diagnostic kernel can be used, I'd be _very_
> > >     interested!
> > >      >
> > >      > I can easily add things to Dom0 and DomU. Whether that will
> > >     disrupt the
> > >      > experiment is, of course, another matter. Still please let me
> > >     know what
> > >      > would be helpful to do.
> > >
> > >     Is there a chance to switch to an upstream kernel in the guest? I=
'd like
> > >     to add some diagnostic code to the kernel and creating the patche=
s will
> > >     be easier this way.
> > >
> > >
> > > That's a bit tough -- the VM is based on stock Ubuntu and if I upgrad=
e
> > > the kernel I'll have fiddle with a lot things to make workload
> > > functional again.
> > >
> > > However, I can install debug kernel (from Ubuntu, etc. etc.)
> > >
> > > Of course, if patching the kernel is the only way to make progress --
> > > lets try that -- please let me know.
> >
> > I have found a nice upstream patch, which - with some modifications - I
> > plan to give our customer as a workaround.
> >
> > The patch is for kernel 4.12, but chances are good it will apply to a
> > 4.15 kernel, too.
>
> I'm slightly confused about this patch -- it seems to me that it needs
> to be applied to the guest kernel, correct?
>
> If that's the case -- the challenge I have is that I need to re-build
> the Canonical (Ubuntu) distro kernel with this patch -- this seems
> a bit daunting at first (I mean -- I'm pretty good at rebuilding kernels
> I just never do it with the vendor ones ;-)).
>
> So... if there's anyone here who has any suggestions on how to do that
> -- I'd appreciate pointers.
>
> > I have been able to gather some more data.
> >
> > I have contacted the author of the upstream kernel patch I've been usin=
g
> > for our customer (and that helped, by the way).
> >
> > It seems as if the problem is occurring when running as a guest at leas=
t
> > under Xen, KVM, and VMWare, and there have been reports of bare metal
> > cases, too. Hunting this bug is going on for several years now, the
> > patch author is at it since 8 months.
> >
> > So we can rule out a Xen problem.
> >
> > Finding the root cause is still important, of course, and your setup
> > seems to have the best reproduction rate up to now.
> >
> > So any help would really be appreciated.
> >
> > Is the VM self contained? Would it be possible to start it e.g. on a
> > test system on my side? If yes, would you be allowed to pass it on to
> > me?
>
> I'm working on externalizing the VM in a way that doesn't disclose anythi=
ng
> about the customer workload. I'm almost there -- sans my question about
> the vendor kernel rebuild. I plan to make that VM available this week.
>
> Goes without saying, but I would really appreciate your help in chasing t=
his.
>
> Thanks,
> Roman.

