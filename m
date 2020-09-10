Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D55B264092
	for <lists+xen-devel@lfdr.de>; Thu, 10 Sep 2020 10:52:56 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kGIJF-0005L8-7l; Thu, 10 Sep 2020 08:52:01 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5vjA=CT=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1kGIJD-0005L3-QO
 for xen-devel@lists.xenproject.org; Thu, 10 Sep 2020 08:51:59 +0000
X-Inumbo-ID: 736dd149-87bd-43a2-8e19-1a430cd9b395
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 736dd149-87bd-43a2-8e19-1a430cd9b395;
 Thu, 10 Sep 2020 08:51:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1599727918;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=Za0OHswcqDfglKGKKZVa8lKrdewcYlCNQAwzsucm/k4=;
 b=JJlyz/jrbPwIVqr/a/ICM0J62S3i4kaxjdCUSJkymGT+7qx5U34KzRnB
 gHh4kJGRlXb2SSXP7ERZxxX1K8Kb1zP2fEnN6OMFeJUeZG9y3PGaE40bM
 KEFLFJX20qzEwxFjclEZtXJZKR1ZPM4HBS6BeVkl8czpUehEJVbGrOXiR U=;
Authentication-Results: esa6.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: hHgtV2WinIPvwxbhwiSBGHZ336Wv7CaRkkz4G0bK9nL5IrxFy89zdPT9l8xR7TJKkbV8oz1/9j
 gC8H3a8ImtTOANrxPpmipFCfC4BHCepaHEoN3NiQzuU1Kh6jNbFruzO0tNkAbyoNyFfTa48h2A
 oxROMmBnDLbRBMvNd7IXD/QZIkpYb62r3pE7u7dOcPPEkenzKUTqRtqld70jNzN9hB2pFanz6z
 m0oj/uw0o7O+Ps7h73WMQ0GkLhM2UcGMhwIjJ28v++2T8kBBPRBFzHMlIGRY7ZAdJTO+YxP8bG
 5Uc=
X-SBRS: 2.7
X-MesageID: 26678303
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.76,412,1592884800"; d="scan'208";a="26678303"
Date: Thu, 10 Sep 2020 10:51:48 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>
CC: xen-devel <xen-devel@lists.xenproject.org>
Subject: Re: libxl - b_info.{acpi,apic} behaves differently than
 b_info.u.hvm.{acpi,apic}
Message-ID: <20200910085148.GU753@Air-de-Roger>
References: <20200910035723.GY1626@mail-itl>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200910035723.GY1626@mail-itl>
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 FTLPEX02CL06.citrite.net (10.13.108.179)
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
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Thu, Sep 10, 2020 at 05:57:23AM +0200, Marek Marczykowski-Górecki wrote:
> Hi,
> 
> After updating from Xen 4.13 to Xen 4.14 I have troubles starting any
> HVM: just after hvmloader saying "Invoking SeaBIOS" I get "(XEN) MMIO
> emulation failed (1): d29v0 32bit @ 0008:fffeedf d -> "
> 
> I come to a situation where seemingly the same domU started via xl
> works, while when started via libvirt it crashes. This seems to be
> related to xl setting b_info.{acpi,apic}, while libvirt setting
> b_info.u.hvm.{acpi,apic}. Modifying libvirt to use the former fixes the
> issue.

Could you print the values of the involved fields at the end of
libxl__domain_build_info_setdefault in both cases?

I'm not able to spot what changed between 4.13 and 4.14 that could
alter the behavior, but knowing the values at that point might make
it easier.

> So, handling the old option got broken sometime between 4.13 and 4.14.
> Or perhaps it is some other related side effect.

Libvirt master tests seem to have been failing for some time (60 days)
in the build phase [0], maybe you are using a newer version of libvirt
than what osstest is currently testing? (Xen flights are currently
stuck at libvirt commit 2c846fa6bcc11929c9fb857a22430fb9945654ad).

Thanks, Roger.

[0] http://logs.test-lab.xenproject.org/osstest/logs/152881/build-amd64-libvirt/6.ts-libvirt-build.log

