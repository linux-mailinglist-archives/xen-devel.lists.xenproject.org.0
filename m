Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 642C535C7AD
	for <lists+xen-devel@lfdr.de>; Mon, 12 Apr 2021 15:30:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.109092.208207 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lVwds-0008WR-Do; Mon, 12 Apr 2021 13:30:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 109092.208207; Mon, 12 Apr 2021 13:30:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lVwds-0008Vy-9m; Mon, 12 Apr 2021 13:30:16 +0000
Received: by outflank-mailman (input) for mailman id 109092;
 Mon, 12 Apr 2021 13:30:14 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=OvXO=JJ=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1lVwdq-0008Sj-IW
 for xen-devel@lists.xenproject.org; Mon, 12 Apr 2021 13:30:14 +0000
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 7542aa17-3ec1-46b4-94b9-a7edf471214f;
 Mon, 12 Apr 2021 13:30:09 +0000 (UTC)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
X-Inumbo-ID: 7542aa17-3ec1-46b4-94b9-a7edf471214f
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1618234209;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=xZUbtLTyjEiWLCPVXEVqDePxTYjpX+u+jaOjtO0ZwNg=;
  b=VOtTcwk79gM/Qt0T9YYOyjnOX9pZUqWGqVOpGmndq2RIoQzLstywRRtG
   /nHNCsULA6zzz2/FojH/q8QcqwBrML81GP2ZX/O1KxCOVYCJ6IAuEju9D
   QH8W67svmoPxtpzMnXJ01wRUpR0In2M2hQCLAynyaWl8Dak1HC2qZPEKY
   Q=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: bnZS9KaRw5kBuUs9StJn+Xyrj0UtotEFUuo9WHjYT2a++pjb8i9iEtGXoEK4ZIo2ELx4d3J/DR
 tK94ZbVlawtNr/267odPMpmu32/64V00uBMvBSOiS1xKuz6ByvpjCgMf681VGsq1n1xkWHit6+
 lZRUrNd6rqHBIkWIOC5+K5oGzSWVAfbvAUySD+N6yacjug5eJ9GVgTz+XaZ0Vq7cl622sGL0+Y
 Mp+gWT8F+2fcZAwgf4bNypxUZCkFfZUBAPpFqfywOJVvnSanaX0h+Vkgfweol7loIK14UziSMM
 gZU=
X-SBRS: 4.0
X-MesageID: 41232826
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23: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
 ftGQc=
X-IronPort-AV: E=Sophos;i="5.82,216,1613451600"; 
   d="scan'208";a="41232826"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <devel@edk2.groups.io>
CC: Laszlo Ersek <lersek@redhat.com>, Jordan Justen
	<jordan.l.justen@intel.com>, Ard Biesheuvel <ardb+tianocore@kernel.org>,
	<xen-devel@lists.xenproject.org>, Anthony PERARD <anthony.perard@citrix.com>,
	Julien Grall <julien@xen.org>
Subject: [PATCH v3 1/7] OvmfPkg/XenResetVector: Silent a warning from nasm
Date: Mon, 12 Apr 2021 14:29:57 +0100
Message-ID: <20210412133003.146438-2-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210412133003.146438-1-anthony.perard@citrix.com>
References: <20210412133003.146438-1-anthony.perard@citrix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Type: text/plain

VG8gYXZvaWQgbmFzbSBnZW5lcmF0aW5nIGEgd2FybmluZywgcmVwbGFjZSB0aGUgbWFjcm8gYnkg
dGhlIHZhbHVlCmV4cGVjdGVkIHRvIGJlIHN0b3JlZCBpbiBlYXguCiAgSWEzMi9YZW5QVkhNYWlu
LmFzbTo3Njogd2FybmluZzogZHdvcmQgZGF0YSBleGNlZWRzIGJvdW5kcwoKUmVwb3J0ZWQtYnk6
IExhc3psbyBFcnNlayA8bGVyc2VrQHJlZGhhdC5jb20+ClNpZ25lZC1vZmYtYnk6IEFudGhvbnkg
UEVSQVJEIDxhbnRob255LnBlcmFyZEBjaXRyaXguY29tPgpSZXZpZXdlZC1ieTogTGFzemxvIEVy
c2VrIDxsZXJzZWtAcmVkaGF0LmNvbT4KLS0tCiBPdm1mUGtnL1hlblJlc2V0VmVjdG9yL0lhMzIv
WGVuUFZITWFpbi5hc20gfCAyICstCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEg
ZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS9Pdm1mUGtnL1hlblJlc2V0VmVjdG9yL0lhMzIvWGVu
UFZITWFpbi5hc20gYi9Pdm1mUGtnL1hlblJlc2V0VmVjdG9yL0lhMzIvWGVuUFZITWFpbi5hc20K
aW5kZXggMmRmMGYxMmUxOGNiLi5jNzYxZTlkMzA3MjkgMTAwNjQ0Ci0tLSBhL092bWZQa2cvWGVu
UmVzZXRWZWN0b3IvSWEzMi9YZW5QVkhNYWluLmFzbQorKysgYi9Pdm1mUGtnL1hlblJlc2V0VmVj
dG9yL0lhMzIvWGVuUFZITWFpbi5hc20KQEAgLTczLDcgKzczLDcgQEAgeGVuUFZITWFpbjoKICAg
ICA7DQogICAgIDsgcGFyYW1ldGVyIGZvciBGbGF0MzJTZWFyY2hGb3JCZnZCYXNlDQogICAgIDsN
Ci0gICAgbW92ICAgICBlYXgsIEFERFJfT0YoZm91ckdpZ2FieXRlcykNCisgICAgbW92ICAgICBl
YXgsIDAgICA7IEFERFJfT0YoZm91ckdpZ2FieXRlcykNCiAgICAgYWRkICAgICBlYXgsIGVkeCA7
IGFkZCBkZWx0YQ0KIA0KICAgICA7DQotLSAKQW50aG9ueSBQRVJBUkQKCg==

