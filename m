Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DBC6102D73
	for <lists+xen-devel@lfdr.de>; Tue, 19 Nov 2019 21:20:32 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iX9x5-0007C9-6r; Tue, 19 Nov 2019 20:18:19 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=NUhf=ZL=gmail.com=julien.grall.oss@srs-us1.protection.inumbo.net>)
 id 1iX9x4-0007C4-6f
 for xen-devel@lists.xen.org; Tue, 19 Nov 2019 20:18:18 +0000
X-Inumbo-ID: b838ae24-0b09-11ea-a302-12813bfff9fa
Received: from mail-wm1-f68.google.com (unknown [209.85.128.68])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id b838ae24-0b09-11ea-a302-12813bfff9fa;
 Tue, 19 Nov 2019 20:18:16 +0000 (UTC)
Received: by mail-wm1-f68.google.com with SMTP id b11so4633133wmb.5
 for <xen-devel@lists.xen.org>; Tue, 19 Nov 2019 12:18:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=XFydssdVuGpNipj5uQP9eK7iYpTQudfkEMrXveFkTQ0=;
 b=tBwMVphEYMJMMoBnmmsdh/spHxc+E6UpfiWrZN0DaHM9CwUJZzgRG54PCoGuOxZXuS
 hEgHdGmZTPRfboX2XsKV369kB4FI9yE3LY3UxiJn+eyfHeOe+xwxXwR6P9CM10gifu7E
 ICPRz4NUwnzqkUz8wiFo018og1indcZcsWL2JoyEbjHDQhBM+A8lDypaz6rYiXT4U6+u
 INdf/CNXxT/2FbEJGkgIyfLL+Jgnfsh2i1CreSs9SkoAVidpuHeoDZIQTzkLgSFkUxv2
 FzQLEpSoJ0tqipKB5IOyNzvH6QdDs1I2BjxrV91i5XxWPEBhmtAYseZUXeKEU/+/zYRa
 UIAA==
X-Gm-Message-State: APjAAAUPTx7pf+mQ1Mea4CsfeQ0E8aVl2In635S+SC4WQfHicNCrsaGu
 +8+xgGVRAOSe86XwIpk+G7Fn9M2cD7I=
X-Google-Smtp-Source: APXvYqxccl/GYKMdGzk1IQtVi4RshKtAgs2cozADbTnZb9uuhwruBq0m+F0ZkDqF5QJ9W+bxjg6UBQ==
X-Received: by 2002:a1c:8055:: with SMTP id b82mr8434098wmd.176.1574194695514; 
 Tue, 19 Nov 2019 12:18:15 -0800 (PST)
Received: from a483e7b01a66.ant.amazon.com (54-240-197-239.amazon.com.
 [54.240.197.239])
 by smtp.gmail.com with ESMTPSA id b186sm4253953wmb.21.2019.11.19.12.18.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 19 Nov 2019 12:18:14 -0800 (PST)
To: Andre Przywara <andre.przywara@arm.com>,
 Stefano Stabellini <sstabellini@kernel.org>
References: <20191107033709.17575-1-peng.fan@nxp.com>
 <alpine.DEB.2.21.1911081123580.2677@sstabellini-ThinkPad-T480s>
 <CAJ=z9a2QiPco5N4-P5V+hRERR05jr8VMk2jsU6HoxLMiipBKYw@mail.gmail.com>
 <alpine.DEB.2.21.1911111049000.2677@sstabellini-ThinkPad-T480s>
 <20191112124609.69f2a6a2@donnerap.cambridge.arm.com>
From: Julien Grall <julien@xen.org>
Message-ID: <7289f75f-1ab2-2d42-cd88-1be5306b3072@xen.org>
Date: Tue, 19 Nov 2019 20:18:13 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:68.0)
 Gecko/20100101 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <20191112124609.69f2a6a2@donnerap.cambridge.arm.com>
Content-Language: en-GB
Subject: Re: [Xen-devel] [PATCH] arch: arm: vgic-v3: fix GICD_ISACTIVER range
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
Cc: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>,
 Peng Fan <peng.fan@nxp.com>,
 "xen-devel@lists.xen.org" <xen-devel@lists.xen.org>,
 "julien.grall@arm.com" <julien.grall@arm.com>,
 Julien Grall <julien.grall.oss@gmail.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGkgQW5kcmUsCgpPbiAxMi8xMS8yMDE5IDEyOjQ2LCBBbmRyZSBQcnp5d2FyYSB3cm90ZToKPiBP
