Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 18CFD124778
	for <lists+xen-devel@lfdr.de>; Wed, 18 Dec 2019 14:00:24 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ihYsh-0001rH-RY; Wed, 18 Dec 2019 12:56:47 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=5XdQ=2I=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1ihYsg-0001rC-Ra
 for xen-devel@lists.xenproject.org; Wed, 18 Dec 2019 12:56:46 +0000
X-Inumbo-ID: d862ad60-2195-11ea-9072-12813bfff9fa
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id d862ad60-2195-11ea-9072-12813bfff9fa;
 Wed, 18 Dec 2019 12:56:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1576673805;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=4dE7CH2uRibrNu8bOviBqp8npYCRFKLGPC88Lmn2yDM=;
 b=Cs8k7D8jQQn7cUjCGl6CWeYgNd/I3Y6bOvirsywCp9+88p1AbkrrZl8g
 rbQO+NRr6HVdE9wtZHUtmrMx5+0uRAUwFWgD5G5dLUBGxrgG5ey6GEmqW
 LcsV80wzW6JfvRSsnwIjuEPDADZpAuROcWtWdWtkia6FJgCJmrfAjU7ln 8=;
Authentication-Results: esa2.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=andrew.cooper3@citrix.com;
 spf=Pass smtp.mailfrom=Andrew.Cooper3@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 andrew.cooper3@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="andrew.cooper3@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa2.hc3370-68.iphmx.com: domain of
 Andrew.Cooper3@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="Andrew.Cooper3@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: osKZqpfsbU74bn+0GRF8T4Y2m2Tv/RgoB7XEsNMVURp+w69qYfYhzJWFw+WHU3jpP0a3uRBefE
 R+nU8j+Ak/BhTE7I0kpiuX4Zn39Crbahxgi9skfVDgNotmi7TLSD/GcOGYplpj9JCqpOq6SbLe
 GUtHl7RTEtrl0BwpUexa05GSiqRGZIJmSiEYLSuYdsIzM3bzNEqs5cxctPGTZplu4BLXTawnuZ
 LpRUBDco16x4DtiXT7jsdn+9NhUGCqAWueMbbXY8fVaG2gxaSCkMBQzLIgtfTnWm3l3FFfymxO
 cZY=
X-SBRS: 2.7
X-MesageID: 9881706
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.69,329,1571716800"; 
   d="scan'208";a="9881706"
To: Jan Beulich <jbeulich@suse.com>, Wei Liu <wl@xen.org>
References: <20191025091618.10153-1-liuwe@microsoft.com>
 <20191025091618.10153-8-liuwe@microsoft.com>
 <b2edd1f1-7b9e-d03f-2a84-70c65756654c@suse.com>
 <20191218123856.mskxir5onsmvql27@debian>
 <9305cf4e-e105-e560-a493-bc499c516182@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Openpgp: preference=signencrypt
Autocrypt: addr=andrew.cooper3@citrix.com; prefer-encrypt=mutual; keydata=
 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
 6+ahAA==
Message-ID: <80f76570-93af-f526-2f12-1f85242a5339@citrix.com>
Date: Wed, 18 Dec 2019 12:56:41 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <9305cf4e-e105-e560-a493-bc499c516182@suse.com>
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 AMSPEX02CL01.citrite.net (10.69.22.125)
Subject: Re: [Xen-devel] [PATCH for-next 7/7] x86: implement Hyper-V clock
 source
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
Cc: Xen Development List <xen-devel@lists.xenproject.org>,
 Paul Durrant <paul@xen.org>, Wei Liu <liuwe@microsoft.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Michael Kelley <mikelley@microsoft.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTgvMTIvMjAxOSAxMjo1MSwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+Pj4gKyAgICAgICAgc2Nh
bGUgPSB0c2NfcGFnZS0+dHNjX3NjYWxlOwo+Pj4+ICsgICAgICAgIG9mZnNldCA9IHRzY19wYWdl
LT50c2Nfb2Zmc2V0Owo+Pj4+ICsKPj4+PiArICAgICAgICBzbXBfcm1iKCk7Cj4+Pj4gKwo+Pj4+
ICsgICAgfSB3aGlsZSAodHNjX3BhZ2UtPnRzY19zZXF1ZW5jZSAhPSBzZXEpOwo+Pj4+ICsKPj4+
PiArICAgIC8qIHg4NiBoYXMgQVJDSF9TVVBQT1JUU19JTlQxMjggKi8KPj4+PiArICAgIHJldCA9
ICh1aW50NjRfdCkoKChfX3VpbnQxMjhfdCl0c2MgKiBzY2FsZSkgPj4gNjQpICsgb2Zmc2V0Owo+
Pj4gVGhlIGZpbmFsIGNhc3QgaXNuJ3QgcmVhbGx5IG5lZWRlZCwgaXMgaXQ/IEFzIHRvIHRoZSBt
dWx0aXBsaWNhdGlvbgo+Pj4gLSBhcmUgeW91IHN1cmUgYWxsIGNvbXBpbGVycyBpbiBhbGwgY2Fz
ZXMgd2lsbCBhdm9pZCBmYWxsaW5nIGJhY2sKPj4+IHRvIGEgbGlicmFyeSBjYWxsIGhlcmU/IElu
IG90aGVyIHNpbWlsYXIgcGxhY2VzIEkgdGhpbmsgd2UgdXNlCj4+PiBpbmxpbmUgYXNzZW1ibHkg
aW5zdGVhZC4KPj4gV2hhdCBsaWJyYXJ5IGNhbGw/IEEgZnVuY3Rpb24gaW4gbGliZ2NjIChvciBj
bGFuZydzIGVxdWl2YWxlbmNlKT8KPj4gSVNUUiBsaWJnY2MgaXMgYWx3YXlzIGxpbmtlZCwgYnV0
IEkgY291bGQgYmUgd3JvbmcgaGVyZS4KPiBObywgdGhlIGh5cGVydmlzb3IgKGF0IGxlYXN0IHRo
ZSB4ODYgb25lKSBkb2Vzbid0IGxpbmsgbGliZ2NjIGFmYWlrLgoKeDg2IGNhbiBtdWx0aXBseSB1
aW50MTI4X3QgYnkgdWludDY0X3Qgd2l0aG91dCBhIGxpYnJhcnkgY2FsbC7CoCBJZiB0aGlzCmNv
bXBpbGVzLCB0aGVuIGl0IHNob3VsZCBiZSBmaW5lLgoKfkFuZHJldwoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApY
ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
