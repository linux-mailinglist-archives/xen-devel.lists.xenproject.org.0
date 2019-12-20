Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E2133127C6A
	for <lists+xen-devel@lfdr.de>; Fri, 20 Dec 2019 15:21:36 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iiJ89-0003ri-EC; Fri, 20 Dec 2019 14:19:49 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=fFWP=2K=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1iiJ87-0003rA-IN
 for xen-devel@lists.xenproject.org; Fri, 20 Dec 2019 14:19:47 +0000
X-Inumbo-ID: c5d67eb6-2333-11ea-9367-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id c5d67eb6-2333-11ea-9367-12813bfff9fa;
 Fri, 20 Dec 2019 14:19:46 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 83B2FB23D;
 Fri, 20 Dec 2019 14:19:45 +0000 (UTC)
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <aa264d92-2545-f2e7-5225-4f870e3ec8f9@suse.com>
Message-ID: <272862bd-0b05-9a66-c79e-76502b89dd38@suse.com>
Date: Fri, 20 Dec 2019 15:20:14 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <aa264d92-2545-f2e7-5225-4f870e3ec8f9@suse.com>
Content-Language: en-US
Subject: [Xen-devel] [PATCH 4/4] x86/mm: drop redundant smp_wmb() from
 _put_final_page_type()
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
Cc: George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Z2V0X3BhZ2VfbGlnaHQoKSdzIHVzZSBvZiBjbXB4Y2hnKCkgaXMgYSBmdWxsIGJhcnJpZXIgYWxy
ZWFkeSBhbnl3YXkuCgpTaWduZWQtb2ZmLWJ5OiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5j
b20+CgotLS0gYS94ZW4vYXJjaC94ODYvbW0uYworKysgYi94ZW4vYXJjaC94ODYvbW0uYwpAQCAt
Mjc0Niw3ICsyNzQ2LDcgQEAgc3RhdGljIGludCBfcHV0X2ZpbmFsX3BhZ2VfdHlwZShzdHJ1Y3Qg
cAogICAgIGVsc2UKICAgICB7CiAgICAgICAgIEJVR19PTihyYyAhPSAtRVJFU1RBUlQpOwotICAg
ICAgICBzbXBfd21iKCk7CisgICAgICAgIC8qIGdldF9wYWdlX2xpZ2h0KCkgaW5jbHVkZXMgYSBm
dWxsIGJhcnJpZXIuICovCiAgICAgICAgIGdldF9wYWdlX2xpZ2h0KHBhZ2UpOwogICAgICAgICBw
YWdlLT51LmludXNlLnR5cGVfaW5mbyB8PSBQR1RfcGFydGlhbDsKICAgICB9CgoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcg
bGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9q
ZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
