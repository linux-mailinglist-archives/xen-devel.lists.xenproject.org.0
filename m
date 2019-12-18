Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 80AD8123C76
	for <lists+xen-devel@lfdr.de>; Wed, 18 Dec 2019 02:36:15 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ihODY-0005w3-Fd; Wed, 18 Dec 2019 01:33:36 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=8lPW=2I=amazon.com=prvs=2481dc0fd=elnikety@srs-us1.protection.inumbo.net>)
 id 1ihODW-0005vy-Oe
 for xen-devel@lists.xenproject.org; Wed, 18 Dec 2019 01:33:34 +0000
X-Inumbo-ID: 6778ea9c-2136-11ea-b6f1-bc764e2007e4
Received: from smtp-fw-9101.amazon.com (unknown [207.171.184.25])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 6778ea9c-2136-11ea-b6f1-bc764e2007e4;
 Wed, 18 Dec 2019 01:33:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
 t=1576632815; x=1608168815;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version;
 bh=YX5aKn14c6/o2NvUIllJEdUbLgeEiYMz5ia17hfFzfI=;
 b=DQqklKWBt4x9r8Eo74urI5aHrt9n+aJF4SAY4HGAmdmapT6vVi7CfsPr
 +fVIhpRzPg0hOqfG/4PnUWtrbUMXRJQKWNkUxPf0j9ruOjv6ldcJ8wmiH
 qEIZylGJdjRD4SsMG/5lbWWFRANnr0YlMD2XzSqvbyIjpm4T3cFu7/+d5 M=;
IronPort-SDR: 8jg9l1qXJNeLlvGj91S/r/z8ZpEt5MpSF7/8NLhVa9BBiQYL+s7ybfv1FX7t9qn3eFA0nraswT
 khfX5LY2kT1Q==
X-IronPort-AV: E=Sophos;i="5.69,327,1571702400"; 
   d="scan'208";a="5740179"
Received: from sea32-co-svc-lb4-vlan3.sea.corp.amazon.com (HELO
 email-inbound-relay-2b-c7131dcf.us-west-2.amazon.com) ([10.47.23.38])
 by smtp-border-fw-out-9101.sea19.amazon.com with ESMTP;
 18 Dec 2019 01:33:33 +0000
Received: from EX13MTAUEE002.ant.amazon.com
 (pdx4-ws-svc-p6-lb7-vlan2.pdx.amazon.com [10.170.41.162])
 by email-inbound-relay-2b-c7131dcf.us-west-2.amazon.com (Postfix) with ESMTPS
 id 3EDFAA2704; Wed, 18 Dec 2019 01:33:32 +0000 (UTC)
Received: from EX13D08UEE003.ant.amazon.com (10.43.62.118) by
 EX13MTAUEE002.ant.amazon.com (10.43.62.24) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Wed, 18 Dec 2019 01:33:31 +0000
Received: from EX13MTAUEA002.ant.amazon.com (10.43.61.77) by
 EX13D08UEE003.ant.amazon.com (10.43.62.118) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Wed, 18 Dec 2019 01:33:31 +0000
Received: from dev-dsk-elnikety-1b-cd63f796.eu-west-1.amazon.com (10.15.63.96)
 by mail-relay.amazon.com (10.43.61.169) with Microsoft SMTP Server id
 15.0.1236.3 via Frontend Transport; Wed, 18 Dec 2019 01:33:31 +0000
Received: by dev-dsk-elnikety-1b-cd63f796.eu-west-1.amazon.com (Postfix,
 from userid 6438462)
 id 3AD62A0141; Wed, 18 Dec 2019 01:33:31 +0000 (UTC)
