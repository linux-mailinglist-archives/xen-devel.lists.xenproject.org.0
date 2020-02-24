Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7685E16A4F4
	for <lists+xen-devel@lfdr.de>; Mon, 24 Feb 2020 12:33:09 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j6Bx0-0001It-U0; Mon, 24 Feb 2020 11:31:02 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=ZQR9=4M=huawei.com=xuwei5@srs-us1.protection.inumbo.net>)
 id 1j6Bx0-0001Io-7h
 for xen-devel@lists.xenproject.org; Mon, 24 Feb 2020 11:31:02 +0000
X-Inumbo-ID: 1f278fac-56f9-11ea-8aec-12813bfff9fa
Received: from huawei.com (unknown [45.249.212.191])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 1f278fac-56f9-11ea-8aec-12813bfff9fa;
 Mon, 24 Feb 2020 11:30:57 +0000 (UTC)
Received: from DGGEMS405-HUB.china.huawei.com (unknown [172.30.72.58])
 by Forcepoint Email with ESMTP id C1751EBC4C7848E81306;
 Mon, 24 Feb 2020 19:30:54 +0800 (CST)
Received: from [127.0.0.1] (10.57.101.250) by DGGEMS405-HUB.china.huawei.com
 (10.3.19.205) with Microsoft SMTP Server id 14.3.439.0; Mon, 24 Feb 2020
 19:30:43 +0800
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
From: Wei Xu <xuwei5@hisilicon.com>
Message-ID: <5E53B3E3.6070304@hisilicon.com>
Date: Mon, 24 Feb 2020 19:30:43 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:38.0) Gecko/20100101
 Thunderbird/38.2.0
MIME-Version: 1.0
X-Originating-IP: [10.57.101.250]
X-CFilter-Loop: Reflected
Subject: [Xen-devel] [PATCH] ns16550: Re-order the serial port address
 checking
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 "Zengtao \(B\)" <prime.zeng@hisilicon.com>, Wei Liu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Linuxarm <linuxarm@huawei.com>,
 xuwei5@hisilicon.com,
 Shameerali Kolothum Thodi <shameerali.kolothum.thodi@huawei.com>,
 Jan Beulich <jbeulich@suse.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Q2hlY2sgdGhlIHNlcmlhbCBwb3J0IGFkZHJlc3Mgc3BhY2UgYmVmb3JlIGNoZWNraW5nIHRoZSBh
ZGRyZXNzLgoKU2lnbmVkLW9mZi1ieTogV2VpIFh1IDx4dXdlaTVAaGlzaWxpY29uLmNvbT4KLS0t
CiB4ZW4vZHJpdmVycy9jaGFyL25zMTY1NTAuYyB8IDEyICsrKysrKy0tLS0tLQogMSBmaWxlIGNo
YW5nZWQsIDYgaW5zZXJ0aW9ucygrKSwgNiBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS94ZW4v
ZHJpdmVycy9jaGFyL25zMTY1NTAuYyBiL3hlbi9kcml2ZXJzL2NoYXIvbnMxNjU1MC5jCmluZGV4
IGRjOGFjNGMuLjQyNWUwNDQgMTAwNjQ0Ci0tLSBhL3hlbi9kcml2ZXJzL2NoYXIvbnMxNjU1MC5j
CisrKyBiL3hlbi9kcml2ZXJzL2NoYXIvbnMxNjU1MC5jCkBAIC0xNjQ0LDYgKzE2NDQsMTIgQEAg
c3RhdGljIGludCBfX2luaXQgbnMxNjU1MF9hY3BpX3VhcnRfaW5pdChjb25zdCB2b2lkICpkYXRh
KQoKICAgICBzcGNyID0gY29udGFpbmVyX29mKHRhYmxlLCBzdHJ1Y3QgYWNwaV90YWJsZV9zcGNy
LCBoZWFkZXIpOwoKKyAgICBpZiAoIHVubGlrZWx5KHNwY3ItPnNlcmlhbF9wb3J0LnNwYWNlX2lk
ICE9IEFDUElfQURSX1NQQUNFX1NZU1RFTV9NRU1PUlkpICkKKyAgICB7CisgICAgICAgIHByaW50
aygibnMxNjU1MDogQWRkcmVzcyBzcGFjZSB0eXBlIGlzIG5vdCBtbWlvXG4iKTsKKyAgICAgICAg
cmV0dXJuIC1FSU5WQUw7CisgICAgfQorCiAgICAgLyoKICAgICAgKiBUaGUgc2VyaWFsIHBvcnQg
YWRkcmVzcyBtYXkgYmUgMCBmb3IgZXhhbXBsZQogICAgICAqIGlmIHRoZSBjb25zb2xlIHJlZGly
ZWN0aW9uIGlzIGRpc2FibGVkLgpAQCAtMTY1NCwxMiArMTY2MCw2IEBAIHN0YXRpYyBpbnQgX19p
bml0IG5zMTY1NTBfYWNwaV91YXJ0X2luaXQoY29uc3Qgdm9pZCAqZGF0YSkKICAgICAgICAgcmV0
dXJuIC1FSU5WQUw7CiAgICAgfQoKLSAgICBpZiAoIHVubGlrZWx5KHNwY3ItPnNlcmlhbF9wb3J0
LnNwYWNlX2lkICE9IEFDUElfQURSX1NQQUNFX1NZU1RFTV9NRU1PUlkpICkKLSAgICB7Ci0gICAg
ICAgIHByaW50aygibnMxNjU1MDogQWRkcmVzcyBzcGFjZSB0eXBlIGlzIG5vdCBtbWlvXG4iKTsK
LSAgICAgICAgcmV0dXJuIC1FSU5WQUw7Ci0gICAgfQotCiAgICAgbnMxNjU1MF9pbml0X2NvbW1v
bih1YXJ0KTsKCiAgICAgLyoKLS0gCjIuOC4xCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlz
dHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xp
c3RpbmZvL3hlbi1kZXZlbA==
