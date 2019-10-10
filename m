Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C85DCD2DC0
	for <lists+xen-devel@lfdr.de>; Thu, 10 Oct 2019 17:30:49 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iIaLq-0008QE-C9; Thu, 10 Oct 2019 15:27:38 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=QV7c=YD=gmail.com=olekstysh@srs-us1.protection.inumbo.net>)
 id 1iIaLp-0008Q9-IE
 for xen-devel@lists.xenproject.org; Thu, 10 Oct 2019 15:27:37 +0000
X-Inumbo-ID: 7c99b2ac-eb72-11e9-beca-bc764e2007e4
Received: from mail-lf1-x141.google.com (unknown [2a00:1450:4864:20::141])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 7c99b2ac-eb72-11e9-beca-bc764e2007e4;
 Thu, 10 Oct 2019 15:27:36 +0000 (UTC)
Received: by mail-lf1-x141.google.com with SMTP id c195so4704610lfg.9
 for <xen-devel@lists.xenproject.org>; Thu, 10 Oct 2019 08:27:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=18e9FlkqS3w+q/V1P+wi5vesmZMTmRGT1yBbHME5gKQ=;
 b=m9AiRMJbJuUEmU/2HFoe6NpNvBAUkHAPzMBNVA8dvUFZ1XhzEl2BQj+ICJy6jL5Xd+
 LqSornNk5dZ8ZWdUoYzAKK9mKVKO5F+4rEYJXBuW7FN5VZgwvHvkCe6lUbyJ+pp1g3f3
 9+e35iDfzBDzkNSdSMLbn+pqWKRCGyD+EzdnEwK0FsOj48S0Nxpm/P/QW20DKqMlf7OX
 5MvcEUTnzU4aejaX/vxfCsPTtfBJaLv289e1qU3KKIWLRMR++6qPpaYSUGL18wSeSedy
 gOjvzv7AhnkxNUaGHVGFfewo3CT5mFrL7wywfu65r1XDAWrCYUGheosdTGrAkNRrC7+l
 5QQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=18e9FlkqS3w+q/V1P+wi5vesmZMTmRGT1yBbHME5gKQ=;
 b=ioTR7R10H75KEn6qlUb8alZLrKbGwkobll9NL/UK6XU60O5SwLGmmU+5b5r4kVvQD6
 2sY+ryXvlg+ggAH3g/CrqqZrbQKancQ/g0am/u5hUb9HKlAOlTfPyrWj/0NPpYpRA5xK
 kCZEJJu5D9BLp8/RgLThhJLeu9K7CKFxd2fbqCVM37htftjm9qYakIob9wDnsRakSR5B
 OGXna0M1JbtjdrW/eG+EP9hPXKb8cQZSUKpsUYejFHnxnX50iuTbQf9QGdzWJ98LjLY8
 0YhhPmf6XySuAfvmepAT9QrgVP3iq8l1IAN76uB+kIj/L77EfLQq+wgXuYEcyvaNOhe4
 GHNA==
X-Gm-Message-State: APjAAAW7h7UJZZUsXf9UR+rYKdUNZLoDtVmqYGTNUa9HIQdJNqSHObqF
 ZWqfgYrqfH+bYfKXOcRfZho=
X-Google-Smtp-Source: APXvYqy9OInfnyOJnzbraDhe0w81p41rR7GlhADahyE1SDXmuALsUULT++NW9jBITFlx6qk61WikYg==
X-Received: by 2002:a19:ad4c:: with SMTP id s12mr6669456lfd.49.1570721255252; 
 Thu, 10 Oct 2019 08:27:35 -0700 (PDT)
Received: from [10.17.182.120] (ll-22.209.223.85.sovam.net.ua. [85.223.209.22])
 by smtp.gmail.com with ESMTPSA id b25sm1444856ljj.36.2019.10.10.08.27.33
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 10 Oct 2019 08:27:34 -0700 (PDT)
To: Julien Grall <julien.grall@arm.com>, xen-devel@lists.xenproject.org
References: <1570548304-12020-1-git-send-email-olekstysh@gmail.com>
 <948ee2a4-8a6a-57d5-3358-e0d6217624cb@arm.com>
