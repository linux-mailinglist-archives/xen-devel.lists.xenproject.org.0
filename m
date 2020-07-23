Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ACCFA22AD9C
	for <lists+xen-devel@lfdr.de>; Thu, 23 Jul 2020 13:22:40 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jyZIs-0004Lu-Fa; Thu, 23 Jul 2020 11:22:22 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0L1b=BC=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1jyZIr-0004LO-AS
 for xen-devel@lists.xenproject.org; Thu, 23 Jul 2020 11:22:21 +0000
X-Inumbo-ID: c58a3a90-ccd6-11ea-86ef-bc764e2007e4
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id c58a3a90-ccd6-11ea-86ef-bc764e2007e4;
 Thu, 23 Jul 2020 11:22:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1595503340;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=XMCaNp2k6EeuVt7pt+FtqxDkl3YZlIt2Q1ItqH2ww4g=;
 b=RbZBx0GY5yacPl2kdsjTV+XA/3ki2FbnvghoLhMFQXPT7LAhVHi48avY
 Z2rptiotcFvIXofhhoBMpcCN5E6DMYw47p8biVcr96k2tT4FPGqTzvpln
 MIX8wfCDV9DIaIl/i8m4BHnOZ3PzvODayVKuYM/rUYBHdQrqN8Lba4fcY A=;
Authentication-Results: esa4.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: uM54ZEpV6NCrdOd4ejUXQ+6xfuOc/7tuvAbjurWE2maj1DZkXTZIvFA2aZBGqDgVe87KT4DAXL
 0tbwioETkhdXmqJeKUc9pVUmJo8NCpCaRhE8lAV50xNHBzhkIeRYRpupbDgrkuHCxR07R0Eccm
 9FG3K20vAaUTOu954/sROvEmhLY5w/zTCzLXRpZaDETa+3kVK9K4bWukR/WShEgCrGPxl0bJ8p
 sNtGbSJlfkIC/U2Si8n8/MYjgmqV1Bb8p+g3eJDp5uSsgdjt8NBuyxPSOjzP4tOItJKDoyYL0x
 aMQ=
X-SBRS: 2.7
X-MesageID: 23889141
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.75,386,1589256000"; d="scan'208";a="23889141"
Date: Thu, 23 Jul 2020 13:22:13 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH] x86/msr: Unify the real {rd,wr}msr() paths in
 guest_{rd,wr}msr()
Message-ID: <20200723112213.GB7191@Air-de-Roger>
References: <20200722105529.12177-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200722105529.12177-1-andrew.cooper3@citrix.com>
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
Cc: Xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wl@xen.org>,
 Jan Beulich <JBeulich@suse.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Wed, Jul 22, 2020 at 11:55:29AM +0100, Andrew Cooper wrote:
> Both the read and write side have commonalities which can be abstracted away.
> This also allows for additional safety in release builds, and slightly more
> helpful diagnostics in debug builds.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>

> ---
> CC: Jan Beulich <JBeulich@suse.com>
> CC: Wei Liu <wl@xen.org>
> CC: Roger Pau Monné <roger.pau@citrix.com>
> 
> I'm not a massive fan of the global scope want_rdmsr_safe boolean, but I can't
> think of a reasonable way to fix it without starting to use other
> flexibiltiies offered to us by C99.  (And to preempt the other question, an
> extra set of braces makes extremely confusing to read logic.)

The logic could be moved to a helper that takes a expected_safe or
some such parameter, but I think I prefer this approach.

Thanks, Roger.

