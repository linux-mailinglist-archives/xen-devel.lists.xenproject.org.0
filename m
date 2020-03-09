Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3669B17DEED
	for <lists+xen-devel@lfdr.de>; Mon,  9 Mar 2020 12:46:45 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jBGoj-0008Sk-W2; Mon, 09 Mar 2020 11:43:29 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Ocqq=42=gmail.com=julien.grall.oss@srs-us1.protection.inumbo.net>)
 id 1jBGoh-0008Sf-QU
 for xen-devel@lists.xenproject.org; Mon, 09 Mar 2020 11:43:27 +0000
X-Inumbo-ID: 30979b8a-61fb-11ea-8eb5-bc764e2007e4
Received: from mail-ed1-f66.google.com (unknown [209.85.208.66])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 30979b8a-61fb-11ea-8eb5-bc764e2007e4;
 Mon, 09 Mar 2020 11:43:27 +0000 (UTC)
Received: by mail-ed1-f66.google.com with SMTP id dc19so11613027edb.10
 for <xen-devel@lists.xenproject.org>; Mon, 09 Mar 2020 04:43:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Hp0UkxNdessdXf0F83BkAmo8ryKDcl2EyONnXD5c3xM=;
 b=avosFloUg13g2ETWY4OOAZKPFLw1tUACRCYo3sQHb+CkGS84Egfz9qcl2Pmz2el8GN
 YzsujWeryQcFUmVbzUTWDRzh9a/RIvImv+ll+U07XRb4eCixwhcoxWdmm1QbeaCfy/FQ
 DoPuIuefD036/+H/wgHzChyaH28vqA6PN2HgRBOscSJHbQ6KpYqQ8Bcb3rt4qhf0MqiP
 J59/MXQYx5H5PmwrvGtejO1/wlmKvAcSnEL9KW4NwYh24k6uwJdZ1jIBZPTF/uUyi1zB
 oVHkS3zNLqDzVy3VV3p2fMCUNr74y/uiWnC3hRUwy8gsQX9Roi6/I4sLuLbkrJXJTrGm
 dJTA==
X-Gm-Message-State: ANhLgQ14OhQoFarlBlnH2eKuo0jm7TOexqpQFwkimWOXJLVL17JPFrR5
 36AWoJpmT+t3JeydZq4zx0A=
X-Google-Smtp-Source: ADFU+vuauSEfMUHHonpwFXv0lNrGPdQbm1lPFEOP6Lk6IZqJ7NAGHL93EykYhPOCKHK6sgb4dUjLHg==
X-Received: by 2002:a05:6402:306d:: with SMTP id
 bs13mr17313881edb.3.1583754206432; 
 Mon, 09 Mar 2020 04:43:26 -0700 (PDT)
Received: from a483e7b01a66.ant.amazon.com (54-240-197-235.amazon.com.
 [54.240.197.235])
 by smtp.gmail.com with ESMTPSA id x6sm16972edl.61.2020.03.09.04.43.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 09 Mar 2020 04:43:25 -0700 (PDT)
To: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org
References: <20200226124705.29212-1-jgross@suse.com>
 <20200226124705.29212-2-jgross@suse.com>
From: Julien Grall <julien@xen.org>
Message-ID: <d3b83513-8fc2-634c-fa89-00df84c5c4fb@xen.org>
Date: Mon, 9 Mar 2020 11:43:24 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:68.0)
 Gecko/20100101 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200226124705.29212-2-jgross@suse.com>
