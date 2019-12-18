Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0955A12427C
	for <lists+xen-devel@lfdr.de>; Wed, 18 Dec 2019 10:11:51 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ihVKH-0003bg-IA; Wed, 18 Dec 2019 09:09:01 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=5XdQ=2I=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1ihVKG-0003bP-7U
 for xen-devel@lists.xenproject.org; Wed, 18 Dec 2019 09:09:00 +0000
X-Inumbo-ID: 05cbe836-2176-11ea-9048-12813bfff9fa
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 05cbe836-2176-11ea-9048-12813bfff9fa;
 Wed, 18 Dec 2019 09:08:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1576660138;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=ZEPKWJ6+BrVdlqtuIY52e/b1qdh/h78DZ5mzr9Pf5T4=;
 b=TI/ylrCI2bXFr5SUfZ3PSnoZv5i6Wbz1MRM5UeF82qJdVQWDcVmJihrG
 fudnTN5TQOKqsWprv+BX4KFiQNfVyIhgBnFG2KkNd7LNrB+5iNuXl0sjW
 Gk2NxcF6OXumYswYluX+uE9cDB27Oh4uDDiDw47TFVhIMPnZcXwpy8pG4 A=;
Authentication-Results: esa3.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=andrew.cooper3@citrix.com;
 spf=Pass smtp.mailfrom=Andrew.Cooper3@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 andrew.cooper3@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="andrew.cooper3@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa3.hc3370-68.iphmx.com: domain of
 Andrew.Cooper3@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="Andrew.Cooper3@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: Sbta9OTv/uWO+o1GqI8aa50zCcIJDM5RNCTtlnyHjUmsNNFebCweoeTSD9YcaRbYVZDd6pKasn
 W+mmzqlI1398ETJlmGvNDAQ+UfaiJAcOM0Sq9XkvmsqlPEdq/UTw0zFY64TPA2PrtCN9GdwbKe
 TjxyyjZnYc49egk7q5WKJNwpEtAWjkx2gF97z7lfScmr9r9Yii8ZzXwXNomQ7cQJH2Pq/nY0cZ
 M5hxddTib3rwnP5wtvPbmdfTDrNX+WirqOCdB/lFsTyYl7SIZHIbkwoUvF/O+vE0DVdM6NCZck
 yT4=
X-SBRS: 2.7
X-MesageID: 9855847
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.69,328,1571716800"; 
   d="scan'208";a="9855847"
To: Dario Faggioli <dfaggioli@suse.com>, Juergen Gross <jgross@suse.com>,
 <xen-devel@lists.xenproject.org>
References: <20191218074859.21665-1-jgross@suse.com>
 <20191218074859.21665-2-jgross@suse.com>
 <2ee2b27f31eeb85bff40bcfd588a6d45c7e80488.camel@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Openpgp: preference=signencrypt
Autocrypt: addr=andrew.cooper3@citrix.com; prefer-encrypt=mutual; keydata=
 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
 6+ahAA==
Message-ID: <7c867097-d289-34af-0e89-3413b0480912@citrix.com>
Date: Wed, 18 Dec 2019 09:08:40 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <2ee2b27f31eeb85bff40bcfd588a6d45c7e80488.camel@suse.com>
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL01.citrite.net (10.69.22.125)
Subject: Re: [Xen-devel] [PATCH 1/9] xen/sched: move schedulers and cpupool
 coding to dedicated directory
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
 Wei Liu <wl@xen.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>, Ian
 Jackson <ian.jackson@eu.citrix.com>,
 Josh Whitehead <josh.whitehead@dornerworks.com>,
 Meng Xu <mengxu@cis.upenn.edu>, Jan Beulich <jbeulich@suse.com>,
 Stewart Hildebrand <stewart.hildebrand@dornerworks.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTgvMTIvMjAxOSAwODo1OCwgRGFyaW8gRmFnZ2lvbGkgd3JvdGU6Cj4gT24gV2VkLCAyMDE5
