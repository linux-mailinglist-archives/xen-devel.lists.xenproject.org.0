Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 50312AFB4B
	for <lists+xen-devel@lfdr.de>; Wed, 11 Sep 2019 13:22:25 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i80dA-0004qx-8J; Wed, 11 Sep 2019 11:17:48 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=L0xq=XG=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1i80d8-0004qr-Db
 for xen-devel@lists.xenproject.org; Wed, 11 Sep 2019 11:17:46 +0000
X-Inumbo-ID: c15ba62e-d485-11e9-ac28-12813bfff9fa
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id c15ba62e-d485-11e9-ac28-12813bfff9fa;
 Wed, 11 Sep 2019 11:17:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1568200656;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=8wSqPXOVoZvK5wl1KNyWDfqXgGiR4k4R1NcROmA9+b8=;
 b=DR1T4XUFl2Lgnmf8LDHphv11RNwIiksaIjS9Dg6ITQI6DMbV1CT2Y82e
 17tA3fdhmoqPQdTzfjLwTgyAz+p4hCxmOFaGZbkW1lNpT74Of66lkyPFS
 1qiWRAyXMiFDcQEdx8SERWr5qUqJgfBRzGDKcQBUEsCsb8LOcVDaHs1fk M=;
Authentication-Results: esa1.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=andrew.cooper3@citrix.com;
 spf=Pass smtp.mailfrom=Andrew.Cooper3@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 andrew.cooper3@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="andrew.cooper3@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa1.hc3370-68.iphmx.com: domain of
 Andrew.Cooper3@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="Andrew.Cooper3@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: oRK5PB/3xUhe0v/71BAspwlK8LR1imWUYWOz8OedFRvNw3TGY/DLv0v4OQLvagqyC0PFFX3wjc
 Dw9caXKQxOj5++ssw/WCFHNAagMymQ8SuqqWShjBQk4c7TTRKaYMGAKli/NuTsbBL24yCPCwID
 Lw6uoII8oV/sjOuBOiscJD8Tm8NSe4EYb2UdFs0vzFcorhZocMtOd7q8cxOcSVGLJL1cJxOWLn
 XfBM6NKT8csm56t2Xe0+DZO9y77BBeYsBDI0xdoehk/g107tc72X7wLHtsAtD/k0KvFhH4R4XA
 8FA=
X-SBRS: 2.7
X-MesageID: 5477086
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,493,1559534400"; 
   d="scan'208";a="5477086"
To: Juergen Gross <jgross@suse.com>, <xen-devel@lists.xenproject.org>
References: <20190911062001.25931-1-jgross@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Openpgp: preference=signencrypt
Autocrypt: addr=andrew.cooper3@citrix.com; prefer-encrypt=mutual; keydata=
 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
 6+ahAA==
Message-ID: <b1d43169-aaa4-a875-2963-832efa88183a@citrix.com>
Date: Wed, 11 Sep 2019 12:17:28 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190911062001.25931-1-jgross@suse.com>
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL01.citrite.net (10.69.22.125)
Subject: Re: [Xen-devel] [RFC PATCH 0/5] Add hypervisor sysfs-like support
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei
 Liu <wl@xen.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Julien Grall <julien.grall@arm.com>,
 Jan Beulich <jbeulich@suse.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTEvMDkvMjAxOSAwNzoxOSwgSnVlcmdlbiBHcm9zcyB3cm90ZToKPiBPbiB0aGUgMjAxOSBY
