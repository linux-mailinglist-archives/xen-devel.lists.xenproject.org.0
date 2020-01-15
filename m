Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DA97D13CC86
	for <lists+xen-devel@lfdr.de>; Wed, 15 Jan 2020 19:48:47 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1irng6-0001ZN-O5; Wed, 15 Jan 2020 18:46:06 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=9sUE=3E=gmail.com=julien.grall.oss@srs-us1.protection.inumbo.net>)
 id 1irng5-0001ZI-9W
 for xen-devel@lists.xenproject.org; Wed, 15 Jan 2020 18:46:05 +0000
X-Inumbo-ID: 465a3d28-37c7-11ea-85eb-12813bfff9fa
Received: from mail-wm1-f65.google.com (unknown [209.85.128.65])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 465a3d28-37c7-11ea-85eb-12813bfff9fa;
 Wed, 15 Jan 2020 18:46:01 +0000 (UTC)
Received: by mail-wm1-f65.google.com with SMTP id d73so1098351wmd.1
 for <xen-devel@lists.xenproject.org>; Wed, 15 Jan 2020 10:46:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=EZqebl/yfbKdDKzL+YINx1RvW3NtAXN8w0jEjcd298o=;
 b=C1ydKyIA1BeRv/sJ9SbogMZugfHK/cHUe7jAAn3tKijAbfRgGSOCFCN6SCFyxH0hsh
 6TBOY/FKfrU7CO8lT/Lwkp/X+GhsfnmXppfMJR++Njwk/Df/MYkdzXN3S3wX2mnObNyh
 3RmE6u7DD8nkfr9Jvwte6c3YaLMkKqUWXSsVye8W8DD9zkLVgq46DZgfT+UEuxNJ5icv
 uPvAPQoNdWR95gXR7K0wLfyNzWf6F3jkMrbYYlqbyrqy9lneHZeDKwvYzLBFFzpixwjc
 9cz3+iVS/neZE8OFlIQhOHBakNHy2YrIVP6T3zzGbcBPBWoca2gr/0Ijmomc9ygEy+2Q
 LceQ==
X-Gm-Message-State: APjAAAW7zEivWkiYfwmyQeLCN/ELtaLNS6aGyrOCnf7tQkgHeCprO19G
 je3G+Xw/4nWfmAOhWvmGtdk=
X-Google-Smtp-Source: APXvYqxxbXv38Jbj7imI9vnQQDn5L2JDCB7/Zw5ysh+kFrTfaLhaxgS+V/wThZLFDrCmYqrNeS8NtQ==
X-Received: by 2002:a7b:cb01:: with SMTP id u1mr1302887wmj.156.1579113960312; 
 Wed, 15 Jan 2020 10:46:00 -0800 (PST)
Received: from a483e7b01a66.ant.amazon.com (54-240-197-233.amazon.com.
 [54.240.197.233])
 by smtp.gmail.com with ESMTPSA id u22sm27182709wru.30.2020.01.15.10.45.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 15 Jan 2020 10:45:59 -0800 (PST)
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20200115184358.21131-1-andrew.cooper3@citrix.com>
From: Julien Grall <julien@xen.org>
Message-ID: <db84e62b-694d-88ed-4b23-8b5df1cb0f2e@xen.org>
Date: Wed, 15 Jan 2020 18:45:59 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:68.0)
 Gecko/20100101 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200115184358.21131-1-andrew.cooper3@citrix.com>
