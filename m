Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A04FA11D13E
	for <lists+xen-devel@lfdr.de>; Thu, 12 Dec 2019 16:44:32 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ifQa3-0008Vj-7i; Thu, 12 Dec 2019 15:40:43 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=uBeP=2C=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1ifQa1-0008Ve-DW
 for xen-devel@lists.xenproject.org; Thu, 12 Dec 2019 15:40:41 +0000
X-Inumbo-ID: bfde1c6a-1cf5-11ea-8d9d-12813bfff9fa
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id bfde1c6a-1cf5-11ea-8d9d-12813bfff9fa;
 Thu, 12 Dec 2019 15:40:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1576165240;
 h=from:mime-version:content-transfer-encoding:message-id:
 date:to:cc:subject:in-reply-to:references;
 bh=qGbDZA3Bgo6mVEDR7yXvYahaR7w774WADGLPOLB+DWQ=;
 b=Ew482YnVo2zJXJu1rykSkRgnJKFilR8flUH5FqkcLvlXiwMi11qYlk/u
 vKceTulC57dDzxuj/z8AtP5tdXfy4QsWhzyl+9a0sqiCSM2OF6tocH7bV
 kEjInM2GEMdo0YMn05ZkfBywhJlhZUN4jHwvFPwjLY+qgMzWtIFboNFs4 0=;
Authentication-Results: esa6.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=ian.jackson@citrix.com;
 spf=Pass smtp.mailfrom=Ian.Jackson@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 ian.jackson@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="ian.jackson@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa6.hc3370-68.iphmx.com: domain of
 Ian.Jackson@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="Ian.Jackson@citrix.com";
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
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: 0CQK0VslrxP7KU3o9T2/wPkXrnPaZsGGie3dShkpkFZAO/XDNcucK/e+esckmdU/PxMse3/gGw
 pY9WeQ/5Pn8MRe3k0hGi1p0Oeo3a4hHNDhuDco29jGUvsEFnXpVwrNwKSCu3ltDS2lYFYc5f+s
 iRw6CTxGrWpRg6BotB4I7DrNSCoFj5qSmUNCiHpT7x50Mnx0p4KAPKgzw2qDlGx/2L4zEM0wos
 c/jRJKvZ81HXG0+qth1hFqWF9fdqErAq2fLRdLZTQwm5lLVSPsuhY1I1IzouTzvri5gkls1rtl
 G5o=
X-SBRS: 2.7
X-MesageID: 10009998
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.69,306,1571716800"; d="scan'208";a="10009998"
From: Ian Jackson <ian.jackson@citrix.com>
MIME-Version: 1.0
Message-ID: <24050.24437.97024.719788@mariner.uk.xensource.com>
Date: Thu, 12 Dec 2019 15:40:37 +0000
To: Juergen Gross <jgross@suse.com>, Andrew Cooper
 <Andrew.Cooper3@citrix.com>, Jan Beulich <jbeulich@suse.com>
In-Reply-To: <osstest-144726-mainreport@xen.org>
References: <osstest-144726-mainreport@xen.org>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)
Subject: Re: [Xen-devel] [xen-4.8-testing test] 144726: regressions -
 trouble: fail/pass/starved
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
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

