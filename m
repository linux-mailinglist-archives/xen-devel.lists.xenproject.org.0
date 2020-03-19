Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E4F5D18BC57
	for <lists+xen-devel@lfdr.de>; Thu, 19 Mar 2020 17:24:26 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jExvF-0001rj-Nf; Thu, 19 Mar 2020 16:21:29 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=xVQf=5E=gmail.com=julien.grall.oss@srs-us1.protection.inumbo.net>)
 id 1jExvE-0001rc-BL
 for xen-devel@lists.xenproject.org; Thu, 19 Mar 2020 16:21:28 +0000
X-Inumbo-ID: ae0402c2-69fd-11ea-bc3d-12813bfff9fa
Received: from mail-ed1-f65.google.com (unknown [209.85.208.65])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id ae0402c2-69fd-11ea-bc3d-12813bfff9fa;
 Thu, 19 Mar 2020 16:21:27 +0000 (UTC)
Received: by mail-ed1-f65.google.com with SMTP id b23so3423179edx.4
 for <xen-devel@lists.xenproject.org>; Thu, 19 Mar 2020 09:21:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=NSRd5bLklanyiPXI/FAgaNszWbin5v5E8XUito3Iygo=;
 b=WzmikfOc+B6ZPEYIZ3cAAxUAy0P3e84uG131nKksNvtvJYL0PF/FtuWXVWaQ1TK9KA
 akCvmEBkgI993MGj3uNgThq77YSs1fyPllMxTb/GWhlBIH8kmECHTkRnpPgnX23O0pJx
 SXT3bkjhAPcyW+Eu0v42Eoa93J22L8FG5zeUWy27SWelRjFpnAyRC16L018m+vi4Gqhr
 NkQ/8onw4fDDupjwlueY/wVOi6L+6jlMSG4N+OxdqnG2oroY/QPdnt49VF5t0IuR3Eew
 yWtHWA/wDz01IqPbJg8Bw8TydtmNK/hMK5H+F31DaCQkWydDhOWhfgf24U3fZCXRYhz8
 1xWg==
X-Gm-Message-State: ANhLgQ0L0hqSuCvybnfpPac3CmdffuIqcMXJoiwM2FNNeWDtVnmXbF02
 zMFfHN0bOwIxur4in4C9z0U=
X-Google-Smtp-Source: ADFU+vvtek2YkWPpfifsZRUOgJd6QDpOxuHj6l/qef1SHM47wYPh/vPjLgxpcWewXyam34/xdLgJTw==
X-Received: by 2002:a50:ed06:: with SMTP id j6mr3686502eds.89.1584634886532;
 Thu, 19 Mar 2020 09:21:26 -0700 (PDT)
Received: from a483e7b01a66.ant.amazon.com (54-240-197-232.amazon.com.
 [54.240.197.232])
 by smtp.gmail.com with ESMTPSA id ck21sm155590ejb.51.2020.03.19.09.21.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 19 Mar 2020 09:21:25 -0700 (PDT)
To: Roger Pau Monne <roger.pau@citrix.com>, xen-devel@lists.xenproject.org
References: <20200319154716.34556-1-roger.pau@citrix.com>
 <20200319154716.34556-2-roger.pau@citrix.com>
From: Julien Grall <julien@xen.org>
Message-ID: <83b8dc44-6ecf-9bdf-957b-3c502e4df926@xen.org>
Date: Thu, 19 Mar 2020 16:21:23 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:68.0)
 Gecko/20100101 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <20200319154716.34556-2-roger.pau@citrix.com>
Content-Language: en-GB
Subject: Re: [Xen-devel] [PATCH v7 1/3] x86/tlb: introduce a flush HVM ASIDs
 flag
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
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Tim Deegan <tim@xen.org>,
 Jan Beulich <jbeulich@suse.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGksCgpPbiAxOS8wMy8yMDIwIDE1OjQ3LCBSb2dlciBQYXUgTW9ubmUgd3JvdGU6Cj4gZGlmZiAt
LWdpdCBhL3hlbi9pbmNsdWRlL3hlbi9tbS5oIGIveGVuL2luY2x1ZGUveGVuL21tLmgKPiBpbmRl
eCBkMGQwOTVkOWM3Li4wMmFhZDQzMDQyIDEwMDY0NAo+IC0tLSBhL3hlbi9pbmNsdWRlL3hlbi9t
bS5oCj4gKysrIGIveGVuL2luY2x1ZGUveGVuL21tLmgKPiBAQCAtNjQ0LDcgKzY0NCw3IEBAIHN0
YXRpYyBpbmxpbmUgdm9pZCBmaWx0ZXJlZF9mbHVzaF90bGJfbWFzayh1aW50MzJfdCB0bGJmbHVz
aF90aW1lc3RhbXApCj4gICAgICAgaWYgKCAhY3B1bWFza19lbXB0eSgmbWFzaykgKQo+ICAgICAg
IHsKPiAgICAgICAgICAgcGVyZmNfaW5jcihuZWVkX2ZsdXNoX3RsYl9mbHVzaCk7Cj4gLSAgICAg
ICAgZmx1c2hfdGxiX21hc2soJm1hc2spOwo+ICsgICAgICAgIGZsdXNoX21hc2soJm1hc2ssIEZM
VVNIX1RMQiB8IEZMVVNIX0hWTV9BU0lEX0NPUkUpOwoKQSBydWxlIG9mIHRodW1iIGlzIGFueSBt
b2RpZmljYXRpb24gaW4gY29tbW9uIGNvZGUgbWF5IGltcGFjdCBBcm0uIFRoaXMgCmlzIGEgY2Fz
ZSBoZXJlIGJlY2F1c2UgdGhlIGZsYWcgYW5kIHRoZSAibmV3IiBmdW5jdGlvbiBhcmUgbm90IGRl
ZmluZWQgCm9uIEFybSBhbmQgdGhlcmVmb3JlIGdvaW5nIHRvIGJyZWFrIHRoZSBidWlsZC4KCldo
eSBjYW4ndCB5b3Uga2VlcCBmbHVzaF90bGJfbWFzaygpIGhlcmU/CgpDaGVlcnMsCgotLSAKSnVs
aWVuIEdyYWxsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpo
dHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
