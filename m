Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7818140DD0E
	for <lists+xen-devel@lfdr.de>; Thu, 16 Sep 2021 16:42:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.188497.337665 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mQsab-00011a-Vg; Thu, 16 Sep 2021 14:42:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 188497.337665; Thu, 16 Sep 2021 14:42:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mQsab-0000yA-Ru; Thu, 16 Sep 2021 14:42:13 +0000
Received: by outflank-mailman (input) for mailman id 188497;
 Thu, 16 Sep 2021 14:42:12 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=20iF=OG=yandex.ru=isaikin-dmitry@srs-us1.protection.inumbo.net>)
 id 1mQsaa-0000y4-Co
 for xen-devel@lists.xenproject.org; Thu, 16 Sep 2021 14:42:12 +0000
Received: from forward501p.mail.yandex.net (unknown [77.88.28.111])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 1b94f661-eeca-4f3e-b033-1e681013ad73;
 Thu, 16 Sep 2021 14:42:08 +0000 (UTC)
Received: from vla5-5db4dee6e8c2.qloud-c.yandex.net
 (vla5-5db4dee6e8c2.qloud-c.yandex.net
 [IPv6:2a02:6b8:c18:3482:0:640:5db4:dee6])
 by forward501p.mail.yandex.net (Yandex) with ESMTP id 7EA6562127A6;
 Thu, 16 Sep 2021 17:42:06 +0300 (MSK)
Received: from 2a02:6b8:c18:3607:0:640:4452:c58d
 (2a02:6b8:c18:3607:0:640:4452:c58d [2a02:6b8:c18:3607:0:640:4452:c58d])
 by vla5-5db4dee6e8c2.qloud-c.yandex.net (mxback/Yandex) with HTTP id
 4gZTQQ2E6Os1-g4E02cf5; Thu, 16 Sep 2021 17:42:05 +0300
Received: by vla5-4452c58d5c14.qloud-c.yandex.net with HTTP;
 Thu, 16 Sep 2021 17:42:04 +0300
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
X-Inumbo-ID: 1b94f661-eeca-4f3e-b033-1e681013ad73
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex.ru; s=mail; t=1631803325;
	bh=P7p9tucualVsAGee4lV6wL5I5LHJo8lvNYgnA4TEFAo=;
	h=References:Date:Message-Id:Cc:Subject:In-Reply-To:To:From;
	b=XWZNzVVNq4Ew2DF51gXNXcuDzm1poarpZuTlm+J2rtXY6YSoICrkRE+hthMqIJDOJ
	 yBRLIPdFbPJg6nFWqE4lo61rEm+lpKsM00bJtdVa7u9qUM9e6fmVkOqURxxGrh0GVs
	 OKPkgpGxVusEZa2GiLubkbyOoDomU28NbcYRyb9U=
Authentication-Results: vla5-5db4dee6e8c2.qloud-c.yandex.net; dkim=pass header.i=@yandex.ru
From: Dmitry Isaikin <isaikin-dmitry@yandex.ru>
To: =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>
Cc: Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Ian Jackson <iwj@xenproject.org>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
In-Reply-To: <YUNBswZ3rAFeDa6I@MacBook-Air-de-Roger.local>
References: <2e7044de3cd8a6768a20250e61fe262f3a018724.1631790362.git.isaikin-dmitry@yandex.ru>
	 <22a4b3c7-7faa-607b-244a-0ab99d7ccfa9@suse.com> <YUNBswZ3rAFeDa6I@MacBook-Air-de-Roger.local>
