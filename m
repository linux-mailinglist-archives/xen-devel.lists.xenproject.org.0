Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FC9BD17EC
	for <lists+xen-devel@lfdr.de>; Wed,  9 Oct 2019 20:58:44 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iIH8Q-0007ZT-EE; Wed, 09 Oct 2019 18:56:30 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=sdFN=YC=gmail.com=pdurrant@srs-us1.protection.inumbo.net>)
 id 1iIH8O-0007ZO-CO
 for xen-devel@lists.xenproject.org; Wed, 09 Oct 2019 18:56:28 +0000
X-Inumbo-ID: 7f2a1ad6-eac6-11e9-8c93-bc764e2007e4
Received: from mail-pl1-x644.google.com (unknown [2607:f8b0:4864:20::644])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 7f2a1ad6-eac6-11e9-8c93-bc764e2007e4;
 Wed, 09 Oct 2019 18:56:27 +0000 (UTC)
Received: by mail-pl1-x644.google.com with SMTP id k7so1503237pll.1
 for <xen-devel@lists.xenproject.org>; Wed, 09 Oct 2019 11:56:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=n0Kqfc/1+1Rolvt9c00xrZ/84DkTXFa7gGF9RTo+xI0=;
 b=KhlaWmpK/Ss+3Rnf02HFwzC07jK9RHEy2zXc+c18zDayJVpR9FbjUkqSaF1YfG9YzH
 zNdQY0rhfIPeP0b9DpEzS9KVP58gQrzj1Z4rLq/vLuhkkz4TBHUN1jT2MQ3Kh3t6gJ7L
 U26D3Vg6bIduzrSA2R69FDOs90iMh6vDuQ+1mHNdzsbhEd0AzC4PR/AKR1vQPZ8ffVHA
 EwAHfLWpXCh/T67/8E8p4i3ghRTjWJptiSZtBA56wFyEn4+2dtrYfgH+1KcX4mH+NqhE
 U29Y0wrrclnpm3XkI1BmD3lT8A5LVW9+UDA2phiIbXnb6wpf8p8dxNpdcPk/OfwdD56+
 5ZRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=n0Kqfc/1+1Rolvt9c00xrZ/84DkTXFa7gGF9RTo+xI0=;
 b=uIGjC/tAFvFPHh0Vlg3jjzv/TuSSgGpTC2Iem/JShGoE9BHgmIT20UiMZ293ym58CQ
 ejleY98ox9CQim8+qazKgrkvQeanCBEyKqeooqUqsitp7rv7JS4fio49b0gmI01mgl8S
 Q+bSXUCIsNIyzbmFkZyuLDAq5Vk5eRqjRUUHuMgqBpSIZGJ74H2xhBZiWcjueQsAe095
 HrXo2OHpggTQFy8zKT53sXnzbDhyX9k09CmwugjxDVLmNCzBBfjS+SPuRm0NusRbEIDm
 uV+V+uYXCTtsRGqgjFsbiduxmbfh/8F5SNGUv17bxkZd/6fwMP2aqopmctLqob4BuZNk
 1nqg==
X-Gm-Message-State: APjAAAWLFeqQq2PKhtXXEKFuzjL+Uv8iGfQ2z/l2E3FY0+aWg2Ds3BNq
 AFBjXfX+koRIQxZ0hjiAAz/Z6HKICH1e2WxVeyM=
X-Google-Smtp-Source: APXvYqynEC8+712kv8gTxRTR8BTorHtmLFD9t396nBAusqXnPg9preOQPKd1pDWrbrTE/6cYvSUPYwE9BqogZRIC56Y=
X-Received: by 2002:a17:902:6bc9:: with SMTP id
 m9mr4560712plt.227.1570647386337; 
 Wed, 09 Oct 2019 11:56:26 -0700 (PDT)
MIME-Version: 1.0
References: <20191009182114.9376-1-andrew.cooper3@citrix.com>
In-Reply-To: <20191009182114.9376-1-andrew.cooper3@citrix.com>
From: Paul Durrant <pdurrant@gmail.com>
Date: Wed, 9 Oct 2019 19:56:14 +0100
Message-ID: <CACCGGhAhK_fbiJbUn-nPnFEWK6AvFye1r7Di-3j5UEwNW916rg@mail.gmail.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [Xen-devel] [PATCH] x86/hvm: Fix the use of "hap=0" following
 c/s c0902a9a143a
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
Cc: Juergen Gross <jgross@suse.com>, Wei Liu <wl@xen.org>,
 Paul Durrant <paul@xen.org>, Jan Beulich <JBeulich@suse.com>,
 Xen-devel <xen-devel@lists.xenproject.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gV2VkLCA5IE9jdCAyMDE5IGF0IDE5OjIxLCBBbmRyZXcgQ29vcGVyIDxhbmRyZXcuY29vcGVy
