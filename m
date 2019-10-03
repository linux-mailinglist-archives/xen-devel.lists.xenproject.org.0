Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FC36C9F8B
	for <lists+xen-devel@lfdr.de>; Thu,  3 Oct 2019 15:35:45 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iG1Bl-0002ms-KX; Thu, 03 Oct 2019 13:30:37 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=PrVC=X4=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1iG1Bj-0002mn-PV
 for xen-devel@lists.xenproject.org; Thu, 03 Oct 2019 13:30:35 +0000
X-Inumbo-ID: fa55c244-e5e1-11e9-9727-12813bfff9fa
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id fa55c244-e5e1-11e9-9727-12813bfff9fa;
 Thu, 03 Oct 2019 13:30:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1570109435;
 h=from:mime-version:content-transfer-encoding:message-id:
 date:to:cc:subject:in-reply-to:references;
 bh=DIs11Udc9BL0WVUk01ZlKAHsCsP65eh7i4oIelOZwLw=;
 b=R01TBH6/a6id/pSAUGCuj1B+6INYLQpvmBw0agIfBRasFfPlFgcsgiJW
 cRl/RFm0nb57s8CYyYa/gsW/XfErsL+Eh2jQi3NM42vBdG0ASvhnn7P69
 ujI4fkbhaKIFrybVK66ocnasYQvXMaDbJv2PBLVki96WNMdXkjjei0OLt E=;
Authentication-Results: esa3.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=ian.jackson@citrix.com;
 spf=Pass smtp.mailfrom=Ian.Jackson@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 ian.jackson@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="ian.jackson@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa3.hc3370-68.iphmx.com: domain of
 Ian.Jackson@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="Ian.Jackson@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: ASGGp48Nb7E+NpglprxCD4/Rz0vPjGij7z6kjYVaGa7KUWQTGLMemDjW/rKry6zhvNQzdAT5sD
 wl3q3CnhNPLfIdEhH0fMqT3BPzjcvW55U7EXEjiDPSyOxXpyEbqva7Ok3pYhHOTd4zpMD1TxO5
 qh4PzqXWg0oJo806fqxSGaBgO6dEb7AOJneolBSph6oovqEDzeOmwAwHrmwglLU2T6OUTQ/ni8
 Vbns04SqH7R3tVluPqYs4jKs/iBSDN0cz0yT4w5mKHURYqjtgqTZ0d/OQZAYi36GIwdw+rq0tu
 q58=
X-SBRS: 2.7
X-MesageID: 6421357
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.67,252,1566878400"; 
   d="scan'208";a="6421357"
From: Ian Jackson <ian.jackson@citrix.com>
MIME-Version: 1.0
Message-ID: <23957.63479.327739.875395@mariner.uk.xensource.com>
Date: Thu, 3 Oct 2019 14:30:31 +0100
To: Paul Durrant <pdurrant@gmail.com>
In-Reply-To: <CACCGGhDXHhuF7z-ezZUWyGGLY8T9a+JDC4_yw-TrCY3HuPyKPQ@mail.gmail.com>
References: <20191001145714.556-1-paul.durrant@citrix.com>
 <23956.51705.860315.343098@mariner.uk.xensource.com>
 <CACCGGhDXHhuF7z-ezZUWyGGLY8T9a+JDC4_yw-TrCY3HuPyKPQ@mail.gmail.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)
Subject: Re: [Xen-devel] [PATCH-for-4.13 v2 0/2] libxl: fix assertion failure
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
Cc: Anthony Perard <anthony.perard@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Paul Durrant <Paul.Durrant@citrix.com>, Juergen Gross <jgross@suse.com>,
 Wei Liu <wl@xen.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

