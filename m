Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 190552A022
	for <lists+xen-devel@lfdr.de>; Fri, 24 May 2019 22:51:50 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hUH7T-0002C5-7w; Fri, 24 May 2019 20:48:51 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=IEXw=TY=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1hUH7R-0002Bv-P8
 for xen-devel@lists.xenproject.org; Fri, 24 May 2019 20:48:49 +0000
X-Inumbo-ID: 540b767e-7e65-11e9-8980-bc764e045a96
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 540b767e-7e65-11e9-8980-bc764e045a96;
 Fri, 24 May 2019 20:48:48 +0000 (UTC)
Authentication-Results: esa4.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=andrew.cooper3@citrix.com;
 spf=Pass smtp.mailfrom=Andrew.Cooper3@citrix.com;
 spf=None smtp.helo=postmaster@MIAPEX02MSOL01.citrite.net
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 andrew.cooper3@citrix.com) identity=pra;
 client-ip=23.29.105.83; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="andrew.cooper3@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa4.hc3370-68.iphmx.com: domain of
 Andrew.Cooper3@citrix.com designates 23.29.105.83 as
 permitted sender) identity=mailfrom; client-ip=23.29.105.83;
 receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="Andrew.Cooper3@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:23.29.105.83 ip4:162.221.156.83 ~all"
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@MIAPEX02MSOL01.citrite.net) identity=helo;
 client-ip=23.29.105.83; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@MIAPEX02MSOL01.citrite.net";
 x-conformance=sidf_compatible
IronPort-SDR: vbUszbIeAiKU5EMkyPu+bE8wSCnCqlZ/EJh6WZCBDsa69+hd1CupNkI49fOJtfQ7nSaCyVshUD
 eixewz/26MHMVTQ9e60LMiMCJIbPngfcwQ10TKIlwukvdcxRmB1t0pVf1cdGlXKemKaZPg4GMn
 eKH4OmHbZFaNFZsWXjpvXT08+hoPI1xjSqn37TFjngjTfSA02S/W32i4aC2YI9gQtps80L5Os2
 1ASFyd4HVxdHFuy/R4GliWhzZ/8DdHn6KsA1+FjXQC0sY44nJX4ytOfF6qH7+mv5Et/yA/vFtJ
 FjE=
X-SBRS: 2.7
X-MesageID: 898716
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 23.29.105.83
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.60,508,1549947600"; 
   d="scan'208";a="898716"
To: Jan Beulich <JBeulich@suse.com>
References: <5B6BF83602000078001DC548@prv1-mh.provo.novell.com>
 <5C8B7EC0020000780021F10B@prv1-mh.provo.novell.com>
 <5C8B84A8020000780021F23F@prv1-mh.provo.novell.com>
 <bf91ae8b-33f8-ee85-ff39-44e8ccc29f60@citrix.com>
 <5CE792AA0200007800231E09@prv1-mh.provo.novell.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Openpgp: preference=signencrypt
Autocrypt: addr=andrew.cooper3@citrix.com; prefer-encrypt=mutual; keydata=
 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
 6+ahAA==
Message-ID: <7c71228d-4b60-73e8-e7a9-98f430c6d8a7@citrix.com>
Date: Fri, 24 May 2019 21:48:44 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <5CE792AA0200007800231E09@prv1-mh.provo.novell.com>
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
Subject: Re: [Xen-devel] [PATCH v8 27/50] x86emul: support AVX512{F,
 ER} reciprocal insns
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
Cc: George Dunlap <George.Dunlap@eu.citrix.com>,
 xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wei.liu2@citrix.com>,
 Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjQvMDUvMjAxOSAwNzo0MywgSmFuIEJldWxpY2ggd3JvdGU6Cj4+Pj4gT24gMjMuMDUuMTkg
