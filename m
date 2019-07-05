Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EC760601E2
	for <lists+xen-devel@lfdr.de>; Fri,  5 Jul 2019 10:00:09 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hjJ5m-00074s-2V; Fri, 05 Jul 2019 07:57:14 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=377A=VC=gmail.com=viktor.mitin.19@srs-us1.protection.inumbo.net>)
 id 1hjJ5k-00074n-SN
 for xen-devel@lists.xenproject.org; Fri, 05 Jul 2019 07:57:12 +0000
X-Inumbo-ID: 7e667fc2-9efa-11e9-8980-bc764e045a96
Received: from mail-io1-xd2b.google.com (unknown [2607:f8b0:4864:20::d2b])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 7e667fc2-9efa-11e9-8980-bc764e045a96;
 Fri, 05 Jul 2019 07:57:11 +0000 (UTC)
Received: by mail-io1-xd2b.google.com with SMTP id o9so1748494iom.3
 for <xen-devel@lists.xenproject.org>; Fri, 05 Jul 2019 00:57:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to:cc;
 bh=BGDu6y3xY81O7NBG7q5IOiWmQc39Q7H6aS3SEL2P4/g=;
 b=i0yy2uJaIQvkH3WHlkv9pOq5F3dtCLA0iNQbrBAIzhw6vEWZJqAgLhKYbCeIg1usrp
 Ea3zT4KC4yzHLBeGBtK91/YaJLL0PRBbl/BNLC5iCh75u7s/oDAxLK4nXTFBa8Gd4QQm
 2wHuo54AZebYpZZI1JI5jbtAjxsqypjGllceZbnGEwo7ebIYc7yALCHghhB/exINgmbI
 umThHXTMLkhYP9+XmCDxK2d2hxQe2kTpes5et8bg5qmLXTRhutA3lnj4ssQnt4Y++Ws3
 kGKT7AsRHTQg4HZiSSN2cMNChifOpPGJqDfhg/S33/4EjB3mfEdkp+rMCrqXUKemgkNo
 jmjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=BGDu6y3xY81O7NBG7q5IOiWmQc39Q7H6aS3SEL2P4/g=;
 b=NZPK2B3gvWRY68ghJksat7aKi3TrUoDyH3YNCkB6zqmSjKI/1rej/IFGJ1JZKgbHBR
 dHc4l7vkglFWCaUTtoNR0NcwWpcHWs/xOrEoHykPpDpaHplae6awzP4sAPNfU0TfUuyT
 TY4MmtexlCwT3wZ2JmsUNJI43Vwgt0tYy5sWqnwOKwXVhf9B9fF7NKga38LxZKhqulSP
 355WhYJHtDG2m6lO2JZzkmF5KyrOS1JqBxyUomzl0Y1ne41ONM32UI6nkgdqGwYOy6QI
 80jrN/sw2UNwVj9qgo9hp417ZpaZo54SkG8/HqqO3YkXoGoEa1a1XCPTOr7vtYxJN4YZ
 LO+g==
X-Gm-Message-State: APjAAAXvOHUv/xG2iVklvg80pMvmbBF+w9DnwWjDTBEL7kb4xdiuf0VG
 M5fIu7VH9xFEPULlDNQEk9qf4sxpxL9cfHFgyvc=
X-Google-Smtp-Source: APXvYqzJgp0+2U0Iol/pRksOxCBAHPWRTHSfvTSqlwFQBEkH2KK5hYdzGOF9e/lroEfMWiShuX3yAcX5YQkQh8AEgvQ=
X-Received: by 2002:a6b:b206:: with SMTP id b6mr2987057iof.286.1562313430825; 
 Fri, 05 Jul 2019 00:57:10 -0700 (PDT)
MIME-Version: 1.0
From: Viktor Mitin <viktor.mitin.19@gmail.com>
Date: Fri, 5 Jul 2019 10:57:00 +0300
Message-ID: <CAOcoXZYAhs=BOSQ8hw2k1t6N6e5d43o1Hv2+drAW+NEqqYAjeg@mail.gmail.com>
To: Julien Grall <julien.grall@arm.com>,
 Stefano Stabellini <sstabellini@kernel.org>, 
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [Xen-devel] rcar sk rev3 + kf dom0less setup works well
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
Cc: xen-devel <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGkgQWxsLAoKVGhhbmsgeW91IHZlcnkgbXVjaCBmb3IgYWxsIHRoZSBjb2RlIGFuZCBjb25maWd1
cmF0aW9uIGluZm9ybWF0aW9uCnByb3ZpZGVkLiBGaW5hbGx5LCBpdCB3YXMgcG9zc2libGUgdG8g
Y2hlY2sgdGhlIG5leHQgcGF0Y2hlcyB3aXRoIHJjYXIKc2sgcmV2MyArIGtmICBib2FyZC4gUGxl
YXNlIGJlIGF3YXJlIHRoYXQgdGhlIHBhdGNoZXMgaGFzIGJlZW4KYWRkaXRpb25hbGx5IGNoZWNr
ZWQgd2l0aCBkb20wbGVzcyBzZXR1cCAobmF0aXZlIHhlbiB3aXRoIGRvbTAgaGFkCmJlZW4gdGVz
dGVkIHByZXZpb3VzbHkgYXMgd2VsbCkuIFBsZWFzZSByZXZpZXcgYW5kIGludGVncmF0ZSB0aGUK
cGF0Y2hlcy4KCjEpIFtQQVRDSF0geGVuL2FybTogbWVyZ2UgbWFrZV90aW1lcl9ub2RlIGFuZCBt
YWtlX3RpbWVyX2RvbVVfbm9kZQoyKSBbUEFUQ0hdIHhlbi9hcm06IHJlbW92ZSB1bnVzZWQgZHRf
ZGV2aWNlX25vZGUgcGFyYW1ldGVyCgpQbGVhc2Ugbm90ZSB0aGF0IHBhdGNoIDwxPiBpcyBiYXNl
ZCBvbiBwYXRjaCA8Mj4uIEkgd2lsbCBzZW5kIHN1Y2gKa2luZCBvZiBwYXRjaGVzIGFzIHNlcmll
cyBmb3IgdGhlIG5leHQgdGltZS4KClRoYW5rcywKVmlrdG9yIE1pdGluCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0
Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qu
b3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
