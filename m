Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7085718883E
	for <lists+xen-devel@lfdr.de>; Tue, 17 Mar 2020 15:54:57 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jEDZa-0007v2-Pk; Tue, 17 Mar 2020 14:52:02 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=5Yf1=5C=gmail.com=julien.grall.oss@srs-us1.protection.inumbo.net>)
 id 1jEDZZ-0007ux-L4
 for xen-devel@lists.xenproject.org; Tue, 17 Mar 2020 14:52:01 +0000
X-Inumbo-ID: db58cc74-685e-11ea-b34e-bc764e2007e4
Received: from mail-ed1-f66.google.com (unknown [209.85.208.66])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id db58cc74-685e-11ea-b34e-bc764e2007e4;
 Tue, 17 Mar 2020 14:52:00 +0000 (UTC)
Received: by mail-ed1-f66.google.com with SMTP id dc19so26820468edb.10
 for <xen-devel@lists.xenproject.org>; Tue, 17 Mar 2020 07:52:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=bbAvTHKS+vk6telA8Lmr9Xi9jVygQrwNl+MZ6+vMpLE=;
 b=XleBJ82+Pvi2ExoeSniI+YEmzLcjv5UP7W7W/0mIAg+5KtRwaBEOaVKbiV1+Z34zJB
 D8qCm/NEbec2pcxcqV20LW7aCZLIJborfqQ1gJp0uyWG8XIQ4zG86Pc5GzkTH1hEhoC0
 z7baHKMaxbqXAQI4otKbbIAsKQu60RBRtYUX65JtsrTqAqXAWgxLjh0JhHlAVCRerMhr
 r8whcsO/7HSpDHomlNE3BG0nVt/YZpYesO74+NuxM64ooqAEXey6RNkqg4WasAnQw5of
 KufGicciuoFooHDpyCqW+BRqbXbtSVMwWyiuIkFPRTElqSbIvkGLh4bUc5ZUW+z9x/ru
 9NpQ==
X-Gm-Message-State: ANhLgQ0yyL3RkSzpUjKvE0nL+5BlrCeQQtw/Ihb+9l/Y0m6HQiIBLJU8
 OXovTS6LowAz+DXYcUezP2c=
X-Google-Smtp-Source: ADFU+vu09ftUUDcjhOKFtfWTgHTVvngALe7qXQQ8YTUoET3z30+Dpys25IfECxRkDBKr+lNOAqDQww==
X-Received: by 2002:a17:907:1114:: with SMTP id
 qu20mr3730296ejb.129.1584456719991; 
 Tue, 17 Mar 2020 07:51:59 -0700 (PDT)
Received: from a483e7b01a66.ant.amazon.com (54-240-197-232.amazon.com.
 [54.240.197.232])
 by smtp.gmail.com with ESMTPSA id t13sm223271edw.49.2020.03.17.07.51.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 17 Mar 2020 07:51:59 -0700 (PDT)
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <c50fc4e8-cb96-74a1-de2b-9e83e609db1c@suse.com>
 <e2734a4d-fb92-55e7-c08b-423f38049776@suse.com>
From: Julien Grall <julien@xen.org>
Message-ID: <90626b95-7549-551d-947c-36a1defe3542@xen.org>
Date: Tue, 17 Mar 2020 14:51:58 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:68.0)
 Gecko/20100101 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <e2734a4d-fb92-55e7-c08b-423f38049776@suse.com>
