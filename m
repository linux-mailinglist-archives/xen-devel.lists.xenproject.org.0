Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 29495BF41A
	for <lists+xen-devel@lfdr.de>; Thu, 26 Sep 2019 15:33:20 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iDTqk-0008Mf-LO; Thu, 26 Sep 2019 13:30:26 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Aa/x=XV=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
 id 1iDTqj-0008MV-7r
 for xen-devel@lists.xenproject.org; Thu, 26 Sep 2019 13:30:25 +0000
X-Inumbo-ID: cb68970c-e061-11e9-9654-12813bfff9fa
Received: from mail-wm1-f68.google.com (unknown [209.85.128.68])
 by localhost (Halon) with ESMTPS
 id cb68970c-e061-11e9-9654-12813bfff9fa;
 Thu, 26 Sep 2019 13:30:24 +0000 (UTC)
Received: by mail-wm1-f68.google.com with SMTP id v17so2581077wml.4
 for <xen-devel@lists.xenproject.org>; Thu, 26 Sep 2019 06:30:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=eIxlt4NnP56LygIX5t+bsIzEw+4MpjLn9cxwX5Nezd4=;
 b=l7WSMSap1gnImRlUEeTgmsA81O5eiwYDB3Qawt6LuDCQkcKQCz8fk8rOvCke7J7VLz
 0T0cI+YREdsjDXzAZWILF74G5SLBzl8u6YArK9GDqmjsghAJ8iXOa1vn3RLMflkhO3v0
 ZdM5ON4BoBGq9lF7ouQMnYKn5GCpj0cXQ5djZ+u3bu4FzUZ0IPt7ewY9JToNXrxaSIFx
 riJIvWOmtw3WMBA5uqRzkrkw9xtuAw+VrkmF1b18guKbwaekTnETriJG0L+PKWTQeX3Q
 jIrdL4PMFYU5sHxsSZbeZZcsir3iisplODO6nTIMwmKOldrd5ao3F8uBtPJoTEIxnOf0
 5FSw==
X-Gm-Message-State: APjAAAWDE55HzChKvAcLWspmvSTzxAl85kaeNu2Woe7X/EFOMEz8nqmC
 ZkXxEkJBs+hFWmaP9uMeV24=
X-Google-Smtp-Source: APXvYqwUwoNEPiHGjs3+ikVLuh0eiQjRxSaSewBKIDfnDSu6ixDpczFnJ7RgjW4oq6owNOIVVxt/+g==
X-Received: by 2002:a1c:2144:: with SMTP id h65mr3253383wmh.114.1569504623300; 
 Thu, 26 Sep 2019 06:30:23 -0700 (PDT)
Received: from debian (207.148.159.143.dyn.plus.net. [143.159.148.207])
 by smtp.gmail.com with ESMTPSA id v20sm1734895wml.26.2019.09.26.06.30.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Sep 2019 06:30:22 -0700 (PDT)
Date: Thu, 26 Sep 2019 14:30:20 +0100
From: Wei Liu <wl@xen.org>
To: hongyax@amazon.com
Message-ID: <20190926133020.wtka3l6ituhryofl@debian>
References: <cover.1569489002.git.hongyax@amazon.com>
 <4b8e2d635bedc8a51281cac0eb93b6761c1eec5c.1569489002.git.hongyax@amazon.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <4b8e2d635bedc8a51281cac0eb93b6761c1eec5c.1569489002.git.hongyax@amazon.com>
User-Agent: NeoMutt/20180716
Subject: Re: [Xen-devel] [RFC PATCH 60/84] x86/domain_page: use PMAP when
 d/vcache is not ready.
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
 Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>, Wei Liu <wl@xen.org>,
 Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVGh1LCBTZXAgMjYsIDIwMTkgYXQgMTA6NDY6MjNBTSArMDEwMCwgaG9uZ3lheEBhbWF6b24u
