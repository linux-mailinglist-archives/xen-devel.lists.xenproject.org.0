Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E8936F1216
	for <lists+xen-devel@lfdr.de>; Wed,  6 Nov 2019 10:23:31 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iSHTF-0006rH-S4; Wed, 06 Nov 2019 09:19:21 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=rf37=Y6=gmail.com=andrii.anisov@srs-us1.protection.inumbo.net>)
 id 1iSHTD-0006rC-Vn
 for xen-devel@lists.xenproject.org; Wed, 06 Nov 2019 09:19:20 +0000
X-Inumbo-ID: 8261470e-0076-11ea-9631-bc764e2007e4
Received: from mail-lf1-x141.google.com (unknown [2a00:1450:4864:20::141])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 8261470e-0076-11ea-9631-bc764e2007e4;
 Wed, 06 Nov 2019 09:19:18 +0000 (UTC)
Received: by mail-lf1-x141.google.com with SMTP id j14so17445824lfb.8
 for <xen-devel@lists.xenproject.org>; Wed, 06 Nov 2019 01:19:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=j7O3zVttSCOAUrrsXWB/4Ejtu32bZVcUyWHOG1n6Qu4=;
 b=lMnYCiW1pqoV9KrIRBm6zFyYOFa+j1m/lB8mgDIV9wI6RPYuHMXCbbjHzgRSkZweKs
 APBbuZgSVXUTeQwvblQjw3mZwrFwu8hU82w8FLeQAVJY3CTs6gqeUDhpm/PR/CD5tavy
 /pKoZANhEFdGiyN4zfbhrckc+WTTHF4hzt6lJfxrnMtl5Xe5ZK+/h/kaEFhlsnYsf1Co
 uGkiwP/ker/R0r6SWr9YFCggse8OX7R941kSgzQhcWrtPpMK2iKbmH8HYSKy9rnIDBan
 wGdHNFhdJabIC0e+AXY8O7ihfju5YZOx9mZBadD0Ujeo9l1bhiSh0bd80FSBOrOLrkIN
 UMXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=j7O3zVttSCOAUrrsXWB/4Ejtu32bZVcUyWHOG1n6Qu4=;
 b=CFwfCdqslmeylNDFmiepqw8VlgWUNVtf6j9gDO576lRMjOmQ2AbPB4mUQdq6jxkgrG
 XsqWn467802QVpCzDX7f9UWVp9ngnOE52oEETSPAaY1vLK4kwXf6X0flQd2acWX4DObk
 1mJ15CcxyFI0HYC+DJnY6NVIblvBITY1xv78YRoI15nUH1ZWEXRjv3ivxZzSmOi7iePD
 86AxgngYtgprUUK6roziuaCBp4vusqvvkex/iiaH5bdxjXtcKOLaNYofRXb2tXMahHI2
 +PAo71MwVZ4FfEV99A3l06eBOwfPkxWSFMRYUpFCPpREsnrEh3VjgSmDsYk9LCx9A6LC
 3g2Q==
X-Gm-Message-State: APjAAAX7ruB7/HibhQ/IiLUoeJHiqZndaRqNX1XNyGaUAwiJsbabqrVF
 pO2IzEEMTWhgadgYLGtbWjlALfHMQ24=
X-Google-Smtp-Source: APXvYqy8gxvU7MYTjUVcK06Re5numgoSqPLoIYC+Jt8SGgwajMEAhHaop94q4oqcTL/WdpKXdt35Xw==
X-Received: by 2002:ac2:51c5:: with SMTP id u5mr24238773lfm.154.1573031957077; 
 Wed, 06 Nov 2019 01:19:17 -0800 (PST)
Received: from aanisov-work.kyiv.epam.com (ll-74.141.223.85.sovam.net.ua.
 [85.223.141.74])
 by smtp.gmail.com with ESMTPSA id g23sm3945937lja.104.2019.11.06.01.19.14
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Wed, 06 Nov 2019 01:19:15 -0800 (PST)
From: Andrii Anisov <andrii.anisov@gmail.com>
To: xen-devel@lists.xenproject.org
Date: Wed,  6 Nov 2019 11:19:06 +0200
Message-Id: <1573031953-12894-1-git-send-email-andrii.anisov@gmail.com>
X-Mailer: git-send-email 2.7.4
Subject: [Xen-devel] [RFC 0/7] Build XEN with ARM Compiler 6.6.3
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
 Andrii Anisov <andrii_anisov@epam.com>, Wei Liu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Julien Grall <julien@xen.org>, Daniel De Graaf <dgdegra@tycho.nsa.gov>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

