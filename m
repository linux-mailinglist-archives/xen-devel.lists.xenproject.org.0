Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4683DA169E
	for <lists+xen-devel@lfdr.de>; Thu, 29 Aug 2019 12:50:08 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i3HxW-0007PM-VQ; Thu, 29 Aug 2019 10:47:18 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=C/xl=WZ=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1i3HxV-0007PB-0n
 for xen-devel@lists.xenproject.org; Thu, 29 Aug 2019 10:47:17 +0000
X-Inumbo-ID: 5d8aecf8-ca4a-11e9-8980-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 5d8aecf8-ca4a-11e9-8980-bc764e2007e4;
 Thu, 29 Aug 2019 10:47:16 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 40D61B64F;
 Thu, 29 Aug 2019 10:47:15 +0000 (UTC)
To: Chao Gao <chao.gao@intel.com>
References: <1566177928-19114-1-git-send-email-chao.gao@intel.com>
 <1566177928-19114-13-git-send-email-chao.gao@intel.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <a970ab03-c8a6-0a09-574d-1e46ecde996e@suse.com>
Date: Thu, 29 Aug 2019 12:47:15 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <1566177928-19114-13-git-send-email-chao.gao@intel.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v9 12/15] microcode: reduce memory
 allocation and copy when creating a patch
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
Cc: xen-devel@lists.xenproject.org,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Ashok Raj <ashok.raj@intel.com>, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTkuMDguMjAxOSAwMzoyNSwgQ2hhbyBHYW8gd3JvdGU6Cj4gQEAgLTU0MiwyOSArNTA1LDIx
IEBAIHN0YXRpYyBzdHJ1Y3QgbWljcm9jb2RlX3BhdGNoICpjcHVfcmVxdWVzdF9taWNyb2NvZGUo
Y29uc3Qgdm9pZCAqYnVmLAo+ICAgICAgd2hpbGUgKCAoZXJyb3IgPSBnZXRfdWNvZGVfZnJvbV9i
dWZmZXJfYW1kKG1jX2FtZCwgYnVmLCBidWZzaXplLAo+ICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICZvZmZzZXQpKSA9PSAwICkKPiAgICAgIHsKPiAtICAg
ICAgICBzdHJ1Y3QgbWljcm9jb2RlX3BhdGNoICpuZXdfcGF0Y2ggPSBhbGxvY19taWNyb2NvZGVf
cGF0Y2gobWNfYW1kKTsKPiAtCj4gLSAgICAgICAgaWYgKCBJU19FUlIobmV3X3BhdGNoKSApCj4g
LSAgICAgICAgewo+IC0gICAgICAgICAgICBlcnJvciA9IFBUUl9FUlIobmV3X3BhdGNoKTsKPiAt
ICAgICAgICAgICAgYnJlYWs7Cj4gLSAgICAgICAgfQo+IC0KPiAgICAgICAgICAvKgo+IC0gICAg
ICAgICAqIElmIHRoZSBuZXcgcGF0Y2ggY292ZXJzIGN1cnJlbnQgQ1BVLCBjb21wYXJlIHBhdGNo
ZXMgYW5kIHN0b3JlIHRoZQo+ICsgICAgICAgICAqIElmIHRoZSBuZXcgdWNvZGUgY292ZXJzIGN1
cnJlbnQgQ1BVLCBjb21wYXJlIHVjb2RlcyBhbmQgc3RvcmUgdGhlCj4gICAgICAgICAgICogb25l
IHdpdGggaGlnaGVyIHJldmlzaW9uLgo+ICAgICAgICAgICAqLwo+IC0gICAgICAgIGlmICggKG1p
Y3JvY29kZV9maXRzKG5ld19wYXRjaC0+bWNfYW1kKSAhPSBNSVNfVUNPREUpICYmCj4gLSAgICAg
ICAgICAgICAoIXBhdGNoIHx8IChjb21wYXJlX3BhdGNoKG5ld19wYXRjaCwgcGF0Y2gpID09IE5F
V19VQ09ERSkpICkKPiArI2RlZmluZSBSRVZfSUQobXBiKSAoKChzdHJ1Y3QgbWljcm9jb2RlX2hl
YWRlcl9hbWQgKikobXBiKSktPnByb2Nlc3Nvcl9yZXZfaWQpCj4gKyAgICAgICAgaWYgKCAobWlj
cm9jb2RlX2ZpdHMobWNfYW1kKSAhPSBNSVNfVUNPREUpICYmCj4gKyAgICAgICAgICAgICAoIXNh
dmVkIHx8IChSRVZfSUQobWNfYW1kLT5tcGIpID4gUkVWX0lEKHNhdmVkKSkpICkKPiArI3VuZGVm
IFJFVl9JRAoKSSdtIG5vdCBoYXBweSB3aXRoIHRoaXMgaGVscGVyICNkZWZpbmUsIHRoZSBtb3Jl
IHRoYXQgInNhdmVkIiBhbHJlYWR5IGlzCm9mIHRoZSBjb3JyZWN0IHR5cGUuIGNvbXBhcmVfcGF0
Y2goKSBpbiByZWFsaXR5IG9ubHkgYWN0cyBvbiB0aGUgaGVhZGVyLApzbyBJJ2Qgc3VnZ2VzdCBo
YXZpbmcgdGhhdCBmdW5jdGlvbiBmb3J3YXJkIHRvIGEgbmV3IGNvbXBhcmVfaGVhZGVyKCkKKG9y
IHNvbWUgb3RoZXIgc3VpdGFibGUgbmFtZSkgYW5kIHVzZSB0aGF0IG5ldyBmdW5jdGlvbiBoZXJl
IGFzIHdlbGwuCgo+IEBAIC0zNzksNDcgKzM2MCw0NyBAQCBzdGF0aWMgc3RydWN0IG1pY3JvY29k
ZV9wYXRjaCAqY3B1X3JlcXVlc3RfbWljcm9jb2RlKGNvbnN0IHZvaWQgKmJ1ZiwKPiAgewo+ICAg
ICAgbG9uZyBvZmZzZXQgPSAwOwo+ICAgICAgaW50IGVycm9yID0gMDsKPiAtICAgIHZvaWQgKm1j
Owo+ICsgICAgc3RydWN0IG1pY3JvY29kZV9pbnRlbCAqbWMsICpzYXZlZCA9IE5VTEw7Cj4gICAg
ICBzdHJ1Y3QgbWljcm9jb2RlX3BhdGNoICpwYXRjaCA9IE5VTEw7Cj4gIAo+IC0gICAgd2hpbGUg
KCAob2Zmc2V0ID0gZ2V0X25leHRfdWNvZGVfZnJvbV9idWZmZXIoJm1jLCBidWYsIHNpemUsIG9m
ZnNldCkpID4gMCApCj4gKyAgICB3aGlsZSAoIChvZmZzZXQgPSBnZXRfbmV4dF91Y29kZV9mcm9t
X2J1ZmZlcigodm9pZCAqKikmbWMsIGJ1ZiwKCkNhc3RzIGxpa2UgdGhpcyBtYWtlIG1lIHJhdGhl
ciBuZXJ2b3VzLiBQbGVhc2Ugc2VlIGFib3V0IGdldHRpbmcgcmlkIG9mCml0IChieSB1c2luZyBh
IHVuaW9uIG9yIGEgMm5kIGxvY2FsIHZhcmlhYmxlKS4KCkphbgoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4t
ZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9t
YWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
