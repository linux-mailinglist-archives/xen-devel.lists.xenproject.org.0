Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C5D4918C19B
	for <lists+xen-devel@lfdr.de>; Thu, 19 Mar 2020 21:43:57 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jF1y4-00073j-5M; Thu, 19 Mar 2020 20:40:40 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=iZ0u=5E=merlin.srs.infradead.org=batv+64936dbce1487ac6d779+6052+infradead.org+dwmw2@srs-us1.protection.inumbo.net>)
 id 1jF1y1-00073e-Vm
 for xen-devel@lists.xenproject.org; Thu, 19 Mar 2020 20:40:38 +0000
X-Inumbo-ID: de16a08e-6a21-11ea-b34e-bc764e2007e4
Received: from merlin.infradead.org (unknown [2001:8b0:10b:1231::1])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id de16a08e-6a21-11ea-b34e-bc764e2007e4;
 Thu, 19 Mar 2020 20:40:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
 Content-Type:MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:
 Content-ID:Content-Description:In-Reply-To:References;
 bh=ZaUiLlUBPZwlqBNMOZ1pdW1++iwhpvcLkEZI17yjGD8=; b=npcqePEsSAquGJ/WW3dCeFwY9x
 2DiLG5ThOtimQKhR1/lAko3OPv6nGCWVTWcSgwkdgqiHIJ3tfxOecejNNQCsmfI8DM4k3u/Mr9PWl
 JUYW3S8BD5hdqY66lbToXh87oGpvAD+aY5pRW37Kp17Be72b+t/Vqa+0c3wJdZjgZu1mrk4DPcfLh
 xdPexEhXZRfDV0BGjrwX9TbZ15SlLT4Fs8B5OEhjbOEceyERltW7WjV2iKJOKZe3eMV/CTmv2SapP
 otl7enSMOuE4924PQ2uvK4+by0+9usjv+bbvF3A7JqN7164CscorLBtGDYg7ljXMHc4Vvj92abM7p
 Ps2aWWoQ==;
Received: from i7.infradead.org ([2001:8b0:10b:1:21e:67ff:fecb:7a92])
 by merlin.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jF1xq-0008QP-4z; Thu, 19 Mar 2020 20:40:26 +0000
Received: from dwoodhou by i7.infradead.org with local (Exim 4.92 #3 (Red Hat
 Linux)) id 1jF1xp-00B7J9-9S; Thu, 19 Mar 2020 20:40:25 +0000
From: David Woodhouse <dwmw2@infradead.org>
To: xen-devel@lists.xenproject.org
Date: Thu, 19 Mar 2020 20:40:24 +0000
Message-Id: <20200319204025.2649661-1-dwmw2@infradead.org>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
X-SRS-Rewrite: SMTP reverse-path rewritten from <dwmw2@infradead.org> by
 merlin.infradead.org. See http://www.infradead.org/rpr.html
Subject: [Xen-devel] [PATCH 1/2] tools/xenstore: Do not abort xenstore-ls if
 a node disappears while iterating
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
Cc: Juergen Gross <jgross@suse.com>, Ian Jackson <ian.jackson@eu.citrix.com>,
 Wei Liu <wl@xen.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

