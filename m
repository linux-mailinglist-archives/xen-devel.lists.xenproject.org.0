Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A078D12A2A4
	for <lists+xen-devel@lfdr.de>; Tue, 24 Dec 2019 15:56:31 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ijlYd-0006ef-02; Tue, 24 Dec 2019 14:53:11 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=z3/8=2O=citrix.com=george.dunlap@srs-us1.protection.inumbo.net>)
 id 1ijlYb-0006ea-Ph
 for xen-devel@lists.xenproject.org; Tue, 24 Dec 2019 14:53:09 +0000
X-Inumbo-ID: 1910c6d2-265d-11ea-97de-12813bfff9fa
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 1910c6d2-265d-11ea-97de-12813bfff9fa;
 Tue, 24 Dec 2019 14:53:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1577199188;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=lqfW1x6jy9dTNAXNBpzK53nkCOWzDkxFUeztKFDqYpk=;
 b=EDZ/GmyhHH0sP5lz92nwU72zCXImTqq8N2qcfvbhoXLlMtDUBJ6+t72Q
 bXnAHU9aYNHGVlvJ6zCcM61lx9+bMDAzdWhZDFAKxFN2Q0XN+jmfEuBgl
 E0Ty1zqJ6gNS2EJu4cd4QFEk4/stfxcNd42rIwESmhtQW6jrL2dlL/Ynw M=;
Authentication-Results: esa6.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=george.dunlap@citrix.com;
 spf=Pass smtp.mailfrom=George.Dunlap@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 george.dunlap@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="George.Dunlap@citrix.com";
 x-sender="george.dunlap@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa6.hc3370-68.iphmx.com: domain of
 George.Dunlap@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="George.Dunlap@citrix.com";
 x-sender="George.Dunlap@citrix.com";
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
 envelope-from="George.Dunlap@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: G6IfOIH4FuFDX5d7V2cYkTJBSQL9jgK92mYTF+jME4SCBZo1qDrvee2tFIdd5ORUaqP043OZiE
 lDvGw5/kGu3s450YmshmX6Lhf2B0QJwZEMS2rEY9nh5Qj8lNwcqgSBeplhjdFpRrh7Zs8wTAHY
 EjcW/MtOro4DQDrzGp8GAIYM1KAInSb+4eUKDi4IaUyCdRwLHI0X4eWNyamZJEdZVs8WbmM/c7
 36tGmXW69haU4msJtMrFyT9hcJAPsUkN/KX0yJFzIjZ9Nag2J54WhdDOPBW0vFQwHcVU+pwuhb
 ZZg=
X-SBRS: 2.7
X-MesageID: 10539281
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.69,351,1571716800"; d="scan'208";a="10539281"
To: Nick Rosbrook <rosbrookn@gmail.com>, <xen-devel@lists.xenproject.org>
References: <cover.1577111872.git.rosbrookn@ainfosec.com>
 <8b574d23f6abfc5356b65c958f637f3c22be5d9d.1577111872.git.rosbrookn@ainfosec.com>
From: George Dunlap <george.dunlap@citrix.com>
Openpgp: preference=signencrypt
Autocrypt: addr=george.dunlap@citrix.com; prefer-encrypt=mutual; keydata=
 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
 rIFfe2Dk+lD9A9BVd2rfoHA=
Message-ID: <ebf56edf-314c-e929-21b2-680918406901@citrix.com>
Date: Tue, 24 Dec 2019 14:53:05 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <8b574d23f6abfc5356b65c958f637f3c22be5d9d.1577111872.git.rosbrookn@ainfosec.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v4 2/6] golang/xenlight: begin Go to C type
 marshaling
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
Cc: Nick Rosbrook <rosbrookn@ainfosec.com>, Ian
 Jackson <ian.jackson@eu.citrix.com>, kerriganb@ainfosec.com,
 Wei Liu <wl@xen.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTIvMjMvMTkgMzoxNyBQTSwgTmljayBSb3Nicm9vayB3cm90ZToKPiBAQCAtOTIsNiArMTMx
