Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 75C261BBC58
	for <lists+xen-devel@lfdr.de>; Tue, 28 Apr 2020 13:24:44 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jTOLt-0004R5-Dz; Tue, 28 Apr 2020 11:24:37 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=NU6p=6M=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1jTOLr-0004Qx-5m
 for xen-devel@lists.xenproject.org; Tue, 28 Apr 2020 11:24:35 +0000
X-Inumbo-ID: d5bb1af7-8942-11ea-984c-12813bfff9fa
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id d5bb1af7-8942-11ea-984c-12813bfff9fa;
 Tue, 28 Apr 2020 11:24:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1588073074;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=d2ppzpQoYuZU0fIiUWjzTipilifiem79IQGnX/DQMpQ=;
 b=F5iKSkWaYhvvjOu3OnvNwT+NSYLb9wfr1VkjMd09lpssBLL6Slw2SxcO
 Ap3QjegErqium6H9IbPWe9E15w5pNQhXiUVejwQ6kVIdxNKt8+rDmWu4q
 nBsAB61ZKMQW+4PeC2/o4CQbpz/W3qrCMrmFd0B/Drz8kMx6JIgBFBW97 Q=;
Authentication-Results: esa5.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=andrew.cooper3@citrix.com;
 spf=Pass smtp.mailfrom=Andrew.Cooper3@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 andrew.cooper3@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="andrew.cooper3@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa5.hc3370-68.iphmx.com: domain of
 Andrew.Cooper3@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="Andrew.Cooper3@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: tAn3GjkbWo7SxIv9t5t5Z7/3OqX5McoKXHQMtxUiQS1z+mfbPfTu+cYirne7WjPqmFO0zBDNg4
 N7ndSmJUx9r14aJw2P5G9ztoKBXUuenrLos8YTTjaRuudU1gmNtUDR6zyfSqL/x/G9fvlRLfYR
 e0G4Xh8/vc1mx6hIkXHzoFUGysM6QstK/BrAe/mWS5OH+/riNzVqBABE/Frbad1mYxSmcHScOS
 uQGl9XEnVyj854gKZzR2bD4ALZxaXiSyU5+nkeAz9wWMweYtJ3waMzf+YI7HnbLnxdTjX/sPy1
 7ac=
X-SBRS: 2.7
X-MesageID: 16675484
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.73,327,1583211600"; d="scan'208";a="16675484"
Subject: Re: [PATCH] mini-os: Avoid segfaults in tc{g,s}etattr
To: Wei Liu <wl@xen.org>, Jason Andryuk <jandryuk@gmail.com>
References: <20200427034019.6251-1-jandryuk@gmail.com>
 <20200427075429.mshevnm2ype7tq32@function>
 <CAKf6xpuh3v0H-22=7y83ioYsm2GnKOs+FO8nN2s3djXanUL9BQ@mail.gmail.com>
 <20200428111645.pa6xfs6t6rifu6fu@liuwe-devbox-debian-v2.j3c5onc20sse1dnehy4noqpfcg.zx.internal.cloudapp.net>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <3ed7eb87-070c-28ea-4f8a-aa4421cea93a@citrix.com>
Date: Tue, 28 Apr 2020 12:24:29 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200428111645.pa6xfs6t6rifu6fu@liuwe-devbox-debian-v2.j3c5onc20sse1dnehy4noqpfcg.zx.internal.cloudapp.net>
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
Cc: minios-devel@lists.xenproject.org,
 Samuel Thibault <samuel.thibault@ens-lyon.org>,
 Jan Beulich <JBeulich@suse.com>, xen-devel <xen-devel@lists.xenproject.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 28/04/2020 12:16, Wei Liu wrote:
>>>> ---
>>>> I can't get ioemu-stubdom to start without this.  With this, the guest
>>>> just reboots immediately, but it does that with a non-stubdom
>>>> device_model_version="qemu-xen-traditional" .  The same guest disk image
>>>> (cirros 0.5.1) boots with a linux stubdom or non-stubdom Ubuntu
>>>> qemu-system-x86_64.
>> Ubuntu gcc-9 adds -fcf-protection by default.  Somehow that flag
>> caused rombios (I think) to restart.  Setting -fcf-protection=none
>> like below (probably just the EMBEDDED_EXTRA_CFLAGS part) lets rombios
>> start properly.

All it does is insert ENDBR{32,64} instructions, which are nops on older
processors.

I suspect that it is not the -fcf-protection= directly, but some change
in alignment of a critical function.

>>   The hypervisor needs it as well via
>> EXTRA_CFLAGS_XEN_CORE=-fcf-protection=none and maybe also added to
>> xen/arch/x86/boot/build32.mk .
> Are you able to turn this into a proper patch? I suspect you will need
> to test the availability of this new (?) flag.
>
> Also Cc Jan and Andrew because it affects hypervisor build too.

I need to chase this up.  It is a GCC bug breaking the hypervisor build,
and I'm moderately disinclined to hack around it, seeing as
-fcf-protection is something we want in due course.

The bug is that GCC falsely declares that -fcf-protection is
incompatible with -mindirect-thunk=extern, despite me spending a week
during the Spectre embargo period specifically arranging for the two to
be compatible, because we knew we'd want to build retpoline-safe
binaries which could also use CET on newer hardware.

~Andrew