LTEyLTE4IGF0IDA4OjQ4ICswMTAwLCBKdWVyZ2VuIEdyb3NzIHdyb3RlOgo+PiBNb3ZlIHNjaGVk
KmMgYW5kIGNwdXBvb2wuYyB0byBhIG5ldyBkaXJlY3RvcnkgY29tbW9uL3NjaGVkLgo+Pgo+PiBT
aWduZWQtb2ZmLWJ5OiBKdWVyZ2VuIEdyb3NzIDxqZ3Jvc3NAc3VzZS5jb20+Cj4+IC0tLQo+PiAg
TUFJTlRBSU5FUlMgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgfCAgOCAr
LS0KPj4gIHhlbi9jb21tb24vS2NvbmZpZyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
IHwgNjYgKy0tLS0tLS0tLS0tCj4+IC0tLS0tLS0tLS0KPj4gIHhlbi9jb21tb24vTWFrZWZpbGUg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHwgIDggKy0tCj4+ICB4ZW4vY29tbW9uL3Nj
aGVkL0tjb25maWcgICAgICAgICAgICAgICAgICAgICAgICAgICB8IDY1Cj4+ICsrKysrKysrKysr
KysrKysrKysrKwo+PiAgeGVuL2NvbW1vbi9zY2hlZC9NYWtlZmlsZSAgICAgICAgICAgICAgICAg
ICAgICAgICAgfCAgNyArKysKPj4gIC4uLi97Y29tcGF0L3NjaGVkdWxlLmMgPT4gc2NoZWQvY29t
cGF0X3NjaGVkdWxlLmN9IHwgIDIgKy0KPj4gIHhlbi9jb21tb24veyA9PiBzY2hlZH0vY3B1cG9v
bC5jICAgICAgICAgICAgICAgICAgIHwgIDAKPj4gIHhlbi9jb21tb24veyA9PiBzY2hlZH0vc2No
ZWRfYXJpbmM2NTMuYyAgICAgICAgICAgIHwgIDAKPj4gIHhlbi9jb21tb24veyA9PiBzY2hlZH0v
c2NoZWRfY3JlZGl0LmMgICAgICAgICAgICAgIHwgIDAKPj4gIHhlbi9jb21tb24veyA9PiBzY2hl
ZH0vc2NoZWRfY3JlZGl0Mi5jICAgICAgICAgICAgIHwgIDAKPj4gIHhlbi9jb21tb24veyA9PiBz
Y2hlZH0vc2NoZWRfbnVsbC5jICAgICAgICAgICAgICAgIHwgIDAKPj4gIHhlbi9jb21tb24veyA9
PiBzY2hlZH0vc2NoZWRfcnQuYyAgICAgICAgICAgICAgICAgIHwgIDAKPj4gIHhlbi9jb21tb24v
eyA9PiBzY2hlZH0vc2NoZWR1bGUuYyAgICAgICAgICAgICAgICAgIHwgIDIgKy0KPj4gIDEzIGZp
bGVzIGNoYW5nZWQsIDgwIGluc2VydGlvbnMoKyksIDc4IGRlbGV0aW9ucygtKQo+PiAgY3JlYXRl
IG1vZGUgMTAwNjQ0IHhlbi9jb21tb24vc2NoZWQvS2NvbmZpZwo+PiAgY3JlYXRlIG1vZGUgMTAw
NjQ0IHhlbi9jb21tb24vc2NoZWQvTWFrZWZpbGUKPj4gIHJlbmFtZSB4ZW4vY29tbW9uL3tjb21w
YXQvc2NoZWR1bGUuYyA9PiBzY2hlZC9jb21wYXRfc2NoZWR1bGUuY30KPj4gKDk3JSkKPj4gIHJl
bmFtZSB4ZW4vY29tbW9uL3sgPT4gc2NoZWR9L2NwdXBvb2wuYyAoMTAwJSkKPj4gIHJlbmFtZSB4
ZW4vY29tbW9uL3sgPT4gc2NoZWR9L3NjaGVkX2FyaW5jNjUzLmMgKDEwMCUpCj4+ICByZW5hbWUg
eGVuL2NvbW1vbi97ID0+IHNjaGVkfS9zY2hlZF9jcmVkaXQuYyAoMTAwJSkKPj4gIHJlbmFtZSB4
ZW4vY29tbW9uL3sgPT4gc2NoZWR9L3NjaGVkX2NyZWRpdDIuYyAoMTAwJSkKPj4gIHJlbmFtZSB4
ZW4vY29tbW9uL3sgPT4gc2NoZWR9L3NjaGVkX251bGwuYyAoMTAwJSkKPj4gIHJlbmFtZSB4ZW4v
Y29tbW9uL3sgPT4gc2NoZWR9L3NjaGVkX3J0LmMgKDEwMCUpCj4+ICByZW5hbWUgeGVuL2NvbW1v
bi97ID0+IHNjaGVkfS9zY2hlZHVsZS5jICg5OSUpCj4+Cj4gTWF0dGVyIG9mIHRhc3RlLCBJIGd1
ZXNzLCBidXQgd2hhdCBhYm91dCBub3QgcmVwZWF0aW5nICdzY2hlZCcsIGkuZS46Cj4KPiB4ZW4v
Y29tbW9uL3NjaGVkX2NyZWRpdC5jICAtLT4geGVuL2NvbW1vbi9zY2hlZC9jcmVkaXQuYwo+IHhl
bi9jb21tb24vc2NoZWRfY3JlZGl0Mi5jIC0tPiB4ZW4vY29tbW9uL3NjaGVkL2NyZWRpdDIuYwo+
IHhlbi9jb21tb24vc2NoZWRfbnVsbC5jICAgIC0tPiB4ZW4vY29tbW9uL3NjaGVkL251bGwuYwo+
IC4uLgo+Cj4gc2NoZWR1bGUuYyBjYW4gYmUgY2FsbGVkIHNvbWV0aGluZyBsaWtlICdjb3JlLmMn
LAoKKzEgRldJVywgYW5kIGNvbXBhdF9zY2hlZHVsZS5jIGNhbiBqdXN0IGJlY29tZSBjb21wYXQu
YwoKfkFuZHJldwoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3Jn
Cmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
