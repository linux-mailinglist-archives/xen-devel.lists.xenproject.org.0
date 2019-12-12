Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9801611CC8B
	for <lists+xen-devel@lfdr.de>; Thu, 12 Dec 2019 12:49:38 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ifMvS-0003Uy-66; Thu, 12 Dec 2019 11:46:34 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=EVwC=2C=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1ifMvQ-0003Us-JT
 for xen-devel@lists.xenproject.org; Thu, 12 Dec 2019 11:46:32 +0000
X-Inumbo-ID: 057d6562-1cd5-11ea-b6f1-bc764e2007e4
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 057d6562-1cd5-11ea-b6f1-bc764e2007e4;
 Thu, 12 Dec 2019 11:46:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1576151183;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=/nxsGOBE3z4PzlqxdwsQCYIwr15kAEC2A0iA/M8NzNg=;
 b=icICU74h003kifl2jdm+et2D3XyEB/t2n2OKVEVCcGgCUxRwFHU86tlM
 9mxtm+IS4VBf5YSMZJIclIXAHzRqIYiFedlueLeW8PJ14Q2KPQsIQCoHP
 9mywOaI9VdnrkeTDm37NYK21wx309rz+F2MNRjKyad6fdUKuxmB7DvnV5 k=;
Authentication-Results: esa5.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=roger.pau@citrix.com;
 spf=Pass smtp.mailfrom=roger.pau@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 roger.pau@citrix.com) identity=pra; client-ip=162.221.158.21;
 receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa5.hc3370-68.iphmx.com: domain of
 roger.pau@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com";
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
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: XQ11SJm5VCacmy8DmwUR5YBttttsCxa7c+4A6W5FO1lnetauOgWcBAilaBYOG9mjh8og6E3E7k
 d80WC/dPXXp7i7xvlxin2xOzS6ZEj9NH9TmKSZdDqAt2bj54bVwMAiEI7tdLcAiE+j9CfaYKWO
 pZkPtYjN+yWKdCifxyVjGfk4fvf4j2dhKFNM7remQHt4HVxXGwqwGzumCPmBnssCTJRCv7h45i
 VcJsqxjiLT/VcVDb0Qz6li+5fFT09GmlRKpT2gAbnYu1RJRQs5xKEpSw/h+OfZSNXQu3rpsF0m
 g0g=
X-SBRS: 2.7
X-MesageID: 9932140
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.69,305,1571716800"; 
   d="scan'208";a="9932140"
Date: Thu, 12 Dec 2019 12:46:16 +0100
From: Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
To: Paul Durrant <pdurrant@amazon.com>
Message-ID: <20191212114616.GC11756@Air-de-Roger>
References: <20191211152956.5168-1-pdurrant@amazon.com>
 <20191211152956.5168-5-pdurrant@amazon.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191211152956.5168-5-pdurrant@amazon.com>
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 AMSPEX02CL03.citrite.net (10.69.22.127)
Subject: Re: [Xen-devel] [PATCH v3 4/4] xen-blkback: support dynamic
 unbind/bind
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
Cc: Jens Axboe <axboe@kernel.dk>, Juergen Gross <jgross@suse.com>, Stefano
 Stabellini <sstabellini@kernel.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, linux-kernel@vger.kernel.org,
 linux-block@vger.kernel.org, xen-devel@lists.xenproject.org,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gV2VkLCBEZWMgMTEsIDIwMTkgYXQgMDM6Mjk6NTZQTSArMDAwMCwgUGF1bCBEdXJyYW50IHdy