b3NzdGVzdCBzZXJ2aWNlIG93bmVyIHdyaXRlcyAoIlt4ZW4tNC44LXRlc3RpbmcgdGVzdF0gMTQ0
NzI2OiByZWdyZXNzaW9ucyAtIHRyb3VibGU6IGZhaWwvcGFzcy9zdGFydmVkIik6Cj4gZmxpZ2h0
IDE0NDcyNiB4ZW4tNC44LXRlc3RpbmcgcmVhbCBbcmVhbF0KPiBodHRwOi8vbG9ncy50ZXN0LWxh
Yi54ZW5wcm9qZWN0Lm9yZy9vc3N0ZXN0L2xvZ3MvMTQ0NzI2Lwo+IAo+IFJlZ3Jlc3Npb25zIDot
KAo+IAo+IFRlc3RzIHdoaWNoIGRpZCBub3Qgc3VjY2VlZCBhbmQgYXJlIGJsb2NraW5nLAo+IGlu
Y2x1ZGluZyB0ZXN0cyB3aGljaCBjb3VsZCBub3QgYmUgcnVuOgo+ICB0ZXN0LXh0Zi1hbWQ2NC1h
bWQ2NC01IDUwIHh0Zi90ZXN0LWh2bTY0LWxici10c3gtdm1lbnRyeSBmYWlsIFJFR1IuIHZzLiAx
NDQ1NTgKClNlZSBwYXRjaCBiZWxvdyBmb3IgYW5hbHlzaXMuICBBbmRyZXcsIHdvdWxkIHlvdSBw
bGVhc2UgdGFrZSBhIGxvb2sKYW5kIGNoZWNrIHRoYXQgd2hhdCBJIHNhaWQgaXMgdHJ1ZS4KCklm
IEphbiBhcHByb3ZlcyB3aWxsIGZvcmNlIHB1c2ggNC44LXRlc3RpbmcuCgpGcm9tIEp1ZXJnZW4g
SSB3b3VsZCBsaWtlIGEgcmVsZWFzZS1hY2sgZm9yIHRoZSBvc3N0ZXN0IGNvbW1pdCB0bwoiYWxs
b3ciIGl0IGZvciB0aGUgZnV0dXJlLgoKVGhhbmtzLApJYW4uCgpGcm9tIDkzYTQxNjJiNmQ4NWJk
MWU3OGQ4MjJmMWU4MDc1MTdjM2UyMDdjZTcgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCkZyb206
IElhbiBKYWNrc29uIDxpYW4uamFja3NvbkBldS5jaXRyaXguY29tPgpEYXRlOiBUaHUsIDEyIERl
YyAyMDE5IDE0OjM3OjExICswMDAwClN1YmplY3Q6IFtPU1NURVNUIFBBVENIXSBhbGxvdzogeGVu
LTQuOC10ZXN0aW5nIHh0Zi90ZXN0LWh2bTY0LWxici10c3gtdm1lbnRyeQoKWGVuIDQuOCBsYWNr
cwogIDIwZjE5NzZiNDQxOTlkMWU3YTE1ZmU1ZDJjOGMxYTQzNzViNzQ5OTcKICB4ODYvdm14OiBG
aXggdm1lbnRyeSBmYWlsdXJlIGJlY2F1c2Ugb2YgaW52YWxpZCBMRVIgb24gQnJvYWR3ZWxsCmFu
ZAogIGQ2ZTlmOGQ0ZjM1ZDkzODQxN2Y5ZGMyZWE1MGY2ZTgwMDRlMjY3MjUKICB4ODYvdm14OiBm
aXggdm1lbnRyeSBmYWlsdXJlIHdpdGggVFNYIGJpdHMgaW4gTEJSCmFuZCBnaXZlbiBpdHMgc3Vw
cG9ydCBsaWZldGltZSwgd2UgZG8gbm90IGludGVuZCB0byBiYWNrcG9ydCB0aGVtLgoKVGhlc2Ug
YnVncyBhcmUgY2hlY2tlZCBmb3IgYnkgeHRmL3Rlc3QtaHZtNjQtbGJyLXRzeC12bWVudHJ5LiAg
U28KdGhvc2UgdGVzdHMgZmFpbCBpbiB4ZW4tNC44LXRlc3RpbmcgYnV0IG9ubHkgb24gYXBwbGlj
YWJsZSBoYXJkd2FyZS4KQmVjYXVzZSB3ZSBkb24ndCBwaW4gdGhlc2UgdGVzdHMgdG8gaW5kaXZp
ZHVhbCBob3N0cyAoYmVjYXVzZSB0aGF0CndvdWxkIGludm9sdmUgcnVubmluZyB0aGUgWFRGIHRl
c3RzIG9uIGVhY2ggaG9zdCBwYWlyKSB0aGlzIGNhbiBzaG93CnVwIGFzIGEgInJlZ3Jlc3Npb24i
LiAgRm9yY2UgcHVzaGluZyBpdCBtYWtlcyBpdCBnbyBhd2F5IGZvciBhIGJpdCwKdW50aWwgZm9y
IHNvbWUgcmVhc29uIHRoZSB0ZXN0IHJ1bnMgb24gYSBkaWZmZXJlbnQgaG9zdC4KCkluc3RlYWQs
IHRyZWF0IHRoZXNlICJyZWdyZXNzaW9ucyIgYXMgYWxsb3dhYmxlIGJ1dCBvbmx5IGluIDQuOC4K
CkkgaGF2ZSB0ZXN0ZWQgdGhpcyB3aXRoCiAgLi9zZy1yZXBvcnQtZmxpZ2h0IC0tdGhhdC1mbGln
aHQ9MTQ0NTU4IDE0NDcyNgphbmQgZGlmZidkIGJlZm9yZSBhbmQgYWZ0ZXIuICBUaGUgZGlmZmVy
ZW5jZSBpcyBhcyBleHBlY3RlZCwgdGhhdAogIHRlc3QteHRmLWFtZDY0LWFtZDY0LTUgNTAgeHRm
L3Rlc3QtaHZtNjQtbGJyLXRzeC12bWVudHJ5IGZhaWwgUkVHUi4gdnMuIDE0NDU1OAppcyBub3cK
ICBSZWdyZXNzaW9ucyB3aGljaCBhcmUgcmVnYXJkZWQgYXMgYWxsb3dhYmxlIChub3QgYmxvY2tp
bmcpOgoKQ0M6IEFuZHJldyBDb29wZXIgPEFuZHJldy5Db29wZXIzQGNpdHJpeC5jb20+CkNDOiBK
dWVyZ2VuIEdyb3NzIDxqZ3Jvc3NAc3VzZS5jb20+ClNpZ25lZC1vZmYtYnk6IElhbiBKYWNrc29u
IDxpYW4uamFja3NvbkBldS5jaXRyaXguY29tPgotLS0KIGFsbG93Lnhlbi00LjgtdGVzdGluZyB8
IDEgKwogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspCiBjcmVhdGUgbW9kZSAxMDA2NDQg
YWxsb3cueGVuLTQuOC10ZXN0aW5nCgpkaWZmIC0tZ2l0IGEvYWxsb3cueGVuLTQuOC10ZXN0aW5n
IGIvYWxsb3cueGVuLTQuOC10ZXN0aW5nCm5ldyBmaWxlIG1vZGUgMTAwNjQ0CmluZGV4IDAwMDAw
MDAwLi4wYWZmNjkxNwotLS0gL2Rldi9udWxsCisrKyBiL2FsbG93Lnhlbi00LjgtdGVzdGluZwpA
QCAtMCwwICsxIEBACit0ZXN0LXh0Zi1hbWQ2NC1hbWQ2NC1AQAkJeHRmL3Rlc3QtaHZtNjQtbGJy
LXRzeC12bWVudHJ5Ci0tIAoyLjExLjAKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54
ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGlu
Zm8veGVuLWRldmVs