UGF1bCBEdXJyYW50IHdyaXRlcyAoIlJlOiBbWGVuLWRldmVsXSBbUEFUQ0gtZm9yLTQuMTMgdjIg
MC8yXSBsaWJ4bDogZml4IGFzc2VydGlvbiBmYWlsdXJlIik6Cj4gT24gV2VkLCAyIE9jdCAyMDE5
IGF0IDE3OjA0LCBJYW4gSmFja3NvbiA8aWFuLmphY2tzb25AY2l0cml4LmNvbT4gd3JvdGU6Cj4g
PiBJIGFtIGNvbnRpbnVpbmcgdG8gbG9vayBhdCB0aGUgZGVmYXVsdGluZyBhbmQgY29uZmlnIG1h
bmFnZW1lbnQgaGVyZQo+ID4gd2l0aCBhIHZpZXcgdG8gZ2V0dGluZyByaWQgb2Ygc29tZSBvZiB0
aGUgZHVwbGljYXRlZCBjb2RlIGFuZCBtb3ZpbmcKPiA+IGl0IGFsbCBpbnRvIGxpYnhsLgo+IAo+
IFRoYXQgd291bGQgaW5kZWVkIGJlIGJlbmVmaWNpYWwgZm9yIHRoZSBsaWtlcyBvZiBsaWJ2aXJ0
LgoKSSBwcm9wb3NlIHRoZSBmb2xsb3dpbmcgcGxhbiBmb3IgNC4xMzoKCiAqIE1vdmUgdGhlIGRl
ZmF1bHQgY2FsY3VsYXRpb25zIG9mIGJfaW5mby0+c2hhZG93X21lbWtiIGFuZAogICBiX2luZm8t
PmlvbW11X21lbWtiIGZyb20geGxfdm1jb250cm9sLmMgaW50byBsaWJ4bCwgaW4gYSBuZXcKICAg
ZnVuY3Rpb24gbGlieGxfX25lZWRfbWVtb3J5X3NldGRlZmF1bHQsIGNhbGxlZCBmcm9tCiAgIGlu
aXRpYXRlX2RvbWFpbl9jcmVhdGUuICBUaGF0IGhhcyBhY2Nlc3MgdG8gdGhlIHdob2xlIG9mIGNf
aW5mbyBhbmQKICAgYl9pbmZvLgoKICogQ2hhbmdlIHRoZSBBUEkvQUJJIGZvciBsaWJ4bF9kb21h
aW5fbmVlZF9tZW1vcnkgdG8gdGFrZSBhCiAgIGxpYnhsX2RvbWFpbl9jb25maWcuICBJbnRlcm5h
bGx5LCB0aGlzIHdpbGwgY2FsbCBhbiBpbXBsZW1lbnRhdGlvbgogICBmdW5jdGlvbiBsaWJ4bF9f
ZG9tYWluX25lZWRfbWVtb3J5IHdoaWNoIHRha2VzIHRoZSBiX2luZm8gYW5kCiAgIGNfaW5mbyBz
ZXBhcmF0ZWx5LCBhbmQgd2hpY2ggY2FsbHMgbGlieGxfX25lZWRfbWVtb3J5X3NldGRlZmF1bHQu
CiAgIChUaGlzIGlzIHRoZSBvbmx5IG90aGVyIGNhbGwgc2l0ZSBmb3IKICAgbGlieGxfX2RvbWFp
bl9idWlsZF9pbmZvX3NldGRlZmF1bHQuKQoKICogVGhlcmUgd2lsbCBiZSB0aGUgdXN1YWwgYmFj
a3dhcmQgY29tcGF0aWJsZSBhcnJhbmdlbWVudDogaGVyZSwgYQogICBmdW5jdGlvbiBsaWJ4bF9k
b21haW5fbmVlZF9tZW1vcnlfMHgwNDBjMDAsIHdoaWNoIHdpbGwgcGFzcyBOVUxMCiAgIGZvciBj
X2luZm8uICBUaGUgY29kZSBpbiBsaWJ4bF9fbmVlZF9tZW1vcnlfc2V0ZGVmYXVsdCB3aWxsIHVz
ZSAwCiAgIGZvciB0aGUgdHdvIGFkZGl0aW9uYWwgbWVtb3J5IGFtb3VudHMgd2hlbiBjX2luZm8g
aXMgTlVMTC4KCiAqIFRoZSBvdmVyYWxsIGVmZmVjdCBpcyB0aGF0IG9sZCBjYWxsZXJzIHdpbGwg
Z2V0IHRoZSBvbGQgYmVoYXZpb3VyLgogICBOZXcgY2FsbGVycyBnZXQgdGhlIG5ldyByaWdodCBi
ZWhhdmlvdXIuICBUaGlzIGlzIHRoZSBzYW1lIGFzIHRoZQogICBwcmVzZW50IGxpYnhsIDQuMTMg
Y29kZS4gIE5vdGUgdGhhdCBsaWJ4bF9kb21haW5fbmVlZF9tZW1vcnkKICAgYWxyZWFkeSBoYXMg
YW4gQVBJIHN0YWJpbGl0eSBjYXZlYXQuCgogKiBDb25zZXF1ZW50bHksIHRoZSBuZWVkIGZvciBs
aWJ4bF9nZXRfcmVxdWlyZWRfc2hhZG93X21lbW9yeSBhbmQKICAgbGlieGxfZ2V0X3JlcXVpcmVk
X2lvbW11X21lbW9yeSBnb2VzIGF3YXkuICBEZWxldGUgdGhlbSAodGhleSBoYXZlCiAgIG5vdCBi
ZWVuIGluIGFueSByZWxlYXNlIHNvIHdlIGNhbiBqdXN0IGRvIHRoaXMpLgoKICogSW52ZW50IGEg
bmV3IHZhbHVlIGZvciBjX2luZm8tPnBhc3N0aHJvdWdoICJlbmFibGVkIi4gIERlZmF1bHRpbmcK
ICAgd2lsbCBiZSAxLiB0dXJuICJ1bmtub3duIiBpbnRvICJkaXNhYmxlZCIgb3IgImVuYWJsZWQi
IGFjY29yZGluZyB0bwogICB0aGUgY3VycmVudCBsb2dpYyBiYXNlZCBvbiBwY2lkZXZzL2R0ZGVm
czsgMi4gdHVybiAiZW5hYmxlZCIgaW50bwogICBzb21ldGhpbmcgc3BlY2lmaWMgYWNjb3JkaW5n
IHRvIHRoZSBjdXJyZW50IGxvZ2ljIGJhc2VkIG9uIHR5cGUsCiAgIGhhcF9wdF9zaGFyZSwgZXRj
LiAgTWFrZSBzdXJlIHRoaXMgaXMgYWxsIGNvcnJlY3QgaW5zaWRlIGxpYnhsLgoKICogRGVsZXRl
IHRoZSBkZWZhdWx0aW5nIGNvZGUgaW4geGwuICB4bCBjYW4ganVzdCBsZWF2ZSBzZXR0aW5ncyBu
b3QKICAgc3BlY2lmaWVkIGJ5IHRoZSB1c2VyIGFzIGJsYW5rLCBhbmQgbGlieGwgd2lsbCBEVFJU
IHdpdGggdGhlbS4KCldoYXQgZG8gcGVvcGxlIHRoaW5rID8gIEkgcmVhbGx5IHdhbnQgdG8gZml4
IHRoaXMgZm9yIDQuMTMgYmVjYXVzZSB0aGUKY3VycmVudCA0LjEzIEFQSSBpcyBub3Qgb25lIEkg
d2FudCB0byBzdXBwb3J0LgoKPiBQZXJoYXBzIGl0IHdvdWxkIGJlIHJlYXNvbmFibGUgdG8gdW5p
ZnkgdGhlIGNyZWF0ZSBhbmQgYnVpbGQgaW5mbyBhdAo+IGEgbGlieGwgbGV2ZWwgKGV2ZW4gdGhv
dWdoIHRoZXkgbWF5IGZlZWQgaW50byBkaXN0aW5jdCBkb21jdGxzCj4gdW5kZXJuZWF0aCBmb3Ig
dGhlIG1vbWVudCk/CgpZZXMsIGJ1dCB3ZSBhcmUgcHJvYmFibHkgdG9vIGxhdGUgZm9yIHN1Y2gg
YW4gQVBJIGNoYW5nZSBhdCB0aGlzIHBvaW50CmZvciA0LjEzLgoKVGhhbmtzLApJYW4uCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFp
bGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhl
bnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
