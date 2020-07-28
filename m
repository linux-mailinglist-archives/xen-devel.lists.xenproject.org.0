Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C6E0D230775
	for <lists+xen-devel@lfdr.de>; Tue, 28 Jul 2020 12:16:19 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k0MeQ-0007VW-EC; Tue, 28 Jul 2020 10:16:02 +0000
Resent-Date: Tue, 28 Jul 2020 10:16:02 +0000
Resent-Message-Id: <E1k0MeQ-0007VW-EC@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=PPGR=BH=patchew.org=no-reply@srs-us1.protection.inumbo.net>)
 id 1k0MeP-0007VN-Co
 for xen-devel@lists.xenproject.org; Tue, 28 Jul 2020 10:16:01 +0000
X-Inumbo-ID: 50a8014c-d0bb-11ea-a88e-12813bfff9fa
Received: from sender4-of-o57.zoho.com (unknown [136.143.188.57])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 50a8014c-d0bb-11ea-a88e-12813bfff9fa;
 Tue, 28 Jul 2020 10:15:52 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1595931335; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=gnWIF8tKZ21krMd4CyQBMHsJ3sp85Sky3fozkOqX5IPzKyBFRAFN4rxWCfiakbA6G45qPkZAwrZOz4upub/0uCCFmGZcu5nHmwAxV9pMG40T3A/gSCtnMmRrBf6DWmf/6CJMkLtYoKINksSQr1ZKVnUhPQNsRBZ++IQ2/jDeuhQ=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1595931335;
 h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:Reply-To:Subject:To;
 bh=IAuw8LyCXyP8m3ZRiPRN7vC6Q+SkTb4+JXRWw49XNSE=; 
 b=WazofzMan9KjIol6ttc45TjVf67qSJcZykkSH3/ux052HxGznA0IiMJOZtLIC4uZmF+dpbKjrLWdjiKtMKFM8gB5j7OsyBjnjSl2cM0FFe8Sq/PjLnsGZqoRptJ4x1/cxxVEzrYNH90gv+Sqi1BReUG5e/NU9bk+atiae6QTF2g=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 spf=pass  smtp.mailfrom=no-reply@patchew.org;
 dmarc=pass header.from=<no-reply@patchew.org>
 header.from=<no-reply@patchew.org>
Received: from [172.17.0.3] (23.253.156.214 [23.253.156.214]) by
 mx.zohomail.com with SMTPS id 1595931333107699.9161531048355;
 Tue, 28 Jul 2020 03:15:33 -0700 (PDT)
Subject: Re: [PATCH-for-5.1] accel/xen: Fix xen_enabled() behavior on
 target-agnostic objects
Message-ID: <159593133240.22228.17592220013997022688@66eaa9a8a123>
In-Reply-To: <20200728100925.10454-1-philmd@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Resent-From: 
From: no-reply@patchew.org
To: philmd@redhat.com
Date: Tue, 28 Jul 2020 03:15:33 -0700 (PDT)
X-ZohoMailClient: External
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Reply-To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org, sstabellini@kernel.org, paul@xen.org,
 pdurrant@amazon.com, qemu-devel@nongnu.org, pbonzini@redhat.com,
 anthony.perard@citrix.com, xen-devel@lists.xenproject.org, philmd@redhat.com
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

UGF0Y2hldyBVUkw6IGh0dHBzOi8vcGF0Y2hldy5vcmcvUUVNVS8yMDIwMDcyODEwMDkyNS4xMDQ1
NC0xLXBoaWxtZEByZWRoYXQuY29tLwoKCgpIaSwKClRoaXMgc2VyaWVzIGZhaWxlZCB0aGUgZG9j
a2VyLXF1aWNrQGNlbnRvczcgYnVpbGQgdGVzdC4gUGxlYXNlIGZpbmQgdGhlIHRlc3RpbmcgY29t
bWFuZHMgYW5kCnRoZWlyIG91dHB1dCBiZWxvdy4gSWYgeW91IGhhdmUgRG9ja2VyIGluc3RhbGxl
ZCwgeW91IGNhbiBwcm9iYWJseSByZXByb2R1Y2UgaXQKbG9jYWxseS4KCj09PSBURVNUIFNDUklQ
VCBCRUdJTiA9PT0KIyEvYmluL2Jhc2gKbWFrZSBkb2NrZXItaW1hZ2UtY2VudG9zNyBWPTEgTkVU
V09SSz0xCnRpbWUgbWFrZSBkb2NrZXItdGVzdC1xdWlja0BjZW50b3M3IFNIT1dfRU5WPTEgSj0x
NCBORVRXT1JLPTEKPT09IFRFU1QgU0NSSVBUIEVORCA9PT0KCgoKClRoZSBmdWxsIGxvZyBpcyBh
dmFpbGFibGUgYXQKaHR0cDovL3BhdGNoZXcub3JnL2xvZ3MvMjAyMDA3MjgxMDA5MjUuMTA0NTQt
MS1waGlsbWRAcmVkaGF0LmNvbS90ZXN0aW5nLmRvY2tlci1xdWlja0BjZW50b3M3Lz90eXBlPW1l
c3NhZ2UuCi0tLQpFbWFpbCBnZW5lcmF0ZWQgYXV0b21hdGljYWxseSBieSBQYXRjaGV3IFtodHRw
czovL3BhdGNoZXcub3JnL10uClBsZWFzZSBzZW5kIHlvdXIgZmVlZGJhY2sgdG8gcGF0Y2hldy1k
ZXZlbEByZWRoYXQuY29t

