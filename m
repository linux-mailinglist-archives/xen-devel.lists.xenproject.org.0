Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A44B2E1CF
	for <lists+xen-devel@lfdr.de>; Wed, 29 May 2019 18:02:03 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hW0yH-0007Z3-No; Wed, 29 May 2019 15:58:33 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=CYmT=T5=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1hW0yF-0007Yy-OF
 for xen-devel@lists.xenproject.org; Wed, 29 May 2019 15:58:31 +0000
X-Inumbo-ID: 98a4d8ca-822a-11e9-816f-17dd559f7443
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 98a4d8ca-822a-11e9-816f-17dd559f7443;
 Wed, 29 May 2019 15:58:27 +0000 (UTC)
Authentication-Results: esa4.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=ian.jackson@citrix.com;
 spf=Pass smtp.mailfrom=Ian.Jackson@citrix.com;
 spf=None smtp.helo=postmaster@MIAPEX02MSOL01.citrite.net
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 ian.jackson@citrix.com) identity=pra; client-ip=23.29.105.83;
 receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="ian.jackson@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa4.hc3370-68.iphmx.com: domain of
 Ian.Jackson@citrix.com designates 23.29.105.83 as permitted
 sender) identity=mailfrom; client-ip=23.29.105.83;
 receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="Ian.Jackson@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:23.29.105.83 ip4:162.221.156.50 ~all"
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@MIAPEX02MSOL01.citrite.net) identity=helo;
 client-ip=23.29.105.83; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="postmaster@MIAPEX02MSOL01.citrite.net";
 x-conformance=sidf_compatible
IronPort-SDR: 5pdDhn2IRXvLsl9msgPahckjg86RyVj0Ohwd0gjdGHHQpto6JkkbEU8CE9qn25xrtTXhJ9C7O/
 eZNuFd/JoLiMtpH+Fq1bcW3NSGOjoakU8PsuPge6AllMBhFR7Y0hKWMpzqz1crF49H5Tw5pDqn
 N/AsiXDBGBjm2WI8mJ2VPdtoXp6lPbiwaFACOPWT4WQlSrvTYoRtwK63x4fWDy4GnEOSjwuh+g
 LNAy1SJxQ8tL9PezNlO/Jr9LjvlUAWDaFV1NXp8MC4Dl4kaBrdupYgwhRUdAoZcqwSQTqWWIIN
 rM4=
X-SBRS: 2.7
X-MesageID: 1052140
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 23.29.105.83
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.60,527,1549947600"; 
   d="scan'208";a="1052140"
From: Ian Jackson <ian.jackson@citrix.com>
MIME-Version: 1.0
Message-ID: <23790.44034.186393.25330@mariner.uk.xensource.com>
Date: Wed, 29 May 2019 16:57:54 +0100
To: <stable@vger.kernel.org>
In-Reply-To: <5CE2B0DA0200007800230A08@prv1-mh.provo.novell.com>
References: <E1hSRQF-0006xk-BS@osstest.test-lab.xenproject.org>
 <23778.34168.78221.110803@mariner.uk.xensource.com>
 <20190520114147.GU2798@zion.uk.xensource.com>
 <5CE2B0DA0200007800230A08@prv1-mh.provo.novell.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)
Subject: [Xen-devel] Linux 3.18 no longer boots under Xen, Xen CI dropping it
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
Cc: Juergen Gross <jgross@suse.com>, Lars Kurth <lars.kurth@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 Paul Durrant <Paul.Durrant@citrix.com>, Jan Beulich <JBeulich@suse.com>,
 xen-devel <xen-devel@lists.xenproject.org>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

