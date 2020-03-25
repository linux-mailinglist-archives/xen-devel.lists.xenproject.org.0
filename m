Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 81F3219326C
	for <lists+xen-devel@lfdr.de>; Wed, 25 Mar 2020 22:15:52 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jHDKa-0001HR-0W; Wed, 25 Mar 2020 21:12:56 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=K3jc=5K=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1jHDKZ-0001HM-3X
 for xen-devel@lists.xenproject.org; Wed, 25 Mar 2020 21:12:55 +0000
X-Inumbo-ID: 63f2f5a8-6edd-11ea-bec1-bc764e2007e4
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 63f2f5a8-6edd-11ea-bec1-bc764e2007e4;
 Wed, 25 Mar 2020 21:12:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1585170773;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=1nIX7ENOm2rHbhuxBW4YviYHAV1xyEguMSyaUkKLPMw=;
 b=QhznDHSlyd6B91q2W7b9ZSK+zmbiLF/M0QbWHD+JnQUqJFUonsjVJQ41
 ruRMmOlm6/PxSBAWKCKwmLqeynshesB5QleZRKl/zGgplZWxswyTzrNWz
 g9XpMd0a39jLeuisb13Gkk+8kmEOvAT6HH5zaXB14IeZ4EcevInyLHmB1 Q=;
Authentication-Results: esa2.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=andrew.cooper3@citrix.com;
 spf=Pass smtp.mailfrom=Andrew.Cooper3@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 andrew.cooper3@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="andrew.cooper3@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa2.hc3370-68.iphmx.com: domain of
 Andrew.Cooper3@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="Andrew.Cooper3@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: 1rQuVE/lWBzKWQkfft3AlPK0RX0y6iNtv1guBhq41Id1AlpdAPq44ZFazmbwxPkm2+v3FWOUPf
 2cMe9HTNC3s6868XlNEXvd9zYn4Jhhtd5lYOVGRMfecS58cdLMm1N4C4ts7vw9fGZvtlpO19Qp
 9z/01fsoF3GQW26rVUqPW2UDOG8syTI4fBneskA3JVMIbNhCtqwNyAAdq3eRfvoM/11JU53tXl
 Rj9vSr5EoL73+QB3UU5Md+FWmHnbFEp3j2Y2AMydqc2+QFV3fc+KhrkqlwmJjB9/WzB1K894rq
 elE=
X-SBRS: 2.7
X-MesageID: 14648121
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.72,305,1580792400"; d="scan'208";a="14648121"
To: Jan Beulich <jbeulich@suse.com>, "xen-devel@lists.xenproject.org"
 <xen-devel@lists.xenproject.org>
References: <6fa81b4d-528d-5c33-50c5-a18396b4383a@suse.com>
 <2c83b876-6fd8-1315-3b28-b45e877187aa@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <7147e3a1-b237-7a2b-d623-b364704d0096@citrix.com>
Date: Wed, 25 Mar 2020 21:12:48 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <2c83b876-6fd8-1315-3b28-b45e877187aa@suse.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
Subject: Re: [Xen-devel] [PATCH v5 03/10] x86: determine HAVE_AS_* just once
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien
 Grall <julien@xen.org>, Wei Liu <wl@xen.org>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Anthony PERARD <anthony.perard@citrix.com>,
 Roger Pau Monne <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 24/03/2020 12:33, Jan Beulich wrote:
> With the exception of HAVE_AS_QUOTED_SYM, populate the results into a
> generated header instead of (at least once per [sub]directory) into
> CFLAGS. This results in proper rebuilds (via make dependencies) in case
> the compiler used changes between builds. It additionally eases
> inspection of which assembler features were actually found usable.
>
> Some trickery is needed to avoid header generation itself to try to
> include the to-be/not-yet-generated header.
>
> Since the definitions in generated/config.h, previously having been
> command line options, might even affect xen/config.h or its descendants,
> move adding of the -include option for the latter after inclusion of the
> per-arch Rules.mk. Use the occasion to also move the most general -I
> option to the common Rules.mk.
>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Given the work of Anthony's which is already committed in staging, I'd
really prefer this patch to look something like
https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git/commit/?h=WIP.x86/asm&id=95ef9f80ed6359e89f988121521c421b7e9528de

That avoids all fragile games with includes, and is the position we want
to be in, longterm.

All the requisite infrastructure looks to be already present.

~Andrew

