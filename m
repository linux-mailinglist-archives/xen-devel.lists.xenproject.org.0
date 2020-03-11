Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 63026181C1B
	for <lists+xen-devel@lfdr.de>; Wed, 11 Mar 2020 16:13:00 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jC30Q-0006cx-7C; Wed, 11 Mar 2020 15:10:46 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=IUjY=44=citrix.com=george.dunlap@srs-us1.protection.inumbo.net>)
 id 1jC30O-0006cs-Ny
 for xen-devel@lists.xenproject.org; Wed, 11 Mar 2020 15:10:44 +0000
X-Inumbo-ID: 7a4a7904-63aa-11ea-b34e-bc764e2007e4
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 7a4a7904-63aa-11ea-b34e-bc764e2007e4;
 Wed, 11 Mar 2020 15:10:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1583939444;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=o7T3GwlNA6Xu/yU5st4MLFhZdJ8pmb1RQppMRQFpPXo=;
 b=OGrd8SI+OhA26DuEs0QGQKnksfVn3MnHJxtJU6dQU8ugH5OyDRkahZ5W
 ocF2XGxJdr6ZUviRQzr7poZy3/2kJcQIfS9IK9rzz7JUHurnIg1p5QBmg
 KdxlgGuBbbpbqrSGLqF1tPfuHyNtFHhqtM+nuHaYuTZ1UbN+JkJBJsqKD M=;
Authentication-Results: esa6.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=george.dunlap@citrix.com;
 spf=Pass smtp.mailfrom=George.Dunlap@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 george.dunlap@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="George.Dunlap@citrix.com";
 x-sender="george.dunlap@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa6.hc3370-68.iphmx.com: domain of
 George.Dunlap@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="George.Dunlap@citrix.com";
 x-sender="George.Dunlap@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="George.Dunlap@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: G7tkxKsH6G3/lknT+wJCxpHBzryfAPwJ3sXxP7qjhKv2q9H6oehjvNYJ+6QiuWmBESWZ9n7o+I
 u9EIk6dMw6e+RrAEWRoe8UsFNm5/5AWz92UbIzs3YSXJeH3+52KURH4hreaL00NdFIsFIsATCz
 43PzV55zZmjJ9vqj0qy/rtYc3pMMDSHY6GfAMH99Uz3NMn9bwIYZhnIgS0NIi1wBw79KLqSKXx
 AmmwTMSAwFxkCn5iXrPGZd1R8WD7pguEk0Qj+nQ16HPaz4+zx/BuWMts+0brQnEkalLkZNnMKB
 xyI=
X-SBRS: 2.7
X-MesageID: 14195184
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,541,1574139600"; d="scan'208";a="14195184"
To: Nick Rosbrook <rosbrookn@gmail.com>
References: <20200309144932.866097-1-george.dunlap@citrix.com>
 <20200309144932.866097-3-george.dunlap@citrix.com>
 <CAEBZRSfBMyaaM60uyD+AxM0m0AMLGTriKBVvuAoEX7ki7a0JAQ@mail.gmail.com>
From: George Dunlap <george.dunlap@citrix.com>
Autocrypt: addr=george.dunlap@citrix.com; prefer-encrypt=mutual; keydata=
 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
 zK3laGuMZxe0OM5xTu2j2zA=
