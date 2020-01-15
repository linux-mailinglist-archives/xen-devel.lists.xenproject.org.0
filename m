Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0700C13BDB5
	for <lists+xen-devel@lfdr.de>; Wed, 15 Jan 2020 11:42:56 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1irg59-00043P-7X; Wed, 15 Jan 2020 10:39:27 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=eK3x=3E=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1irg57-00043K-QB
 for xen-devel@lists.xenproject.org; Wed, 15 Jan 2020 10:39:25 +0000
X-Inumbo-ID: 475120aa-3783-11ea-b89f-bc764e2007e4
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 475120aa-3783-11ea-b89f-bc764e2007e4;
 Wed, 15 Jan 2020 10:39:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1579084756;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=btnkOpot/RdVmeVNe6GmCP/d8h6CtMK88KTdaX7Svwc=;
 b=e1qmN0hrSlVgByoyWJqUAWHzMMD0UbvlQaqJHg8GwRkOqsbwSCeq3QnN
 8JLZGgYuurAWk0mZE85JMgiNctMKTn2+WUS6WSc6A6SOshvJRTIftebGV
 jSmVo5yN70Mg1AoeGkx9hlOZTnDqp23Sc5bLq6dkhZ4ROSbmHgZ27WMMG M=;
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
IronPort-SDR: AckizrKFw6drgXwIVi4og560jutKzqbkqAUvDY1C+vqgMCSikMCiSpyZOPZRrT0Ebq/qkOcb2z
 v9HJBZ4A99YM6f/2Dw+bUa0COQ3FkESs9XaApsdYD7Sf8DgehMVZUIUWmpddRlckRH4Qztrs33
 JpHo3hUIgm7I7xwdl90n/OSRPVtHhq2IHL6zOi1Tzv/7jnKK/FIRd9pcPJ1NYQ62JjekJgfXAm
 db07fAsD5CEQqhDnn59XmjX59V1Wf8Q2sdrSvIQaZeFxKHFmoJ8lpGcardt1fmAyqSKUZBl3o/
 unw=
X-SBRS: 2.7
X-MesageID: 11305970
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,322,1574139600"; d="scan'208";a="11305970"
Date: Wed, 15 Jan 2020 11:39:10 +0100
From: Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <20200115103910.GK11756@Air-de-Roger>
References: <20200114203545.8897-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200114203545.8897-1-andrew.cooper3@citrix.com>
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL01.citrite.net (10.69.22.125)
Subject: Re: [Xen-devel] [PATCH] xen/list: Remove prefetching
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Jan Beulich <JBeulich@suse.com>,
 Xen-devel <xen-devel@lists.xenproject.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVHVlLCBKYW4gMTQsIDIwMjAgYXQgMDg6MzU6NDVQTSArMDAwMCwgQW5kcmV3IENvb3BlciB3
cm90ZToKPiBYZW4gaW5oZXJpdGVkIGl0cyBsaXN0IGluZnJhc3RydWN0dXJlIGZyb20gTGludXgu
ICBPbmUgYXJlYSB3aGVyZSBoYXMgZmFsbGVuCj4gYmVoaW5kIGlzIHRoYXQgb2YgcHJlZmV0Y2hp
bmcsIHdoaWNoIGFzIGl0IHR1cm5zIG91dCBpcyBhIHBlcmZvcm1hbmNlIHBlbmFsdHkKPiBpbiBt
b3N0IGNhc2VzLgo+IAo+IFByZWZldGNoIG9mIE5VTEwgb24geDg2IGlzIG5vdyB3aWRlbHkgbWVh
c3VyZWQgdG8gaGF2ZSBnbGFjaWFsIHBlcmZvcm1hbmNlCj4gcHJvcGVydGllcywgYW5kIHdpbGwg
dW5jb25kaXRpb25hbGx5IGhpdCBvbiBldmVyeSBobGlzdCB1c2UgZHVlIHRvIHRoZQo+IHRlcm1p
bmF0aW9uIGNvbmRpdGlvbi4KPiAKPiBDcm9zcy1wb3J0IHRoZSBmb2xsb3dpbmcgTGludXggcGF0
Y2hlczoKPiAKPiAgIDc1ZDY1YTQyNWMgKDIwMTEpICJobGlzdDogcmVtb3ZlIHNvZnR3YXJlIHBy
ZWZldGNoaW5nIGluIGhsaXN0IGl0ZXJhdG9ycyIKPiAgIGU2NmVlZDY1MWYgKDIwMTEpICJsaXN0
OiByZW1vdmUgcHJlZmV0Y2hpbmcgZnJvbSByZWd1bGFyIGxpc3QgaXRlcmF0b3JzIgo+ICAgYzBk
MTVjYzdlZSAoMjAxMykgImxpbmtlZC1saXN0OiBSZW1vdmUgX19saXN0X2Zvcl9lYWNoIgo+IAo+
IHRvIFhlbiwgd2hpY2ggcmVzdWx0cyBpbiB0aGUgZm9sbG93aW5nIG5ldCBkaWZmc3RhdCBvbiB4
ODY6Cj4gCj4gICBhZGQvcmVtb3ZlOiAwLzEgZ3Jvdy9zaHJpbms6IDI3LzgzIHVwL2Rvd246IDU3
Ni8tMTY0OCAoLTEwNzIpCj4gCj4gKFRoZSBjb2RlIGFkZGl0aW9ucyBjb21lcyBmcm9tIGEgZmV3
IG5vdy1pbmxpbmVkIGZ1bmN0aW9ucywgYW5kIHNsaWdodGx5Cj4gZGlmZmVyZW50IGJhc2ljIGJs
b2NrIHBhZGRpbmcuKQo+IAo+IE5vIGZ1bmN0aW9uYWwgY2hhbmdlLgo+IAo+IFNpZ25lZC1vZmYt
Ynk6IEFuZHJldyBDb29wZXIgPGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+CgpSZXZpZXdlZC1i
eTogUm9nZXIgUGF1IE1vbm7DqSA8cm9nZXIucGF1QGNpdHJpeC5jb20+CgpIYXMgdGhpcyBnb25l
IHRocm91Z2ggc29tZSBYZW5SVCBwZXJmb3JtYW5jZSB0ZXN0aW5nIHRvIGFzc2VydCB0aGVyZQph
cmUgbm90IHJlZ3Jlc3Npb25zIHBlcmZvcm1hbmNlIHdpc2U/CgpUaGFua3MsIFJvZ2VyLgoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1h
aWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54
ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
