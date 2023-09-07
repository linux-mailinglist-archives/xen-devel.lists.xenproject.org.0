Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 432AE796DF1
	for <lists+xen-devel@lfdr.de>; Thu,  7 Sep 2023 02:17:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.596951.931096 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qe2ha-0004hb-9M; Thu, 07 Sep 2023 00:16:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 596951.931096; Thu, 07 Sep 2023 00:16:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qe2ha-0004fc-6d; Thu, 07 Sep 2023 00:16:54 +0000
Received: by outflank-mailman (input) for mailman id 596951;
 Thu, 07 Sep 2023 00:16:52 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Shnx=EX=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1qe2hY-0004fW-13
 for xen-devel@lists.xenproject.org; Thu, 07 Sep 2023 00:16:52 +0000
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d5dc81cc-4d13-11ee-8783-cb3800f73035;
 Thu, 07 Sep 2023 02:16:50 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by sin.source.kernel.org (Postfix) with ESMTPS id C792ECE1882;
 Thu,  7 Sep 2023 00:16:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E3856C433C8;
 Thu,  7 Sep 2023 00:16:41 +0000 (UTC)
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
X-Inumbo-ID: d5dc81cc-4d13-11ee-8783-cb3800f73035
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1694045803;
	bh=iLnw5mJcn1WfYAopavmCTmmE0hja1B3QlmUJi51U1Eg=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=TINQ1J1iIc3A5JB9rMuf3GeMgZGcIs0RBYt1NJqtIyW6coyureKyn4A5hQ4op52OQ
	 jE2mTuYnRdHSiaxhnhG1o6bFLhuHt+jkFAlSat21m5yoJJji98Kyl7RUq/exoLdskw
	 775QOA6vLjxnh4fiAxmBD99QpdIhUJIpJigghBbfsQmGUy2ZWFPI03ozwi5ZDFzm9O
	 rsyH7gdlX4ZWgN6R7ts3UlOwcojaCuqK8Cg55199XfzH6IR+rNnofAptA+xLSQTJGA
	 ENE2fMQPcEYmnyn9x7ucXocX6NQVhpY46ryxjSr6akFFXsOaTxiEBHz8mM0Tpu4kUW
	 lefsib2o35pYA==
Date: Wed, 6 Sep 2023 17:16:40 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Anthony Chan <anthonychan@nureva.com>
cc: Stefano Stabellini <sstabellini@kernel.org>, 
    "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, 
    "bertrand.marquis@arm.com" <bertrand.marquis@arm.com>, 
    "julien@xen.org" <julien@xen.org>, 
    "Volodymyr_Babchuk@epam.com" <Volodymyr_Babchuk@epam.com>, 
    "michal.orzel@amd.com" <michal.orzel@amd.com>, 
    Dan Waqar <danwaqar@nureva.com>
Subject: RE: [EXT] Re: xen arm64 low power sleep support
In-Reply-To: <DM6PR20MB2779A22E8CA641F0B2BBF038C1EFA@DM6PR20MB2779.namprd20.prod.outlook.com>
Message-ID: <alpine.DEB.2.22.394.2309061629460.6458@ubuntu-linux-20-04-desktop>
References: <DM6PR20MB277971712E5415CB231AEB37C1E7A@DM6PR20MB2779.namprd20.prod.outlook.com> <alpine.DEB.2.22.394.2308291512271.6458@ubuntu-linux-20-04-desktop> <DM6PR20MB27795F4B6C327F7F031BABB0C1E6A@DM6PR20MB2779.namprd20.prod.outlook.com>
 <alpine.DEB.2.22.394.2308301814580.6458@ubuntu-linux-20-04-desktop> <DM6PR20MB2779E6DD63DC5CC9A1FE161AC1E5A@DM6PR20MB2779.namprd20.prod.outlook.com> <alpine.DEB.2.22.394.2309051848590.6458@ubuntu-linux-20-04-desktop>
 <DM6PR20MB2779A22E8CA641F0B2BBF038C1EFA@DM6PR20MB2779.namprd20.prod.outlook.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-1637671299-1694045802=:6458"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-1637671299-1694045802=:6458
Content-Type: text/plain; charset=US-ASCII

