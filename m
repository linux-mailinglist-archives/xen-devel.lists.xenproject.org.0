Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C7BB13AE3D
	for <lists+xen-devel@lfdr.de>; Tue, 14 Jan 2020 17:01:48 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1irOaa-0008HQ-Fa; Tue, 14 Jan 2020 15:58:44 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=QqHR=3D=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1irOaZ-0008HL-7O
 for xen-devel@lists.xenproject.org; Tue, 14 Jan 2020 15:58:43 +0000
X-Inumbo-ID: b7b0b844-36e6-11ea-a985-bc764e2007e4
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id b7b0b844-36e6-11ea-a985-bc764e2007e4;
 Tue, 14 Jan 2020 15:58:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1579017514;
 h=from:mime-version:content-transfer-encoding:message-id:
 date:to:cc:subject:in-reply-to:references;
 bh=RZAislMrYjp3ATBPqhsuS7t/68BBWBoBTD9j878i9Ks=;
 b=hyD47uKKRd8LyHbOojLeB6A3sG1Nf/l1J/Zj4yCgJ230vH5DmCZMem8Q
 ZBZg8VzHg6+pttyd5xhqlv8pNAMolBusfMmUB+H0OPBlL6xIfXDtD6bCv
 O7svyMsAYMO1wj9vh7w0B5OvZJPp3aWOuX5pX6LaJku4jqml4t3BXU0N9 U=;
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
IronPort-SDR: Cgdtah5DCMzipC/KeA5txJddBVqc+Fl79TtgN6cEwRW887Hx2Ps0Qo2tI2J8b0MTEck8GDntbt
 lby7jR0W0r3mzEP2BxRu8m9w48PkcdNNgKNJFVbI0aaSdQ9SE0lpCXJn0Q2k2OZmwn1Wr9A4nL
 Rb0jIkyw3m90RTITuEpUQLXJ19yUNyXTCPFA7CH1X57mA88Mk9B8doLoCwhnSlO1A/qo34JWhD
 VIVl+zFqaGGvO42ePMnNAESUzgD6czjD1AKbhSlB4BT+WAmGzv0x7Jh2ONK0FKQhN84U1Dt1wV
 Teo=
X-SBRS: 2.7
X-MesageID: 11485414
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.69,433,1571716800"; d="scan'208";a="11485414"
From: Ian Jackson <ian.jackson@citrix.com>
MIME-Version: 1.0
Message-ID: <24093.58662.825393.380461@mariner.uk.xensource.com>
Date: Tue, 14 Jan 2020 15:58:30 +0000
To: Andrew Cooper <andrew.cooper3@citrix.com>
In-Reply-To: <20191224151932.6304-4-andrew.cooper3@citrix.com>
References: <20191224151932.6304-1-andrew.cooper3@citrix.com>
 <20191224151932.6304-4-andrew.cooper3@citrix.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)
Subject: Re: [Xen-devel] [PATCH 03/12] libxc/migration: Rationalise the
 'checkpointed' field to 'stream_type'
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
Cc: Xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wl@xen.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

QW5kcmV3IENvb3BlciB3cml0ZXMgKCJbUEFUQ0ggMDMvMTJdIGxpYnhjL21pZ3JhdGlvbjogUmF0
aW9uYWxpc2UgdGhlICdjaGVja3BvaW50ZWQnIGZpZWxkIHRvICdzdHJlYW1fdHlwZSciKToKPiBP
cmlnaW5hbGx5LCAnY2hlY2twb2ludGVkJyB3YXMgYSBib29sZWFuIHNpZ25hbGxpbmcgdGhlIGRp
ZmZlcmVuY2UgYmV0d2VlbiBhCj4gcGxhaW4gYW5kIGEgUmVtdXMgc3RyZWFtLiAgQ09MTyB3YXMg
YWRkZWQgbGF0ZXIsIGJ1dCBzZXZlcmFsIGJpdHMgb2YgY29kZQo+IHJldGFpbmVkIGJvb2xlYW4t
c3R5bGUgbG9naWMuICBXaGlsZSBjb3JyZWN0LCBpdCBpcyBjb25mdXNpbmcgdG8gZm9sbG93Lgo+
IAo+IEFkZGl0aW9uYWxseSwgWENfTUlHX1NUUkVBTV9OT05FIG1lYW5zICJubyBjaGVja3BvaW50
cyIgYnV0IHJlYWRzIGFzICJubwo+IHN0cmVhbSIuCj4gCj4gQ29uc29saWRhdGUgYWxsIHRoZSBs
b2dpYyBvbiB0aGUgdGVybSAnc3RyZWFtX3R5cGUnLCBhbmQgcmVuYW1lIFNUUkVBTV9OT05FCj4g
dG8gU1RSRUFNX1BMQUlOLiAgUmUtcG9zaXRpb24gdGhlIHN0cmVhbV90eXBlIHZhcmlhYmxlIHNv
IGl0IGlzbid0Cj4gZHVwbGljYXRlZCBpbiBib3RoIHRoZSBzYXZlIGFuZCByZXN0b3JlIHVuaW9u
cy4KCkFja2VkLWJ5OiBJYW4gSmFja3NvbiA8aWFuLmphY2tzb25AZXUuY2l0cml4LmNvbT4KCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBt
YWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMu
eGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
