Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EACC146D59
	for <lists+xen-devel@lfdr.de>; Thu, 23 Jan 2020 16:51:43 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iuej8-0002ES-8k; Thu, 23 Jan 2020 15:49:02 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=prnW=3M=gmail.com=julien.grall.oss@srs-us1.protection.inumbo.net>)
 id 1iuej6-0002E6-IK
 for xen-devel@lists.xenproject.org; Thu, 23 Jan 2020 15:49:00 +0000
X-Inumbo-ID: ded3ca0c-3df7-11ea-be6e-12813bfff9fa
Received: from mail-wm1-f65.google.com (unknown [209.85.128.65])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id ded3ca0c-3df7-11ea-be6e-12813bfff9fa;
 Thu, 23 Jan 2020 15:48:59 +0000 (UTC)
Received: by mail-wm1-f65.google.com with SMTP id t23so3076934wmi.1
 for <xen-devel@lists.xenproject.org>; Thu, 23 Jan 2020 07:48:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=BXnkQYrrKG0qolD4xNzZUBAVeX2NZ1XGC5IzOshkQmo=;
 b=n9YsinQF88nEWpgYBdZt3Adq90tcAYK44/iRgdfU/vbMIZPOnsfk/mSYZTIr1zZREH
 4NqbV7O4JbPPYvkiRj0JBSLAHIWLAooZs0hJ00YgmiJyQ527eek/vQNheiNT5oJ0E/0n
 EuBkPgktj3qh5OOzcOL3/26oaE+eh2TbUSGPfe1/v+Nv8QpZL64NwE6FGAqcADaH4GZm
 RxSfdLnLGLMJnjZX2T93wX18MKACanf7AN/aKSRjcrPORAOuV5BtC4WSqDjYOIo7l38Q
 PnCZxwLNOsofMKR6bM7znbWm/+g6iAlZqrXD9eQ3uPyvL+VjRYccsbpN+4tkZap6ZvWJ
 A+vQ==
X-Gm-Message-State: APjAAAUR/+QQ3Qw7qgPBqeb4878/EbraV+IgGKcuL4/4nMKnt+BIpQn4
 4cdlfLOfRcOCEPvNtcteFjI=
X-Google-Smtp-Source: APXvYqxduupOISyCEqbfU0W4pNuLUyvO4B/orQ8xOb7kySJvlooufkmV5Mfj1bCpk3UlMNiGNeWBHw==
X-Received: by 2002:a1c:f009:: with SMTP id a9mr4840103wmb.73.1579794538995;
 Thu, 23 Jan 2020 07:48:58 -0800 (PST)
Received: from a483e7b01a66.ant.amazon.com (54-240-197-232.amazon.com.
 [54.240.197.232])
 by smtp.gmail.com with ESMTPSA id x10sm3441096wrv.60.2020.01.23.07.48.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 23 Jan 2020 07:48:58 -0800 (PST)
To: "Durrant, Paul" <pdurrant@amazon.co.uk>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <20200123140305.21050-1-pdurrant@amazon.com>
 <20200123140305.21050-4-pdurrant@amazon.com>
 <d3b28297-0a5e-2a9b-9c2f-4348e98ce757@xen.org>
 <fd1de668d8f54e55a0cf7d85b1c0b5ba@EX13D32EUC003.ant.amazon.com>
From: Julien Grall <julien@xen.org>
Message-ID: <f2eccef5-1e6f-3aa8-b6db-75fd02f9b291@xen.org>
Date: Thu, 23 Jan 2020 15:48:57 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:68.0)
 Gecko/20100101 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <fd1de668d8f54e55a0cf7d85b1c0b5ba@EX13D32EUC003.ant.amazon.com>
Content-Language: en-GB
Subject: Re: [Xen-devel] [PATCH v3 3/3] x86 / vmx: use a 'normal' domheap
 page for APIC_DEFAULT_PHYS_BASE
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
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

