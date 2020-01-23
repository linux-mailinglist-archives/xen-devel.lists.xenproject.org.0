Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A0071466C8
	for <lists+xen-devel@lfdr.de>; Thu, 23 Jan 2020 12:34:19 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iuaid-0001yF-6S; Thu, 23 Jan 2020 11:32:15 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=zktU=3M=citrix.com=sergey.dyasli@srs-us1.protection.inumbo.net>)
 id 1iuaib-0001yA-Q0
 for xen-devel@lists.xen.org; Thu, 23 Jan 2020 11:32:13 +0000
X-Inumbo-ID: faa310d6-3dd3-11ea-9fd7-bc764e2007e4
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id faa310d6-3dd3-11ea-9fd7-bc764e2007e4;
 Thu, 23 Jan 2020 11:32:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1579779125;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=OJz3alvVIo3T7qmMFEZaaqrj6lUYpNVM+OZ+7ClVyug=;
 b=XMlvhFQjxw+3I1FkdBYwFJlmx6J9zwAOKnltLmnMyrOrkPa3HJbvpPEu
 VnkzLxb8fLQ2UbugwT87ahmYKjbD/5a9jqt2de2N1ADwyekVzij/TlZf1
 XjqEasXAogN5mm3fqeglOrVo0kvkRe1y3Zt7rMHcaljfwojJo2AnNUmCF 8=;
Authentication-Results: esa2.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=sergey.dyasli@citrix.com;
 spf=Pass smtp.mailfrom=sergey.dyasli@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 sergey.dyasli@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="sergey.dyasli@citrix.com";
 x-sender="sergey.dyasli@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa2.hc3370-68.iphmx.com: domain of
 sergey.dyasli@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="sergey.dyasli@citrix.com";
 x-sender="sergey.dyasli@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="sergey.dyasli@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: +SOXvyTTLGq1Ti9cOd127OaepBLlgSotaqGMeOykKPG/TeMF2OKvDbFRuIjAiw38hDhmaH8ARd
 ejfiiXHMCkv6MqzDwe0zdCLiHF58L194AY6KsFPoWWqzcTPfr8/0Tqv4MGT2TZasfNsiL3JNSH
 iUnTthi4rAl+Ou0uwOqqi7FURd+DZjWV1jwNCGe6DVdoOxN3E1l5B2jWQ2AOs7VXA3hBa590CU
 HbEZS3LUacihXRjXwbNDR6ABz84elbCeDEiivBhCaUytlhjzXjBd6Pd2xm+a61mwXx81T2wYhg
 R6s=
X-SBRS: 2.7
X-MesageID: 11335925
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,353,1574139600"; d="scan'208";a="11335925"
To: Julien Grall <julien@xen.org>
References: <20200117164432.32245-1-sergey.dyasli@citrix.com>
 <20200117164432.32245-2-sergey.dyasli@citrix.com>
 <7049fbf6-9bac-d9bf-4505-a80a8171dd40@suse.com>
 <6223c8e8-ff2a-e4fe-fea4-8661c4c44524@citrix.com>
 <e1e6c1c9-0f11-4346-965c-f1336e0adb05@xen.org>
 <67b7b3ab-6714-4acc-ff2b-34c355c41488@citrix.com>
 <2fc63e2d-13da-d468-2c97-a0ee9029d09c@xen.org>
