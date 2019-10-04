Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 73474CC023
	for <lists+xen-devel@lfdr.de>; Fri,  4 Oct 2019 18:07:12 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iGQ4l-0007Ze-8D; Fri, 04 Oct 2019 16:05:03 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=lQ+Z=X5=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1iGQ4j-0007ZX-EK
 for xen-devel@lists.xenproject.org; Fri, 04 Oct 2019 16:05:01 +0000
X-Inumbo-ID: b7ca5c3e-e6c0-11e9-80e3-bc764e2007e4
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id b7ca5c3e-e6c0-11e9-80e3-bc764e2007e4;
 Fri, 04 Oct 2019 16:05:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1570205101;
 h=from:mime-version:content-transfer-encoding:message-id:
 date:to:cc:subject:in-reply-to:references;
 bh=623VCsWx20d4s3AVAu5aqB92vp5LkFctT+F9t+LIiZw=;
 b=Hr+3JBLw/5u0v/LFt3LY/kesd9gn3G2G+30vqMBySiIHGERvhF+9/CQM
 PwzZtvUm+VPJGjmHho1gX+XrAwOkaDxsC9RjOAJOAZox2oczJyd8886mA
 sK3a6YcIBBNPHigxUkdv6g6DjTprAd2IejmAlTPCGd+HLA5dnaNJ8OCox 8=;
Authentication-Results: esa1.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=ian.jackson@citrix.com;
 spf=Pass smtp.mailfrom=Ian.Jackson@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 ian.jackson@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="ian.jackson@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa1.hc3370-68.iphmx.com: domain of
 Ian.Jackson@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="Ian.Jackson@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: c1OD3qj74DSGmtGqcq0zh4AagZnmz0nfL89bxE0TKp7ol+hNhTZwams+s9EXvmFJvCvV5nI0Jy
 E4GpHqZe0Dlr+KAI0A6v7DUSm8lEsnSSt2pPTgJuSQa0m/ZDYqDRoyVsi9+OWZiMTNQzzOrWnD
 gvi6xtaxdxoFmaW5S7zPvEYpDr5T9P7288f7rNfqz44k4Bu9ml3l8YLRfxmL3F/adiFabMHK48
 DgCtF8dpjgr9d9Xn/HvdVVEG2OnV+FIPLnqTIxzvH5LYPm0hKxBFcq3RhcMKwjEUliBiOa3Dr3
 LkE=
X-SBRS: 2.7
X-MesageID: 6555308
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.67,256,1566878400"; 
   d="scan'208";a="6555308"
From: Ian Jackson <ian.jackson@citrix.com>
MIME-Version: 1.0
Message-ID: <23959.28043.718413.994044@mariner.uk.xensource.com>
Date: Fri, 4 Oct 2019 17:04:27 +0100
To: Anthony PERARD <anthony.perard@citrix.com>
In-Reply-To: <20191004155349.GM1163@perard.uk.xensource.com>
References: <20191004151707.24844-1-ian.jackson@eu.citrix.com>
 <20191004151707.24844-4-ian.jackson@eu.citrix.com>
 <20191004155349.GM1163@perard.uk.xensource.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)
Subject: Re: [Xen-devel] [XEN PATCH for-4.13 3/6] libxl:
 libxl__domain_config_setdefault: New function
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
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Wei Liu <wl@xen.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

QW50aG9ueSBQRVJBUkQgd3JpdGVzICgiUmU6IFtYRU4gUEFUQ0ggZm9yLTQuMTMgMy82XSBsaWJ4
bDogbGlieGxfX2RvbWFpbl9jb25maWdfc2V0ZGVmYXVsdDogTmV3IGZ1bmN0aW9uIik6Cj4gT24g
RnJpLCBPY3QgMDQsIDIwMTkgYXQgMDQ6MTc6MDRQTSArMDEwMCwgSWFuIEphY2tzb24gd3JvdGU6
Cj4gPiArICAgIGxpYnhsX19kb21haW5fY29uZmlnX3NldGRlZmF1bHQoZ2MsZF9jb25maWcsZG9t
aWQpOwo+IAo+IFNob3VsZG4ndCB5b3UgY2hlY2sgZm9yIGVycm9yID8KCkJsaW1leSwgeWVzISAg
VGhhbmtzIQoKSWFuLgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5v
cmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZl
bA==
