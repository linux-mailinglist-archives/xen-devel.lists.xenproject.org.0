Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D18F164FFF
	for <lists+xen-devel@lfdr.de>; Wed, 19 Feb 2020 21:36:02 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j4W1K-0001p4-Lw; Wed, 19 Feb 2020 20:32:34 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=OPzw=4H=eikelenboom.it=linux@srs-us1.protection.inumbo.net>)
 id 1j4W1I-0001or-PW
 for xen-devel@lists.xenproject.org; Wed, 19 Feb 2020 20:32:32 +0000
X-Inumbo-ID: f343a4e8-5356-11ea-aa99-bc764e2007e4
Received: from server.eikelenboom.it (unknown [91.121.65.215])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id f343a4e8-5356-11ea-aa99-bc764e2007e4;
 Wed, 19 Feb 2020 20:32:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=eikelenboom.it; s=20180706; h=Content-Transfer-Encoding:MIME-Version:
 Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=InY/EIJ1seeyLMil/bopxk+f4wmycZSDrXs7boWRCxY=; b=jlgS6KOxHflYNgABfvfj/rF9Vj
 kzeTbYNXXa/8I64lT/9RX2iz3io9UtIo6YaKcBZIV6mWpt2r+MBuCHKQMau5V8v4Fk9V9fL2JCXK0
 RMc8Wzo6dY+njZgZVkabxkLY7PUuRVEB91NHnMUQjOy5RWeJe+1LVomI34HhFAr8xV6M=;
Received: from ip4da85049.direct-adsl.nl ([77.168.80.73]:60560
 helo=localhost.localdomain) by server.eikelenboom.it with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <linux@eikelenboom.it>)
 id 1j4W2k-0005p1-1D; Wed, 19 Feb 2020 21:34:02 +0100
From: Sander Eikelenboom <linux@eikelenboom.it>
To: xen-devel@lists.xenproject.org
Date: Wed, 19 Feb 2020 21:31:29 +0100
Message-Id: <cover.1582143896.git.linux@eikelenboom.it>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH 0/3] tools/xentop: Fix calculation of used
 memory and some cleanups
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
Cc: Sander Eikelenboom <linux@eikelenboom.it>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Wei Liu <wl@xen.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Rml4ZXMgc29tZSBmYWxsb3V0IGZyb206IGM1ODhjMDAyY2MxICgndG9vbHM6IHJlbW92ZSB0bWVt
IGNvZGUgYW5kIGNvbW1hbmRzJykKClNhbmRlciBFaWtlbGVuYm9vbSAoMyk6CiAgdG9vbHMveGVu
dG9wOiBGaXggY2FsY3VsYXRpb24gb2YgdXNlZCBtZW1vcnkuCiAgdG9vbHMveGVudG9wOiBSZW1v
dmUgZGVhZCBjb2RlCiAgdG9vbHMveGVudG9wOiBDbGVhbnVwIHNvbWUgdHJhaWxpbmcgd2hpdGVz
cGFjZQoKIHRvb2xzL3hlbnN0YXQveGVudG9wL3hlbnRvcC5jIHwgMTYgKysrKystLS0tLS0tLS0t
LQogMSBmaWxlIGNoYW5nZWQsIDUgaW5zZXJ0aW9ucygrKSwgMTEgZGVsZXRpb25zKC0pCgotLSAK
Mi4yMC4xCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
WGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0
cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