From: Sergey Dyasli <sergey.dyasli@citrix.com>
Autocrypt: addr=sergey.dyasli@citrix.com; keydata=
 xsFNBFtMVHEBEADc/hZcLexrB6vGTdGqEUsYZkFGQh6Z1OO7bCtM1go1RugSMeq9tkFHQSOc
 9c7W9NVQqLgn8eefikIHxgic6tGgKoIQKcPuSsnqGao2YabsTSSoeatvmO5HkR0xGaUd+M6j
 iqv3cD7/WL602NhphT4ucKXCz93w0TeoJ3gleLuILxmzg1gDhKtMdkZv6TngWpKgIMRfoyHQ
 jsVzPbTTjJl/a9Cw99vuhFuEJfzbLA80hCwhoPM+ZQGFDcG4c25GQGQFFatpbQUhNirWW5b1
 r2yVOziSJsvfTLnyzEizCvU+r/Ek2Kh0eAsRFr35m2X+X3CfxKrZcePxzAf273p4nc3YIK9h
 cwa4ZpDksun0E2l0pIxg/pPBXTNbH+OX1I+BfWDZWlPiPxgkiKdgYPS2qv53dJ+k9x6HkuCy
 i61IcjXRtVgL5nPGakyOFQ+07S4HIJlw98a6NrptWOFkxDt38x87mSM7aSWp1kjyGqQTGoKB
 VEx5BdRS5gFdYGCQFc8KVGEWPPGdeYx9Pj2wTaweKV0qZT69lmf/P5149Pc81SRhuc0hUX9K
 DnYBa1iSHaDjifMsNXKzj8Y8zVm+J6DZo/D10IUxMuExvbPa/8nsertWxoDSbWcF1cyvZp9X
 tUEukuPoTKO4Vzg7xVNj9pbK9GPxSYcafJUgDeKEIlkn3iVIPwARAQABzShTZXJnZXkgRHlh
 c2xpIDxzZXJnZXkuZHlhc2xpQGNpdHJpeC5jb20+wsGlBBMBCgA4FiEEkI7HMI5EbM2FLA1L
 Aa+w5JvbyusFAltMVHECGwMFCwkIBwIGFQoJCAsCBBYCAwECHgECF4AAIQkQAa+w5JvbyusW
 IQSQjscwjkRszYUsDUsBr7Dkm9vK65AkEACvL+hErqbQj5yTVNqvP1rVGsXvevViglSTkHD4
 9LGwEk4+ne8N4DPcqrDnyqYFd42UxTjVyoDEXEIIoy0RHWCmaspYEDX8fVmgFG3OFoeA9NAv
 JHssHU6B2mDAQ6M3VDmAwTw+TbXL/c1wblgGAP9kdurydZL8bevTTUh7edfnm5pwaT9HLXvl
 xLjz5qyt6tKEowM0xPVzCKaj3Mf/cuZFOlaWiHZ0biOPC0JeoHuz4UQTnBBUKk+n2nnn72k9
 37cNeaxARwn/bxcej9QlbrrdaNGVFzjCA/CIL0KjUepowpLN0+lmYjkPgeLNYfyMXumlSNag
 9qnCTh0QDsCXS/HUHPeBskAvwNpGBCkfiP/XqJ+V618ZQ1sclHa9aWNnlIR/a8xVx25t/14V
 R8EX/045HUpyPU8hI/yw+Fw/ugJ8W0dFzFeHU5K2tEW2W0m3ZWWWgpcBSCB17DDLIPjGX1Qc
 J8jiVJ7E4rfvA1JBg9BxVw5LVuXg2FB6bqnDYALfY2ydATk+ZzMUAMMilaE7/5a2RMV4TYcd
 8Cf77LdgO0pB3vF6z1QmNA2IbOICtJOXpmvHj+dKFUt5hFVbvqXbuAjlrwFktbAFVGxaeIYz
 nQ44lQu9JqDuSH5yOytdek24Dit8SgEHGvumyj17liCG6kNzxd+2xh3uaUCA5MIALy5mZ87B
 TQRbTFRxARAAwqL3u/cPDA+BhU9ghtAkC+gyC5smWUL1FwTQ9CwTqcQpKt85PoaHn8sc5ctt
 Aj2fNT/F2vqQx/BthVOdkhj9LCwuslqBIqbri3XUyMLVV/Tf+ydzHW2AjufCowwgBguxedD1
 f9Snkv+As7ZgMg/GtDqDiCWBFg9PneKvr+FPPd2WmrI8Kium4X5Zjs/a6OGUWVcIBoPpu088
 z/0tlKYjTFLhoIEsf6ll4KvRQZIyGxclg3RBEuN+wgMbKppdUf2DBXYeCyrrPx809CUFzcik
 O99drWti2CV1gF8bnbUvfCewxwqgVKtHl2kfsm2+/lgG4CTyvnvWqUyHICZUqISdz5GidaXn
 TcPlsAeo2YU2NXbjwnmxzJEP/4FxgsjYIUbbxdmsK+PGre7HmGmaDZ8K77L3yHr/K7AH8mFs
 WUM5KiW4SnKyIQvdHkZMpvE4XrrirlZ+JI5vE043GzzpS2CGo0NFQmDJLRbpN/KQY6dkNVgA
 L0aDxJtAO1rXKYDSrvpL80bYyskQ4ivUa06v9SM2/bHi9bnp3Nf/fK6ErWKWmDOHWrnTgRML
 oQpcxoVPxw2CwyWT1069Y/CWwgnbj34+LMwMUYhPEZMitABpQE74dEtIFh0c2scm3K2QGhOP
 KQK3szqmXuX6MViMZLDh/B7FXLQyqwMBnZygfzZFM9vpDskAEQEAAcLBjQQYAQoAIBYhBJCO
 xzCORGzNhSwNSwGvsOSb28rrBQJbTFRxAhsMACEJEAGvsOSb28rrFiEEkI7HMI5EbM2FLA1L
 Aa+w5Jvbyuvvbg//S3d1+XL568K5BTHXaYxSqCeMqYbV9rPhEHyk+rzKtwNXSbSO8x0xZutL
 gYV+nkW0KMPH5Bz3I1xiRKAkiX/JLcMfx2HAXJ1Cv2rpR6bxyCGBJmuwR68uMS/gKe6AWwTY
 q2kt1rtZPjGl9OwVoWGJKbu2pFBLWmLAnHlXOL6WDSE1Mz2Ah3jMHOaSyAgPu1XSNa600gMJ
 QrSxgbe7bW72gCjeHcrIjfv+uh5cZ5/J/edpWXRuE4Tz82nxudBIHE2vnQEoJrXOh2kAJiYs
 G+IllDqFKDPrnS0R3DenBNG0Ir8h9W6heETnhQUc9NDFCSr81Mp0fROdBfYZnQzgSZMjN2eY
 pkNEWshJER4ZYY+7hAmqI51HnsKuM46QINh00jJHRMykW3TBMlwnUFxZ0gplAecjCFC7g2zj
 g1qNxLnxMS4wCsyEVhCkPyYnS8zuoa4ZUH37CezD01Ph4O1saln5+M4blHCEAUpZIkTGpUoi
 SEwtoxu6EEUYfbcjWgzJCs023hbRykZlFALoRNCwVz/FnPuVu291jn9kjvCTEeE6g2dCtOrO
 ukuXzk1tIeeoggsU7AJ0bzP7QOEhEckaBbP4k6ic26LJGWNMinllePyEMXzsgmMHVN//8wDT
 NWaanhP/JZ1v5Mfn8s1chIqC0sJIw73RvvuBkOa+jx0OwW3RFoQ=
