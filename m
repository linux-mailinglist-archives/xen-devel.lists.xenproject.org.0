Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 31E6B6B5A5
	for <lists+xen-devel@lfdr.de>; Wed, 17 Jul 2019 06:51:27 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hnbpf-0004jr-Hp; Wed, 17 Jul 2019 04:46:23 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=zX8a=VO=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1hnbpe-0004jm-DE
 for xen-devel@lists.xenproject.org; Wed, 17 Jul 2019 04:46:22 +0000
X-Inumbo-ID: cfd9f336-a84d-11e9-a188-3b28161ec9f1
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id cfd9f336-a84d-11e9-a188-3b28161ec9f1;
 Wed, 17 Jul 2019 04:46:16 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id DA049ACD8;
 Wed, 17 Jul 2019 04:46:15 +0000 (UTC)
To: Zhenzhong Duan <zhenzhong.duan@oracle.com>, linux-kernel@vger.kernel.org
References: <1563095732-16700-1-git-send-email-zhenzhong.duan@oracle.com>
From: Juergen Gross <jgross@suse.com>
Message-ID: <26a6f7a0-3c3a-c333-ff9f-6669fa1101e4@suse.com>
Date: Wed, 17 Jul 2019 06:46:14 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <1563095732-16700-1-git-send-email-zhenzhong.duan@oracle.com>
Content-Language: de-DE
Subject: Re: [Xen-devel] [PATCH v3] xen/pv: Fix a boot up hang revealed by
 int3 self test
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
Cc: sstabellini@kernel.org, Peter Zijlstra <peterz@infradead.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, x86@kernel.org, mingo@redhat.com,
 bp@alien8.de, Andy Lutomirski <luto@kernel.org>,
 xen-devel@lists.xenproject.org, tglx@linutronix.de, boris.ostrovsky@oracle.com
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTQuMDcuMTkgMTE6MTUsIFpoZW56aG9uZyBEdWFuIHdyb3RlOgo+IENvbW1pdCA3NDU3YzBk
YTAyNGIgKCJ4ODYvYWx0ZXJuYXRpdmVzOiBBZGQgaW50M19lbXVsYXRlX2NhbGwoKQo+IHNlbGZ0
ZXN0IikgaXMgdXNlZCB0byBlbnN1cmUgdGhlcmUgaXMgYSBnYXAgc2V0dXAgaW4gaW50MyBleGNl
cHRpb24gc3RhY2sKPiB3aGljaCBjb3VsZCBiZSB1c2VkIGZvciBpbnNlcnRpbmcgY2FsbCByZXR1
cm4gYWRkcmVzcy4KPiAKPiBUaGlzIGdhcCBpcyBtaXNzZWQgaW4gWEVOIFBWIGludDMgZXhjZXB0
aW9uIGVudHJ5IHBhdGgsIHRoZW4gYmVsb3cgcGFuaWMKPiB0cmlnZ2VyZWQ6Cj4gCj4gWyAgICAw
Ljc3Mjg3Nl0gZ2VuZXJhbCBwcm90ZWN0aW9uIGZhdWx0OiAwMDAwIFsjMV0gU01QIE5PUFRJCj4g
WyAgICAwLjc3Mjg4Nl0gQ1BVOiAwIFBJRDogMCBDb21tOiBzd2FwcGVyLzAgTm90IHRhaW50ZWQg
NS4yLjArICMxMQo+IFsgICAgMC43NzI4OTNdIFJJUDogZTAzMDppbnQzX21hZ2ljKzB4MC8weDcK
PiBbICAgIDAuNzcyOTA1XSBSU1A6IDM1MDc6ZmZmZmZmZmY4MjIwM2U5OCBFRkxBR1M6IDAwMDAw
MjQ2Cj4gWyAgICAwLjc3MzMzNF0gQ2FsbCBUcmFjZToKPiBbICAgIDAuNzczMzM0XSAgYWx0ZXJu
YXRpdmVfaW5zdHJ1Y3Rpb25zKzB4M2QvMHgxMmUKPiBbICAgIDAuNzczMzM0XSAgY2hlY2tfYnVn
cysweDdjOS8weDg4Nwo+IFsgICAgMC43NzMzMzRdICA/IF9fZ2V0X2xvY2tlZF9wdGUrMHgxNzgv
MHgxZjAKPiBbICAgIDAuNzczMzM0XSAgc3RhcnRfa2VybmVsKzB4NGZmLzB4NTM1Cj4gWyAgICAw
Ljc3MzMzNF0gID8gc2V0X2luaXRfYXJnKzB4NTUvMHg1NQo+IFsgICAgMC43NzMzMzRdICB4ZW5f
c3RhcnRfa2VybmVsKzB4NTcxLzB4NTdhCj4gCj4gRm9yIDY0Yml0IFBWIGd1ZXN0cywgWGVuJ3Mg
QUJJIGVudGVycyB0aGUga2VybmVsIHdpdGggdXNpbmcgU1lTUkVULCB3aXRoCj4gJXJjeC8lcjEx
IG9uIHRoZSBzdGFjay4gVG8gY29udmVydCBiYWNrIHRvICJub3JtYWwiIGxvb2tpbmcgZXhjZXB0
aW9ucywKPiB0aGUgeGVuIHRodW5rcyBkbyAneGVuXyo6IHBvcCAlcmN4OyBwb3AgJXIxMTsgam1w
IConLgo+IAo+IEUuZy4gRXh0cmFjdGluZyAneGVuX3B2X3RyYXAgeGVuaW50Mycgd2UgaGF2ZToK
PiB4ZW5feGVuaW50MzoKPiAgIHBvcCAlcmN4Owo+ICAgcG9wICVyMTE7Cj4gICBqbXAgeGVuaW50
Mwo+IAo+IEFzIHhlbmludDMgYW5kIGludDMgZW50cnkgY29kZSBhcmUgc2FtZSBleGNlcHQgeGVu
aW50MyBkb2Vzbid0IGdlbmVyYXRlCj4gYSBnYXAsIHdlIGNhbiBmaXggaXQgYnkgdXNpbmcgaW50
MyBhbmQgZHJvcCB1c2VsZXNzIHhlbmludDMuCj4gCj4gU2lnbmVkLW9mZi1ieTogWmhlbnpob25n
IER1YW4gPHpoZW56aG9uZy5kdWFuQG9yYWNsZS5jb20+CgpSZXZpZXdlZC1ieTogSnVlcmdlbiBH
cm9zcyA8amdyb3NzQHN1c2UuY29tPgoKCkp1ZXJnZW4KCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVs
QGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1h
bi9saXN0aW5mby94ZW4tZGV2ZWw=
