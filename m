Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 08348124781
	for <lists+xen-devel@lfdr.de>; Wed, 18 Dec 2019 14:02:21 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ihYvC-00029W-V1; Wed, 18 Dec 2019 12:59:22 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=8BSL=2I=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
 id 1ihYvC-00029R-4q
 for xen-devel@lists.xenproject.org; Wed, 18 Dec 2019 12:59:22 +0000
X-Inumbo-ID: 308f7af4-2196-11ea-88e7-bc764e2007e4
Received: from mail-wr1-f65.google.com (unknown [209.85.221.65])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 308f7af4-2196-11ea-88e7-bc764e2007e4;
 Wed, 18 Dec 2019 12:59:13 +0000 (UTC)
Received: by mail-wr1-f65.google.com with SMTP id d16so2172150wre.10
 for <xen-devel@lists.xenproject.org>; Wed, 18 Dec 2019 04:59:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to:user-agent;
 bh=MUdDuMBC0ur8kCf6+6HrnLACO/PnTy4UgeTBRdQ2Jhk=;
 b=NwLUXwXzEA0mYHBwsaqVwKdz5y9HQtIKkOd8N5d6Ue00dBvFBnJgjM/1sbdN9rooy7
 /KMFrjindQp0/7IEMXBXPkCk/Rn0LmmTyH/zSDg96BTRhwIgHTsLo+t92O7m1yhvFAf/
 c3CQ+vFz+smgdITlOlUIUe137C+wdm8yDJHK/lxiJun2j9W4hNQphvOxMnbeigSbEJVx
 hQQisnFo1lYZn2NaFWesuFwXVnL47WQXmAcJ3QyTkxFeuYIz5gHMTbktbUOCVXltTt6t
 AZ5kiwK/Y+wDKPEEsPMLdABmig7kmfESx/E1TlLacEanIs4LP/Y5DOQTTZ94WBJR0FdS
 VPCA==
X-Gm-Message-State: APjAAAW7VO107wBwJ9i41z90sz55ZcTS1uETUs5DvzEuFKopUc50G+eb
 F/Pk8qN1DpkAmLYc2HqhIqs=
X-Google-Smtp-Source: APXvYqzsKYAElFHW79vPV3gODj0t1VAvmNA/Zv5kwrsuV4uYxeFAKRf7eGS7/gNFkxtZAul/MHJrXg==
X-Received: by 2002:a5d:5308:: with SMTP id e8mr2719045wrv.77.1576673952902;
 Wed, 18 Dec 2019 04:59:12 -0800 (PST)
Received: from debian (38.163.200.146.dyn.plus.net. [146.200.163.38])
 by smtp.gmail.com with ESMTPSA id v14sm2528686wrm.28.2019.12.18.04.59.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Dec 2019 04:59:12 -0800 (PST)
Date: Wed, 18 Dec 2019 12:59:10 +0000
From: Wei Liu <wl@xen.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <20191218125910.aqz2jlpovlgn2qdt@debian>
References: <20191025091618.10153-1-liuwe@microsoft.com>
 <20191025091618.10153-8-liuwe@microsoft.com>
 <b2edd1f1-7b9e-d03f-2a84-70c65756654c@suse.com>
 <20191218123856.mskxir5onsmvql27@debian>
 <9305cf4e-e105-e560-a493-bc499c516182@suse.com>
 <80f76570-93af-f526-2f12-1f85242a5339@citrix.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <80f76570-93af-f526-2f12-1f85242a5339@citrix.com>
User-Agent: NeoMutt/20180716
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
Cc: Wei Liu <liuwe@microsoft.com>, Wei Liu <wl@xen.org>,
 Paul Durrant <paul@xen.org>, Michael Kelley <mikelley@microsoft.com>,
 Jan Beulich <jbeulich@suse.com>,
 Xen Development List <xen-devel@lists.xenproject.org>,
 Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gV2VkLCBEZWMgMTgsIDIwMTkgYXQgMTI6NTY6NDFQTSArMDAwMCwgQW5kcmV3IENvb3BlciB3
