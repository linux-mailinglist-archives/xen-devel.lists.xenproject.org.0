Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D77EF146816
	for <lists+xen-devel@lfdr.de>; Thu, 23 Jan 2020 13:34:46 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iubfQ-0008Ug-Tl; Thu, 23 Jan 2020 12:33:00 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=prnW=3M=gmail.com=julien.grall.oss@srs-us1.protection.inumbo.net>)
 id 1iubfP-0008UZ-Mf
 for xen-devel@lists.xenproject.org; Thu, 23 Jan 2020 12:32:59 +0000
X-Inumbo-ID: 7ce28524-3ddc-11ea-be15-12813bfff9fa
Received: from mail-wr1-f66.google.com (unknown [209.85.221.66])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 7ce28524-3ddc-11ea-be15-12813bfff9fa;
 Thu, 23 Jan 2020 12:32:59 +0000 (UTC)
Received: by mail-wr1-f66.google.com with SMTP id y11so2875447wrt.6
 for <xen-devel@lists.xenproject.org>; Thu, 23 Jan 2020 04:32:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=cojFvA86UHO86/+CVe+aQyQwBE+vUBBKYh/xGNBlhvw=;
 b=spMgv+40U+RKz/x/2KPKol7rdT0O6vcM17brhESVKxof2tcSm6BE7hmkB0p7VvvmJg
 6YMXOU798jys5oQSLfS7SfYFyH0obukwyl6GYuH4utdS6YTjbC67yDV4xkQsw8w3Tloo
 0xmidQBnDpfvjIKAwD/CynkDSrVgzCllAwNHJy3UJHCgAADa0jbV3I/OknzwqflEgmXO
 9bcp0Ziy2RjWElYcVl2j4m4QT8SdBaXTQwvDMI/y6XmQZCv2RvOZvyDZGxwEsBukbDLP
 avYhG3Yi0uqwyryqAyyQHZm6FJea9Qva8KP9d157rvmOSIqC6AatSedlD8gMykl2gNiZ
 htmg==
X-Gm-Message-State: APjAAAU+M9+qIs4TNUQ7bAkDfM11gFXe1dpDXXQvO6Khwyt6t8so/ps3
 ADIY2Sgv2/4GqHwG8MChlAY=
X-Google-Smtp-Source: APXvYqyn/+AZ0cpZfIw7LQGemec+jyECE96W373dSP/IekCpdIVrt5UdlD30Y8ANgTy3uTG14zUudw==
X-Received: by 2002:adf:ea88:: with SMTP id s8mr17282935wrm.293.1579782778193; 
 Thu, 23 Jan 2020 04:32:58 -0800 (PST)
Received: from a483e7b01a66.ant.amazon.com (54-240-197-232.amazon.com.
 [54.240.197.232])
 by smtp.gmail.com with ESMTPSA id p15sm2363678wma.40.2020.01.23.04.32.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 23 Jan 2020 04:32:57 -0800 (PST)
To: Jeff Kubascik <jeff.kubascik@dornerworks.com>,
 xen-devel@lists.xenproject.org
References: <20200121150704.126001-1-jeff.kubascik@dornerworks.com>
 <20200121150704.126001-2-jeff.kubascik@dornerworks.com>
From: Julien Grall <julien@xen.org>
Message-ID: <78db27b5-ab04-904a-f2b8-869969fbae21@xen.org>
Date: Thu, 23 Jan 2020 12:32:56 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:68.0)
 Gecko/20100101 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200121150704.126001-2-jeff.kubascik@dornerworks.com>
