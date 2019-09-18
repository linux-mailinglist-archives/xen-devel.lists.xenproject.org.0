Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AC4FB6294
	for <lists+xen-devel@lfdr.de>; Wed, 18 Sep 2019 13:58:56 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iAYYq-0008UI-15; Wed, 18 Sep 2019 11:55:52 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=suks=XN=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1iAYYo-0008UB-CG
 for xen-devel@lists.xenproject.org; Wed, 18 Sep 2019 11:55:50 +0000
X-Inumbo-ID: 41817f10-da0b-11e9-b299-bc764e2007e4
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 41817f10-da0b-11e9-b299-bc764e2007e4;
 Wed, 18 Sep 2019 11:55:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1568807749;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=qG92Pqf8EPQQIBVqZIjaYL1rePUsOqCE7YX3SSS4D9U=;
 b=YPMNXP6SdygseRZJ4zMt9mHVP8E37FJHyvK9rMBV+eVoiw3dTBJduzla
 7wu5KxBHCvWbIW7P0fhrbwNA6c63Sb8+R4PUgGSNtgLCrNCEj6UAZi+Gy
 ET3obU8DQFmwE+RUsUeix0s2sXuMlM6wvi6j4t0sYjpkfuk7X8sgvSUZ6 c=;
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
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: j+hgOfN1jO/6B1j9C6t4rInm4oUMQ8NzhnhXFjVvi44c+W41U1pVX8tb50IPz1Srl67mQWZD0i
 YFS4GnuO5D0xqbxC/p+VKPjuM3JiQ3YO+w8VqogNEzrPgQAY7y7xqPVXtzKRvCSZ1IILC85Tzx
 DSeK2z9a1Fs7xXVKihWZ31nW3zn7wxBW7e1Le8ZkP+ZJgdUUGcC8Dx/k4VMuDb/BIBDCo+fFZU
 m9YmIfy12e/MM+z/xBce+Jm7Ml3EuxnviHw9IMGQUMpz1hsxkHx0Xnyt5QT76/4kcgGJdYazT1
 Wh8=
X-SBRS: 2.7
X-MesageID: 6031147
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,520,1559534400"; 
   d="scan'208";a="6031147"
To: Jan Beulich <jbeulich@suse.com>
References: <625c29ba-cfb8-88ee-eb15-5f2019198865@suse.com>
 <17dad502-8e1f-83b9-7071-c8e342bc6104@suse.com>
 <8e10c3b4-775e-9c29-e9a5-64c7a8a99d5e@citrix.com>
 <5c5fcb8b-eba2-bd93-d2dc-f06eed7a64af@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Openpgp: preference=signencrypt
Autocrypt: addr=andrew.cooper3@citrix.com; prefer-encrypt=mutual; keydata=
 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
 6+ahAA==
Message-ID: <7ca42458-9f65-3593-a7ad-b24e44445d57@citrix.com>
Date: Wed, 18 Sep 2019 12:55:45 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <5c5fcb8b-eba2-bd93-d2dc-f06eed7a64af@suse.com>
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL01.citrite.net (10.69.22.125)
Subject: Re: [Xen-devel] [PATCH v2 3/9] x86/mm: honor opt_pcid also for
 32-bit PV domains
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
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTgvMDkvMjAxOSAxMDoyMiwgSmFuIEJldWxpY2ggd3JvdGU6Cj4gT24gMTcuMDkuMjAxOSAy
MTowMCwgQW5kcmV3IENvb3BlciB3cm90ZToKPj4gT24gMTcvMDkvMjAxOSAwNzoxNCwgSmFuIEJl
dWxpY2ggd3JvdGU6Cj4+PiBJIGNhbid0IHNlZSBhbnkgdGVjaG5pY2FsIG9yIHBlcmZvcm1hbmNl
IHJlYXNvbiB3aHkgd2Ugc2hvdWxkIHRyZWF0Cj4+PiAzMi1iaXQgUFYgZGlmZmVyZW50IGZyb20g
NjQtYml0IFBWIGluIHRoaXMgcmVnYXJkLgo+PiBXZWxsLCBvdGhlciB0aGFuIHRoZSBmYWN0IHRo
aXMgc2V0dGluZyBpcyBvbmx5IHJlYWQgZm9yIGEgNjRiaXQgZ3Vlc3QuLi4KPiBIb3cgY29tZT8g
bWFrZV9jcjMoKSB1c2VzIGl0IHVuaWZvcm1seSwgYXMgZG9lcyBwdl9tYWtlX2NyNCgpLgo+IHRv
Z2dsZV9ndWVzdF9tb2RlKCkgaXMgdGhlIG9uZSBjYXNlIHdoZXJlIGl0J3Mgc3RyaWN0bHkgNjQt
Yml0Cj4gZ3Vlc3Qgb25seS4KCk9oIC0geW91IGFyZSByaWdodC7CoCBJIGRvbid0IGtub3cgaG93
IEkgY2FtZSB0byB0aGUgYWJvdmUgY29uY2x1c2lvbiwKYnV0IC4uLgoKPj4gVGhlIHJlYXNvbiBp
dCBpc24ndCBzZXQgZm9yIDMyYml0IGd1ZXN0cyBpcyB0aGF0IHRoZXJlIGlzIG5vIHNjZW5hcmlv
Cj4+IHdoZXJlIHdlIHVzZSBpdC4KPiAicGNpZD0xIiBhbmQgInBjaWQ9bm94cHRpIiBib3RoIGFy
ZSBzY2VuYXJpb3Mgd2hlcmUsIHdpdGggdGhpcwo+IHBhdGNoIGluIHBsYWNlLCB3ZSB3b3VsZCB1
c2UgaXQuCgouLi4gSSBzdGlsbCBkb24ndCBzZWUgd2h5IHRoaXMgaXMgc2Vuc2libGUuCgpBcyBm
YXIgYXMgSSBjYW4gdGVsbCwgYWxsIGl0IHdpbGwgZG8gZm9yIGEgMzJiaXQgUFYgZ3Vlc3QgaXMg
c3RhcnQgdXNpbmcKMiBQQ0lEcyBmb3IgdGhlIHNhbWUgbG9naWNhbCBnQ1IzLCB3aGljaCB3aWxs
IGJlIGEgbmV0IHBlcmYgaXQgaGl0IGZvcgozMmJpdCBQViBndWVzdHMuCgpUaGlzIGlzIHVsdGlt
YXRlbHkgd3JhcHBlZCB1cCBpbiB0aGUgY29uZnVzaW9uIG92ZXIgVEZfa2VybmVsX21vZGUgYW5k
CnYtPmFyY2guZ3Vlc3RfdGFibGV7LF91c2VyfS4KCn5BbmRyZXcKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVu
LWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcv
bWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