M0BjaXRyaXguY29tPiB3cm90ZToKPgo+IGMvcyBjMDkwMmE5YTE0M2EgcmVmYWN0b3JlZCBodm1f
ZW5hYmxlKCkgYSBsaXR0bGUsIGJ1dCBkcm9wcGVkIHRoZSBsb2dpYyB3aGljaAo+IGNsZWFyZWQg
aGFwX3N1cHBvcnRlZCBpbiB0aGUgY2FzZSB0aGF0IHRoZSB1c2VyIGhhZCBhc2tlZCBmb3IgaXQg
b2ZmLgo+Cj4gVGhpcyByZXN1bHRzIGluIFhlbiBib290aW5nIHVwLCBjbGFpbWluZzoKPgo+ICAg
KFhFTikgSFZNOiBIYXJkd2FyZSBBc3Npc3RlZCBQYWdpbmcgKEhBUCkgZGV0ZWN0ZWQgYnV0IGRp
c2FibGVkCj4KPiBidXQgd2l0aCBIQVAgYWR2ZXJ0aXNlZCB2aWEgc3lzY3RsLCBhbmQgWEVOX0RP
TUNUTF9DREZfaGFwIGJlaW5nIGFjY2VwdGVkIGluCj4gZG9tYWluX2NyZWF0ZSgpLgo+Cj4gU2ln
bmVkLW9mZi1ieTogQW5kcmV3IENvb3BlciA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4KClRo
YXQgc2hvdWxkIGhhdmUgYmVlbiBsYXJnZWx5IGNvZGUgbW92ZW1lbnQsIHNvIEkgZG9uJ3Qga25v
dyBob3cgSQptYW5hZ2VkIHRvIGRyb3AgdGhhdC4KClJldmlld2VkLWJ5OiBQYXVsIER1cnJhbnQg
PHBhdWxAeGVuLm9yZz4KCj4gLS0tCj4gQ0M6IEphbiBCZXVsaWNoIDxKQmV1bGljaEBzdXNlLmNv
bT4KPiBDQzogV2VpIExpdSA8d2xAeGVuLm9yZz4KPiBDQzogUm9nZXIgUGF1IE1vbm7DqSA8cm9n
ZXIucGF1QGNpdHJpeC5jb20+Cj4gQ0M6IFBhdWwgRHVycmFudCA8cGF1bEB4ZW4ub3JnPgo+IEND
OiBKdWVyZ2VuIEdyb3NzIDxqZ3Jvc3NAc3VzZS5jb20+Cj4KPiBUaGlzIGlzIGEgcmVncmVzc2lv
biBmcm9tIDQuMTIsIHNvIHNob3VsZCBiZSBmaXhlZCBiZWZvcmUgNC4xMyBzaGlwcy4KPiAtLS0K
PiAgeGVuL2FyY2gveDg2L2h2bS9odm0uYyB8IDUgKysrLS0KPiAgMSBmaWxlIGNoYW5nZWQsIDMg
aW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKPgo+IGRpZmYgLS1naXQgYS94ZW4vYXJjaC94
ODYvaHZtL2h2bS5jIGIveGVuL2FyY2gveDg2L2h2bS9odm0uYwo+IGluZGV4IGMyMmNiMzljZjMu
LjlhY2QzNTljOTkgMTAwNjQ0Cj4gLS0tIGEveGVuL2FyY2gveDg2L2h2bS9odm0uYwo+ICsrKyBi
L3hlbi9hcmNoL3g4Ni9odm0vaHZtLmMKPiBAQCAtMTQyLDcgKzE0Miw3IEBAIHN0YXRpYyBzdHJ1
Y3Qgbm90aWZpZXJfYmxvY2sgY3B1X25mYiA9IHsKPiAgICAgIC5ub3RpZmllcl9jYWxsID0gY3B1
X2NhbGxiYWNrCj4gIH07Cj4KPiAtc3RhdGljIGJvb2wgX19pbml0IGhhcF9zdXBwb3J0ZWQoY29u
c3Qgc3RydWN0IGh2bV9mdW5jdGlvbl90YWJsZSAqZm5zKQo+ICtzdGF0aWMgYm9vbCBfX2luaXQg
aGFwX3N1cHBvcnRlZChzdHJ1Y3QgaHZtX2Z1bmN0aW9uX3RhYmxlICpmbnMpCj4gIHsKPiAgICAg
IGlmICggIWZucy0+aGFwX3N1cHBvcnRlZCApCj4gICAgICB7Cj4gQEAgLTE1Miw2ICsxNTIsNyBA
QCBzdGF0aWMgYm9vbCBfX2luaXQgaGFwX3N1cHBvcnRlZChjb25zdCBzdHJ1Y3QgaHZtX2Z1bmN0
aW9uX3RhYmxlICpmbnMpCj4KPiAgICAgIGlmICggIW9wdF9oYXBfZW5hYmxlZCApCj4gICAgICB7
Cj4gKyAgICAgICAgZm5zLT5oYXBfc3VwcG9ydGVkID0gMDsKPiAgICAgICAgICBwcmludGsoIkhW
TTogSGFyZHdhcmUgQXNzaXN0ZWQgUGFnaW5nIChIQVApIGRldGVjdGVkIGJ1dCBkaXNhYmxlZFxu
Iik7Cj4gICAgICAgICAgcmV0dXJuIGZhbHNlOwo+ICAgICAgfQo+IEBAIC0xNzUsNyArMTc2LDcg
QEAgc3RhdGljIGludCBfX2luaXQgaHZtX2VuYWJsZSh2b2lkKQo+ICAgICAgaHZtX2VuYWJsZWQg
PSAxOwo+Cj4gICAgICBwcmludGsoIkhWTTogJXMgZW5hYmxlZFxuIiwgZm5zLT5uYW1lKTsKPiAt
ICAgIGlmICggIWhhcF9zdXBwb3J0ZWQoZm5zKSApCj4gKyAgICBpZiAoICFoYXBfc3VwcG9ydGVk
KCZodm1fZnVuY3MpICkKPiAgICAgICAgICBjbGVhcl9pb21tdV9oYXBfcHRfc2hhcmUoKTsKPiAg
ICAgIGVsc2UKPiAgICAgIHsKPiAtLQo+IDIuMTEuMAo+CgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZl
bEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxt
YW4vbGlzdGluZm8veGVuLWRldmVs
