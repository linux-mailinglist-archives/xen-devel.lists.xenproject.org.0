Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D2D0150E98
	for <lists+xen-devel@lfdr.de>; Mon,  3 Feb 2020 18:28:53 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iyfU9-0006W0-Py; Mon, 03 Feb 2020 17:26:09 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=UUio=3X=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1iyfU8-0006Vu-Cg
 for xen-devel@lists.xenproject.org; Mon, 03 Feb 2020 17:26:08 +0000
X-Inumbo-ID: 42e34fbc-46aa-11ea-8e7b-12813bfff9fa
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 42e34fbc-46aa-11ea-8e7b-12813bfff9fa;
 Mon, 03 Feb 2020 17:26:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1580750768;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=VpCpn1+K1R69EFAC3075kl/kja4Pp2a34IzrC3K+V+s=;
 b=dQg8j9TRZlpy6K2R5d1aRhXOh3CAGb8SVjp4Is3zISQfWCdLSh0zD6/6
 YLCNDtJvShb2lf4OhHffQvEQJxCergsuqa8d4idpYsL/SJ2PyG4sPCQ6M
 OFjZyE9jzbyY0M2tRKHFZEgTTPO+BQUy0RAz+30NqbBqcFFsNhqA3CVH7 g=;
Authentication-Results: esa1.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=anthony.perard@citrix.com;
 spf=Pass smtp.mailfrom=anthony.perard@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 anthony.perard@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="anthony.perard@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa1.hc3370-68.iphmx.com: domain of
 anthony.perard@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="anthony.perard@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: upkHFSA0m9XpRVinFqwXjuwXKzXgIIMpGjRdjYAtMn+UgLTPrCL8zBQcJx9yWCGhiMaG8/oVkK
 YkI8EJJwLkTGc8Yrl50nLsBwpunEKsaQeRZx2EGKCrys+3KhO/Gv1DBJBdyooJVLU9trz73cFZ
 N7XS/Dcr4F1fOMqHZr63KLLmnZgWRgc86KfvV1Dl2YxRzCjQ+Bj9L4E2Z9v5tkJXIIMo9poi1c
 ZhlRk+YaUwUgbIX5MgstYBQFt7LXnl49y+MKCyZ0lxMdEnGdkiCl10sdLKkoPEjN//Y0z3gIba
 Fp0=
X-SBRS: 2.7
X-MesageID: 12035997
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,398,1574139600"; d="scan'208";a="12035997"
Date: Mon, 3 Feb 2020 17:26:04 +0000
From: Anthony PERARD <anthony.perard@citrix.com>
To: "Gao, Liming" <liming.gao@intel.com>
Message-ID: <20200203172604.GI2306@perard.uk.xensource.com>
References: <20200129121235.1814563-1-anthony.perard@citrix.com>
 <20200129121235.1814563-3-anthony.perard@citrix.com>
 <b7590b41-e7f6-f4df-959c-2ee188db1e66@redhat.com>
 <c283b839b42e4262bfde10474bf6a794@intel.com>
 <20200203153407.GH2306@perard.uk.xensource.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200203153407.GH2306@perard.uk.xensource.com>
Subject: Re: [Xen-devel] [PATCH 2/5] MdePkg: Allow PcdFSBClock to by Dynamic
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
Cc: "Feng, Bob C" <bob.c.feng@intel.com>, Julien Grall <julien@xen.org>,
 Ard Biesheuvel <ard.biesheuvel@linaro.org>, "Justen,
 Jordan L" <jordan.l.justen@intel.com>,
 "devel@edk2.groups.io" <devel@edk2.groups.io>, "Kinney,
 Michael D" <michael.d.kinney@intel.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Laszlo Ersek <lersek@redhat.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gTW9uLCBGZWIgMDMsIDIwMjAgYXQgMDM6MzQ6MDdQTSArMDAwMCwgQW50aG9ueSBQRVJBUkQg
