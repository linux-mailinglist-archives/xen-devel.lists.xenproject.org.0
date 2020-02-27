Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AC1B172A91
	for <lists+xen-devel@lfdr.de>; Thu, 27 Feb 2020 22:55:50 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j7R4d-000535-6I; Thu, 27 Feb 2020 21:52:03 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=ONkH=4P=gmail.com=julien.grall.oss@srs-us1.protection.inumbo.net>)
 id 1j7R4b-000530-LG
 for xen-devel@lists.xenproject.org; Thu, 27 Feb 2020 21:52:01 +0000
X-Inumbo-ID: 61e6987e-59ab-11ea-97cb-12813bfff9fa
Received: from mail-wr1-f66.google.com (unknown [209.85.221.66])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 61e6987e-59ab-11ea-97cb-12813bfff9fa;
 Thu, 27 Feb 2020 21:52:01 +0000 (UTC)
Received: by mail-wr1-f66.google.com with SMTP id m16so599973wrx.11
 for <xen-devel@lists.xenproject.org>; Thu, 27 Feb 2020 13:52:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=R0hs9ow2IFFV+TWYBjMnICues241Cu1ogjgVpJVggTE=;
 b=Z89t1pdHCL1ZU59heDlUm1iefxlbQlShxjXOqf3Tm/5OIQaEKE+nd92k6I24QE2pUl
 JxDN1S6vg/X4y3APce5dLsfalt/fMMMftcu/7B8SvOiAGzhQm6EGBToUsZ95U5eh73l+
 ihv9srO8wCjBhag4GyphRr8GZGkJA2GfcQgK62qoK755tvnto7Xv+bg4f8bWit4kfZ+f
 eRFCGbsovQuDA7z4uFxunuprOjAa5ZyZ6NhGk45yqfvHylZcje430RLY3//kIkMg4eZI
 cK7ZOdWrkYxQLoh4YW1hvuI8LaOPRkj58yxfp6Gaqou8MmTwqS/tqEFwUj9i4DMJfb0m
 FXMA==
X-Gm-Message-State: APjAAAV1BQXGlzetl+Fk3HCbqHdJFmXU5cKjocjXDD2pPpFONTxt/G9+
 JTdL+Yz2dx8Gt3nH8YX+BDg=
X-Google-Smtp-Source: APXvYqxSmHZnd+bBE9h9Pu232Edsdea4wCmD0TsGWc6x53t17f8tc1afq+3+0xRsLI97eZP2Ww9Onw==
X-Received: by 2002:adf:dc86:: with SMTP id r6mr957138wrj.68.1582840320157;
 Thu, 27 Feb 2020 13:52:00 -0800 (PST)
Received: from a483e7b01a66.ant.amazon.com (54-240-197-231.amazon.com.
 [54.240.197.231])
 by smtp.gmail.com with ESMTPSA id x21sm8558756wmi.30.2020.02.27.13.51.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 27 Feb 2020 13:51:59 -0800 (PST)
To: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>,
 xen-devel@lists.xenproject.org
References: <20200211093122.5644-1-jgross@suse.com>
 <818b1594-87b3-477d-db37-4ee598793ab7@xen.org>
 <489c79ad-2bf9-e8f4-213c-00142870359a@suse.com>
From: Julien Grall <julien@xen.org>
Message-ID: <befaa397-a59f-7a38-0219-5dbdcf890b9f@xen.org>
Date: Thu, 27 Feb 2020 21:51:57 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:68.0)
 Gecko/20100101 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <489c79ad-2bf9-e8f4-213c-00142870359a@suse.com>