RnJvbTogQW5kcmlpIEFuaXNvdiA8YW5kcmlpX2FuaXNvdkBlcGFtLmNvbT4KCkRlYXIgQWxsLAoK
SGVyZSBhcmUgcGF0Y2hlcyB0byBtYWtlIFhFTiAoaHlwZXJ2aXNvciBvbmx5KSBiZWluZyBhYmxl
IHRvIGJlIGNvbXBpbGVkIGZvcgpBUk12OCB3aXRoIEFSTSBDb21waWxlciA2LjYuMyBMb25nIFRl
cm0gTWFpbnRlbmFuY2UuIEFSTSBjb21waWxlciBvZiB0aGF0CnZlcnNpb24gaXMgc2FmZXR5IGNl
cnRpZmllZCwgdGhhdCBpcyB0aGUgcmVhc29uIGZvciB0aGUgY2hvaWNlLiBUaGUgY2hvc2VuCmNv
bXBpbGVyIGhhcyBhIG51bWJlciBvZiBidWdzIGFuZCBkZXZpYXRpb25zIGZyb20gR05VIENvbXBp
bGVyLCB3aGljaCByZXF1aXJlZApjb3JyZXNwb25kZW50IHdvcmthcm91bmRzLiBUaGVzZSBwYXRj
aGVzIGFyZSBwdWJsaXNoZWQgZm9yIHRob3NlIHdobyBhcmUKaW50ZXJlc3RlZCBpbiBYRU4gYmVp
bmcgYnVpbHQgYnkgdGhpcyBzcGVjaWZpYyBjb21waWxlci4gQWxzbywgdGhlc2UgcGF0Y2hlcyBh
cmUKV0lQIGFuZCB0aGVyZSBpcyBhIGxvdCBvZiByb29tIGZvciBpbXByb3ZlbWVudC4KCkhlcmUg
aXMgdGhlIGxpc3Qgb2YgQVJNIENvbXBpbGVyIDYuNi4zIGJ1Z3MgYW5kIGRldmlhdGlvbnMgYWZm
ZWN0ZWQgWEVOIGJ1aWxkOgogLSBBUk0gTGlua2VyIHNjYXR0ZXIgZmlsZSBpcyBwcmV0dHkgcHJp
bWl0aXZlLCBpdCBoYXMgbm8gZmVhdHVyZSB0byBkZWZpbmUKICAgc3ltYm9scwogLSBBUk0gTGlu
a2VyIGRlZmluZWQgc3ltYm9scyBhcmUgbm90IGNvdW50ZWQgYXMgcmVmZXJyZWQgaWYgb25seSBt
ZW50aW9uZWQKICAgaW4gYSBzdGVlcmluZyBmaWxlIGZvciByZW5hbWUgb3IgcmVzb2x2ZQogLSBD
IHN0eWxlIHNoaWZ0IG9wZXJhdG9ycyBhcmUgbWlzc2VkIGFtb25nIHN1cHBvcnRlZCBzY2F0dGVy
IGZpbGUgZXhwcmVzc2lvbnMsCiAgIHNvIHNvbWUgbmVlZGVkIHZhbHVlcyBhcmUgaGFyZGNvZGVk
IGluIHNjYXR0ZXIgZmlsZQogLSBBUk0gQ29tcGlsZXIgdG9vbHMgYXJlIG5vdCBhYmxlIHRvIHJl
bmFtZSBzZWN0aW9ucwogLSBhcm1jbGFuZyBjb21waWxlcyBkYXRhIG9ubHkgQyBmaWxlcyB3aXRo
IFNvZnRWRlAgYXR0cmlidXRlcwogLSBzdGF0aWMgZGF0YSBzeW1ib2xzLCBtb3ZlZCB0byBhbiBp
bml0IHNlY3Rpb24sIGJlY29tZXMgZ2xvYmFsCiAtIGFybWNsYW5nIGZhaWxzIHRvIHByb2Nlc3Mg
LnJlcHQgYXNzZW1ibGVyIGRpcmVjdGl2ZSB3aXRoIGFuIGV4cHJlc3Npb24gYXMgYQogICBwYXJh
bWV0ZXIuCgpUaGUgbGF0ZXN0IGlzc3VlIGlzIGFkZHJlc3NlZCBpbiBhIHZlcnkgcHJpbWl0aXZl
IHdheTogdGhlc2UgcGF0Y2hlcyBhcmUgcG9ydGVkCm9uIHRvcCBvZiBjb21taXQgZjExZmRhOTY2
MzY1ZGI1OTFkMjgwYWMxNTIyOTkzNDA5ZTIwZmQ4YywgcHJpb3IgdG8gY29tbWl0CmludHJvZHVj
ZWQgYC5yZXB0YCBkaXJlY3RpdmUgdXNhZ2UuOgoKQW5kcmlpIEFuaXNvdiAoNSk6CiAgYXJtNjQ6
YXJtZHM6IEFSTSBDb21waWxlciA2LjYgZG9lcyBub3QgYWNjZXB0IGByeGAgcmVnaXN0ZXJzIG5h
bWluZwogICAgZm9yIEFBcmNoNjQKICBhcm0vZ2ljOiBEcm9wIHBvaW50bGVzcyBhc3NlcnRpb25z
CiAgV0lQOmFybTY0OmFybWRzOiBCdWlsZCBYRU4gd2l0aCBBUk0gQ29tcGlsZXIgNi42CiAgYXJt
OiBJbnRyb2R1Y2UgZHVtbXkgZW1wdHkgZnVuY3Rpb25zIGZvciBkYXRhIG9ubHkgQyBmaWxlcwog
IGFybS9naWMtdjM6IGFkZCBHSUMgdmVyc2lvbiBzdWZmaXggdG8gaW9tZW0gcmFuZ2UgdmFyaWFi
bGVzCgpBcnRlbSBNeWdhaWV2ICgxKToKICBXSVA6IENvbXBpbGF0aW9uIHdpdGggQVJNIERTLTYg
Y29tcGlsZXIKCkp1bGllbiBHcmFsbCAoMSk6CiAgeGVuOiBjbGFuZzogU3VwcG9ydCBjb3JyZWN0
bHkgY3Jvc3MtY29tcGlsZQoKIENvbmZpZy5tayAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICB8ICAgOCArLQogY29uZmlnL1N0ZEdOVS5tayAgICAgICAgICAgICAgICAgICAgICAgICAg
IHwgIDIwICsrLQogY29uZmlnL2FybTMyLm1rICAgICAgICAgICAgICAgICAgICAgICAgICAgIHwg
IDEwICstCiBjb25maWcvYXJtNjQubWsgICAgICAgICAgICAgICAgICAgICAgICAgICAgfCAgIDYg
Ky0KIHhlbi9SdWxlcy5tayAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB8ICAgOCArCiB4
ZW4vYXJjaC9hcm0vTWFrZWZpbGUgICAgICAgICAgICAgICAgICAgICAgfCAgMjQgKysrCiB4ZW4v
YXJjaC9hcm0vUnVsZXMubWsgICAgICAgICAgICAgICAgICAgICAgfCAgIDggKwogeGVuL2FyY2gv
YXJtL2dpYy12My5jICAgICAgICAgICAgICAgICAgICAgIHwgIDY4ICsrKystLS0tCiB4ZW4vYXJj
aC9hcm0vZ2ljLmMgICAgICAgICAgICAgICAgICAgICAgICAgfCAgIDYgLQogeGVuL2FyY2gvYXJt
L3BsYXRmb3Jtcy9icmNtLXJhc3BiZXJyeS1waS5jIHwgICAyICsKIHhlbi9hcmNoL2FybS9wbGF0
Zm9ybXMvdGh1bmRlcnguYyAgICAgICAgICB8ICAgMiArCiB4ZW4vYXJjaC9hcm0veGVuLnNjYXQu
UyAgICAgICAgICAgICAgICAgICAgfCAyNjYgKysrKysrKysrKysrKysrKysrKysrKysrKysrKysK
IHhlbi9hcmNoL2FybS94ZW4uc3RlZXIgICAgICAgICAgICAgICAgICAgICB8ICAgNSArCiB4ZW4v
aW5jbHVkZS9hc20tYXJtL2FybWRzLmggICAgICAgICAgICAgICAgfCAgOTEgKysrKysrKysrKwog
eGVuL2luY2x1ZGUvYXNtLWFybS9zbWNjYy5oICAgICAgICAgICAgICAgIHwgIDYwICsrKysrKysK
IHhlbi94c20vZmxhc2svZ2VuLXBvbGljeS5weSAgICAgICAgICAgICAgICB8ICAgNCArCiAxNiBm
aWxlcyBjaGFuZ2VkLCA1MzkgaW5zZXJ0aW9ucygrKSwgNDkgZGVsZXRpb25zKC0pCiBjcmVhdGUg
bW9kZSAxMDA2NDQgeGVuL2FyY2gvYXJtL3hlbi5zY2F0LlMKIGNyZWF0ZSBtb2RlIDEwMDY0NCB4
ZW4vYXJjaC9hcm0veGVuLnN0ZWVyCiBjcmVhdGUgbW9kZSAxMDA2NDQgeGVuL2luY2x1ZGUvYXNt
LWFybS9hcm1kcy5oCgotLSAKMi43LjQKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54
ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGlu
Zm8veGVuLWRldmVs