From: Oleksandr <olekstysh@gmail.com>
Message-ID: <94356055-721d-91bf-ac16-462da510007f@gmail.com>
Date: Thu, 10 Oct 2019 18:27:33 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <948ee2a4-8a6a-57d5-3358-e0d6217624cb@arm.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH for-4.13 v2] xen/arm: domain_build: Don't
 expose IOMMU specific properties to hwdom
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
Cc: Juergen Gross <jgross@suse.com>,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>, sstabellini@kernel.org,
 volodymyr_babchuk@epam.com
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Ck9uIDEwLjEwLjE5IDE4OjE4LCBKdWxpZW4gR3JhbGwgd3JvdGU6Cj4gSGksCgpIaSBKdWxpZW4K
Cgo+Cj4gT24gMTAvOC8xOSA0OjI1IFBNLCBPbGVrc2FuZHIgVHlzaGNoZW5rbyB3cm90ZToKPj4g
RnJvbTogT2xla3NhbmRyIFR5c2hjaGVua28gPG9sZWtzYW5kcl90eXNoY2hlbmtvQGVwYW0uY29t
Pgo+Pgo+PiBXZSBkb24ndCBwYXNzdGhyb3VnaCBJT01NVSBkZXZpY2UgdG8gaHdkb20gZXZlbiBp
ZiBpdCBpcyBub3QgdXNlZCBieSAKPj4gWGVuLgo+PiBUaGVyZWZvcmUgZXhwb3NpbmcgdGhlIHBy
b3BlcnRpZXMgdGhhdCBkZXNjcmliZSByZWxhdGlvbnNoaXAgYmV0d2Vlbgo+PiBtYXN0ZXIgZGV2
aWNlcyBhbmQgSU9NTVVzIGRvZXMgbm90IG1ha2UgYW55IHNlbnNlLgo+Pgo+PiBBY2NvcmRpbmcg
dG8gdGhlOgo+PiAxLiBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvaW9tbXUvaW9t
bXUudHh0Cj4+IDIuIERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9wY2kvcGNpLWlv
bW11LnR4dAo+Cj4gSXQgaXMgbm90IGVudGlyZWx5IGNsZWFyIHRoYXQgZG9jdW1lbnRhdGlvbiBp
cyBmcm9tIExpbnV4LgoKV2lsbCBjbGFyaWZ5LgoKCj4KPj4KPj4gU2lnbmVkLW9mZi1ieTogT2xl
a3NhbmRyIFR5c2hjaGVua28gPG9sZWtzYW5kcl90eXNoY2hlbmtvQGVwYW0uY29tPgo+Pgo+PiAt
LS0KPj4gQ2hhbmdlcyBWMSBbMV0gLT4gVjI6Cj4+IMKgwqDCoCAtIE9ubHkgc2tpcCBJT01NVSBz
cGVjaWZpYyBwcm9wZXJ0aWVzIG9mIHRoZSBtYXN0ZXIgZGV2aWNlIGlmIHdlCj4+IMKgwqDCoMKg
wqAgc2tpcCB0aGUgY29ycmVzcG9uZGluZyBJT01NVSBkZXZpY2UKPj4gwqDCoMKgIC0gVXNlICJo
d2RvbSIgb3ZlciAiRG9tMCIKPj4KPj4gWzFdIAo+PiBodHRwczovL2xpc3RzLnhlbnByb2plY3Qu
b3JnL2FyY2hpdmVzL2h0bWwveGVuLWRldmVsLzIwMTktMTAvbXNnMDAxMDQuaHRtbAo+PiAtLS0K
Pj4gwqAgeGVuL2FyY2gvYXJtL2RvbWFpbl9idWlsZC5jIHwgMjkgKysrKysrKysrKysrKysrKysr
KysrKysrKysrKysKPj4gwqAgMSBmaWxlIGNoYW5nZWQsIDI5IGluc2VydGlvbnMoKykKPj4KPj4g
ZGlmZiAtLWdpdCBhL3hlbi9hcmNoL2FybS9kb21haW5fYnVpbGQuYyBiL3hlbi9hcmNoL2FybS9k
b21haW5fYnVpbGQuYwo+PiBpbmRleCA2ZDZkZDUyLi5hNzMyMWI4IDEwMDY0NAo+PiAtLS0gYS94
ZW4vYXJjaC9hcm0vZG9tYWluX2J1aWxkLmMKPj4gKysrIGIveGVuL2FyY2gvYXJtL2RvbWFpbl9i
dWlsZC5jCj4+IEBAIC00ODAsMTAgKzQ4MCwyNiBAQCBzdGF0aWMgaW50IF9faW5pdCB3cml0ZV9w
cm9wZXJ0aWVzKHN0cnVjdCAKPj4gZG9tYWluICpkLCBzdHJ1Y3Qga2VybmVsX2luZm8gKmtpbmZv
LAo+PiDCoMKgwqDCoMKgIGNvbnN0IHN0cnVjdCBkdF9wcm9wZXJ0eSAqcHJvcCwgKnN0YXR1cyA9
IE5VTEw7Cj4+IMKgwqDCoMKgwqAgaW50IHJlcyA9IDA7Cj4+IMKgwqDCoMKgwqAgaW50IGhhZF9k
b20wX2Jvb3RhcmdzID0gMDsKPj4gK8KgwqDCoCBzdHJ1Y3QgZHRfZGV2aWNlX25vZGUgKmlvbW11
X25vZGU7Cj4+IMKgIMKgwqDCoMKgwqAgaWYgKCBraW5mby0+Y21kbGluZSAmJiBraW5mby0+Y21k
bGluZVswXSApCj4+IMKgwqDCoMKgwqDCoMKgwqDCoCBib290YXJncyA9ICZraW5mby0+Y21kbGlu
ZVswXTsKPj4gwqAgK8KgwqDCoCAvKgo+PiArwqDCoMKgwqAgKiBJZiB3ZSBza2lwIHRoZSBJT01N
VSBkZXZpY2Ugd2hlbiBjcmVhdGluZyBEVCBmb3IgaHdkb20gKGV2ZW4gaWYKPj4gK8KgwqDCoMKg
ICogdGhlIElPTU1VIGRldmljZSBpcyBub3QgdXNlZCBieSBYZW4pLCB3ZSBzaG91bGQgYWxzbyBz
a2lwIHRoZSAKPj4gSU9NTVUKPj4gK8KgwqDCoMKgICogc3BlY2lmaWMgcHJvcGVydGllcyBvZiB0
aGUgbWFzdGVyIGRldmljZSBiZWhpbmQgaXQgaW4gb3JkZXIgCj4+IHRvIGF2b2lkCj4+ICvCoMKg
wqDCoCAqIGV4cG9zaW5nIGFuIGhhbGYgY29tcGxldGUgSU9NTVUgYmluZGluZ3MgdG8gaHdkb20u
Cj4+ICvCoMKgwqDCoCAqIFVzZSAiaW9tbXVfbm9kZSIgYXMgYW4gaW5kaWNhdG9yIG9mIHRoZSBt
YXN0ZXIgZGV2aWNlIHdoaWNoIAo+PiBwcm9wZXJ0aWVzCj4+ICvCoMKgwqDCoCAqIHNob3VsZCBi
ZSBza2lwcGVkLgo+PiArwqDCoMKgwqAgKi8KPj4gK8KgwqDCoCBpb21tdV9ub2RlID0gZHRfcGFy
c2VfcGhhbmRsZShub2RlLCAiaW9tbXVzIiwgMCk7Cj4KPiBUaGUgY29kZSBpcyBzbGlnaHRseSBj
b25mdXNpbmcgdG8gcmVhZC4gSSBkb24ndCB0aGluayB3ZSBzaG91bGQgY2FyZSAKPiBvZiBpbnZh
bGlkIERUIGhlcmUsIHNvIGxldCdzIG9ubHkgY29uc2lkZXIgdmFsaWQgb25lLgoKRG8geW91IG1l
YW4gInRoZSBjb21tZW50IiBpcyBjb25mdXNpbmcgdG8gcmVhZD8KCgo+Cj4gRm9yIHZhbGlkIERU
LCBhbnkgbm9uLU5VTEwgcmV0dXJuIHNob3VsZCBwb2ludCB0byBhbiBJT01NVS4gVGhlIAo+IGNv
bW1lbnQgYWJvdmUgc3VnZ2VzdHMgdGhhdCBhbGwgSU9NTVUgd2lsbCBiZSBza2lwcGVkLiBIb3dl
dmVyLCB0aGUgCj4gY2hlY2sgYmVsb3cgKGRldmljZV9nZXRfY2xhc3MoaW9tbXVfbm9kZSkpIHdp
bGwgbm90IHJldHVybiAKPiBERVZJQ0VfSU9NTVUgd2hlbiB0aGVyZSBhcmUgbm90IGhhdmUgYSBk
cml2ZXIgZm9yIHRoZSBJT01NVS4KPgo+IFNvIHRoaXMgbmVlZHMgdG8gYmUgY2xhcmlmaWVkIGlu
IHRoZSBjb21taXQgbWVzc2FnZS4KCldpbGwgZG8uCgoKPgo+PiArwqDCoMKgIGlmICggaW9tbXVf
bm9kZSApCj4+ICvCoMKgwqAgewo+PiArwqDCoMKgwqDCoMKgwqAgaWYgKCBkZXZpY2VfZ2V0X2Ns
YXNzKGlvbW11X25vZGUpICE9IERFVklDRV9JT01NVSApCj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgIGlvbW11X25vZGUgPSBOVUxMOwo+PiArwqDCoMKgIH0KPgo+IENvdWxkIHdlIGdhdGhlciB0
aGUgdHdvIGNvbmRpdGlvbnMgaW4gb25lIGlmPwoKWWVzLgoKCi0tIApSZWdhcmRzLAoKT2xla3Nh
bmRyIFR5c2hjaGVua28KCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0
Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRl
dmVs
