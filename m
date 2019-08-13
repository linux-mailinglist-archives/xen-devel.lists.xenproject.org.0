Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AA51C8C025
	for <lists+xen-devel@lfdr.de>; Tue, 13 Aug 2019 20:08:10 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hxb9u-00083s-0u; Tue, 13 Aug 2019 18:04:34 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=8rFE=WJ=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1hxb9s-00083n-TN
 for xen-devel@lists.xen.org; Tue, 13 Aug 2019 18:04:33 +0000
X-Inumbo-ID: cc78bcb0-bdf4-11e9-a756-27f406fc7354
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id cc78bcb0-bdf4-11e9-a756-27f406fc7354;
 Tue, 13 Aug 2019 18:04:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1565719471;
 h=subject:from:to:cc:references:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=shK7vbDo0xzD5Nb/XZG2vcjlb4ImrfzWH2GD48I8adc=;
 b=AjYblwJj3suDY0ZwAKa715SdvB9nrZZuI6bugC/OXqK9l25Z9nJ+D1Tc
 AaUd53TW+LTdUPeYgANZXnrA5NJEGECpngZ9Ye1KKjo2U4+yv6Q2a+Twy
 S7orBMlp0P9BzO9Ems9jvdSsFqx2qqNnY6Gmdh7gWdflbzcUpmCkiQGez E=;
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
IronPort-SDR: 42D6qCwI6+pVvdzGmJGEpGgjVNHcHLtR3km5w/4c9aopDq2K/rGgCEbo9JargEuA3zdCts0Dvy
 G3wa5oF3rQKS9H0DqLJ3sWR5LgLQ/zb5illVGF28rRwk3PI4gvPheIqVuKeFgTgNoPQrUa0voE
 vutfabNVvZn9lXvAaGmXrHEf2X3MKzxGtqLUQ8MiRIH4IaeCYwCs5TpsoPEgo6PiDGJ7MTkvUj
 T61oAqHbSPjL7zljIlwTY9nz0Se1XHFZkKXJXrpdeBHA6wOhef3gHK3rSIFDfjuIlouwik19tg
 XxY=
X-SBRS: 2.7
X-MesageID: 4398336
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,382,1559534400"; 
   d="scan'208";a="4398336"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Julien Grall <julien.grall@arm.com>, Xen-devel <xen-devel@lists.xen.org>
References: <1545399965-5174-1-git-send-email-andrew.cooper3@citrix.com>
 <ee8053c9-467f-f1a8-5d83-5c69a766d17d@arm.com>
 <09c39607-ed40-ab4f-7e0c-12f9207636b6@citrix.com>
Openpgp: preference=signencrypt
Autocrypt: addr=andrew.cooper3@citrix.com; prefer-encrypt=mutual; keydata=
 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
 6+ahAA==
Message-ID: <670f2bd7-4c00-c7e8-66ae-464213037fd4@citrix.com>
Date: Tue, 13 Aug 2019 19:04:27 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <09c39607-ed40-ab4f-7e0c-12f9207636b6@citrix.com>
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
Subject: Re: [Xen-devel] [PATCH] x86/pv: Clean up cr3 handling in
 arch_set_info_guest()
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>,
 Jan Beulich <JBeulich@suse.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjQvMDEvMjAxOSAyMjoxMCwgQW5kcmV3IENvb3BlciB3cm90ZToKPiBPbiAyNC8wMS8yMDE5
IDIxOjQyLCBKdWxpZW4gR3JhbGwgd3JvdGU6Cj4+IEhpIEFuZHJldywKPj4KPj4gT24gMTIvMjEv
MTggMTo0NiBQTSwgQW5kcmV3IENvb3BlciB3cm90ZToKPj4+IEFsbCBvZiB0aGlzIGNvZGUgbGl2
ZXMgaW5zaWRlIENPTkZJR19QViB3aGljaCBtZWFucyBnZm4gPT0gbWZuLCBhbmQgdGhlCj4+PiBm
aWxsX3JvX21wdCgpIGNhbGxzIGNsZWFybHkgc2hvdyB0aGF0IHRoZSB2YWx1ZSBpcyB1c2VkIHVu
dHJhbnNsYXRlZC4KPj4+Cj4+PiBDaGFuZ2UgY3IzX2dmbiB0byBhIHN1aXRhYmx5IHR5cGVkIGNy
M19tZm4sIGFuZCByZXBsYWNlCj4+PiBnZXRfcGFnZV9mcm9tX2dmbigpCj4+PiB3aXRoIGEgc3Ry
YWlnaHQgbWZuX3RvX3BhZ2UvZ2V0X3BhZ2Ugc2VxdWVuY2UsIHRvIGF2b2lkIHRoZQo+Pj4gaW1w
bGljYXRpb24gdGhhdAo+Pj4gdHJhbnNsYXRpb24gaXMgZ29pbmcgb24uCj4+Pgo+Pj4gTm8gZnVu
Y3Rpb25hbCBjaGFuZ2UuCj4+Pgo+Pj4gU2lnbmVkLW9mZi1ieTogQW5kcmV3IENvb3BlciA8YW5k
cmV3LmNvb3BlcjNAY2l0cml4LmNvbT4KPj4+IC0tLQo+Pj4gQ0M6IEphbiBCZXVsaWNoIDxKQmV1
bGljaEBzdXNlLmNvbT4KPj4+IENDOiBXZWkgTGl1IDx3ZWkubGl1MkBjaXRyaXguY29tPgo+Pj4g
Q0M6IFJvZ2VyIFBhdSBNb25uw6kgPHJvZ2VyLnBhdUBjaXRyaXguY29tPgo+Pj4gQ0M6IFN0ZWZh
bm8gU3RhYmVsbGluaSA8c3N0YWJlbGxpbmlAa2VybmVsLm9yZz4KPj4+IENDOiBKdWxpZW4gR3Jh
bGwgPGp1bGllbi5ncmFsbEBhcm0uY29tPgo+Pj4KPj4+IEp1bGllbjogVGhpcyBzaG91bGQgc2lt
cGxpZnkgeW91ciAieGVuOiBTd2l0Y2ggcGFyYW1ldGVyIGluCj4+PiBnZXRfcGFnZV9mcm9tX2dm
bgo+Pj4gdG8gdXNlIHR5cGVzYWZlIGdmbiIgcGF0Y2guwqAgSW4gcGFydGljdWxhciwgSSBkaWQg
YSBkb3VibGV0YWtlIGF0Cj4+PiBmaWxsX3JvX21wdChfbWZuKGdmbl94KGNyM19nZm4pKSk7IHdo
ZW4gcmV2aWV3aW5nIGl0Lgo+PiBJIHdhcyBsb29raW5nIGF0IHVwZGF0aW5nIG15IHBhdGNoIGFu
ZCByZW1lbWJlcmVkIHlvdSBzdWdnZXN0ZWQgdG8KPj4gcmViYXNlIG9uIHRvcCBvZiB0aGlzLiBE
byB5b3UgaGF2ZSBhbnkgcGxhbiB0byByZXNlbmQgdGhlIHBhdGNoPwo+IEknbGwgc2VlIGlmIEkg
Y2FuIGZpbmQgc29tZSB0aW1lIHRvbW9ycm93LgoKU28gbWF5YmUgSSB3YXMgYSBsaXR0bGUgb2Zm
IDspwqAgQmV0dGVyIGxhdGUgdGhhbiBuZXZlciBJIHN1cHBvc2UuCgp+QW5kcmV3CgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGlu
ZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnBy
b2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
