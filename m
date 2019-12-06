Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 043A811539F
	for <lists+xen-devel@lfdr.de>; Fri,  6 Dec 2019 15:49:24 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1idEru-0001sf-LP; Fri, 06 Dec 2019 14:46:06 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=y5Gr=Z4=gmail.com=julien.grall.oss@srs-us1.protection.inumbo.net>)
 id 1idErt-0001sa-BG
 for xen-devel@lists.xenproject.org; Fri, 06 Dec 2019 14:46:05 +0000
X-Inumbo-ID: 20d000ba-1837-11ea-a1e1-bc764e2007e4
Received: from mail-wr1-f65.google.com (unknown [209.85.221.65])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 20d000ba-1837-11ea-a1e1-bc764e2007e4;
 Fri, 06 Dec 2019 14:46:04 +0000 (UTC)
Received: by mail-wr1-f65.google.com with SMTP id y11so8032397wrt.6
 for <xen-devel@lists.xenproject.org>; Fri, 06 Dec 2019 06:46:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=K1KbWmMrl9qi2pPLbTD5Sn7RqUZn1DRuWFODhnntbiA=;
 b=l/3hn18HsFC2WoBR5oMvqtNKWeNd/Rz7ao35D+Fg5rTZuhX6UNfO6eX1wFiqRDlv/L
 9nwgwZ7cg9s4pJQe1PjgmcHxzYJRvUOWAKX55DY08WGLHsn1ttzgL1gXKZGmqP4MRCpI
 IaX9PwTUE3nm7sRlgt+9B2pws3PD40vhTrNdvTaGnOjPCPNRGFqaRVfdpalAbhtF+JtW
 cRkfzP3hClDiI4mWjOEd7BWiJUli32GmgZVgRI5+/puey5Hv0PYTRZzlfD0fsjPBCZmq
 INnLJSy4Rp8NXI4HS0PS3QBuTB0E4WicYGAP+fg2VOMYx9y4cF7arOzNV+Q+CHZjBqod
 95dQ==
X-Gm-Message-State: APjAAAWaVGCtlM5VDZ7H7mqKIPJOxXPphH++7x9MCA3ZknEF0BDi2WGr
 71cbmSGr0RyaeFoAI0ZYMlk=
X-Google-Smtp-Source: APXvYqyOo5ftfOAbH3nQVI8m9CvAvWmVWFGQ/wvdvAvA/is8XIXFc1XABDyb50mQgxtPCD7PO+R5Wg==
X-Received: by 2002:adf:cf0a:: with SMTP id o10mr15423139wrj.325.1575643563771; 
 Fri, 06 Dec 2019 06:46:03 -0800 (PST)
Received: from a483e7b01a66.ant.amazon.com (54-240-197-234.amazon.com.
 [54.240.197.234])
 by smtp.gmail.com with ESMTPSA id z3sm16208284wrs.94.2019.12.06.06.46.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 06 Dec 2019 06:46:03 -0800 (PST)
To: Jan Beulich <jbeulich@suse.com>
References: <aa92bd0c-f35c-2bf3-d665-4977f83bb0d5@suse.com>
 <8dc4166d-45c3-0a5c-8782-78de1b74ad36@xen.org>
 <271f8148-e74a-3d3b-375d-991d7cb9e475@suse.com>
From: Julien Grall <julien@xen.org>
Message-ID: <eb8c5538-0a7b-fef5-01b6-6458b3b5d24c@xen.org>
Date: Fri, 6 Dec 2019 14:46:02 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:68.0)
 Gecko/20100101 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <271f8148-e74a-3d3b-375d-991d7cb9e475@suse.com>
