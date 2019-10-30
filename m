Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C6004E9A31
	for <lists+xen-devel@lfdr.de>; Wed, 30 Oct 2019 11:40:43 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iPlMM-0006fF-0q; Wed, 30 Oct 2019 10:37:50 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=vxQH=YX=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1iPlMK-0006f6-Qg
 for xen-devel@lists.xenproject.org; Wed, 30 Oct 2019 10:37:48 +0000
X-Inumbo-ID: 4fb86701-fb01-11e9-9520-12813bfff9fa
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 4fb86701-fb01-11e9-9520-12813bfff9fa;
 Wed, 30 Oct 2019 10:37:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1572431867;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=ZPEnIfDkCBypuF0/b+mgNeiLhS4YqSUEt5L1RWws7MU=;
 b=OGoQ+K9MAHKGaEQVffdwmShSfpHVbvt7OmME83Zq8bDQcs1vddp3k/Ez
 qlrxQmSQMMbaXIs3DpjJe2a2JFMRbnH2MQn6YBAwoFiLcEGX+By+Ya9xB
 S0jLHdyySOAWBf1uK5SVO31NW7bnifC3RbfsdLRkViwag2/aqLEBaoVB6 M=;
Authentication-Results: esa4.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=andrew.cooper3@citrix.com;
 spf=Pass smtp.mailfrom=Andrew.Cooper3@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 andrew.cooper3@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="andrew.cooper3@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa4.hc3370-68.iphmx.com: domain of
 Andrew.Cooper3@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="Andrew.Cooper3@citrix.com";
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
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: HLkCslexq/dkdCTojcMSD+I7jY6ldemwjvBlq426vGGczgSuN9QY7hHt6nz2vPQcfvIshwSDRm
 jZYFGqOkzPLrxWdvdmtYSpoJ8zm1Xv/fsXqZipAls4x7G8abYV4jbLmpPjZUpFxeUA/9KvL1in
 LC79HHV3Di0fYjCLA2P1Kh4BvSkfvAc067k9qZIMy8GuDhygsk7k888pPwLIZelXeJiiFoRUKk
 4QG0G/UHPsoBdtVCX6sPJgm+HQmYspiaJ0qcREq+XyOdG2oSZxyRv8x2axxxA+zpykMIAqMUVW
 zog=
X-SBRS: 2.7
X-MesageID: 8079690
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.68,247,1569297600"; 
   d="scan'208";a="8079690"
To: Jan Beulich <jbeulich@suse.com>
References: <20191023135812.21348-1-andrew.cooper3@citrix.com>
 <20191023135812.21348-6-andrew.cooper3@citrix.com>
 <36bbdcf7-28c3-b924-3d3a-145b6282bd0f@suse.com>
 <1f0bd38c-d1c4-fa45-d13e-55615be4188e@citrix.com>
 <ffa68df2-0f4c-da6c-cd57-29746ae5f889@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Openpgp: preference=signencrypt
Autocrypt: addr=andrew.cooper3@citrix.com; prefer-encrypt=mutual; keydata=
 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
 6+ahAA==
Message-ID: <fa559690-4a22-59ac-c81c-3ee6183ef212@citrix.com>
Date: Wed, 30 Oct 2019 10:37:43 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <ffa68df2-0f4c-da6c-cd57-29746ae5f889@suse.com>
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
Subject: Re: [Xen-devel] [PATCH v3 5/7] x86/livepatch: Fail the build if
 duplicate symbols exist
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
Cc: Juergen Gross <jgross@suse.com>, Wei Liu <wl@xen.org>, Konrad Rzeszutek
 Wilk <konrad.wilk@oracle.com>, Ross Lagerwall <ross.lagerwall@citrix.com>,
 Norbert Manthey <nmanthey@amazon.de>,
 Xen-devel <xen-devel@lists.xenproject.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMzAvMTAvMjAxOSAwODo0MSwgSmFuIEJldWxpY2ggd3JvdGU6Cj4gT24gMjkuMTAuMjAxOSAx