Content-Language: en-GB
Subject: Re: [Xen-devel] [PATCH v4 1/2] xen/arm: remove physical timer offset
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
Cc: Stewart Hildebrand <Stewart.Hildebrand@dornerworks.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGksCgpPbiAyMS8wMS8yMDIwIDE1OjA3LCBKZWZmIEt1YmFzY2lrIHdyb3RlOgo+IFRoZSBwaHlz
aWNhbCB0aW1lciB0cmFwcyBhcHBseSBhbiBvZmZzZXQgc28gdGhhdCB0aW1lIHN0YXJ0cyBhdCAw
IGZvcgo+IHRoZSBndWVzdC4gSG93ZXZlciwgdGhpcyBvZmZzZXQgaXMgbm90IGN1cnJlbnRseSBh
cHBsaWVkIHRvIHRoZSBwaHlzaWNhbAo+IGNvdW50ZXIuIFBlciB0aGUgQVJNdjggUmVmZXJlbmNl
IE1hbnVhbCAoQVJNIERESSAwNDg3RS5hKSwgc2VjdGlvbgo+IEQxMS4yLjQgVGltZXJzLCB0aGUg
Ik9mZnNldCIgYmV0d2VlbiB0aGUgY291bnRlciBhbmQgdGltZXIgc2hvdWxkIGJlCj4gemVybyBm
b3IgYSBwaHlzaWNhbCB0aW1lci4gVGhpcyByZW1vdmVzIHRoZSBvZmZzZXQgdG8gbWFrZSB0aGUg
dGltZXIgYW5kCj4gY291bnRlciBjb25zaXN0ZW50Lgo+IAo+IFRoaXMgYWxzbyBjbGVhbnMgdXAg
dGhlIHBoeXNpY2FsIHRpbWVyIGltcGxlbWVudGF0aW9uIHRvIGJldHRlciBtYXRjaAo+IHRoZSB2
aXJ0dWFsIHRpbWVyIC0gYm90aCBjdmFsJ3Mgbm93IGhvbGQgdGhlIGhhcmR3YXJlIHZhbHVlLgo+
IAo+IFNpZ25lZC1vZmYtYnk6IEplZmYgS3ViYXNjaWsgPGplZmYua3ViYXNjaWtAZG9ybmVyd29y
a3MuY29tPgo+IC0tLQo+ICAgeGVuL2FyY2gvYXJtL3Z0aW1lci5jICAgICAgICB8IDM0ICsrKysr
KysrKysrKysrKysrKy0tLS0tLS0tLS0tLS0tLS0KPiAgIHhlbi9pbmNsdWRlL2FzbS1hcm0vZG9t
YWluLmggfCAgMyAtLS0KPiAgIDIgZmlsZXMgY2hhbmdlZCwgMTggaW5zZXJ0aW9ucygrKSwgMTkg
ZGVsZXRpb25zKC0pCj4gCj4gZGlmZiAtLWdpdCBhL3hlbi9hcmNoL2FybS92dGltZXIuYyBiL3hl
bi9hcmNoL2FybS92dGltZXIuYwo+IGluZGV4IDI0MGE4NTBiNmUuLjBjNzhhNjU4NjMgMTAwNjQ0
Cj4gLS0tIGEveGVuL2FyY2gvYXJtL3Z0aW1lci5jCj4gKysrIGIveGVuL2FyY2gvYXJtL3Z0aW1l
ci5jCj4gQEAgLTYyLDcgKzYyLDYgQEAgc3RhdGljIHZvaWQgdmlydF90aW1lcl9leHBpcmVkKHZv
aWQgKmRhdGEpCj4gICAKPiAgIGludCBkb21haW5fdnRpbWVyX2luaXQoc3RydWN0IGRvbWFpbiAq
ZCwgc3RydWN0IHhlbl9hcmNoX2RvbWFpbmNvbmZpZyAqY29uZmlnKQo+ICAgewo+IC0gICAgZC0+
YXJjaC5waHlzX3RpbWVyX2Jhc2Uub2Zmc2V0ID0gTk9XKCk7Cj4gICAgICAgZC0+YXJjaC52aXJ0
X3RpbWVyX2Jhc2Uub2Zmc2V0ID0gUkVBRF9TWVNSRUc2NChDTlRQQ1RfRUwwKTsKPiAgICAgICBk
LT50aW1lX29mZnNldC5zZWNvbmRzID0gdGlja3NfdG9fbnMoZC0+YXJjaC52aXJ0X3RpbWVyX2Jh
c2Uub2Zmc2V0IC0gYm9vdF9jb3VudCk7Cj4gICAgICAgZG9fZGl2KGQtPnRpbWVfb2Zmc2V0LnNl
Y29uZHMsIDEwMDAwMDAwMDApOwo+IEBAIC0xMDgsNyArMTA3LDYgQEAgaW50IHZjcHVfdnRpbWVy
X2luaXQoc3RydWN0IHZjcHUgKnYpCj4gICAKPiAgICAgICBpbml0X3RpbWVyKCZ0LT50aW1lciwg
cGh5c190aW1lcl9leHBpcmVkLCB0LCB2LT5wcm9jZXNzb3IpOwo+ICAgICAgIHQtPmN0bCA9IDA7
Cj4gLSAgICB0LT5jdmFsID0gTk9XKCk7Cj4gICAgICAgdC0+aXJxID0gZDAKPiAgICAgICAgICAg
PyB0aW1lcl9nZXRfaXJxKFRJTUVSX1BIWVNfTk9OU0VDVVJFX1BQSSkKPiAgICAgICAgICAgOiBH
VUVTVF9USU1FUl9QSFlTX05TX1BQSTsKPiBAQCAtMTY3LDYgKzE2NSw3IEBAIHZvaWQgdmlydF90
aW1lcl9yZXN0b3JlKHN0cnVjdCB2Y3B1ICp2KQo+ICAgc3RhdGljIGJvb2wgdnRpbWVyX2NudHBf
Y3RsKHN0cnVjdCBjcHVfdXNlcl9yZWdzICpyZWdzLCB1aW50MzJfdCAqciwgYm9vbCByZWFkKQo+
ICAgewo+ICAgICAgIHN0cnVjdCB2Y3B1ICp2ID0gY3VycmVudDsKPiArICAgIHNfdGltZV90IGV4
cGlyZXM7Cj4gICAKPiAgICAgICBpZiAoICFBQ0NFU1NfQUxMT1dFRChyZWdzLCBFTDBQVEVOKSAp
Cj4gICAgICAgICAgIHJldHVybiBmYWxzZTsKPiBAQCAtMTg0LDggKzE4Myw5IEBAIHN0YXRpYyBi
b29sIHZ0aW1lcl9jbnRwX2N0bChzdHJ1Y3QgY3B1X3VzZXJfcmVncyAqcmVncywgdWludDMyX3Qg
KnIsIGJvb2wgcmVhZCkKPiAgIAo+ICAgICAgICAgICBpZiAoIHYtPmFyY2gucGh5c190aW1lci5j
dGwgJiBDTlR4X0NUTF9FTkFCTEUgKQo+ICAgICAgICAgICB7Cj4gLSAgICAgICAgICAgIHNldF90
aW1lcigmdi0+YXJjaC5waHlzX3RpbWVyLnRpbWVyLAo+IC0gICAgICAgICAgICAgICAgICAgICAg
di0+YXJjaC5waHlzX3RpbWVyLmN2YWwgKyB2LT5kb21haW4tPmFyY2gucGh5c190aW1lcl9iYXNl
Lm9mZnNldCk7Cj4gKyAgICAgICAgICAgIGV4cGlyZXMgPSB2LT5hcmNoLnBoeXNfdGltZXIuY3Zh
bCA+IGJvb3RfY291bnQKPiArICAgICAgICAgICAgICAgICAgICAgID8gdGlja3NfdG9fbnModi0+
YXJjaC5waHlzX3RpbWVyLmN2YWwgLSBib290X2NvdW50KSA6IDA7Cj4gKyAgICAgICAgICAgIHNl
dF90aW1lcigmdi0+YXJjaC5waHlzX3RpbWVyLnRpbWVyLCBleHBpcmVzKTsKCldoaWxlIHRoZSBm
YWN0b3Jpbmcgd2FzIG9wdGlvbmFsLCBteSByZXF1ZXN0IG9mIGEgY29tbWVudCB3YXNuJ3QgKGV2
ZW4gCmlmIGl0IHJlcXVpcmVzIHRvIGR1cGxpY2F0ZSAzIHRpbWVzKS4KCklmIHlvdSBzdWdnZXN0
IGEgY29tbWVudCBhbmQgYW4gdXBkYXRlIG9mIHRoZSBjb21taXQgbWVzc2FnZSwgSSBjYW4gCm1l
cmdlIGl0IGluIHRoaXMgcGF0Y2ggb24gY29tbWl0LgoKQ2hlZXJzLAoKLS0gCkp1bGllbiBHcmFs
bAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRl
dmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9s
aXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
