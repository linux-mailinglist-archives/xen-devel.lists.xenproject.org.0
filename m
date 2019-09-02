Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FAA2A5B83
	for <lists+xen-devel@lfdr.de>; Mon,  2 Sep 2019 18:45:42 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i4pOz-0000hC-Lp; Mon, 02 Sep 2019 16:42:01 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=jggy=W5=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1i4pOy-0000h5-GP
 for xen-devel@lists.xenproject.org; Mon, 02 Sep 2019 16:42:00 +0000
X-Inumbo-ID: 91482368-cda0-11e9-aea4-12813bfff9fa
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 91482368-cda0-11e9-aea4-12813bfff9fa;
 Mon, 02 Sep 2019 16:41:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1567442513;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=5NAOCSEpEZx+CaX6rJN7LAjUBkjg12Aj+2bif7jg6is=;
 b=FFvC3m4anLAXHdHQbFaFbxCEEZtyFoCodMeeazekiH8BXsYGFMfDXzg0
 C2Sbiioy9ViIN6KYbR+csxu3lKPg1nr4FcdT/m56naE1FFU/agsDu5ATE
 Y/dN0eR+IUfLc9MUvDTNWoiIXZDj0cn9liPfLE2Kr2SuFFkM7ctaUbvc0 A=;
Authentication-Results: esa6.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=andrew.cooper3@citrix.com;
 spf=Pass smtp.mailfrom=Andrew.Cooper3@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 andrew.cooper3@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="andrew.cooper3@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa6.hc3370-68.iphmx.com: domain of
 Andrew.Cooper3@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="Andrew.Cooper3@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: OYLB8ca9u6zO+dvxnKkHPqeuDcVnYgScaJKJ7BgSfl4PS6PkFcWrb/2l/GR7/ZZycC+HdRF3OY
 Tn7Nhp7KQUmgrNmUOkMK+HLoEJL5+Yv8/GwycbBusp/vma9KjJiglpzbvaXZrBzFRtQvbnnDYu
 i7JQg7eDBGUasULkPZLS/JDp2hDLURDVK0YBPyervWe75alQWxF3eO59OBDHuTbBl9NIfe75hp
 c4zvPvELBKymTza5YseGtr8J9SnjiF7NNP9cKOGsP1TgZlG6393l5SVI2moZqGjNp2qWlKn8n0
 JkM=
X-SBRS: 2.7
X-MesageID: 5246137
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,459,1559534400"; 
   d="scan'208";a="5246137"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Date: Mon, 2 Sep 2019 17:41:48 +0100
Message-ID: <20190902164148.28977-3-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20190902164148.28977-1-andrew.cooper3@citrix.com>
References: <20190902164148.28977-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH 2/2] tools/shim: Apply more duct tape to the
 linkfarm logic
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
Cc: Wei Liu <wl@xen.org>, George Dunlap <george.dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Sander
 Eikelenboom <linux@eikelenboom.it>, Jan Beulich <JBeulich@suse.com>,
 Ian Jackson <Ian.Jackson@citrix.com>,
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

