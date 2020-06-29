Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EBBB120CD80
	for <lists+xen-devel@lfdr.de>; Mon, 29 Jun 2020 11:19:08 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jppvt-000121-2t; Mon, 29 Jun 2020 09:18:33 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=wPAo=AK=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1jppvr-00011w-Qo
 for xen-devel@lists.xenproject.org; Mon, 29 Jun 2020 09:18:31 +0000
X-Inumbo-ID: 7f5f88cc-b9e9-11ea-bb8b-bc764e2007e4
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 7f5f88cc-b9e9-11ea-bb8b-bc764e2007e4;
 Mon, 29 Jun 2020 09:18:30 +0000 (UTC)
Authentication-Results: esa3.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: Gops3C6MoK9J4gyVt+TOqkXzFtEi5y8r6+SMR7bjP+umfku0oy+dntbembZZIkF5JWhiCXnfbG
 yk58cnbnxrSsQAx3U3idyNz0eMy1Fwu2hUreU1krbTWtLxk0Bi4qvaC7EMbI+9nr6uRbWPBfux
 Dwda0DiI20CI4suE2DznoAE/DgMh18voaRrEndgV/7wiXncxpC5JpYgS2WzUOu5mQ/mdJ+auVb
 CaFI25F1RXJAAb8Xxa2MUpC3s8H0d1vjzxaYcJD8xfI33Xkuj58d7uQUpnLWGb0booepDXM503
 VTE=
X-SBRS: 2.7
X-MesageID: 21149344
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.75,294,1589256000"; d="scan'208";a="21149344"
Date: Mon, 29 Jun 2020 11:18:23 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Ruh <jan.ruh@tttech.com>
Subject: Re: Kernel requires x86-64 CPU, after modifying arch_shared_info
 struct
Message-ID: <20200629091823.GF735@Air-de-Roger>
References: <6f88fc3e2795436fa1f30dd026dd8eda@tttech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <6f88fc3e2795436fa1f30dd026dd8eda@tttech.com>
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
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
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Mon, Jun 29, 2020 at 07:43:43AM +0000, Jan Ruh wrote:
> Hi Xen Dev Community,
> 
> 
> I ran into an issue when implementing a prototype for a new
> paravirtualized clock for x86-64 hosts. I extended the
> arch_shared_info struct by 6 fields totaling at 36 bytes. I updated
> the xen-foreign/references.size to represent the new size of the
> arch_shared_info struct. The fields are correctly updated in Xen and
> I am also able to read the correct information stored from dom0.
> However, if I try to start a hvm VM with pvh extensions it does not
> boot telling me that "This kernel requires an x86-64 CPU, but only
> detected an i686 CPU.".

Did you try backing up your changes and seeing if the same happens?

Did you rebuild both the Xen hypervisor and the tools?

> I have rebuild my Linux domU kernel just as
> the dom0 kernel and everything should be compatible. To me this
> looks like Xen or libxc does some compatibility checks before
> booting up my HVM domU and decides to downgrade the detectable CPU
> due to some issue that I am not aware of. Do I miss something?

Pasting your xl config file would be helpful in order to help debug.

> Is my
> approach to extend the arch_shared_info wrong in the first place?

Doesn't look directly related to a change in arch_shared_info IMO, but
it's hard to tell without having more info.

Posting your changes might also help spot something wonky.

> CONFIDENTIALITY: The contents of this e-mail are confidential and
> intended only for the above addressee(s). If you are not the
> intended recipient, or the person responsible for delivering it to
> the intended recipient, copying or delivering it to anyone else or
> using it in any unauthorized manner is prohibited and may be
> unlawful. If you receive this e-mail by mistake, please notify the
> sender and the systems administrator at straymail@tttech.com
> immediately.

Nit: posting confidentiality banners to a public mailing lists
messages is kind of award, as the emails are publicly available for
anyone to read, even those that are not recipients of xen-devel, ie:

https://lists.xenproject.org/archives/html/xen-devel/2020-06/msg01868.html

Roger.

