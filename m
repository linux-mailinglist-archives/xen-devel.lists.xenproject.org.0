Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B7B371FAE0A
	for <lists+xen-devel@lfdr.de>; Tue, 16 Jun 2020 12:33:18 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jl8t6-0000cV-Ou; Tue, 16 Jun 2020 10:32:16 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=AL9H=75=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1jl8t5-0000cN-GE
 for xen-devel@lists.xenproject.org; Tue, 16 Jun 2020 10:32:15 +0000
X-Inumbo-ID: a43af1ea-afbc-11ea-b8ac-12813bfff9fa
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id a43af1ea-afbc-11ea-b8ac-12813bfff9fa;
 Tue, 16 Jun 2020 10:32:13 +0000 (UTC)
Authentication-Results: esa3.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: bWFKksfp5EiXZY6hVfcd1q/6Ph05ZeEMTLrIKdwEoDD5zcXnHJvlxLox25BnEDi91oGFD28x9x
 tgdmDs1eGU3eSYNi5Zd+2Qf1VwczulxE+0VueZzRY5ghrmzfgrKcjLa/fSI7SZijqccvTiH24L
 eEmoEMo9smUeL0T9+ZAeOuk2qRQ4pnQPl4bWZ7p3NGWCjRSo0Xa1LnyZ5RzO/dSRfWZGJN1x4a
 rYUH/YtYOQ/b8BpNaWzgPfz41zELOw2j3lJFYTXvQt62WSpjRPtt3tR0hSopBlU4LCCXHKlwnt
 G/Q=
X-SBRS: 2.7
X-MesageID: 20144470
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.73,518,1583211600"; d="scan'208";a="20144470"
Date: Tue, 16 Jun 2020 12:32:04 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Subject: Re: [PATCH 1/1] x86/acpi: Use FADT flags to determine the PMTMR width
Message-ID: <20200616103204.GN735@Air-de-Roger>
References: <cover.1592142369.git.gorbak25@gmail.com>
 <dba39869b788f7f9d937fac48f0476a0443925f0.1592142369.git.gorbak25@gmail.com>
 <6b921b43-03f6-448c-297e-8c8f041eea2a@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <6b921b43-03f6-448c-297e-8c8f041eea2a@suse.com>
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
Cc: artur@puzio.waw.pl, Wei Liu <wl@xen.org>, jakub@bartmin.ski,
 Andrew Cooper <andrew.cooper3@citrix.com>, marmarek@invisiblethingslab.com,
 Grzegorz Uriasz <gorbak25@gmail.com>, j.nowak26@student.uw.edu.pl,
 xen-devel@lists.xenproject.org
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Tue, Jun 16, 2020 at 10:07:05AM +0200, Jan Beulich wrote:
> On 14.06.2020 16:36, Grzegorz Uriasz wrote:
> > --- a/xen/arch/x86/acpi/boot.c
> > +++ b/xen/arch/x86/acpi/boot.c
> > @@ -480,7 +480,10 @@ static int __init acpi_parse_fadt(struct acpi_table_header *table)
> >  		if (fadt->xpm_timer_block.space_id ==
> >  		    ACPI_ADR_SPACE_SYSTEM_IO) {
> >  			pmtmr_ioport = fadt->xpm_timer_block.address;
> > -			pmtmr_width = fadt->xpm_timer_block.bit_width;
> > +			if (fadt->flags & ACPI_FADT_32BIT_TIMER)
> > +				pmtmr_width = 32;
> > +			else
> > +				pmtmr_width = 24;
> 
> I think disagreement of the two wants logging, and you want to
> default to using the smaller of the two (or even to ignoring the
> timer altogether). Then there wants to be a way to override
> (unless we already have one) our defaulting, in case it's wrong.

TBH, I presume timer_block will always return 32bits, because that's
the size of the register. Then the timer can implement less bits than
the full size of the register, and that's what gets signaled using the
ACPI flags. What we care about here is the number of bits used by the
timer, not the size of the register.

I think we should only ignore the timer if pm_timer_block.bit_width <
pmtmr_width.

Printing a (debug) message when those values disagree is fine, but I
bet it's going to trigger always when the implemented timer is only
using 24bits.

Roger.