ODowNiwgQW5kcmV3IENvb3BlciB3cm90ZToKPj4gT24gMjQvMTAvMjAxOSAxMzowMywgSmFuIEJl
dWxpY2ggd3JvdGU6Cj4+PiBPbiAyMy4xMC4yMDE5IDE1OjU4LCBBbmRyZXcgQ29vcGVyIHdyb3Rl
Ogo+Pj4+IC0tLSBhL3hlbi9jb21tb24vS2NvbmZpZwo+Pj4+ICsrKyBiL3hlbi9jb21tb24vS2Nv
bmZpZwo+Pj4+IEBAIC0zNjEsOSArMzYxLDIzIEBAIGNvbmZpZyBGQVNUX1NZTUJPTF9MT09LVVAK
Pj4+PiAgCj4+Pj4gIAkgIElmIHVuc3VyZSwgc2F5IFkuCj4+Pj4gIAo+Pj4+ICtjb25maWcgRU5G
T1JDRV9VTklRVUVfU1lNQk9MUwo+Pj4+ICsJYm9vbCAiRW5mb3JjZSB1bmlxdWUgc3ltYm9scyIg
aWYgTElWRVBBVENICj4+Pj4gKwlkZWZhdWx0IHkgaWYgTElWRVBBVENICj4+PiBJbnN0ZWFkIG9m
IHR3byBpZGVudGljYWwgImlmIiwgd2h5IG5vdCAiZGVwZW5kcyBvbiBMSVZFUEFUQ0giPwo+Pj4K
Pj4+PiArCS0tLWhlbHAtLS0KPj4+PiArCSAgTXVsdGlwbGUgc3ltYm9scyB3aXRoIHRoZSBzYW1l
IG5hbWUgYXJlbid0IGdlbmVyYWxseSBhIHByb2JsZW0KPj4+PiArCSAgdW5sZXNzIExpdmUgcGF0
Y2hpbmcgaXMgdG8gYmUgdXNlZC4KPj4+PiArCj4+Pj4gKwkgIExpdmVwYXRjaCBsb2FkaW5nIGlu
dm9sdmVzIHJlc29sdmluZyByZWxvY2F0aW9ucyBhZ2FpbnN0IHN5bWJvbAo+Pj4+ICsJICBuYW1l
cywgYW5kIGF0dGVtcHRpbmcgdG8gYSBkdXBsaWNhdGUgc3ltYm9sIGluIGEgbGl2ZXBhdGNoIHdp
bGwKPj4+PiArCSAgcmVzdWx0IGluIGluY29ycmVjdCBsaXZlcGF0Y2ggYXBwbGljYXRpb24uCj4+
Pj4gKwo+Pj4+ICsJICBUaGlzIG9wdGlvbiBzaG91bGQgYmUgdXNlZCB0byBlbnN1cmUgdGhhdCBh
IGJ1aWxkIG9mIFhlbiBjYW4gaGF2ZSBhCj4+Pj4gKwkgIGxpdmVwYXRjaCBidWlsZCBhbmQgYXBw
bHkgY29ycmVjdGx5Lgo+Pj4+ICsKPj4+PiAgY29uZmlnIFNVUFBSRVNTX0RVUExJQ0FURV9TWU1C
T0xfV0FSTklOR1MKPj4+PiAtCWJvb2wgIlN1cHByZXNzIGR1cGxpY2F0ZSBzeW1ib2wgd2Fybmlu
Z3MiIGlmICFMSVZFUEFUQ0gKPj4+PiAtCWRlZmF1bHQgeSBpZiAhTElWRVBBVENICj4+Pj4gKwli
b29sICJTdXBwcmVzcyBkdXBsaWNhdGUgc3ltYm9sIHdhcm5pbmdzIiBpZiAhRU5GT1JDRV9VTklR
VUVfU1lNQk9MUwo+Pj4+ICsJZGVmYXVsdCB5IGlmICFFTkZPUkNFX1VOSVFVRV9TWU1CT0xTCj4+
PiBTaW1pbGFybHkgaGVyZSB0aGVuLiBXaXRoIHRoaXMgY2hhbmdlZCwgb3Igd2l0aCBhIHByb3Bl
ciByZWFzb24KPj4+IHN1cHBsaWVkCj4+PiBSZXZpZXdlZC1ieTogSmFuIEJldWxpY2ggPGpiZXVs
aWNoQHN1c2UuY29tPgo+PiBUaGF0J3MgYSBxdWVzdGlvbiBmb3IgdGhlIGF1dGhvciBvZiBjL3Mg
MDY0YTI2NTIyMzMgdG8gYW5zd2VyLi4uwqAgSSdtCj4+IG1lcmVseSBmb2xsb3dpbmcgdGhlIHBy
ZXZhaWxpbmcgc3R5bGUuCj4gIlByZXZhaWxpbmcgc3R5bGUiIHNlZW1zIGEgbGl0dGxlIGJvbGQg
Y29uc2lkZXJpbmcgdGhhdCBhY2NvcmRpbmcgdG8KPiBteSBncmVwLWluZyB0aGVyZSdzIGV4YWN0
bHkgb24gb3RoZXIgc3VjaCBpbnN0YW5jZSAoVkdBKS4gSS5lLiB5b3UnZAo+IGdyb3cgdGhlICJi
YWRuZXNzIiBieSA1MCUgd2hlbiB5b3UgY291bGQgZXF1YWxseSB3ZWxsIHNocmluayBpdCBieQo+
IHRoaXMgc2FtZSBwZXJjZW50YWdlLgoKQWxsb3cgbWUgdG8gYmUgbGVzcyBzdWJ0bGUuCgoqWW91
KiBhcmUgdGhlIGF1dGhvciBvZiB0aGUgY29kZSwgaW4gdGhpcyBmb3JtLgoKQXMgYSBjb25zZXF1
ZW5jZSwgSSBleHBlY3QgdGhlcmUgaXMgYSBkZWxpYmVyYXRlIHJlYXNvbi4KCkFuZCBzZWVpbmcg
YXMgSSd2ZSBoYWQgdG8gcmV2ZXJzZSBlbmdpbmVlciB0aGUgcmVhc29uIG15c2VsZiwgaXQgbG9v
a3MKdG8gYmUgcmVsYXRlZCB0byB0aGUgZmFjdCB0aGF0IG90aGVyIG9wdGlvbnMgaW4gdGhlIGJ1
aWxkIHNlbGVjdCB0aGVzZSwKc28gdGhleSBuZWVkIG5vdCB0byBiZSBkZXBlbmRlbnQgb24gbGl2
ZXBhdGNoaW5nIGluIHRoZSBmaXJzdCBwbGFjZS4KCn5BbmRyZXcKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVu
LWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcv
bWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
