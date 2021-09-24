Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B2F1417BDF
	for <lists+xen-devel@lfdr.de>; Fri, 24 Sep 2021 21:39:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.195616.348390 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mTr2k-00023Y-HA; Fri, 24 Sep 2021 19:39:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 195616.348390; Fri, 24 Sep 2021 19:39:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mTr2k-00020X-E7; Fri, 24 Sep 2021 19:39:34 +0000
Received: by outflank-mailman (input) for mailman id 195616;
 Fri, 24 Sep 2021 19:39:32 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=UhVx=OO=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1mTr2i-00020R-Gg
 for xen-devel@lists.xenproject.org; Fri, 24 Sep 2021 19:39:32 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id b15ded08-77a2-423a-a907-3f01ababa5f6;
 Fri, 24 Sep 2021 19:39:31 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 9B440611C8;
 Fri, 24 Sep 2021 19:39:30 +0000 (UTC)
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
X-Inumbo-ID: b15ded08-77a2-423a-a907-3f01ababa5f6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1632512370;
	bh=YNQBVARhL5zGPlsY8c6JbZE4vqiRLj/dGpAmkEmi8rE=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=NriPQmHT0yFKfq9IjBUU981hc6ogqQM0e+kZAhb/Mq5M3PX97mKmZCysbHKN3xqy9
	 8JYa4e1K5zxhMzpVz6p+rb+lIOF20YiJo1I1eS0KW4ecWGNYQ5kV3EnK0VlViRfVos
	 bD+yOnu+RxJep3n/ibtLUblFPFauMZ9THl2sCBCincb+zUCx4XnMzl+I5BjnRYUvZ+
	 mMFWYiZxITzFxjt7ha+29dOrY4UMuMUznDdBAPpzW/9O4jvPiC6lV7f+H0syLMM215
	 RqbSqBWWrLXusgm+zPlYuhUPh4TzTmRYRjuFS3I+XwXmFr6YY4Or77g/POruGBfwJp
	 /2xhS8K1BlKhQ==
Date: Fri, 24 Sep 2021 12:39:29 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Wei Chen <Wei.Chen@arm.com>
cc: Stefano Stabellini <sstabellini@kernel.org>, 
    xen-devel@lists.xenproject.org, julien@xen.org, Bertrand.Marquis@arm.com
Subject: Re: [PATCH 36/37] xen/arm: Provide Kconfig options for Arm to enable
 NUMA
In-Reply-To: <56e0cc0e-7405-74b0-eb4b-07cd9cdae225@arm.com>
Message-ID: <alpine.DEB.2.21.2109241237210.17979@sstabellini-ThinkPad-T480s>
References: <20210923120236.3692135-1-wei.chen@arm.com> <20210923120236.3692135-37-wei.chen@arm.com> <alpine.DEB.2.21.2109232029450.17979@sstabellini-ThinkPad-T480s> <56e0cc0e-7405-74b0-eb4b-07cd9cdae225@arm.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Fri, 24 Sep 2021, Wei Chen wrote:
> Hi Stefano,
> 
> On 2021/9/24 11:31, Stefano Stabellini wrote:
> > On Thu, 23 Sep 2021, Wei Chen wrote:
> > > Arm platforms support both ACPI and device tree. We don't
> > > want users to select device tree NUMA or ACPI NUMA manually.
> > > We hope usrs can just enable NUMA for Arm, and device tree
> >            ^ users
> > 
> > > NUMA and ACPI NUMA can be selected depends on device tree
> > > feature and ACPI feature status automatically. In this case,
> > > these two kinds of NUMA support code can be co-exist in one
> > > Xen binary. Xen can check feature flags to decide using
> > > device tree or ACPI as NUMA based firmware.
> > > 
> > > So in this patch, we introduce a generic option:
> > > CONFIG_ARM_NUMA for user to enable NUMA for Arm.
> >                        ^ users
> > 
> 
> OK
> 
> > > And one CONFIG_DEVICE_TREE_NUMA option for ARM_NUMA
> > > to select when HAS_DEVICE_TREE option is enabled.
> > > Once when ACPI NUMA for Arm is supported, ACPI_NUMA
> > > can be selected here too.
> > > 
> > > Signed-off-by: Wei Chen <wei.chen@arm.com>
> > > ---
> > >   xen/arch/arm/Kconfig | 11 +++++++++++
> > >   1 file changed, 11 insertions(+)
> > > 
> > > diff --git a/xen/arch/arm/Kconfig b/xen/arch/arm/Kconfig
> > > index 865ad83a89..ded94ebd37 100644
> > > --- a/xen/arch/arm/Kconfig
> > > +++ b/xen/arch/arm/Kconfig
> > > @@ -34,6 +34,17 @@ config ACPI
> > >   	  Advanced Configuration and Power Interface (ACPI) support for Xen is
> > >   	  an alternative to device tree on ARM64.
> > >   + config DEVICE_TREE_NUMA
> > > +	def_bool n
> > > +	select NUMA
> > > +
> > > +config ARM_NUMA
> > > +	bool "Arm NUMA (Non-Uniform Memory Access) Support (UNSUPPORTED)" if
> > > UNSUPPORTED
> > > +	select DEVICE_TREE_NUMA if HAS_DEVICE_TREE
> > 
> > Should it be: depends on HAS_DEVICE_TREE ?
> > (And eventually depends on HAS_DEVICE_TREE || ACPI)
> > 
> 
> As the discussion in RFC [1]. We want to make ARM_NUMA as a generic
> option can be selected by users. And depends on has_device_tree
> or ACPI to select DEVICE_TREE_NUMA or ACPI_NUMA.
> 
> If we add HAS_DEVICE_TREE || ACPI as dependencies for ARM_NUMA,
> does it become a loop dependency?
> 
> https://lists.xenproject.org/archives/html/xen-devel/2021-08/msg00888.html

OK, I am fine with that. I was just trying to catch the case where a
user selects "ARM_NUMA" but actually neither ACPI nor HAS_DEVICE_TREE
are selected so nothing happens. I was trying to make it clear that
ARM_NUMA depends on having at least one between HAS_DEVICE_TREE or ACPI
because otherwise it is not going to work.

That said, I don't think this is important because HAS_DEVICE_TREE
cannot be unselected. So if we cannot find a way to express the
dependency, I think it is fine to keep the patch as is.

