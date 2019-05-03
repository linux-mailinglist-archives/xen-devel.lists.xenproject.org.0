Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3895312DAB
	for <lists+xen-devel@lfdr.de>; Fri,  3 May 2019 14:32:41 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hMXKV-0003ae-S9; Fri, 03 May 2019 12:30:19 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=PCcl=TD=protonmail.com=mathieu.tarral@srs-us1.protection.inumbo.net>)
 id 1hMXKT-0003aZ-ON
 for xen-devel@lists.xenproject.org; Fri, 03 May 2019 12:30:18 +0000
X-Inumbo-ID: 2d869488-6d9f-11e9-89df-c7b972798f72
Received: from mail-40132.protonmail.ch (unknown [185.70.40.132])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 2d869488-6d9f-11e9-89df-c7b972798f72;
 Fri, 03 May 2019 12:30:04 +0000 (UTC)
Date: Fri, 03 May 2019 12:29:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
 s=default; t=1556886603;
 bh=4gJPynY9GSXgJuu8ndD7BbYqJdNV32vVkZ/08xoF2mU=;
 h=Date:To:From:Reply-To:Subject:Feedback-ID:From;
 b=V3VkNErnzFrxU8wib05Gmlgp/ie5DLoZB6kPGuiJfXz0XkK7ZiS0OlD+gtTD6ool0
 N0Ndn19vSn93ncBfyYCyWBqB3isM5HkbPStOLBFOcn/yUGz1Mh+HychvpUmeUWSWu2
 IawFzxdxPX3Ijruwws69+J6WirbNksLt47l4amYk=
