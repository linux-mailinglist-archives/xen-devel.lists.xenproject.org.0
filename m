Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EA6811845D0
	for <lists+xen-devel@lfdr.de>; Fri, 13 Mar 2020 12:18:43 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jCiIT-0006DH-PZ; Fri, 13 Mar 2020 11:16:09 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=9TpK=46=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jCiIS-0006D4-CU
 for xen-devel@lists.xenproject.org; Fri, 13 Mar 2020 11:16:08 +0000
X-Inumbo-ID: 09075bb8-651c-11ea-b2c4-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 09075bb8-651c-11ea-b2c4-12813bfff9fa;
 Fri, 13 Mar 2020 11:16:07 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 15ACBAAC7;
 Fri, 13 Mar 2020 11:16:07 +0000 (UTC)
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <9b64e44c-1050-4f64-1ead-86761f7b7fa2@suse.com>
Message-ID: <00ca439e-b6a6-160e-fc5d-8c51da2a0987@suse.com>
Date: Fri, 13 Mar 2020 12:16:10 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <9b64e44c-1050-4f64-1ead-86761f7b7fa2@suse.com>
Content-Language: en-US
Subject: [Xen-devel] [PATCH v3 5/9] x86/HVM: reduce vioapic.h include
 dependencies
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

RHJvcCBhbiAjaW5jbHVkZSBub3QgbmVlZGVkIGJ5IHRoZSBoZWFkZXIgaXRzZWxmLiBXaGlsZSB2
ZXJpZnlpbmcgdGhlCmhlYWRlciAobm93KSBidWlsZHMgc3RhbmRhbG9uZSwgSSBub3RpY2VkIGFu
IG9taXNzaW9uIGluIGEgcHVibGljIGhlYWRlcgp3aGljaCBnZXRzIHRha2VuIGNhcmUgb2YgaGVy
ZSBhcyB3ZWxsLgoKU2lnbmVkLW9mZi1ieTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29t
PgoKLS0tIGEveGVuL2luY2x1ZGUvYXNtLXg4Ni9odm0vdmlvYXBpYy5oCisrKyBiL3hlbi9pbmNs
dWRlL2FzbS14ODYvaHZtL3Zpb2FwaWMuaApAQCAtMjUsNyArMjUsNiBAQAogI2RlZmluZSBfX0FT
TV9YODZfSFZNX1ZJT0FQSUNfSF9fCiAKICNpbmNsdWRlIDx4ZW4vdHlwZXMuaD4KLSNpbmNsdWRl
IDx4ZW4vc21wLmg+CiAjaW5jbHVkZSA8cHVibGljL2h2bS9zYXZlLmg+CiAKICNkZWZpbmUgVklP
QVBJQ19WRVJTSU9OX0lEIDB4MTEgLyogSU9BUElDIHZlcnNpb24gKi8KLS0tIGEveGVuL2luY2x1
ZGUvcHVibGljL2FyY2gteDg2L2h2bS9zYXZlLmgKKysrIGIveGVuL2luY2x1ZGUvcHVibGljL2Fy
Y2gteDg2L2h2bS9zYXZlLmgKQEAgLTI2LDYgKzI2LDggQEAKICNpZm5kZWYgX19YRU5fUFVCTElD
X0hWTV9TQVZFX1g4Nl9IX18KICNkZWZpbmUgX19YRU5fUFVCTElDX0hWTV9TQVZFX1g4Nl9IX18K
IAorI2luY2x1ZGUgIi4uLy4uL3hlbi5oIgorCiAvKgogICogU2F2ZS9yZXN0b3JlIGhlYWRlcjog
Z2VuZXJhbCBpbmZvIGFib3V0IHRoZSBzYXZlIGZpbGUuCiAgKi8KCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhl
bi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3Jn
L21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
