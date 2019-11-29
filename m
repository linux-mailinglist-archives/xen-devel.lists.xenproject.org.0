Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B56810D50E
	for <lists+xen-devel@lfdr.de>; Fri, 29 Nov 2019 12:41:09 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iaebR-0008JU-Qy; Fri, 29 Nov 2019 11:38:25 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=YUI4=ZV=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1iaebQ-0008JP-E3
 for xen-devel@lists.xenproject.org; Fri, 29 Nov 2019 11:38:24 +0000
X-Inumbo-ID: bfe92b5e-129c-11ea-83b8-bc764e2007e4
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id bfe92b5e-129c-11ea-83b8-bc764e2007e4;
 Fri, 29 Nov 2019 11:38:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1575027503;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=sf4CvjX8BgZHirN3Vk0NUnN9zIXfetsSlfpBUf0OYFg=;
 b=EJIkTOsHFz9VPxhtGt5e2ZvTtanbWVyahtPae2XNJuZitUzpijngTgBV
 F6g5ueiYUhh3duOI5dFkBLNgiEK3dTxHw7xly421o1yCNPE8PpfC6XTVr
 tAb+FcIOOLBvBgtjpXJetsfWvNYKeg6o9DvH6GXGSYZk2Hmu4TJt49rUb o=;
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
IronPort-SDR: UnXC4m3M6U+ewDHNdFDJ7oAQG0CLL7avLc5RTzCfaJzQDVUuh2+VUV/dhVoAmTPYPRrfnnhhbF
 jJxirul2bfPe6ezzvjzQPQ8VIcNMWLlXJBBjmVX6rpEUnS9dR/LZiDvTa6AHV38TZeNVCsbF3z
 IPhtKeQWfCseXMGvURWGyxdlVTHnyzcF3W/0ogvkI1dkPwMFjymcvi9AUqvRqnEAH8sTH4+SQ+
 AbB1X0mxGEamauI9ayEQHGkXHu70G1STmW+nwMo13ngsP+92clqOuzlGWZnmdSyEreg4+MgQuK
 wBY=
X-SBRS: 2.7
X-MesageID: 9338269
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.69,257,1571716800"; 
   d="scan'208";a="9338269"
Date: Fri, 29 Nov 2019 12:38:13 +0100
From: Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
To: <xen-devel@lists.xenproject.org>
Message-ID: <20191129113813.GX980@Air-de-Roger>
References: <20191129112851.19273-1-roger.pau@citrix.com>
 <20191129112851.19273-3-roger.pau@citrix.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191129112851.19273-3-roger.pau@citrix.com>
User-Agent: Mutt/1.12.2 (2019-09-21)
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
Subject: Re: [Xen-devel] [PATCH v2 2/4] x86/apic: force phys mode if
 interrupt remapping is disabled
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 Jan Beulich <jbeulich@suse.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gRnJpLCBOb3YgMjksIDIwMTkgYXQgMTI6Mjg6NDlQTSArMDEwMCwgUm9nZXIgUGF1IE1vbm5l
IHdyb3RlOgo+IENsdXN0ZXIgbW9kZSBjYW4gb25seSBiZSB1c2VkIHdpdGggaW50ZXJydXB0IHJl
bWFwcGluZyBzdXBwb3J0LCBzaW5jZQo+IHRoZSB0b3AgMTZiaXRzIG9mIHRoZSBBUElDIElEIGFy
ZSBmaWxsZWQgd2l0aCB0aGUgY2x1c3RlciBJRCwgYW5kCj4gaGVuY2Ugb24gc3lzdGVtcyB3aGVy
ZSB0aGUgcGh5c2ljYWwgSUQgaXMgc3RpbGwgc21hbGxlciB0aGFuIDI1NSB0aGUKPiBjbHVzdGVy
IElEIGlzIG5vdC4gRm9yY2UgeDJBUElDIHRvIHVzZSBwaHlzaWNhbCBtb2RlIGlmIHRoZXJlJ3Mg
bm8KPiBpbnRlcnJ1cHQgcmVtYXBwaW5nIHN1cHBvcnQuCj4gCj4gTm90ZSB0aGF0IHRoaXMgcmVx
dWlyZXMgYSBmdXJ0aGVyIHBhdGNoIGluIG9yZGVyIHRvIGVuYWJsZSB4MkFQSUMKPiB3aXRob3V0
IGludGVycnVwdCByZW1hcHBpbmcgc3VwcG9ydC4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBSb2dlciBQ
YXUgTW9ubsOpIDxyb2dlci5wYXVAY2l0cml4LmNvbT4KClRoaXMgaXMgbWlzc2luZyBhIGNvbW1h
bmQgbGluZSBkb2MgdXBkYXRlIGFuZCB0aGUgbG9naWMgYmVsb3cgaWdub3JlcwphIHVzZXItc2V0
IHgyYXBpY19waHlzIHZhbHVlLiBXaWxsIHdhaXQgZm9yIGNvbW1lbnRzIG9uIG90aGVyIHBhdGNo
ZXMKYmVmb3JlIHJlc2VuZGluZywgc29ycnkuCgpSb2dlci4KCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRl
dmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFp
bG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
