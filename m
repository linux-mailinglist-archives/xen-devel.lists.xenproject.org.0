Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D8F8EAA683
	for <lists+xen-devel@lfdr.de>; Thu,  5 Sep 2019 16:51:52 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i5t4O-0005BC-Qp; Thu, 05 Sep 2019 14:49:08 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=lv1E=XA=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1i5t4N-0005Av-SW
 for xen-devel@lists.xenproject.org; Thu, 05 Sep 2019 14:49:07 +0000
X-Inumbo-ID: 4e1bbd74-cfec-11e9-abd2-12813bfff9fa
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 4e1bbd74-cfec-11e9-abd2-12813bfff9fa;
 Thu, 05 Sep 2019 14:49:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1567694945;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=K/BxvWP3AO1p0OxV4ggUkqTjdjXw/BDn6iPSG9rakuo=;
 b=frVo9RvdnY4Hi2TEdog8NFjvheBbxt9B9glKtcqe87IUWcz64AsRB9aR
 eS2WTDu8XCEtbRM181XAfbEj67LiWvV69m0Si7BA79neDf+6qYt8wiF0c
 URdZiFssxBZuYGP2xAoFVA7lw3WV3Hs0wTPBNm/OFhsCV9uk7q1t1T8fD c=;
Authentication-Results: esa4.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=roger.pau@citrix.com;
 spf=Pass smtp.mailfrom=roger.pau@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 roger.pau@citrix.com) identity=pra; client-ip=162.221.158.21;
 receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa4.hc3370-68.iphmx.com: domain of
 roger.pau@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: wDt2AHF0ghNIbEA6KPiA2m+G+uWz/OYMvu9LefuHN1ZPxFAb4+SyMNN6sCvK40+XFDsiKyDSte
 peURYAwhDGTsg/d85+xF2moEM4Ig9Z0sb4wgEdbIOlJExcxR5cNROJph1qp7MC3gI42iztlbZB
 voq6ubTpTTwtvAytjN/DjrqcPscDuosWdMN6gQ6omG3UzuWYRK8qnVHiE4ahNG+8EKK07ZCKRH
 9QBYnP2KlTOs3DtJ4dU9fu+7uLF/mCzBKzwOrbNp7/WLCVsyYPnPMZPgCJ64wRz71QrbIxsZ37
 fBs=
X-SBRS: 2.7
X-MesageID: 5459637
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,470,1559534400"; 
   d="scan'208";a="5459637"
From: Roger Pau Monne <roger.pau@citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Thu, 5 Sep 2019 16:48:34 +0200
Message-ID: <20190905144835.6035-4-roger.pau@citrix.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190905144835.6035-1-roger.pau@citrix.com>
References: <20190905144835.6035-1-roger.pau@citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH v2 3/4] build: allow picking the env values for
 compiler variables
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>, Konrad
 Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Doug Goldstein <cardoe@cardoe.com>,
 Tim Deegan <tim@xen.org>, Julien Grall <julien.grall@arm.com>, Jan
 Beulich <jbeulich@suse.com>, Ian Jackson <ian.jackson@eu.citrix.com>,
 Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

