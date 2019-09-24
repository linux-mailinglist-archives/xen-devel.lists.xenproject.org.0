Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CD82BCA17
	for <lists+xen-devel@lfdr.de>; Tue, 24 Sep 2019 16:20:54 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iCldV-00075Q-Ek; Tue, 24 Sep 2019 14:17:49 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Wx4c=XT=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1iCldU-00075E-9K
 for xen-devel@lists.xenproject.org; Tue, 24 Sep 2019 14:17:48 +0000
X-Inumbo-ID: 1515d3e8-ded6-11e9-961e-12813bfff9fa
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by localhost (Halon) with ESMTPS
 id 1515d3e8-ded6-11e9-961e-12813bfff9fa;
 Tue, 24 Sep 2019 14:17:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1569334668;
 h=from:mime-version:content-transfer-encoding:message-id:
 date:to:subject:in-reply-to:references;
 bh=ugJ8UbEUWkI5FYjTRRaDJtnyQy/URM2ylAxXO8OYNgo=;
 b=hERLKnY1RTOgURXKuOPpq9ApGqK9CbnOOHx1wirRF20Ju4iLf19esP7M
 RCJfVqFhErU4hGerbjttOXzHwDxM9S7JSTXZbm6/tTXvYAE9NBGijQVeO
 uiR9yWcwBgs3EavxK0/vc1w9//n36nzbMysS5EStkKNS0iF2FuC5RySbC c=;
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
IronPort-SDR: XdeGru6qB5JDf0MkkCmDpjsNY/UTvBJknAttglA5sdEicsxTfYdqivYdispYW8ZMDh8HtdejIP
 rrgpG0Vfw7hpY1ghQqF620kxo4LUdRgL7isbEhyDDm0bTgH6J2yl7uT15RscAfIz7WF49sxglT
 U3zslxZmOjKmrSeS9Sr3ljF0pXuhgAVt6VcKuP+MdLAvj5P1K/6UhY7bxBvsVUAoOy5Zgy6rfM
 Pm1BJMq3US5BijPVWYjdYUst3BAcoLBqGYHGSkbSA/sn+QgcPk/YlKmrJoQUKOkeJRuhEZieBz
 hyg=
X-SBRS: 2.7
X-MesageID: 6057071
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,544,1559534400"; 
   d="scan'208";a="6057071"
From: Ian Jackson <ian.jackson@citrix.com>
MIME-Version: 1.0
Message-ID: <23946.9607.887344.235099@mariner.uk.xensource.com>
Date: Tue, 24 Sep 2019 15:17:43 +0100
To: Olaf Hering <olaf@aepfle.de>, "xen-devel@lists.xenproject.org"
 <xen-devel@lists.xenproject.org>, Wei Liu <wl@xen.org>
In-Reply-To: <23946.9142.652599.628334@mariner.uk.xensource.com>
References: <20190924140319.11303-1-olaf@aepfle.de>
 <20190924140319.11303-3-olaf@aepfle.de>
 <23946.9142.652599.628334@mariner.uk.xensource.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)
Subject: Re: [Xen-devel] [PATCH RESEND v1 2/8] tools: move scripts from etc
 to libexec
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SWFuIEphY2tzb24gd3JpdGVzICgiUmU6IFtQQVRDSCBSRVNFTkQgdjEgMi84XSB0b29sczogbW92
ZSBzY3JpcHRzIGZyb20gZXRjIHRvIGxpYmV4ZWMiKToKPiBPbGFmIEhlcmluZyB3cml0ZXMgKCJb
UEFUQ0ggUkVTRU5EIHYxIDIvOF0gdG9vbHM6IG1vdmUgc2NyaXB0cyBmcm9tIGV0YyB0byBsaWJl
eGVjIik6Cj4gPiBJbiB0aGUgbmVhciBmdXR1cmUgYWxsIGZyZXNoIGluc3RhbGxhdGlvbnMgd2ls
bCBoYXZlIGFuIGVtcHR5IC9ldGMuCj4gCj4gRXJyLCBubyA/CgpNb3JlIGNvbnN0cnVjdGl2ZWx5
OgoKSSB0aGluayB0aGUgYWJpbGl0eSBvZiB0aGUgYWRtaW4gdG8gZWRpdCB0aGVzZSBzY3JpcHRz
IGlzIGltcG9ydGFudAphbmQgSSBoYXZlIHVzZWQgaXQgbXlzZWxmIGluIHRoZSBwYXN0LiAgV2l0
aCBteSBEZWJpYW4gWGVuIG1haW50YWluZXIKaGF0IG9uIEkgaGF2ZSBubyBpbnRlbnRpb24gb2Yg
bW92aW5nIHRoZXNlIGZpbGVzIG91dCBvZiAvZXRjLgoKSWYgdGhlIG1haW50YWluZXIgb2YgWGVu
IGluIHNvbWUgb3RoZXIgZGlzdHJvIHdpc2hlcyB0byBwdXQgdGhlc2UKZmlsZXMgaW4gL3Vzci9s
aWIgYW5kIGNvbnNlcXVlbnRseSBtYWtlIHRoZW0gaGFyZGVyIHRvIGVkaXQgdGhlbgooMSkgbXkg
YWR2aWNlIGFzIFhlbiB1cHN0cmVhbSB0b29scyBtYWludGFpbmVyIGlzIHRoYXQgdGhpcyB3b3Vs
ZCBiZSBhCmJhZCBpZGVhICgyKSBpZiB0aGF0IG1haW50YWluZXIgd2FudHMgdG8gcGVyc2lzdCB3
aXRoIHRoaXMgdGhlbiB0aGV5CnNob3VsZCBkbyB0aGlzIGluIHRoZSBwYWNrYWdlcyBmb3IgdGhl
aXIgZGlzdHJvLgoKSW4gc3VwcG9ydCBvZiAoMiksIEkgd291bGQgd2VsY29tZSBwYXRjaGVzIHRo
YXQgbWFrZSBpdCBlYXNpZXIgZm9yIGEKZGlzdHJvIG1haW50YWluZXIgdG8gbWFrZSB0aGVzZSBr
aW5kIG9mIGNob2ljZXMuCgpSaWdodCBub3cgbXkgdmlldyBpcyB0aGF0IEkgZG8gbm90IHRoaW5r
IGl0IHdvdWxkIGJlIGFwcHJvcHJpYXRlIHRvCmNoYW5nZSB0aGUgdXBzdHJlYW0gZGVmYXVsdCwg
cmVnYXJkbGVzcyBvZiB0aGUgaW5zdGFsbGF0aW9uIHRhcmdldApvcGVyYXRpbmcgc3lzdGVtLCBi
dXQgSSBtaWdodCBiZSBvcGVuIHRvIGFyZ3VtZW50IG9uIHRoYXQgZm9yIHNwZWNpZmljCnRhcmdl
dCBvcGVyYXRpbmcgc3lzdGVtcyBpZiB0aGUgYXBwcm9wcmlhdGUgZGlzdHJvIG1haW50YWluZXJz
IHdlcmUgdG8KbWFrZSBhIGNhc2UuCgpJIGhvcGUgdGhpcyBoZWxwcy4KClRoYW5rcywKSWFuLgoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