From: Eslam Elnikety <elnikety@amazon.com>
To: <xen-devel@lists.xenproject.org>
Date: Wed, 18 Dec 2019 01:32:57 +0000
Message-ID: <d3fb2800517d79a422acc62628ad362f919824ea.1576630344.git.elnikety@amazon.com>
X-Mailer: git-send-email 2.16.5
In-Reply-To: <cover.1576630344.git.elnikety@amazon.com>
References: <cover.1576630344.git.elnikety@amazon.com>
MIME-Version: 1.0
Precedence: Bulk
Subject: [Xen-devel] [PATCH v2 2/4] x86/microcode: avoid unnecessary
 xmalloc/memcpy of ucode data
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Eslam Elnikety <elnikety@amazon.com>,
 Paul Durrant <pdurrant@amazon.co.uk>, Jan Beulich <jbeulich@suse.com>,
 David Woodhouse <dwmw@amazon.co.uk>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

V2hlbiB1c2luZyBgdWNvZGU9c2NhbmAgYW5kIGlmIGEgbWF0Y2hpbmcgbW9kdWxlIGlzIGZvdW5k
LCB0aGUgbWljcm9jb2RlCnBheWxvYWQgaXMgbWFpbnRhaW5lZCBpbiBhbiB4bWFsbG9jKCknZCBy
ZWdpb24uIFRoaXMgaXMgdW5uZWNlc3Nhcnkgc2luY2UKdGhlIGJvb3RtYXAgd291bGQganVzdCBk
by4gUmVtb3ZlIHRoZSB4bWFsbG9jIGFuZCB4ZnJlZSBvbiB0aGUgbWljcm9jb2RlCm1vZHVsZSBz
Y2FuIHBhdGguCgpUaGlzIGNvbW1pdCBhbHNvIGRvZXMgYXdheSB3aXRoIHRoZSByZXN0cmljdGlv
biBvbiB0aGUgbWljcm9jb2RlIG1vZHVsZQpzaXplIGxpbWl0LiBUaGUgY29uY2VybiB0aGF0IGEg
bGFyZ2UgbWljcm9jb2RlIG1vZHVsZSB3b3VsZCBjb25zdW1lIHRvbwptdWNoIG1lbW9yeSBwcmV2
ZW50aW5nIGd1ZXN0cyBsYXVuY2ggaXMgbWlzcGxhY2VkIHNpbmNlIHRoaXMgaXMgYWxsIHRoZQpp
bml0IHBhdGguIFdoaWxlIGhhdmluZyBzdWNoIHNhZmVndWFyZHMgaXMgdmFsdWFibGUsIHRoaXMg
c2hvdWxkIGFwcGx5CmFjcm9zcyB0aGUgYm9hcmQgZm9yIGFsbCBlYXJseS9sYXRlIG1pY3JvY29k
ZSBsb2FkaW5nLiBIYXZpbmcgaXQganVzdCBvbgp0aGUgYHNjYW5gIHBhdGggaXMgY29uZnVzaW5n
LgoKTG9va2luZyBmb3J3YXJkLCB3ZSBhcmUgYSBiaXQgY2xvc2VyIChpLmUuLCBvbmUgeG1hbGxv
YyBkb3duKSB0byBwdWxsaW5nCnRoZSBlYXJseSBtaWNyb2NvZGUgbG9hZGluZyBvZiB0aGUgQlNQ
IGEgYml0IGVhcmxpZXIgaW4gdGhlIGVhcmx5IGJvb3QKcHJvY2Vzcy4gVGhpcyBjb21taXQgaXMg
dGhlIGxvdyBoYW5naW5nIGZydWl0LiBUaGVyZSBpcyBzdGlsbCBhIHNpemFibGUKYW1vdW50IG9m
IHdvcmsgdG8gZ2V0IHRoZXJlIGFzIHRoZXJlIGFyZSBzdGlsbCBhIGhhbmRmdWwgb2YgeG1hbGxv
YyBpbgptaWNyb2NvZGVfe2FtZCxpbnRlbH0uYy4KCkZpcnN0LCB0aGVyZSBhcmUgeG1hbGxvY3Mg
b24gdGhlIHBhdGggb2YgZmluZGluZyBhIG1hdGNoaW5nIG1pY3JvY29kZQp1cGRhdGUuIFNpbWls
YXIgdG8gdGhlIGNvbW1pdCBhdCBoYW5kLCBzZWFyY2hpbmcgdGhyb3VnaCB0aGUgbWljcm9jb2Rl
CmJsb2IgY2FuIGJlIGRvbmUgb24gdGhlIGFscmVhZHkgcHJlc2VudCBidWZmZXIgd2l0aCBubyBu
ZWVkIHRvIHhtYWxsb2MKYW55IGZ1cnRoZXIuIEV2ZW4gYmV0dGVyLCBkbyB0aGUgZmlsdGVyaW5n
IGluIG1pY3JvY29kZS5jIGJlZm9yZQpyZXF1ZXN0aW5nIHRoZSBtaWNyb2NvZGUgdXBkYXRlIG9u
IGFsbCBDUFVzLiBUaGUgbGF0dGVyIHJlcXVpcmVzIGNhcmVmdWwKcmVzdHJ1Y3R1cmluZyBhbmQg
ZXhwb3NpbmcgdGhlIGFyY2gtc3BlY2lmaWMgbG9naWMgZm9yIGl0ZXJhdGluZyBvdmVyCnBhdGNo
ZXMgYW5kIGRlY2xhcmluZyBhIG1hdGNoLgoKU2Vjb25kLCB0aGVyZSBhcmUgeG1hbGxvY3MgZm9y
IHRoZSBtaWNyb2NvZGUgY2FjaGUuIEhlcmUsIHdlIHdvdWxkIG5lZWQKdG8gZW5zdXJlIHRoYXQg
dGhlIGNhY2hlIGNvcnJlc3BvbmRpbmcgdG8gdGhlIEJTUCBnZXRzIHhtYWxsb2MoKSdkIGFuZApw
b3B1bGF0ZWQgYWZ0ZXIgdGhlIGZhY3QuCgpTaWduZWQtb2ZmLWJ5OiBFc2xhbSBFbG5pa2V0eSA8
ZWxuaWtldHlAYW1hem9uLmNvbT4KLS0tCiB4ZW4vYXJjaC94ODYvbWljcm9jb2RlLmMgfCAzMiAr
KysrLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQogMSBmaWxlIGNoYW5nZWQsIDQgaW5zZXJ0
aW9ucygrKSwgMjggZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEveGVuL2FyY2gveDg2L21pY3Jv
Y29kZS5jIGIveGVuL2FyY2gveDg2L21pY3JvY29kZS5jCmluZGV4IDhiNGQ4Nzc4MmMuLmM4Nzhm
YzcxZmYgMTAwNjQ0Ci0tLSBhL3hlbi9hcmNoL3g4Ni9taWNyb2NvZGUuYworKysgYi94ZW4vYXJj
aC94ODYvbWljcm9jb2RlLmMKQEAgLTEzOCwxMSArMTM4LDYgQEAgc3RhdGljIGludCBfX2luaXQg
cGFyc2VfdWNvZGVfcGFyYW0oY29uc3QgY2hhciAqcykKIH0KIGN1c3RvbV9wYXJhbSgidWNvZGUi
LCBwYXJzZV91Y29kZV9wYXJhbSk7CiAKLS8qCi0gKiA4TUIgb3VnaHQgdG8gYmUgZW5vdWdoLgot
ICovCi0jZGVmaW5lIE1BWF9FQVJMWV9DUElPX01JQ1JPQ09ERSAoOCA8PCAyMCkKLQogdm9pZCBf
X2luaXQgbWljcm9jb2RlX3NjYW5fbW9kdWxlKAogICAgIHVuc2lnbmVkIGxvbmcgKm1vZHVsZV9t
YXAsCiAgICAgY29uc3QgbXVsdGlib290X2luZm9fdCAqbWJpKQpAQCAtMTg3LDMxICsxODIsMTIg
QEAgdm9pZCBfX2luaXQgbWljcm9jb2RlX3NjYW5fbW9kdWxlKAogICAgICAgICBjZCA9IGZpbmRf
Y3Bpb19kYXRhKHAsIF9ibG9iX3N0YXJ0LCBfYmxvYl9zaXplLCAmb2Zmc2V0IC8qIGlnbm9yZSAq
Lyk7CiAgICAgICAgIGlmICggY2QuZGF0YSApCiAgICAgICAgIHsKLSAgICAgICAgICAgICAgICAv
KgotICAgICAgICAgICAgICAgICAqIFRoaXMgaXMgYW4gYXJiaXRyYXJ5IGNoZWNrIC0gaXQgd291
bGQgYmUgc2FkIGlmIHRoZSBibG9iCi0gICAgICAgICAgICAgICAgICogY29uc3VtZWQgbW9zdCBv
ZiB0aGUgbWVtb3J5IGFuZCBkaWQgbm90IGFsbG93IGd1ZXN0cwotICAgICAgICAgICAgICAgICAq
IHRvIGxhdW5jaC4KLSAgICAgICAgICAgICAgICAgKi8KLSAgICAgICAgICAgICAgICBpZiAoIGNk
LnNpemUgPiBNQVhfRUFSTFlfQ1BJT19NSUNST0NPREUgKQotICAgICAgICAgICAgICAgIHsKLSAg
ICAgICAgICAgICAgICAgICAgcHJpbnRrKCJNdWx0aWJvb3QgJWQgbWljcm9jb2RlIHBheWxvYWQg
dG9vIGJpZyEgKCVsZCwgd2UgY2FuIGRvICVkKVxuIiwKLSAgICAgICAgICAgICAgICAgICAgICAg
ICAgIGksIGNkLnNpemUsIE1BWF9FQVJMWV9DUElPX01JQ1JPQ09ERSk7Ci0gICAgICAgICAgICAg
ICAgICAgIGdvdG8gZXJyOwotICAgICAgICAgICAgICAgIH0KLSAgICAgICAgICAgICAgICB1Y29k
ZV9ibG9iLnNpemUgPSBjZC5zaXplOwotICAgICAgICAgICAgICAgIHVjb2RlX2Jsb2IuZGF0YSA9
IHhtYWxsb2NfYnl0ZXMoY2Quc2l6ZSk7Ci0gICAgICAgICAgICAgICAgaWYgKCAhdWNvZGVfYmxv
Yi5kYXRhICkKLSAgICAgICAgICAgICAgICAgICAgY2QuZGF0YSA9IE5VTEw7Ci0gICAgICAgICAg
ICAgICAgZWxzZQotICAgICAgICAgICAgICAgICAgICBtZW1jcHkodWNvZGVfYmxvYi5kYXRhLCBj
ZC5kYXRhLCBjZC5zaXplKTsKKyAgICAgICAgICAgIHVjb2RlX2Jsb2Iuc2l6ZSA9IGNkLnNpemU7
CisgICAgICAgICAgICB1Y29kZV9ibG9iLmRhdGEgPSBjZC5kYXRhOworICAgICAgICAgICAgYnJl
YWs7CiAgICAgICAgIH0KICAgICAgICAgYm9vdHN0cmFwX21hcChOVUxMKTsKLSAgICAgICAgaWYg
KCBjZC5kYXRhICkKLSAgICAgICAgICAgIGJyZWFrOwogICAgIH0KLSAgICByZXR1cm47Ci1lcnI6
Ci0gICAgYm9vdHN0cmFwX21hcChOVUxMKTsKIH0KIHZvaWQgX19pbml0IG1pY3JvY29kZV9ncmFi
X21vZHVsZSgKICAgICB1bnNpZ25lZCBsb25nICptb2R1bGVfbWFwLApAQCAtNzI1LDcgKzcwMSw3
IEBAIHN0YXRpYyBpbnQgX19pbml0IG1pY3JvY29kZV9pbml0KHZvaWQpCiAgICAgICovCiAgICAg
aWYgKCB1Y29kZV9ibG9iLnNpemUgKQogICAgIHsKLSAgICAgICAgeGZyZWUodWNvZGVfYmxvYi5k
YXRhKTsKKyAgICAgICAgYm9vdHN0cmFwX21hcChOVUxMKTsKICAgICAgICAgdWNvZGVfYmxvYi5z
aXplID0gMDsKICAgICAgICAgdWNvZGVfYmxvYi5kYXRhID0gTlVMTDsKICAgICB9Ci0tIAoyLjE3
LjEKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4t
ZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczov
L2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
