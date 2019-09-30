Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F3F06C21F9
	for <lists+xen-devel@lfdr.de>; Mon, 30 Sep 2019 15:31:08 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iEvhH-0004Yi-RQ; Mon, 30 Sep 2019 13:26:39 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=H1QO=XZ=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1iEvhG-0004Yd-It
 for xen-devel@lists.xenproject.org; Mon, 30 Sep 2019 13:26:38 +0000
X-Inumbo-ID: edbef34c-e385-11e9-96d2-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by localhost (Halon) with ESMTPS
 id edbef34c-e385-11e9-96d2-12813bfff9fa;
 Mon, 30 Sep 2019 13:26:37 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 87A76AC81;
 Mon, 30 Sep 2019 13:26:36 +0000 (UTC)
To: Chao Gao <chao.gao@intel.com>
References: <1569600777-13763-1-git-send-email-chao.gao@intel.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <31002d27-4846-7ae2-0967-61d0931876ea@suse.com>
Date: Mon, 30 Sep 2019 15:26:41 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <1569600777-13763-1-git-send-email-chao.gao@intel.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v12] microcode: rendezvous CPUs in NMI
 handler and load ucode
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
Cc: Sergey Dyasli <sergey.dyasli@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Ashok Raj <ashok.raj@intel.com>,
 Wei Liu <wl@xen.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 Julien Grall <julien.grall@arm.com>, xen-devel@lists.xenproject.org,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjcuMDkuMjAxOSAxODoxMiwgQ2hhbyBHYW8gd3JvdGU6Cj4gQEAgLTEwNSwyMyArMTEwLDQw
