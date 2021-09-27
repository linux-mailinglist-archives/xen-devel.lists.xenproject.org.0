Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 56866419B7C
	for <lists+xen-devel@lfdr.de>; Mon, 27 Sep 2021 19:17:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.197125.350076 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mUuFv-0000XJ-3N; Mon, 27 Sep 2021 17:17:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 197125.350076; Mon, 27 Sep 2021 17:17:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mUuFu-0000Ub-VV; Mon, 27 Sep 2021 17:17:30 +0000
Received: by outflank-mailman (input) for mailman id 197125;
 Mon, 27 Sep 2021 17:17:29 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=bXng=OR=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1mUuFt-0000UV-6J
 for xen-devel@lists.xenproject.org; Mon, 27 Sep 2021 17:17:29 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 3a933486-6083-4b55-b22a-5945d7acf907;
 Mon, 27 Sep 2021 17:17:28 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 59D7961501;
 Mon, 27 Sep 2021 17:17:27 +0000 (UTC)
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
X-Inumbo-ID: 3a933486-6083-4b55-b22a-5945d7acf907
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1632763047;
	bh=zxs65gmXcvyQSuEH9x9d7sqI8gTKLA2qdHecSUdJWCA=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=NOIwCldbnMoRYsFrZncx8cUCETfNadDAVyyKLAfzqI/dIz68bJh8VM04RILa0LpHT
	 uTd6moE6fyWDl8AxY0CkxfKVzL87GWIlyOfVNePrrMHx7+eqTchnEUTi03fNe7su2r
	 /hSb/jZeQL+rNGx6QqBRGgib9qRmt8fIlGY5lvwKgxLjho4ADejdoAXXOD7gPicLry
	 3QPxaacYPIxJ6H7eyHicPKy/lSdliOgiizWSJGKm8yetQYRh0xrd1Y4RR/jeML2sb5
	 SOgzyZnMWH/4SMIb7gmTogKp+eYpB3UA5Gy8OUm491iOeS0nsbgmcIBV/BcWrQ7me3
	 HASt71YMCN1Dg==
Date: Mon, 27 Sep 2021 10:17:25 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Jan Beulich <jbeulich@suse.com>
cc: Julien Grall <julien.grall.oss@gmail.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, Wei Chen <Wei.Chen@arm.com>, 
    xen-devel <xen-devel@lists.xenproject.org>, 
    Bertrand Marquis <Bertrand.Marquis@arm.com>
Subject: Re: [PATCH 36/37] xen/arm: Provide Kconfig options for Arm to enable
 NUMA
In-Reply-To: <42eb1303-1b45-5489-eac3-855f4ab35eb5@suse.com>
Message-ID: <alpine.DEB.2.21.2109271006480.5022@sstabellini-ThinkPad-T480s>
References: <20210923120236.3692135-1-wei.chen@arm.com> <20210923120236.3692135-37-wei.chen@arm.com> <alpine.DEB.2.21.2109232029450.17979@sstabellini-ThinkPad-T480s> <56e0cc0e-7405-74b0-eb4b-07cd9cdae225@arm.com> <alpine.DEB.2.21.2109241237210.17979@sstabellini-ThinkPad-T480s>
 <4e6f7222-59c8-7853-cf2c-076620efa244@suse.com> <CAJ=z9a1wOd6Hct50O_3B5q3o-bvhgMFy+A95gYMPfz-YL8uFDQ@mail.gmail.com> <42eb1303-1b45-5489-eac3-855f4ab35eb5@suse.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 27 Sep 2021, Jan Beulich wrote:
> On 27.09.2021 10:45, Julien Grall wrote:
> > On Mon, 27 Sep 2021, 10:33 Jan Beulich, <jbeulich@suse.com> wrote:
> > 
> >> On 24.09.2021 21:39, Stefano Stabellini wrote:
> >>> On Fri, 24 Sep 2021, Wei Chen wrote:
> >>>> On 2021/9/24 11:31, Stefano Stabellini wrote:
> >>>>> On Thu, 23 Sep 2021, Wei Chen wrote:
> >>>>>> --- a/xen/arch/arm/Kconfig
> >>>>>> +++ b/xen/arch/arm/Kconfig
> >>>>>> @@ -34,6 +34,17 @@ config ACPI
> >>>>>>      Advanced Configuration and Power Interface (ACPI) support for
> >> Xen is
> >>>>>>      an alternative to device tree on ARM64.
> >>>>>>   + config DEVICE_TREE_NUMA
> >>>>>> +  def_bool n
> >>>>>> +  select NUMA
> >>>>>> +
> >>>>>> +config ARM_NUMA
> >>>>>> +  bool "Arm NUMA (Non-Uniform Memory Access) Support (UNSUPPORTED)"
> >> if
> >>>>>> UNSUPPORTED
> >>>>>> +  select DEVICE_TREE_NUMA if HAS_DEVICE_TREE
> >>>>>
> >>>>> Should it be: depends on HAS_DEVICE_TREE ?
> >>>>> (And eventually depends on HAS_DEVICE_TREE || ACPI)
> >>>>>
> >>>>
> >>>> As the discussion in RFC [1]. We want to make ARM_NUMA as a generic
> >>>> option can be selected by users. And depends on has_device_tree
> >>>> or ACPI to select DEVICE_TREE_NUMA or ACPI_NUMA.
> >>>>
> >>>> If we add HAS_DEVICE_TREE || ACPI as dependencies for ARM_NUMA,
> >>>> does it become a loop dependency?
> >>>>
> >>>>
> >> https://lists.xenproject.org/archives/html/xen-devel/2021-08/msg00888.html
> >>>
> >>> OK, I am fine with that. I was just trying to catch the case where a
> >>> user selects "ARM_NUMA" but actually neither ACPI nor HAS_DEVICE_TREE
> >>> are selected so nothing happens. I was trying to make it clear that
> >>> ARM_NUMA depends on having at least one between HAS_DEVICE_TREE or ACPI
> >>> because otherwise it is not going to work.
> >>>
> >>> That said, I don't think this is important because HAS_DEVICE_TREE
> >>> cannot be unselected. So if we cannot find a way to express the
> >>> dependency, I think it is fine to keep the patch as is.
> >>
> >> So how about doing things the other way around: ARM_NUMA has no prompt
> >> and defaults to ACPI_NUMA || DT_NUMA, and DT_NUMA gains a prompt instead
> >> (and, for Arm at least, ACPI_NUMA as well; this might even be worthwhile
> >> to have on x86 down the road).
> >>
> > 
> > As I wrote before, I don't think the user should say "I want to enable NUMA
> > with Device-Tree or ACPI". Instead, they say whether they want to use NUMA
> > and let Xen decide to enable the DT/ACPI support.
> > 
> > In other word, the prompt should stay on ARM_NUMA.
> 
> Okay. In which case I'm confused by Stefano's question.

Let me clarify: I think it is fine to have a single prompt for NUMA in
Kconfig. However, I am just pointing out that it is theoretically
possible with the current code to present an ARM_NUMA prompt to the user
but actually have no NUMA enabled at the end because both DEVICE TREE
and ACPI are disabled. This is only a theoretical problem because DEVICE
TREE support (HAS_DEVICE_TREE) cannot be disabled today. Also I cannot
imagine how a configuration with neither DEVICE TREE nor ACPI can be
correct. So I don't think it is a critical concern.

That said, you can see that, at least theoretically, ARM_NUMA depends on
either HAS_DEVICE_TREE or ACPI, so I suggested to add:

depends on HAS_DEVICE_TREE || ACPI

Wei answered that it might introduce a circular dependency, but I did
try the addition of "depends on HAS_DEVICE_TREE || ACPI" under ARM_NUMA
in Kconfig and everything built fine here.