RnJvbTogRGF2aWQgV29vZGhvdXNlIDxkd213QGFtYXpvbi5jby51az4KClRoZSBkb19scygpIGZ1
bmN0aW9uIGhhcyBzb21ld2hhdCBpbmNvbnNpc3RlbnQgaGFuZGxpbmcgb2YgZXJyb3JzLgoKSWYg
cmVhZGluZyB0aGUgbm9kZSdzIGNvbnRlbnRzIHdpdGggeHNfcmVhZCgpIGZhaWxzLCB0aGVuIGRv
X2xzKCkgd2lsbApqdXN0IHF1aWV0bHkgbm90IGRpc3BsYXkgdGhlIGNvbnRlbnRzLgoKSWYgcmVh
ZGluZyB0aGUgbm9kZSdzIHBlcm1pc3Npb25zIHdpdGggeHNfZ2V0X3Blcm1pc3Npb25zKCkgZmFp
bHMsIHRoZW4KZG9fbHMoKSB3aWxsIHByaW50IGEgd2FybmluZywgY29udGludWUsIGFuZCB1bHRp
bWF0ZWx5IHdvbid0IGV4aXQgd2l0aAphbiBlcnJvciBjb2RlICh1bmxlc3MgYW5vdGhlciBlcnJv
ciBoYXBwZW5zKS4KCklmIHJlY3Vyc2luZyBpbnRvIHRoZSBub2RlIHdpdGggeHNfZGlyZWN0b3J5
KCkgZmFpbHMsIHRoZW4gZG9fbHMoKSB3aWxsCmFib3J0IGltbWVkaWF0ZWx5LCBub3QgcHJpbnRp
bmcgYW55IGZ1cnRoZXIgbm9kZXMuCgpGb3IgcGVyc2lzdGVudCBmYWlsdXJlIG1vZGVzIOKAlCBz
dWNoIGFzIEVOT0VOVCBiZWNhdXNlIGEgbm9kZSBoYXMgYmVlbgpyZW1vdmVkLCBvciBFQUNDRVMg
YmVjYXVzZSBpdCBoYXMgaGFkIGl0cyBwZXJtaXNpb25zIGNoYW5nZWQgc2luY2UgdGhlCnhzX2Rp
cmVjdG9yeSgpIG9uIHRoZSBwYXJlbnQgZGlyZWN0b3J5IHJldHVybmVkIGl0cyBuYW1lIOKAlCBp
dCdzCm9idmlvdXNseSBxdWl0ZSBsaWtlbHkgdGhhdCBpZiBlaXRoZXIgb2YgdGhlIGZpcnN0IHR3
byBlcnJvcnMgb2NjdXIgZm9yCmEgZ2l2ZW4gbm9kZSwgdGhlbiBzbyB3aWxsIHRoZSB0aGlyZCBh
bmQgdGh1cyB4ZW5zdG9yZS1scyB3aWxsIGFib3J0LgoKVGhlIEVOT0VOVCBvbmUgaXMgYWN0dWFs
bHkgYSBmYWlybHkgY29tbW9uIGNhc2UsIGFuZCBoYXMgY2F1c2VkIHRvb2xzIHRvCmZhaWwgdG8g
Y2xlYW4gdXAgYSBuZXR3b3JrIGRldmljZSBiZWNhdXNlIGl0ICphcHBhcmVudGx5KiBhbHJlYWR5
CmRvZXNuJ3QgZXhpc3QgaW4geGVuc3RvcmUuCgpUaGVyZSBpcyBhIHNjaG9vbCBvZiB0aG91Z2h0
IHRoYXQgc2F5cywgIldlbGwsIHhlbnN0b3JlLWxzIHJldHVybmVkIGFuCmVycm9yLiBTbyB0aGUg
dG9vbHMgc2hvdWxkIG5vdCB0cnVzdCBpdHMgb3V0cHV0LiIKClRoZSBuYXR1cmFsIGNvcm9sbGFy
eSBvZiB0aGlzIHdvdWxkIHN1cmVseSBiZSB0aGF0IHRoZSB0b29scyBtdXN0IHJlLXJ1bgp4ZW5z
dG9yZS1scyBhcyBtYW55IHRpbWVzIGFzIGlzIG5lY2Vzc2FyeSB1bnRpbCBpdHMgbWFuYWdlcyB0
byBleGl0CndpdGhvdXQgaGl0dGluZyB0aGUgcmFjZSBjb25kaXRpb24uIEkgYW0gbm90IGtlZW4g
b24gdGhhdCBjb25jbHVzaW9uLgoKRm9yIHRoZSBzcGVjaWZpYyBjYXNlIG9mIEVOT0VOVCBpdCBz
ZWVtcyByZWFzb25hYmxlIHRvIGRlY2xhcmUgdGhhdCwKYnV0IGZvciB0aGUgdGltaW5nLCB3ZSBt
aWdodCBhcyB3ZWxsIGp1c3Qgbm90IGhhdmUgc2VlbiB0aGF0IG5vZGUgYXQKYWxsIHdoZW4gY2Fs
bGluZyB4c19kaXJlY3RvcnkoKSBmb3IgdGhlIHBhcmVudC4gQnkgaWdub3JpbmcgdGhlIGVycm9y
LAp3ZSBnaXZlIGFjY2VwdGFibGUgb3V0cHV0LgoKVGhlIGlzc3VlIGNhbiBiZSByZXByb2R1Y2Vk
IGFzIGZvbGxvd3M6CgooZG9tMCkgIyBmb3IgYSBpbiBgc2VxIDEgMTAwMGAgOyBkbwogICAgICAg
ICAgICAgIHhlbnN0b3JlLXdyaXRlIC9sb2NhbC9kb21haW4vMi9mb28vJGEgJGEgOwogICAgICAg
ICBkb25lCgpOb3cgc2ltdWx0YW5lb3VzbHk6CgooZG9tMCkgIyBmb3IgYSBpbiBgc2VxIDEgOTk5
YCA7IGRvCiAgICAgICAgICAgICAgeGVuc3RvcmUtcm0gL2xvY2FsL2RvbWFpbi8yL2Zvby8kYSA7
CiAgICAgICAgIGRvbmUKKGRvbTIpICMgd2hpbGUgdHJ1ZSA7IGRvCiAgICAgICAgICAgICAgLi94
ZW5zdG9yZS1scyAtcCAvbG9jYWwvZG9tYWluLzIvZm9vIHwgZ3JlcCAtYyAxMDAwIDsKICAgICAg
ICAgZG9uZQoKV2Ugc2hvdWxkIGV4cGVjdCB0byBzZWUgbm9kZSAxMDAwIGluIHRoZSBvdXRwdXQs
IGV2ZXJ5IHRpbWUuCgpTaWduZWQtb2ZmLWJ5OiBEYXZpZCBXb29kaG91c2UgPGR3bXdAYW1hem9u
LmNvLnVrPgotLS0KIHRvb2xzL3hlbnN0b3JlL3hlbnN0b3JlX2NsaWVudC5jIHwgMTQgKysrKysr
KysrKy0tLS0KIDEgZmlsZSBjaGFuZ2VkLCAxMCBpbnNlcnRpb25zKCspLCA0IGRlbGV0aW9ucygt
KQoKZGlmZiAtLWdpdCBhL3Rvb2xzL3hlbnN0b3JlL3hlbnN0b3JlX2NsaWVudC5jIGIvdG9vbHMv
eGVuc3RvcmUveGVuc3RvcmVfY2xpZW50LmMKaW5kZXggM2FmYzYzMGFiOC4uYWU3ZWQzZWI5ZSAx
MDA2NDQKLS0tIGEvdG9vbHMveGVuc3RvcmUveGVuc3RvcmVfY2xpZW50LmMKKysrIGIvdG9vbHMv
eGVuc3RvcmUveGVuc3RvcmVfY2xpZW50LmMKQEAgLTE0OCwxNCArMTQ4LDIwIEBAIHN0YXRpYyB2
b2lkIGRvX2xzKHN0cnVjdCB4c19oYW5kbGUgKmgsIGNoYXIgKnBhdGgsIGludCBjdXJfZGVwdGgs
IGludCBzaG93X3Blcm1zCiAgICAgaW50IGk7CiAgICAgdW5zaWduZWQgaW50IG51bSwgbGVuOwog
CisgICAgZSA9IHhzX2RpcmVjdG9yeShoLCBYQlRfTlVMTCwgcGF0aCwgJm51bSk7CisgICAgaWYg
KGUgPT0gTlVMTCkgeworICAgICAgICBpZiAoY3VyX2RlcHRoICYmIGVycm5vID09IEVOT0VOVCkg
eworICAgICAgICAgICAgLyogSWYgYSBub2RlIGRpc2FwcGVhcnMgd2hpbGUgcmVjdXJzaW5nLCBz
aWxlbnRseSBtb3ZlIG9uLiAqLworICAgICAgICAgICAgcmV0dXJuOworICAgICAgICB9CisKKyAg
ICAgICAgZXJyKDEsICJ4c19kaXJlY3RvcnkgKCVzKSIsIHBhdGgpOworICAgIH0KKwogICAgIG5l
d3BhdGggPSBtYWxsb2MoU1RSSU5HX01BWCk7CiAgICAgaWYgKCFuZXdwYXRoKQogICAgICAgZXJy
KDEsICJtYWxsb2MgaW4gZG9fbHMiKTsKIAotICAgIGUgPSB4c19kaXJlY3RvcnkoaCwgWEJUX05V
TEwsIHBhdGgsICZudW0pOwotICAgIGlmIChlID09IE5VTEwpCi0gICAgICAgIGVycigxLCAieHNf
ZGlyZWN0b3J5ICglcykiLCBwYXRoKTsKLQogICAgIGZvciAoaSA9IDA7IGk8bnVtOyBpKyspIHsK
ICAgICAgICAgY2hhciBidWZbTUFYX1NUUkxFTih1bnNpZ25lZCBpbnQpKzFdOwogICAgICAgICBz
dHJ1Y3QgeHNfcGVybWlzc2lvbnMgKnBlcm1zOwotLSAKMi4yMS4wCgoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApY
ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
