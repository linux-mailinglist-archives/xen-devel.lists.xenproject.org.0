Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E5B66B473F
	for <lists+xen-devel@lfdr.de>; Tue, 17 Sep 2019 08:16:57 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iA6km-0000lB-PB; Tue, 17 Sep 2019 06:14:20 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=+VJ/=XM=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1iA6kl-0000ks-LK
 for xen-devel@lists.xenproject.org; Tue, 17 Sep 2019 06:14:19 +0000
X-Inumbo-ID: 617bf3bc-d912-11e9-b299-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 617bf3bc-d912-11e9-b299-bc764e2007e4;
 Tue, 17 Sep 2019 06:14:18 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id A78C2AC93;
 Tue, 17 Sep 2019 06:14:17 +0000 (UTC)
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <625c29ba-cfb8-88ee-eb15-5f2019198865@suse.com>
Message-ID: <17dad502-8e1f-83b9-7071-c8e342bc6104@suse.com>
Date: Tue, 17 Sep 2019 08:14:02 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <625c29ba-cfb8-88ee-eb15-5f2019198865@suse.com>
Content-Language: en-US
Subject: [Xen-devel] [PATCH v2 3/9] x86/mm: honor opt_pcid also for 32-bit
 PV domains
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

SSBjYW4ndCBzZWUgYW55IHRlY2huaWNhbCBvciBwZXJmb3JtYW5jZSByZWFzb24gd2h5IHdlIHNo
b3VsZCB0cmVhdAozMi1iaXQgUFYgZGlmZmVyZW50IGZyb20gNjQtYml0IFBWIGluIHRoaXMgcmVn
YXJkLgoKU2lnbmVkLW9mZi1ieTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgpSZXZp
ZXdlZC1ieTogUm9nZXIgUGF1IE1vbm7DqSA8cm9nZXIucGF1QGNpdHJpeC5jb20+CgotLS0gYS94
ZW4vYXJjaC94ODYvcHYvZG9tYWluLmMKKysrIGIveGVuL2FyY2gveDg2L3B2L2RvbWFpbi5jCkBA
IC0xODAsNyArMTgwLDI0IEBAIGludCBzd2l0Y2hfY29tcGF0KHN0cnVjdCBkb21haW4gKmQpCiAg
ICAgZC0+YXJjaC54ODdfZmlwX3dpZHRoID0gNDsKIAogICAgIGQtPmFyY2gucHYueHB0aSA9IGZh
bHNlOwotICAgIGQtPmFyY2gucHYucGNpZCA9IGZhbHNlOworCisgICAgaWYgKCB1c2VfaW52cGNp
ZCAmJiBjcHVfaGFzX3BjaWQgKQorICAgICAgICBzd2l0Y2ggKCBBQ0NFU1NfT05DRShvcHRfcGNp
ZCkgKQorICAgICAgICB7CisgICAgICAgIGNhc2UgUENJRF9PRkY6CisgICAgICAgIGNhc2UgUENJ
RF9YUFRJOgorICAgICAgICAgICAgZC0+YXJjaC5wdi5wY2lkID0gZmFsc2U7CisgICAgICAgICAg
ICBicmVhazsKKworICAgICAgICBjYXNlIFBDSURfQUxMOgorICAgICAgICBjYXNlIFBDSURfTk9Y
UFRJOgorICAgICAgICAgICAgZC0+YXJjaC5wdi5wY2lkID0gdHJ1ZTsKKyAgICAgICAgICAgIGJy
ZWFrOworCisgICAgICAgIGRlZmF1bHQ6CisgICAgICAgICAgICBBU1NFUlRfVU5SRUFDSEFCTEUo
KTsKKyAgICAgICAgICAgIGJyZWFrOworICAgICAgICB9CiAKICAgICByZXR1cm4gMDsKIApAQCAt
MzEyLDcgKzMyOSw3IEBAIGludCBwdl9kb21haW5faW5pdGlhbGlzZShzdHJ1Y3QgZG9tYWluICoK
IAogICAgIGQtPmFyY2gucHYueHB0aSA9IGlzX2hhcmR3YXJlX2RvbWFpbihkKSA/IG9wdF94cHRp
X2h3ZG9tIDogb3B0X3hwdGlfZG9tdTsKIAotICAgIGlmICggIWlzX3B2XzMyYml0X2RvbWFpbihk
KSAmJiB1c2VfaW52cGNpZCAmJiBjcHVfaGFzX3BjaWQgKQorICAgIGlmICggdXNlX2ludnBjaWQg
JiYgY3B1X2hhc19wY2lkICkKICAgICAgICAgc3dpdGNoICggQUNDRVNTX09OQ0Uob3B0X3BjaWQp
ICkKICAgICAgICAgewogICAgICAgICBjYXNlIFBDSURfT0ZGOgoKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVu
LWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcv
bWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
