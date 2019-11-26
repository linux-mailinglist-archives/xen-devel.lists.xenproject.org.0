Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FFC8109DE7
	for <lists+xen-devel@lfdr.de>; Tue, 26 Nov 2019 13:27:32 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iZZuT-0004VA-8z; Tue, 26 Nov 2019 12:25:37 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=XQNV=ZS=amazon.de=prvs=226749d31=wipawel@srs-us1.protection.inumbo.net>)
 id 1iZZuS-0004V2-FG
 for xen-devel@lists.xenproject.org; Tue, 26 Nov 2019 12:25:36 +0000
X-Inumbo-ID: d8dd05b0-1047-11ea-a39f-12813bfff9fa
Received: from smtp-fw-9101.amazon.com (unknown [207.171.184.25])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id d8dd05b0-1047-11ea-a39f-12813bfff9fa;
 Tue, 26 Nov 2019 12:25:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.de; i=@amazon.de; q=dns/txt; s=amazon201209;
 t=1574771136; x=1606307136;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version;
 bh=HR6Q25AMByjcPXEWxExppHvMoBR8pEutP1d1RwP/93Y=;
 b=qSiWVF4LN2glUlY0/0RB+dS27oVaA1VMCDAoUFU+6AHQfpgqi+s8/zf1
 LY41wqm0BC3qvH6GJvEEGrKxKxWq+ZK8yjSwokhAn/oOIyYtgwehf/yo1
 fb3YAXSMUOQ2SnO4dInWTGle8EYSkT+zNmwvxNmU5zkozyZ2erXHUZRXj g=;
IronPort-SDR: y1wg3m7RdO4awonVWlyS/OkxtNs6M35IFQdD2WdIGVK/25JaMk/Is7SL2HiABi1RK+dAp5gRF8
 3IXodFi76iiA==
X-IronPort-AV: E=Sophos;i="5.69,245,1571702400"; 
   d="scan'208";a="1534199"
Received: from sea32-co-svc-lb4-vlan3.sea.corp.amazon.com (HELO
 email-inbound-relay-2c-2225282c.us-west-2.amazon.com) ([10.47.23.38])
 by smtp-border-fw-out-9101.sea19.amazon.com with ESMTP;
 26 Nov 2019 12:25:24 +0000
Received: from EX13MTAUEA001.ant.amazon.com
 (pdx4-ws-svc-p6-lb7-vlan3.pdx.amazon.com [10.170.41.166])
 by email-inbound-relay-2c-2225282c.us-west-2.amazon.com (Postfix) with ESMTPS
 id B127AA28F7; Tue, 26 Nov 2019 12:25:23 +0000 (UTC)
Received: from EX13D03EUC004.ant.amazon.com (10.43.164.33) by
 EX13MTAUEA001.ant.amazon.com (10.43.61.243) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Tue, 26 Nov 2019 12:25:23 +0000
Received: from EX13MTAUWC001.ant.amazon.com (10.43.162.135) by
 EX13D03EUC004.ant.amazon.com (10.43.164.33) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Tue, 26 Nov 2019 12:25:22 +0000
Received: from dev-dsk-wipawel-1a-0c4e6d58.eu-west-1.amazon.com (10.4.134.33)
 by mail-relay.amazon.com (10.43.162.232) with Microsoft SMTP Server
 id
 15.0.1367.3 via Frontend Transport; Tue, 26 Nov 2019 12:25:19 +0000
From: Pawel Wieczorkiewicz <wipawel@amazon.de>
To: <xen-devel@lists.xenproject.org>
Date: Tue, 26 Nov 2019 12:25:05 +0000
Message-ID: <20191126122511.7409-2-wipawel@amazon.de>
X-Mailer: git-send-email 2.16.5
In-Reply-To: <20191126122511.7409-1-wipawel@amazon.de>
References: <20191126122511.7409-1-wipawel@amazon.de>
MIME-Version: 1.0
Precedence: Bulk
Subject: [Xen-devel] [PATCH v3 1/7] livepatch-build: Embed hypervisor build
 id into every hotpatch
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Pawel Wieczorkiewicz <wipawel@amazon.de>,
 Ross Lagerwall <ross.lagerwall@citrix.com>, mpohlack@amazon.com, Konrad
 Rzeszutek Wilk <konrad.wilk@oracle.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