b3RlOgo+IEJ5IHNpbXBseSByZS1hdHRhY2hpbmcgdG8gc2hhcmVkIHJpbmdzIGR1cmluZyBjb25u
ZWN0X3JpbmcoKSByYXRoZXIgdGhhbgo+IGFzc3VtaW5nIHRoZXkgYXJlIGZyZXNobHkgYWxsb2Nh
dGVkIChpLmUgYXNzdW1pbmcgdGhlIGNvdW50ZXJzIGFyZSB6ZXJvKQo+IGl0IGlzIHBvc3NpYmxl
IGZvciB2YmQgaW5zdGFuY2VzIHRvIGJlIHVuYm91bmQgYW5kIHJlLWJvdW5kIGZyb20gYW5kIHRv
Cj4gKHJlc3BlY3RpdmVseSkgYSBydW5uaW5nIGd1ZXN0Lgo+IAo+IFRoaXMgaGFzIGJlZW4gdGVz
dGVkIGJ5IHJ1bm5pbmc6Cj4gCj4gd2hpbGUgdHJ1ZTsKPiAgIGRvIGZpbyAtLW5hbWU9cmFuZHdy
aXRlIC0taW9lbmdpbmU9bGliYWlvIC0taW9kZXB0aD0xNiBcCj4gICAtLXJ3PXJhbmR3cml0ZSAt
LWJzPTRrIC0tZGlyZWN0PTEgLS1zaXplPTFHIC0tdmVyaWZ5PWNyYzMyOwo+ICAgZG9uZQo+IAo+
IGluIGEgUFYgZ3Vlc3Qgd2hpbHN0IHJ1bm5pbmc6Cj4gCj4gd2hpbGUgdHJ1ZTsKPiAgIGRvIGVj
aG8gdmJkLSRET01JRC0kVkJEID51bmJpbmQ7Cj4gICBlY2hvIHVuYm91bmQ7Cj4gICBzbGVlcCA1
Owo+ICAgZWNobyB2YmQtJERPTUlELSRWQkQgPmJpbmQ7Cj4gICBlY2hvIGJvdW5kOwo+ICAgc2xl
ZXAgMzsKPiAgIGRvbmUKPiAKPiBpbiBkb20wIGZyb20gL3N5cy9idXMveGVuLWJhY2tlbmQvZHJp
dmVycy92YmQgdG8gY29udGludW91c2x5IHVuYmluZCBhbmQKPiByZS1iaW5kIGl0cyBzeXN0ZW0g
ZGlzayBpbWFnZS4KPiAKPiBUaGlzIGlzIGEgaGlnaGx5IHVzZWZ1bCBmZWF0dXJlIGZvciBhIGJh
Y2tlbmQgbW9kdWxlIGFzIGl0IGFsbG93cyBpdCB0byBiZQo+IHVubG9hZGVkIGFuZCByZS1sb2Fk
ZWQgKGkuZS4gdXBkYXRlZCkgd2l0aG91dCByZXF1aXJpbmcgZG9tVXMgdG8gYmUgaGFsdGVkLgo+
IFRoaXMgd2FzIGFsc28gdGVzdGVkIGJ5IHJ1bm5pbmc6Cj4gCj4gd2hpbGUgdHJ1ZTsKPiAgIGRv
IGVjaG8gdmJkLSRET01JRC0kVkJEID51bmJpbmQ7Cj4gICBlY2hvIHVuYm91bmQ7Cj4gICBzbGVl
cCA1Owo+ICAgcm1tb2QgeGVuLWJsa2JhY2s7Cj4gICBlY2hvIHVubG9hZGVkOwo+ICAgc2xlZXAg
MTsKPiAgIG1vZHByb2JlIHhlbi1ibGtiYWNrOwo+ICAgZWNobyBib3VuZDsKPiAgIGNkICQocHdk
KTsKPiAgIHNsZWVwIDM7Cj4gICBkb25lCj4gCj4gaW4gZG9tMCB3aGlsc3QgcnVubmluZyB0aGUg
c2FtZSBsb29wIGFzIGFib3ZlIGluIHRoZSAoc2luZ2xlKSBQViBndWVzdC4KPiAKPiBTb21lIChs
ZXNzIHN0cmVzc2Z1bCkgdGVzdGluZyBoYXMgYWxzbyBiZWVuIGRvbmUgdXNpbmcgYSBXaW5kb3dz
IEhWTSBndWVzdAo+IHdpdGggdGhlIGxhdGVzdCA5LjAgUFYgZHJpdmVycyBpbnN0YWxsZWQuCj4g
Cj4gU2lnbmVkLW9mZi1ieTogUGF1bCBEdXJyYW50IDxwZHVycmFudEBhbWF6b24uY29tPgoKUmV2
aWV3ZWQtYnk6IFJvZ2VyIFBhdSBNb25uw6kgPHJvZ2VyLnBhdUBjaXRyaXguY29tPgoKVGhhbmtz
IQoKSnVlcmdlbjogSSBndWVzcyB5b3Ugd2lsbCBhbHNvIHBpY2sgdGhpcyBzZXJpZXMgYW5kIG1l
cmdlIGl0IGZyb20gdGhlClhlbiB0cmVlIGluc3RlYWQgb2YgdGhlIGJsb2NrIG9uZT8KClJvZ2Vy
LgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRl
dmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9s
aXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
