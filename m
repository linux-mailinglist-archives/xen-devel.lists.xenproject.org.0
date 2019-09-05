Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9350FA9E9E
	for <lists+xen-devel@lfdr.de>; Thu,  5 Sep 2019 11:41:36 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i5oDh-0006Iy-K1; Thu, 05 Sep 2019 09:38:25 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=QhBR=XA=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1i5oDg-0006Ir-6z
 for xen-devel@lists.xenproject.org; Thu, 05 Sep 2019 09:38:24 +0000
X-Inumbo-ID: e7247206-cfc0-11e9-abc3-12813bfff9fa
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id e7247206-cfc0-11e9-abc3-12813bfff9fa;
 Thu, 05 Sep 2019 09:38:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1567676303;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=3eU6it+k/5Lf+6+TkyONLyC9QHwMgikUXMQQJR9pTOk=;
 b=SHYLqlwoNj8H1unra7dZaDXFj9rZovqYd55DRcgYnb78KE25NhriTDKX
 38kZKwnIvhJ5aZ/5zRCmgzh0Ez5NzZTCX4Mu5rGd/aAzarP1hA+G5YonZ
 Ml0dChoriXl/WyNjevuMebN0UFXRP7bd4PrzcRKAVAE7IDnVlrmd5fTt3 Y=;
Authentication-Results: esa4.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=andrew.cooper3@citrix.com;
 spf=Pass smtp.mailfrom=Andrew.Cooper3@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 andrew.cooper3@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="andrew.cooper3@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa4.hc3370-68.iphmx.com: domain of
 Andrew.Cooper3@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="Andrew.Cooper3@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: BMIrB8sXencPcy8EJm54oLKU1+2h7COwaJXZVgX2/59PN7ylTmmmU14qrmZiNpf0+4hR3cNMbf
 f/daDig04HFOE7SZ50amFuJqBcRi//OpgODG7CkyKzHhBu3Q66F71516wQVv80f95GBY+T5o3G
 DBVXsn7ksfFhUbVF9jj0KVsbpYnazTrX/YdC94EKD+LcafBvf5GnhFQ5bfVGNTvqHSbrXo5Hr6
 CIZojjcED2mHi5w5EVMwbyQICIzKMEiMGLFff/4p+JdWuooB45HC5x6IX2UAmatu2Ok5NiBQp1
 0Qc=
X-SBRS: 2.7
X-MesageID: 5442468
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,470,1559534400"; 
   d="scan'208";a="5442468"
To: Peter Zijlstra <peterz@infradead.org>
References: <156759754770.24473.11832897710080799131.stgit@devnote2>
 <ad6431be-c86e-5ed5-518a-d1e9d1959e80@citrix.com>
 <20190905104937.60aa03f699a9c0fbf1b651b9@kernel.org>
 <1372ce73-e2d8-6144-57df-a98429587826@citrix.com>
 <20190905082647.GZ2332@hirez.programming.kicks-ass.net>
 <4de91a14-2051-197e-6ab0-beb2538c40f9@citrix.com>
 <20190905092627.GB2332@hirez.programming.kicks-ass.net>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Openpgp: preference=signencrypt
Autocrypt: addr=andrew.cooper3@citrix.com; prefer-encrypt=mutual; keydata=
 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
 6+ahAA==
Message-ID: <6f69e9ac-66db-049d-1484-69fb61f686a3@citrix.com>
Date: Thu, 5 Sep 2019 10:38:19 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190905092627.GB2332@hirez.programming.kicks-ass.net>
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL01.citrite.net (10.69.22.125)
Subject: Re: [Xen-devel] [PATCH -tip 0/2] x86: Prohibit kprobes on
 XEN_EMULATE_PREFIX
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
Cc: Juergen Gross <jgross@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>, x86@kernel.org,
 linux-kernel@vger.kernel.org, Borislav Petkov <bp@alien8.de>,
 Randy Dunlap <rdunlap@infradead.org>, Josh
 Poimboeuf <jpoimboe@redhat.com>, xen-devel@lists.xenproject.org, Boris
 Ostrovsky <boris.ostrovsky@oracle.com>, Ingo Molnar <mingo@kernel.org>,
 Masami Hiramatsu <mhiramat@kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDUvMDkvMjAxOSAxMDoyNiwgUGV0ZXIgWmlqbHN0cmEgd3JvdGU6Cj4gT24gVGh1LCBTZXAg