Content-Language: en-GB
Subject: Re: [Xen-devel] [PATCH v6 01/12] xen: allow only sizeof(bool)
 variables for boolean_param()
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGkgSnVlcmdlbiwKCk9uIDI2LzAyLzIwMjAgMTI6NDYsIEp1ZXJnZW4gR3Jvc3Mgd3JvdGU6Cj4g
U3VwcG9ydCBvZiBvdGhlciB2YXJpYWJsZSBzaXplcyB0aGFuIHRoYXQgb2Ygbm9ybWFsIGJvb2wg
b25lcyBmb3IKPiBib29sZWFuX3BhcmFtZXRlcigpIGRvbid0IG1ha2Ugc2Vuc2UsIHNvIGNhdGNo
IGFueSBvdGhlciBzaXplZAo+IHZhcmlhYmxlcyBhdCBidWlsZCB0aW1lLgo+IAo+IEZpeCB0aGUg
b25lIHBhcmFtZXRlciB1c2luZyBhIHBsYWluIGludCBpbnN0ZWFkIG9mIGJvb2wuCj4gCj4gU2ln
bmVkLW9mZi1ieTogSnVlcmdlbiBHcm9zcyA8amdyb3NzQHN1c2UuY29tPgo+IC0tLQo+IFY2Ogo+
IC0gbmV3IHBhdGNoCj4gLS0tCj4gICB4ZW4vYXJjaC94ODYvaHZtL2FzaWQuYyB8IDIgKy0KPiAg
IHhlbi9pbmNsdWRlL3hlbi9wYXJhbS5oIHwgOCArKysrKystLQo+ICAgMiBmaWxlcyBjaGFuZ2Vk
LCA3IGluc2VydGlvbnMoKyksIDMgZGVsZXRpb25zKC0pCj4gCj4gZGlmZiAtLWdpdCBhL3hlbi9h
cmNoL3g4Ni9odm0vYXNpZC5jIGIveGVuL2FyY2gveDg2L2h2bS9hc2lkLmMKPiBpbmRleCA4ZTAw
YTI4NDQzLi44YjViYjg2ZGZkIDEwMDY0NAo+IC0tLSBhL3hlbi9hcmNoL3g4Ni9odm0vYXNpZC5j
Cj4gKysrIGIveGVuL2FyY2gveDg2L2h2bS9hc2lkLmMKPiBAQCAtMjUsNyArMjUsNyBAQAo+ICAg
I2luY2x1ZGUgPGFzbS9odm0vYXNpZC5oPgo+ICAgCj4gICAvKiBYZW4gY29tbWFuZC1saW5lIG9w
dGlvbiB0byBlbmFibGUgQVNJRHMgKi8KPiAtc3RhdGljIGludCBvcHRfYXNpZF9lbmFibGVkID0g
MTsKPiArc3RhdGljIGJvb2wgb3B0X2FzaWRfZW5hYmxlZCA9IHRydWU7Cj4gICBib29sZWFuX3Bh
cmFtKCJhc2lkIiwgb3B0X2FzaWRfZW5hYmxlZCk7Cj4gICAKPiAgIC8qCj4gZGlmZiAtLWdpdCBh
L3hlbi9pbmNsdWRlL3hlbi9wYXJhbS5oIGIveGVuL2luY2x1ZGUveGVuL3BhcmFtLmgKPiBpbmRl
eCA3NTQ3MWViNGFkLi5kNDU3OGNkMjdmIDEwMDY0NAo+IC0tLSBhL3hlbi9pbmNsdWRlL3hlbi9w
YXJhbS5oCj4gKysrIGIveGVuL2luY2x1ZGUveGVuL3BhcmFtLmgKPiBAQCAtMiw2ICsyLDggQEAK
PiAgICNkZWZpbmUgX1hFTl9QQVJBTV9ICj4gICAKPiAgICNpbmNsdWRlIDx4ZW4vaW5pdC5oPgo+
ICsjaW5jbHVkZSA8eGVuL2xpYi5oPgo+ICsjaW5jbHVkZSA8eGVuL3N0ZGJvb2wuaD4KPiAgIAo+
ICAgLyoKPiAgICAqIFVzZWQgZm9yIGtlcm5lbCBjb21tYW5kIGxpbmUgcGFyYW1ldGVyIHNldHVw
Cj4gQEAgLTQ2LDcgKzQ4LDggQEAgZXh0ZXJuIGNvbnN0IHN0cnVjdCBrZXJuZWxfcGFyYW0gX19w
YXJhbV9zdGFydFtdLCBfX3BhcmFtX2VuZFtdOwo+ICAgICAgIF9fa3BhcmFtIF9fc2V0dXBfIyNf
dmFyID0gXAo+ICAgICAgICAgICB7IC5uYW1lID0gX19zZXR1cF9zdHJfIyNfdmFyLCBcCj4gICAg
ICAgICAgICAgLnR5cGUgPSBPUFRfQk9PTCwgXAo+IC0gICAgICAgICAgLmxlbiA9IHNpemVvZihf
dmFyKSwgXAo+ICsgICAgICAgICAgLmxlbiA9IHNpemVvZihfdmFyKSArIFwKPiArICAgICAgICAg
ICAgICAgICBCVUlMRF9CVUdfT05fWkVSTyhzaXplb2YoX3ZhcikgIT0gc2l6ZW9mKGJvb2wpKSwg
XAoKIEZyb20gbXkgdW5kZXJzdGFuZGluZywgc2l6ZW9mKGJvb2wpIGlzIG5vdCBuZWNlc3Nhcmls
eSAxIChpdCBjYW4gYmUgCmdyZWF0ZXIpLiBXaGlsZSB0aGlzIGlzIGZpbmUgdG8gdXNlIGl0IGlu
IFhlbiwgSSB0aGluayB3ZSB3YW50IGl0IHRvIAphbHdheXMgYmUgb25lIHdoZW4gZXhwb3NlZCBp
biB0aGUgaHlwZnMuCgo+ICAgICAgICAgICAgIC5wYXIudmFyID0gJl92YXIgfQo+ICAgI2RlZmlu
ZSBpbnRlZ2VyX3BhcmFtKF9uYW1lLCBfdmFyKSBcCj4gICAgICAgX19zZXR1cF9zdHIgX19zZXR1
cF9zdHJfIyNfdmFyW10gPSBfbmFtZTsgXAo+IEBAIC04Niw3ICs4OSw4IEBAIGV4dGVybiBjb25z
dCBzdHJ1Y3Qga2VybmVsX3BhcmFtIF9fcGFyYW1fc3RhcnRbXSwgX19wYXJhbV9lbmRbXTsKPiAg
ICAgICBfX3J0cGFyYW0gX19ydHBhcl8jI192YXIgPSBcCj4gICAgICAgICAgIHsgLm5hbWUgPSBf
bmFtZSwgXAo+ICAgICAgICAgICAgIC50eXBlID0gT1BUX0JPT0wsIFwKPiAtICAgICAgICAgIC5s
ZW4gPSBzaXplb2YoX3ZhciksIFwKPiArICAgICAgICAgIC5sZW4gPSBzaXplb2YoX3ZhcikgKyBc
Cj4gKyAgICAgICAgICAgICAgICAgQlVJTERfQlVHX09OX1pFUk8oc2l6ZW9mKF92YXIpICE9IHNp
emVvZihib29sKSksIFwKPiAgICAgICAgICAgICAucGFyLnZhciA9ICZfdmFyIH0KPiAgICNkZWZp
bmUgaW50ZWdlcl9ydW50aW1lX29ubHlfcGFyYW0oX25hbWUsIF92YXIpIFwKPiAgICAgICBfX3J0
cGFyYW0gX19ydHBhcl8jI192YXIgPSBcCj4gCgpDaGVlcnMsCgotLSAKSnVsaWVuIEdyYWxsCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwg
bWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3Rz
LnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
