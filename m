Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BD63D2DADF
	for <lists+xen-devel@lfdr.de>; Wed, 29 May 2019 12:34:02 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hVvrd-0004xJ-VW; Wed, 29 May 2019 10:31:21 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Fgb6=T5=gmail.com=andrii.anisov@srs-us1.protection.inumbo.net>)
 id 1hVvrc-0004xC-S1
 for xen-devel@lists.xenproject.org; Wed, 29 May 2019 10:31:20 +0000
X-Inumbo-ID: e4efa405-81fc-11e9-8980-bc764e045a96
Received: from mail-lf1-x142.google.com (unknown [2a00:1450:4864:20::142])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id e4efa405-81fc-11e9-8980-bc764e045a96;
 Wed, 29 May 2019 10:31:19 +0000 (UTC)
Received: by mail-lf1-x142.google.com with SMTP id q26so1617312lfc.3
 for <xen-devel@lists.xenproject.org>; Wed, 29 May 2019 03:31:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=ggC0MoIN0A7coW/A5yBVKmBMCil3w+FKV5Byj2U/gn4=;
 b=nZUX1m524q7e8PfH/w3zub/76IaHPC3kY3IETao0E0vgPoMUccEKWoVkNFkAdM0O/Y
 a7YwKBQiYnvG77M84vlJNeD3yHL3ePR5YLX5dj8RAz+zsYWuYOvYnbY0/EL0x7e+/EYl
 MduzhDLcUB7AYeMRR4Ow9eJn2qFqkgsrGAHnYFm8rKalLKrdnzHwnJ4fPGqNw+5UT4+f
 3DAGNXEN5QZTKwWljU5LIPwOG4XHWfL69ctPIkj/d1uIr//j4f74HsklEjYs5hd+gx3H
 ai1Id0hCpW+nlKNc7J4gIuqd6T2IVf0n6NYRGdt0DMXSYL9dnoRPfa2lt3KBgOksj72a
 5bFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=ggC0MoIN0A7coW/A5yBVKmBMCil3w+FKV5Byj2U/gn4=;
 b=mGIESxsY6pVCBSeMdD5nlaF/MTlzL2cXcR6E6bZMNArYEh5mps0q8+ZkgzOycvjngJ
 LftWnzrF3A4fCpu/BdX/LaVHaWugxd1UekKgpp07E484Mzh2GLlvJhowp1lwpmD7dLfE
 1ONSHau2uakbEsA1YMi1pZl30fXVg4+8nQFOWkPAdBPj5YGtRB4oaKGowBldPs1+bUTf
 lLRY/ojPS1LmX0M09+0+sQSQCFKjv0zeF6PrXdXPg/HHYRIODtBXR7QrY64GyrjG9fAb
 Mg/cDDOGi2V8PK0acB1jRVsKgqBULwFByIaUrAqhIBVexUcuThLoXg/+/wN7mcCowvQe
 pIgw==
X-Gm-Message-State: APjAAAUXq3+ICtcTA5SkB4Kv4Ibg5TurejJYYwumSUMZnim1cMfqisjL
 XPRYEa2nC0yYh1oO1iFIPnw=
X-Google-Smtp-Source: APXvYqyd2Xjos12lfyanyrQiQW5fvw3uTn8+/C1QXygn6VhWlBgofxRSqXCsckvhxh4kzm0Esj0eLQ==
X-Received: by 2002:a19:d106:: with SMTP id i6mr15208804lfg.8.1559125877766;
 Wed, 29 May 2019 03:31:17 -0700 (PDT)
Received: from [10.17.180.71] (ll-22.209.223.85.sovam.net.ua. [85.223.209.22])
 by smtp.gmail.com with ESMTPSA id
 v14sm3376082lfb.50.2019.05.29.03.31.16
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 29 May 2019 03:31:16 -0700 (PDT)
To: Julien Grall <julien.grall@arm.com>, xen-devel@lists.xenproject.org
References: <1558949370-14331-1-git-send-email-andrii.anisov@gmail.com>
 <d63ff1d7-963a-bd1a-7835-ee5b30504628@arm.com>