To: xen-devel <xen-devel@lists.xenproject.org>
From: Mathieu Tarral <mathieu.tarral@protonmail.com>
Message-ID: <vm38DtaWfYfOKuJdFi97GKwVhfrcA_zNOlg8JBws649kHxCZIAvsacvlzD3mhKXcQayhbWuGTO0sclmj1xvNmj72jdAe3Qw4XUrGt6MFcpI=@protonmail.com>
Feedback-ID: 7ARND6YmrAEqSXE0j3TLm6ZqYiFFaDDEkO_KW8fTUEW0kYwGM1KEsuPxEPVWH5YuEnR43INtqwIKH-usvnxVQQ==:Ext:ProtonMail
MIME-Version: 1.0
X-Spam-Status: No, score=-1.2 required=7.0 tests=ALL_TRUSTED,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM autolearn=ham
 autolearn_force=no version=3.4.2
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on mail.protonmail.ch
Subject: [Xen-devel] Improve build system for offline environments
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
Reply-To: Mathieu Tarral <mathieu.tarral@protonmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGksCgpBcyBzdGF0ZWQgYnkgdGhlIGRvY3VtZW50YXRpb246CiJfWGVuIFByb2plY3QgZG93bmxv
YWRzIHZhcmlvdXMgZGVwZW5kZW5jaWVzIGF0IGJ1aWxkIHRpbWVfIgoKVGhpcyBtYWtlcyBYZW4g
YSBkaWZmaWN1bHQgcHJvamVjdCB0byB3b3JrIHdpdGggaW4gYW4gb2ZmbGluZSBlbnZpcm9ubWVu
dC4KClRoYW5rcyB0byB0aGUgSVJDIGNoYW5uZWwsIEkgaGVhcmQgb2YgdGhlIGNvbW1hbmQKYG1h
a2Ugc3VidHJlZS1mb3JjZS11cGRhdGUtYWxsYAooV2UgY291bGQgZG9jdW1lbnQgdGhpcyBvcHRp
b24gaW4gdGhlIHdpa2kgIkNvbXBpbGluZyBYZW4gRnJvbSBTb3VyY2UiKQoKSG93ZXZlciwgdGhl
IG92ZXJhbGwgcHJvY2VzcyBzdGF5cyBwcm9ibGVtYXRpYzoKCjEuIHRoZSB0YXJnZXQgJ3N1YnRy
ZWUtZm9yY2UtdXBkYXRlLWFsbCcgaW1wbGllcyB0aGF0IHlvdSBjYW4gcnVuIGEgLi9jb25maWd1
cmUsCm90aGVyd2lzZSB5b3Ugd2lsbCBnZXQgdGhlIGZvbGxvd2luZyBlcnJvcjoKCm1ha2VbMV06
IEVudGVyaW5nIGRpcmVjdG9yeSAnfi94ZW4vdG9vbHMvJwp+L3hlbi90b29scy8uLi90b29scy9S
dWxlcy5tazoyNTg6ICoqKiBZb3UgaGF2ZSB0byBydW4gLi9jb25maWd1cmUgYmVmb3JlIGJ1aWxk
aW5nIG9yIGluc3RhbGxpbmcgdGhlIHRvb2xzLiBTdG9wLgoKVGhpcyBpcyBzb21ldGltZXMgbm90
IHBvc3NpYmxlIGJlY2F1c2UgeW91IGFyZSBpbiBhIGRvd25sb2FkLW9yaWVudGVkCmFuZCBsb2Nr
ZWQgZW52aXJvbm1lbnQsIGFuZCB0aGVyZWZvcmUgbGFjayB0aGUgc3lzdGVtIGRlcGVuZGVuY2ll
cyByZXF1aXJlZCBmb3IgdGhlIGNvbmZpZ3VyZS4KCkFsc28geW91IGRvbid0IGhhdmUgdGhlIHJv
b3QgcHJpdmlsZWdlcyB0byBpbnN0YWxsIHRoZW0uCgoyLiB0aGUgZG93bmxvYWQgb2YgZXh0ZXJu
YWwgZGVwZW5kZW5jaWVzIHJlbWFpbnMgaW5jb21wbGV0ZSBhbmQgdGhlCnFlbXUteGVuLWRpciBi
dWlsZCB3aWxsIGZhaWwgc2luY2UgdGhlIHN1Ym1vZHVsZXMKaGF2ZSBub3QgYmVlbiBjaGVja2Vk
IG91dCAoZHRjLCBjYXBzdG9uZSwgZXRjLi4uKQoKbWFrZTogRW50ZXJpbmcgZGlyZWN0b3J5ICd+
L3hlbi90b29scy9xZW11LXhlbi1idWlsZCcKICBHRU4gICAgIGNvbmZpZy1ob3N0LmgKICBHSVQg
ICAgIHVpL2tleWNvZGVtYXBkYiBkdGMKQ2xvbmluZyBpbnRvICd+L3hlbi90b29scy9xZW11LXhl
bi1kaXItcmVtb3RlL2R0YycuLi4KZmF0YWw6IFVuYWJsZSB0byBsb29rIHVwIGdpdC5xZW11LXBy
b2plY3Qub3JnIChwb3J0IDk0MTgpIChOYW1lIG9yIHNlcnZpY2Ugbm90IGtub3duKQoKCjMuIGl0
IGJlY29tZXMgaW1wb3NzaWJsZSB0byBjbGVhbiB0aGUgc291cmNlcyBpbiBvcmRlciB0byByZWJ1
aWxkIHRoZW0sCnNpbmNlIHRoZSBNYWtlZmlsZSB3aWxsIHJlbW92ZSB0aGUgZXh0ZXJuYWwgZGVw
ZW5kZW5jaWVzIHZpYSB0aGUgYG1ha2UgY2xlYW5gIHRhcmdldC4KU28gdXNpbmcgdGhlIGBtYWtl
IHdvcmxkYCB0YXJnZXQgaXMgZXhjbHVkZWQuCgpUaGlzIGlzIHdoeSBJIHdvdWxkIGxpa2UgdG8g
c3RhcnQgYSBkaXNjdXNzaW9uIG9uIGhvdyB0bwppbXByb3ZlIHRoZSBzaXR1YXRpb24gZm9yIHRo
b3NlIHdvcmtpbmcgaW4gYW4gYWlyLWdhcHBlZCBuZXR3b3JrIGVudmlyb25tZW50LgoKSSB3b3Vs
ZCBzdWdnZXN0IHRvIHRyYWNrIHRoZSBkZXBlbmRlbmNpZXMgdmlhIHN1Ym1vZHVsZXMsCmFuZCBm
dWxseSBjbG9uZSB0aGUgWGVuIHJlcG9zaXRvcnkgd2lsbCBiZWNvbWUgYXMgc2ltcGxlIGFzCmBn
aXQgY2xvbmUgZ2l0Oi8veGVuYml0cy54ZW4ub3JnL3hlbi5naXQgLS1yZWN1cnNpdmVgCgpPbmUg
b2YgdGhlIGFkdmFudGFnZXMgaXMgdGhhdCB5b3UgY2FuIGBjbGVhbmAgdGhlIHNvdXJjZXMgd2l0
aG91dCByZW1vdmluZyB0aGUgZXh0ZXJuYWwgZGVwZW5kZW5jaWVzLCBzaW5jZSB0aGV5IGFyZSBw
YXJ0IG9mIHRoZSByZXBvIG5vdy4KCi0+IEhvdyBkbyB5b3UgdGhpbmsgd2UgY2FuIGltcHJvdmUg
dGhlIGJ1aWxkIHN5c3RlbSB0byBiZSBtb3JlICJvZmZsaW5lIGVudmlyb25tZW50IiBmcmllbmRs
eSA/Ci0+IEhvdyBtdWNoIG9mIHRoZXNlIGV4dGVybmFsIGZpbGVzIGNvdWxkIGJlIGluc3RhbGxl
ZCB2aWEgdGhlIGRpc3RyaWJ1dGlvbiwgYW5kIGxpbmtlZCB3aXRoIFhlbiBpbnN0ZWFkIG9mIGRv
d25sb2FkaW5nIGEgLnRhci5neiBzb3VyY2UgPwpGb3IgZXhhbXBsZSBJIGhhdmUgbmV3bGliLWRl
diBpbiBteSBkZWJpYW4gcmVwb3NpdG9yaWVzLgpEbyBJIHJlYWxseSBoYXZlIHRvIGRvd25sb2Fk
IHRoZSBvbmUgZnJvbSBYZW4gbWlycm9ycyA/CgpUaGFua3MKCk1hdGhpZXUgVGFycmFsCgoKU2Vu
dCB3aXRoIFByb3Rvbk1haWwgU2VjdXJlIEVtYWlsLgoKCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZl
bEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxt
YW4vbGlzdGluZm8veGVuLWRldmVs