Content-Language: en-GB
Subject: Re: [Xen-devel] [PATCH 1/2] libfdt: Fix undefined behaviour in
 fdt_offset_ptr()
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
Cc: Stefano Stabellini <sstabellini@kernel.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGkgSmFuLAoKT24gMTMvMDMvMjAyMCAwNzozNSwgSmFuIEJldWxpY2ggd3JvdGU6Cj4gRnJvbTog
RGF2aWQgR2lic29uIDxkYXZpZEBnaWJzb24uZHJvcGJlYXIuaWQuYXU+Cj4gCj4gVXNpbmcgcG9p
bnRlciBhcml0aG1ldGljIHRvIGdlbmVyYXRlIGEgcG9pbnRlciBvdXRzaWRlIGEga25vd24gb2Jq
ZWN0IGlzLAo+IHRlY2huaWNhbGx5LCB1bmRlZmluZWQgYmVoYXZpb3VyIGluIEMuICBVbmZvcnR1
bmF0ZWx5LCB3ZSB3ZXJlIHVzaW5nIHRoYXQKPiBpbiBmZHRfb2Zmc2V0X3B0cigpIHRvIGRldGVj
dCBvdmVyZmxvd3MuCj4gCj4gVG8gZml4IHRoaXMgd2UgbmVlZCB0byBkbyBvdXIgYm91bmRzIC8g
b3ZlcmZsb3cgY2hlY2tpbmcgb24gdGhlIG9mZnNldHMKPiBiZWZvcmUgY29uc3RydWN0aW5nIHBv
aW50ZXJzIGZyb20gdGhlbS4KPiAKPiBSZXBvcnRlZC1ieTogRGF2aWQgQmluZGVybWFuIDxkY2Iz
MTRAaG90bWFpbC5jb20+Cj4gU2lnbmVkLW9mZi1ieTogRGF2aWQgR2lic29uIDxkYXZpZEBnaWJz
b24uZHJvcGJlYXIuaWQuYXU+Cj4gW3Vwc3RyZWFtIGNvbW1pdCBkMGIzYWIwYTBmNDZhYzkyOWI0
NzEzZGE0NmY3ZmRjZDg5M2RkM2JkXQo+IFNpZ25lZC1vZmYtYnk6IEphbiBCZXVsaWNoIDxqYmV1
bGljaEBzdXNlLmNvbT4KCkFja2VkLWJ5OiBKdWxpZW4gR3JhbGwgPGpncmFsbEBhbWF6b24uY29t
PgoKQ2hlZXJzLAoKPiAKPiAtLS0gYS94ZW4vY29tbW9uL2xpYmZkdC9mZHQuYwo+ICsrKyBiL3hl
bi9jb21tb24vbGliZmR0L2ZkdC5jCj4gQEAgLTc0LDE4ICs3NCwxOSBAQCBpbnQgZmR0X2NoZWNr
X2hlYWRlcihjb25zdCB2b2lkICpmZHQpCj4gICAKPiAgIGNvbnN0IHZvaWQgKmZkdF9vZmZzZXRf
cHRyKGNvbnN0IHZvaWQgKmZkdCwgaW50IG9mZnNldCwgdW5zaWduZWQgaW50IGxlbikKPiAgIHsK
PiAtCWNvbnN0IGNoYXIgKnA7Cj4gKwl1bnNpZ25lZCBhYnNvZmZzZXQgPSBvZmZzZXQgKyBmZHRf
b2ZmX2R0X3N0cnVjdChmZHQpOwo+ICsKPiArCWlmICgoYWJzb2Zmc2V0IDwgb2Zmc2V0KQo+ICsJ
ICAgIHx8ICgoYWJzb2Zmc2V0ICsgbGVuKSA8IGFic29mZnNldCkKPiArCSAgICB8fCAoYWJzb2Zm
c2V0ICsgbGVuKSA+IGZkdF90b3RhbHNpemUoZmR0KSkKPiArCQlyZXR1cm4gTlVMTDsKPiAgIAo+
ICAgCWlmIChmZHRfdmVyc2lvbihmZHQpID49IDB4MTEpCj4gICAJCWlmICgoKG9mZnNldCArIGxl
bikgPCBvZmZzZXQpCj4gICAJCSAgICB8fCAoKG9mZnNldCArIGxlbikgPiBmZHRfc2l6ZV9kdF9z
dHJ1Y3QoZmR0KSkpCj4gICAJCQlyZXR1cm4gTlVMTDsKPiAgIAo+IC0JcCA9IF9mZHRfb2Zmc2V0
X3B0cihmZHQsIG9mZnNldCk7Cj4gLQo+IC0JaWYgKHAgKyBsZW4gPCBwKQo+IC0JCXJldHVybiBO
VUxMOwo+IC0JcmV0dXJuIHA7Cj4gKwlyZXR1cm4gX2ZkdF9vZmZzZXRfcHRyKGZkdCwgb2Zmc2V0
KTsKPiAgIH0KPiAgIAo+ICAgdWludDMyX3QgZmR0X25leHRfdGFnKGNvbnN0IHZvaWQgKmZkdCwg
aW50IHN0YXJ0b2Zmc2V0LCBpbnQgKm5leHRvZmZzZXQpCj4gCgotLSAKSnVsaWVuIEdyYWxsCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwg
bWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3Rz
LnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