Message-ID: <afcaab48-0939-8cf7-6735-019bf2109b19@citrix.com>
Date: Thu, 23 Jan 2020 11:32:00 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <2fc63e2d-13da-d468-2c97-a0ee9029d09c@xen.org>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v3 2/2] xsm: hide detailed Xen version from
 unprivileged guests
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
Cc: "sergey.dyasli@citrix.com >> Sergey Dyasli" <sergey.dyasli@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Doug Goldstein <cardoe@cardoe.com>,
 xen-devel@lists.xen.org, Daniel De Graaf <dgdegra@tycho.nsa.gov>,
 Ian Jackson <ian.jackson@eu.citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjIvMDEvMjAyMCAxMToyNSwgSnVsaWVuIEdyYWxsIHdyb3RlOgo+Cj4KPiBPbiAyMi8wMS8y
MDIwIDExOjE5LCBTZXJnZXkgRHlhc2xpIHdyb3RlOgo+PiBPbiAyMi8wMS8yMDIwIDEwOjE0LCBK
dWxpZW4gR3JhbGwgd3JvdGU6Cj4+Pgo+Pj4KPj4+IE9uIDIyLzAxLzIwMjAgMTA6MDEsIFNlcmdl
eSBEeWFzbGkgd3JvdGU6Cj4+Pj4gT24gMjAvMDEvMjAyMCAxMDowMSwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4+Pj4+IE9uIDE3LjAxLjIwMjAgMTc6NDQsIFNlcmdleSBEeWFzbGkgd3JvdGU6Cj4+Pj4+
PiB2MiAtLT4gdjM6Cj4+Pj4+PiAtIFJlbW92ZSBodm1sb2FkZXIgZmlsdGVyaW5nCj4+Pj4+Cj4+
Pj4+IFdoeT8gU2VlaW5nIHRoZSBwcmlvciBkaXNjdXNzaW9uLCBob3cgYWJvdXQgYWRkaW5nIFhF
TlZFUl9kZW5pZWQgdG8KPj4+Pj4gcmV0dXJuIHRoZSAiZGVuaWVkIiBzdHJpbmcsIGFsbG93aW5n
IGNvbXBvbmVudHMgd2hpY2ggd2FudCB0byBmaWx0ZXIKPj4+Pj4gdG8ga25vdyBleGFjdGx5IHdo
YXQgdG8gbG9vayBmb3I/IEFuZCB0aGVuIHJlLWFkZCB0aGUgZmlsdGVyaW5nIHlvdQo+Pj4+PiBo
YWQ/IChUaGUgaGVscCB0ZXh0IG9mIHRoZSBjb25maWcgb3B0aW9uIHNob3VsZCB0aGVuIHBlcmhh
cHMgYmUKPj4+Pj4gZXh0ZW5kZWQgdG8gbWFrZSB2ZXJ5IGNsZWFyIHRoYXQgdGhlIGNob3NlbiBz
dHJpbmcgc2hvdWxkIG5vdCBtYXRjaAo+Pj4+PiBhbnl0aGluZyB0aGF0IGNvdWxkIHBvdGVudGlh
bGx5IGJlIHJldHVybmVkIGJ5IGFueSBvZiB0aGUgWEVOVkVSXwo+Pj4+PiBzdWItb3BzLikKPj4+
Pgo+Pj4+IEkgaGFkIHRoZSBmb2xsb3dpbmcgcmVhc29uaW5nOgo+Pj4+Cj4+Pj4gMS4gTW9zdCBy
ZWFsLXdvcmxkIHVzZXJzIHdvdWxkIHNldCBDT05GSUdfWFNNX0RFTklFRF9TVFJJTkc9IiIgYW55
d2F5Lgo+Pj4+Cj4+Pj4gMi4gRmlsdGVyaW5nIGluIERNSSB0YWJsZXMgaXMgbm90IGEgY29tcGxl
dGUgc29sdXRpb24sIHNpbmNlIGRlbmllZAo+Pj4+IHN0cmluZyBsZWFrcyBlbHNld2hlcmUgdGhy
b3VnaCB0aGUgaHlwZXJjYWxsIChQViBndWVzdHMsIHN5c2ZzLCBkcml2ZXIKPj4+PiBsb2dzKSBh
cyBBbmRyZXcgaGFzIHBvaW50ZWQgb3V0IGluIHRoZSBwcmV2aW91cyBkaXNjdXNzaW9uLgo+Pj4+
Cj4+Pj4gT24gdGhlIG90aGVyIGhhbmQsIFNNQmlvcyBmaWx0ZXJpbmcgc2xpZ2h0bHkgaW1wcm92
ZXMgdGhlIHNpdHVhdGlvbiBmb3IKPj4+PiBIVk0gZG9tYWlucywgc28gSSBjYW4gcmV0dXJuIGl0
IGlmIG1haW50YWluZXJzIGZpbmQgaXQgd29ydGh5Lgo+Pj4KPj4+IFdoaWxlIEkgYW0gbm90IGEg
bWFpbnRhaW5lciBvZiB0aGlzIGNvZGUsIG15IGNvbmNlcm4gaXMgeW91IGltcG9zZSB0aGUgY29u
dmVyc2lvbiBmcm9tICJkZW5pZWQiIHRvICIiIHRvIGFsbCB0aGUgdXNlcnMgKGluY2x1ZGUgdGhv
c2Ugd2hvIHdhbnRzIHRvIGtlZXAgImRlbmllZCIpLgo+Pgo+PiBUaGlzIGlzIG5vdCB3aGF0J3Mg
aGFwcGVuaW5nIGhlcmU6IHRoZSBkZWZhdWx0IGlzIHN0aWxsICI8ZGVuaWVkPiIgKGFzCj4+IHBl
ciBwYXRjaCAxKTsgYnV0IHBhdGNoIDIgbWFrZXMgWEVOVkVSX2V4dHJhdmVyc2lvbiwgWEVOVkVS
X2NvbXBpbGVfaW5mbwo+PiBhbmQgWEVOVkVSX2NoYW5nZXNldCB0byByZXR1cm4gIjxkZW5pZWQ+
IiBpbnN0ZWFkIG9mIHRoZSByZWFsIHZhbHVlcwo+PiB3aGljaCBjYXVzZXMgdGhlIFVJIC8gbG9n
cyBpc3N1ZXMuCj4KPiBJIHdhcyByZWZlcnJpbmcgdGhlIFNNQmlvcyBmaWx0ZXJpbmcuLi4gSSBk
b24ndCB0aGluayBkb2luZyBhIGJsYW5rIGZpbHRlcmluZyBpcyB0aGUgcmlnaHQgdGhpbmcgdG8g
ZG8gaW4gdGhlIGh2bWxvYWRlciBmb3IgdGhlIHJlYXNvbiBleHBsYWluZWQgYWJvdmUuCgpBcG9s
b2dpZXMgZm9yIG1pc3VuZGVyc3RhbmRpbmcgdGhlIGNvbnRleHQuIEJ1dCBJIGRpc2FncmVlIGFi
b3V0Cmh2bWxvYWRlci4gUmV0dXJuaW5nICJkZW5pZWQiIGZyb20geGVuX3ZlcnNpb24gaHlwZXJj
YWxsIHRvIGd1ZXN0cyBpcwpvbmUgdGhpbmcsIGJ1dCBodm1sb2FkZXIgYW5kIFNNQmlvcyB0YWJs
ZXMgYXJlIHBhcnRzIG9mIHRoZSBoeXBlcnZpc29yCmFuZCBwdXR0aW5nICJkZW5pZWQiIHRoZXJl
IGlzIHNpbXBseSBhIHRlcnJpYmxlIHVzZXIgZXhwZXJpZW5jZS4KCj4KPiBSZWdhcmRpbmcgQ09O
RklHX1hTTV9ERU5JRURfU1RSSU5HLCBJIHRoaW5rIHRoaXMgaXMgYSBnb29kIHN0ZXAgYXMgaXQg
YWxsb3dzIHRoZSB2ZW5kb3IgdG8gY29uZmlndXJlIGl0LgoKLS0KVGhhbmtzLApTZXJnZXkKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBt
YWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMu
eGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
