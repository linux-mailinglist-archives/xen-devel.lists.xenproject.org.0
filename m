Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9458F10D7AB
	for <lists+xen-devel@lfdr.de>; Fri, 29 Nov 2019 16:09:32 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iahph-0006wa-Np; Fri, 29 Nov 2019 15:05:21 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=z6ZB=ZV=gmail.com=julien.grall.oss@srs-us1.protection.inumbo.net>)
 id 1iahpf-0006vn-Oa
 for xen-devel@lists.xenproject.org; Fri, 29 Nov 2019 15:05:19 +0000
X-Inumbo-ID: a6a6d1f6-12b9-11ea-a55d-bc764e2007e4
Received: from mail-wm1-f67.google.com (unknown [209.85.128.67])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id a6a6d1f6-12b9-11ea-a55d-bc764e2007e4;
 Fri, 29 Nov 2019 15:05:16 +0000 (UTC)
Received: by mail-wm1-f67.google.com with SMTP id n5so15447036wmc.0
 for <xen-devel@lists.xenproject.org>; Fri, 29 Nov 2019 07:05:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=pZkLmZsrqg1ZnWrCcircX/cCYDfgls/suzoB3wFMSt8=;
 b=Hq+pUrvCBn/BtbaK8g5UPdbv/ZLToq4yVqx5Dr89mQpumkNm9r6SG0i0W8Urgucx1Q
 ihwm8qMqTopha9CXdZsEbriGmSIUFTlc3g9onxdixI3870fymml87AQG6+svyoB9q3uA
 jZ9dPQKxw0Da4rkG7JJ4lMzw8TTukej73Twjrxe203RaDwjMgCzsW2QqJO7oqSQV4mPR
 Loc/pp9kgKJiZcnrkl+QJ/J/X/LS+9VYEdjAMZRaso78N8Vk271v3sFfikJCW+udlLF+
 PJ7ffx+fmeGR0EHFjLQqnaSO4h8YsncD+WKuPx5TKIZoFwXg4wLBh0P5qBwr7TQ2reJP
 YRsg==
X-Gm-Message-State: APjAAAVeiKiw0HXDSMd8MszEKUAvQyG53J9xI0Sb3ERrU7eqAEqA26KP
 zp+DAQe0GNJb9s1gsIefdTE=
X-Google-Smtp-Source: APXvYqwT6VfzJAERtpYV8+32n7D+mlAnpiG8/vdvqUfElCD9W0Nhlic8udiNMZcbdIiCFN37E1HUpA==
X-Received: by 2002:a7b:c19a:: with SMTP id y26mr14066014wmi.152.1575039913718; 
 Fri, 29 Nov 2019 07:05:13 -0800 (PST)
Received: from a483e7b01a66.ant.amazon.com (54-240-197-236.amazon.com.
 [54.240.197.236])
 by smtp.gmail.com with ESMTPSA id a15sm29699212wrx.81.2019.11.29.07.05.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 29 Nov 2019 07:05:13 -0800 (PST)
To: Pavel Tatashin <pasha.tatashin@soleen.com>, jmorris@namei.org,
 sashal@kernel.org, linux-kernel@vger.kernel.org, catalin.marinas@arm.com,
 will@kernel.org, steve.capper@arm.com, linux-arm-kernel@lists.infradead.org,
 marc.zyngier@arm.com, james.morse@arm.com, vladimir.murzin@arm.com,
 mark.rutland@arm.com, tglx@linutronix.de, gregkh@linuxfoundation.org,
 allison@lohutok.net, info@metux.net, alexios.zavras@intel.com,
 sstabellini@kernel.org, boris.ostrovsky@oracle.com, jgross@suse.com,
 stefan@agner.ch, yamada.masahiro@socionext.com,
 xen-devel@lists.xenproject.org, linux@armlinux.org.uk
References: <20191127184453.229321-1-pasha.tatashin@soleen.com>
 <20191127184453.229321-2-pasha.tatashin@soleen.com>
