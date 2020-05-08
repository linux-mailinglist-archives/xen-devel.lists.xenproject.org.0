Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AC0D71CB96B
	for <lists+xen-devel@lfdr.de>; Fri,  8 May 2020 23:05:22 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jXAAS-0006TL-3a; Fri, 08 May 2020 21:04:24 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=M6n8=6W=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1jXAAR-0006TG-0T
 for xen-devel@lists.xenproject.org; Fri, 08 May 2020 21:04:23 +0000
X-Inumbo-ID: 7d828f1a-916f-11ea-a071-12813bfff9fa
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 7d828f1a-916f-11ea-a071-12813bfff9fa;
 Fri, 08 May 2020 21:04:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1588971862;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=Xt1kL6CbUuB4s9c/xNAlc5HpI87uPFG7NIUqE70ub6Q=;
 b=QNY/MycQMKfD7WskuLaSKzC9vRCt4izP+MfB3VAaqz2dS1pqDE8B7B1W
 aTKdm/Dd6DXn73rjokEzZGW/c2tTeM+dt6ktGKm8QcXtQFWFx4chDXVGD
 gxviTblK8dAZK6YlCx/aP/WDtHP48DJPLyjUgMiwaIzCBexv1t2aD69RN k=;
Authentication-Results: esa4.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=andrew.cooper3@citrix.com;
 spf=Pass smtp.mailfrom=Andrew.Cooper3@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 andrew.cooper3@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="andrew.cooper3@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa4.hc3370-68.iphmx.com: domain of
 Andrew.Cooper3@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="Andrew.Cooper3@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
X-Ironport-Dmarc-Check-Result: validskip
IronPort-SDR: gvEq1nHMnQBL3kJRzNlmeSRMD51Jsf8m9tpPAbfGsUMP2mEyH+Ygw9e7hvVjWv/RQ/bSz6Mrvu
 k5PlFOat2DCORtgZ9PyvcnjvzcZ5orhDLZgGayn7z12NQhsgGv/VLWwpOD6q10NTAxtrlxrpb6
 tu8X83AhhFjrRUHVory4/r2s0hf8TyWUe4ABZ0iYSD3MIG855BO07ZFFR3ihvGebwVlxLUUCsv
 5fRSSpAMRVXcpk++MMxm1fTcncpobCbtJDdXfjp8anVOr5DfsTcvqDfpYz6N3Mtq7pNqLr05PG
 0V4=
X-SBRS: 2.7
X-MesageID: 17795292
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.73,369,1583211600"; d="scan'208";a="17795292"
Subject: Re: [PATCH v8 12/12] x86/HVM: don't needlessly intercept
 APERF/MPERF/TSC MSR reads
To: Jan Beulich <jbeulich@suse.com>, "xen-devel@lists.xenproject.org"
 <xen-devel@lists.xenproject.org>
References: <60cc730f-2a1c-d7a6-74fe-64f3c9308831@suse.com>
 <e92b6c1a-b2c3-13e7-116c-4772c851dd0b@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <81cc74ce-0a53-d5cd-3513-af3af6382815@citrix.com>
Date: Fri, 8 May 2020 22:04:17 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <e92b6c1a-b2c3-13e7-116c-4772c851dd0b@suse.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
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
Cc: Wei Liu <wl@xen.org>, Roger Pau Monne <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 05/05/2020 09:20, Jan Beulich wrote:
> If the hardware can handle accesses, we should allow it to do so. This
> way we can expose EFRO to HVM guests,

I'm reminded now of the conversation I'm sure we've had before, although
I have a feeling it was on IRC.

APERF/MPERF (including the EFRO interface on AMD) are free running
counters but only in C0.  The raw values are not synchronised across
threads.

A vCPU which gets rescheduled has a 50% chance of finding the one or
both values going backwards, and a 100% chance of totally bogus calculation.

There is no point exposing APERF/MPERF to guests.  It can only be used
safely in hypervisor context, on AMD hardware with a CLGI/STGI region,
or on Intel hardware in an NMI handler if you trust that a machine check
isn't going to ruin your day.

VMs have no way of achieving the sampling requirements, and has a fair
chance of getting a plausible-but-wrong answer.

The only possibility to do this safely is on a VM which is pinned to
pCPU for its lifetime, but even I'm unconvinced of the correctness.

I don't think we should be exposing this functionality to guests at all,
although I might be persuaded if someone wanting to use it in a VM can
provide a concrete justification of why the above problems won't get in
their way.

~Andrew