biBNb24sIDExIE5vdiAyMDE5IDExOjAxOjA3IC0wODAwIChQU1QpCj4gU3RlZmFubyBTdGFiZWxs
aW5pIDxzc3RhYmVsbGluaUBrZXJuZWwub3JnPiB3cm90ZToKPj4gT24gU2F0LCA5IE5vdiAyMDE5
LCBKdWxpZW4gR3JhbGwgd3JvdGU6Cj4+PiBPbiBTYXQsIDkgTm92IDIwMTksIDA0OjI3IFN0ZWZh
bm8gU3RhYmVsbGluaSwgPHNzdGFiZWxsaW5pQGtlcm5lbC5vcmc+IHdyb3RlOgo+Pj4gICAgICAg
IE9uIFRodSwgNyBOb3YgMjAxOSwgUGVuZyBGYW4gd3JvdGU6Cj4+PiAgICAgICAgPiBUaGUgZW5k
IHNob3VsZCBiZSBHSUNEX0lTQUNUSVZFUk4gbm90IEdJQ0RfSVNBQ1RJVkVSLgo+Pj4gICAgICAg
ID4KPj4+ICAgICAgICA+IFNpZ25lZC1vZmYtYnk6IFBlbmcgRmFuIDxwZW5nLmZhbkBueHAuY29t
Pgo+Pj4KPj4+ICAgICAgICBSZXZpZXdlZC1ieTogU3RlZmFubyBTdGFiZWxsaW5pIDxzc3RhYmVs
bGluaUBrZXJuZWwub3JnPgo+Pj4KPj4+Cj4+PiBUbyBiZSBob25lc3QsIEkgYW0gbm90IHN1cmUg
dGhlIGNvZGUgaXMgY29ycmVjdC4gQSByZWFkIHRvIHRob3NlIHJlZ2lzdGVycyBzaG91bGQgdGVs
bCB5b3UgdGhlIGxpc3Qgb2YgaW50ZXJydXB0cyBhY3RpdmUuIEFzIHdlIGFsd2F5cwo+Pj4gcmV0
dXJuIDAsIHRoaXMgd2lsbCBub3QgcmV0dXJuIHRoZSBjb3JyZWN0IHN0YXRlIG9mIHRoZSBHSUMu
Cj4+Pgo+Pj4gSSBrbm93IHRoYXQgcmV0dXJuaW5nIHRoZSBsaXN0IG9mIGFjdGl2ZXMgaW50ZXJy
dXB0cyBpcyBjb21wbGljYXRlZCB3aXRoIHRoZSBvbGQgdkdJQywgYnV0IEkgZG9uJ3QgdGhpbmsg
c2lsZW50bHkgaWdub3JpbmcgaXQgaXMgYSBnb29kCj4+PiBpZGVhLgo+Pj4gVGhlIHF1ZXN0aW9u
IGhlcmUgaXMgd2h5IHRoZSBndWVzdCBhY2Nlc3NlZCB0aG9zZSByZWdpc3RlcnM/IFdoYXQgaXMg
aXQgdHJ5aW5nIHRvIGZpZ3VyZSBvdXQ/Cj4gCj4gSSBzZWUgTGludXggcXVlcnlpbmcgdGhlIGFj
dGl2ZSBzdGF0ZSAoSVJRQ0hJUF9TVEFURV9BQ1RJVkUpIGF0IHR3byByZWxldmFudCBwb2ludHMg
Zm9yIEFSTToKPiAtIEluIGtlcm5lbC9pcnEvbWFuYWdlLmMsIGluIF9fc3luY2hyb25pemVfaGFy
ZGlycSgpLgo+IC0gSW4gS1ZNJ3MgYXJjaCB0aW1lciBlbXVsYXRpb24gY29kZS4KPiAKPiBJIHRo
aW5rIHRoZSBsYXR0ZXIgaXMgb2Ygbm8gY29uY2VybiAoeWV0KSwgYnV0IHRoZSBmaXJzdCBtaWdo
dCBhY3R1YWxseSB0cmlnZ2VyLiBBdCB0aGUgbW9tZW50IGl0J3MgYmV5b25kIG1lIHdoYXQgaXQg
YWN0dWFsbHkgZG9lcywgYnV0IG1heWJlIHNvbWUgSVJRIGNoYW5nZXMgKFJULCB0aHJlYWRlZCBJ
UlFzPykgdHJpZ2dlciB0aGlzIG5vdz9cCkl0IGhhcHBlbnMgSSBhbSBzaXR0aW5nIHJpZ2h0IG5l
eHQgdG8gTWFyYyBub3csIHNvIEkgaGFkIGEgY2hhdCB3aXRoIGhpbSAKYWJvdXQgdGhpcyA6KS4g
TGV0IG1lIHRyeSB0byBzdW1tYXJpemUgdGhlIGRpc2N1c3Npb24gaGVyZS4KCl9fc3luY2hyb25p
emVfaGFyZGlycSgpIGlzIHVzZWQgdG8gZW5zdXJlIHRoYXQgYWxsIGFjdGl2ZSBpbnRlcnJ1cHRz
IApoYXZlIGJlZW4gaGFuZGxlZCBiZWZvcmUgY29udGludWluZy4gV2hlbiBzeW5jX2NoaXAgPT0g
ZmFsc2UsIHdlIG9ubHkgCmVuc3VyZSB0aGF0IGFsbCBpbiBwcm9ncmVzcyBpbnRlcnJ1cHRzIChm
cm9tIExpbnV4IFBvVikgYXJlIGhhbmRsZWQgCmJlZm9yZSBjb250aW51ZS4KCnN5bmNfY2hpcCA9
PSB0cnVlIHdpbGwgYWRkaXRpb25hbGx5IGVuc3VyZSB0aGF0IGFueSBpbnRlcnJ1cHQgdGhhdCB3
ZXJlIAphY2tub3dsZWRnZSBidXQgbm90IHlldCBtYXJrZWQgYXMgaW4gcHJvZ3Jlc3MgYnkgdGhl
IGtlcm5lbCBhcmUgYWxzbyAKaGFuZGxlZC4gVGhlIGFzc3VtcHRpb24gaXMgdGhpcyBpcyBjYWxs
ZWQgYWZ0ZXIgdGhlIGludGVycnVwdCBoYXMgYmVlbiAKbWFza2VkL2Rpc2FibGVkLgoKVGhlIGNh
bGwgdG8gX19zeW5jaHJvbml6ZV9oYXJkaXJxKCkgaW4gZnJlZV9pcnEoKSAoYXMgcmVwb3J0ZWQg
YnkgUGVuZyAKc3RhY2sgdHJhY2UpIHdhcyBpbnRyb2R1Y2VkIHJlY2VudGx5IChzZWUgWzFdKS4g
SXQgaXMgbm90IGVudGlyZWx5IGNsZWFyIAp3aGV0aGVyIHRoaXMgd291bGQgYWZmZWN0IGFueW9u
ZSB1c2luZyBMaW51eCA1LjQgb3IganVzdCBhIGxpbWl0ZWQgCnN1YnNldCBvZiB1c2Vycy4KCkFu
eWhvdywgdGhpcyBpcyBhIGdlbnVpbmUgYnVnIGFuZCBJIHRoaW5rIHJldHVybmluZyAwIGlzIG9u
bHkgcGFwZXJpbmcgCm92ZXIgdGhlIGJ1ZyB3aXRoIG5vIGxvbmctdGVybSByZXNvbHV0aW9uLiBB
cyBNYXJjIHBvaW50ZWQgb3V0LCBFdmVuIHRoZSAKb2xkIHZHSUMgaW4gS1ZNIHdhcyBub3Qgc3Bl
YyBjb21wbGlhbnQgYW5kIHRoYW5rZnVsbHkgdGhpcyB3YXMgZml4ZWQgaW4gCnRoZSBuZXcgdkdJ
Qy4KCkFzIEkgc2FpZCBpbiBhIGRpZmZlcmVudCBzdWItdGhyZWFkLCBJIHdvdWxkIHJlbHVjdGFu
bHkgYmUgb2sgdG8gc2VlIApyZXR1cm5pbmcgMCBhcyBsb25nIGFzIHdlIGhhdmUgYWRkIGEgd2Fy
bmluZyBmb3IgKmV2ZXJ5KiBhY2Nlc3MuIApMb25nLXRlcm0sIHRoZSBjdXJyZW50IHZHSUMgc2hv
dWxkIHJlYWxseSBnZXQga2lsbGVkLgoKQ2hlZXJzLAoKWzFdIDYyZTA0Njg2NTBjMzBmMDI5ODgy
MmM1ODBmMzgyYjE2MzI4MTE5ZjYgImdlbmlycTogQWRkIG9wdGlvbmFsIApoYXJkd2FyZSBzeW5j
aHJvbml6YXRpb24gZm9yIHNodXRkb3duIgoKLS0gCkp1bGllbiBHcmFsbAoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlz
dApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
