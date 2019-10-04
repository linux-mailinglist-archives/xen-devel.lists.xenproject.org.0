Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CFE7CC1BD
	for <lists+xen-devel@lfdr.de>; Fri,  4 Oct 2019 19:29:10 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iGRK5-00072X-Lc; Fri, 04 Oct 2019 17:24:57 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=UhcM=X5=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1iGRK3-00072L-SU
 for xen-devel@lists.xenproject.org; Fri, 04 Oct 2019 17:24:55 +0000
X-Inumbo-ID: e17cdf7e-e6cb-11e9-975e-12813bfff9fa
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id e17cdf7e-e6cb-11e9-975e-12813bfff9fa;
 Fri, 04 Oct 2019 17:24:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1570209895;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=IKUVDkW0KNCKICzv7a6q7TBRGSfcG9ly9WXBa819e3o=;
 b=erClbnGFxcPdfjsQEpYrmaOpn9U06sdLHDd52F9YfHLiJLI6NbhqOlgf
 dTaxwfcFin+vMnDlQ19yzKjL7cskaedtpveDGSaGWntfUXcfHLNAl5T+d
 2MK7v+xsbA5PMjYB+Z0ug9MuE8+2cuwPB4jbsHV21+BIM+GjsllkYx6o1 c=;
Authentication-Results: esa5.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=anthony.perard@citrix.com;
 spf=Pass smtp.mailfrom=anthony.perard@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 anthony.perard@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="anthony.perard@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa5.hc3370-68.iphmx.com: domain of
 anthony.perard@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="anthony.perard@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: qSPMDlCnrRXgSzjCQxs2r5NkX0SBlzjmPfktTGRn4j5qwA58cQCGskZPxxu+tPS2M25QdCdFx7
 5R7iF879V2A9HDf3mqIgjIZbg38l00FTy3FZVYF7dBDcFB9Lgv0z+uRpOlJypXxtSGGZtIzMHv
 H5/5GInJd8+bP5w7B7m6+XKeh2j7icUj15zaNdhXZRSuWHMuVZD5fvJ/+BRZkoXFe8EA+DHLiH
 yW4FXo1psTvosnW6Q/wDUYcPBd6Dxl4VjnPGCMr09TYUzZeEZQHRoMKqGCEhLoHg+xL+GkyisE
 V5Q=
X-SBRS: 2.7
X-MesageID: 6739996
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.67,257,1566878400"; 
   d="scan'208";a="6739996"
Date: Fri, 4 Oct 2019 18:24:52 +0100
From: Anthony PERARD <anthony.perard@citrix.com>
To: Ian Jackson <ian.jackson@eu.citrix.com>
Message-ID: <20191004172452.GA18712@perard.uk.xensource.com>
References: <20191004151707.24844-1-ian.jackson@eu.citrix.com>
 <20191004151707.24844-3-ian.jackson@eu.citrix.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191004151707.24844-3-ian.jackson@eu.citrix.com>
User-Agent: Mutt/1.12.2 (2019-09-21)
Subject: Re: [Xen-devel] [XEN PATCH for-4.13 2/6] xl: Pass
 libxl_domain_config to freemem(), instead of b_info
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
Cc: =?iso-8859-1?Q?J=FCrgen_Gro=DF?= <jgross@suse.com>,
 xen-devel@lists.xenproject.org, Wei Liu <wl@xen.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gRnJpLCBPY3QgMDQsIDIwMTkgYXQgMDQ6MTc6MDNQTSArMDEwMCwgSWFuIEphY2tzb24gd3Jv
dGU6Cj4gV2UgYXJlIGdvaW5nIHRvIGNoYW5nZSB0aGUgbGlieGwgQVBJIGluIGEgbW9tZW50IGFu
ZCB0aGlzIGNoYW5nZSB3aWxsCj4gbWFrZSBpdCBzaW1wbGVyLgo+IAo+IFNpZ25lZC1vZmYtYnk6
IElhbiBKYWNrc29uIDxpYW4uamFja3NvbkBldS5jaXRyaXguY29tPgoKUmV2aWV3ZWQtYnk6IEFu
dGhvbnkgUEVSQVJEIDxhbnRob255LnBlcmFyZEBjaXRyaXguY29tPgoKLS0gCkFudGhvbnkgUEVS
QVJECgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4t
ZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczov
L2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
