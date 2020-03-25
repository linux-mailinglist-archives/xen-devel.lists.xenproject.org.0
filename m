Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0358C19276F
	for <lists+xen-devel@lfdr.de>; Wed, 25 Mar 2020 12:45:09 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jH4Pn-0001up-1I; Wed, 25 Mar 2020 11:41:43 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=K3jc=5K=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1jH4Pl-0001uh-BY
 for xen-devel@lists.xenproject.org; Wed, 25 Mar 2020 11:41:41 +0000
X-Inumbo-ID: 97581ebe-6e8d-11ea-a6c1-bc764e2007e4
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 97581ebe-6e8d-11ea-a6c1-bc764e2007e4;
 Wed, 25 Mar 2020 11:41:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1585136500;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=Ry9BGsiSN1k+iXelX4q8kM0N8lCUDk9Xz4KgvFnfSMo=;
 b=fV2wAXKtQDMLZ5VFTTeDsum4iALfpWtblS8i4hmwTdxXXuysbkRLsOEr
 Seje0oY5p7IAucsmP5nwwJ4Nxo6bHWgwh86jSIzsnDZEdz86FNd2i6eAu
 enCBXJog0zqmWaCNYB/HotgMvu8mDxuMS/G+LSFkEvgFFIpdbl8bf/qzk w=;
Authentication-Results: esa6.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=andrew.cooper3@citrix.com;
 spf=Pass smtp.mailfrom=Andrew.Cooper3@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 andrew.cooper3@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="andrew.cooper3@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa6.hc3370-68.iphmx.com: domain of
 Andrew.Cooper3@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="Andrew.Cooper3@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: /nyJDAIyB4W2kpkGXkKEvBpfEDWsEDaEkHOvibAEuG0eFxX1B3tmxTBJ2ed/jiGzdlGhGEUlm3
 LWKSB1VSGmCvGHpj/lb777M5x/AbYB8VMEi2ilU5mEFauNl7u90CWDsavcAnLcncTRlbNvnDYN
 j7d+xjGjJZJVm06LU2+Yk2NMUm1La6yzTa4QOIdbfk8Qd2SNh9Uepga3BAcL15/iJNvj/2ahh/
 oRZ4slYzZwUK3MH2APUVk4nUS4A+hwvh9byL24BJcIiFaKSGkWlfeNh8xLpZ67N/LQmJVFi0OG
 ewk=
X-SBRS: 2.7
X-MesageID: 15010673
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.72,304,1580792400"; d="scan'208";a="15010673"
To: Jan Beulich <jbeulich@suse.com>, "xen-devel@lists.xenproject.org"
 <xen-devel@lists.xenproject.org>
References: <6fa81b4d-528d-5c33-50c5-a18396b4383a@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <db2b459a-5dac-ecd0-1650-f8b1dca8ff96@citrix.com>
Date: Wed, 25 Mar 2020 11:41:35 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <6fa81b4d-528d-5c33-50c5-a18396b4383a@suse.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
Subject: Re: [Xen-devel] [PATCH v5 00/10] x86emul: further work
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Paul Durrant <Paul.Durrant@citrix.com>, Wei Liu <wl@xen.org>,
 Roger Pau Monne <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 24/03/2020 12:26, Jan Beulich wrote:
> Some of the later patches are still at least partly RFC, for
> varying reasons (see there). I'd appreciate though if at least
> some of the earlier ones could go in rather sooner than later.
>
> Patch 1 functionally (for the test harness) depends on
> "libx86/CPUID: fix (not just) leaf 7 processing", while at
> least patch 2 contextually depends on "x86emul: disable
> FPU/MMX/SIMD insn emulation when !HVM".
>
>  1: x86emul: support AVX512_BF16 insns
>  2: x86emul: support MOVDIRI insn
>  3: x86: determine HAVE_AS_* just once

I have (in this order when threaded):

02/10 Support AVX512_BF16
02/10 Support MOVDIRI
01/10 Support AVX512_BF16
03/10 Determine HAS_AS_*

To a first approximation, the two AVX512_BF16 ones look identical, so
I'm going to assume that the first one (chronologically) was the error.

~Andrew

