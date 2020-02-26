Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2656017023E
	for <lists+xen-devel@lfdr.de>; Wed, 26 Feb 2020 16:23:09 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j6yUi-0001CK-0Y; Wed, 26 Feb 2020 15:21:04 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=RfmG=4O=gmail.com=jandryuk@srs-us1.protection.inumbo.net>)
 id 1j6yUg-0001C9-MU
 for xen-devel@lists.xenproject.org; Wed, 26 Feb 2020 15:21:02 +0000
X-Inumbo-ID: 97d1ba78-58ab-11ea-a490-bc764e2007e4
Received: from mail-qt1-x841.google.com (unknown [2607:f8b0:4864:20::841])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 97d1ba78-58ab-11ea-a490-bc764e2007e4;
 Wed, 26 Feb 2020 15:20:59 +0000 (UTC)
Received: by mail-qt1-x841.google.com with SMTP id r5so2480833qtt.9
 for <xen-devel@lists.xenproject.org>; Wed, 26 Feb 2020 07:20:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=VFOAd65lQswkmbzdAMYJGUSVTalFZ80HbsJPAnnzq2k=;
 b=Qy+LmqcnrO4tFK9DKfrKCg5Xis7lwdWKVieMep9iDcrcSHJ2Jpvhaz9JsSc+6qxkhv
 3JWWZUBFyGe728K9iYsFiFzQ6B5kgvFoB/UVaOaP2jIxVRomPkq1y6sBVk4zyUfHTKcf
 8f+j8NeauX6qJ3g2J7J46aYdnVZbE5ROYGAWY+gdHvuKLzAzcuSVF+XgCauVRpGwOk5l
 x3p2NYqzUzhUgtSp+7OEP/g+/yqpd1BzVrxUAXfnXi2WQQlwm1tSLd8wvtjU7wNfLn6N
 qAenp6eU1BfcwKbmGFPYKb1z2I1hnaLahBjMCJU+ed+oqQz/PXRKw5loICccv5uaV5VM
 GaAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=VFOAd65lQswkmbzdAMYJGUSVTalFZ80HbsJPAnnzq2k=;
 b=OimENtyiGpT/VDy5nnjuyVCseCvHGac0LrB2tN/afUP9/jtJ4KUAQ1bgbuSsC3dLgw
 wcnnWi64DodHKbP2TRPXEe8ubgzdnbIjNHtOFFqG7UCjO2ThQRYayDY4VYSTa4Qm4OqM
 Vz+oFvtgjSm72dVE+GoZrW1aQ0qpxMX6Rq6m1B10jZRfts0L9M6LEXczXLmO5F7n3rBP
 bMDMSVk57L7vjvHueNMqBht+9jRG7NbdM0LfkBAAtUv8npXcqksa8wxl/kaxl3YQd3Yi
 /tljjNZ0ASC8DaICnFvUd69K9rzzyWtiCGTidfxf9nNrYSJP6ayd00yq687du7tTp12k
 JoiQ==
X-Gm-Message-State: APjAAAVODoJ65JMxYRAKA1UlrfXYvFl8Oc2CBKGkCxeGkogA3bj4Ab+y
 Ko8PbdNaGwxZQdPazZV23KqvQhC6
X-Google-Smtp-Source: APXvYqxKwRrFeHXykdEtDwbAPXl/JpTWF8CC8F9DYXFbHDP37dpEi7+p/90GZQv8TsCu4GHmv/9csw==
X-Received: by 2002:ac8:7101:: with SMTP id z1mr5242193qto.333.1582730459173; 
 Wed, 26 Feb 2020 07:20:59 -0800 (PST)
Received: from pm2-ws13.praxislan02.com ([2001:470:8:67e:ba27:ebff:fee8:ce27])
 by smtp.gmail.com with ESMTPSA id
 q196sm327187qke.80.2020.02.26.07.20.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Feb 2020 07:20:58 -0800 (PST)
From: Jason Andryuk <jandryuk@gmail.com>
To: xen-devel@lists.xenproject.org
Date: Wed, 26 Feb 2020 10:20:13 -0500
Message-Id: <20200226152013.12200-3-jandryuk@gmail.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200226152013.12200-1-jandryuk@gmail.com>
References: <20200226152013.12200-1-jandryuk@gmail.com>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH 2/2] Linux/locking.sh: Use cmp-fd-file-inode for
 lock check
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
Cc: Ian Jackson <ian.jackson@eu.citrix.com>, Wei Liu <wl@xen.org>,
 Jason Andryuk <jandryuk@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

