Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 95F9BFC3C8
	for <lists+xen-devel@lfdr.de>; Thu, 14 Nov 2019 11:16:06 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iVC7Y-0007ya-UK; Thu, 14 Nov 2019 10:13:00 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=H8L6=ZG=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1iVC7X-0007yV-C1
 for xen-devel@lists.xenproject.org; Thu, 14 Nov 2019 10:12:59 +0000
X-Inumbo-ID: 54fe0e58-06c7-11ea-a247-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 54fe0e58-06c7-11ea-a247-12813bfff9fa;
 Thu, 14 Nov 2019 10:12:58 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id CFF12B071;
 Thu, 14 Nov 2019 10:12:57 +0000 (UTC)
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <4a7245c0-5204-dfd4-be4c-a1ee4ca52adf@suse.com>
Date: Thu, 14 Nov 2019 11:13:14 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
Content-Language: en-US
Subject: [Xen-devel] [PATCH] x86emul: 16-bit XBEGIN does not truncate rIP
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
Cc: Juergen Gross <jgross@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

U0RNIHJldiAwNzEgcG9pbnRzIG91dCB0aGlzIGZhY3QgZXhwbGljaXRseS4KClNpZ25lZC1vZmYt
Ynk6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4KCi0tLSBhL3hlbi9hcmNoL3g4Ni94
ODZfZW11bGF0ZS94ODZfZW11bGF0ZS5jCisrKyBiL3hlbi9hcmNoL3g4Ni94ODZfZW11bGF0ZS94
ODZfZW11bGF0ZS5jCkBAIC00MjQ2LDEwICs0MjQ2LDEyIEBAIHg4Nl9lbXVsYXRlKAogICAgICAg
ICB7CiAgICAgICAgICAgICAvKgogICAgICAgICAgICAgICogeGJlZ2luIHVuY29uZGl0aW9uYWxs
eSBhYm9ydHMsIHhhYm9ydCBpcyB1bmNvbmRpdGlvbmFsbHkKLSAgICAgICAgICAgICAqIGEgbm9w
LgorICAgICAgICAgICAgICogYSBub3AuIEl0IGFsc28gZG9lcyBub3QgdHJ1bmNhdGUgdGhlIGRl
c3RpbmF0aW9uIGFkZHJlc3MgdG8KKyAgICAgICAgICAgICAqIDE2IGJpdHMgd2hlbiAxNi1iaXQg
b3BlcmFuZCBzaXplIGlzIGluIGVmZmVjdC4KICAgICAgICAgICAgICAqLwogICAgICAgICAgICAg
aWYgKCBiICYgMSApCiAgICAgICAgICAgICB7CisgICAgICAgICAgICAgICAgb3BfYnl0ZXMgPSA0
OwogICAgICAgICAgICAgICAgIGptcF9yZWwoKGludDMyX3Qpc3JjLnZhbCk7CiAgICAgICAgICAg
ICAgICAgX3JlZ3MucihheCkgPSAwOwogICAgICAgICAgICAgfQoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4t
ZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9t
YWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