YXQgMTg6MTUsIDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tPiB3cm90ZToKPj4gT24gMTUvMDMv
MjAxOSAxMDo1NSwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+PiBBbHNvIGluY2x1ZGUgdGhlIG9ubHkg
b3RoZXIgQVZYNTEyRVIgaW5zbiBwYWlyLCBWRVhQMlB7RCxTfS4KPj4+Cj4+PiBOb3RlIHRoYXQg
ZGVzcGl0ZSB0aGUgcmVwbGFjZW1lbnQgb2YgdGhlIFNIQSBpbnNucycgdGFibGUgc2xvdHMgdGhl
cmUncwo+Pj4gbm8gbmVlZCB0byBzcGVjaWFsIGNhc2UgdGhlaXIgZGVjb2Rpbmc6IFRoZWlyIGlu
c24tc3BlY2lmaWMgY29kZSBhbHJlYWR5Cj4+PiBzZXRzIG9wX2J5dGVzIChhcyB3YXMgcmVxdWly
ZWQgZHVlIHRvIHNpbWRfb3RoZXIpLCBhbmQgVHdvT3AgaXMgb2Ygbm8KPj4+IHJlbGV2YW5jZSBm
b3IgbGVnYWN5IGVuY29kZWQgU0lNRCBpbnNucy4KPj4+Cj4+PiBUaGUgcmFpc2luZyBvZiAjVUQg
d2hlbiBFVkVYLkwnTCBpcyAzIGZvciBBVlg1MTJFUiBzY2FsYXIgaW5zbnMgaXMgZG9uZQo+Pj4g
dG8gYmUgb24gdGhlIHNhZmUgc2lkZS4gVGhlIFNETSBkb2VzIG5vdCBjbGFyaWZ5IGJlaGF2aW9y
IHRoZXJlLCBhbmQKPj4+IGl0J3MgZXZlbiBtb3JlIGFtYmlndW91cyBoZXJlICh3aXRob3V0IEFW
WDUxMlZMIGluIHRoZSBwaWN0dXJlKS4KPj4+Cj4+PiBTaWduZWQtb2ZmLWJ5OiBKYW4gQmV1bGlj
aCA8amJldWxpY2hAc3VzZS5jb20+Cj4+IEFja2VkLWJ5OiBBbmRyZXcgQ29vcGVyIDxhbmRyZXcu
Y29vcGVyM0BjaXRyaXguY29tPgo+IFRoYW5rcywgYWxzbyBmb3IgdGhlIG90aGVycy4KPgo+PiBT
ZWVpbmcgYXMgSSBoYXZlIHNvbWUgRVIgaGFyZHdhcmUsIGlzIHRoZXJlIGFuIGVhc3kgd2F5IHRv
IGdldAo+PiBHQ0MvYmludXRpbHMgdG8gZW1pdCBhIHdlaXJkIEwnTCBmaWVsZCwgb3Igd2lsbCB0
aGlzIGludm9sdmUgc29tZSBtYW51YWwKPj4gb3Bjb2RlIGdlbmVyYXRpb24gdG8gdGVzdD8KPiBn
Y2MgZG9lcyBub3QgcHJvdmlkZSBhbnkgY29udHJvbCBhdCBhbGwsIGFmYWljdC4gYmludXRpbHMg
YWxsb3dzICJ3ZWlyZCIKPiBWRVguTCBvciBFVkVYLkwnTCBvbmx5IGZvciBpbnNucyBpdCBiZWxp
ZXZlcyBpZ25vcmUgdGhhdCBmaWVsZC4gU28geWVzLAo+IEknbSBhZnJhaWQgdGhpcyB3aWxsIGlu
dm9sdmUgdXNpbmcgLmJ5dGUuCgpPay7CoCBHaXZlbiBhIHRlc3QgcHJvZ3JhbSBvZjoKCnsKcHJp
bnRmKCJSZWFsOlxuIik7CmFzbSB2b2xhdGlsZSAoInZyY3AxNHNkICV4bW0wLCV4bW0wLCV4bW0w
Iik7CgpwcmludGYoIkJ5dGVzOlxuIik7CmFzbSB2b2xhdGlsZSAoIi5ieXRlIDB4NjIsIDB4ZjIs
IDB4ZmQsIDB4MDgsIDB4NGQsIDB4YzAiKTsKCnByaW50ZigiQmFkIDB4Mjg6XG4iKTsKYXNtIHZv
bGF0aWxlICgiLmJ5dGUgMHg2MiwgMHhmMiwgMHhmZCwgMHgyOCwgMHg0ZCwgMHhjMCIpOwoKcHJp
bnRmKCJCYWQgMHg0ODpcbiIpOwphc20gdm9sYXRpbGUgKCIuYnl0ZSAweDYyLCAweGYyLCAweGZk
LCAweDQ4LCAweDRkLCAweGMwIik7CgpwcmludGYoIkJhZCAweDY4OlxuIik7CmFzbSB2b2xhdGls
ZSAoIi5ieXRlIDB4NjIsIDB4ZjIsIDB4ZmQsIDB4NjgsIDB4NGQsIDB4YzAiKTsKfQoKVGhlbiB0
aGUgTCdMID0gMyBjYXNlICgweDY4IGF0IHRoZSBlbmQpIGRvZXMgaW5kZWVkIHRha2UgI1VEIGZv
ciBib3RoCktOTCBhbmQgS05NLgoKfkFuZHJldwoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlz
dHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xp
c3RpbmZvL3hlbi1kZXZlbA==