RG9uJ3QgZm9yY2UgdGhlIHVzYWdlIG9mIHRoZSBoYXJkY29kZWQgY29tcGlsZXIgdmFsdWVzIGlm
IHRob3NlIGFyZQphbHJlYWR5IHNldCBvbiB0aGUgZW52aXJvbm1lbnQuIFRoaXMgYWxsb3dzIHRo
ZSBYZW4gYnVpbGQgc3lzdGVtIHRvCmNvcnJlY3RseSBwaWNrIENDL0NYWCB2YWx1ZXMgcHJlc2Vu
dCBvbiB0aGUgZW52aXJvbm1lbnQsIGFuZCBmaXhlcyB0aGUKdXNhZ2Ugb2YgdGhvc2UgYnkgdGhl
IEdpdGxhYiBDSSB0ZXN0IHN5c3RlbS4KCk5vdGUgdGhhdCB3aXRob3V0IHRoaXMgZml4IHRoZSBY
ZW4gYnVpbGQgc3lzdGVtIHdpbGwgY29tcGxldGVseSBpZ25vcmUKYW55IENDIG9yIENYWCB2YWx1
ZXMgc2V0IG9uIHRoZSBlbnZpcm9ubWVudCwgYW5kIHRoZSBvbmx5IHdheSB0byBwYXNzCmEgZGlm
ZmVyZW50IENDIG9yIENYWCBpcyB0byBvdmVyd3JpdGUgaXQgb24gdGhlIG1ha2UgY29tbWFuZCBs
aW5lLgoKRHVlIHRvIHRoaXMgY2hhbmdlLCBUcmF2aXMgQ0kgbmVlZHMgdG8gYmUgdXBkYXRlZCBp
biBvcmRlciB0byBwYXNzIGEKQ0MgYW5kIENYWCB0aGF0IGFsc28gY29udGFpbnMgdGhlIENST1NT
X0NPTVBJTEUgcGF0aCwgc2luY2UgWGVuIHdpbGwKbm8gbG9uZ2VyIG92ZXJ3cml0ZSB0aGUgQ0Mg
b3IgQ1hYIHZhbHVlIGlmIHRob3NlIGFyZSBzZXQgb24gdGhlCmVudmlyb25tZW50LgoKU2lnbmVk
LW9mZi1ieTogUm9nZXIgUGF1IE1vbm7DqSA8cm9nZXIucGF1QGNpdHJpeC5jb20+Ci0tLQpDYzog
QW5kcmV3IENvb3BlciA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4KQ2M6IEdlb3JnZSBEdW5s
YXAgPEdlb3JnZS5EdW5sYXBAZXUuY2l0cml4LmNvbT4KQ2M6IElhbiBKYWNrc29uIDxpYW4uamFj
a3NvbkBldS5jaXRyaXguY29tPgpDYzogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgpD
YzogSnVsaWVuIEdyYWxsIDxqdWxpZW4uZ3JhbGxAYXJtLmNvbT4KQ2M6IEtvbnJhZCBSemVzenV0
ZWsgV2lsayA8a29ucmFkLndpbGtAb3JhY2xlLmNvbT4KQ2M6IFN0ZWZhbm8gU3RhYmVsbGluaSA8
c3N0YWJlbGxpbmlAa2VybmVsLm9yZz4KQ2M6IFRpbSBEZWVnYW4gPHRpbUB4ZW4ub3JnPgpDYzog
V2VpIExpdSA8d2xAeGVuLm9yZz4KLS0tCiBjb25maWcvU3RkR05VLm1rICAgICB8IDM1ICsrKysr
KysrKysrKysrKysrKystLS0tLS0tLS0tLS0tLS0tCiBzY3JpcHRzL3RyYXZpcy1idWlsZCB8ICA4
ICsrKysrKysrCiAyIGZpbGVzIGNoYW5nZWQsIDI3IGluc2VydGlvbnMoKyksIDE2IGRlbGV0aW9u
cygtKQoKZGlmZiAtLWdpdCBhL2NvbmZpZy9TdGRHTlUubWsgYi9jb25maWcvU3RkR05VLm1rCmlu
ZGV4IDdhNjE1OTAyMWIuLmIzMDcyZjViMTMgMTAwNjQ0Ci0tLSBhL2NvbmZpZy9TdGRHTlUubWsK
KysrIGIvY29uZmlnL1N0ZEdOVS5tawpAQCAtMSwyOCArMSwzMSBAQAogIyBVc2UgQ2xhbmcvTExW
TSBpbnN0ZWFkIG9mIEdDQz8KIGNsYW5nICAgICA/PSBuCiAKLSMgSWYgd2UgYXJlIG5vdCBjcm9z
cy1jb21waWxpbmcsIGRlZmF1bHQgSE9TVEN7Qy9YWH0gdG8gQ3tDL1hYfQotaWZlcSAoJChYRU5f
VEFSR0VUX0FSQ0gpLCAkKFhFTl9DT01QSUxFX0FSQ0gpKQotSE9TVENDICAgID89ICQoQ0MpCi1I
T1NUQ1hYICAgPz0gJChDWFgpCi1lbmRpZgotCiBBUyAgICAgICAgID0gJChDUk9TU19DT01QSUxF
KWFzCiBMRCAgICAgICAgID0gJChDUk9TU19DT01QSUxFKWxkCiBpZmVxICgkKGNsYW5nKSx5KQog
Z2NjICAgICAgIDo9IG4KLUNDICAgICAgICAgPSAkKENST1NTX0NPTVBJTEUpY2xhbmcKLUNYWCAg
ICAgICAgPSAkKENST1NTX0NPTVBJTEUpY2xhbmcrKwotTERfTFRPICAgICA9ICQoQ1JPU1NfQ09N
UElMRSlsbHZtLWxkCi1IT1NUQ0MgICAgPz0gY2xhbmcKLUhPU1RDWFggICA/PSBjbGFuZysrCitE
RUZfQ0MgICAgID0gY2xhbmcKK0RFRl9DWFggICAgPSBjbGFuZysrCitMRF9MVE8gICAgPz0gJChD
Uk9TU19DT01QSUxFKWxsdm0tbGQKIGVsc2UKIGdjYyAgICAgICA6PSB5Ci1DQyAgICAgICAgID0g
JChDUk9TU19DT01QSUxFKWdjYwotQ1hYICAgICAgICA9ICQoQ1JPU1NfQ09NUElMRSlnKysKLUxE
X0xUTyAgICAgPSAkKENST1NTX0NPTVBJTEUpbGQKLUhPU1RDQyAgICA/PSBnY2MKLUhPU1RDWFgg
ICA/PSBnKysKK0RFRl9DQyAgICAgPSBnY2MKK0RFRl9DWFggICAgPSBnKysKK0xEX0xUTyAgICA/
PSAkKENST1NTX0NPTVBJTEUpbGQKK2VuZGlmCisKK0NDICAgICAgICA/PSAkKENST1NTX0NPTVBJ
TEUpJChERUZfQ0MpCitDWFggICAgICAgPz0gJChDUk9TU19DT01QSUxFKSQoREVGX0NYWCkKKwor
IyBJZiB3ZSBhcmUgbm90IGNyb3NzLWNvbXBpbGluZywgZGVmYXVsdCBIT1NUQ3tDL1hYfSB0byBD
e0MvWFh9CisjIGVsc2UgdXNlIHRoZSBkZWZhdWx0IHZhbHVlcyBpZiB1bnNldAoraWZlcSAoJChY
RU5fVEFSR0VUX0FSQ0gpLCAkKFhFTl9DT01QSUxFX0FSQ0gpKQorSE9TVENDICAgID89ICQoQ0Mp
CitIT1NUQ1hYICAgPz0gJChDWFgpCitlbHNlCitIT1NUQ0MgICAgPz0gJChERUZfQ0MpCitIT1NU
Q1hYICAgPz0gJChERUZfQ1hYKQogZW5kaWYKIAogQ1BQICAgICAgICA9ICQoQ0MpIC1FCmRpZmYg
LS1naXQgYS9zY3JpcHRzL3RyYXZpcy1idWlsZCBiL3NjcmlwdHMvdHJhdmlzLWJ1aWxkCmluZGV4
IDBjYjE1YTg5ZTQuLmEyNjRlMjg2YjIgMTAwNzU1Ci0tLSBhL3NjcmlwdHMvdHJhdmlzLWJ1aWxk
CisrKyBiL3NjcmlwdHMvdHJhdmlzLWJ1aWxkCkBAIC0xLDYgKzEsMTQgQEAKICMhL2Jpbi9iYXNo
IC1leAogCisjIFNldCBIT1NUe0NDL0NYWH0gaW4gY2FzZSB3ZSBhcmUgY3Jvc3MgYnVpbGRpbmcK
K2V4cG9ydCBIT1NUQ0M9JHtDQ30KK2V4cG9ydCBIT1NUQ1hYPSR7Q1hYfQorIyBQcmVmaXggZW52
aXJvbm1lbnQgQ0MvQ1hYIHdpdGggQ1JPU1NfQ09NUElMRSBpZiBwcmVzZW50CitleHBvcnQgQ0M9
JHtDUk9TU19DT01QSUxFfSR7Q0N9CitleHBvcnQgQ1hYPSR7Q1JPU1NfQ09NUElMRX0ke0NYWH0K
KwogJENDIC0tdmVyc2lvbgorW1sgIiR7Q0N9IiAhPSAiJHtIT1NUQ0N9IiBdXSAmJiAkSE9TVEND
IC0tdmVyc2lvbgogCiAjIHJhbmRvbSBjb25maWcgb3IgZGVmYXVsdCBjb25maWcKIGlmIFtbICIk
e1JBTkRDT05GSUd9IiA9PSAieSIgXV07IHRoZW4KLS0gCjIuMjIuMAoKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QK
WGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5v
cmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
