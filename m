Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D9283B826
	for <lists+xen-devel@lfdr.de>; Mon, 10 Jun 2019 17:19:51 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1haM2e-0002xS-L2; Mon, 10 Jun 2019 15:17:00 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=NKNi=UJ=gmail.com=andrii.anisov@srs-us1.protection.inumbo.net>)
 id 1haM2c-0002xN-Oz
 for xen-devel@lists.xenproject.org; Mon, 10 Jun 2019 15:16:58 +0000
X-Inumbo-ID: c90368a3-8b92-11e9-8980-bc764e045a96
Received: from mail-lf1-x143.google.com (unknown [2a00:1450:4864:20::143])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id c90368a3-8b92-11e9-8980-bc764e045a96;
 Mon, 10 Jun 2019 15:16:57 +0000 (UTC)
Received: by mail-lf1-x143.google.com with SMTP id y13so6891875lfh.9
 for <xen-devel@lists.xenproject.org>; Mon, 10 Jun 2019 08:16:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=2qmoydctmDdxJswKXZm+mVTlQ14BMmbL4W6dXhnRlqI=;
 b=FO/8jgDUPDaBAH0V592ed1iFw8w/09j8oBjS8huff244D3RN5kG8023+Jlzc0X3hko
 bvFAkv+7lWv283JY72zMmNhJcdEFX4lECNPmedN4QtID0CfafjaIw0u425rfUI/i2pN4
 Js+FcS4HfGUc3KgV+iGjpTESqZRE1DuNmmgYd5BapuJVz3p6XV9XAcA+E4KAy+sYj9UV
 WWG0CqlQnH1W/XA8IDfhYcLPEJeWZ/Gghj5shoHOkQ6GADMJkxAMgGkUVCf9y/1AOqDz
 a9gVOXkXzkLhnbxsvR4p50LLis744ywfwssWWRL/Iq/HOxJOTiq6ZPwPOqnlEh2Qk+wl
 UcRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=2qmoydctmDdxJswKXZm+mVTlQ14BMmbL4W6dXhnRlqI=;
 b=Xq4Az86Nix19Rryc3ZU8w6CZnVHVp/GvRA4NPEsEoqVmM1z4I/NXo2LQtdctRuD2B6
 U/Vfklzo61DmzstiBrnkHwn7h0TpQw20Y8wWQENmXw4/hGObJPvTC1wEnLl00QkTIFGm
 Si53Z4xVGM2AkJ/NFD/C04Un46OH4th82PDNxmNTeBR0RAK3ioRxa95hfloujJqB04TZ
 oy5Nm0WSZO6LQyLHtfiQEIU33LdL8AjSioxMvgFYgtGiko6KOVqTd4XboJ/dioTMuZ5r
 5FU4JZXea9CB8F3NeO/RtF1Q0pQ8e8v8gAw7Ss44tgk0xelfOPWXM6EjEyJuWfdSxBvx
 7rlA==
X-Gm-Message-State: APjAAAXZDxPfMoKSCwsIb9363cXY/AQkLRx49VKgKMH4RQgfZs/8L619
 UsDgdzonN8XUBd6r+RZiA+M=
X-Google-Smtp-Source: APXvYqwrdM8uaHNV067rz4vn5k+IYBNZDTAmZlBsn7tnwlaxAK80hevOYFkpK2/aEPN4WEzEIhEs2Q==
X-Received: by 2002:a19:ccc6:: with SMTP id c189mr3450907lfg.160.1560179815890; 
 Mon, 10 Jun 2019 08:16:55 -0700 (PDT)
Received: from [10.17.180.34] (ll-74.141.223.85.sovam.net.ua. [85.223.141.74])
 by smtp.gmail.com with ESMTPSA id
 m82sm2037120lje.97.2019.06.10.08.16.53
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 10 Jun 2019 08:16:54 -0700 (PDT)
To: Dario Faggioli <dfaggioli@suse.com>,
 George Dunlap <George.Dunlap@citrix.com>
