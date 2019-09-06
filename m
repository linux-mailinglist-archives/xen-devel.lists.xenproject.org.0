Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 95C34AB6EE
	for <lists+xen-devel@lfdr.de>; Fri,  6 Sep 2019 13:12:17 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i6C7Q-0006Hk-Ly; Fri, 06 Sep 2019 11:09:32 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=A/eH=XB=citrix.com=george.dunlap@srs-us1.protection.inumbo.net>)
 id 1i6C7P-0006Hf-UA
 for xen-devel@lists.xenproject.org; Fri, 06 Sep 2019 11:09:31 +0000
X-Inumbo-ID: cc8637d2-d096-11e9-978d-bc764e2007e4
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id cc8637d2-d096-11e9-978d-bc764e2007e4;
 Fri, 06 Sep 2019 11:09:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1567768171;
 h=to:cc:from:subject:message-id:date:mime-version:
 content-transfer-encoding;
 bh=I9RGcfs9ceBGDAsrkLi/KLT4kRBa3KQ3abrhH7EGETk=;
 b=NQoz2AEdXQdqLX9xtIbA4S2aU17sDm/8WAiJNIewes6jZhFkaNWzZQcA
 ZRItTPRGRl82By+vMUfPg8jHbKiU2xdGJAsu20B3VmFKIAjL0WBmCY0zg
 UDtC9FDmGsHSbdtbohlslwR835FA9QBPe+KWiEvbQihqGLFnAvNanfOwK c=;
Authentication-Results: esa2.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=george.dunlap@citrix.com;
 spf=Pass smtp.mailfrom=George.Dunlap@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 george.dunlap@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="George.Dunlap@citrix.com";
 x-sender="george.dunlap@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa2.hc3370-68.iphmx.com: domain of
 George.Dunlap@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="George.Dunlap@citrix.com";
 x-sender="George.Dunlap@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="George.Dunlap@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: JtP2gkfFc45u6GFp0O04nlalaMyuqDGNC/DQ+VIgMH+AShOQB0bf9N32WqymiS9Gc9r//zNN93
 rpDT89DXVgTjq0C29zB39AuzmyJR0EF0ewgASjm6VAuTDqaCc5jUSqQ39hCD35qEyUxGMrwKsk
 KY/GurrAIIzQRijWRUrtipfQsGV5tYWcFrBKjQr9pMdZgTXg1C0X1Ep4P+HIaNOfi5THbVPuWf
 YLcxS/dk9EtsJ8QzVNujqzwCCu9BES6n1yqbBgW3TygpryJwJADTrLOHTin5DBto3B+c0PMUP5
 LXI=
X-SBRS: 2.7
X-MesageID: 5230321
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,472,1559534400"; 
   d="scan'208";a="5230321"
To: xen-devel <xen-devel@lists.xenproject.org>
From: George Dunlap <george.dunlap@citrix.com>
Openpgp: preference=signencrypt
Autocrypt: addr=george.dunlap@citrix.com; prefer-encrypt=mutual; keydata=
 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
 rIFfe2Dk+lD9A9BVd2rfoHA=
Message-ID: <97e1bfe4-3383-ff1d-bf61-48b8aa63bb2c@citrix.com>
Date: Fri, 6 Sep 2019 12:09:27 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
Content-Language: en-US
Subject: [Xen-devel] RFC: Criteria for checking in core scheduling series
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
Cc: Juergen Gross <jgross@suse.com>, Lars Kurth <lars.kurth@citrix.com>,
 Dario Faggioli <dario.faggioli@citrix.com>,
 Andrew Cooper <Andrew.Cooper3@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