VGhpcyBjaGFuZ2UgaXMgcGFydCBvZiBhIGluZGVwZW5kYW50IHN0YWNrZWQgaG90cGF0Y2ggbW9k
dWxlcwpmZWF0dXJlLiBUaGlzIGZlYXR1cmUgYWxsb3dzIHRvIGJ5cGFzcyBkZXBlbmRlbmNpZXMg
YmV0d2VlbiBtb2R1bGVzCnVwb24gbG9hZGluZywgYnV0IHN0aWxsIHZlcmlmaWVzIFhlbiBidWls
ZCBJRCBtYXRjaGluZy4KCldpdGggc3RhY2tlZCBob3RwYXRjaCBtb2R1bGVzIGl0IGlzIGVzc2Vu
dGlhbCB0aGF0IGVhY2ggYW5kIGV2ZXJ5CmhvdHBhdGNoIGlzIHZlcmlmaWVkIGFnYWluc3QgdGhl
IGh5cGVydmlzb3IgYnVpbGQgaWQgdXBvbiB1cGxvYWQuCkl0IG11c3Qgbm90IGJlIHBvc3NpYmxl
IHRvIHN1Y2Nlc3NmdWxseSB1cGxvYWQgaG90cGF0Y2hlcyBidWlsdCBmb3IKaW5jb3JyZWN0IHZl
cnNpb24gb2YgdGhlIGh5cGVydmlzb3IuCgpUbyBhY2hpZXZlIHRoYXQgYWx3YXlzIGVtYmVkIGFu
IGFkZGl0aW9uYWwgRUxGIHNlY3Rpb246CicubGl2cGF0Y2gueGVuX2RlcGVuZHMnIGNvbnRhaW5p
bmcgdGhlIGh5cGVydmlzb3IgYnVpbGQgaWQuCgpUaGUgaHlwZXJ2aXNvciBidWlsZCBpZCBtdXN0
IGJlIGFsd2F5cyBwcm92aWRlZCBhcyBhIGNvbW1hbmQgbGluZQpwYXJhbWV0ZXI6IC0teGVuLWRl
cGVuZHMuCgpTaWduZWQtb2ZmLWJ5OiBQYXdlbCBXaWVjem9ya2lld2ljeiA8d2lwYXdlbEBhbWF6
b24uZGU+ClJldmlld2VkLWJ5OiBBbmRyYS1JcmluYSBQYXJhc2NoaXYgPGFuZHJhcHJzQGFtYXpv
bi5jb20+ClJldmlld2VkLWJ5OiBCam9lcm4gRG9lYmVsIDxkb2ViZWxAYW1hem9uLmRlPgpSZXZp
ZXdlZC1ieTogTm9yYmVydCBNYW50aGV5IDxubWFudGhleUBhbWF6b24uZGU+ClJldmlld2VkLWJ5
OiBSb3NzIExhZ2Vyd2FsbCA8cm9zcy5sYWdlcndhbGxAY2l0cml4LmNvbT4KLS0tCiBsaXZlcGF0
Y2gtYnVpbGQgfCAxNiArKysrKysrKysrKysrKystCiAxIGZpbGUgY2hhbmdlZCwgMTUgaW5zZXJ0
aW9ucygrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL2xpdmVwYXRjaC1idWlsZCBiL2xp
dmVwYXRjaC1idWlsZAppbmRleCBiMTk4Yzk3Li5iOGExNzI4IDEwMDc1NQotLS0gYS9saXZlcGF0
Y2gtYnVpbGQKKysrIGIvbGl2ZXBhdGNoLWJ1aWxkCkBAIC0zMCw2ICszMCw3IEBAIERFQlVHPW4K
IFhFTl9ERUJVRz1uCiBTS0lQPQogREVQRU5EUz0KK1hFTl9ERVBFTkRTPQogUFJFTElOSz0KIFhF
TlNZTVM9eGVuLXN5bXMKIApAQCAtMTYzLDYgKzE2NCw5IEBAIGZ1bmN0aW9uIGNyZWF0ZV9wYXRj
aCgpCiAgICAgIyBDcmVhdGUgYSBkZXBlbmRlbmN5IHNlY3Rpb24KICAgICBwZXJsIC1lICJwcmlu
dCBwYWNrICdWVlZaKkgqJywgNCwgMjAsIDMsICdHTlUnLCAnJHtERVBFTkRTfSciID4gZGVwZW5k
cy5iaW4KIAorICAgICMgQ3JlYXRlIGEgWGVuIGRlcGVuZGVuY3kgc2VjdGlvbgorICAgIHBlcmwg
LWUgInByaW50IHBhY2sgJ1ZWVloqSConLCA0LCAyMCwgMywgJ0dOVScsICcke1hFTl9ERVBFTkRT
fSciID4geGVuX2RlcGVuZHMuYmluCisKICAgICBlY2hvICJDcmVhdGluZyBwYXRjaCBtb2R1bGUu
Li4iCiAgICAgaWYgWyAteiAiJFBSRUxJTksiIF07IHRoZW4KICAgICAgICAgbGQgLXIgLW8gIiR7
UEFUQ0hOQU1FfS5saXZlcGF0Y2giIC0tYnVpbGQtaWQ9c2hhMSAkKGZpbmQgb3V0cHV0IC10eXBl
IGYgLW5hbWUgIioubyIpIHx8IGRpZQpAQCAtMTc0LDYgKzE3OCw5IEBAIGZ1bmN0aW9uIGNyZWF0
ZV9wYXRjaCgpCiAKICAgICBvYmpjb3B5IC0tYWRkLXNlY3Rpb24gLmxpdmVwYXRjaC5kZXBlbmRz
PWRlcGVuZHMuYmluICIke1BBVENITkFNRX0ubGl2ZXBhdGNoIgogICAgIG9iamNvcHkgLS1zZXQt
c2VjdGlvbi1mbGFncyAubGl2ZXBhdGNoLmRlcGVuZHM9YWxsb2MscmVhZG9ubHkgIiR7UEFUQ0hO
QU1FfS5saXZlcGF0Y2giCisKKyAgICBvYmpjb3B5IC0tYWRkLXNlY3Rpb24gLmxpdmVwYXRjaC54
ZW5fZGVwZW5kcz14ZW5fZGVwZW5kcy5iaW4gIiR7UEFUQ0hOQU1FfS5saXZlcGF0Y2giCisgICAg
b2JqY29weSAtLXNldC1zZWN0aW9uLWZsYWdzIC5saXZlcGF0Y2gueGVuX2RlcGVuZHM9YWxsb2Ms
cmVhZG9ubHkgIiR7UEFUQ0hOQU1FfS5saXZlcGF0Y2giCiB9CiAKIHVzYWdlKCkgewpAQCAtMTg5
LDEyICsxOTYsMTMgQEAgdXNhZ2UoKSB7CiAgICAgZWNobyAiICAgICAgICAtLXhlbi1kZWJ1ZyAg
ICAgICAgQnVpbGQgZGVidWcgWGVuIChpZiB5b3VyIC5jb25maWcgZG9lcyBub3QgaGF2ZSB0aGUg
b3B0aW9ucykiID4mMgogICAgIGVjaG8gIiAgICAgICAgLS14ZW4tc3ltcyAgICAgICAgIEJ1aWxk
IGFnYWluc3QgYSB4ZW4tc3ltcyIgPiYyCiAgICAgZWNobyAiICAgICAgICAtLWRlcGVuZHMgICAg
ICAgICAgUmVxdWlyZWQgYnVpbGQtaWQiID4mMgorICAgIGVjaG8gIiAgICAgICAgLS14ZW4tZGVw
ZW5kcyAgICAgIFJlcXVpcmVkIFhlbiBidWlsZC1pZCIgPiYyCiAgICAgZWNobyAiICAgICAgICAt
LXByZWxpbmsgICAgICAgICAgUHJlbGluayIgPiYyCiB9CiAKIGZpbmRfdG9vbHMgfHwgZGllICJj
YW4ndCBmaW5kIHN1cHBvcnRpbmcgdG9vbHMiCiAKLW9wdGlvbnM9JChnZXRvcHQgLW8gaHM6cDpj
Om86ajprOmQgLWwgImhlbHAsc3JjZGlyOixwYXRjaDosY29uZmlnOixvdXRwdXQ6LGNwdXM6LHNr
aXA6LGRlYnVnLHhlbi1kZWJ1Zyx4ZW4tc3ltczosZGVwZW5kczoscHJlbGluayIgLS0gIiRAIikg
fHwgZGllICJnZXRvcHQgZmFpbGVkIgorb3B0aW9ucz0kKGdldG9wdCAtbyBoczpwOmM6bzpqOms6
ZCAtbCAiaGVscCxzcmNkaXI6LHBhdGNoOixjb25maWc6LG91dHB1dDosY3B1czosc2tpcDosZGVi
dWcseGVuLWRlYnVnLHhlbi1zeW1zOixkZXBlbmRzOix4ZW4tZGVwZW5kczoscHJlbGluayIgLS0g
IiRAIikgfHwgZGllICJnZXRvcHQgZmFpbGVkIgogCiBldmFsIHNldCAtLSAiJG9wdGlvbnMiCiAK
QEAgLTI1Myw2ICsyNjEsMTEgQEAgd2hpbGUgW1sgJCMgLWd0IDAgXV07IGRvCiAgICAgICAgICAg
ICBERVBFTkRTPSIkMSIKICAgICAgICAgICAgIHNoaWZ0CiAgICAgICAgICAgICA7OworICAgICAg
ICAtLXhlbi1kZXBlbmRzKQorICAgICAgICAgICAgc2hpZnQKKyAgICAgICAgICAgIFhFTl9ERVBF
TkRTPSIkMSIKKyAgICAgICAgICAgIHNoaWZ0CisgICAgICAgICAgICA7OwogICAgICAgICAtLXBy
ZWxpbmspCiAgICAgICAgICAgICBQUkVMSU5LPS0tcmVzb2x2ZQogICAgICAgICAgICAgc2hpZnQK
QEAgLTI2OSw2ICsyODIsNyBAQCBkb25lCiBbIC16ICIkY29uZmlnYXJnIiBdICYmIGRpZSAiLmNv
bmZpZyBub3QgZ2l2ZW4iCiBbIC16ICIkb3V0cHV0YXJnIiBdICYmIGRpZSAiT3V0cHV0IGRpcmVj
dG9yeSBub3QgZ2l2ZW4iCiBbIC16ICIkREVQRU5EUyIgXSAmJiBkaWUgIkJ1aWxkLWlkIGRlcGVu
ZGVuY3kgbm90IGdpdmVuIgorWyAteiAiJFhFTl9ERVBFTkRTIiBdICYmIGRpZSAiWGVuIEJ1aWxk
LWlkIGRlcGVuZGVuY3kgbm90IGdpdmVuIgogCiBTUkNESVI9IiQocmVhZGxpbmsgLW0gLS0gIiRz
cmNhcmciKSIKICMgV2UgbmVlZCBhbiBhYnNvbHV0ZSBwYXRoIGJlY2F1c2Ugd2UgbW92ZSBhcm91
bmQsIGJ1dCB3ZSBuZWVkIHRvCi0tIAoyLjE2LjUKCgoKCkFtYXpvbiBEZXZlbG9wbWVudCBDZW50
ZXIgR2VybWFueSBHbWJICktyYXVzZW5zdHIuIDM4CjEwMTE3IEJlcmxpbgpHZXNjaGFlZnRzZnVl
aHJ1bmc6IENocmlzdGlhbiBTY2hsYWVnZXIsIFJhbGYgSGVyYnJpY2gKRWluZ2V0cmFnZW4gYW0g
QW10c2dlcmljaHQgQ2hhcmxvdHRlbmJ1cmcgdW50ZXIgSFJCIDE0OTE3MyBCClNpdHo6IEJlcmxp
bgpVc3QtSUQ6IERFIDI4OSAyMzcgODc5CgoKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0
cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlz
dGluZm8veGVuLWRldmVs