From: Andrii Anisov <andrii.anisov@gmail.com>
Message-ID: <20d30591-bc90-5321-2de9-a11f7d36cb11@gmail.com>
Date: Wed, 29 May 2019 13:31:16 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <d63ff1d7-963a-bd1a-7835-ee5b30504628@arm.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v2] gic: drop interrupts enabling on
 interrupts processing
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
Cc: Andre Przywara <andre.przywara@arm.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Andrii Anisov <andrii_anisov@epam.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGVsbG8gSnVsaWVuLAoKT24gMjguMDUuMTkgMjA6MDcsIEp1bGllbiBHcmFsbCB3cm90ZToKPiBU
aXRsZTogSW50ZXJydXB0cyBhcmUgc3RpbGwgdW5tYXNrZWQgd2hlbiBleGVjdXRpbmcgYWN0aW9u
IGZvciBpbnRlcnJ1cHQgcm91dGVkIHRvIFhlbi4gU28geW91IG5lZWQgdG8gYmUgbW9yZSBzcGVj
aWZpYy4gSG93IGFib3V0Cj4gInhlbi9hcm06IGdpYzogRGVmZXIgdGhlIGRlY2lzaW9uIHRvIHVu
bWFzayBpbnRlcnJ1cHRzIHRvIGRvX3tMUEksIElSUX0oKSI/CgpMb29rcyBnb29kLgoKPiAKPiBP
biA1LzI3LzE5IDEwOjI5IEFNLCBBbmRyaWkgQW5pc292IHdyb3RlOgo+PiBGcm9tOiBBbmRyaWkg
QW5pc292IDxhbmRyaWlfYW5pc292QGVwYW0uY29tPgo+Pgo+PiBUaGlzIHJlZHVjZXMgdGhlIG51
bWJlciBvZiBjb250ZXh0IHN3aXRjaGVzIGluIGNhc2Ugd2UgaGF2ZSBjb21pbmcgZ3Vlc3QKPj4g
aW50ZXJydXB0cyBmcm9tIGRpZmZlcmVudCBzb3VyY2VzIGF0IGEgaGlnaCByYXRlLiBXaGF0IGlz
IGxpa2VseSBmb3IKPiAKPiBzL1doYXQvVGhpcy8KPiAKPj4gbXVsdGltZWRpYSB1c2UtY2FzZXMu
Cj4+IEhhdmluZyBpcnFzIHVubG9ja2VkIGhlcmUgbWFrZXMgdXMgZ28gdGhyb3VnaCB0cmFwIHBh
dGggYWdhaW4gaW4gY2FzZSB3ZQo+IAo+IHdoYXQgZG8geW91IG1lYW4gYnkgInVubG9ja2VkIj8K
Ckl0IG11c3QgYmUgImVuYWJsZWQiLgoKPj4gaGF2ZSBhIG5ldyBndWVzdCBpbnRlcnJ1cHQgYXJy
aXZlZCAoZXZlbiB3aXRoIHRoZSBzYW1lIHByaW9yaXR5LCBhZnRlcgo+PiBgZGVzYy0+aGFuZGxl
ci0+ZW5kKGRlc2MpYCBpbiBgZG9fSVJRKClgKSwgd2hhdCBpcyBqdXN0IGEgcHJvY2Vzc29yCj4+
IGN5Y2xlcyB3YXN0aW5nLgo+IGFmdGVyIGBkZXNjLT4uLi4uYC4gVGhpcyBpcyBqdXN0IGEgd2Fz
dGUgYSBwcm9jZXNzb3IgY3ljbGUgYXMgd2Ugd2lsbCBjYXRjaCB0aGVtIGFsbCBpbiB0aGUgZnVu
Y3Rpb24gZ2ljX2ludGVycnVwdCgpIGxvb3AuCj4gCj4gIMKgV2Ugd2lsbCBjYXRjaCB0aGVtIGFs
bCBpbiB0aGUgYGdpY19pbnRlcnJ1cHQoKSBmdW5jdGlvbgo+PiBsb29wIGFueXdheS4gQW5kIHRo
ZSBndWVzdCBpcnFzIGFycml2YWwgcHJpb3JpdGl6YXRpb24gaXMgbWVhbmluZ2xlc3MKPj4gaGVy
ZSwgaXQgaXMgb25seSBlZmZlY3RpdmUgYXQgZ3Vlc3QncyBsZXZlbC4KPiAKPiBJIGFtIG5vdCBz
dXJlIHdoeSB5b3Ugc3BlYWsgYWJvdXQgZ3Vlc3QgcHJpb3JpdGl6YXRpb24gaGVyZS4KCkknbSB0
cnlpbmcgdG8gc2F5IGFib3V0IGd1ZXN0IGludGVycnVwdHMgcHJpb3JpdGl6YXRpb24gaW4gSFcu
IEJ1dCBJIGNhbiBkcm9wIGl0IGZyb20gdGhlIGNvbW1pdCBtZXNzYWdlLgoKPiBUaGUgbWFpbiBp
c3N1ZSB3b3VsZCBiZSBhbiBpbnRlcnJ1cHQgdG8gWGVuIChpLmUgdGltZXIpIHRoYXQgd291bGQg
Z2V0IGRlbGF5ZWQgYmVjYXVzZSBvZiBsb25nZXIgcGVyaW9kIHdpdGhvdXQgaW50ZXJydXB0IGVu
YWJsZWQuCgpIZXJlIHdlIHdpbGwgcHJvY2VzcyBpdCBvbiB0aGUgbmV4dCBsb29wLiBUaGlzIHNo
b3VsZCBub3QgYmUgbXVjaCBsb25nZXIgdGhhbiBleGlzdGluZyB2Z2ljX2luamVjdF9pcnEoKSBp
bnRlcnJ1cHRzIGRpc2FibGVkIHBlcmlvZC4KCj4gSSB3b3VsZCBhbHNvIG5vdCBydWxlIG91dCB0
aGUgcG9zc2liaWxpdHkgdG8gcHJpb3JpdGl6ZSBndWVzdCBpbnRlcnJ1cHQgYXQgaGFyZHdhcmUg
bGV2ZWwuPiAKPiBJIGtub3cgd2UgaGF2ZSBiZWVuIGRpc2N1c3Npbmcgb24gdGhlIHByb2JsZW0g
aW4gdGhlIHBhc3QsCgpOb3cgSSdtIHRyeWluZyB0byBwaWNrIHRoZSB3b3J0aHkgYml0cyBmcm9t
IFsxXS4KQlRXLCBkbyB5b3UgaGVhciBhYm91dCBwbGFucyBmb3IgdGhlIG5ldyB2Z2ljPyBTb21l
IHRpbWUgYWdvIGl0IHdhcyBzYWlkIHRoYXQgbmV3IHZnaWMgaW1wbGVtZW50YXRpb24gZ29pbmcg
dG8gcmVwbGFjZSB0aGUgb2xkIG9uZSwgYW5kIG9wdGltaXppbmcgdGhlIG9sZCBpcyB3b3J0aGxl
c3MuIEJ1dCBhcyBJIHNlZSwgdGhlcmUgYXJlIG5vIHVwZGF0ZXMgaW50byB0aGF0IGFyZWEgeWV0
LgoKPiBidXQgYSBzdW1tYXJ5IGluIHRoZSBjb21taXQgbWVzc2FnZSBpcyBxdWl0ZSBpbXBvcnRh
bnQgdG8gbm90IG1pc3Mgb3V0IGFsbCB0aGUgcHJvYmxlbXMuCgo+IFRoZSByZWFsIHByb2JsZW0g
aGVyZSBpcyBmb3IgaW50ZXJydXB0IHJvdXRlZCB0byBndWVzdCB0aGUgaW50ZXJydXB0IHdpbGwg
YmUga2VwdCB1bm1hc2tlZCB3aGVuIGNhbGxpbmcgZGVzYy0+aGFuZGxlci0+ZW5kKGRlc2MpLiBU
aGlzIHdpbGwgcmVzdWx0IHRvIHJlY2VpdmUgdGhlIG5leHQgaW50ZXJydXB0IGFzIHNvb24gYXMg
ZGVzYy0+aGFuZGxlci0+ZW5kKGRlc2MpIGlzIGNhbGxlZC4KPiAKPiBJbiB0aGUgY2FzZSBvZiBp
bnRlcnJ1cHQgcm91dGVkIHRvIFhlbiwgaW50ZXJydXB0cyB3aWxsIGJlIGtlcHQgZW5hYmxlZCB3
aGlsZSBleGVjdXRpbmcgdGhlIGFjdGlvbiBidXQgdGhlbiBkaXNhYmxlZCBiZWZvcmUgY2FsbGlu
ZyBkZXNjLT5oYW5kbGVyLT5lbmQoZGVzYykuCj4gCj4gSXQgd291bGQgYmUgZmluZSB0byBrZWVw
IHRoZSBpbnRlcnJ1cHRzIG1hc2tlZCBmb3IgaW50ZXJydXB0cyByb3V0ZWQgdG8gdGhlIGd1ZXN0
IGJlY2F1c2UgdmdpY19pbmplY3RfaXJxKC4uLikgd2lsbCBiZSBtYXNraW5nIHRoZSBpbnRlcnJ1
cHQgaW4gbW9zdCBvZiB0aGUgY2FzZXMuCj4gCj4gVGhlIGNvZGUgYmVsb3cgbG9va3MgZ29vZCB0
byBtZS4gSSBhbSBoYXBweSB0byBoZWxwIHJld29yZGluZyB0aGUgY29tbWl0IG1lc3NhZ2UgaWYg
bmVjZXNzYXJ5LgoKSXQncyBnb29kIHRvIGhlYXIuIEknbSByZWFkeSB0byByZXdvcmQgdGhlIGNv
bW1pdCBtZXNzYWdlIGFzIHJlcXVpcmVkIHRvIGdldCB0aGUgc3R1ZmYgdXBzdHJlYW1lZC4KSSdk
IGRpc2N1c3MgdGhlIHdvcmRpbmdzIGhlcmUuIFdpdGggY2hhbmdlcyBzdWdnZXN0ZWQgYnkgeW91
LCB0aGUgY29tbWl0IHRpdGxlIGFuZCBtZXNzYWdlIHdvdWxkIGJlIGZvbGxvd2luZzoKCiAgICAg
eGVuL2FybTogZ2ljOiBEZWZlciB0aGUgZGVjaXNpb24gdG8gdW5tYXNrIGludGVycnVwdHMgdG8g
ZG9fe0xQSSwgSVJRfSgpCgogICAgIFRoaXMgcmVkdWNlcyB0aGUgbnVtYmVyIG9mIGNvbnRleHQg
c3dpdGNoZXMgaW4gY2FzZSB3ZSBoYXZlIGNvbWluZyBndWVzdAogICAgIGludGVycnVwdHMgZnJv
bSBkaWZmZXJlbnQgc291cmNlcyBhdCBhIGhpZ2ggcmF0ZS4gVGhhdCBpcyBsaWtlbHkgZm9yCiAg
ICAgbXVsdGltZWRpYSB1c2UtY2FzZXMuCiAgICAgSGF2aW5nIGlycXMgZW5hYmxlZCBoZXJlIG1h
a2VzIHVzIGdvIHRocm91Z2ggdHJhcCBwYXRoIGFnYWluIGluIGNhc2Ugd2UKICAgICBoYXZlIGEg
bmV3IGd1ZXN0IGludGVycnVwdCBhcnJpdmVkIChldmVuIHdpdGggdGhlIHNhbWUgb3IgbG93ZXIg
cHJpb3JpdHksCiAgICAgYWZ0ZXIgYGRlc2MtPmhhbmRsZXItPmVuZChkZXNjKWAgaW4gYGRvX0lS
USgpYCksIHRoYXQgaXMganVzdCBhIHByb2Nlc3NvcgogICAgIGN5Y2xlcyB3YXN0aW5nIGFzIHdl
IHdpbGwgY2F0Y2ggdGhlbSBhbGwgaW4gdGhlIGBnaWNfaW50ZXJydXB0KCkgZnVuY3Rpb24KICAg
ICBsb29wLgoKWzFdIGh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvYXJjaGl2ZXMvaHRtbC94
ZW4tZGV2ZWwvMjAxOC0xMi9tc2cwMjI5Ny5odG1sCgotLSAKU2luY2VyZWx5LApBbmRyaWkgQW5p
c292LgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVu
LWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6
Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