UmVwbGFjZSBwZXJsIHdpdGggY21wLWZkLWZpbGUtaW5vZGUgd2hlbiBjaGVja2luZyB0aGF0IHRo
ZSBsb2NrIGZpbGUKZGVzY3JpcHRvciBhbmQgbG9ja2ZpbGUgaW5vZGVzIG1hdGNoLgoKU2lnbmVk
LW9mZi1ieTogSmFzb24gQW5kcnl1ayA8amFuZHJ5dWtAZ21haWwuY29tPgotLS0KIHRvb2xzL2hv
dHBsdWcvTGludXgvbG9ja2luZy5zaCB8IDEwICsrLS0tLS0tLS0KIDEgZmlsZSBjaGFuZ2VkLCAy
IGluc2VydGlvbnMoKyksIDggZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvdG9vbHMvaG90cGx1
Zy9MaW51eC9sb2NraW5nLnNoIGIvdG9vbHMvaG90cGx1Zy9MaW51eC9sb2NraW5nLnNoCmluZGV4
IGM2YTdlOTZmZjkuLmRlNDY4YzRiYjUgMTAwNjQ0Ci0tLSBhL3Rvb2xzL2hvdHBsdWcvTGludXgv
bG9ja2luZy5zaAorKysgYi90b29scy9ob3RwbHVnL0xpbnV4L2xvY2tpbmcuc2gKQEAgLTUwLDE0
ICs1MCw4IEBAIGNsYWltX2xvY2soKQogICAgICAgICAjIGFjdHVhbGx5IGEgc3ludGhldGljIHN5
bWxpbmsgaW4gL3Byb2MgYW5kIHdlIGFyZW4ndAogICAgICAgICAjIGd1YXJhbnRlZWQgdGhhdCBv
dXIgc3RhdCgyKSB3b24ndCBsb3NlIHRoZSByYWNlIHdpdGggYW4KICAgICAgICAgIyBybSgxKSBi
ZXR3ZWVuIHJlYWRpbmcgdGhlIHN5bnRoZXRpYyBsaW5rIGFuZCB0cmF2ZXJzaW5nIHRoZQotICAg
ICAgICAjIGZpbGUgc3lzdGVtIHRvIGZpbmQgdGhlIGludW0uICBQZXJsIGlzIHZlcnkgZmFzdCBz
byB1c2UgdGhhdC4KLSAgICAgICAgcmlnaHRmaWxlPSQoIHBlcmwgLWUgJwotICAgICAgICAgICAg
b3BlbiBTVERJTiwgIjwmJyRfbG9ja2ZkJyIgb3IgZGllICQhOwotICAgICAgICAgICAgbXkgJGZk
X2ludW0gPSAoc3RhdCBTVERJTilbMV07IGRpZSAkISB1bmxlc3MgZGVmaW5lZCAkZmRfaW51bTsK
LSAgICAgICAgICAgIG15ICRmaWxlX2ludW0gPSAoc3RhdCAkQVJHVlswXSlbMV07Ci0gICAgICAg
ICAgICBwcmludCAieVxuIiBpZiAkZmRfaW51bSBlcSAkZmlsZV9pbnVtOwotICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAnICIkX2xvY2tmaWxlIiApCi0gICAgICAgIGlmIFsgeCRyaWdodGZp
bGUgPSB4eSBdOyB0aGVuIGJyZWFrOyBmaQorICAgICAgICAjIGZpbGUgc3lzdGVtIHRvIGZpbmQg
dGhlIGludW0uCisgICAgICAgIGlmIGNtcC1mZC1maWxlLWlub2RlICRfbG9ja2ZkICRfbG9ja2Zp
bGUgOyB0aGVuIGJyZWFrOyBmaQogCSMgU29tZSB2ZXJzaW9ucyBvZiBiYXNoIGFwcGVhciB0byBi
ZSBidWdneSBpZiB0aGUgc2FtZQogCSMgJF9sb2NrZmlsZSBpcyBvcGVuZWQgcmVwZWF0ZWRseS4g
Q2xvc2UgdGhlIGN1cnJlbnQgZmQgaGVyZS4KICAgICAgICAgZXZhbCAiZXhlYyAkX2xvY2tmZDwm
LSIKLS0gCjIuMjQuMQoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qu
b3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2
ZWw=