Subject: Re: [PATCH v1] domctl: hold domctl lock while domain is destroyed
MIME-Version: 1.0
X-Mailer: Yamail [ http://yandex.ru ] 5.0
Date: Thu, 16 Sep 2021 17:42:04 +0300
Message-Id: <1855101631803324@vla5-4452c58d5c14.qloud-c.yandex.net>
Content-Transfer-Encoding: base64
Content-Type: text/html; charset=utf-8

PGJyIC8+PGJyIC8+MTY6MTQsIDE2INGB0LXQvdGC0Y/QsdGA0Y8gMjAyMSDQsy4sICJSb2dlciBQ
YXUgTW9ubsOpIiAmbHQ7cm9nZXIucGF1QGNpdHJpeC5jb20mZ3Q7OjxiciAvPjxibG9ja3F1b3Rl
IGNsYXNzPSIyMTBlN2E4NDhlOGZjYjQ1d21pLXF1b3RlIj48cD5PbiBUaHUsIFNlcCAxNiwgMjAy
MSBhdCAwMjozMDozOVBNICswMjAwLCBKYW4gQmV1bGljaCB3cm90ZTo8YnIgLz48L3A+PGJsb2Nr
cXVvdGUgY2xhc3M9IjIxMGU3YTg0OGU4ZmNiNDV3bWktcXVvdGUiPsKgT24gMTYuMDkuMjAyMSAx
MzoxMCwgRG1pdHJ5IElzYWlraW4gd3JvdGU6PGJyIC8+wqAmZ3Q7IEZyb206IERtaXRyeSBJc2F5
a2luICZsdDs8YSBocmVmPSJtYWlsdG86aXNhaWtpbi1kbWl0cnlAeWFuZGV4LnJ1Ij5pc2Fpa2lu
LWRtaXRyeUB5YW5kZXgucnU8L2E+Jmd0OzxiciAvPsKgJmd0OyA8YnIgLz7CoCZndDsgVGhpcyBz
aWduaWZpY2FudGx5IHNwZWVkcyB1cCBjb25jdXJyZW50IGRlc3RydWN0aW9uIG9mIG11bHRpcGxl
IGRvbWFpbnMgb24geDg2LjxiciAvPsKgPGJyIC8+wqBUaGlzIGVmZmVjdGl2ZWx5IGlzIGEgc2lt
cGxpc3RpYyByZXZlcnQgb2YgMjI4YWI5OTkyZmZiICgiZG9tY3RsOjxiciAvPsKgaW1wcm92ZSBs
b2NraW5nIGR1cmluZyBkb21haW4gZGVzdHJ1Y3Rpb24iKS4gVGhlcmUgaXQgd2FzIGZvdW5kIHRv
PGJyIC8+wqBhY3R1YWxseSBpbXByb3ZlIHRoaW5nczsgbm93IHlvdSdyZSBjbGFpbWluZyB0aGUg
b3Bwb3NpdGUuIEl0J2xsPGJyIC8+wqB0YWtlIG1vcmUganVzdGlmaWNhdGlvbiwgY2xlYXJseSBp
ZGVudGlmeWluZyB0aGF0IHlvdSBhY3R1YWxseTxiciAvPsKgcmV2ZXJ0IGFuIGVhcmxpZXIgY2hh
bmdlLCBhbmQgYW4gZXhwbGFuYXRpb24gd2h5IHRoZW4geW91IGRvbid0PGJyIC8+wqByZXZlcnQg
dGhhdCBjaGFuZ2UgYWx0b2dldGhlci4gWW91IHdpbGwgd2FudCB0byBzcGVjaWZpY2FsbHkgYWxz
bzxiciAvPsKgY29uc2lkZXIgdGhlIGNsZWFuaW5nIHVwIG9mIGh1Z2UgVk1zLCB3aGVyZSB1c2Ug
b2YgdGhlIChnbG9iYWwpPGJyIC8+wqBkb21jdGwgbG9jayBtYXkgaGFtcGVyIHByb2dyZXNzIG9m
IG90aGVyIChwYXJhbGxlbCkgb3BlcmF0aW9ucyBvbjxiciAvPsKgdGhlIHN5c3RlbS48YnIgLz7C
oDxiciAvPsKgJmd0OyBJIGlkZW50aWZ5IHRoZSBwbGFjZSB0YWtpbmcgdGhlIG1vc3QgdGltZTo8
YnIgLz7CoCZndDsgPGJyIC8+wqAmZ3Q7ICAgICBkb19kb21jdGwoY2FzZSBYRU5fRE9NQ1RMX2Rl
c3Ryb3lkb21haW4pPGJyIC8+wqAmZ3Q7ICAgICAgIC0mZ3Q7IGRvbWFpbl9raWxsKCk8YnIgLz7C
oCZndDsgICAgICAgICAgICAtJmd0OyBkb21haW5fcmVsaW5xdWlzaF9yZXNvdXJjZXMoKTxiciAv
PsKgJmd0OyAgICAgICAgICAgICAgICAgLSZndDsgcmVsaW5xdWlzaF9tZW1vcnkoZCwgJmFtcDtk
LSZndDtwYWdlX2xpc3QsIFBHVF9sNF9wYWdlX3RhYmxlKTxiciAvPsKgJmd0OyA8YnIgLz7CoCZn
dDsgTXkgcmVmZXJlbmNlIHNldHVwOiBJbnRlbChSKSBYZW9uKFIpIENQVSBFNS0yNjgwIHY0IEAg
Mi40MEdIeiwgWGVuIDQuMTQuPGJyIC8+wqAmZ3Q7IDxiciAvPsKgJmd0OyBJIHVzZSB0aGlzIGNv
bW1hbmQgZm9yIHRlc3Q6PGJyIC8+wqAmZ3Q7IDxiciAvPsKgJmd0OyAgICAgZm9yIGkgaW4gJChz
ZXEgMSA1KSA7IGRvIHhsIGRlc3Ryb3kgdGVzdC12bS0ke2l9ICZhbXA7IGRvbmU8YnIgLz7CoCZn
dDsgPGJyIC8+wqAmZ3Q7IFdpdGhvdXQgaG9sZGluZyB0aGUgbG9jayBhbGwgY2FsbHMgb2YgYHJl
bGlucXVpc2hfbWVtb3J5KGQsICZhbXA7ZC0mZ3Q7cGFnZV9saXN0LCBQR1RfbDRfcGFnZV90YWJs
ZSlgPGJyIC8+wqAmZ3Q7IHRvb2sgb24gbXkgc2V0dXAgKGZvciBIVk0gd2l0aCAyR0Igb2YgbWVt
b3J5KSBhYm91dCAzIHNlY29uZHMgZm9yIGVhY2ggZGVzdHJveWluZyBkb21haW4uPGJyIC8+wqAm
Z3Q7IDxiciAvPsKgJmd0OyBXaXRoIGhvbGRpbmcgdGhlIGxvY2sgaXQgdG9vayBvbmx5IDEwMCBt
cy48YnIgLz7CoDxiciAvPsKgSSdtIGZ1cnRoZXIgYWZyYWlkIEkgY2FuJ3QgbWFrZSB0aGUgY29u
bmVjdGlvbi4gRG8geW91IGhhdmUgYW48YnIgLz7CoGV4cGxhbmF0aW9uIGZvciB3aHkgdGhlcmUg
d291bGQgYmUgc3VjaCBhIG1hc3NpdmUgZGlmZmVyZW5jZT88YnIgLz7CoFdoYXQgd291bGQgcHJl
dmVudCBwcm9ncmVzcyBvZiByZWxpbnF1aXNoX21lbW9yeSgpIHdpdGggdGhlPGJyIC8+wqBkb21j
dGwgbG9jayBub3QgaGVsZD88YnIgLz48L2Jsb2NrcXVvdGU+PHA+PGJyIC8+SSB3b3VsZCByZWNv
bW1lbmQgdG8gRG1pdHJ5IHRvIHVzZSBsb2NrIHByb2ZpbGluZyB3aXRoIGFuZCB3aXRob3V0PGJy
IC8+dGhpcyBjaGFuZ2UgYXBwbGllZCBhbmQgdHJ5IHRvIHNwb3Qgd2hpY2ggbG9jayBpcyBjYXVz
aW5nIHRoZTxiciAvPmNvbnRlbnRpb24gYXMgYSBzdGFydGluZyBwb2ludC4gVGhhdCBzaG91bGQg
YmUgZmFpcmx5IGVhc3kgYW5kIGNvdWxkPGJyIC8+c2hhcmUgc29tZSBsaWdodC48YnIgLz48YnIg
Lz5SZWdhcmRzLCBSb2dlci48YnIgLz48L3A+PC9ibG9ja3F1b3RlPlRoYW5rcy4gSSB3aWxsIHRy
eS48YnIgLz48ZGl2PjxiciAvPjwvZGl2PjxkaXY+RG1pdHJ5LjwvZGl2Pg==

