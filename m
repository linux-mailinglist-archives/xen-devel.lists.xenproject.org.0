Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ACFE715220F
	for <lists+xen-devel@lfdr.de>; Tue,  4 Feb 2020 22:46:43 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iz5ya-0000go-Lj; Tue, 04 Feb 2020 21:43:20 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=I1tw=3Y=citrix.com=igor.druzhinin@srs-us1.protection.inumbo.net>)
 id 1iz5yZ-0000gj-09
 for xen-devel@lists.xenproject.org; Tue, 04 Feb 2020 21:43:19 +0000
X-Inumbo-ID: 5acbe7a4-4797-11ea-a933-bc764e2007e4
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 5acbe7a4-4797-11ea-a933-bc764e2007e4;
 Tue, 04 Feb 2020 21:43:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1580852598;
 h=subject:from:to:cc:references:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=GhT69WJXuwYq+LQ3WeJC0vrGFLfFyj1vbHfFQQFiB7U=;
 b=h64OjYkwaVu5kxwRbEEWhEm32IeA8UDSY53MCJKrXjv/lB3ScQWqDzw3
 nh7+JiMFzp636KrX9SO5fky01vMX0F1MLk4Y/uTYCBf+7PTF4rTD0cCLP
 lwg8ZceWRHkTjvFbQ3U322ewqzHqWs+DES1f2Ml0jdPHrpHauS0crwn6C Y=;
Authentication-Results: esa4.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=igor.druzhinin@citrix.com;
 spf=Pass smtp.mailfrom=igor.druzhinin@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 igor.druzhinin@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="igor.druzhinin@citrix.com";
 x-sender="igor.druzhinin@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa4.hc3370-68.iphmx.com: domain of
 igor.druzhinin@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="igor.druzhinin@citrix.com";
 x-sender="igor.druzhinin@citrix.com";
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
 envelope-from="igor.druzhinin@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: Apx9JblBKcIVUuvVzLYEER8pauNtBURXI0VJrrITSXhAqHRsZoAC4rGkbSA0IB6DpHv1CiqkxP
 YUKYDTZSBZeeJ1lB1hVrPCnfaF3jO1ObbiiNzvfhk0FvSyZec4ACxg2UXwVl5ex0DEfDgC+3pV
 Rtz1kd/1JcWZtq57G5BH/TpRizDCRrT9AnpPVoLOPXGbAqhDpYGnaaaJabGwvqo6m8+birlzUL
 nv2nQp72je6FPN1gXLfTIjKsNllELf6w3qkvpDP0JYTG8rMwjNfG4pezOCp7X8VHJWHk/+tlqF
 LjA=
X-SBRS: 2.7
X-MesageID: 12563633
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,403,1574139600"; d="scan'208";a="12563633"
From: Igor Druzhinin <igor.druzhinin@citrix.com>
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <1580830825-18767-1-git-send-email-igor.druzhinin@citrix.com>
 <1580830825-18767-2-git-send-email-igor.druzhinin@citrix.com>
 <20200204171701.GM4679@Air-de-Roger>
 <55a7f103-93fe-ceda-67e0-92ece808d542@citrix.com>
Message-ID: <7c4fd902-09c1-28b6-5486-4badb1bfe1cd@citrix.com>
Date: Tue, 4 Feb 2020 21:43:15 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <55a7f103-93fe-ceda-67e0-92ece808d542@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH 1/2] x86/shim: suspend and resume platform
 time correctly
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
Cc: xen-devel@lists.xenproject.org, wl@xen.org, jbeulich@suse.com,
 andrew.cooper3@citrix.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDQvMDIvMjAyMCAxNzo0MywgSWdvciBEcnV6aGluaW4gd3JvdGU6Cj4gT24gMDQvMDIvMjAy
MCAxNzoxNywgUm9nZXIgUGF1IE1vbm7DqSB3cm90ZToKPj4gT24gVHVlLCBGZWIgMDQsIDIwMjAg
YXQgMDM6NDA6MjRQTSArMDAwMCwgSWdvciBEcnV6aGluaW4gd3JvdGU6Cj4+PiBTaW1pbGFybHkg
dG8gUzMsIHBsYXRmb3JtIHRpbWUgbmVlZHMgdG8gYmUgc2F2ZWQgb24gZ3Vlc3Qgc3VzcGVuZAo+
Pj4gYW5kIHJlc3RvcmVkIG9uIHJlc3VtZSByZXNwZWN0aXZlbHkuIFRoaXMgc2hvdWxkIGFjY291
bnQgZm9yIGV4cGVjdGVkCj4+PiBqdW1wcyBpbiBQViBjbG9jayBjb3VudGVyIHZhbHVlIGFmdGVy
IHJlc3VtZS4gdGltZV9zdXNwZW5kL3Jlc3VtZSgpCj4+PiBhcmUgc2FmZSB0byB1c2UgaW4gUFZI
IHNldHRpbmcgYXMgaXMgc2luY2UgYW55IGV4aXN0aW5nIG9wZXJhdGlvbnMKPj4+IHdpdGggUElU
IHRoYXQgdGhleSBkbyB3b3VsZCBzaW1wbHkgYmUgaWdub3JlZCB0aGVyZS4KPj4KPj4gVGhlcmUn
cyBhbHNvIGFuIGF0dGVtcHQgdG8gZmlkZGxlIHdpdGggSFBFVCwgd2hpY2ggSSB0aGluayBpdCdz
IGp1c3QgYQo+PiBuby1vcC4KPj4KPj4gSnVzdCB0byBiZSBvbiB0aGUgc2FmZSBzaWRlIGl0IG1p
Z2h0IGJlIGJldHRlciB0byBwYXNzIGEgbmV3IHBhcmFtZXRlcgo+PiB0byB0aW1lX3Jlc3VtZSBp
biBvcmRlciB0byBzaWduYWwgd2hldGhlciBQSVQvSFBFVCBzaG91bGQgZXZlbiBiZQo+PiBhdHRl
bXB0ZWQgdG8gYmUgcmVzdW1lZD8KPiAKPiBCb3RoIG9mIHByZWluaXRfcGl0KCkgYW5kIF9kaXNh
YmxlX3BpdF9pcnEoKSBhbHJlYWR5IGNhbGxlZCBpbiBQViBzaGltCj4gZHVyaW5nIGJvb3QuIFNv
IGl0IG1pZ2h0IGJlIGJldHRlciB0byBpbmNsdWRlIGEgY29uZGl0aW9uIHJpZ2h0IGluc2lkZQo+
IHRoZW0gdG8gY292ZXIgdGhhdCBjYXNlIGFzIHdlbGwuCgpPbiBzZWNvbmQgdGhvdWdodCwgaXQg
bWlnaHQgbm90IGJlIGV4YWN0bHkgdHJ1ZSB0aGF0IHRob3NlIGRldmljZXMgYXJlCm5vbi1wcmVz
ZW50IChhdCBsZWFzdCBmb3IgcG90ZW50aWFsIFBWLWluLUhWTSBjYXNlKS4KU28gSSdsbCBsZWF2
ZSBpdCBhcyBpcyBmb3IgdjIuCgpJZ29yCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54
ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGlu
Zm8veGVuLWRldmVs