TGludXggMy4xOCBubyBsb25nZXIgYm9vdHMgdW5kZXIgWGVuLgoKVGhpcyBoYXMgYmVlbiB0cnVl
IGZvciBvdmVyIGhhbGYgYSB5ZWFyLiAgVGhlIFhlbiBwcm9qZWN0IENJIGhhcyBiZWVuCnNlbmRp
bmcgYXV0b21hdGljIG1haWxzIGluY2x1ZGluZyBiaXNlY3Rpb24gcmVwb3J0cyAoc2VlIGJlbG93
KS4KSSBlbWFpbGVkIFhlbiBrZXJuZWwgZm9sa3MgYW5kIGdvdCBubyB0YWtlcnMgZm9yIGZpeGlu
ZyB0aGlzLgoKVW5sZXNzIHRoaXMgaXMgZml4ZWQgc29vbiwgb3IgYXQgbGVhc3Qgc29tZW9uZSBz
aG93cyBzb21lIGluY2xpbmF0aW9uCnRvIGludmVzdGlnYXRlIHRoaXMgcmVncmVzc2lvbiwgSSBp
bnRlbmQgdG8gZHJvcCBhbGwgdGVzdGluZyBvZiB0aGlzCiJzdGFibGUiIGJyYW5jaC4gIEl0IGhh
cyByb3R0ZWQgYW5kIG5vLW9uZSBpcyBmaXhpbmcgaXQuCgo+ID4+ID4gKioqIEZvdW5kIGFuZCBy
ZXByb2R1Y2VkIHByb2JsZW0gY2hhbmdlc2V0ICoqKgo+ID4+ID4gCj4gPj4gPiAgIEJ1ZyBpcyBp
biB0cmVlOiAgbGludXggCj4gPiBnaXQ6Ly9naXQua2VybmVsLm9yZy9wdWIvc2NtL2xpbnV4L2tl
cm5lbC9naXQvc3RhYmxlL2xpbnV4LXN0YWJsZS5naXQKPiA+PiA+ICAgQnVnIGludHJvZHVjZWQ6
ICA2YjFhZTUyN2IxZmRlZTg2ZTgxZGEwY2IyNmNlZDc1NzMxYzZjMGZhCj4gPj4gPiAgIEJ1ZyBu
b3QgcHJlc2VudDogYmE2OTg0ZmMwMTYyZjI0YTUxMGViYzM0ZTg4MWI1NDZiNjljNTUzYgo+ID4+
ID4gICBMYXN0IGZhaWwgcmVwcm86IGh0dHA6Ly9sb2dzLnRlc3QtbGFiLnhlbnByb2plY3Qub3Jn
L29zc3Rlc3QvbG9ncy8xMzY1NzQvIAo+ID4gCj4gPiBJdCBzZWVtcyB0aGF0IHRoZXJlIGlzIHNv
bWV0aGluZyB3cm9uZyB3aXRoIHRoZSBJR0IgZHJpdmVyLgoKQWRkaXRpb25hbGx5LCBKYW4gQmV1
bGljaCB3cml0ZXM6Cj4gV2hpY2ggaW4gdHVybiByZW1pbmRzIG1lIG9mIGEgcGF0Y2ggb2YgbWlu
ZSB0aGF0IHdhcyBiYWNrcG9ydGVkCj4gKGFuZCBzcG90dGVkIGJ5IGFuIGVhcmxpZXIgYmlzZWN0
aW9uKSwgYW5kIHRoYXQgSSd2ZSBzdWdnZXN0ZWQKPiAodHdpY2UgYWxyZWFkeSBpaXJjKSB3YXMg
ZWl0aGVyIGJhY2twb3J0ZWQgaW4gZXJyb3IsIG9yIHdpdGhvdXQgc29tZQo+IGZ1cnRoZXIgbmVj
ZXNzYXJ5IGNoYW5nZXMuIElpcmMgdGhlIHN0YWJsZSB0cmVlIG1haW50YWluZXIgZm9yIHRoYXQK
PiBicmFuY2ggd2FzIENjLWVkIGJhY2sgdGhlbiwgYW5kIGlmIHNvIEknZCBjb25jbHVkZSBoZSBk
b2Vzbid0IGNhcmUuCgpUaGFua3MsCklhbi4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3Rz
LnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0
aW5mby94ZW4tZGV2ZWw=
