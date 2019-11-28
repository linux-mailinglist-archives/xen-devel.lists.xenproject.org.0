Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9962610C629
	for <lists+xen-devel@lfdr.de>; Thu, 28 Nov 2019 10:49:21 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iaGNg-00030l-Jg; Thu, 28 Nov 2019 09:46:36 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=yOAp=ZU=gmail.com=julien.grall.oss@srs-us1.protection.inumbo.net>)
 id 1iaGNf-00030E-Bq
 for xen-devel@lists.xen.org; Thu, 28 Nov 2019 09:46:35 +0000
X-Inumbo-ID: f6758890-11c3-11ea-83b8-bc764e2007e4
Received: from mail-wr1-f68.google.com (unknown [209.85.221.68])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id f6758890-11c3-11ea-83b8-bc764e2007e4;
 Thu, 28 Nov 2019 09:46:34 +0000 (UTC)
Received: by mail-wr1-f68.google.com with SMTP id s5so30239495wrw.2
 for <xen-devel@lists.xen.org>; Thu, 28 Nov 2019 01:46:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=5ictGHvqV1l9O8IVWICuj/VKMyPHP4ZogQpGXVCN5pY=;
 b=GpKD9uF9SQdsobqwsNyY0D90FZJ5EuPxXYppHB+Yi5DTxgLUUOjbHe/RFyZPG5H9E6
 pmV26K/+k+AFuu4spKXyjBtK4XvvlDe2dtyJ0asc075FVaffQH8J37kwpC2ZApY0nBl2
 27VGESP77NNiCtW3GHL0COoKzu8/4O9FUo6fqeP2360L+XDOzlGg5c3xWkitLdwMF4eH
 9DuHVaL4AovfOyJ24WbMlpPMfmXMj0iscYBXMYhGq6WlPrkh1YqoFZr/eXchdqcqhkaI
 kpJlqdeCz/QL45JGM6p9m5kbN2u9VE/Fp56wGemdOJR1wsFZkp703HPfjvRk9YSk9+B9
 Wp1w==
X-Gm-Message-State: APjAAAWIB5Scn7dyEQnLd8KuFPilXJ2koySdYsCd/MqBzMhS85G5wYWs
 TErhKzVANGnAMYHAIx6HDQA=
X-Google-Smtp-Source: APXvYqyPglk1hGOzFKZJMcoEGjVxQI7hbf0z5t4U2gUz/ATL0smgwf9O5rWFoZIgZI9oH+XSroWoJQ==
X-Received: by 2002:a5d:5307:: with SMTP id e7mr5294256wrv.146.1574934393540; 
 Thu, 28 Nov 2019 01:46:33 -0800 (PST)
Received: from a483e7b01a66.ant.amazon.com (54-240-197-239.amazon.com.
 [54.240.197.239])
 by smtp.gmail.com with ESMTPSA id a6sm24012881wrh.69.2019.11.28.01.46.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 28 Nov 2019 01:46:32 -0800 (PST)
To: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>
References: <20191122080226.6817-1-peng.fan@nxp.com>
 <alpine.DEB.2.21.1911221105360.11302@sstabellini-ThinkPad-T480s>
 <alpine.DEB.2.21.1911261241260.8205@sstabellini-ThinkPad-T480s>
 <942a60db-fd30-a63e-25b1-e6b739b17c4e@xen.org>
 <alpine.DEB.2.21.1911261306370.8205@sstabellini-ThinkPad-T480s>
 <e98515e2-8e2e-569a-557e-523e9f134bef@xen.org>
 <13d490f1-cd9e-e2aa-d118-2c96cf03eb9b@suse.com>
 <AM0PR04MB4481C1F43E0827D5652148F488440@AM0PR04MB4481.eurprd04.prod.outlook.com>
 <e846a55b-3379-a22d-93db-862bc5279b64@suse.com>
 <alpine.DEB.2.21.1911270753580.27669@sstabellini-ThinkPad-T480s>
 <c6c26fc6-d9ab-5222-3787-3d083b3b7a97@xen.org>
 <3d63788e-b28a-c8fd-dae3-99ad9f4b9a04@suse.com>
 <9d32e677-dc13-cb56-6684-01ceabf4ae47@xen.org>
 <4b5f402d-1c24-4a27-6f6c-1c134c15d83c@suse.com>
From: Julien Grall <julien@xen.org>
Message-ID: <b27d00bf-5bc4-e62b-3a09-7f5b4bded0a6@xen.org>
Date: Thu, 28 Nov 2019 09:46:31 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:68.0)
 Gecko/20100101 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <4b5f402d-1c24-4a27-6f6c-1c134c15d83c@suse.com>