On Wed, 6 Sep 2023, Anthony Chan wrote:
> On Tue, 05 Sep 2023, Stefano Stabellini wrote:
> > On Thu, 31 Aug 2023, Anthony Chan wrote:
> > > On Thu, 30 Aug 2023, Stefano Stabellini wrote:
> > > > On Wed, 30 Aug 2023, Anthony Chan wrote:
> > > > > On Tue, 29 Aug 2023, Stefano Stabellini wrote:
> > > > > > On Tue, 29 Aug 2023, Anthony Chan wrote:
> > > > > > > Hi all,
> > > > > > >
> > > > > > > My name is Tony and I've been researching/developing using
> > > > > > > Xen for potential upcoming uses in our embedded systems.  I
> > > > > > > started with Xen using Xilinx tools about a year ago and
> > > > > > > still have lots to learn about what it can to do in the
> > > > > > > embedded space.  So far, I've managed to integrate Xen and
> > > > > > > Linux into an existing product that exclusively runs
> > > > > > > bare-metal code on a ZynqMP SoC and migrate some of the
> > > > > > > functionality into custom Linux driver/userspace.
> > > > > > >
> > > > > > > I'm now looking at low power support, for now at least
> > > > > > > between Xen
> > > > > > > (4.16) and Linux (5.15) dom0.  I've tried a few different
> > > > > > > Linux kernel configs around power management and each time I
> > > > > > > try to suspend from linux dom0 (via sysfs or systemctl), Xen
> > > > > > > will watchdog on dom0 guest.
> > > > > > > AFAIK, Xen should trap on a 'WFI' from guests, but from what
> > > > > > > I can tell debugging through the linux suspend process is
> > > > > > > it's spinning in a 'suspend- to-idle' loop before it can get
> > > > > > > to issuing a 'WFI' or using PSCI interface to notify Xen.
> > > > > > > I'm beginning to suspect that 'low power' support for embedded
> > > > > > > arm64 just isn't quite there yet, or am I missing something
> > > > > > > in the configs?
> > > > > > >
> > > > > > > I realize this could very well be a Linux 'issue' but
> > > > > > > checking here first.  I know Xen presents a flattened device
> > > > > > > tree to Linux without CPU idle-state nodes and maybe this is
> > > > > > > causing the linux guest to only do the suspend- to-idle
> > > > > > > mode?  I should mention that I'm booting up using dom0less
> > > > > > > feature if that matters.
> > > > > >
> > > > > >
> > > > > > Hi Anthony,
> > > > > >
> > > > > > Assuming you are using the default Xen command line parameters
> > > > > > for Xilinx boards: sched=null vwfi=native, then if the guest
> > > > > > uses WFI, the CPU will execute WFI directly and go into low
> > > > > > power mode.
> > > > > Yes, using these command line params.
> > > > >
> > > > > > Given the issue you are describing, I am suspecting the guest
> > > > > > is not issuing
> > > > > > WFI: that is simple and known to work. Instead, I suspect that
> > > > > > Linux might be trying to use PSCI_suspend in a way that is not
> > > > > > supported or well- implemented by Xen.
> > > > > >
> > > > > > Can you check? You can add a printk in Linux
> > > > > > drivers/firmware/psci/psci.c:__psci_cpu_suspend or in Xen
> > > > > > xen/arch/arm/vpsci.c:do_psci_0_2_cpu_suspend
> > > > > Instrumented both places it doesn't appear to reach there.  In
> > > > > kernel/power/suspend.c, there's a call to s2idle_loop that it's
> > > > > currently 'stuck' in and I think it doesn't get to the psci suspend your
> > > > > referring till afterwards, when suspend_ops->enter is called.
> > > > > Unfortunately, without any idle-states nodes in the FDT, the
> > > > > only suspend state Linux is defaults to is 'suspend to idle'.
> > > >
> > > > The fact that Linux uses "suspend to idle" is not a problem
> > > > because as I mentioned WFI or PSCI_suspent are not different on
> > > > Xen. That part is OK.
> > > What if using "suspend to idle" is preventing a WFI/PSCI_suspend?
> > > Which is what I believe I'm currently seeing in my setup.  In
> > > kernel/power/suspend.c, suspend_devices_and_enter(), it gets into
> > > the this s2idle_loop and upon resuming from idle, it jumps past the
> > > point where I believe a WFI/PSCI_suspend can happen.
> > > if (state == PM_SUSPEND_TO_IDLE) {
> > >                 s2idle_loop();
> > >                 goto Platform_wake;
> > > }
> >
> > If that is the case, then it looks like a Linux bug. Maybe something
> > along these lines?
> >
> > https://can01.safelinks.protection.outlook.com/?url=https%3A%2F%2Flore
> > .k%2F&data=05%7C01%7Canthonychan%40nureva.com%7Ccf5e956c6a4d42b1460a08
> > dbaf13e021%7C5aeb77fa643b473eaee0cb54a11ccba3%7C1%7C0%7C63829627212319
> > 7144%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBT
> > iI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&sdata=lDfILPgJQQQPJOL44%2BcU
> > %2BN2RFOs8L6F4AE11kvOhOQE%3D&reserved=0
> > ernel.org%2Flinux-arm-
> > kernel%2F4665489.GXAFRqVoOG%40kreacher%2FT%2F%23m6edda92d0b5
> > dc09f8e05e7d6db3807501b7249f4&data=05%7C01%7Canthonychan%40n
> > ureva.com%7C144641906bef48b9180f08dbae7bc1d8%7C5aeb77fa643b47
> > 3eaee0cb54a11ccba3%7C1%7C0%7C638295618800415028%7CUnknown
> > %7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1ha
> > WwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&sdata=%2Fv%2FHpI1ix3yhDJ
> > 75oejWzDfUqB8SqOQzkU3clJzMOtw%3D&reserved=0
> 
> Thanks, I've tried patches that stemmed from that discussion but unfortunately,
> doesn't resolve the issue.  In fact, the s2idle_loop branch might not be the problem at all.  I experimented with Xen to allow the 'idle-states' into the FDT and prevented xen_guest_init on Linux from disabling the 'cpuidle' driver (arch/arm/xen/enlighten.c).  When I trigger a suspend, I can see now another thread (believe it's the idle thread) call into drivers/firmware/psci/psci.c:__psci_cpu_suspend and then the Xen counterpart at
> xen/arch/arm/vpsci.c:do_psci_0_2_cpu_suspend.

