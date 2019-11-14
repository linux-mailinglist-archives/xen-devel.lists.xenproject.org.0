Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E337DFC566
	for <lists+xen-devel@lfdr.de>; Thu, 14 Nov 2019 12:33:38 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iVDLZ-0006hN-SA; Thu, 14 Nov 2019 11:31:33 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=lr3c=ZG=gmail.com=andrii.anisov@srs-us1.protection.inumbo.net>)
 id 1iVDLY-0006hA-59
 for xen-devel@lists.xenproject.org; Thu, 14 Nov 2019 11:31:32 +0000
X-Inumbo-ID: 4dde6824-06d2-11ea-9631-bc764e2007e4
Received: from mail-lf1-x144.google.com (unknown [2a00:1450:4864:20::144])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 4dde6824-06d2-11ea-9631-bc764e2007e4;
 Thu, 14 Nov 2019 11:31:31 +0000 (UTC)
Received: by mail-lf1-x144.google.com with SMTP id i26so4789249lfl.2
 for <xen-devel@lists.xenproject.org>; Thu, 14 Nov 2019 03:31:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=X+MBbrhNjOfAFSxS+UU97RqKdVFQVyuCTWzHauJ2Rtw=;
 b=bNygHkwNPksfi0YNVRYUAym7Lne5ZgedgajmjhnbGI4XOtxR/tWKl5Ku1OXcKvwWxc
 dnCLjWn0z0dds57LyvFmrZi2mIfRrTNTQLgFrFpM1Tji8p9aDGBETJBJjyZDefrrBb+r
 U8PM4zW3an5hEjZPSOruXfMGVx5AMMzCO/0HtzchgAfrLMVSfymIWzjTxIGEXLHb4+Ye
 SeLT8+5rQZkdHnQRfnk519fZ9vM83P+dUVNCGzMQXwwgdbDkoK0UkgmZTuLLOZdwrNUk
 toAzHDdTFfJx/stlnLB/UicMp6ZFnyWsRbKdIfxcDnj6HiM646ka3W7Y8VjA2XcfV87O
 ByiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=X+MBbrhNjOfAFSxS+UU97RqKdVFQVyuCTWzHauJ2Rtw=;
 b=DosGwI2BLB6O8JdoAtzoCujmliR3yVtV+7Lv/C8zxDng7QM+gUOWrcpnzv0nnNKJb2
 WIw385mGUR/4N2POgpLrnR1cmBsX+TgpXEwJMjDVkgyrwUjXJ57/Hl5525CJu+0tfTyT
 H0Juv2flq06AjiTYnYe2WUuyl5kOmCuyGXYaQ6YOXzHpIWmiFBM2s64UE5/OwLAxY4Tz
 I66L/zzIzSNjrfi6BDoZFf38/FD2+KLLQX906bAwq1FXolPzGB0u3rAFk8APZBcsS0f9
 fCmstIpaPX7QZYtr68Y9n3My5oUDpa65RtR4ctR/VZrB6AJRBm6Oh7PhzDWljjtD1bfY
 W05w==
X-Gm-Message-State: APjAAAVLh841esOIL98tsR2DMOdw0TLILjAd6Gdq6WO3TQTyl8Cal9Rt
 V8YOKEZGR/wiJ1aNqm11u3E=
X-Google-Smtp-Source: APXvYqwaCFZmylxWQCsQ/odC4x7sPn/p0goEBbwP33QpRrIOPXbAh/hRqxLvO3Eh3cYP+sCozZbpdw==
X-Received: by 2002:ac2:5dcc:: with SMTP id x12mr567342lfq.163.1573731090132; 
 Thu, 14 Nov 2019 03:31:30 -0800 (PST)
Received: from [10.17.180.84] (ll-74.141.223.85.sovam.net.ua. [85.223.141.74])
 by smtp.gmail.com with ESMTPSA id
 i8sm2358487lfl.80.2019.11.14.03.31.28
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 14 Nov 2019 03:31:29 -0800 (PST)
To: Julien Grall <julien.grall.oss@gmail.com>,
 Stefano Stabellini <sstabellini@kernel.org>
References: <1573031953-12894-1-git-send-email-andrii.anisov@gmail.com>
 <1573031953-12894-6-git-send-email-andrii.anisov@gmail.com>
 <alpine.DEB.2.21.1911111303040.2677@sstabellini-ThinkPad-T480s>
 <CAJ=z9a0OreBvHN9gdfBcQCG7qORo-XpReXz7MyTPEnguCTDYiQ@mail.gmail.com>
From: Andrii Anisov <andrii.anisov@gmail.com>
Message-ID: <b8d7fcab-0751-b3a6-e196-b8e0c98050d4@gmail.com>
Date: Thu, 14 Nov 2019 13:31:27 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <CAJ=z9a0OreBvHN9gdfBcQCG7qORo-XpReXz7MyTPEnguCTDYiQ@mail.gmail.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [RFC 5/7] WIP:arm64:armds: Build XEN with ARM
 Compiler 6.6
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
Cc: Andrii Anisov <andrii_anisov@epam.com>, Wei Liu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Jan Beulich <jbeulich@suse.com>,
 xen-devel@lists.xenproject.org, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

