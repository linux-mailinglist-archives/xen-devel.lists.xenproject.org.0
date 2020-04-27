Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A4FB1BAB11
	for <lists+xen-devel@lfdr.de>; Mon, 27 Apr 2020 19:21:06 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jT7Q2-0000VM-2p; Mon, 27 Apr 2020 17:19:46 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=rzTj=6L=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1jT7Q0-0000VH-EV
 for xen-devel@lists.xenproject.org; Mon, 27 Apr 2020 17:19:44 +0000
X-Inumbo-ID: 48b36e84-88ab-11ea-ae69-bc764e2007e4
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 48b36e84-88ab-11ea-ae69-bc764e2007e4;
 Mon, 27 Apr 2020 17:19:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1588007983;
 h=from:mime-version:content-transfer-encoding:message-id:
 date:to:cc:subject:in-reply-to:references;
 bh=dUsJOvSfZAJHLaULfouDWhHbDdrV8NyEAwO3SKAz4Qw=;
 b=HJSH3mD6QY0dcsTKIONkUxZZOjZGXnjcNG3Pduy/1PwAdbePIl3rTn2T
 8PuH/oJMV55VDPBbc4Snymri9n3G+gFtZeI8J/I+7pkjs7ptFAq2JtlSi
 ep6fftGlb/hsv3MGluXa+PfDVKTjO6HCzqRZlsQ16y+pObx3G2fM/EQ1o 8=;
Authentication-Results: esa4.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=ian.jackson@citrix.com;
 spf=Pass smtp.mailfrom=Ian.Jackson@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 ian.jackson@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="ian.jackson@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa4.hc3370-68.iphmx.com: domain of
 Ian.Jackson@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="Ian.Jackson@citrix.com";
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
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: RTfL2MK298dSewkDORuNIH88IT9ojSZwpeM2g+p0eEdXIpHDsNaIVwaxe7K6ruaSve6SKe1JMF
 eTvX7ZnTNPUbnlRTf1Wbj0amjcV9svFLXw9w1u0edx/36NqIMs6RAGqOwGM4QXZ7RqikSa1Bxt
 Ffb3EyGScmIYfbIDHPNJeNv4RMirrw2aRbOIO1WEfyj811rI9DsDOswGT6vYKH+exz1fskHEz3
 mQ+nK0tzdNQhSFUk2TMFe/W1iR0Poq8I1+sgw8TT4oOk9+WI0f//Z4V6s4qRnJLXoJqXHNkbtP
 jFc=
X-SBRS: 2.7
X-MesageID: 17005976
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.73,324,1583211600"; d="scan'208";a="17005976"
From: Ian Jackson <ian.jackson@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Message-ID: <24231.5161.862828.377795@mariner.uk.xensource.com>
Date: Mon, 27 Apr 2020 18:19:37 +0100
To: Andrew Cooper <Andrew.Cooper3@citrix.com>
Subject: Re: [PATCH 01/12] libxc/save: Shrink code volume where possible
In-Reply-To: <a10d1572-d5c5-716a-0651-aee2345348dd@citrix.com>
References: <20191224151932.6304-1-andrew.cooper3@citrix.com>
 <20191224151932.6304-2-andrew.cooper3@citrix.com>
 <24093.61657.676890.721999@mariner.uk.xensource.com>
 <a10d1572-d5c5-716a-0651-aee2345348dd@citrix.com>
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
Cc: Xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wl@xen.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Andrew Cooper writes ("Re: [PATCH 01/12] libxc/save: Shrink code volume where possible"):
> On 14/01/2020 16:48, Ian Jackson wrote:
> > Andrew Cooper writes ("[PATCH 01/12] libxc/save: Shrink code volume where possible"):
> >> A property of how the error handling (0 on success, nonzero otherwise)
> >> allows these calls to be chained together with the ternary operatior.
> > I'm quite surprised to find a suggestion like this coming from you in
> > particular.
> 
> What probably is relevant is that ?: is a common construct in the
> hypervisor, which I suppose does colour my expectation of people knowing
> exactly what it means and how it behaves.

I expect other C programmers to know what ?: does, too.  But I think
using it to implement the error monad is quite unusual.  I asked
around a bit and my feeling is still that this isn't an improvement.

> > Or just to permit
> >    rc = write_one_vcpu_basic(ctx, i);    if (rc) goto error;
> > (ie on a single line).
> 
> OTOH, it should come as no surprise that I'd rather drop this patch
> entirely than go with these alternatives, both of which detract from
> code clarity. The former for hiding control flow, and the latter for
> being atypical layout which unnecessary cognitive load to follow.

I think, then, that it would be best to drop this patch, unless Wei
(or someone else) disagrees with me.

Sorry,
Ian.

