Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F16C9F8F0F
	for <lists+xen-devel@lfdr.de>; Tue, 12 Nov 2019 12:59:41 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iUUnm-0002RI-6u; Tue, 12 Nov 2019 11:57:42 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=WcyK=ZE=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1iUUnl-0002RD-Bd
 for xen-devel@lists.xenproject.org; Tue, 12 Nov 2019 11:57:41 +0000
X-Inumbo-ID: 9d96cb44-0543-11ea-a21a-12813bfff9fa
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 9d96cb44-0543-11ea-a21a-12813bfff9fa;
 Tue, 12 Nov 2019 11:57:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1573559856;
 h=from:mime-version:content-transfer-encoding:message-id:
 date:to:subject:in-reply-to:references;
 bh=7UEd8jnM175k1IibRSkZNvyeNKWUy0EQ/jdDlLMgDAc=;
 b=NybCfTnzyXQ9wRuN6mTUXQqWiOzU8Jndg4ZpOtqfswFOINYwW8sZoubu
 4ODoycwgMgbiXaPMy/1TpBC4zDTn/TAgaQFxfYObPlvBLPiA3QmBKu5S/
 XbTnH0eVWV5EQCkM3nrzUIdmIa5hshukI7hzbNzLVmX0Om1bS2JDN0J1k 4=;
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
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: j51eg6ZTPmlaxRIzLvRRQw7rGs2O0B+TOvlo/S8x4Q13/o9uhbMNcoOlYjFaVb44DWG4z27tuv
 ntmqyEae5BO/iHTsqlf85+5oNsvjYAVMoYgN3IQ63m2VG5uDlKKXCvIrn64ime+jeiy1AqCXK7
 C0oJ30O4ADFVLGRE97IvA0lgxryRQiW/ApiKs8muVyiylKLhswjZsns6CZ/8FKgwK3vBPr7onF
 /yZt8r1nYhm0GrQaFj8SnJrN6eAFwQWAEWSu8MDu+dRb5ym7Tb4vrs7tgXvLI73vhHANuUwz8V
 dI4=
X-SBRS: 2.7
X-MesageID: 8183409
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.68,296,1569297600"; 
   d="scan'208";a="8183409"
From: Ian Jackson <ian.jackson@citrix.com>
MIME-Version: 1.0
Message-ID: <24010.40492.241066.724248@mariner.uk.xensource.com>
Date: Tue, 12 Nov 2019 11:57:32 +0000
To: Andrew Cooper <Andrew.Cooper3@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 =?iso-8859-1?Q?J=FCrgen_Gro=DF?= <jgross@suse.com>, Olaf Hering
 <olaf@aepfle.de>, Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
In-Reply-To: <23992.34990.952195.433864@mariner.uk.xensource.com>
References: <20191029175720.7354-1-ian.jackson@eu.citrix.com>
 <bbcb318a-0774-ba98-6f83-49f0ee1c6598@citrix.com>
 <23992.34990.952195.433864@mariner.uk.xensource.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)
Subject: Re: [Xen-devel] [XEN PATCH for-4.13] tools/configure: Honour
 XEN_COMPILE_ARCH and _TARGET_ for shim
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