ZW4gZGV2ZWxvcGVyIHN1bW1pdCB0aGVyZSB3YXMgYWdyZWVtZW50IHRoYXQgdGhlIFhlbgo+IGh5
cGVydmlzb3Igc2hvdWxkIGdhaW4gc3VwcG9ydCBmb3IgYSBoaWVyYXJjaGljYWwgbmFtZS12YWx1
ZSBzdG9yZQo+IHNpbWlsYXIgdG8gdGhlIExpbnV4IGtlcm5lbCdzIHN5c2ZzLgo+Cj4gVGhpcyBp
cyBhIGZpcnN0IGltcGxlbWVudGF0aW9uIG9mIHRoYXQgaWRlYSBhZGRpbmcgdGhlIGJhc2ljCj4g
ZnVuY3Rpb25hbGl0eSB0byBoeXBlcnZpc29yIGFuZCB0b29scyBzaWRlLiBUaGUgaW50ZXJmYWNl
IHRvIGFueQo+IHVzZXIgcHJvZ3JhbSBtYWtpbmcgdXNlIG9mIHRoYXQgInhlbi1zeXNmcyIgaXMg
YSBuZXcgbGlicmFyeQo+ICJsaWJ4ZW5mcyIgd2l0aCBhIHN0YWJsZSBpbnRlcmZhY2UuCgpUaGFu
a3lvdSBmb3IgbG9va2luZyBpbnRvIHRoaXMuwqAgSXQgaXMgYSBnb29kIHN0ZXAgZm9yd2FyZHMu
CgpGaXJzdCBvZiBhbGwsIEknZCBzdWdnZXN0IHRoYXQgd2UgaGF2ZSBhIGRvY3VtZW50IGFsb25n
IHRoZSBsaW5lcyBvZgp4ZW5zdG9yZWQtcGF0aHMgYXMgdGhlIHBvaW50IG9mIGF1dGhvcml0eSBk
ZXNjcmliaW5nIHRoZSBwYXRoL2ZpbGUgQUJJLgoKU2Vjb25kLCBpcyB4ZW5mcyByZWFsbHkgdGhl
IGJlc3QgbmFtZSBoZXJlP8KgIEl0IGlzIGFtYmlndW91cyB3aXRoIHRoZQpzdGlsbC1lc3NlbnRp
YWwgKGV2ZW4gdGhvdWdoIGl0IHJlYWxseSBuZWVkcyB0byBkaXNhcHBlYXIpIExpbnV4CmZpbGVz
eXN0ZW0gYnkgdGhlIG5hbWUgeGVuZnMuCgo+Cj4gVGhlcmUgYXJlIHN0aWxsIHNvbWUgcGVuZGlu
ZyBxdWVzdGlvbnMsIHRob3NlIGFyZToKPgo+IC0gYWNjZXNzIHJpZ2h0czoKPiAgICsgc2hvdWxk
IHdlIGFsbG93IGFjY2VzcyB0byBkb20wIG9ubHksIG9yIHRvIGFsbCBkb21haW5zLCBvciBzaG91
bGQKPiAgICAgdGhhdCBiZSBwb3NzaWJsZSB0byBzZXQgcGVyIGVudHJ5Pwo+ICAgKyBob3cgdG8g
aW50ZWdyYXRlIHdpdGggeHNtPwo+IC0gZHluYW1pY2FsIGVudHJpZXM6Cj4gICArIGRvIHdlIHdh
bnQgc3VwcG9ydCBmb3IgZS5nLiBwZXItZG9tYWluIGFuZC9vciBwZXItY3B1cG9vbCBlbnRyaWVz
Pwo+ICAgKyBkbyB3ZSB3YW50IHN1cHBvcnQgZm9yIGRlYnVnIGFpZHMgKGxvY2stcHJvZmlsaW5n
LCBkZWJ1Z3RyYWNlIC4uKT8KPiAtIHdyaXRlIGFjY2VzczoKPiAgICsgcnVudGltZSBwYXJhbWV0
ZXJzPwo+ICAgKyBkZWJ1Z2dpbmcgYWlkcz8KClRvIGFuc3dlciBzb21lIG9mIHRoZXNlLCB3ZSBj
b3VsZCByZWFsbHkgZG8gd2l0aCBzZXR0aW5nIGV4cGVjdGF0aW9ucyBvbgp0aGUgc2NvcGUgb2Yg
dGhlIHdvcmsuwqAgRm9yIHJlYWRpbmcgY29uZmlndXJhdGlvbiwgSSB0aGluayBpcyBncmVhdC7C
oApFdmVuIGZvciBtb2RpZmljYXRpb24gb2YgY29uZmlndXJhdGlvbiwgaXQgbG9va3MgdG8gYmUg
YSBnb29kIGludGVyZmFjZQp3aGljaCB3b24ndCByZXF1aXJlIGV2ZXJ5IG9wdGlvbiB0byBnYWlu
IGEgbmV3IGFkLWhvYyBoeXBlcmNhbGwuCgpIb3dldmVyLCBmb3IgYW55dGhpbmcgd2hpY2ggaXMg
ZXhwZWN0ZWQgdG8gb3BlcmF0ZSBwZXJpb2RpY2FsbHkgKG91dHNpZGUKb2YgZGVidWdnaW5nIGNp
cmN1bXN0YW5jZXMpLCBJJ20gbm90IHN1cmUgaXRzIHRoZSBiZXN0IGludGVyZmFjZS4KClN0YXRz
IGNvbGxlY3Rpb24gaW4gcGFydGljdWxhciB3b3VsZCBiZSBiZXR0ZXIgdXNpbmcgc2hhcmVkIG1l
bW9yeSBwYWdlcwp0aGFuIGNvbnN0YW50bHkgcG9sbGluZyAvZG9tYWluLyRkb21pZC9zdGF0cy7C
oCAoQ3VycmVudGx5LCBpdHMgYSBzbGV3IG9mCkRPTUNUTC9ldGMgaHlwZXJjYWxscy7CoCBPbiBz
eXN0ZW1zIHdpdGggbW9yZSB0aGFuIGEgZG96ZW4gZ3Vlc3RzIG9yIHNvLApzdGF0cyBjb2xsZWN0
aW9uIGlzIHRoZSBwcmltYXJ5IHNvdXJjZSBvZiBkb21jdGwgbG9jayBjb250ZW50aW9uLikKCn5B
bmRyZXcKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhl
bi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBz
Oi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