Y29tIHdyb3RlOgo+IEZyb206IEhvbmd5YW4gWGlhIDxob25neWF4QGFtYXpvbi5jb20+Cj4gCj4g
QWxzbyBmaXggYSBwbGFjZSB3aGVyZSB1bm1hcF9kb21haW5fcGFnZSBzaG91bGQgb25seSBiZSBj
b25kaXRpb25hbGx5Cj4gdXNlZC4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBIb25neWFuIFhpYSA8aG9u
Z3lheEBhbWF6b24uY29tPgo+IC0tLQo+ICB4ZW4vYXJjaC94ODYvZG9tYWluX3BhZ2UuYyB8IDI3
ICsrKysrKysrKysrKysrKysrKysrKysrKy0tLQo+ICB4ZW4vYXJjaC94ODYvbW0uYyAgICAgICAg
ICB8ICAzICsrLQo+ICAyIGZpbGVzIGNoYW5nZWQsIDI2IGluc2VydGlvbnMoKyksIDQgZGVsZXRp
b25zKC0pCj4gCj4gZGlmZiAtLWdpdCBhL3hlbi9hcmNoL3g4Ni9kb21haW5fcGFnZS5jIGIveGVu
L2FyY2gveDg2L2RvbWFpbl9wYWdlLmMKPiBpbmRleCA5ZWE3NGI0NTZjLi5iZWNlOWQ4Y2QwIDEw
MDY0NAo+IC0tLSBhL3hlbi9hcmNoL3g4Ni9kb21haW5fcGFnZS5jCj4gKysrIGIveGVuL2FyY2gv
eDg2L2RvbWFpbl9wYWdlLmMKPiBAQCAtMTcsNiArMTcsOCBAQAo+ICAjaW5jbHVkZSA8YXNtL2Zs
dXNodGxiLmg+Cj4gICNpbmNsdWRlIDxhc20vaGFyZGlycS5oPgo+ICAjaW5jbHVkZSA8YXNtL3Nl
dHVwLmg+Cj4gKyNpbmNsdWRlIDxhc20vcG1hcC5oPgo+ICsjaW5jbHVkZSA8YXNtL2ZpeG1hcC5o
Pgo+ICAKPiAgc3RhdGljIERFRklORV9QRVJfQ1BVKHN0cnVjdCB2Y3B1ICosIG92ZXJyaWRlKTsK
PiAgCj4gQEAgLTgzLDEyICs4NSwyNiBAQCB2b2lkICptYXBfZG9tYWluX3BhZ2UobWZuX3QgbWZu
KQo+ICAKPiAgICAgIHYgPSBtYXBjYWNoZV9jdXJyZW50X3ZjcHUoKTsKPiAgICAgIGlmICggIXYg
fHwgIWlzX3B2X3ZjcHUodikgKQo+IC0gICAgICAgIHJldHVybiBtZm5fdG9fdmlydChtZm5feCht
Zm4pKTsKPiArICAgIHsKPiArICAgICAgICB2b2lkICpyZXQ7Cj4gKyAgICAgICAgcG1hcF9sb2Nr
KCk7Cj4gKyAgICAgICAgcmV0ID0gcG1hcF9tYXAobWZuKTsKPiArICAgICAgICBwbWFwX3VubG9j
aygpOwo+ICsgICAgICAgIGZsdXNoX3RsYl9vbmVfbG9jYWwocmV0KTsKCk9oIHRoaXMgaXMgYSBz
aWRlIGVmZmVjdCBvZiBtYW5pcHVsYXRpbmcgUFRFcyBkaXJlY3RseSwgcmlnaHQ/IEkgd291bGQK
cHJlZmVyIHlvdSBwdXQgdGhlIGZsdXNoIGludG8gcG1hcF9tYXAuIEl0cyBjYWxsZXIgc2hvdWxk
bid0IG5lZWQgdG8KZmx1c2ggdGhlIFZBLgoKSWYgeW91IGRvIHRoYXQsIHBsZWFzZSBkbyBpdCBp
biB0aGUgY29tbWl0IHRoYXQgaW50cm9kdWNlcyBQTUFQIGFzIHdlbGwuCgpJIHdpbGwgbmVlZCBt
b3JlIHRpbWUgdG8gdW5kZXJzdGFuZCB0aGUgb3ZlcmFsbCBkZXNpZ24gaW4gdGhpcyBzZXJpZXMg
dG8KbWFrZSBmdXJ0aGVyIGNvbW1lbnRzLgoKPiArICAgICAgICByZXR1cm4gcmV0Owo+ICsgICAg
fQo+ICAKPiAgICAgIGRjYWNoZSA9ICZ2LT5kb21haW4tPmFyY2gucHYubWFwY2FjaGU7Cj4gICAg
ICB2Y2FjaGUgPSAmdi0+YXJjaC5wdi5tYXBjYWNoZTsKPiAgICAgIGlmICggIWRjYWNoZS0+aW51
c2UgKQo+IC0gICAgICAgIHJldHVybiBtZm5fdG9fdmlydChtZm5feChtZm4pKTsKPiArICAgIHsK
PiArICAgICAgICB2b2lkICpyZXQ7Cj4gKyAgICAgICAgcG1hcF9sb2NrKCk7Cj4gKyAgICAgICAg
cmV0ID0gcG1hcF9tYXAobWZuKTsKPiArICAgICAgICBwbWFwX3VubG9jaygpOwo+ICsgICAgICAg
IGZsdXNoX3RsYl9vbmVfbG9jYWwocmV0KTsKPiArICAgICAgICByZXR1cm4gcmV0Owo+ICsgICAg
fQo+ICAKPiAgICAgIHBlcmZjX2luY3IobWFwX2RvbWFpbl9wYWdlX2NvdW50KTsKPiAgCj4gQEAg
LTE4MSw4ICsxOTcsMTMgQEAgdm9pZCB1bm1hcF9kb21haW5fcGFnZShjb25zdCB2b2lkICpwdHIp
Cj4gICAgICB1bnNpZ25lZCBsb25nIHZhID0gKHVuc2lnbmVkIGxvbmcpcHRyLCBtZm4sIGZsYWdz
Owo+ICAgICAgc3RydWN0IHZjcHVfbWFwaGFzaF9lbnRyeSAqaGFzaGVudDsKPiAgCj4gLSAgICBp
ZiAoIHZhID49IERJUkVDVE1BUF9WSVJUX1NUQVJUICkKPiArICAgIGlmICggdmEgPj0gRklYQURE
Ul9TVEFSVCAmJiB2YSA8IEZJWEFERFJfVE9QICkKPiArICAgIHsKPiArICAgICAgICBwbWFwX2xv
Y2soKTsKPiArICAgICAgICBwbWFwX3VubWFwKCh2b2lkICopcHRyKTsKPiArICAgICAgICBwbWFw
X3VubG9jaygpOwo+ICAgICAgICAgIHJldHVybjsKPiArICAgIH0KPiAgCj4gICAgICBBU1NFUlQo
dmEgPj0gTUFQQ0FDSEVfVklSVF9TVEFSVCAmJiB2YSA8IE1BUENBQ0hFX1ZJUlRfRU5EKTsKPiAg
Cj4gZGlmZiAtLWdpdCBhL3hlbi9hcmNoL3g4Ni9tbS5jIGIveGVuL2FyY2gveDg2L21tLmMKPiBp
bmRleCAxNDVjNWFiNDdjLi45NjE5MTgyZjUyIDEwMDY0NAo+IC0tLSBhL3hlbi9hcmNoL3g4Ni9t
bS5jCj4gKysrIGIveGVuL2FyY2gveDg2L21tLmMKPiBAQCAtNTk0OSw3ICs1OTQ5LDggQEAgaW50
IGNyZWF0ZV9wZXJkb21haW5fbWFwcGluZyhzdHJ1Y3QgZG9tYWluICpkLCB1bnNpZ25lZCBsb25n
IHZhLAo+ICAgICAgICAgIGlmICggcmMgfHwgIW5yIHx8ICFsMV90YWJsZV9vZmZzZXQodmEpICkK
PiAgICAgICAgICB7Cj4gICAgICAgICAgICAgIC8qIE5vdGUgdGhhdCB0aGlzIGlzIGEgbm8tb3Ag
Zm9yIHRoZSBhbGxvY194ZW5oZWFwX3BhZ2UoKSBjYXNlLiAqLwo+IC0gICAgICAgICAgICB1bm1h
cF9kb21haW5fcGFnZShsMXRhYik7Cj4gKyAgICAgICAgICAgIGlmKCAodW5zaWduZWQgbG9uZyls
MXRhYiA8IERJUkVDVE1BUF9WSVJUX1NUQVJUICkKPiArICAgICAgICAgICAgICAgIHVubWFwX2Rv
bWFpbl9wYWdlKGwxdGFiKTsKCklmIHRoaXMgaXMgYSBmaXggdG8gb25lIG9mIG15IHByZXZpb3Vz
IHBhdGNoZXMsIHBsZWFzZSBzcGxpdCB0aGUgY2hhbmdlCm91dCBhbmQgbWVyZ2UgaXQgdGhlcmUu
CgpBbmQgdGhlbiwgY2FsbCBvdXQgdGhlIGJ1ZyBmaXggaW4gdGhlIGNoYW5nZSBsb2cgZm9yIHRo
YXQgcGF0Y2guCgpXZWkuCgo+ICAgICAgICAgICAgICBsMXRhYiA9IE5VTEw7Cj4gICAgICAgICAg
fQo+ICAgICAgfQo+IC0tIAo+IDIuMTcuMQo+IAoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlz
dHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xp
c3RpbmZvL3hlbi1kZXZlbA==
