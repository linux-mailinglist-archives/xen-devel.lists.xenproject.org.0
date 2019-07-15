Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3971269AFB
	for <lists+xen-devel@lfdr.de>; Mon, 15 Jul 2019 20:45:04 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hn5ur-00008t-HL; Mon, 15 Jul 2019 18:41:37 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Co6f=VM=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1hn5up-00008o-RF
 for xen-devel@lists.xenproject.org; Mon, 15 Jul 2019 18:41:35 +0000
X-Inumbo-ID: 2b1581c2-a730-11e9-8980-bc764e045a96
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 2b1581c2-a730-11e9-8980-bc764e045a96;
 Mon, 15 Jul 2019 18:41:33 +0000 (UTC)
Authentication-Results: esa5.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=andrew.cooper3@citrix.com;
 spf=Pass smtp.mailfrom=Andrew.Cooper3@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 andrew.cooper3@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="andrew.cooper3@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa5.hc3370-68.iphmx.com: domain of
 Andrew.Cooper3@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="Andrew.Cooper3@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: 4Ig+gqmTIINHUqxcnAciJ79LCqqu6tU4rPpoQMguFxXOb66lYKtpa4NrMsOKTElO/9GtU6Y5rN
 7+FKh/TyBxiytjXEBrO4T8sgNZbL1ObX25LgskAJMZP2aEFtNme6XXQ2AeUAMXw+A08Ht6fWUS
 dw3+ZyEqWrlWXe8nvsV0sF6rUY1Ei+C8OTgsYQ3Ygwh7PTufbPF4ReArikXexXGjL7Ow+pq6ie
 WjbvLvHV9quAPVNBsf3GfMR6CZRPKbDdNp6Kaes4QMvJpmUBv+eaQTO5ZP56u259+HUxVt3kvu
 iJc=
X-SBRS: 2.7
X-MesageID: 3036703
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.63,493,1557201600"; 
   d="scan'208";a="3036703"
To: xen-devel <xen-devel@lists.xenproject.org>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Openpgp: preference=signencrypt
Autocrypt: addr=andrew.cooper3@citrix.com; prefer-encrypt=mutual; keydata=
 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
 6+ahAA==
Message-ID: <9db12afc-556e-19ff-5cfc-53c75ef2450e@citrix.com>
Date: Mon, 15 Jul 2019 19:41:30 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
Subject: [Xen-devel] Design session report: Further defences for speculative
 sidechannels
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