VGhlcmUgd2FzIGEgZGlzY3Vzc2lvbiBvbiB0aGUgY29tbXVuaXR5IGNhbGwgYWJvdXQgdGhlIGNv
cmUgc2NoZWR1bGluZwpzZXJpZXMgYmVpbmcgZGV2ZWxvcGVkIGJ5IEp1ZXJnZW4gR3Jvc3MgWzFd
LiAgVGhlIGNvbmNsdXNpb24gY2FuIGJlCnN1bW1hcml6ZWQgYXMgZm9sbG93czoKCiogV2Ugbm9y
bWFsbHkgd2FpdCB0byBjaGVjayBpbiBzZXJpZXMgdW50aWwgdGhleSBhcmUgcXVpdGUgZ29vZCAt
LSBhbGwKdGhlIGkncyBkb3R0ZWQgYW5kIGFsbCB0aGUgdCdzIGNyb3NzZWQKCiogVGhpcyBpcyBm
b3Igc2V2ZXJhbCByZWFzb25zOyBwcmltYXJpbHkgYmVjYXVzZSBvbmNlIGNvZGUgZ2V0cyBjaGVj
a2VkCmluLCBpdCByYXJlbHkgZ2V0cyBsb29rZWQgYXQgYWdhaW4uICBJbiBwYXJ0aWN1bGFyLCB0
aGVyZSdzIG5vdGhpbmcKc3RvcHBpbmcgdGhlIHN1Ym1pdHRlciBmcm9tIG5lZ2xlY3RpbmcgdG8g
ZG8gaW1wb3J0YW50IGNsZWFuLXVwcywgaW4Kc3BpdGUgb2YgdGhlaXIgYmVzdCBpbnRlbnRpb25z
OyBsZWF2aW5nIHRoZSBtYWludGFpbmVyIG9yIHRoZSByZXN0IG9mCnRoZSBjb21tdW5pdHkgdG8g
ZG8gaXQuCgoqIEhvd2V2ZXIsIGZvciBwYXJ0aWN1bGFybHkgbG9uZywgY29tcGxpY2F0ZWQgc2Vy
aWVzIGxpa2UgdGhlIGNvcmUKc2NoZWR1bGluZyBzZXJpZXMsIHRoaXMgY2FuIGhhdmUgc2lnbmlm
aWNhbnQgZG93bnNpZGVzLiAgUmViYXNpbmcgYQo2MC1wYXRjaCBicmFuY2ggcmVndWxhcmx5IGlz
IGEgbG90IG9mIGNodXJuIGZvciBsaXR0bGUgdmFsdWU7IGFuZCBjb3JlCnBhcnRzIG9mIHRoZSBz
ZXJpZXMgd2hpY2ggYXJlIG1vc3RseSBjb21wbGV0ZSBhcmUgY3VycmVudGx5IG9ubHkgZ2V0dGlu
ZwpzcG9yYWRpYyBkZXYgdGVzdGluZyByYXRoZXIgdGhhbiB0aGUgd2lkZSByYW5nZSBvZiB0ZXN0
aW5nIHRoZXkgd291bGQKZ2V0IGZyb20gYmVpbmcgaW4gc3RhZ2luZy4KCiogWGVuU2VydmVyIGFu
ZCBTdVNFIGFyZSBib3RoIGxvbmctdGVybSBjb21tdW5pdHkgbWVtYmVycyB3aXRoIGEgc3Ryb25n
CmluY2VudGl2ZSB0byBtYWludGFpbiBhbmQgaW1wcm92ZSB0aGUgZmVhdHVyZTsgc28gdGhlIHJp
c2sgb2YgdGhlCmZlYXR1cmUgYmVpbmcgbGVmdCBmb3IgdGhlIGNvbW11bml0eSB0byBtYWludGlh
biBpcyByZWxhdGl2ZWx5IG5vdy4KCldpdGggYWxsIHRob3NlIHRoaW5ncyBpbiBtaW5kLCB0aGUg
Y29uY2x1c2lvbiB3YXMgdG8gbG93ZXIgdGhlCiJjaGVjay1pbiIgdGhyZXNob2xkIGZyb20gd2hh
dCBpdCBub3JtYWxseSBpcywgaW4gb3JkZXIgdG8gYWxsb3cgdGhlCnNlcmllcyB0byBiZSBjaGVj
a2VkIGluIGluIHRoZSBuZWFyIGZ1dHVyZSwgaW4gZW5vdWdoIHRpbWUgYXQgbGVhc3QgZm9yCnRo
ZSAiZGVmYXVsdCBvZmYiIHRvIGJlIHdlbGwtdGVzdGVkIGJ5IHRoZSA0LjEzIHJlbGVhc2UuCgpU
aGUgY3JpdGVyaWEgd2Ugc2tldGNoZWQgb3V0IHdlcmU6CgoqIEFsbCB0aGUgcGF0Y2hlcyBzdGls
bCBuZWVkIGFwcHJvcHJpYXRlIEFjayAvIFItYidzCgoqIFRoZXJlIHNob3VsZCBiZSByZWFzb24g
dG8gYmVsaWV2ZSB0aGF0IHRoZSBzZXJpZXMgd2lsbCBoYXZlIGxpdHRsZSB0bwpubyBpbXBhY3Qg
b24gInRocmVhZCBtb2RlIiAodGhyZWFkcyBiZWluZyB0aGUgdW5pdCBvZiBzY2hlZHVsaW5nOyBp
LmUuLAp0aGUgc3RhdHVzIHF1bykKCldSVCB0aGUgc2Vjb25kIHBvaW50LCBhcHBhcmVudGx5IFhl
blNlcnZlciBoYXZlIGJlZW4gdGVzdGluZyB0aGUgc2VyaWVzCnJlZ3VsYXJseSBmb3Igc29tZSB0
aW1lLCBhbmQgYXJlIHNhdGlzZmllZCBmcm9tIGEgdGVzdGluZyBwZXJzcGVjdGl2ZQp0aGF0IHRo
ZXJlIGlzIG5vIHNpZ25pZmljYW50IGRlZ3JhZGF0aW9uIGZvciB0aGUgc2VyaWVzIHdoZW4gaW4g
InRocmVhZAptb2RlIi4KClNvIHRoaXMgd291bGQgcmVhbGx5IGJlIGEgcmVjb21tZW5kYXRpb24g
LyBsaWNlbnNlIHRvIHRoZSB2YXJpb3VzCm1haW50YWluZXJzIGludm9sdmVkOyBwcmltYXJpbHkg
RGFyaW8sIEkgdGhpbmsgKHNpbmNlIEkgcHJvYmFibHkgd29uJ3QKaGF2ZSB0aW1lIHRvIHJldmll
dyB0aGUgc2VyaWVzKS4KCk5vIGRlY2lzaW9ucyBhcmUgb2ZmaWNpYWwgdW50aWwgZGlzY3Vzc2Vk
IG9uIHhlbi1kZXZlbDsgc28gdGhlIGRlY2lzaW9uCndpbGwgbm90IGJlIGNvbnNpZGVyZWQgb2Zm
aWNpYWwgdW50aWwgYSBmZXcgZGF5cyBoYXZlIHBhc3NlZCB3aXRob3V0Cm9iamVjdGlvbi4gIEFu
ZCBvZiBjb3Vyc2UsIGlmIGFueW9uZSBhdCB0aGUgbWVldGluZyBoYWQgYSBkaWZmZXJlbnQKdW5k
ZXJzdGFuZGluZyBvZiB3aGF0IHdhcyBzYWlkLCBvciBoYXMgc29tZXRoaW5nIHRvIGFkZCwgcGxl
YXNlIGRvIHNvLgoKVGhhbmtzLAogLUdlb3JnZQoKWzFdIGh0dHBzOi8vcGF0Y2hldy5vcmcvWGVu
LzIwMTkwODA5MTQ1ODMzLjEwMjAtMS1qZ3Jvc3NAc3VzZS5jb20vCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhl
bi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3Jn
L21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