CgpPbiAxMy4xMS4xOSAwNzo1MCwgSnVsaWVuIEdyYWxsIHdyb3RlOgo+IFRvIGJlIGhvbmVzdCwg
SSBkb24ndCB0aGluayB0aGlzIGZpbGUgc2hvdWxkIGV2ZW4gZXhpc3QuIFRoaXMgbG9va3MgbGlr
ZSBhIGNvcHkgb2YgeGVuLmxkcy5TIHdpdGggYSBkaWZmZXJlbnQgc3ludGF4LgoKQW5kIGxhY2tp
bmcgZmVhdHVyZXMgbGlrZSBzeW1ib2xzIGRlZmluaXRpb24sIGN1cnJlbnQgYWRkcmVzcyBzZXR1
cCwgZXRjLgoKPiBGdXJ0aGVybW9yZSwgdGhlIGNvbW1lbnRzIGZyb20gU3RlZmFubyBzaG93cyB0
aGF0IGlzIGdvaW5nIHRvIGJlIGhhcmQgdG8gbWFpbnRhaW4vY2hlY2sgZXZlcnl0aGluZyBoYXMg
YmVlbiB3cml0dGVuIGNvcnJlY3RseS4KCkl0IHdpbGwgYmUgdGVycmlibHkgaGFyZC4KCj4gU28g
aG93IGFib3V0IHRyeWluZyB0byBhYnN0cmFjdCB4ZW4ubGRzLlM/CgpJIGZhaWxlZCB0byBmaW5k
IHRoZSBjb21tb24gZ3JvdW5kIGZvciB0aGVtLgpZb3UgYXJlIHZlcnkgd2VsY29tZWQgdG8gc3Vn
Z2VzdCB0aGF0IHBpZWNlIG9mIGNvZGUuCgoKPiAgICAgID4gKy8qCj4gICAgICA+ICsgKiBhcm1s
aW5rIGRvZXMgbm90IHVuZGVyc3RhbmQgc2hpZnRzIGluIHNjYXQgZmlsZSBleHByZXNzaW9ucwo+
ICAgICAgPiArICogc28gaGFyZGNvZGUgbmVlZGVkIHZhbHVlcwo+ICAgICAgPiArICovCj4gCj4g
Cj4gUGxlYXNlIGdpdmUgYSBwb2ludGVyIHRvIHRoZSBkb2Mgb2YgdGhlIGFybWxpbmsgaW4gdGhl
IGNvbW1pdCBtZXNzYWdlLiBTbyB3ZSBjYW4gZWFzaWx5IGNyb3NzLWNoZWNrIHdoYXQncyBoYXBw
ZW5pbmcuCgpUaGUgYmVzdCBjcm9zcy1jaGVjayB3b3VsZCBiZSBydW5uaW5nIHRoZSBjb21waWxl
ci4gWWV0LCB0aGlzIHBhcnRpY3VsYXIgdGhpbmcgaXMgc29tZWhvdyBkb2N1bWVudGVkIFsxXS4K
Cj4gSW4gdGhpcyBjYXNlLCBJIGRvbid0IHBhcnRpY3VsYXJseSBsaWtlIHRoZSByZS1kZWZpbml0
aW9uIG9mIHRoZSBkZWZpbmVzIG91dHNpZGUgb2YgdGhlaXIgaGVhZGVyLiBUaGlzIGlzIGdvaW5n
IHRvIG1ha2UgbW9yZSBkaWZmaWN1bHQgaWYgd2UgaGF2ZSB0byB1cGRhdGUgdGhlbSBpbiB0aGUg
ZnV0dXJlLgo+IAo+IEkgY2FuIHNlZSBhIGZldyB3YXlzIHRvIGRvIGl0Ogo+IAo+ICDCoC0gQXZv
aWQgdXNpbmcgc2hpZnRzIGluIHRoZSBkZWZpbml0aW9ucwo+ICDCoC0gRmluZCBhIHdheSB0byBl
dmFsdWF0ZSB0aGUgdmFsdWUgKG1heWJlIHNpbWlsYXIgdG8gYXNuLW9mZnNldCkgYmVmb3JlIHVz
aW5nIHRoZW0uCj4KPiBNeSBwcmVmZXJlbmNlIHdvdWxkIGJlIHRoZSBsYXR0ZXIgYnV0IEkgY291
bGQgYmUgY29udmluY2VkIGZvciB0aGUgZm9ybWVyLgoKVGhlIGZpcnN0IG9wdGlvbiBpcyBub3Qg
cmVhbGlzdGljLiBJIHN1Z2dlc3RlZCBBUk0gdG8gY29uc2lkZXIgc2hpZnRzIHN1cHBvcnQgYXMg
YW4gaW1wcm92ZW1lbnQgZm9yIHRoZWlyIGNvbXBpbGVyLgpJJ2QgYmUgdmVyeSBoYXBweSB0byBh
ZG9wdCB0aGUgc2Vjb25kIG9wdGlvbi4gRG8geW91IGhhdmUgYW55IGNvZGUgZXhhbXBsZXMgb3Ig
aGludHMgaG93IHRvIGV2YWx1YXRlIGV4cHJlc3Npb25zIG9uIHRoZSBwcmUtcHJvY2Vzc2luZyBz
dGFnZT8KClsxXSBodHRwczovL2RldmVsb3Blci5hcm0uY29tL2RvY3MvMTAwMDcwLzA2MTIvc2Nh
dHRlci1maWxlLXN5bnRheC9leHByZXNzaW9uLWV2YWx1YXRpb24taW4tc2NhdHRlci1maWxlcy9l
eHByZXNzaW9uLXJ1bGVzLWluLXNjYXR0ZXItZmlsZXMKCi0tIApTaW5jZXJlbHksCkFuZHJpaSBB
bmlzb3YuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpY
ZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRw
czovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