SWFuIEphY2tzb24gd3JpdGVzICgiUmU6IFtYZW4tZGV2ZWxdIFtYRU4gUEFUQ0ggZm9yLTQuMTNd
IHRvb2xzL2NvbmZpZ3VyZTogSG9ub3VyIFhFTl9DT01QSUxFX0FSQ0ggYW5kIF9UQVJHRVRfIGZv
ciBzaGltIik6Cj4gQW5kcmV3IENvb3BlciB3cml0ZXMgKCJSZTogW1hlbi1kZXZlbF0gW1hFTiBQ
QVRDSCBmb3ItNC4xM10gdG9vbHMvY29uZmlndXJlOiBIb25vdXIgWEVOX0NPTVBJTEVfQVJDSCBh
bmQgX1RBUkdFVF8gZm9yIHNoaW0iKToKPiA+IE9uIDI5LzEwLzIwMTkgMTc6NTcsIElhbiBKYWNr
c29uIHdyb3RlOgo+ID4gPiBUaGUgcHZzaGltIGNhbiBvbmx5IGJlIGJ1aWx0IDY0LWJpdCBiZWNh
dXNlIHRoZSBoeXBlcnZpc29yIGlzIG9ubHkKPiA+ID4gNjQtYml0IG5vd2FkYXlzLiAgVGhlIGh5
cGVydmlzb3IgYnVpbGQgc3VwcG9ydHMgWEVOX0NPTVBJTEVfQVJDSCBhbmQKPiA+ID4gWEVOX1RB
UkdFVF9BUkNIIHdoaWNoIG92ZXJyaWRlIHRoZSBpbmZvcm1hdGlvbiBmcm9tIHVuYW1lLiAgVGhl
IHB2c2hpbQo+ID4gPiBidWlsZCBydW5zIG91dCBvZiB0aGUgdG9vbHMvIGRpcmVjdG9yeSBidXQg
Y2FsbHMgdGhlIGh5cGVydmlzb3IgYnVpbGQKPiA+ID4gc3lzdGVtLgo+ID4gPgo+ID4gPiBJZiBv
bmUgcnVucyBpbiBhIExpbnV4IDMyLWJpdCB1c2VybGFuZCB3aXRoIGEgNjQtYml0IGtlcm5lbCwg
b25lIHVzZWQKPiA+ID4gdG8gYmUgYWJsZSB0byBzZXQgWEVOX0NPTVBJTEVfQVJDSC4gIEJ1dCBu
b3dhZGF5cyB0aGlzIGRvZXMgbm90IHdvcmsuCj4gPiAKPiA+IFRoaXMgbG9va3MgdG8gYmUgYSBi
dWdmaXggdG8gODg0NTE1NWM4MzFjNTllODY3ZWUzZGQzMWVlNjNlMGNjNmM3ZGNmMiA/Cj4gPiAK
PiA+IEluIHBhcnRpY3VsYXIsIHRoaXMgZGVsZXRlZCB0aGUgbG9naWMgdG8gb25seSBidWlsZCB0
aGUgc2hpbSBmb3IKPiA+IFhFTl9UQVJHRVRfQVJDSCAhPSB4ODZfMzIuCj4gCj4gWWVzLiAgSSBo
YXZlIGFkZGVkIGEgbm90ZSBhYm91dCB0aGF0IHRvIHRoZSBjb21taXQgbWVzc2FnZSAoc3RlYWxp
bmcKPiB5b3VyIHRleHQsIHRoYW5rcykgYW5kIG5vdyBJIGFtIENDaW5nIHRoZSBhdXRob3IgYW5k
IHJlcXVlc3RlciBvZiB0aGF0Cj4gY29tbWl0LCBmb3IgZm9ybSdzIHNha2UuCgpBbmRyZXcsIGRp
ZCB5b3Ugd2FudCB0byBhY2sgdGhpcyA/ICBPciBkbyB5b3UgaGF2ZSBmdXJ0aGVyIGNvbW1lbnRz
ID8KSSBoYXZlIGEgcmVsZWFzZS1hY2suLi4KClRoYW5rcywKSWFuLgoKRnJvbSAxYThkZTM2Njk5
YjkwNDJjMzA3OTdlMDVmN2E1ZjQzMTNkN2Y3YWQxIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQpG
cm9tOiBJYW4gSmFja3NvbiA8aWFuLmphY2tzb25AZXUuY2l0cml4LmNvbT4KRGF0ZTogVHVlLCAy
OSBPY3QgMjAxOSAxNzo0NTozMCArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHRvb2xzL2NvbmZpZ3Vy
ZTogSG9ub3VyIFhFTl9DT01QSUxFX0FSQ0ggYW5kIF9UQVJHRVRfIGZvcgogc2hpbQpNSU1FLVZl
cnNpb246IDEuMApDb250ZW50LVR5cGU6IHRleHQvcGxhaW47IGNoYXJzZXQ9VVRGLTgKQ29udGVu
dC1UcmFuc2Zlci1FbmNvZGluZzogOGJpdAoKVGhlIHB2c2hpbSBjYW4gb25seSBiZSBidWlsdCA2
NC1iaXQgYmVjYXVzZSB0aGUgaHlwZXJ2aXNvciBpcyBvbmx5CjY0LWJpdCBub3dhZGF5cy4gIFRo
ZSBoeXBlcnZpc29yIGJ1aWxkIHN1cHBvcnRzIFhFTl9DT01QSUxFX0FSQ0ggYW5kClhFTl9UQVJH
RVRfQVJDSCB3aGljaCBvdmVycmlkZSB0aGUgaW5mb3JtYXRpb24gZnJvbSB1bmFtZS4gIFRoZSBw
dnNoaW0KYnVpbGQgcnVucyBvdXQgb2YgdGhlIHRvb2xzLyBkaXJlY3RvcnkgYnV0IGNhbGxzIHRo
ZSBoeXBlcnZpc29yIGJ1aWxkCnN5c3RlbS4KCklmIG9uZSBydW5zIGluIGEgTGludXggMzItYml0
IHVzZXJsYW5kIHdpdGggYSA2NC1iaXQga2VybmVsLCBvbmUgdXNlZAp0byBiZSBhYmxlIHRvIHNl
dCBYRU5fQ09NUElMRV9BUkNILiAgQnV0IG5vd2FkYXlzIHRoaXMgZG9lcyBub3Qgd29yay4KY29u
ZmlndXJlIHNlZXMgdGhlIHRhcmdldCBjcHUgYXMgNjQtYml0IGFuZCB0cmllcyB0byBidWlsZCBw
dnNoaW0uClRoZSBidWlsZCBwcmludHMKICBlY2hvICIqKiogWGVuIHg4Ni8zMiB0YXJnZXQgbm8g
bG9uZ2VyIHN1cHBvcnRlZCEiCmFuZCBkb2Vzbid0IGJ1aWxkIGFueXRoaW5nLiAgVGhlbiB0aGUg
c3Vic2VxdWVudCBNYWtlZmlsZXMgdHJ5IHRvCmluc3RhbGwgdGhlIG5vbi1idWlsdCBwaWVjZXMu
CgpGaXggdGhpcyBhbm9tYWx5IGJ5IGNhdXNpbmcgY29uZmlndXJlIHRvIGhvbm91ciB0aGUgWGVu
IGh5cGVydmlzb3Igd2F5Cm9mIHNldHRpbmcgdGhlIHRhcmdldCBhcmNoaXRlY3R1cmUuCgpJbiBw
cmluY2lwbGUgdGhpcyB1c2VyIGJlaGF2aW91ciBpcyBub3QgaGFuZGxlZCBxdWl0ZSByaWdodCwg
YmVjYXVzZQpjb25maWd1cmUgd2lsbCBzdGlsbCBzZWUgNjQtYml0IGFuZCBzbyBhbGwgdGhlIGF1
dG9jb25mLWJhc2VkCmFyY2hpdGVjdHVyZSB0ZXN0aW5nIHdpbGwgc2VlIDY0LWJpdCByYXRoZXIg
dGhhbiAzMi1iaXQgeDg2LiAgQnV0IHRoZQp0b29scyBhcmUgaW4gZmFjdCBnZW5lcmFsbHkgcXVp
dGUgcG9ydGFibGU6IHRoaXMgcGFydGljdWxhciBsb2NhdGlvbgppbiBjb25maWd1cmV7LmFjLH0g
aXMgdGhlIG9ubHkgcGxhY2UgaW4gdG9vbHMvIHdoZXJlIDY0LWJpdCB4ODYgaXMKdHJlYXRlZCBk
aWZmZXJlbnRseSBmcm9tIDMyLWJpdCB4ODYsIHNvIHRoZSBmaXggaXMgc3VmZmljaWVudCBhbmQK
Y29ycmVjdCBmb3IgdGhpcyB1c2UgY2FzZS4KCkl0IHJlbWFpbnMgdGhlIGNhc2UgdGhhdCBYRU5f
Q09NUElMRV9BUkNIIG9yIFhFTl9UQVJHRVRfQVJDSCB0byBhCm5vbi14ODYgYXJjaGl0ZWN0dXJl
LCB3aGVuIGNvbmZpZ3VyZSB0aGlua3MgdGhpbmdzIGFyZSB4ODYsIG9yIHZpY2UKdmVyc2EsIHdp
bGwgbm90IHdvcmsgcmlnaHQuCgooVGhpcyBpcyBhIGJ1Z2ZpeCB0byA4ODQ1MTU1YzgzMWMKICBw
dnNoaW06IG1ha2UgUFYgc2hpbSBidWlsZCBzZWxlY3RhYmxlIGZyb20gY29uZmlndXJlCndoaWNo
IGluYWR2ZXJ0YW50bHkgZGVsZXRlZCB0aGUgbG9naWMgdG8gb25seSBidWlsZCB0aGUgc2hpbSBm
b3IKWEVOX1RBUkdFVF9BUkNIICE9IHg4Nl8zMi4pCgpJIGhhdmUgcmVydW4gYXV0b2dlbi5zaCwg
c28gdGhpcyBwYXRjaCBjb250YWlucyB0aGUgZml4IHRvIGNvbmZpZ3VyZQphcyB3ZWxsIGFzIHRo
ZSBzb3VyY2UgZml4IHRvIGNvbmZpZ3VyZS5hYy4KCkZpeGVzOiA4ODQ1MTU1YzgzMWM1OWU4Njdl
ZTNkZDMxZWU2M2UwY2M2YzdkY2YyClNpZ25lZC1vZmYtYnk6IElhbiBKYWNrc29uIDxpYW4uamFj
a3NvbkBldS5jaXRyaXguY29tPgpDQzogT2xhZiBIZXJpbmcgPG9sYWZAYWVwZmxlLmRlPgpDQzog
Um9nZXIgUGF1IE1vbm7DqSA8cm9nZXIucGF1QGNpdHJpeC5jb20+ClJlbGVhc2UtYWNrZWQtYnk6
IErDvHJnZW4gR3Jvw58gPGpncm9zc0BzdXNlLmNvbT4KLS0tCiB0b29scy9jb25maWd1cmUgICAg
fCAyICstCiB0b29scy9jb25maWd1cmUuYWMgfCAyICstCiAyIGZpbGVzIGNoYW5nZWQsIDIgaW5z
ZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS90b29scy9jb25maWd1cmUg
Yi90b29scy9jb25maWd1cmUKaW5kZXggODI5NDdhZDMwOC4uZDljY2NlNmQyYiAxMDA3NTUKLS0t
IGEvdG9vbHMvY29uZmlndXJlCisrKyBiL3Rvb2xzL2NvbmZpZ3VyZQpAQCAtOTcxMSw3ICs5NzEx
LDcgQEAgZmkKIGVsc2UKIAogICAgIGNwdT1gdGVzdCAteiAiJHRhcmdldF9jcHUiICYmIGVjaG8g
IiRob3N0X2NwdSIgfHwgZWNobyAiJHRhcmdldF9jcHUiYAotICAgIGNhc2UgIiRjcHUiIGluCisg
ICAgY2FzZSAiJHtYRU5fQ09NUElMRV9BUkNILSR7WEVOX1RBUkdFVF9BUkNILSRjcHV9fSIgaW4K
ICAgICAgICAgeDg2XzY0KQogICAgICAgICAgICBwdnNoaW09InkiOzsKICAgICAgICAgKikgcHZz
aGltPSJuIjs7CmRpZmYgLS1naXQgYS90b29scy9jb25maWd1cmUuYWMgYi90b29scy9jb25maWd1
cmUuYWMKaW5kZXggNjc0YmQ1ODA5ZC4uYThkOGNlNWZmZSAxMDA2NDQKLS0tIGEvdG9vbHMvY29u
ZmlndXJlLmFjCisrKyBiL3Rvb2xzL2NvbmZpZ3VyZS5hYwpAQCAtNDc5LDcgKzQ3OSw3IEBAIEFD
X0FSR19FTkFCTEUoW3B2c2hpbV0sCiAgICAgICAgICAgICAgICAgICAgW0Rpc2FibGUgcHZzaGlt
IGJ1aWxkIChlbmFibGVkIGJ5IGRlZmF1bHQgb24gNjRiaXQgeDg2KV0pLAogICAgIFtBU19JRihb
dGVzdCAieCRlbmFibGVfcHZzaGltIiA9ICJ4bm8iXSwgW3B2c2hpbT1uXSwgW3B2c2hpbT15XSld
LCBbCiAgICAgY3B1PWB0ZXN0IC16ICIkdGFyZ2V0X2NwdSIgJiYgZWNobyAiJGhvc3RfY3B1IiB8
fCBlY2hvICIkdGFyZ2V0X2NwdSJgCi0gICAgY2FzZSAiJGNwdSIgaW4KKyAgICBjYXNlICIke1hF
Tl9DT01QSUxFX0FSQ0gtJHtYRU5fVEFSR0VUX0FSQ0gtJGNwdX19IiBpbgogICAgICAgICB4ODZf
NjQpCiAgICAgICAgICAgIHB2c2hpbT0ieSI7OwogICAgICAgICAqKSBwdnNoaW09Im4iOzsKLS0g
CjIuMTEuMAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
Clhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0
dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
