Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 30922145EA4
	for <lists+xen-devel@lfdr.de>; Wed, 22 Jan 2020 23:33:45 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iuOXH-0001O1-Kb; Wed, 22 Jan 2020 22:31:43 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=ac9L=3L=amazon.com=prvs=2839ba572=elnikety@srs-us1.protection.inumbo.net>)
 id 1iuOXF-0001NV-N7
 for xen-devel@lists.xenproject.org; Wed, 22 Jan 2020 22:31:41 +0000
X-Inumbo-ID: f327afb4-3d66-11ea-9fd7-bc764e2007e4
Received: from smtp-fw-33001.amazon.com (unknown [207.171.190.10])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id f327afb4-3d66-11ea-9fd7-bc764e2007e4;
 Wed, 22 Jan 2020 22:31:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
 t=1579732297; x=1611268297;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version;
 bh=XVLnbyI/SlwGUPRjs+LfGlAsyj5+DZwVuaaPD2CCjk8=;
 b=RW6LN0pZRAj0xLz71cDKqawj8IDSXLTzy3Pqmp3extN3HFOKh8hg/64t
 /kbXX/yOPIBk2xeR6hbo65TX7KNrv6HfwL5BbbtP0nVcZLRHKdXrtCl6c
 BvR9wq1O2ajS81I1rPFojg0//nbIRK2RLEJOci6P4mC6hjLZS/vCqaL7p c=;
IronPort-SDR: b/Cb17eUpl4Be2938vgHk5NAZy3cIy9n9cb0geHYXKkQ2tfcqvLkDhOXUgaAleZRwlO3Rl2NdF
 gcU48Ayv1tUQ==
X-IronPort-AV: E=Sophos;i="5.70,351,1574121600"; d="scan'208";a="21840710"
Received: from sea32-co-svc-lb4-vlan3.sea.corp.amazon.com (HELO
 email-inbound-relay-2a-c5104f52.us-west-2.amazon.com) ([10.47.23.38])
 by smtp-border-fw-out-33001.sea14.amazon.com with ESMTP;
 22 Jan 2020 22:31:36 +0000
Received: from EX13MTAUEE002.ant.amazon.com
 (pdx4-ws-svc-p6-lb7-vlan3.pdx.amazon.com [10.170.41.166])
 by email-inbound-relay-2a-c5104f52.us-west-2.amazon.com (Postfix) with ESMTPS
 id B03F2A187F; Wed, 22 Jan 2020 22:31:35 +0000 (UTC)
Received: from EX13D08UEE004.ant.amazon.com (10.43.62.182) by
 EX13MTAUEE002.ant.amazon.com (10.43.62.24) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Wed, 22 Jan 2020 22:31:20 +0000
Received: from EX13MTAUWC001.ant.amazon.com (10.43.162.135) by
 EX13D08UEE004.ant.amazon.com (10.43.62.182) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Wed, 22 Jan 2020 22:31:19 +0000
Received: from dev-dsk-elnikety-1b-cd63f796.eu-west-1.amazon.com (10.15.63.96)
 by mail-relay.amazon.com (10.43.162.232) with Microsoft SMTP Server
 id
 15.0.1367.3 via Frontend Transport; Wed, 22 Jan 2020 22:31:18 +0000
Received: by dev-dsk-elnikety-1b-cd63f796.eu-west-1.amazon.com (Postfix,
 from userid 6438462)
 id B5D7EA013F; Wed, 22 Jan 2020 22:31:18 +0000 (UTC)