Content-Language: en-GB
Subject: Re: [Xen-devel] [PATCH] ARM/boot: Don't poison 'current' during
 early boot
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
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGksCgpPbiAxNS8wMS8yMDIwIDE4OjQzLCBBbmRyZXcgQ29vcGVyIHdyb3RlOgo+IFRoaXMgbG9n
aWMgd2FzIGluaGVyaXRlZCBmcm9tIHg4NiAod2hpY2ggd2FzIHVwZGF0ZWQgc2V2ZXJhbCB0aW1l
cyBzaW5jZSkuCj4gVW5saWtlIHg4NiAoYXQgdGhlIHRpbWUpIGhvd2V2ZXIsIHdoaWxlIE5VTEwg
aXNuJ3QgbWFwcGVkIGluIEFSTSwgMHhmZmZmZjAwMAo+IGlzLCBtYWtpbmcgdGhpcyBhY3RpdmVs
eSBkYW5nZXJvdXMuCj4gCj4gRHJvcCB0aGUgbG9naWMgZW50aXJlbHksIGFuZCBsZWF2ZSAnY3Vy
cmVudCcgYXMgTlVMTCBkdXJpbmcgZWFybHkgYm9vdC4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBBbmRy
ZXcgQ29vcGVyIDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tPgoKVGhhbmsgeW91IGZvciB0aGUg
Y2xlYW51cCEKCkFja2VkLWJ5OiBKdWxpZW4gR3JhbGwgPGp1bGllbkB4ZW4ub3JnPgoKQ2hlZXJz
LAoKPiAtLS0KPiBDQzogU3RlZmFubyBTdGFiZWxsaW5pIDxzc3RhYmVsbGluaUBrZXJuZWwub3Jn
Pgo+IENDOiBKdWxpZW4gR3JhbGwgPGp1bGllbkB4ZW4ub3JnPgo+IENDOiBWb2xvZHlteXIgQmFi
Y2h1ayA8Vm9sb2R5bXlyX0JhYmNodWtAZXBhbS5jb20+Cj4gLS0tCj4gICB4ZW4vYXJjaC9hcm0v
c2V0dXAuYyB8IDMgLS0tCj4gICAxIGZpbGUgY2hhbmdlZCwgMyBkZWxldGlvbnMoLSkKPiAKPiBk
aWZmIC0tZ2l0IGEveGVuL2FyY2gvYXJtL3NldHVwLmMgYi94ZW4vYXJjaC9hcm0vc2V0dXAuYwo+
IGluZGV4IDNjODk5Y2Q0YTAuLjlkZDM3MzhkNDQgMTAwNjQ0Cj4gLS0tIGEveGVuL2FyY2gvYXJt
L3NldHVwLmMKPiArKysgYi94ZW4vYXJjaC9hcm0vc2V0dXAuYwo+IEBAIC03OTgsOSArNzk4LDYg
QEAgdm9pZCBfX2luaXQgc3RhcnRfeGVuKHVuc2lnbmVkIGxvbmcgYm9vdF9waHlzX29mZnNldCwK
PiAgICAgICBwZXJjcHVfaW5pdF9hcmVhcygpOwo+ICAgICAgIHNldF9wcm9jZXNzb3JfaWQoMCk7
IC8qIG5lZWRlZCBlYXJseSwgZm9yIHNtcF9wcm9jZXNzb3JfaWQoKSAqLwo+ICAgCj4gLSAgICBz
ZXRfY3VycmVudCgoc3RydWN0IHZjcHUgKikweGZmZmZmMDAwKTsgLyogZGVidWcgc2FuaXR5ICov
Cj4gLSAgICBpZGxlX3ZjcHVbMF0gPSBjdXJyZW50Owo+IC0KPiAgICAgICBzZXR1cF92aXJ0dWFs
X3JlZ2lvbnMoTlVMTCwgTlVMTCk7Cj4gICAgICAgLyogSW5pdGlhbGl6ZSB0cmFwcyBlYXJseSBh
bGxvdyB1cyB0byBnZXQgYmFja3RyYWNlIHdoZW4gYW4gZXJyb3Igb2NjdXJyZWQgKi8KPiAgICAg
ICBpbml0X3RyYXBzKCk7Cj4gCgotLSAKSnVsaWVuIEdyYWxsCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1k
ZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21h
aWxtYW4vbGlzdGluZm8veGVuLWRldmVs