IEBAIHZvaWQgX19pbml0IG1pY3JvY29kZV9zZXRfbW9kdWxlKHVuc2lnbmVkIGludCBpZHgpCj4g
IH0KPiAgCj4gIC8qCj4gLSAqIFRoZSBmb3JtYXQgaXMgJ1s8aW50ZWdlcj58c2Nhbl0nLiBCb3Ro
IG9wdGlvbnMgYXJlIG9wdGlvbmFsLgo+IC0gKiBJZiB0aGUgRUZJIGhhcyBmb3JjZWQgd2hpY2gg
b2YgdGhlIG11bHRpYm9vdCBwYXlsb2FkcyBpcyB0byBiZSB1c2VkLAo+IC0gKiBubyBwYXJzaW5n
IHdpbGwgYmUgYXR0ZW1wdGVkLgo+ICsgKiBUaGUgZm9ybWF0IGlzICdbPGludGVnZXI+fHNjYW49
PGJvb2w+LCBubWk9PGJvb2w+XScuIEJvdGggb3B0aW9ucyBhcmUKPiArICogb3B0aW9uYWwuIElm
IHRoZSBFRkkgaGFzIGZvcmNlZCB3aGljaCBvZiB0aGUgbXVsdGlib290IHBheWxvYWRzIGlzIHRv
IGJlCj4gKyAqIHVzZWQsIG9ubHkgbm1pPTxib29sPiBpcyBwYXJzZWQuCj4gICAqLwo+ICBzdGF0
aWMgaW50IF9faW5pdCBwYXJzZV91Y29kZShjb25zdCBjaGFyICpzKQo+ICB7Cj4gLSAgICBjb25z
dCBjaGFyICpxID0gTlVMTDsKPiArICAgIGNvbnN0IGNoYXIgKnNzOwo+ICsgICAgaW50IHZhbCwg
cmMgPSAwOwo+ICAKPiAtICAgIGlmICggdWNvZGVfbW9kX2ZvcmNlZCApIC8qIEZvcmNlZCBieSBF
RkkgKi8KPiAtICAgICAgIHJldHVybiAwOwo+ICsgICAgZG8gewo+ICsgICAgICAgIHNzID0gc3Ry
Y2hyKHMsICcsJyk7Cj4gKyAgICAgICAgaWYgKCAhc3MgKQo+ICsgICAgICAgICAgICBzcyA9IHN0
cmNocihzLCAnXDAnKTsKPiAgCj4gLSAgICBpZiAoICFzdHJuY21wKHMsICJzY2FuIiwgNCkgKQo+
IC0gICAgICAgIHVjb2RlX3NjYW4gPSAxOwo+IC0gICAgZWxzZQo+IC0gICAgICAgIHVjb2RlX21v
ZF9pZHggPSBzaW1wbGVfc3RydG9sKHMsICZxLCAwKTsKPiArICAgICAgICBpZiAoICh2YWwgPSBw
YXJzZV9ib29sZWFuKCJubWkiLCBzLCBzcykpID49IDAgKQo+ICsgICAgICAgICAgICB1Y29kZV9p
bl9ubWkgPSB2YWw7Cj4gKyAgICAgICAgZWxzZSBpZiAoICF1Y29kZV9tb2RfZm9yY2VkICkgLyog
Tm90IGZvcmNlZCBieSBFRkkgKi8KPiArICAgICAgICB7Cj4gKyAgICAgICAgICAgIGlmICggKHZh
bCA9IHBhcnNlX2Jvb2xlYW4oInNjYW4iLCBzLCBzcykpID49IDAgKQo+ICsgICAgICAgICAgICAg
ICAgdWNvZGVfc2NhbiA9IHZhbDsKPiArICAgICAgICAgICAgZWxzZQo+ICsgICAgICAgICAgICB7
Cj4gKyAgICAgICAgICAgICAgICBjb25zdCBjaGFyICpxID0gTlVMTDsKCkkgZG9uJ3QgdGhpbmsg
dGhlIGluaXRpYWxpemVyIGlzIG5lZWRlZCBoZXJlLgoKPiAgc3RhdGljIGludCBwcmltYXJ5X3Ro
cmVhZF9mbihjb25zdCBzdHJ1Y3QgbWljcm9jb2RlX3BhdGNoICpwYXRjaCkKPiAgewo+IC0gICAg
aW50IHJldCA9IDA7Cj4gLQo+ICAgICAgaWYgKCAhd2FpdF9mb3Jfc3RhdGUoTE9BRElOR19DQUxM
SU4pICkKPiAgICAgICAgICByZXR1cm4gLUVCVVNZOwo+ICAKPiAtICAgIGNwdW1hc2tfc2V0X2Nw
dShzbXBfcHJvY2Vzc29yX2lkKCksICZjcHVfY2FsbGluX21hcCk7Cj4gKyAgICBpZiAoIHVjb2Rl
X2luX25taSApCj4gKyAgICB7Cj4gKyAgICAgICAgc2VsZl9ubWkoKTsKPiAgCj4gLSAgICBpZiAo
ICF3YWl0X2Zvcl9zdGF0ZShMT0FESU5HX0VOVEVSKSApCj4gLSAgICAgICAgcmV0dXJuIC1FQlVT
WTsKPiArICAgICAgICAvKgo+ICsgICAgICAgICAqIFdhaXQgZm9yIHVjb2RlIGxvYWRpbmcgaXMg
ZG9uZSBpbiBjYXNlIHRoYXQgdGhlIE5NSSBkb2VzIG5vdCBhcnJpdmUKPiArICAgICAgICAgKiBz
eW5jaHJvbm91c2x5LCB3aGljaCBtYXkgbGVhZCB0byBhIG5vdC15ZXQtdXBkYXRlZCBlcnJvciBp
cyByZXR1cm5lZAo+ICsgICAgICAgICAqIGJlbG93Lgo+ICsgICAgICAgICAqLwo+ICsgICAgICAg
IGlmICggdW5saWtlbHkoIXdhaXRfZm9yX3N0YXRlKExPQURJTkdfRVhJVCkpICkKPiArICAgICAg
ICAgICAgQVNTRVJUX1VOUkVBQ0hBQkxFKCk7Cj4gIAo+IC0gICAgcmV0ID0gbWljcm9jb2RlX29w
cy0+YXBwbHlfbWljcm9jb2RlKHBhdGNoKTsKPiAtICAgIGlmICggIXJldCApCj4gLSAgICAgICAg
YXRvbWljX2luYygmY3B1X3VwZGF0ZWQpOwo+IC0gICAgYXRvbWljX2luYygmY3B1X291dCk7Cj4g
KyAgICAgICAgcmV0dXJuIHRoaXNfY3B1KGxvYWRpbmdfZXJyKTsKPiArICAgIH0KPiAgCj4gLSAg
ICByZXR1cm4gcmV0Owo+ICsgICAgcmV0dXJuIHByaW1hcnlfdGhyZWFkX3dvcmsocGF0Y2gpOwo+
ICB9CgpBIHJlbWFyayBvbiB0aGUgY29kZSBzdHJ1Y3R1cmUgLSB0aGUgb3ZlcmFsbCBhbW91bnQg
b2YgaW5kZW50YXRpb24Kd291bGQgaGF2ZSBiZWVuIGxlc3MgaWYgeW91IG5lZ2F0ZWQgdGhlIGlm
KCkgZXhwcmVzc2lvbi4KCj4gQEAgLTQwNSw2ICs0ODksMTAgQEAgc3RhdGljIGludCBjb250cm9s
X3RocmVhZF9mbihjb25zdCBzdHJ1Y3QgbWljcm9jb2RlX3BhdGNoICpwYXRjaCkKPiAgICAgICAq
Lwo+ICAgICAgd2F0Y2hkb2dfZGlzYWJsZSgpOwo+ICAKPiArICAgIG5taV9wYXRjaCA9IHBhdGNo
Owo+ICsgICAgc21wX3dtYigpOwo+ICsgICAgc2F2ZWRfbm1pX2NhbGxiYWNrID0gc2V0X25taV9j
YWxsYmFjayhtaWNyb2NvZGVfbm1pX2NhbGxiYWNrKTsKPiArCj4gICAgICAvKiBBbGxvdyB0aHJl
YWRzIHRvIGNhbGwgaW4gKi8KPiAgICAgIHNldF9zdGF0ZShMT0FESU5HX0NBTExJTik7CgpTZWVp
bmcgdGhlIGJsYW5rIGxpbmUgeW91IGtlZXAgaGVyZSBhZnRlciB3YXRjaGRvZ19kaXNhYmxlKCks
IC4uLgoKPiBAQCAtNDU1LDYgKzU1Miw5IEBAIHN0YXRpYyBpbnQgY29udHJvbF90aHJlYWRfZm4o
Y29uc3Qgc3RydWN0IG1pY3JvY29kZV9wYXRjaCAqcGF0Y2gpCj4gICAgICAvKiBNYXJrIGxvYWRp
bmcgaXMgZG9uZSB0byB1bmJsb2NrIG90aGVyIHRocmVhZHMgKi8KPiAgICAgIHNldF9zdGF0ZShM
T0FESU5HX0VYSVQpOwo+ICAKPiArICAgIHNldF9ubWlfY2FsbGJhY2soc2F2ZWRfbm1pX2NhbGxi
YWNrKTsKPiArICAgIHNtcF93bWIoKTsKPiArICAgIG5taV9wYXRjaCA9IFpFUk9fQkxPQ0tfUFRS
Owo+ICAgICAgd2F0Y2hkb2dfZW5hYmxlKCk7CgouLi4gZm9yIGNvbnNpc3RlbmN5IHRoZXJlIHdv
dWxkIGJldHRlciBoYXZlIGJlZW4gb25lIGxlZnQgYWhlYWQgb2YKd2F0Y2hkb2dfZW5hYmxlKCkg
aGVyZSBhcyB3ZWxsLgoKUHJlZmVyYWJseSB3aXRoIGF0IGxlYXN0IHRoZSBmaXJzdCBhbmQgbGFz
dCBpdGVtcyB0YWtlbiBjYXJlIG9mCih3aGljaCBvdWdodCB0byBiZSBlYXN5IGVub3VnaCB0byBk
byB3aGlsZSBjb21taXR0aW5nKQpSZXZpZXdlZC1ieTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1
c2UuY29tPgoKSmFuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9y
ZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
