Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C7F120AAD
	for <lists+xen-devel@lfdr.de>; Thu, 16 May 2019 17:07:06 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hRHvM-0000U8-Fi; Thu, 16 May 2019 15:04:00 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=dWcr=TQ=citrix.com=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1hRHvK-0000U2-S9
 for xen-devel@lists.xenproject.org; Thu, 16 May 2019 15:03:58 +0000
X-Inumbo-ID: d478a9a4-77eb-11e9-8980-bc764e045a96
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id d478a9a4-77eb-11e9-8980-bc764e045a96;
 Thu, 16 May 2019 15:03:57 +0000 (UTC)
Authentication-Results: esa6.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=wei.liu2@citrix.com;
 spf=SoftFail smtp.mailfrom=wei.liu2@citrix.com;
 spf=None smtp.helo=postmaster@MIAPEX02MSOL01.citrite.net
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 wei.liu2@citrix.com) identity=pra; client-ip=23.29.105.83;
 receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="wei.liu2@citrix.com";
 x-sender="wei.liu2@citrix.com"; x-conformance=sidf_compatible
Received-SPF: SoftFail (esa6.hc3370-68.iphmx.com: domain of
 wei.liu2@citrix.com is inclined to not designate 23.29.105.83
 as permitted sender) identity=mailfrom;
 client-ip=23.29.105.83; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="wei.liu2@citrix.com";
 x-sender="wei.liu2@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 include:spf.citrix.com
 include:spf2.citrix.com include:ironport.citrix.com
 exists:%{i}._spf.mta.salesforce.com ~all"
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@MIAPEX02MSOL01.citrite.net) identity=helo;
 client-ip=23.29.105.83; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="wei.liu2@citrix.com";
 x-sender="postmaster@MIAPEX02MSOL01.citrite.net";
 x-conformance=sidf_compatible
IronPort-SDR: g9uJKD6kMoRqIJ2LKA36Ffc18hao0NoxDeZGEMIpp1DvQ7nRz8xZ/uA8qGYXYNFXo9ddfH4euB
 GVN8JPr0DNTzvobSMxnLNPQ+0lON8+RxbLn+8LGP2NohhnMQuKFGxQMdlh+wlAXAelh637uFil
 FK4mc+6xODnLaGS1pErgNeCAq41sHwcqbuZi8K4LWtnkfWErSFNSoRym2fa//6kpWVYrWWSxE+
 embJU9ci3eHPr4mjk2W20VLG63hjZ6chefxqFkrOJPcfuaVxYLI77XZkKRYCIu5Rh8UevKlZp0
 CFo=
X-SBRS: 2.7
X-MesageID: 511261
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 23.29.105.83
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.60,477,1549947600"; 
   d="scan'208";a="511261"
Date: Thu, 16 May 2019 16:03:55 +0100
From: Wei Liu <wei.liu2@citrix.com>
To: Olaf Hering <olaf@aepfle.de>
Message-ID: <20190516150355.GJ2798@zion.uk.xensource.com>
References: <20190516125000.23559-1-olaf@aepfle.de>
 <20190516133013.GG2798@zion.uk.xensource.com>
 <20190516153601.45352e5c.olaf@aepfle.de>
 <20190516134653.GI2798@zion.uk.xensource.com>
 <20190516155455.3a97d2fb.olaf@aepfle.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190516155455.3a97d2fb.olaf@aepfle.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
Subject: Re: [Xen-devel] [PATCH v1] libxl: fix device_model_version related
 assert
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
Cc: xen-devel@lists.xenproject.org, Wei Liu <wei.liu2@citrix.com>, Ian
 Jackson <ian.jackson@eu.citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVGh1LCBNYXkgMTYsIDIwMTkgYXQgMDM6NTQ6NTVQTSArMDIwMCwgT2xhZiBIZXJpbmcgd3Jv
dGU6Cj4gQW0gVGh1LCAxNiBNYXkgMjAxOSAxNDo0Njo1MyArMDEwMAo+IHNjaHJpZWIgV2VpIExp
dSA8d2VpLmxpdTJAY2l0cml4LmNvbT46Cj4gCj4gPiBDYW4geW91IGNsYXJpZnk/Cj4gCj4gY3Jl
YXRlX2RvbWFpbiBoYXMgYSBsaWJ4bF9kb21haW5fY29uZmlnIG9uIGl0cyBzdGFjay4gVGhpcyBp
cyBwYXNzZWQgdG8KPiBmcmVlbWVtLCBhbmQgbGlieGxfZG9tYWluX25lZWRfbWVtb3J5IG1vZGlm
aWVzIGl0IGFzIG5lZWRlZC4KPiBUaGUgbW9kaWZpY2F0aW9uIHdpbGwgZ28gdGhyb3VnaCBsaWJ4
bF9kb21haW5fY3JlYXRlX25ldywgZG9fZG9tYWluX2NyZWF0ZSwKPiBpbml0aWF0ZV9kb21haW5f
Y3JlYXRlIHRvIGxpYnhsX19kb21haW5fc2V0X2RldmljZV9tb2RlbC4gVGhpcyBmdW5jdGlvbgo+
IHdpbGwgcmV0dXJuIHJpZ2h0IGF3YXkgYmVjYXVzZSBkZXZpY2VfbW9kZWxfdmVyc2lvbiBpcyBh
bHJlYWR5IHNldC4KCkFoLCBJIGtub3cgd2hlcmUgdGhlIGNvbmZ1c2lvbiBpcyBub3cuIE5vdGUg
dGhhdCB0aGUgYl9pbmZvIHVzZWQgaW4KbGlieGxfZG9tYWluX25lZWRfbWVtb3J5IGlzIGEgY29w
eSwgbm90IHRoZSBvcmlnaW5hbCBvbmUsIHNvIHdoYXRldmVyCm1vZGlmaWNhdGlvbiB5b3UgZG8g
dG8gaXQgd29uJ3QgZ2V0IHBhc3NlZCBiYWNrIHRvIGl0cyBjYWxsZXIuCgpOb3RpY2UgdGhlIGNh
bGw6CiAgbGlieGxfZG9tYWluX2J1aWxkX2luZm9fY29weShjdHgsIGJfaW5mbywgYl9pbmZvX2lu
KTsKCkFuZCB0aGVuIGxhdGVyOgogIGxpYnhsX2RvbWFpbl9idWlsZF9pbmZvX2Rpc3Bvc2UoYl9p
bmZvKTsKCkRvZXMgdGhpcyBtYWtlIHNlbnNlPwoKV2VpLgoKPiAKPiBPbGFmCgoKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5n
IGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJv
amVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