d3JvdGU6Cj4gT24gTW9uLCBGZWIgMDMsIDIwMjAgYXQgMDE6MzQ6NTVBTSArMDAwMCwgR2FvLCBM
aW1pbmcgd3JvdGU6Cj4gPiBBbnRob255Ogo+ID4gICBUaGlzIGNoYW5nZSBpcyBPSyB0byBtZS4g
QnV0IGlmIHRoaXMgUENEIGlzIGNvbmZpZ3VyZWQgYXMgRHluYW1pYywgaXRzIHZhbHVlIHdpbGwg
YmUgZ290IGZyb20gUENEIHNlcnZpY2UuIFRoaXMgb3BlcmF0aW9uIHdpbGwgdGFrZSBzb21lIHRp
bWUgYW5kIGNhdXNlIHRoZSBpbmFjY3VyYXRlIHRpbWUgZGVsYXkuIEhhdmUgeW91IG1lYXN1cmVk
IGl0cyBpbXBhY3Q/Cj4gCj4gTm8sIEkgaGF2ZW4ndC4gQnV0IEkgZG9uJ3QgdGhpbmsgaXQgbWF0
dGVyIGluIGEgWGVuIGd1ZXN0LCB0aGUgQVBJQyB0aW1lciBpcwo+IGVtdWxhdGVkIGFueXdheSwg
c28gcmVhZGluZyBmcm9tIGEgcmVnaXN0ZXIgb2YgdGhlIEFQSUMgaXMgZ29pbmcgdG8gYmUKPiBz
bG93ZXIgdGhhbiBnZXR0aW5nIHRoZSB2YWx1ZSBmcm9tIHRoZSBQQ0Qgc2VydmljZXMsIEkgdGhp
bmsuCj4gKEhvcGVmdWxseSwgSSdtIG5vdCB0b28gd3JvbmcuKQo+IAo+IEJ1dCBJJ2xsIGdpdmUg
aXQgYXQgbWVhc3VyaW5nIHRoZSBkaWZmZXJlbmNlLCBpdCB3b3VsZCBiZSBpbnRlcmVzdGluZyB0
bwo+IGtub3cuCgpOb3cgdGhhdCBJJ3ZlIGdpdmVuIGEgdHJ5LCBoYXZpbmcgdGhlIHZhbHVlIGFz
IER5bmFtaWMgZG9lc24ndCBjaGFuZ2UKYW55dGhpbmcgaW4gYSBYZW4gZ3Vlc3QuCgpPbiBteSB0
ZXN0IG1hY2hpbmUsIHNpbXBseSBydW5uaW5nIEdldFBlcmZvcm1hbmNlQ291bnRlciAoKTsgdGFr
ZXMKYmV0d2VlbiAxMDAwMCBucyBhbmQgMjAwMDAgbnMuIFJlYWRpbmcgdGhlIGR5bmFtaWMgdmFs
dWUgZnJvbSBQQ0Qgb24gdGhlCm90aGVyIGhhbmQgdGFrZXMgYWJvdXQgMzUwbnMuICgxMG5zIGlm
IGl0J3Mgc3RhdGljLikKCldoZW4gSSBydW4gTmFub1NlY29uZERlbGF5KCkgd2l0aCBkaWZmZXJl
bnQgdmFsdWVzLCBJIGhhdmU6CiAgLSB3aXRoIHN0YXRpYyBwY2Q6CiAgICAgICAgICAgNjM4OTQg
bnMgdG8gZGVsYXkgYnkgMSBucwogICAgICAgICAgIDY2NjExIG5zIHRvIGRlbGF5IGJ5IDEwIG5z
CiAgICAgICAgICAgNDM5MjcgbnMgdG8gZGVsYXkgYnkgMTAwIG5zCiAgICAgICAgICAgNzEzNjcg
bnMgdG8gZGVsYXkgYnkgMTAwMCBucwogICAgICAgICAgIDU1ODgxIG5zIHRvIGRlbGF5IGJ5IDEw
MDAwIG5zCiAgICAgICAgICAxNDc3MTYgbnMgdG8gZGVsYXkgYnkgMTAwMDAwIG5zCiAgICAgICAg
IDEwNDgzMzUgbnMgdG8gZGVsYXkgYnkgMTAwMDAwMCBucwogICAgICAgIDEwMDQxMTc5IG5zIHRv
IGRlbGF5IGJ5IDEwMDAwMDAwIG5zCiAgLSB3aXRoIGEgZHluYW1pYyBwY2Q6CiAgICAgICAgICAg
NDA5NDkgbnMgdG8gZGVsYXkgYnkgMSBucwogICAgICAgICAgIDg0ODMyIG5zIHRvIGRlbGF5IGJ5
IDEwIG5zCiAgICAgICAgICAgODI3NDUgbnMgdG8gZGVsYXkgYnkgMTAwIG5zCiAgICAgICAgICAg
NTk4NDggbnMgdG8gZGVsYXkgYnkgMTAwMCBucwogICAgICAgICAgIDUyNjQ3IG5zIHRvIGRlbGF5
IGJ5IDEwMDAwIG5zCiAgICAgICAgICAxMzcwNTEgbnMgdG8gZGVsYXkgYnkgMTAwMDAwIG5zCiAg
ICAgICAgIDEwNDI0OTIgbnMgdG8gZGVsYXkgYnkgMTAwMDAwMCBucwogICAgICAgIDEwMDM2MzA2
IG5zIHRvIGRlbGF5IGJ5IDEwMDAwMDAwIG5zCgpTbywgdGhlIGtpbmQgb2YgUENEIHVzZWQgZm9y
IFBjZEZTQkNsb2NrIG9uIFhlbiAod2l0aCBPdm1mWGVuKSBkb2Vzbid0CnJlYWxseSBtYXR0ZXIu
CgpBbnl3YXksIHRoYW5rcyBmb3IgdGhlIGZlZWRiYWNrLgoKLS0gCkFudGhvbnkgUEVSQVJECgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwg
bWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3Rz
LnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