Content-Language: en-GB
Subject: Re: [Xen-devel] [PATCH] xen: do live patching only from main idle
 loop
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
Cc: Kevin Tian <kevin.tian@intel.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Jun Nakajima <jun.nakajima@intel.com>, Wei Liu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ross Lagerwall <ross.lagerwall@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGkgSnVlcmdlbiwKCk9uIDI2LzAyLzIwMjAgMTQ6MTcsIErDvHJnZW4gR3Jvw58gd3JvdGU6Cj4g
T24gMjQuMDIuMjAgMjM6MjUsIEp1bGllbiBHcmFsbCB3cm90ZToKPj4gSGkgSnVlcmdlbiwKPj4K
Pj4gT24gMTEvMDIvMjAyMCAwOTozMSwgSnVlcmdlbiBHcm9zcyB3cm90ZToKPj4+IGRpZmYgLS1n
aXQgYS94ZW4vYXJjaC9hcm0vdHJhcHMuYyBiL3hlbi9hcmNoL2FybS90cmFwcy5jCj4+PiBpbmRl
eCA2ZjliZWMyMmQzLi4zMGM0YzE4MzBiIDEwMDY0NAo+Pj4gLS0tIGEveGVuL2FyY2gvYXJtL3Ry
YXBzLmMKPj4+ICsrKyBiL3hlbi9hcmNoL2FybS90cmFwcy5jCj4+PiBAQCAtMjMsNyArMjMsNiBA
QAo+Pj4gwqAgI2luY2x1ZGUgPHhlbi9pb2NhcC5oPgo+Pj4gwqAgI2luY2x1ZGUgPHhlbi9pcnEu
aD4KPj4+IMKgICNpbmNsdWRlIDx4ZW4vbGliLmg+Cj4+PiAtI2luY2x1ZGUgPHhlbi9saXZlcGF0
Y2guaD4KPj4+IMKgICNpbmNsdWRlIDx4ZW4vbWVtX2FjY2Vzcy5oPgo+Pj4gwqAgI2luY2x1ZGUg
PHhlbi9tbS5oPgo+Pj4gwqAgI2luY2x1ZGUgPHhlbi9wYXJhbS5oPgo+Pj4gQEAgLTIyMzksMTEg
KzIyMzgsNiBAQCBzdGF0aWMgdm9pZCBjaGVja19mb3JfcGNwdV93b3JrKHZvaWQpCj4+PiDCoMKg
wqDCoMKgIHsKPj4+IMKgwqDCoMKgwqDCoMKgwqDCoCBsb2NhbF9pcnFfZW5hYmxlKCk7Cj4+PiDC
oMKgwqDCoMKgwqDCoMKgwqAgZG9fc29mdGlycSgpOwo+Pj4gLcKgwqDCoMKgwqDCoMKgIC8qCj4+
PiAtwqDCoMKgwqDCoMKgwqDCoCAqIE11c3QgYmUgdGhlIGxhc3Qgb25lIC0gYXMgdGhlIElQSSB3
aWxsIHRyaWdnZXIgdXMgdG8gY29tZSAKPj4+IGhlcmUKPj4+IC3CoMKgwqDCoMKgwqDCoMKgICog
YW5kIHdlIHdhbnQgdG8gcGF0Y2ggdGhlIGh5cGVydmlzb3Igd2l0aCBhbG1vc3Qgbm8gc3RhY2su
Cj4+PiAtwqDCoMKgwqDCoMKgwqDCoCAqLwo+Pj4gLcKgwqDCoMKgwqDCoMKgIGNoZWNrX2Zvcl9s
aXZlcGF0Y2hfd29yaygpOwo+Pgo+PiBUaGUgY2hlY2sgaGVyZSB3YXMgbWVhbnQgdG8gbWF0Y2gg
dGhlIHg4NiBjb3VudGVycGFydCBpbiAKPj4gcmVzZXRfc3RhY2tfYW5kX2p1bXAoKS4gSSBzdXNw
ZWN0IHlvdSBhbHNvIG5lZWQgdG8gcmVtb3ZlIGl0Lgo+IAo+IE5vdCByZWFsbHksIGFzIG9uIHg4
NiBhbGwgcmVsZXZhbnQgbm9uLWlkbGUgY2FzZXMgYXJlIGJlaW5nIHN3aXRjaGVkCj4gdG8gdXNl
IHJlc2V0X3N0YWNrX2FuZF9qdW1wX25vbHAoKS4KCkFoIHllcywgSSBtaXNzZWQgdGhhdCBiaXQu
IFRoYW5rIHlvdSBmb3IgdGhlIGV4cGxhbmF0aW9uIQoKQWNrZWQtYnk6IEp1bGllbiBHcmFsbCA8
amdyYWxsQGFtYXpvbi5jb20+CgpDaGVlcnMsCgotLSAKSnVsaWVuIEdyYWxsCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBs
aXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2pl
Y3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
