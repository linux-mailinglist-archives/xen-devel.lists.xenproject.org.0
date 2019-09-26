Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D89FBF070
	for <lists+xen-devel@lfdr.de>; Thu, 26 Sep 2019 12:54:10 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iDRNU-0004Hy-9B; Thu, 26 Sep 2019 10:52:04 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=1cs6=XV=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1iDRNT-0004Ho-4A
 for xen-devel@lists.xenproject.org; Thu, 26 Sep 2019 10:52:03 +0000
X-Inumbo-ID: ab91d116-e04b-11e9-964e-12813bfff9fa
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by localhost (Halon) with ESMTPS
 id ab91d116-e04b-11e9-964e-12813bfff9fa;
 Thu, 26 Sep 2019 10:52:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1569495122;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=Ynb2y4PeMFk0p8zu/slITSdesNZSgDfjE1u52wNd9qc=;
 b=c+zKXf5RCqIG+auhTNZX8UiTpgCWSRsjcR5qVN4MjWp5/cblwdKls+30
 4fbE3pzBz9M29aVFx8uYhi9aHPyTavBaoq0gYQTvR3uIgsDAwBgxsf3Rc
 FZ5Yo6v1ZROfdIHJDfWyt8WJdfFCpkaVVGKquTv5ljX6omeHLTY7LNjL1 Y=;
Authentication-Results: esa4.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=roger.pau@citrix.com;
 spf=Pass smtp.mailfrom=roger.pau@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 roger.pau@citrix.com) identity=pra; client-ip=162.221.158.21;
 receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa4.hc3370-68.iphmx.com: domain of
 roger.pau@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: 95bkfjz7QsV+hUcmn6elDBWYSboQbIAJ1R9rv2+aoeyw9/J2zMp7Ri55IYNoRANTcqLHqBbw9Q
 cx+OMhT4U6PQoD7iHb2TulLdhoaiFLwataqsdlVuW2j3xYrf+IJEFutQuiIdjY4RsKZeTgFkaq
 VrIsdF9vfkuCG53w4loIkOftx98UTISYK6llD8IMR4eLLbbk37asP4vKYPHHbL+53tPMCK5f8D
 p8APm4ljkzdoMQZc1RbT8yiLi+9CHWE8fcENGhIFX5PUTxjv9JylPsuBQQJRazJQQOfiPW/H1i
 gR4=
X-SBRS: 2.7
X-MesageID: 6446761
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,551,1559534400"; 
   d="scan'208";a="6446761"
Date: Thu, 26 Sep 2019 12:51:56 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Message-ID: <20190926105156.rv3jhaiwyogmepvt@Air-de-Roger>
References: <20190903161428.7159-1-roger.pau@citrix.com>
 <20190903161428.7159-6-roger.pau@citrix.com>
 <56846f60-fcea-2bef-77b5-84e04e01f98a@suse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <56846f60-fcea-2bef-77b5-84e04e01f98a@suse.com>
User-Agent: NeoMutt/20180716
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 AMSPEX02CL01.citrite.net (10.69.22.125)
Subject: Re: [Xen-devel] [PATCH v2 05/11] ioreq: add internal ioreq
 initialization support
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
Cc: xen-devel@lists.xenproject.org, Paul Durrant <paul.durrant@citrix.com>,
 Wei Liu <wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gRnJpLCBTZXAgMjAsIDIwMTkgYXQgMDE6MTU6MDZQTSArMDIwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4gT24gMDMuMDkuMjAxOSAxODoxNCwgUm9nZXIgUGF1IE1vbm5lIHdyb3RlOgo+ID4gQEAg
LTgyMSw2ICs4NTEsOSBAQCBpbnQgaHZtX2NyZWF0ZV9pb3JlcV9zZXJ2ZXIoc3RydWN0IGRvbWFp
biAqZCwgaW50IGJ1ZmlvcmVxX2hhbmRsaW5nLAo+ID4gICAgICBpZiAoIGkgPj0gTUFYX05SX0lP
UkVRX1NFUlZFUlMgKQo+ID4gICAgICAgICAgZ290byBmYWlsOwo+ID4gIAo+ID4gKyAgICBBU1NF
UlQoKGludGVybmFsICYmCj4gPiArICAgICAgICAgICAgaSA+PSBNQVhfTlJfRVhURVJOQUxfSU9S
RVFfU0VSVkVSUyAmJiBpIDwgTUFYX05SX0lPUkVRX1NFUlZFUlMpIHx8Cj4gPiArICAgICAgICAg
ICAoIWludGVybmFsICYmIGkgPCBNQVhfTlJfRVhURVJOQUxfSU9SRVFfU0VSVkVSUykpOwo+IAo+
IFBlcmhhcHMgZWFzaWVyIHRvIHJlYWQgYm90aCBoZXJlIGFuZCBpbiB0aGUgZXZlbnQgdGhlIGFz
c2VydGlvbgo+IHdvdWxkIGFjdHVhbGx5IHRyaWdnZXIgYXMgZWl0aGVyCj4gCj4gICAgIEFTU0VS
VChpbnRlcm5hbAo+ICAgICAgICAgICAgPyBpID49IE1BWF9OUl9FWFRFUk5BTF9JT1JFUV9TRVJW
RVJTICYmIGkgPCBNQVhfTlJfSU9SRVFfU0VSVkVSUwo+ICAgICAgICAgICAgOiBpIDwgTUFYX05S
X0VYVEVSTkFMX0lPUkVRX1NFUlZFUlMpOwo+IAo+IG9yIGV2ZW4KPiAKPiAgICAgQVNTRVJUKGkg
PCBNQVhfTlJfRVhURVJOQUxfSU9SRVFfU0VSVkVSUwo+ICAgICAgICAgICAgPyAhaW50ZXJuYWwK
PiAgICAgICAgICAgIDogaW50ZXJuYWwgJiYgaSA8IE1BWF9OUl9JT1JFUV9TRVJWRVJTKTsKPiAK
PiA/CgpJIHdlbnQgd2l0aCB0aGUgbGFzdCB2YXJpYXRpb24gb2YgeW91ciBwcm9wb3NlZCBBU1NF
UlQuCgpUaGFua3MsIFJvZ2VyLgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJv
amVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hl
bi1kZXZlbA==