U29tZSBudW1wdHkgKG1lKSBmb3Jnb3QgdG8gb3JnYW5pc2UgYSBzY3JpYmUgZm9yIHRoZSBzZXNz
aW9uLCBzbyB0aGVzZQpub3RlcyBhcmUgZnJvbSBtZW1vcnkuICBBcyBhIHJlc3VsdCwgYWxsIGFz
cGVjdHMgYXJlIHVwIGZvciBhcmd1bWVuXlcKZGViYXRlLgoKV2Ugc3RhcnRlZCBieSBkaXNjdXNz
aW5nIENvcmUtYXdhcmUgc2NoZWR1bGluZywgYW5kIGNvdmVyaW5nIHRoZSBwb2ludAp0aGF0IHdo
aWxlIGluIHByaW5jaXBsZSBpdCBtYWtlcyBhbiBhdHRhY2tlcnMgbGlmZSBlYXNpZXIsIGl0IGRv
ZXNuJ3QKbWFrZSBhIGRpZmZlcmVuY2UgaW4gcHJhY3RpY2UuICBBIGRldGVybWluZWQgYXR0YWNr
ZXIgd29uJ3QgYmUgcHV0IG9mZgpieSB0aGUgZXh0cmEgc3RhdHMgcmVxdWlyZWQgdG8gZGV0ZXJt
aW5lIGNvLXJlc2lkZW5jeSwgYW5kIHRoZXJlIGFyZQpwbGVudHkgb2YgcmVzZWFyY2ggcGFwZXJz
IHB1Ymxpc2hlZCB3aXRoIHZhcmlvdXMgdGVjaG5pcXVlcyBpbiB0aGlzIGFyZWEuCgpXZSBhbHNv
IGRpc2N1c3NlZCBzeW5jaHJvbmlzZWQgc2NoZWR1bGluZy4gIFBhcnQgb2YgdGhpcyB3YXMgYW4K
ZXhwbGFuYXRpb24gb2Ygd2h5IGl0IGlzIGJlbGlldmVkIHRvIGJlIHNhZmUgYWx0ZXJuYXRpdmUg
dG8gZGlzYWJsaW5nCkhULiAgUGFydCB3YXMgYSBkaXNjdXNzaW9uIG9mIHRoZSBwZXJmb3JtYW5j
ZSBhc3BlY3RzIGFuZCB3aHkgdGhlIHBlcmYKaGl0IGlzIHN1YnN0YW50aWFsbHkgd29yc2Ugd2hl
biB2aXJ0dWFsaXNlZCB0aGFuIG9uIG5hdGl2ZSwgZHVlIHRvIGEKbGFjayBvZiB2aXJ0dWFsaXNl
ZCBJUEkgc3VwcG9ydCBvbiBhZmZlY3RlZCBoYXJkd2FyZS4KClNvbWUgZGlzY3Vzc2lvbiB3ZW50
IG9uIE1TUl9BUkNIX0NBUFMgdmlydHVhbGlzYXRpb24gc3VwcG9ydCwgYW5kCnN1cHBvcnQgZm9y
IGVJQlJTLiAgVGhpcyB3b3JrIGlzIGFscmVhZHkgb24gYSBUT0RPIGxpc3QsIGFuZCBubyBjb25j
ZXJucwp3ZXJlIHJhaXNlZC4KClRoZSBhcmVhIHdoaWNoIHRvb2sgdXAgYSBsYXJnZSBwYXJ0IG9m
IHRoZSBkaXNjdXNzaW9uIHdhcyB0aGUgY3VycmVudApzdGF0ZSBvZiAibDF0Zl9iYXJyaWVyIi4g
IEluIGN1cnJlbnQgc3RhZ2luZywgd2UgYXJlIGNvbXBpbGluZyBjb2RlCndoaWNoIHRha2VzIGFs
bCBvZiB0aGUgcGVyZm9ybWFuY2UgaGl0LCBhbmQgZ2FpbnMgbm9uZSBvZiB0aGUgc2FmZXR5LgoK
VGhpcyBpcyBiZWNhdXNlIHdlIGZvdWdodCB0aGUgb3B0aW1pc2VyLCBhbmQgdGhlIG9wdGltaXNl
ciB3b24uCgpUaGUgdXNlIG9mIGlubGluZSBhc3NlbWJseSBpcyBjYXVzaW5nIHRoZSBvcHRpbWlz
ZXIgdG8gb3V0LW9mLWxpbmUgdGhlCnByb3RlY3RlZCBwcmVkaWNhdGVzLCB3aGljaCBjYXVzZXMg
dGhlIExGRU5DRSB0byBiZSBlbWl0dGVkIGluIHRoZQppbnN0cnVjdGlvbiBzdHJlYW0gKmJlZm9y
ZSogdGhlIEpjYyB0cnlpbmcgdG8gYmUgcHJvdGVjdGVkLCB3aGljaApyZW5kZXJzIHRoZSBwcm90
ZWN0aW9ucyB1c2VsZXNzLgoKQW5ub3RhdGluZyBhbGwgcHJlZGljYXRlcyB3aXRoIGFsd2F5c19p
bmxpbmUgaXMgYmVsaWV2ZWQgdG8gcmVzb2x2ZSB0aGUKaXNzdWUsIGJ1dCB0aGlzIGlzIGFsbW9z
dCBpbXBvc3NpYmxlIHRvIHNwb3QgZHVyaW5nIHJldmlldywgYXMgYWxsIGl0CnRha2VzIGlzIG9u
ZSBpbnRlcm1lZGlhdGUgbm9uLWFsd2F5c19pbmxpbmUgcHJlZGljYXRlIHRvIGJyZWFrIHRoZQpz
ZWN1cml0eSBhbGwgb3ZlciBhZ2Fpbi4KCkFuIGFsdGVybmF0aXZlIHRvIHRoZSBjdXJyZW50IGFw
cHJvYWNoIHdhcyByYWlzZWQsIHdoaWNoIGludm9sdmVzIHVzaW5nCmEgY29tcGlsZXIgZXh0ZW5z
aW9uLiAgTGludXggaGFzIHVzZWQgY29tcGlsZXIgZXh0ZW5zaW9ucyBmb3Igc2V2ZXJhbApyZWxl
YXNlcyBub3csIGFuZCBmb3JtcyB0aGUgYmFzaXMgb2Ygc2V2ZXJhbCBLU1BQIGZlYXR1cmVzL21p
dGlnYXRpb25zLgoKSXQgaXMgZXhwZWN0ZWQgdGhhdCB3ZSB3b3VsZCBiZSBhYmxlIHRvIGV4cHJl
c3MgdGhlIHJlcXVpcmVkIHByb3RlY3Rpb25zCiB1c2luZyBhIGNvbXBpbGVyIHBsdWdpbiByYXRo
ZXIgdGhhbiB3aXRoIGlubGluZSBhc3NlbWJseSwgd2hpY2gKcHJvdmlkZXMgYSBtdWNoIGNsZWFu
ZXIgYXJndW1lbnQgY29uY2VybmluZyBjb3JyZWN0bmVzcywgYW5kIG1ha2VzIGl0Cmxlc3MgbGlr
ZWx5IHRoYXQgZXJyb3JzIHdpbGwgb2NjdXIgZHVlIHRvIGZpZ2h0aW5nIHdpdGggdGhlIG9wdGlt
aXNlci4KCn5BbmRyZXcKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qu
b3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2
ZWw=