LDQzIEBAIGZ1bmMgKHggKlNwaWNlSW5mbykgZnJvbUMoeGMgKkMubGlieGxfc3BpY2VfaW5mbykg
ZXJyb3Igewo+ICAJcmV0dXJuIG5pbAo+ICB9Cj4gIAo+ICtmdW5jICh4ICpTcGljZUluZm8pIHRv
QygpICh4YyBDLmxpYnhsX3NwaWNlX2luZm8sIGVyciBlcnJvcikgewo+ICsJQy5saWJ4bF9zcGlj
ZV9pbmZvX2luaXQoJnhjKQo+ICsJeGMuZW5hYmxlLCBlcnIgPSB4LkVuYWJsZS50b0MoKQo+ICsJ
aWYgZXJyICE9IG5pbCB7Cj4gKwkJQy5saWJ4bF9zcGljZV9pbmZvX2Rpc3Bvc2UoJnhjKQo+ICsJ
CXJldHVybiB4YywgZXJyCj4gKwl9Cj4gKwl4Yy5wb3J0ID0gQy5pbnQoeC5Qb3J0KQo+ICsJeGMu
dGxzX3BvcnQgPSBDLmludCh4LlRsc1BvcnQpCj4gKwl4Yy5ob3N0ID0gQy5DU3RyaW5nKHguSG9z
dCkKPiArCXhjLmRpc2FibGVfdGlja2V0aW5nLCBlcnIgPSB4LkRpc2FibGVUaWNrZXRpbmcudG9D
KCkKPiArCWlmIGVyciAhPSBuaWwgewo+ICsJCUMubGlieGxfc3BpY2VfaW5mb19kaXNwb3NlKCZ4
YykKCkkgcmVhbGl6ZSB0aGlzIGlzIGFsbCBnZW5lcmF0ZWQgY29kZSwgYnV0IHRoZXJlJ3Mgc3Rp
bGwgYSBtYXNzaXZlIGFtb3VudApvZiBkdXBsaWNhdGlvbiBoZXJlLCB3aGljaCB3aWxsIGF0IHZl
cnkgbGVhc3QgY2F1c2UgY29kZSBibG9hdC4gIEkgdGhpbmsKaXQgc2hvdWxkIGJlIHBvc3NpYmxl
IHRvIGRvIHRoaXMgYWxsIGF0IG9uY2Ugd2l0aCBhIGRlZmVyLCBsaWtlIHRoaXM6CgpmdW5jICh4
ICpTcGljZUluZm8pIHRvQygpICh4YyBDLmxpYnhsX3NwaWNlX2luZm8sIGVyciBlcnJvcikgewog
ICAgQy5saWJ4bF9zcGljZV9pbmZvX2luaXQoJnhjKQogICAgZGVmZXIgZnVuYyAoKSB7CiAgICAg
ICAgaWYgZXJyICE9IG5pbCB7CiAgICAgICAgICAgIGxpYnhsX3NwaWNlX2luZm9fZGlzcG9zZSgm
eGMpOwogICAgICAgIH0KICAgIH0oKQoKV2hhdCBkbyB5b3UgdGhpbms/CgpUaGUgb3RoZXIgY29t
bWVudCBJIGhhdmUgcmlnaHQgbm93IGlzIGFib3V0IHRoZSByZXR1cm4tYnktdmFsdWUgcmF0aGVy
CnRoYW4gYnkgcmVmZXJlbmNlLiAgSXQgZG9lcyBtZWFuIHlvdSBjYW4gZG8gdGhpbmdzIGxpa2U6
CgogICAgY2ZvbywgZXJyIDo9IGdmb28udG9DKCkKCnJhdGhlciB0aGFuCgogICAgdmFyIGNmb28g
Qy5saWJ4bF9mb28KICAgIGVyciA6PSBnZm9vLnRvQygmY2ZvbykKCkJ1dCBpdCBtZWFucyB0aGVy
ZSdzIGFuIGlub3JkaW5hdGUgYW1vdW50IG9mIGNvcHlpbmcuICBFdmVyeSBzdHJ1Y3R1cmUKYXQg
ZGVwdGggTiB3aWxsIGJlIGNvcGllZCBOIHRpbWVzOyBhbmQgc29tZSBvZiB0aGVzZSBzdWJzdHJ1
Y3R1cmVzIGFyZQpxdWl0ZSBsYXJnZS4gIEJlY2F1c2Ugd2UncmUgcmV0dXJuaW5nIGVycm9ycyBm
cm9tIHRvQygpLCB3ZSdyZSBuZXZlcgpnb2luZyB0byBiZSBhYmxlIHRvIGRvIHNvbWV0aGluZyBs
aWtlCgogICAgQy5saWJ4bF9iYXIoQ3R4LmN0eCwgZ2Zvby50b0MoKSkKCmFueXdheS4gIElmIHdl
IHN3aXRjaGVkIHRvIHBhc3NpbmcgaW4gcG9pbnRlcnMgKGFuZCB1c2VkIHRoZSBkZWZlciB0cmlj
awphYm92ZSksIGEgbG90IG9mIHRoZXNlIGNvdWxkIGVuZCB1cCBsb29raW5nIGxpa2UgdGhpczoK
CiAgICBpZiBlcnIgPSB4LkRpc2FibGVUaWNrZXRpbmcudG9DKCZ4Yy5kaXNhYmxlX3RpY2tldGlu
Zyk7IGVyciAhPSBuaWwgewogICAgICAgIHJldHVybiBlcnIKICAgIH0KCkF2b2lkaW5nIHRoZSBj
b3B5LiAgV2hhdCBkbyB5b3UgdGhpbms/CgpUaGUgZmluYWwgdGhpbmcgaXMgYWN0dWFsbHkgd2hl
dGhlciB3ZSB3YW50IHRvIGRvIHRoZSAiX2luaXQiIGF0IHRoZQpiZWdpbm5pbmcgb2YgdGhlIGZ1
bmN0aW9uIGF0IGFsbC4gIFRoZSBfaW5pdCBmdW5jdGlvbnMgaGF2ZSB0d28gcHVycG9zZXM6Cgox
LiBUbyB6ZXJvIG91dCB0aGUgc3RydWN0dXJlcwoyLiBUbyBzZXQgdGhpbmdzIHRvIGRlZmF1bHQg
dmFsdWVzLgoKSW4gR28sICMxIGlzbid0IG5lY2Vzc2FyeTsgc3RydWN0dXJlcyBhcmUgZGVmaW5l
ZCBhcyB6ZXJvZWQuICBJbiAudG9DKCksCiMyIHdvbid0IGJlIGVmZmVjdGl2ZSBlaXRoZXIgaW4g
bW9zdCBjYXNlcywgc2luY2Ugd2UnbGwgYmUgd3JpdGluZyBvdmVyCnZhbHVlcyB3aXRoIHRoZSB2
YWx1ZXMgZm91bmQgaW4gdGhlIEdvIHN0cnVjdC4KClRvIGdldCB0aGUgZGVmYXVsdCB2YWx1ZXMs
IEkgdGhpbmsgd2UnbGwgcHJvYmFibHkgbmVlZCB0byB3cml0ZSBoZWxwZXJzCmxpa2UgdGhpczoK
CmZ1bmMgTmV3RG9tYWluQ29uZmlnKHQgRG9tYWluVHlwZSkgKCpEb21haW5Db25maWcsIGVycm9y
KSB7Cgl2YXIgY2NvbmZpZyBDLmxpYnhsX2RvbWFpbl9jb25maWcKCglDLmxpYnhsX2RvbWFpbl9j
b25maWdfaW5pdCgmY2NvbmZpZykKCUMubGlieGxfZG9tYWluX2J1aWxkX2luZm9faW5pdF90eXBl
KCZjY29uZmlnLmJfaW5mbywKQy5saWJ4bF9kb21haW5fdHlwZSh0KSkKCglnY29uZmlnIDo9ICZE
b21haW5Db25maWd7fQoJZXJyIDo9IGdjb25maWcuZnJvbUMoJmNjb25maWcpCglpZiBlcnIgIT0g
bmlsIHsKCQlyZXR1cm4gbmlsLCBlcnIKCX0KCglyZXR1cm4gZ2NvbmZpZywgbmlsCn0KClRoaXMg
bWFrZXMgc3VyZSB0aGF0IG5vdCBvbmx5IERvbWFpbkNvbmZpZyBoYXMgdGhlIHJpZ2h0IGRlZmF1
bHQgdmFsdWVzLApidXQgdGhhdCBEb21haW5Db25maWcuQnVpbGRJbmZvLlR5cGVVbmlvbiBoYXMg
dGhlIHJpZ2h0IGRlZmF1bHQgdmFsdWVzCmZvciBIVk0gZ3Vlc3RzLgoKU28gdGhlIG9ubHkgdGlt
ZSAjMiB3b3VsZCBoYXZlIGFueSBlZmZlY3QgaW4gLnRvQygpIHdvdWxkIGJlIGlmIHRoZXJlCndh
cyBhIGZpZWxkIGluIGEgc3RydWN0dXJlIHRoYXQgdGhlIEdvIGJpbmRpbmdzIGRpZG4ndCBrbm93
IGFib3V0LiAgSQpraW5kIG9mIGdvIGJhY2sgYW5kIGZvcnRoIGFzIHRvIGhvdyBuZWNlc3Nhcnkg
dGhhdCBpcy4KCkFueSB0aG91Z2h0cz8KCiAtR2VvcmdlCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZl
bEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxt
YW4vbGlzdGluZm8veGVuLWRldmVs
