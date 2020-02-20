Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DB3A165A91
	for <lists+xen-devel@lfdr.de>; Thu, 20 Feb 2020 10:55:11 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j4iVG-0005Yg-52; Thu, 20 Feb 2020 09:52:18 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=X/eN=4I=msd.im=msd+xen-devel@srs-us1.protection.inumbo.net>)
 id 1j4iVE-0005Xw-6D
 for xen-devel@lists.xenproject.org; Thu, 20 Feb 2020 09:52:16 +0000
X-Inumbo-ID: ab405e14-53c6-11ea-ade5-bc764e2007e4
Received: from smtp.smtpout.orange.fr (unknown [80.12.242.134])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id ab405e14-53c6-11ea-ade5-bc764e2007e4;
 Thu, 20 Feb 2020 09:52:13 +0000 (UTC)
Received: from msd.im ([86.192.232.123]) by mwinf5d23 with ME
 id 4xsB2200h2gQJfJ03xsCmv; Thu, 20 Feb 2020 10:52:12 +0100
X-ME-Helo: msd.im
X-ME-Auth: Z19kZXNwb2lzQG9yYW5nZS5mcg==
X-ME-Date: Thu, 20 Feb 2020 10:52:12 +0100
X-ME-IP: 86.192.232.123
Received: from [10.59.118.51] (82-64-206-189.subs.proxad.net [82.64.206.189])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128
 bits)) (No client certificate requested)
 by msd.im (Postfix) with ESMTPSA id AE9DD20178
 for <xen-devel@lists.xenproject.org>; Thu, 20 Feb 2020 10:52:11 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=msd.im; s=msd001;
 t=1582192331; bh=1ZuzhGLhyvdtKjbiM+4RqaVXiSWProAe6o9hNjv82HA=;
 h=From:To:Subject:Date:From;
 b=e2g8QaRnVSMLu3M1F2Lyxv073mK4ZKoRz+RKa+VkC/uXboR2n+6HBfbpT5M+9Z41a
 jEYZCEOdsh1HIBaTAoGKQErsvMfcDa3xrcGo+mhH1Snf/alhRp75NrT/K1l9lq2l7b
 URkBz0JrmNwWQbMsy+20OP1FZGSyQbTkLNXuolZtzkRNT4l85RhX8z496bsItD93hw
 KJ2hxqozbYNmYUBnOYylHHMQpcSzEMEtsR4J9O144M65JFt+EeatD8GEuV2NgxKuig
 U3SrUbqW5NJX1xEBhJWSlFCqFzEJZm3jXHh2ImK8F8OwXwat8+WUy0SQPHNuho+6y1
 8Mdnf9bQ5bw9A==
From: msd+xen-devel@msd.im
To: xen-devel@lists.xenproject.org
Message-ID: <35e1ce76-5415-1a3c-e391-2c7f2528f0f2@msd.im>
Date: Thu, 20 Feb 2020 10:52:09 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.3; Win64; x64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
Content-Language: en-GB
Subject: [Xen-devel] dom-u stuck in ---sr- state after reboot
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGkgZXZlcnlvbmUsCgpTaW5jZSBJIHVzZSBYZW4gNC4xMSBvbiBEZWJpYW4gMTAsIHNvbWV0aW1l
cyAoYWJvdXQgb25lIGluIHR3ZW50eSB0aW1lcykKYWZ0ZXIgYSBkb20tdSByZWJvb3QsIGl0IHN0
YXlzIHN0dWNrIHdpdGggdGhlIHN0YXRlICctLS1zci0nLgpUaGlzIGhhZCBuZXZlciBoYXBwZW5l
ZCBmb3IgbWUgd2l0aCBYZW4gNC40IG9uIERlYmlhbiA4LgoKSSBoYXZlIHRvIG1hbnVhbGx5IGRl
c3Ryb3kgYW5kIHJlYm9vdCB0aGUgZG9tLXUgc3R1Y2sgZG9tYWluLgoKSSBjYW4ndCBzZWUgYW55
IGVycm9yIGluIGxvZ3MuCgpEbyB5b3Uga25vdyB3aHkgYW5kIGhvdyBJIGNhbiBhdm9pZCBpdCA/
CgpCZXN0IHJlZ2FyZHMsCgoKR3VpbGxhdW1lCgpJIHRyeSB0byBhc2sgb24gdGhpcyBtYWlsaW5n
IGxpc3QgYmVjYXVzZSBJIGdvdCBubyByZXNwb25zZSBoZXJlIDoKaHR0cHM6Ly9tYXJrbWFpbC5v
cmcvbWVzc2FnZS9uNG1qaHZ4YWxjMmd3ZjY3CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0
cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlz
dGluZm8veGVuLWRldmVs