cm90ZToKPiBPbiAxOC8xMi8yMDE5IDEyOjUxLCBKYW4gQmV1bGljaCB3cm90ZToKPiA+Pj4+ICsg
ICAgICAgIHNjYWxlID0gdHNjX3BhZ2UtPnRzY19zY2FsZTsKPiA+Pj4+ICsgICAgICAgIG9mZnNl
dCA9IHRzY19wYWdlLT50c2Nfb2Zmc2V0Owo+ID4+Pj4gKwo+ID4+Pj4gKyAgICAgICAgc21wX3Jt
YigpOwo+ID4+Pj4gKwo+ID4+Pj4gKyAgICB9IHdoaWxlICh0c2NfcGFnZS0+dHNjX3NlcXVlbmNl
ICE9IHNlcSk7Cj4gPj4+PiArCj4gPj4+PiArICAgIC8qIHg4NiBoYXMgQVJDSF9TVVBQT1JUU19J
TlQxMjggKi8KPiA+Pj4+ICsgICAgcmV0ID0gKHVpbnQ2NF90KSgoKF9fdWludDEyOF90KXRzYyAq
IHNjYWxlKSA+PiA2NCkgKyBvZmZzZXQ7Cj4gPj4+IFRoZSBmaW5hbCBjYXN0IGlzbid0IHJlYWxs
eSBuZWVkZWQsIGlzIGl0PyBBcyB0byB0aGUgbXVsdGlwbGljYXRpb24KPiA+Pj4gLSBhcmUgeW91
IHN1cmUgYWxsIGNvbXBpbGVycyBpbiBhbGwgY2FzZXMgd2lsbCBhdm9pZCBmYWxsaW5nIGJhY2sK
PiA+Pj4gdG8gYSBsaWJyYXJ5IGNhbGwgaGVyZT8gSW4gb3RoZXIgc2ltaWxhciBwbGFjZXMgSSB0
aGluayB3ZSB1c2UKPiA+Pj4gaW5saW5lIGFzc2VtYmx5IGluc3RlYWQuCj4gPj4gV2hhdCBsaWJy
YXJ5IGNhbGw/IEEgZnVuY3Rpb24gaW4gbGliZ2NjIChvciBjbGFuZydzIGVxdWl2YWxlbmNlKT8K
PiA+PiBJU1RSIGxpYmdjYyBpcyBhbHdheXMgbGlua2VkLCBidXQgSSBjb3VsZCBiZSB3cm9uZyBo
ZXJlLgo+ID4gTm8sIHRoZSBoeXBlcnZpc29yIChhdCBsZWFzdCB0aGUgeDg2IG9uZSkgZG9lc24n
dCBsaW5rIGxpYmdjYyBhZmFpay4KPiAKPiB4ODYgY2FuIG11bHRpcGx5IHVpbnQxMjhfdCBieSB1
aW50NjRfdCB3aXRob3V0IGEgbGlicmFyeSBjYWxsLsKgIElmIHRoaXMKPiBjb21waWxlcywgdGhl
biBpdCBzaG91bGQgYmUgZmluZS4KClRoaXMgb2J2aW91c2x5IGNvbXBpbGVzIGZpbmUgZm9yIG1l
LiBCdXQgSmFuJ3MgY29tbWVudCB3YXMgbW9yZSBhYm91dAptYWtpbmcgc3VyZSBhbGwgcG9zc2li
bGUgeDg2IGNvbXBpbGVycyBjYW4gZGVhbCB3aXRoIGl0LiBJIGRvbid0IGhhdmUgYQpkZWZpbml0
aXZlIGFuc3dlciB0byB0aGF0LgoKV2VpLgoKPiAKPiB+QW5kcmV3CgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhl
bi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3Jn
L21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