From: Julien Grall <julien@xen.org>
Message-ID: <957930d0-8317-9086-c7a1-8de857f358c2@xen.org>
Date: Fri, 29 Nov 2019 15:05:11 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:68.0)
 Gecko/20100101 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <20191127184453.229321-2-pasha.tatashin@soleen.com>
Content-Language: en-GB
Subject: Re: [Xen-devel] [PATCH 1/3] arm/arm64/xen: use C inlines for
 privcmd_call
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGksCgpPbiAyNy8xMS8yMDE5IDE4OjQ0LCBQYXZlbCBUYXRhc2hpbiB3cm90ZToKPiBkaWZmIC0t
Z2l0IGEvYXJjaC9hcm02NC9pbmNsdWRlL2FzbS94ZW4vaHlwZXJjYWxsLmggYi9hcmNoL2FybTY0
L2luY2x1ZGUvYXNtL3hlbi9oeXBlcmNhbGwuaAo+IGluZGV4IDM1MjJjYmFlZDMxNi4uMWE3NGZi
Mjg2MDdmIDEwMDY0NAo+IC0tLSBhL2FyY2gvYXJtNjQvaW5jbHVkZS9hc20veGVuL2h5cGVyY2Fs
bC5oCj4gKysrIGIvYXJjaC9hcm02NC9pbmNsdWRlL2FzbS94ZW4vaHlwZXJjYWxsLmgKPiBAQCAt
MSArMSwyOSBAQAo+ICsjaWZuZGVmIF9BU01fQVJNNjRfWEVOX0hZUEVSQ0FMTF9ICj4gKyNkZWZp
bmUgX0FTTV9BUk02NF9YRU5fSFlQRVJDQUxMX0gKPiAgICNpbmNsdWRlIDx4ZW4vYXJtL2h5cGVy
Y2FsbC5oPgo+ICsjaW5jbHVkZSA8bGludXgvdWFjY2Vzcy5oPgo+ICsKPiArc3RhdGljIGlubGlu
ZSBsb25nIHByaXZjbWRfY2FsbCh1bnNpZ25lZCBpbnQgY2FsbCwgdW5zaWduZWQgbG9uZyBhMSwK
PiArCQkJCXVuc2lnbmVkIGxvbmcgYTIsIHVuc2lnbmVkIGxvbmcgYTMsCj4gKwkJCQl1bnNpZ25l
ZCBsb25nIGE0LCB1bnNpZ25lZCBsb25nIGE1KQoKSSByZWFsaXplIHRoYXQgcHJpdmNtZF9jYWxs
IGlzIHRoZSBvbmx5IGh5cGVyY2FsbCB1c2luZyBTb2Z0d2FyZSBQQU4gYXQgCnRoZSBtb21lbnQu
IEhvd2V2ZXIsIGRtX29wIG5lZWRzIHRoZSBzYW1lIGFzIGh5cGVyY2FsbCB3aWxsIGJlIGlzc3Vl
ZCAKZnJvbSB1c2Vyc3BhY2UgYXMgd2VsbC4KClNvIEkgd2FzIHdvbmRlcmluZyB3aGV0aGVyIHdl
IHNob3VsZCBjcmVhdGUgYSBnZW5lcmljIGZ1bmN0aW9uIChlLmcuIApkb194ZW5faHlwZXJjYWxs
KCkgb3IgZG9feGVuX3VzZXJfaHlwZXJjYWxsKCkpIHRvIGNvdmVyIHRoZSB0d28gaHlwZXJjYWxs
cz8KCj4gZGlmZiAtLWdpdCBhL2luY2x1ZGUveGVuL2FybS9oeXBlcmNhbGwuaCBiL2luY2x1ZGUv
eGVuL2FybS9oeXBlcmNhbGwuaAo+IGluZGV4IGI0MDQ4NWU1NGQ4MC4uNjI0YzhhZDdlNDJhIDEw
MDY0NAo+IC0tLSBhL2luY2x1ZGUveGVuL2FybS9oeXBlcmNhbGwuaAo+ICsrKyBiL2luY2x1ZGUv
eGVuL2FybS9oeXBlcmNhbGwuaAo+IEBAIC0zMCw4ICszMCw4IEBACj4gICAgKiBJTiBUSEUgU09G
VFdBUkUuCj4gICAgKi8KPiAgIAo+IC0jaWZuZGVmIF9BU01fQVJNX1hFTl9IWVBFUkNBTExfSAo+
IC0jZGVmaW5lIF9BU01fQVJNX1hFTl9IWVBFUkNBTExfSAo+ICsjaWZuZGVmIF9BUk1fWEVOX0hZ
UEVSQ0FMTF9ICj4gKyNkZWZpbmUgX0FSTV9YRU5fSFlQRVJDQUxMX0gKClRoaXMgY2hhbmdlIGZl
ZWxzIGEgYml0IG91dCBvZiBjb250ZXh0LiBDb3VsZCB5b3Ugc3BsaXQgaXQgaW4gYSBzZXBhcmF0
ZSAKcGF0Y2g/Cgo+ICAgCj4gICAjaW5jbHVkZSA8bGludXgvYnVnLmg+Cj4gICAKPiBAQCAtNDEs
OSArNDEsOSBAQAo+ICAgCj4gICBzdHJ1Y3QgeGVuX2RtX29wX2J1ZjsKPiAgIAo+IC1sb25nIHBy
aXZjbWRfY2FsbCh1bnNpZ25lZCBjYWxsLCB1bnNpZ25lZCBsb25nIGExLAo+IC0JCXVuc2lnbmVk
IGxvbmcgYTIsIHVuc2lnbmVkIGxvbmcgYTMsCj4gLQkJdW5zaWduZWQgbG9uZyBhNCwgdW5zaWdu
ZWQgbG9uZyBhNSk7Cj4gK2xvbmcgYXJjaF9wcml2Y21kX2NhbGwodW5zaWduZWQgaW50IGNhbGws
IHVuc2lnbmVkIGxvbmcgYTEsCj4gKwkJICAgICAgIHVuc2lnbmVkIGxvbmcgYTIsIHVuc2lnbmVk
IGxvbmcgYTMsCj4gKwkJICAgICAgIHVuc2lnbmVkIGxvbmcgYTQsIHVuc2lnbmVkIGxvbmcgYTUp
Owo+ICAgaW50IEhZUEVSVklTT1JfeGVuX3ZlcnNpb24oaW50IGNtZCwgdm9pZCAqYXJnKTsKPiAg
IGludCBIWVBFUlZJU09SX2NvbnNvbGVfaW8oaW50IGNtZCwgaW50IGNvdW50LCBjaGFyICpzdHIp
Owo+ICAgaW50IEhZUEVSVklTT1JfZ3JhbnRfdGFibGVfb3AodW5zaWduZWQgaW50IGNtZCwgdm9p
ZCAqdW9wLCB1bnNpZ25lZCBpbnQgY291bnQpOwo+IEBAIC04OCw0ICs4OCw0IEBAIE1VTFRJX21t
dV91cGRhdGUoc3RydWN0IG11bHRpY2FsbF9lbnRyeSAqbWNsLCBzdHJ1Y3QgbW11X3VwZGF0ZSAq
cmVxLAo+ICAgCUJVRygpOwo+ICAgfQo+ICAgCj4gLSNlbmRpZiAvKiBfQVNNX0FSTV9YRU5fSFlQ
RVJDQUxMX0ggKi8KPiArI2VuZGlmIC8qIF9BUk1fWEVOX0hZUEVSQ0FMTF9IICovCj4gCgpDaGVl
cnMsCgotLSAKSnVsaWVuIEdyYWxsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5w
cm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8v
eGVuLWRldmVs