Content-Language: en-GB
Subject: Re: [Xen-devel] [PATCH] cmdline: treat hyphens and underscores the
 same
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Konrad Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGkgSmFuLAoKT24gMDUvMTIvMjAxOSAxNjo1MCwgSmFuIEJldWxpY2ggd3JvdGU6Cj4gT24gMDUu
MTIuMjAxOSAxNzoyNywgSnVsaWVuIEdyYWxsIHdyb3RlOgo+PiBPbiAwNS8xMi8yMDE5IDE1OjMz
LCBKYW4gQmV1bGljaCB3cm90ZToKPj4+IC0tLSBhL3hlbi9jb21tb24va2VybmVsLmMKPj4+ICsr
KyBiL3hlbi9jb21tb24va2VybmVsLmMKPj4+IEBAIC0yMyw2ICsyMyw0OSBAQCBlbnVtIHN5c3Rl
bV9zdGF0ZSBzeXN0ZW1fc3RhdGUgPSBTWVNfU1RBCj4+PiAgICB4ZW5fY29tbWFuZGxpbmVfdCBz
YXZlZF9jbWRsaW5lOwo+Pj4gICAgc3RhdGljIGNvbnN0IGNoYXIgX19pbml0Y29uc3Qgb3B0X2J1
aWx0aW5fY21kbGluZVtdID0gQ09ORklHX0NNRExJTkU7Cj4+PiAgICAKPj4+ICtzdGF0aWMgaW50
IGNkaWZmKHVuc2lnbmVkIGNoYXIgYzEsIHVuc2lnbmVkIGNoYXIgYzIpCj4+Cj4+IFRoaXMgaXMg
bm90IG9idmlvdXMgZnJvbSB0aGUgbmFtZSBhbmQgdGhlIGltcGxlbWVudGF0aW9uIHdoYXQgaXQg
ZG9lcwo+PiAoaXQgdG9vayBtZSBhIGZldyBtaW51dGVzIHRvIGZpZ3VyZSBpdCBvdXQpLiBTbyBJ
IHRoaW5rIHlvdSB3YW50IHRvIGFkZAo+PiBhIGNvbW1lbnQuCj4gCj4gU3VyZSwgZG9uZS4KPiAK
Pj4+ICt7Cj4+PiArICAgIGludCByZXMgPSBjMSAtIGMyOwo+Pj4gKwo+Pj4gKyAgICBpZiAoIHJl
cyAmJiAoYzEgXiBjMikgPT0gKCctJyBeICdfJykgJiYKPj4+ICsgICAgICAgICAoYzEgPT0gJy0n
IHx8IGMxID09ICdfJykgKQo+Pj4gKyAgICAgICAgcmVzID0gMDsKPj4+ICsKPj4+ICsgICAgcmV0
dXJuIHJlczsKPj4+ICt9Cj4+PiArCj4+PiArLyoKPj4+ICsgKiBTdHJpbmcgY29tcGFyaXNvbiBm
dW5jdGlvbnMgbW9zdGx5IG1hdGNoaW5nIHN0cmNtcCgpIC8gc3RybmNtcCgpLAo+Pj4gKyAqIGV4
Y2VwdCB0aGF0IHRoZXkgdHJlYXQgJy0nIGFuZCAnXycgYXMgbWF0Y2hpbmcgb25lIGFub3RoZXIu
Cj4+PiArICovCj4+PiArc3RhdGljIGludCBfc3RyY21wKGNvbnN0IGNoYXIgKnMxLCBjb25zdCBj
aGFyICpzMikKPj4KPj4gSSB0aG91Z2h0IHdlIHdlcmUgdHJ5aW5nIHRvIGF2b2lkIG5ldyBmdW5j
dGlvbiBuYW1lIHdpdGggbGVhZGluZyBfPwo+IAo+IFdlJ3JlIHRyeWluZyB0byBhdm9pZCBuZXcg
bmFtZSBzcGFjZSB2aW9sYXRpb25zLiBTdWNoIGFyZQo+IC0gaWRlbnRpZmllcnMgc3RhcnRpbmcg
d2l0aCB0d28gdW5kZXJzY29yZXMsCj4gLSBpZGVudGlmaWVycyBzdGFydGluZyB3aXRoIGFuIHVu
ZGVyc2NvcmUgYW5kIGFuIHVwcGVyIGNhc2UgbGV0dGVyLAo+IC0gaWRlbnRpZmllcnMgb2Ygbm9u
LXN0YXRpYyBzeW1ib2xzIHN0YXJ0aW5nIHdpdGggYW4gdW5kZXJzY29yZS4KCkkgYW0gbm90IHN1
cmUgdG8gdW5kZXJzdGFuZCB3aHkgbm9uLXN0YXRpYyBzeW1ib2xzIG9ubHkuIFRoaXMgd291bGQg
CnByZXZlbnQgeW91IHRvIHVzZSB0aGUgdGhlIG5vbi1zdGF0aWMgc3ltYm9sIGlmIHlvdSBoYXBw
ZW4gdG8gcmUtdXNlIHRoZSAKc2FtZSBuYW1lLgoKQW55d2F5LCBob3cgYWJvdXQgY2FsbGluZyBp
dCBjbWRsaW5lX3N0cm5jbXAoKT8gVGhpcyB3b3VsZCBiZSBlYXNpZXIgdG8gCnNwb3QgbWlzdXNl
IG9uIHJldmlldyAoaS5lIHVzaW5nIHN0cm5jbXAoKSByYXRoZXIgdGhhbiBfc3RybmNtcCgpKS4K
CkNoZWVycywKCi0tIApKdWxpZW4gR3JhbGwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3Rz
LnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0
aW5mby94ZW4tZGV2ZWw=