From: Eslam Elnikety <elnikety@amazon.com>
To: <xen-devel@lists.xenproject.org>
Date: Wed, 22 Jan 2020 22:30:45 +0000
Message-ID: <ced5b600ea66af84a9d53c467f99ec32ed6af742.1579727989.git.elnikety@amazon.com>
X-Mailer: git-send-email 2.16.6
In-Reply-To: <cover.1579727989.git.elnikety@amazon.com>
References: <cover.1579727989.git.elnikety@amazon.com>
MIME-Version: 1.0
Precedence: Bulk
Subject: [Xen-devel] [PATCH v1 3/4] x86/microcode: avoid unnecessary
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
Cc: Wei Liu <wl@xen.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Eslam
 Elnikety <elnikety@amazon.com>, Paul Durrant <pdurrant@amazon.co.uk>,
 David Woodhouse <dwmw@amazon.co.uk>,
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
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
ZWxuaWtldHlAYW1hem9uLmNvbT4KQWNrZWQtYnk6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNl
LmNvbT4KLS0tCiB4ZW4vYXJjaC94ODYvbWljcm9jb2RlLmMgfCAzMiArKysrLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLQogMSBmaWxlIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKSwgMjggZGVs
ZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEveGVuL2FyY2gveDg2L21pY3JvY29kZS5jIGIveGVuL2Fy
Y2gveDg2L21pY3JvY29kZS5jCmluZGV4IGUxZDk4ZmE1NWUuLmE2NjJhN2Y0MzggMTAwNjQ0Ci0t
LSBhL3hlbi9hcmNoL3g4Ni9taWNyb2NvZGUuYworKysgYi94ZW4vYXJjaC94ODYvbWljcm9jb2Rl
LmMKQEAgLTE0MSwxMSArMTQxLDYgQEAgc3RhdGljIGludCBfX2luaXQgcGFyc2VfdWNvZGUoY29u
c3QgY2hhciAqcykKIH0KIGN1c3RvbV9wYXJhbSgidWNvZGUiLCBwYXJzZV91Y29kZSk7CiAKLS8q
Ci0gKiA4TUIgb3VnaHQgdG8gYmUgZW5vdWdoLgotICovCi0jZGVmaW5lIE1BWF9FQVJMWV9DUElP
X01JQ1JPQ09ERSAoOCA8PCAyMCkKLQogdm9pZCBfX2luaXQgbWljcm9jb2RlX3NjYW5fbW9kdWxl
KAogICAgIHVuc2lnbmVkIGxvbmcgKm1vZHVsZV9tYXAsCiAgICAgY29uc3QgbXVsdGlib290X2lu
Zm9fdCAqbWJpKQpAQCAtMTkwLDMxICsxODUsMTIgQEAgdm9pZCBfX2luaXQgbWljcm9jb2RlX3Nj
YW5fbW9kdWxlKAogICAgICAgICBjZCA9IGZpbmRfY3Bpb19kYXRhKHAsIF9ibG9iX3N0YXJ0LCBf
YmxvYl9zaXplLCAmb2Zmc2V0IC8qIGlnbm9yZSAqLyk7CiAgICAgICAgIGlmICggY2QuZGF0YSAp
CiAgICAgICAgIHsKLSAgICAgICAgICAgICAgICAvKgotICAgICAgICAgICAgICAgICAqIFRoaXMg
aXMgYW4gYXJiaXRyYXJ5IGNoZWNrIC0gaXQgd291bGQgYmUgc2FkIGlmIHRoZSBibG9iCi0gICAg
ICAgICAgICAgICAgICogY29uc3VtZWQgbW9zdCBvZiB0aGUgbWVtb3J5IGFuZCBkaWQgbm90IGFs
bG93IGd1ZXN0cwotICAgICAgICAgICAgICAgICAqIHRvIGxhdW5jaC4KLSAgICAgICAgICAgICAg
ICAgKi8KLSAgICAgICAgICAgICAgICBpZiAoIGNkLnNpemUgPiBNQVhfRUFSTFlfQ1BJT19NSUNS
T0NPREUgKQotICAgICAgICAgICAgICAgIHsKLSAgICAgICAgICAgICAgICAgICAgcHJpbnRrKCJN
dWx0aWJvb3QgJWQgbWljcm9jb2RlIHBheWxvYWQgdG9vIGJpZyEgKCVsZCwgd2UgY2FuIGRvICVk
KVxuIiwKLSAgICAgICAgICAgICAgICAgICAgICAgICAgIGksIGNkLnNpemUsIE1BWF9FQVJMWV9D
UElPX01JQ1JPQ09ERSk7Ci0gICAgICAgICAgICAgICAgICAgIGdvdG8gZXJyOwotICAgICAgICAg
ICAgICAgIH0KLSAgICAgICAgICAgICAgICB1Y29kZV9ibG9iLnNpemUgPSBjZC5zaXplOwotICAg
ICAgICAgICAgICAgIHVjb2RlX2Jsb2IuZGF0YSA9IHhtYWxsb2NfYnl0ZXMoY2Quc2l6ZSk7Ci0g
ICAgICAgICAgICAgICAgaWYgKCAhdWNvZGVfYmxvYi5kYXRhICkKLSAgICAgICAgICAgICAgICAg
ICAgY2QuZGF0YSA9IE5VTEw7Ci0gICAgICAgICAgICAgICAgZWxzZQotICAgICAgICAgICAgICAg
ICAgICBtZW1jcHkodWNvZGVfYmxvYi5kYXRhLCBjZC5kYXRhLCBjZC5zaXplKTsKKyAgICAgICAg
ICAgIHVjb2RlX2Jsb2Iuc2l6ZSA9IGNkLnNpemU7CisgICAgICAgICAgICB1Y29kZV9ibG9iLmRh
dGEgPSBjZC5kYXRhOworICAgICAgICAgICAgYnJlYWs7CiAgICAgICAgIH0KICAgICAgICAgYm9v
dHN0cmFwX21hcChOVUxMKTsKLSAgICAgICAgaWYgKCBjZC5kYXRhICkKLSAgICAgICAgICAgIGJy
ZWFrOwogICAgIH0KLSAgICByZXR1cm47Ci1lcnI6Ci0gICAgYm9vdHN0cmFwX21hcChOVUxMKTsK
IH0KIHZvaWQgX19pbml0IG1pY3JvY29kZV9ncmFiX21vZHVsZSgKICAgICB1bnNpZ25lZCBsb25n
ICptb2R1bGVfbWFwLApAQCAtNzM0LDcgKzcxMCw3IEBAIHN0YXRpYyBpbnQgX19pbml0IG1pY3Jv
Y29kZV9pbml0KHZvaWQpCiAgICAgICovCiAgICAgaWYgKCB1Y29kZV9ibG9iLnNpemUgKQogICAg
IHsKLSAgICAgICAgeGZyZWUodWNvZGVfYmxvYi5kYXRhKTsKKyAgICAgICAgYm9vdHN0cmFwX21h
cChOVUxMKTsKICAgICAgICAgdWNvZGVfYmxvYi5zaXplID0gMDsKICAgICAgICAgdWNvZGVfYmxv
Yi5kYXRhID0gTlVMTDsKICAgICB9Ci0tIAoyLjE3LjEKCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZl
bEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxt
YW4vbGlzdGluZm8veGVuLWRldmVs
