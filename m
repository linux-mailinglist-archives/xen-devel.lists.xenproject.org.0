Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C4E9510D8CC
	for <lists+xen-devel@lfdr.de>; Fri, 29 Nov 2019 18:15:04 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iajn5-0003fn-8Q; Fri, 29 Nov 2019 17:10:47 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=1wlA=ZV=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1iajn4-0003fi-2u
 for xen-devel@lists.xenproject.org; Fri, 29 Nov 2019 17:10:46 +0000
X-Inumbo-ID: 2e23b750-12cb-11ea-83b8-bc764e2007e4
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 2e23b750-12cb-11ea-83b8-bc764e2007e4;
 Fri, 29 Nov 2019 17:10:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1575047445;
 h=from:mime-version:content-transfer-encoding:message-id:
 date:to:cc:subject:in-reply-to:references;
 bh=QgXph9oHPVs6aHuU0GRKJpt755eL/dedNWYvkFgDpyA=;
 b=HfOtAJNYU5dqFDjZvxdk0ntAHE0Gqa7S6/flg4JeF70qbaivyw+lhaix
 ZvgESvLnUs6QpoRnHA8EgRwuBqWUBMOCPRU7iD7/m0f5qCtmYTpr6Nao3
 oBn6//+XVWGA/HpXyjyRdqu6xHPyxYCo0hdwD4JAmev/vdlts6ZkbJKkF 8=;
Authentication-Results: esa4.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=ian.jackson@citrix.com;
 spf=Pass smtp.mailfrom=Ian.Jackson@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 ian.jackson@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="ian.jackson@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa4.hc3370-68.iphmx.com: domain of
 Ian.Jackson@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="Ian.Jackson@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: oFm5dLND65GH4e1Y+VJewzLaLXYZB86V9OrqiSZqnBh2Wqk+DNUDQ9LBsDk8iWmU2LuZJxnuV+
 ePSfgZ7i+0xPf4cGn9TTKoC6mny1qoh+jyfeyzmLbKZCHv0ens4SXZ8wabHW3TRCugqQ079bS2
 s9hbOnfktFwpd1i4W5OYP1WBuwHZqexVyvL07P8qqzM1N9/EELX3i/qZY8ElACbuRnEVosWyiF
 GQMql9EzTV0TYFV4/sXKV+fBua1r+M+A/O005+tp8YzZMv8dWngua+i+nNRypoxI3HU9M4PYiE
 5PA=
X-SBRS: 2.7
X-MesageID: 9543370
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.69,257,1571716800"; 
   d="scan'208";a="9543370"
From: Ian Jackson <ian.jackson@citrix.com>
MIME-Version: 1.0
Message-ID: <24033.20753.559360.762756@mariner.uk.xensource.com>
Date: Fri, 29 Nov 2019 17:10:41 +0000
To: "Durrant, Paul" <pdurrant@amazon.com>, Wei Liu <wl@xen.org>, "Anthony
 Perard" <anthony.perard@citrix.com>
In-Reply-To: <24033.16985.749977.747490@mariner.uk.xensource.com>
References: <20191128165224.2959-1-pdurrant@amazon.com>
 <20191129124427.l7wyupz5mcn7nx57@debian>
 <24033.15733.686597.694978@mariner.uk.xensource.com>
 <428ff7e73f654f5c89cd0837f69002dd@EX13D32EUC003.ant.amazon.com>
 <24033.16985.749977.747490@mariner.uk.xensource.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)
Subject: Re: [Xen-devel] [PATCH-for-4.13 v5] Rationalize max_grant_frames
 and max_maptrack_frames handling
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 Andrew Cooper <Andrew.Cooper3@citrix.com>, George
 Dunlap <George.Dunlap@citrix.com>,
 Marek =?iso-8859-1?Q?Marczykowski-G=F3recki?=
 <marmarek@invisiblethingslab.com>, Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SWFuIEphY2tzb24gd3JpdGVzICgiUkU6IFtQQVRDSC1mb3ItNC4xMyB2NV0gUmF0aW9uYWxpemUg