OK but remember that Xen is not implementing do_psci_0_2_cpu_suspend
correctly at the moment. Either we need to fix the Xen implementation,
or we need to configure Linux so that it calls WFI instead of
__psci_cpu_suspend.

As a test, can you try to apply the attached patch to Xen as a tenative
fix?  Or you could change
drivers/firmware/psci/psci.c:__psci_cpu_suspend to call WFI instead of
the PSCI operation (making sure to go to the entry_point instead of
returning).


> The normal 'suspend' thread still goes into the s2idle_loop. 

This is potentially a problem: if it is s2idle_loop causing the problem,
and one thread is still executing it, then we can still have a bug?


> Eventually, Xen still watchdogs on the dom0 VM.
--8323329-1637671299-1694045802=:6458
Content-Type: text/x-diff; name=pscisuspend.patch
Content-Transfer-Encoding: BASE64
Content-ID: <alpine.DEB.2.22.394.2309061716400.6458@ubuntu-linux-20-04-desktop>
Content-Description: 
Content-Disposition: attachment; filename=pscisuspend.patch

ZGlmZiAtLWdpdCBhL3hlbi9hcmNoL2FybS92cHNjaS5jIGIveGVuL2FyY2gv
YXJtL3Zwc2NpLmMNCmluZGV4IGQxNjE1YmU4YTYuLjRjYTFkN2M0OGYgMTAw
NjQ0DQotLS0gYS94ZW4vYXJjaC9hcm0vdnBzY2kuYw0KKysrIGIveGVuL2Fy
Y2gvYXJtL3Zwc2NpLmMNCkBAIC0xMjgsNiArMTI4LDggQEAgc3RhdGljIHJl
Z2lzdGVyX3QgZG9fcHNjaV8wXzJfY3B1X3N1c3BlbmQodWludDMyX3QgcG93
ZXJfc3RhdGUsDQogICAgICAqLw0KIA0KICAgICB2Y3B1X2Jsb2NrX3VubGVz
c19ldmVudF9wZW5kaW5nKHYpOw0KKyAgICB2LT5hcmNoLmNwdV9pbmZvLT5n
dWVzdF9jcHVfdXNlcl9yZWdzLnBjID0gKHU2NCkgZW50cnlfcG9pbnQ7DQor
ICAgIHYtPmFyY2guY3B1X2luZm8tPmd1ZXN0X2NwdV91c2VyX3JlZ3MueDAg
PSBjb250ZXh0X2lkOw0KICAgICByZXR1cm4gUFNDSV9TVUNDRVNTOw0KIH0N
CiANCg==

--8323329-1637671299-1694045802=:6458--