Message-ID: <bd6f753d-d949-110a-c981-d7561fb4569d@citrix.com>
Date: Wed, 11 Mar 2020 15:10:36 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <CAEBZRSfBMyaaM60uyD+AxM0m0AMLGTriKBVvuAoEX7ki7a0JAQ@mail.gmail.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v4 3/3] golang/xenlight: Implement
 DomainCreateNew
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
Cc: Nick Rosbrook <rosbrookn@ainfosec.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMy8xMS8yMCAyOjU5IFBNLCBOaWNrIFJvc2Jyb29rIHdyb3RlOgo+IExvb2tzIGdvb2QsIEkg
anVzdCBoYXZlIHR3byBzbWFsbCBjb21tZW50czoKPiAKPj4gZGlmZiAtLWdpdCBhL3Rvb2xzL2dv
bGFuZy94ZW5saWdodC94ZW5saWdodC5nbyBiL3Rvb2xzL2dvbGFuZy94ZW5saWdodC94ZW5saWdo
dC5nbwo+PiBpbmRleCA1NmZhMzFmZDdiLi44MDhiNGEzMjdjIDEwMDY0NAo+PiAtLS0gYS90b29s
cy9nb2xhbmcveGVubGlnaHQveGVubGlnaHQuZ28KPj4gKysrIGIvdG9vbHMvZ29sYW5nL3hlbmxp
Z2h0L3hlbmxpZ2h0LmdvCj4+IEBAIC0xMTExLDMgKzExMTEsMjQgQEAgZnVuYyAoQ3R4ICpDb250
ZXh0KSBQcmltYXJ5Q29uc29sZUdldFR0eShkb21pZCB1aW50MzIpIChwYXRoIHN0cmluZywgZXJy
IGVycm9yKQo+PiAgICAgICAgIHBhdGggPSBDLkdvU3RyaW5nKGNwYXRoKQo+PiAgICAgICAgIHJl
dHVybgo+PiAgfQo+PiArCj4+ICsvLyBpbnQgbGlieGxfZG9tYWluX2NyZWF0ZV9uZXcobGlieGxf
Y3R4ICpjdHgsIGxpYnhsX2RvbWFpbl9jb25maWcgKmRfY29uZmlnLAo+PiArLy8gICAgICAgICAg
ICAgICAgICAgICAgICAgICAgIHVpbnQzMl90ICpkb21pZCwKPj4gKy8vICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICBjb25zdCBsaWJ4bF9hc3luY29wX2hvdyAqYW9faG93LAo+PiArLy8gICAg
ICAgICAgICAgICAgICAgICAgICAgICAgIGNvbnN0IGxpYnhsX2FzeW5jcHJvZ3Jlc3NfaG93ICph
b3BfY29uc29sZV9ob3cpCj4gCj4gQ29udmVudGlvbmFsbHksIHdlIHdhbnQgdG8gaGF2ZSBjb21t
ZW50cyBmb3IgZXhwb3J0ZWQgZnVuY3Rpb25zIGFsb25nCj4gdGhlIGxpbmVzIG9mOgo+IAo+ICAg
ICAvLyBEb21haW5DcmVhdGVOZXcgY3JlYXRlcyBhIG5ldyBkb21haW4gd2l0aCBjb25maWcsIGFu
ZCByZXR1cm5zCj4gaXRzIERvbWlkIG9uIHN1Y2Nlc3MuCj4gICAgIC8vIEEgbm9uLW5pbCBlcnJv
ciBpcyByZXR1cm5lZCBpZiBjb25maWcgY2Fubm90IGJlIG1hcnNoYWxlZCwgb3IKPiBhbiBlcnJv
ciBvY2N1cnMgd2l0aGluIGxpYnhsLgo+IAo+IEJlc2lkZXMgYmVpbmcgZWFzaWVyIHRvIHJlYWQs
IGl0IG1ha2VzIGRvY3VtZW50YXRpb24gbW9yZSBjbGVhciBvbgo+IGdvZG9jL3BrZy5nby5kZXYu
CgpZZXMsIGFic29sdXRlbHksIHRoYXQncyBzb21ldGhpbmcgd2UgbmVlZCB0byBjaGFuZ2UgYmVm
b3JlIHdlIGRlY2xhcmUKIjEuMCIuICBCdXQgdGhhdCBzaG91bGQgcHJvYmFibHkgYmUgZG9uZSBp
biBhIHNlcmllcyB3aGljaCBjaGFuZ2VzIGFsbApzdWNoIGNvbW1lbnRzIHRvZ2V0aGVyLgoKPj4g
K2Z1bmMgKEN0eCAqQ29udGV4dCkgRG9tYWluQ3JlYXRlTmV3KGNvbmZpZyAqRG9tYWluQ29uZmln
KSAoRG9taWQsIGVycm9yKSB7Cj4gCj4gQ2FwaXRhbGl6aW5nICJDdHgiIGhlcmUgaXMgYSBsaXR0
bGUgd2VpcmQgdG8gbWUuIFNpbmNlIGl0J3Mgb25seSB0aGUKPiByZWNlaXZlciBuYW1lLCB0aGVy
ZSdzIG5vIGVmZmVjdCwgYnV0IHNpbmNlIGNhcGl0YWxpemVkIGlkZW50aWZpZXJzCj4gaGF2ZSBz
cGVjaWFsLW1lYW5pbmcgaW4gb3RoZXIgY29udGV4dHMsIEkgd291bGQgYXZvaWQgZG9pbmcgdGhp
cy4KCkkgYyZwJ2QgdGhpcyBmcm9tIGFub3RoZXIgbWV0aG9kIGFuZCBqdXN0IGNoYW5nZWQgdGhl
IHNpZ25hdHVyZS4gIEl0CnByb2JhYmx5IHdvdWxkIGJlIGdvb2QgdG8gbWFrZSBhbGwgb2YgdGhl
bSBsb3dlci1jYXNlLiAgSSBtYXkgY2hhbmdlCnRoaXMgb25lIG9uIGNoZWNrIGluIHRob3VnaC4K
Cj4gSSBvbmx5IHBvaW50IHRob3NlIG91dCBpbiBjYXNlIHlvdSB3YW50IHRvIGNoYW5nZSBpdCBv
biBjaGVjay1pbi4gQmVzaWRlcyB0aGF0LAo+IAo+IFJldmlld2VkLWJ5OiBOaWNrIFJvc2Jyb29r
IDxyb3Nicm9va25AYWluZm9zZWMuY29tPgoKVGhhbmtzIQoKIC1HZW9yZ2UKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxp
c3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVj
dC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