MDUsIDIwMTkgYXQgMDk6NTM6MzJBTSArMDEwMCwgQW5kcmV3IENvb3BlciB3cm90ZToKPj4gT24g
MDUvMDkvMjAxOSAwOToyNiwgUGV0ZXIgWmlqbHN0cmEgd3JvdGU6Cj4+PiBPbiBUaHUsIFNlcCAw
NSwgMjAxOSBhdCAwODo1NDoxN0FNICswMTAwLCBBbmRyZXcgQ29vcGVyIHdyb3RlOgo+Pj4KPj4+
PiBJIGRvbid0IGtub3cgaWYgeW91J3ZlIHNwb3R0ZWQsIGJ1dCB0aGUgcHJlZml4IGlzIGEgdWQy
YSBpbnN0cnVjdGlvbgo+Pj4+IGZvbGxvd2VkIGJ5ICd4ZW4nIGluIGFzY2lpLgo+Pj4+Cj4+Pj4g
VGhlIEtWTSB2ZXJzaW9uIHdhcyBhZGRlZCBpbiBjL3MgNmM4NmVlZGMyMDZkZDFmOWQzN2EyNzk2
ZmFhOGU2ZjIyNzgyMTVkMgo+Pj4gV2hpbGUgdGhlIFhlbiBvbmUgZGlzYXNzZWJsZXMgdG8gdmFs
aWQgaW5zdHJ1Y3Rpb25zLCB0aGF0IEtWTSBvbmUgZG9lcwo+Pj4gbm90Ogo+Pj4KPj4+IAkudGV4
dAo+Pj4geGVuOgo+Pj4gCXVkMjsgLmFzY2lpICJ4ZW4iCj4+PiBrdm06Cj4+PiAJdWQyOyAuYXNj
aWkgImt2bSIKPj4+Cj4+PiBkaXNhc3NlbWJsZXMgbGlrZToKPj4+Cj4+PiAwMDAwMDAwMDAwMDAw
MDAwIDx4ZW4+Ogo+Pj4gICAgMDogICAwZiAwYiAgICAgICAgICAgICAgICAgICB1ZDIKPj4+ICAg
IDI6ICAgNzggNjUgICAgICAgICAgICAgICAgICAganMgICAgIDY5IDxrdm0rMHg2ND4KPj4+ICAg
IDQ6ICAgNmUgICAgICAgICAgICAgICAgICAgICAgb3V0c2IgICVkczooJXJzaSksKCVkeCkKPj4+
IDAwMDAwMDAwMDAwMDAwMDUgPGt2bT46Cj4+PiAgICA1OiAgIDBmIDBiICAgICAgICAgICAgICAg
ICAgIHVkMgo+Pj4gICAgNzogICA2YiAgICAgICAgICAgICAgICAgICAgICAuYnl0ZSAweDZiCj4+
PiAgICA4OiAgIDc2IDZkICAgICAgICAgICAgICAgICAgIGpiZSAgICA3NyA8a3ZtKzB4NzI+Cj4+
Pgo+Pj4gV2hpY2ggaXMgYSBiaXQgdW5mb3J0dW5hdGUgSSBzdXBwb3NlLiBBdCBsZWFzdCB0aGV5
IGRvbid0IGFwcGVhciB0bwo+Pj4gY29uc3VtZSBmdXJ0aGVyIGJ5dGVzLgo+PiBJdCBkb2VzIHdo
ZW4geW91IGdpdmUgb2JqZHVtcCBvbmUgZXh0cmEgYnl0ZSB0byBsb29rIGF0Lgo+Pgo+PiAwMDAw
MDAwMDAwMDAwMDA1IDxrdm0+Ogo+PiDCoMKgIDU6wqDCoMKgIDBmIDBiwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgIMKgwqDCoCB1ZDLCoMKgwqAKPj4gwqDCoCA3OsKgwqDCoCA2YiA3NiA2
ZCAwMMKgwqDCoMKgwqDCoMKgwqDCoCDCoMKgwqAgaW11bMKgwqAgJDB4MCwweDZkKCVyc2kpLCVl
c2kKPj4KPj4gSSBkaWQgdHJ5IHRvIHBvaW50IG91dCB0aGF0IHRoaXMgcHJvcGVydHkgc2hvdWxk
IGhhdmUgYmVlbiBjaGVja2VkCj4+IGJlZm9yZSBzZXR0bGluZyBvbiAna3ZtJyBhcyB0aGUgc3Ry
aW5nLgo+IEJhaCB5b3UncmUgcmlnaHQ7IHdoZW4gSSB3cml0ZToKPgo+IAl1ZDI7IC5hc2NpaSAi
a3ZtIjsgY3B1aWQKPgo+IFRoZSBvdXRwdXQgaXMgZ2liYmVyaXNoIDovCgpLVk0gY291bGQgcG9z
c2libHkgYW1lbmQgdGhpcy7CoCBJdCBpcyBhbiBvZmYtYnktZGVmYXVsdCB0ZXN0aW5nLW9ubHkK
aW50ZXJmYWNlLgoKWGVuJ3MgaXMgcGFydCBvZiB0aGUgQUJJIGZvciByaW5nLWRlcHJpdmllbGdl
ZCBndWVzdHMsIHRvIGZvcmNlIENQVUlEIHRvCmJlIHRoZSB2aXJ0dWFsaXNlZCB2aWV3IG9uIGhh
cmR3YXJlIHdpdGhvdXQgQ1BVSUQgRmF1bHRpbmcuCgp+QW5kcmV3CgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhl
bi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3Jn
L21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