CgpPbiAyMy8wMS8yMDIwIDE1OjQ2LCBEdXJyYW50LCBQYXVsIHdyb3RlOgo+PiAtLS0tLU9yaWdp
bmFsIE1lc3NhZ2UtLS0tLQo+PiBGcm9tOiBKdWxpZW4gR3JhbGwgPGp1bGllbkB4ZW4ub3JnPgo+
PiBTZW50OiAyMyBKYW51YXJ5IDIwMjAgMTU6MjYKPj4gVG86IER1cnJhbnQsIFBhdWwgPHBkdXJy
YW50QGFtYXpvbi5jby51az47IHhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwo+PiBDYzog
SmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPjsgQW5kcmV3IENvb3Blcgo+PiA8YW5kcmV3
LmNvb3BlcjNAY2l0cml4LmNvbT47IFdlaSBMaXUgPHdsQHhlbi5vcmc+OyBSb2dlciBQYXUgTW9u
bsOpCj4+IDxyb2dlci5wYXVAY2l0cml4LmNvbT47IEdlb3JnZSBEdW5sYXAgPEdlb3JnZS5EdW5s
YXBAZXUuY2l0cml4LmNvbT47IElhbgo+PiBKYWNrc29uIDxpYW4uamFja3NvbkBldS5jaXRyaXgu
Y29tPjsgS29ucmFkIFJ6ZXN6dXRlayBXaWxrCj4+IDxrb25yYWQud2lsa0BvcmFjbGUuY29tPjsg
U3RlZmFubyBTdGFiZWxsaW5pIDxzc3RhYmVsbGluaUBrZXJuZWwub3JnPjsgSnVuCj4+IE5ha2Fq
aW1hIDxqdW4ubmFrYWppbWFAaW50ZWwuY29tPjsgS2V2aW4gVGlhbiA8a2V2aW4udGlhbkBpbnRl
bC5jb20+Cj4+IFN1YmplY3Q6IFJlOiBbUEFUQ0ggdjMgMy8zXSB4ODYgLyB2bXg6IHVzZSBhICdu
b3JtYWwnIGRvbWhlYXAgcGFnZSBmb3IKPj4gQVBJQ19ERUZBVUxUX1BIWVNfQkFTRQo+Pgo+Pgo+
Pgo+PiBPbiAyMy8wMS8yMDIwIDE0OjAzLCBQYXVsIER1cnJhbnQgd3JvdGU6Cj4+PiBkaWZmIC0t
Z2l0IGEveGVuL2NvbW1vbi9kb21haW4uYyBiL3hlbi9jb21tb24vZG9tYWluLmMKPj4+IGluZGV4
IGVlM2Y5ZmZkM2UuLjMwYzc3N2FjYjggMTAwNjQ0Cj4+PiAtLS0gYS94ZW4vY29tbW9uL2RvbWFp
bi5jCj4+PiArKysgYi94ZW4vY29tbW9uL2RvbWFpbi5jCj4+PiBAQCAtMzM5LDYgKzMzOSw4IEBA
IHN0YXRpYyBpbnQgc2FuaXRpc2VfZG9tYWluX2NvbmZpZyhzdHJ1Y3QKPj4geGVuX2RvbWN0bF9j
cmVhdGVkb21haW4gKmNvbmZpZykKPj4+ICAgICAgICByZXR1cm4gYXJjaF9zYW5pdGlzZV9kb21h
aW5fY29uZmlnKGNvbmZpZyk7Cj4+PiAgICB9Cj4+Pgo+Pj4gKyNkZWZpbmUgRE9NQUlOX0lOSVRf
UEFHRVMgMQo+Pgo+PiBXb3VsZCBpdCBtYWtlIHNlbnNlIHRvIG1ha2UgdGhpcyBhIHBlci1hcmNo
IGRlZmluZT8gVGhpcyB3b3VsZCBhbGxvdwo+PiBlYWNoIGFyY2ggdG8gZGVmaW5lIGEgZGlmZmVy
ZW50IG51bWJlciBvZiBpbml0IHBhZ2VzIChhbmQgY2F0Y2ggYW55Cj4+IG1pc3VzZSkuCj4+Cj4g
Cj4gSSB0aG91Z2h0IGFib3V0IHRoYXQgYW5kIGRlY2lkZWQgYWdhaW5zdCBpdC4gVGhlIGFyY2gg
Y29kZSBtYXkgd2FudCB0byBpbmNyZWFzZSAod2hpY2ggbWF5IGJlIGEgYmFkIGlkZWEpIGJ1dCBJ
IHRoaW5rIGl0IHNob3VsZCBiZSBzZXQgZWFybHkuIFVsdGltYXRlbHkgaXQgc2hvdWxkIGNvbWUg
aW4gZnJvbSB0aGUgdG9vbHN0YWNrIHZpYSB0aGUgZG9tY3RsIGFueXdheS4KVGhlIHZhbHVlIGlz
IGFscmVhZHkgYXJjaCBzcGVjaWZpYyBiZWNhdXNlIG9uIEFybSB3ZSBoYXZlIDAgcGFnZXMgCnJl
cXVpcmVzIHRoaXMgdHJpY2sgeWV0LgoKV2hpbGUgSSBhZ3JlZSwgaXQgc2hvdWxkIGJlIHNldCBl
YXJseSwgdGhlcmUgaXMgbm90aGluZyB0byBwcmV2ZW50IHRoaXMgCnRvIGJlIGluIGEgYXJjaCBo
ZWFkZXIuIEFtIEkgY29ycmVjdD8KCkNoZWVycywKCi0tIApKdWxpZW4gR3JhbGwKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5n
IGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJv
amVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