U2FuZGVyIHJlcG9ydGVkIGEgYnVpbGQgZmFpbHVyZSB3aGljaCBtYW5pZmVzdHMgYXMgYG1ha2U7
IG1ha2UgaW5zdGFsbGAKZmFpbGluZyB3aXRoOgoKICA8c25pcD4vY3Jvc3MtaW5zdGFsbCAtbTA2
NDQgLXAgeGVuLWRpci94ZW4tc2hpbSAvL3Vzci9sb2NhbC9saWIveGVuL2Jvb3QveGVuLXNoaW0K
ICBpbnN0YWxsOiBjYW5ub3Qgc3RhdCAneGVuLWRpci94ZW4tc2hpbSc6IE5vIHN1Y2ggZmlsZSBv
ciBkaXJlY3RvcnkKICBtYWtlWzRdOiAqKiogW01ha2VmaWxlOjUyOiBpbnN0YWxsXSBFcnJvciAx
CiAgbWFrZVs0XTogTGVhdmluZyBkaXJlY3RvcnkgJy91c3Ivc3JjL25ldy94ZW4tdW5zdGFibGUv
dG9vbHMvZmlybXdhcmUnCgpJdCBoYXMgc3Vic2VxdWVudGx5IGJlZW4gc2VlbiBpbnRlcm1pdHRl
bnRseSBieSBPU1NUZXN0LiAgVGhpcyB3YXMgY2F1c2VkIGJ5CmMvcyAzMmIxZDYyOCB0cmlnZ2Vy
aW5nIGEgcHJlZXhpc3RpbmcgbGlua2Zhcm0gYnVnIGZvciBwYXJ0aWFsIHJlYnVpbGRzLgoKQmV0
d2VlbiB0aGUgZmlyc3QgYG1ha2VgIGFuZCB0aGUgc3Vic2VxdWVudCBgbWFrZSBpbnN0YWxsYCwg
dGhlIGxpbmtmYXJtIGxvZ2ljCm9ic2VydmVzIG5ldyBmaW5hbCBidWlsZCBwcm9kdWN0cyBhbmQg
cmVnZW5lcmF0ZXMgdGhlIGxpbmtmYXJtLiAgVGhpcyBpbmNsdWRlcwphIGRpc3RjbGVhbiwgd2hp
Y2ggdGhyb3dzIGF3YXkgZXZlcnl0aGluZyBmcm9tIHRoZSBmaXJzdCBgbWFrZWAuCgpBcyB0aGUg
eGVuLXNoaW0gcnVsZSB1c2UgYSBzeW1saW5rLCB0aGUgbGluayBpdHNlbGYgcmVtYWlucyBzdGls
bCB1cC10by1kYXRlCmJ1dCBpcyBicm9rZW4gZHVlIHRvIHRoZSBkaXN0Y2xlYW4sIHdoaWNoIGNh
dXNlcyBpbnN0YWxsIHRvIGZhaWwuCgpVcGRhdGUgdGhlIGxpbmtmYXJtIGxvZ2ljIHRvIG5vdCBy
ZWdlbmVyYXRlIGl0c2VsZiB3aGVuIGJ1aWxkIGFydGVmYWN0cwphcHBlYXIuICBUaGlzIGlzbid0
IGEgY29tcHJlaGVuc2l2ZSBmaXggYnV0IGlzIHRoZSBiZXN0IHdoaWNoIGNhbiBiZSBkb25lCmVh
c2lseS4gIEFueSBmdXJ0aGVyIGVmZm9ydCB3b3VsZCBiZSBiZXR0ZXIgc3BlbnQgbWFraW5nIG91
dC1vZi10cmVlIGJ1aWxkcwp3b3JrIGZvciBYZW4uCgpTaWduZWQtb2ZmLWJ5OiBBbmRyZXcgQ29v
cGVyIDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tPgotLS0KQ0M6IElhbiBKYWNrc29uIDxJYW4u
SmFja3NvbkBjaXRyaXguY29tPgpDQzogV2VpIExpdSA8d2xAeGVuLm9yZz4KQ0M6IEphbiBCZXVs
aWNoIDxKQmV1bGljaEBzdXNlLmNvbT4KQ0M6IFJvZ2VyIFBhdSBNb25uw6kgPHJvZ2VyLnBhdUBj
aXRyaXguY29tPgpDQzogR2VvcmdlIER1bmxhcCA8Z2VvcmdlLmR1bmxhcEBldS5jaXRyaXguY29t
PgpDQzogU2FuZGVyIEVpa2VsZW5ib29tIDxsaW51eEBlaWtlbGVuYm9vbS5pdD4KLS0tCiB0b29s
cy9maXJtd2FyZS94ZW4tZGlyL01ha2VmaWxlIHwgMjMgKysrKysrKysrKysrKysrKysrKysrLS0K
IDEgZmlsZSBjaGFuZ2VkLCAyMSBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQoKZGlmZiAt
LWdpdCBhL3Rvb2xzL2Zpcm13YXJlL3hlbi1kaXIvTWFrZWZpbGUgYi90b29scy9maXJtd2FyZS94
ZW4tZGlyL01ha2VmaWxlCmluZGV4IGRmM2Y1YTcwMDYuLjUzODkzMWU5YjQgMTAwNjQ0Ci0tLSBh
L3Rvb2xzL2Zpcm13YXJlL3hlbi1kaXIvTWFrZWZpbGUKKysrIGIvdG9vbHMvZmlybXdhcmUveGVu
LWRpci9NYWtlZmlsZQpAQCAtMTQsNiArMTQsMjYgQEAgTElOS19GSUxFUz1Db25maWcubWsKIERF
UF9ESVJTPSQoZm9yZWFjaCBpLCAkKExJTktfRElSUyksICQoWEVOX1JPT1QpLyQoaSkpCiBERVBf
RklMRVM9JChmb3JlYWNoIGksICQoTElOS19GSUxFUyksICQoWEVOX1JPT1QpLyQoaSkpCiAKKyMg
RXhjbHVkZSBzb21lIGludGVybWVkaWF0ZSBmaWxlcyBhbmQgZmluYWwgYnVpbGQgcHJvZHVjdHMK
K0xJTktfRVhDTFVERVMgOj0gJyouW2lzb2FdJyAnLiouZCcgJy4qLmQyJyAnLmNvbmZpZycKK0xJ
TktfRVhDTFVERVMgKz0gJyoubWFwJyAneGVuJyAneGVuLmd6JyAneGVuLmVmaScgJ3hlbi1zeW1z
JworCisjIFRoaXMgaXMgYWxsIGEgZ2lhbnQgbWVzcyBhbmQgZG9lc24ndCByZWFsbHkgd29yay4K
KyMKKyMgVGhlIGNvcnJlY3Qgc29sdXRpb24gaXMgdG8gZml4IFhlbiB0byBiZSBhYmxlIHRvIGRv
IG91dC1vZi10cmVlIGJ1aWxkcy4KKyMKKyMgVW50aWwgdGhhdCBoYXBwZW5zLCB3ZSBzZXQgdXAg
YSBsaW5rZmFybSBieSBpdGVyYXRpbmcgb3ZlciB0aGUgeGVuLyB0cmVlLAorIyBsaW5raW5nIHNv
dXJjZSBmaWxlcy4gIFRoaXMgaXMgcmVwZWF0ZWQgZWFjaCB0aW1lIHdlIGVudGVyIHRoaXMgZGly
ZWN0b3J5LAorIyB3aGljaCBwb3NlcyBhIHByb2JsZW0gZm9yIGEgdHdvLXN0ZXAgIm1ha2U7IG1h
a2UgaW5zdGFsbCIgYnVpbGQgcHJvY2Vzcy4KKyMKKyMgQW55IHRpbWUgdGhlIGxpc3Qgb2YgZmls
ZXMgdG8gbGluayBjaGFuZ2VzLCB3ZSByZWxpbmsgYWxsIGZpbGVzLCB0aGVuCisjIGRpc3RjbGVh
biB0byB0YWtlIG91dCBub3QtZWFzeS10by1jbGFzc2lmeSBpbnRlcm1lZGlhdGUgZmlsZXMuICBU
aGlzIGlzIHRvCisjIHN1cHBvcnQgZWFzeSBkZXZlbG9wbWVudCBvZiB0aGUgc2hpbSwgYnV0IGhh
cyBhIHNpZGUgZWZmZWN0IG9mIGNsb2JiZXJpbmcKKyMgdGhlIGFscmVhZHktYnVpbHQgc2hpbS4K
KyMKKyMgJChMSU5LX0VYQ0xVREVTKSBzaG91bGQgYmUgc2V0IHN1Y2ggdGhhdCBhIHBhcmFsbGVs
IGJ1aWxkIG9mIHNoaW0gYW5kIHhlbi8KKyMgZG9lc24ndCBjYXVzZSBhIHN1YnNlcXVlbnQgYG1h
a2UgaW5zdGFsbGAgdG8gZGVjaWRlIHRvIHJlZ2VuZXJhdGUgdGhlCisjIGxpbmtmYXJtLiAgVGhp
cyBtZWFucyB0aGF0IGFsbCBmaW5hbCBidWlsZCBhcnRlZmFjdHMgbXVzdCBiZSBleGNsdWRlZC4K
IGxpbmtmYXJtLnN0YW1wOiAkKERFUF9ESVJTKSAkKERFUF9GSUxFUykgRk9SQ0UKIAlta2RpciAt
cCAkKEQpCiAJcm0gLWYgbGlua2Zhcm0uc3RhbXAudG1wCkBAIC0yNSw4ICs0NSw3IEBAIGxpbmtm
YXJtLnN0YW1wOiAkKERFUF9ESVJTKSAkKERFUF9GSUxFUykgRk9SQ0UKIAkJCXNlZCAncyxeJChY
RU5fUk9PVCkvJChkKS8sLGcnIHwgeGFyZ3MgbWtkaXIgLXAgLik7KSBcCiAJJChmb3JlYWNoIGQs
ICQoTElOS19ESVJTKSwgXAogCQkoY2QgJChYRU5fUk9PVCk7IFwKLQkJIGZpbmQgJChkKSAhIC10
eXBlIGwgLXR5cGUgZiBcCi0JCSAkKGFkZHByZWZpeCAhIC1uYW1lICwgJyouW2lzb2FdJyAnLiou
ZCcgJy4qLmQyJykpIFwKKwkJIGZpbmQgJChkKSAhIC10eXBlIGwgLXR5cGUgZiAkKGFkZHByZWZp
eCAhIC1uYW1lICwkKExJTktfRVhDTFVERVMpKSkgXAogCQkgPj4gbGlua2Zhcm0uc3RhbXAudG1w
IDsgKSBcCiAJJChmb3JlYWNoIGYsICQoTElOS19GSUxFUyksIFwKIAkJZWNobyAkKGYpID4+IGxp
bmtmYXJtLnN0YW1wLnRtcCA7KQotLSAKMi4xMS4wCgoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxA
bGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFu
L2xpc3RpbmZvL3hlbi1kZXZlbA==
