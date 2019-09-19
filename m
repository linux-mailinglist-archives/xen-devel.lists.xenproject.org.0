Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DDB6BB7D2B
	for <lists+xen-devel@lfdr.de>; Thu, 19 Sep 2019 16:48:27 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iAxh9-0001ST-SG; Thu, 19 Sep 2019 14:46:07 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=vwgP=XO=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1iAxh8-0001S5-QZ
 for xen-devel@lists.xenproject.org; Thu, 19 Sep 2019 14:46:06 +0000
X-Inumbo-ID: 34fab0f4-daec-11e9-9661-12813bfff9fa
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 34fab0f4-daec-11e9-9661-12813bfff9fa;
 Thu, 19 Sep 2019 14:46:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1568904365;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=9Z0pI5RDzGOyUXvvERforF4FhzEK0JsU6tEsYxXcFo4=;
 b=Hjab+PmWT/nPH/KW1ay0nTIAvt9zULX1zQQLrmLu22ncxHdX7dOuJ0jn
 X0LAZdqFoRa3+l622gXaC+baUUkWQXKOY0kNjJrhx6TI8H3JYT6JOguyh
 gfvWzRVUpPs/hQD5XLubboWslQD7KZkw9DyLjKXGCb3kR9tjgyX1ITmev s=;
Authentication-Results: esa1.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=anthony.perard@citrix.com;
 spf=Pass smtp.mailfrom=anthony.perard@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 anthony.perard@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="anthony.perard@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa1.hc3370-68.iphmx.com: domain of
 anthony.perard@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="anthony.perard@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: MCm3VrAfOP09JLhnfT+g5WRzZbCpW+TH+TSPsQdjplvg29qFP9vLA+YEfPdZ2DGzYkFRB+H2TS
 UdU1pxsFbaoUy7XsJlmN00Uht8kFMb/DOpFARbZkcOaZubvCzoKuSB7MsTC75Log1TfoIVX9Yi
 wGbWb2711bp4JHaWjTv1uVL3DL9bT8deFnK2HfJPAFY2/5UH1Dc2e1tkSp1wmgJL7OSifefj5N
 OPgAr456QuJ6XYWpo7BBEGhlQtHz0ZIckVlyCuV9JxrBpgwGLGg1RDWzrh8z5V5IYbI5AYdR8l
 Wm8=
X-SBRS: 2.7
X-MesageID: 5853626
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,523,1559534400"; 
   d="scan'208";a="5853626"
Date: Thu, 19 Sep 2019 15:46:02 +0100
From: Anthony PERARD <anthony.perard@citrix.com>
To: Ian Jackson <ian.jackson@citrix.com>
Message-ID: <20190919144602.GT1308@perard.uk.xensource.com>
References: <20190802153606.32061-1-anthony.perard@citrix.com>
 <20190802153606.32061-34-anthony.perard@citrix.com>
 <23937.6898.699406.584772@mariner.uk.xensource.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <23937.6898.699406.584772@mariner.uk.xensource.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
Subject: Re: [Xen-devel] [PATCH 33/35] libxl: Extract qmp_parse_query_cpus
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
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Wei Liu <wl@xen.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVHVlLCBTZXAgMTcsIDIwMTkgYXQgMDY6NDI6MTBQTSArMDEwMCwgSWFuIEphY2tzb24gd3Jv
dGU6Cj4gQW50aG9ueSBQRVJBUkQgd3JpdGVzICgiW1BBVENIIDMzLzM1XSBsaWJ4bDogRXh0cmFj
dCBxbXBfcGFyc2VfcXVlcnlfY3B1cyIpOgo+ID4gVGhlIFFNUCBjb21tYW5kICJxdWVyeS1jcHVz
IiBpcyBjYWxsZWQgZnJvbSBkaWZmZXJlbnQgcGxhY2VzLCBleHRyYWN0Cj4gPiB0aGUgYWxnb3Jp
dGhtIHRoYXQgcGFyc2UgdGhlIGFuc3dlciBpbnRvIGEgc2VwYXJhdGUgZnVuY3Rpb24uCj4gCj4g
SSBob3BlIHlvdSBtZWFudCB0byB3cml0ZSAiTm8gZnVuY3Rpb25hbCBjaGFuZ2UuIgoKSXQgd2Fz
IHN1cHBvc2VkIHRvIGJlIHRoYXQgd2F5LCBidXQgcGFydCBvZiB0aGUgY2hhbmdlcyBpbiB0aGlz
IHBhdGNoCnNob3VsZCBiZSBpbiB0aGUgcHJldmlvdXMgcGF0Y2guIEl0IGFsc28gZml4IHRoZSBw
cmV2aW91cyBwYXRjaCB3aGljaAp3b24ndCB3b3JrIG9uIGl0J3Mgb3duLgoKSSB0aGluayBJJ20g
Z29pbmcgdG8gc3F1YXNoIGJvdGggcGF0Y2ggdG9nZXRoZXIgYW5kIGxlYXZlIGEgbm90ZSBpbiB0
aGUKY29tbWl0IGRlc2NyaXB0aW9uIGFzIHRvIHdoeSB0aGUgZnVuY3Rpb24gcW1wX3BhcnNlX3F1
ZXJ5X2NwdXMgZXhpc3QsCnRoYXQgaXM6CiAgICBsaWJ4bDogVXNlIGV2X3FtcCBpbiBsaWJ4bF9z
ZXRfdmNwdW9ubGluZQogICAgbGlieGw6IEV4dHJhY3QgcW1wX3BhcnNlX3F1ZXJ5X2NwdXMKCi0t
IApBbnRob255IFBFUkFSRAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVj
dC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1k
ZXZlbA==
