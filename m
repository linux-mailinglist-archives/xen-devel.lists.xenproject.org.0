Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F3311D3382
	for <lists+xen-devel@lfdr.de>; Thu, 14 May 2020 16:51:09 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jZFBs-0002uG-SV; Thu, 14 May 2020 14:50:28 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=NlH/=64=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1jZFBq-0002uB-JF
 for xen-devel@lists.xenproject.org; Thu, 14 May 2020 14:50:26 +0000
X-Inumbo-ID: 3e7a9c40-95f2-11ea-b9cf-bc764e2007e4
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 3e7a9c40-95f2-11ea-b9cf-bc764e2007e4;
 Thu, 14 May 2020 14:50:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1589467826;
 h=from:mime-version:content-transfer-encoding:message-id:
 date:to:cc:subject:in-reply-to:references;
 bh=gVykKTj/P+WuV0tzCF97b3U8cBLCrTF9Uur5DWTWSQw=;
 b=ey4ka19cpFa/mDfxRubHg7grx+RhRky/ctPcJTqmtkSLJW5v9C40iDAb
 Zxwy1uaIPLxOSTt1EXHwvT1Vxk9SX0zdaDws/E3rEK0/1nvfuyZ3117FL
 7L3wHW1VMf7osGKU5A0rEnkEaf9f0XBfgCjquMDN/PVISI57RtZGuHL6v Q=;
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 ian.jackson@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="ian.jackson@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa3.hc3370-68.iphmx.com: domain of
 Ian.Jackson@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="Ian.Jackson@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
Authentication-Results: esa3.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=ian.jackson@citrix.com;
 spf=Pass smtp.mailfrom=Ian.Jackson@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com;
 dmarc=pass (p=none dis=none) d=citrix.com
IronPort-SDR: LPAMW0Qs7hpqecft9acBMHafdNoBoaMDlN2MszvvxgoqtQzmS/nUlajxeKTdYmj8klg0qOBluQ
 pVdF39T5v/7/3aUGeafkwXXGGvc47Mtevj1Kb823Q9iWqiV0z8RLo3roGCdi8TOpkl89M2KgKi
 FG2QYufsFR3WvcitkM2bQaMHEUBpKiVnDofVUdoSAsA3U1GX+zX0T/BHvuDmwRP8lgPIgPY02P
 S7f2lOpmexqoRjNGZq7bTUcxWzsEXf8u8qjPjhDq2YG5cs9E222r2tBfvx7do+SDTsvZuWVbEH
 KFU=
X-SBRS: 2.7
X-MesageID: 17530258
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.73,391,1583211600"; d="scan'208";a="17530258"
From: Ian Jackson <ian.jackson@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Message-ID: <24253.23212.178710.524294@mariner.uk.xensource.com>
Date: Thu, 14 May 2020 15:50:20 +0100
To: Tamas K Lengyel <tamas.lengyel@intel.com>
Subject: Re: [PATCH v18 2/2] tools/libxl: VM forking toolstack side
In-Reply-To: <b91c338ab8165b6e228b46bbd1853eb140ab69c7.1588772376.git.tamas.lengyel@intel.com>
References: <a59dabe3a40d4f3709d3ad6ca605523f180c2dc5.1588772376.git.tamas.lengyel@intel.com>
 <b91c338ab8165b6e228b46bbd1853eb140ab69c7.1588772376.git.tamas.lengyel@intel.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Anthony Perard <anthony.perard@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Wei Liu <wl@xen.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Tamas K Lengyel writes ("[PATCH v18 2/2] tools/libxl: VM forking toolstack side"):
> Add necessary bits to implement "xl fork-vm" commands. The command allows the
> user to specify how to launch the device model allowing for a late-launch model
> in which the user can execute the fork without the device model and decide to
> only later launch it.

Hi.

Sorry to be so late in reviewing this.  I will divert my main
attention to the API elements...

> +=item B<fork-vm> [I<OPTIONS>] I<domain-id>
> +
> +Create a fork of a running VM.  The domain will be paused after the operation
> +and remains paused while forks of it exist.

Do you mean "must remain paused" ?  And "The original domain" rather
than "The domain" ?

> +B<OPTIONS>
> +
> +=over 4
> +
> +=item B<-p>
> +
> +Leave the fork paused after creating it.

By default the fork runs right away, then, I take it.

> +=item B<--launch-dm>
> +
> +Specify whether the device model (QEMU) should be launched for the fork. Late
> +launch allows to start the device model for an already running fork.

It's not clear to me whether this launches the DM for an existing
fork, or specify when forking that the DM should be run ?

Do you really mean that you can run a fork for a while with no DM ?
How does that work ?

Also you seem to have not documented the launch-dm operation ?

> +=item B<-C>
> +
> +The config file to use when launching the device model.  Currently required when
> +launching the device model.  Most config settings MUST match the parent domain
> +exactly, only change VM name, disk path and network configurations.

This is a libxl config file, right ?

> +=item B<-Q>
> +
> +The path to the qemu save file to use when launching the device model.  Currently
> +required when launching the device model.

Where would the user get one of these ?

I think this question has no good answer and this reveals a problem
with the API...

> +=item B<--fork-reset>
> +
> +Perform a reset operation of an already running fork.  Note that resetting may
> +be less performant then creating a new fork depending on how much memory the
> +fork has deduplicated during its runtime.

What is the semantic effect of a reset ?

> +=item B<--max-vcpus>
> +
> +Specify the max-vcpus matching the parent domain when not launching the dm.

What ?  This makes little sense to me.  You specify vm-fork
--max-vcpus and it changes the parent's max-vcpus ??

> +=item B<--allow-iommu>
> +
> +Specify to allow forking a domain that has IOMMU enabled. Only compatible with
> +forks using --launch-dm no.

Are there no some complex implications here ?  Maybe this doc needs a
caveat.

> +int libxl_domain_fork_launch_dm(libxl_ctx *ctx, libxl_domain_config *d_config,
> +                                uint32_t domid,
> +                                const libxl_asyncprogress_how *aop_console_how)
> +                                LIBXL_EXTERNAL_CALLERS_ONLY;
> +
> +int libxl_domain_fork_reset(libxl_ctx *ctx, uint32_t domid)
> +                            LIBXL_EXTERNAL_CALLERS_ONLY;
>  #endif

I'm afraid I found the code very hard to review.  In particular:

> -    if (!soft_reset) {
> -        struct xen_domctl_createdomain create = {
> -            .ssidref = info->ssidref,
> -            .max_vcpus = b_info->max_vcpus,
> -            .max_evtchn_port = b_info->event_channels,
> -            .max_grant_frames = b_info->max_grant_frames,
> -            .max_maptrack_frames = b_info->max_maptrack_frames,

I think this containsw a lot of code motion.  There is probably some
other refactoring.


Can you please split this up into several patches ?  Code motion
should cocur in patches that do nothing else.  Refactoring should be
broken down into pieces as small as possible, and separated from the
addition of new functionality.  So most of the patches should be
annotated "no functional change".

Thanks,
Ian.

