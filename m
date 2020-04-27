Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D57241BAA0D
	for <lists+xen-devel@lfdr.de>; Mon, 27 Apr 2020 18:24:46 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jT6YU-00047Q-5v; Mon, 27 Apr 2020 16:24:26 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jrem=6L=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1jT6YS-00047L-F4
 for xen-devel@lists.xenproject.org; Mon, 27 Apr 2020 16:24:24 +0000
X-Inumbo-ID: 8ddd0428-88a3-11ea-97b5-12813bfff9fa
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 8ddd0428-88a3-11ea-97b5-12813bfff9fa;
 Mon, 27 Apr 2020 16:24:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1588004664;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=q/rpydCk44pAeEWZsE66SR2vog6LZXWorQceKobYUZY=;
 b=Yyew8StL4bBYlUNmBNA2MZzZiszQ1IHgX0eYEOLH6Tb/9klDP0h6jis2
 576LHHFH/Q7UrKts07cUSfKFG4MX55V6lyoDIgTtSLJzxsH2ZtF7No/Tp
 RGfo5pzxr9+PBNnGIs+5aXLJ+Yae46KSJwzZG6dx92uE6BcmJv5zlVNIq Q=;
Authentication-Results: esa3.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=roger.pau@citrix.com;
 spf=Pass smtp.mailfrom=roger.pau@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 roger.pau@citrix.com) identity=pra; client-ip=162.221.158.21;
 receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa3.hc3370-68.iphmx.com: domain of
 roger.pau@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com";
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
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: pzsfqlt2MCbZV+Y8lSRxc85fTCPutaEfwwRMIXJNWAg98B/0vCmgd2lpRibYKcsJHmgWOYqzPL
 cKG+zvNhxOVGtUeUomfNnz91zc7OX7oFnUZpngi+/Zeive5HgmIqpUY19wym1/IhLG/sZuM5WH
 LtCb8/MYjQUx5X/naJL4kGTdg5GYiqU3wOslOhPInurDPfP5gSsBLOdJwfqj804zcWtRnwdqLk
 tj4MEpGNVNCfG4AVKItYF3x4KDVt5UL86G3SMOYMf8PBJPiSj9ErbD55V2M1oMXuHGe2Jf6lsF
 k18=
X-SBRS: 2.7
X-MesageID: 16298457
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.73,324,1583211600"; d="scan'208";a="16298457"
Date: Mon, 27 Apr 2020 18:23:59 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH] x86/ioemul: Rewrite stub generation
Message-ID: <20200427162359.GR28601@Air-de-Roger>
References: <20200427122041.7162-1-andrew.cooper3@citrix.com>
 <20200427151829.GP28601@Air-de-Roger>
 <cd4ae124-ce0b-85e6-bae7-94d32e1dba73@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <cd4ae124-ce0b-85e6-bae7-94d32e1dba73@citrix.com>
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

On Mon, Apr 27, 2020 at 05:18:52PM +0100, Andrew Cooper wrote:
> On 27/04/2020 16:18, Roger Pau Monné wrote:
> > On Mon, Apr 27, 2020 at 01:20:41PM +0100, Andrew Cooper wrote:
> >> +    /* Helpers - Read outer scope but only modify p. */
> >> +#define APPEND_BUFF(b) ({ memcpy(p, b, sizeof(b)); p += sizeof(b); })
> >> +#define APPEND_CALL(f)                                                  \
> >> +    ({                                                                  \
> >> +        long disp = (long)(f) - (stub_va + p - ctxt->io_emul_stub + 5); \
> >> +        BUG_ON((int32_t)disp != disp);                                  \
> > I'm not sure I get the point of using signed integers instead of
> > unsigned ones, AFAICT you just want to check that the displacement is
> > < 4GB so that a relative call can be used?
> 
> Displacements are +/- 2G, not <4G.
> 
> Using unsigned here would be buggy.

Right, sorry for the noise:

Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>

With the minor nits pointed above in the ioemul_handle_quirk.

Thanks, Roger.