References: <1559225751-30736-1-git-send-email-andrii.anisov@gmail.com>
 <16B40EA2-7781-48E7-94CA-52B328CE197B@citrix.com>
 <1dd86fe1814a52cb9b521a39511c2c5b70379b03.camel@suse.com>
From: Andrii Anisov <andrii.anisov@gmail.com>
Message-ID: <fef869c7-263f-6595-4f38-7a10f94bd18f@gmail.com>
Date: Mon, 10 Jun 2019 18:16:52 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <1dd86fe1814a52cb9b521a39511c2c5b70379b03.camel@suse.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v3] schedule: move last_run_time to the
 credit scheduler privates
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
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Andrii Anisov <andrii_anisov@epam.com>, Wei Liu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 Andrew Cooper <Andrew.Cooper3@citrix.com>, "Tim \(Xen.org\)" <tim@xen.org>,
 Julien Grall <julien.grall@arm.com>, Jan Beulich <jbeulich@suse.com>,
 Ian Jackson <Ian.Jackson@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

CgpPbiAzMS4wNS4xOSAxNjoyNCwgRGFyaW8gRmFnZ2lvbGkgd3JvdGU6Cj4gV2VhdGhlciBvciBu
b3QgdGhlIG1haW4gcmVhc29uIGlzIHRoYXQgb25lLCBpdCBmaXhlcyBhbiAoYWxiZWl0IG5vdCB0
b28KPiB0ZXJyaWJsZSkgbGF5ZXJpbmcvZW5jYXBzdWxhdGlvbiB2aW9sYXRpb24sIGFzIHRoaW5n
cyB1c2VkIG9ubHkgYnkKPiBDcmVkaXQsIHNob3VsZCBsaXZlIGluIENyZWRpdCBjb2RlLgoKRW5j
YXBzdWxhdGlvbiB2aW9sYXRpb24gd2FzIHRoZSBtYWluIHJlYXNvbiB0byBoYXZlIHRoaXMgcGF0
Y2ggdGhvdWdoIDspCgo+IEl0IGFsc28gbWFrZXMgKGFsdGhvdWdoIG9ubHkgc2xpZ2h0bHkpIGBz
dHJ1Y3QgdmNwdWAgc21hbGxlciwgaWYgb25lCj4gZG9lc24ndCB1c2UgQ3JlZGl0IGF0IGFsbC4K
PiAKPiBCdXQgc3VyZSwgbGV0J3MgaGF2ZSBqdXN0IGEgZmV3IG1vcmUgd29yZHMgYWJvdXQgdGhl
IG1vdGl2YXRpb24gZm9yIHRoZQo+IGNoYW5nZSBpbiB0aGUgY29tbWl0IG1lc3NhZ2UsIGFzIEdl
b3JnZSBpcyBhc2tpbmcuCj4gCj4+IElmIGl04oCZcyB0aGUgZmlyc3QsIGEgcXVpY2sgbm90ZSB0
byB0aGF0IGVmZmVjdCB3aWxsIGhlbHAgcHV0Cj4+IGFyY2hhZW9sb2dpc3TigJlzIG1pbmRzIGF0
IGVhc2UuIDotKSAgVGhpcyBjb3VsZCBwcm9iYWJseSBiZSBhZGRlZCBvbgo+PiBjb21taXQuICAo
SeKAmWxsIGRvIGEgZnVsbCByZXZpZXcgaXQgaW4gYSBkYXkgb3IgdHdvIGlmIERhcmlvIGRvZXNu
4oCZdAo+PiBiZWF0IG1lIHRvIGl0LikKPj4KPiBJJ3ZlIGxvb2tlZCBhdCBpdCwgYW5kIHRoZXJl
J3Mgb25seSBvbmUgdGhpbmcgdGhhdCBib3RoZXJzIG1lIGEgbGl0dGxlCj4gYml0LiBJbiBmYWN0
LCBoZXJlOgo+IAo+IC0tLSBhL3hlbi9jb21tb24vc2NoZWRfY3JlZGl0LmMKPiArKysgYi94ZW4v
Y29tbW9uL3NjaGVkX2NyZWRpdC5jCj4gQEAgLTE3NSw2ICsxNzUsOSBAQCBzdHJ1Y3QgY3NjaGVk
X3ZjcHUgewo+ICAgICAgIGF0b21pY190IGNyZWRpdDsKPiAgICAgICB1bnNpZ25lZCBpbnQgcmVz
aWR1YWw7Cj4gICAKPiArICAgIC8qIGxhc3QgdGltZSB3aGVuIHZDUFUgaXMgc2NoZWR1bGVkIG91
dCAqLwo+ICsgICAgc190aW1lX3QgbGFzdF9ydW5fdGltZTsKPiArCj4gICAjaWZkZWYgQ1NDSEVE
X1NUQVRTCj4gICAgICAgc3RydWN0IHsKPiAgICAgICAgICAgaW50IGNyZWRpdF9sYXN0Owo+IAo+
IFRoZSBjb21tZW50IGlzIG5vdCBhY2N1cmF0ZS4gQW5kIEknbSBhZnJhaWQgdGhhdCBpdCBjb3Vs
ZCBiZSBtaXNsZWFkaW5nCj4gZm9yIHNvbWVvbmUgcmVhZGluZyBpdCwgYnV0IHRoZW4gcmVhbGl6
aW5nIHRoYXQgdGhlIGNvZGUgZG9lcyBzb21ldGhpbmcKPiBzbGlnaHRseSBkaWZmZXJlbnQsIGFu
ZCBoZW5jZSBub3QgYmVpbmcgYWJsZSB0byB0ZWxsIHdoaWNoIG9uZSBvZiB0aGUKPiB0d28gdGhp
bmdzIGlzIGNvcnJlY3QuCgpXZWxsLCBJIGNvcHktcGFzdGVkIHRoYXQuIEFuZCB3YXMgd3Jvbmcg
aGVyZS4gTWUgYWN0dWFsbHkgYWdhaW5zdCB0aGUgdGV4dCBjb21tZW50cyBpbmxpbmVkIGludG8g
dGhlIGNvZGUuIEl0IGhhcHBlbnMgdGhhdCBjb2RlIGNoYW5nZXMgZmFzdGVyIHRoYW4gY29tbWVu
dHMgYW5kIGluIHJlc3VsdCBjb21tZW50cyBiZWNvbWUgbWlzbGVhZGluZyB2ZXJ5IG9mdGVuLgpJ
J2QgcmF0aGVyIGRyb3AgdGhlIGNvbW1lbnQgYXQgYWxsLgoKPiBTbywgZWl0aGVyIHdlIGNoYW5n
ZSB0aGUgY29tbWVudCAoYnV0IEknbSBub3QgY2FwYWJsZSwgcmlnaHQgbm93LCBvZgo+IGZpbmRp
bmcgc29tZXRoaW5nIHRoYXQgaXMgc2hvcnQgYW5kLCBhdCB0aGUgc2FtZSB0aW1lLCBjbGVhciBl
bm91Z2gpLAo+IG9yIHdlIGNoYW5nZSBob3cgdGhlIHZhcmlhYmxlIGlzIHVzaW5nLgoKQXMgcGVy
IHRoZSBjdXJyZW50IGNvZGUgSSdkIHJlbmFtZSB0aGUgbWVtYmVyIHRvIGBsYXN0X3NjaGVkX3Rp
bWVgLiBUbyByZWZsZWN0IHRoYXQgaXQgaXMgdGhlIHRpbWUgd2hlbiB0aGUgdmNwdSB3ZW50IHRo
cm91Z2ggc2NoZWR1bGluZyBwYXRoLgoKCi0tIApTaW5jZXJlbHksCkFuZHJpaSBBbmlzb3YuCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwg
bWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3Rz
LnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