Content-Language: en-GB
Subject: Re: [Xen-devel] [PATCH V2] arch: arm: vgic-v3: fix GICD_ISACTIVER
 range
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
Cc: Peng Fan <peng.fan@nxp.com>, Alice Guo <alice.guo@nxp.com>,
 "xen-devel@lists.xen.org" <xen-devel@lists.xen.org>,
 "julien.grall@arm.com" <julien.grall@arm.com>, committers@xenproject.org,
 "Volodymyr_Babchuk@epam.com" <Volodymyr_Babchuk@epam.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

CgpPbiAyOC8xMS8yMDE5IDA5OjAwLCBKw7xyZ2VuIEdyb8OfIHdyb3RlOgo+IE9uIDI4LjExLjE5
IDA5OjQ4LCBKdWxpZW4gR3JhbGwgd3JvdGU6Cj4+IEhpLAo+Pgo+PiBPbiAyOC8xMS8yMDE5IDA4
OjMyLCBKw7xyZ2VuIEdyb8OfIHdyb3RlOgo+Pj4gT24gMjguMTEuMTkgMDk6MTQsIEp1bGllbiBH
cmFsbCB3cm90ZToKPj4+Pj4gSW4gc2hvcnQsIEkgdGhpbmsgdGhlIHBhdGNoIHNob3VsZCBnbyBp
biBub3cgYW5kIHRoZXJlIGFyZSBubyAKPj4+Pj4gZG93bnNpZGVzCj4+Pj4+IHRvIGl0LiBUaGF0
J3MgaXQsIEkgcmVzdCBteSBjYXNlLiBKdWxpZW4sIEkgaG9wZSB5b3UnbGwgcmVjb25zaWRlci4K
Pj4+PiBJIGRvbid0IHJlYWxseSBzZWUgdGhlIHBvaW50IHRvIHRyeSB0byBhbGxvdyBMaW51eCA1
LjQgYm9vdGluZyBvbiAKPj4+PiBYZW4gNC4xMyB3aXRob3V0IGtub3dpbmcgd2hldGhlciB3ZSBh
cmUgbm90IGdvaW5nIHRvIHVuY292ZXJlZCBtb3JlIAo+Pj4+IEJVRyBhcm91bmQgSSpBQ1RJVkVS
Lgo+Pj4KPj4+IFNvcnJ5LCBidXQgdGhpcyBpcyBhIHJhdGhlciB3ZWlyZCBzdGF0ZW1lbnQuCj4+
Pgo+Pj4gSUlVQyB5b3UgYXJlIHNheWluZyB0aGF0IGEgdHlwbyBibG9ja2luZyBib290IG9mIExp
bnV4IDUuNCBzaG91bGQgbm90IGJlCj4+PiBmaXhlZCBhcyB5b3UgYXJlIG5vdCBzdXJlIHRoZXJl
IGFyZSBubyBvdGhlciBidWdzPwo+Pgo+PiBUaGUgaW1wbGVtZW50YXRpb24gb2YgSSpBQ1RJVkVS
IHdhcyBpbmNvcnJlY3QgYnV0IGdvbmUgdW5ub3RpY2VkIAo+PiBiZWNhdXNlIG5vLW9uZSB1c2Vk
IGl0IHVudGlsIDUuNC4gSXQgYWxzbyBoYXBwZW4gdGhhdCB3ZSBkaWRuJ3QgY292ZXIgCj4+IGFs
bCB0aGUgSSpBQ1RJVkVSIHJlZ2lzdGVycywgc28gNS40IGNyYXNoZXMgaW5zdGVhZCBvZiB1c2lu
ZyB0aGUgd3JvbmcgCj4+IGJlaGF2aW9yLgo+Pgo+PiBUaGlzIHBhdGNoIGlzIGJhc2ljYWxseSBy
ZXBsYWNpbmcgYSBndWVzdCBjcmFzaCBieSBhIGJlaGF2aW9yIHdlIGRvbid0IAo+PiBmdWxseSB1
bmRlcnN0YW5kLgo+Pgo+Pj4KPj4+PiBJZiB5b3UgcmVhbGx5IHdhbnQgdGhpcyBwYXRjaCBpbiBY
ZW4gNC4xMywgdGhlbiB5b3Ugc2hvdWxkIHJlYWQgbXkgCj4+Pj4gbWFpbCBvbiB0aGUgZmlyc3Qg
dmVyc2lvbiBhbmQgdHJ5aW5nIHRvIGFuc3dlciBtZSB3aHkgdGhpcyA1LjQgaXMgCj4+Pj4gZ29p
bmcgdG8gYmUgc2FmZSBydW5uaW5nIG9uIFhlbiA0LjEzLgo+Pj4KPj4+IE9yIGRvIHlvdSB0aGlu
ayB0aGF0IHdpdGggdGhlIHR5cG8gZml4ZWQgYW5kIHJ1bm5pbmcgTGludXggNS40IGd1ZXN0cwo+
Pj4gd2lsbCBkZXN0YWJpbGl6ZSB0aGUgaG9zdD8KPj4KPj4gSXQgaXMgbm90IGdvaW5nIHRvIGRl
c3RhYmlsaXplIHRoZSBob3N0cy4gQnV0IHRoaXMgaXMgbm90IGdvaW5nIHRvIAo+PiBtYWtlIDUu
NCBydW5uaW5nIGNvcnJlY3RseSBhcyBYZW4gZ3Vlc3QuCj4gCj4gSGF2ZSB5b3UgdmVyaWZpZWQg
aXQgaXNuJ3QgcnVubmluZyBjb3JyZWN0bHkgb3IgZG8geW91IGp1c3QgdGhpbmsgaXQKPiBjb3Vs
ZCBoaXQgcHJvYmxlbXM/CgpJIGhhdmVuJ3QgdGVzdGVkIG15c2VsZiwgYnV0IGFueSBidWcgYXJv
dW5kIHZHSUMgaXMgdXN1YWxseSBzdWJ0bGVkLiBJIAp3cm90ZSBhIGxvbmcgZS1tYWlsIG9uIHYx
IChzZWUgWzFdKSBleHBsYW5pbmcgd2hhdCBjb3VsZCBoYXBwZW4uCgpUbyBzdW1tYXJpemUgYnJp
ZWZseSwgTGludXggaXMgcmVhZGluZyB0aGUgSSpBQ1RJVkVSIHJlZ2lzdGVycyB0byBjaGVjayAK
d2hldGhlciBhbiBpbnRlcnJ1cHQgaXMgYWN0aXZlIGF0IHRoZSBoYXJkd2FyZSBsZXZlbC4gRm9y
IGluc3RhbmNlLCB0aGlzIAppcyB1c2VkIHRvIGVuc3VyZSBhbGwgYWN0aXZlIGludGVycnVwdHMg
aGF2ZSBiZWVuIGhhbmRsZWQgYmVmb3JlIGNvbnRpbnVpbmcuCgpCeSBhbHdheXMgcmV0dXJuaW5n
IDAsIHdlIHRlbGwgTGludXggdGhlcmUgYXJlIG5vIGludGVycnVwdHMuIE9uZSBvZiB0aGUgCnJp
c2sgaXMgaW50ZXJydXB0cyBtYXkgYmUgbG9zdC4KCkJ1dCB0aGF0J3MgTGludXggYmVoYXZpb3Is
IEkgY2FuJ3QgdGVsbCBob3cgdGhpcyBpcyBnb2luZyB0byBiZSB1c2VkIGJ5IApvdGhlcnMgT1Nl
cy4KCj4gCj4gSW4gYm90aCBjYXNlcyBJIHNlZSBubyByZWFzb24gdG8ga2VlcCB3cm9uZyBjb2Rl
Lgo+IAo+IEVpdGhlciB0aGUgcGF0Y2ggd2lsbCBsZXQgcnVuIExpbnV4IDUuNCBmaW5lIC0gdGhl
biB0aGUgcGF0Y2ggc2hvdWxkCj4gZGVmaW5pdGVseSBiZSB0YWtlbi4KVGhhdCdzIHVwIHRvIFN0
ZWZhbm8gYW5kIFBlbmcgdG8gcHJvdmlkZSBtZSBpbmZvcm1hdGlvbiB3aHkgdGhpcyBpcyAKZmlu
ZS4gRkFPRCwgdGhlIGN1cnJlbnQganVzdGlmaWNhdGlvbiBwcm92aWRlZCBpcyBub3QgYWNjZXB0
YWJsZSBmb3IgbWUuCgo+IAo+IE9yIHRoZSBwYXRjaCB3aWxsIGxldCBMaW51eCA1LjQgYm9vdCBm
dXJ0aGVyLCBidXQgc29tZSBwcm9ibGVtcyB3aWxsCj4gb2NjdXIuIFRoZW4gaXQgd2lsbCBiZSBw
b3NzaWJsZSB0byBhbmFseXplIHRob3NlIHByb2JsZW1zIGFuZCB0cnkgdG8KPiBmaXggdGhlbSwg
dmVyeSBwb3NzaWJseSB3aXRoIHRoZSBzYW5lIGFwcHJvYWNoIHlvdSBhcmUgaG9waW5nIGZvci4K
PiAKPiAKPiBKdWVyZ2VuCgpbMV0gCmh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL3hlbi1kZXZlbC83
Mjg5Zjc1Zi0xYWIyLTJkNDItY2Q4OC0xYmU1MzA2YjMwNzJAeGVuLm9yZy8KCi0tIApKdWxpZW4g
R3JhbGwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhl
bi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBz
Oi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