bWF4X2dyYW50X2ZyYW1lcyBhbmQgbWF4X21hcHRyYWNrX2ZyYW1lcyBoYW5kbGluZyIpOgo+IEkg
dGhpbmsgb3VyIHByb3Bvc2FsIGlzIHRvIGRyb3AgdGhlIHR5cGUgY2hhbmdlLCBjb250aW51ZSB0
byB1c2UKPiB1aW50MzJfdCBldmVyd2hlcmUgZm9yIHRoZXNlIHZhbHVlcywgYW5kIHNwZWNpZnkg
dGhlICJ1c2UgZGVmYXVsdCIKPiB2YWx1ZSB0byBiZSBhbGwtYml0cy1zZXQuCgpGb2xsb3dpbmcg
ZGlzY3Vzc2lvbiBvbiBJUkM6CgpJIHRoaW5rIHdlIHRvb2xzdGFjayBtYWludGFpbmVycyBkbyBu
b3QgdGhpbmsgaXQgcmlnaHQgdG8gY2hhbmdlIHRoZQp0eXBlIGFueXdoZXJlLCBidXQgdGhlIGh5
cGVydmlzb3IgQVBJL0FCSSBpcyBvdXRzaWRlIG91ciBiYWlsaXdpY2suCgpDaGFuZ2luZyB0aGUg
dHlwZSBpbiB0aGUgbGlieGwgQVBJIGlzIGRlZmluaXRlbHkgdW5kZXNpcmFibGUgaW4gdGhpcwpw
YXRjaCwgZXNwZWNpYWxseSBhcyB3ZSB3aWxsIHdhbnQgdG8gYmFja3BvcnQgaXQuICBDaGFuZ2lu
ZyB0aGUgdHlwZQpjYW4gY2F1c2UgY29tcGlsZSBlcnJvcnMgaW4gY2FsbGVycyAod2hvIGFyZSBv
dXQgb2YgdHJlZSksIG9yIGV2ZW4Kd3JvbmcgYmVoYXZpb3Vycy4KCldlIChBbnRob255IGFuZCBJ
LCBhdCBsZWFzdCwgaGF2aW5nIGRpc2N1c3NlZCBpdCkgZmVlbCB0aGF0IHRoZQpsaWJ4bF90eXBl
cy5pZGwgdHlwZSBzaG91bGQgcmVtYWluIHVuY2hhbmdlZC4KCkZ1cnRoZXJtb3JlLCBpbiB0aGUg
ZXhpc3RpbmcgbGlieGwgQVBJLCBMSUJYTF9NQVhfR1JBTlRfRlJBTUVTX0RFRkFVTFQKYW5kIExJ
QlhMX01BWF9NQVBUUkFDS19GUkFNRVNfREVGQVVMVCBoYXZlIGNvbmNyZXRlIHZhbHVlcy4gIENh
bGxlcnMKbWF5IGhhdmUgZGV2ZWxvcGVkIGNvZGUgd2hpY2ggZG9lcyBzb21ldGhpbmcgbGlrZQpM
SUJYTF9NQVhfR1JBTlRfRlJBTUVTX0RFRkFVTFQqNCB0byBhdm9pZCB0aGUgbWF4X2dyYW50X2Zy
YW1lcyBpc3N1ZS4KV2UgbmVlZCB0byBrZWVwIHRob3NlIGNhbGxlcnMgd29ya2luZy4KCkkgdGhp
bmsgdGhlIGJlc3Qgd2F5IHRvIGRvIHRoaXMgaXMgdG8gcmV0YWluIHRob3NlICNkZWZpbmVzIHdp
dGggdGhlaXIKZXhpc3RpbmcgdmFsdWVzLCBidXQgdG8gZGVjb3VwbGUgdGhlbS4gIEluc3RlYWQs
IHdlIHByb3ZpZGUgYSBuZXcKI2RlZmluZSBmb3IgdGhlIHNlbnRpbmVsIHZhbHVlIGFuZCBjaGFu
Z2UgdGhlIGluaXRfdmFsIGluIHRoZSBJREwgdG8KcmVmZXIgdG8gdGhhdC4KClRoZSBlZmZlY3Qg
aXMgdGhhdCBjYWxsZXJzIHdobyB1c2UgX0RFRkFVTFQgZXhwbGljaXRseSB3aWxsIHNlZSBubwpj
aGFuZ2UgKGFuZCB0aGUgb25seSByZWFzb24gdG8gZG8gdGhhdCB3b3VsZCBwcm9iYWJseSBiZSB0
byBpbmNyZWFzZQppdCBhcyBhIGJ1ZyB3b3JrYXJvdW5kKS4gIENhbGxlcnMgd2hvIGRvIG5vdCBz
ZXQgdGhlIHZhbHVlIGF0IGFsbCB3aWxsCmdldCB0aGUgc2VudGluZWwgdmFsdWUgZnJvbSBpbml0
LCB3aGljaCBnZXRzIHBhc3NlZCB0byB0aGUgaHlwZXJ2aXNvcgphbmQgdXNlZCBhcyB0aGUgZGVm
YXVsdC4KCihJbiBwcmluY2lwbGUgY2FsbGVycyBtaWdodCBjYWxsIF9pbml0IG9uIHRoZSBkb21h
aW4gY29uZmlnIGFuZCB0aGVuCm1vZGlmeSB0aGUgdmFsdWUgdGhleSBnZXQsIGJ1dCBJIHRoaW5r
IHRoYXQgaXMgYm90aCBub3QgZW50aXJlbHkKcmVhc29uYWJsZSBhbmQgcXVpdGUgdW5saWtlbHku
ICBJIHRoaW5rIGZpeGluZyB0aGlzIGlzc3VlIGZvciBvdGhlcnMKY2FsbGVycyBpcyBtb3JlIGlt
cG9ydGFudC4pCgpUbyBkZW1vbnN0cmF0ZSBleGFjdGx5IHdoYXQgSSBtZWFuIGhlcmUgaXMgYSBk
ZWx0YSB3aGljaCBjYW4gYmUKc3F1YXNoZWQgaW50byB2Ni4KCklhbi4KCkZyb20gODZkNmUzYjZl
NTQzNGYwZDg3MmExOTVlZDQ1N2E0YWYyNWEwMDIwOCBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEK
RnJvbTogSWFuIEphY2tzb24gPGlhbi5qYWNrc29uQGV1LmNpdHJpeC5jb20+CkRhdGU6IEZyaSwg
MjkgTm92IDIwMTkgMTY6NTE6NDUgKzAwMDAKU3ViamVjdDogW1BBVENIXSBzcXVhc2ghIFJhdGlv
bmFsaXplIG1heF9ncmFudF9mcmFtZXMgYW5kIG1heF9tYXB0cmFja19mcmFtZXMKIGhhbmRsaW5n
CgotLS0Kdjc6IERvIG5vdCBjaGFuZ2UgdHlwZSBvZiBsaWJ4bCBmaWVsZHMuCiAgICBEbyBub3Qg
Y2hhbmdlIHZhbHVlcyBvZiBMSUJYTF9NQVhfR1JBTlRfRlJBTUVTX0RFRkFVTFQgZXRjLgogICAg
aW4gY2FzZSBzb21lb25lIGhhcyBkb25lIExJQlhMX01BWF9HUkFOVF9GUkFNRVNfREVGQVVMVCo0
LgogICAgRGVwcmVjYXRlIHRob3NlIGFuZCBwcm92aWRlIExJQlhMX01BWF9HUkFOVF9ERUZBVUxU
IGluc3RlYWQuCi0tLQogdG9vbHMvbGlieGwvbGlieGwuaCAgICAgICAgIHwgMTYgKysrKysrKysr
LS0tLS0tLQogdG9vbHMvbGlieGwvbGlieGxfdHlwZXMuaWRsIHwgIDQgKystLQogMiBmaWxlcyBj
aGFuZ2VkLCAxMSBpbnNlcnRpb25zKCspLCA5IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL3Rv
b2xzL2xpYnhsL2xpYnhsLmggYi90b29scy9saWJ4bC9saWJ4bC5oCmluZGV4IGI4MjljMWJiY2Uu
LjU0YWJiOWRiMWYgMTAwNjQ0Ci0tLSBhL3Rvb2xzL2xpYnhsL2xpYnhsLmgKKysrIGIvdG9vbHMv
bGlieGwvbGlieGwuaApAQCAtMzY0LDE1ICszNjQsMTcgQEAKICAqLwogI2RlZmluZSBMSUJYTF9I
QVZFX0JVSUxESU5GT19HUkFOVF9MSU1JVFMgMQogCisjZGVmaW5lIExJQlhMX01BWF9HUkFOVF9E
RUZBVUxUICh+KHVpbnQzMl90KTApCisjZGVmaW5lIExJQlhMX01BWF9HUkFOVF9GUkFNRVNfREVG
QVVMVCAzMiAvKiBkZXByZWNhdGVkICovCisjZGVmaW5lIExJQlhMX01BWF9NQVBUUkFDS19GUkFN
RVNfREVGQVVMVCAxMDI0IC8qIGRlcHJlY2F0ZWQgKi8KIC8qCi0gKiBMSUJYTF9IQVZFX0JVSUxE
SU5GT19TSUdORURfR1JBTlRfTElNSVRTIGluZGljYXRlcyB0aGF0IHRoZQotICogc2lnbmVkIG1h
eF9ncmFudF9mcmFtZXMgYW5kIG1heF9tYXB0cmFja19mcmFtZXMgZmllbGRzIGluCi0gKiBsaWJ4
bF9kb21haW5fYnVpbGRfaW5mbyBhcmUgc2lnbmVkIHF1YW50aXRpZXMuCisgKiBMSUJYTF9IQVZF
X0JVSUxESU5GT19HUkFOVF9ERUZBVUxUIGluZGljYXRlcyB0aGF0IHRoZSBkZWZhdWx0CisgKiB2
YWx1ZXMgb2YgbWF4X2dyYW50X2ZyYW1lcyBhbmQgbWF4X21hcHRyYWNrX2ZyYW1lcyBmaWVsZHMg
aW4KKyAqIGxpYnhsX2RvbWFpbl9idWlsZF9pbmZvIGFyZSB0aGUgc3BlY2lhbCBzZW50aW5lbCB2
YWx1ZQorICogTElCWExfTUFYX0dSQU5UX0RFRkFVTFQgcmF0aGVyIHRoYW4gdGhlIGZpeGVkIHZh
bHVlcyBhYm92ZS4KKyAqIFRoaXMgbWVhbnMgdG8gdXNlIHRoZSBoeXBlcnZpc29yJ3MgZGVmYXVs
dC4KICAqLwotI2RlZmluZSBMSUJYTF9IQVZFX0JVSUxESU5GT19TSUdORURfR1JBTlRfTElNSVRT
IDEKLQotI2RlZmluZSBMSUJYTF9NQVhfR1JBTlRfRlJBTUVTX0RFRkFVTFQgLTEKLSNkZWZpbmUg
TElCWExfTUFYX01BUFRSQUNLX0ZSQU1FU19ERUZBVUxUIC0xCisjZGVmaW5lIExJQlhMX0hBVkVf
QlVJTERJTkZPX0dSQU5UX0RFRkFVTFQgMQogCiAvKgogICogTElCWExfSEFWRV9CVUlMRElORk9f
KiBpbmRpY2F0ZXMgdGhhdCBsaWJ4bF9kb21haW5fYnVpbGRfaW5mbyBoYXMKZGlmZiAtLWdpdCBh
L3Rvb2xzL2xpYnhsL2xpYnhsX3R5cGVzLmlkbCBiL3Rvb2xzL2xpYnhsL2xpYnhsX3R5cGVzLmlk
bAppbmRleCA2M2UyOWJiMmZiLi43OTIxOTUwZjZhIDEwMDY0NAotLS0gYS90b29scy9saWJ4bC9s
aWJ4bF90eXBlcy5pZGwKKysrIGIvdG9vbHMvbGlieGwvbGlieGxfdHlwZXMuaWRsCkBAIC01MTEs
OCArNTExLDggQEAgbGlieGxfZG9tYWluX2J1aWxkX2luZm8gPSBTdHJ1Y3QoImRvbWFpbl9idWls
ZF9pbmZvIixbCiAKICAgICAoInZudW1hX25vZGVzIiwgQXJyYXkobGlieGxfdm5vZGVfaW5mbywg
Im51bV92bnVtYV9ub2RlcyIpKSwKIAotICAgICgibWF4X2dyYW50X2ZyYW1lcyIsICAgIGludGVn
ZXIsIHsnaW5pdF92YWwnOiAnTElCWExfTUFYX0dSQU5UX0ZSQU1FU19ERUZBVUxUJ30pLAotICAg
ICgibWF4X21hcHRyYWNrX2ZyYW1lcyIsIGludGVnZXIsIHsnaW5pdF92YWwnOiAnTElCWExfTUFY
X01BUFRSQUNLX0ZSQU1FU19ERUZBVUxUJ30pLAorICAgICgibWF4X2dyYW50X2ZyYW1lcyIsICAg
IHVpbnQzMiwgeydpbml0X3ZhbCc6ICdMSUJYTF9NQVhfR1JBTlRfREVGQVVMVCd9KSwKKyAgICAo
Im1heF9tYXB0cmFja19mcmFtZXMiLCB1aW50MzIsIHsnaW5pdF92YWwnOiAnTElCWExfTUFYX0dS
QU5UX0RFRkFVTFQnfSksCiAgICAgCiAgICAgKCJkZXZpY2VfbW9kZWxfdmVyc2lvbiIsIGxpYnhs
X2RldmljZV9tb2RlbF92ZXJzaW9uKSwKICAgICAoImRldmljZV9tb2RlbF9zdHViZG9tYWluIiwg
bGlieGxfZGVmYm9vbCksCi0tIAoyLjExLjAKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0
cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlz
dGluZm8veGVuLWRldmVs
