Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B3D6B132D42
	for <lists+xen-devel@lfdr.de>; Tue,  7 Jan 2020 18:41:36 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iosp9-0004cW-LI; Tue, 07 Jan 2020 17:39:23 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Heq1=24=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
 id 1iosp8-0004cP-9h
 for xen-devel@lists.xenproject.org; Tue, 07 Jan 2020 17:39:22 +0000
X-Inumbo-ID: a0caea22-3174-11ea-bf56-bc764e2007e4
Received: from mail-wm1-x342.google.com (unknown [2a00:1450:4864:20::342])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id a0caea22-3174-11ea-bf56-bc764e2007e4;
 Tue, 07 Jan 2020 17:39:17 +0000 (UTC)
Received: by mail-wm1-x342.google.com with SMTP id p9so421731wmc.2
 for <xen-devel@lists.xenproject.org>; Tue, 07 Jan 2020 09:39:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=44vjlrhcAqVkUEK0qSVPAI0qz3c0oR69g1CT4yXLODk=;
 b=bHHqAz7MRO8J1ArPuQ+z4f9LNuMq7QlEe8YPsiIgXlPNR7kfEm5JDkb/KTgyLYGCDk
 hMt4edQAvN+rmwLyn0WXB8BH/symGeLCCg6LvzrT6BJEz6ZKEt5xRFuZSEv722lwSVg4
 4qdiBP88QX65FG+Kzuc5R/PUfKfs6mcMYAy4rJoIoV0UzpfaEEZd9FxxJ5xj2Cq2Pxjw
 qi5Z1A+d9ze91qyhXVRKzZpjuxTxuLL5hNP4VrjqmHLSkfuzQ0Bk8HNOV+fgBqDKODBN
 YOz7JBj2GRdG8wbyZSwyx0PqVBkZJGMPs8Ty17CzevuhTzwDsHwgztxNuGZIhBKlCz4Y
 d1fA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=44vjlrhcAqVkUEK0qSVPAI0qz3c0oR69g1CT4yXLODk=;
 b=CmkrxNDBIqc2ClPc6yX0mYCWM7EF9zDGdJnQ1NpyPyWwASpDIy9roJUoW8VGqWcxJp
 W/vqp6KaE+C5i6juCpLX8boTodCBoJ3TjQaDI7Ltuq5NQf7Kbt6zKejOs4BoUU7L9/33
 ykzwXZ9I55vqr6aVWVrzlEWB3MWl/vik/C2J1xatlpahMPu0OfB2dhlAYyAEDeqNyUXM
 2K3PJspkscB0UlTXJHRWFCbE3td8WreK5Mwt5lSI2DcQw8Is+ft0U0Gg79ybDzyFhS7O
 BNdCtf8kJbVB878ey333QhJlAmAx0RZtjOyalGtvLwtIRwKMRMv3UsqVXhwP0Qn79yda
 wnYg==
X-Gm-Message-State: APjAAAXJY8BszYE9cBDDt3i8q2m5Pbmoj7eksEJpXZfWNnm7rIk5X4wj
 VfQz+IpRNh6vBgtMDgXm01saOZG2ZnY=
X-Google-Smtp-Source: APXvYqz3mBMiDGFjNTjc11Zx+ZqWkIoqVKj1afWLePMbJ/izkRMkgCDLpCPDZcI3iKdKSfTa+ynj9Q==
X-Received: by 2002:a1c:9e4c:: with SMTP id h73mr134022wme.177.1578418756742; 
 Tue, 07 Jan 2020 09:39:16 -0800 (PST)
Received: from localhost.localdomain (38.163.200.146.dyn.plus.net.
 [146.200.163.38])
 by smtp.gmail.com with ESMTPSA id u18sm648235wrt.26.2020.01.07.09.39.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Jan 2020 09:39:16 -0800 (PST)
From: Wei Liu <wl@xen.org>
X-Google-Original-From: Wei Liu <liuwe@microsoft.com>
To: Xen Development List <xen-devel@lists.xenproject.org>
Date: Tue,  7 Jan 2020 17:39:01 +0000
Message-Id: <20200107173902.13768-2-liuwe@microsoft.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200107173902.13768-1-liuwe@microsoft.com>
References: <20200107173902.13768-1-liuwe@microsoft.com>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH 1/2] x86/hyperv: drop usage of GENMASK_ULL from
 hyperv-tlfs.h
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
Cc: Wei Liu <liuwe@microsoft.com>, Wei Liu <wl@xen.org>,
 Paul Durrant <paul@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Michael Kelley <mikelley@microsoft.com>, Jan Beulich <jbeulich@suse.com>,
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SSdtIHRvbGQgdGhhdCBHRU5NQVNLX1VMTCBzaG91bGRuJ3QgYmUgdXNlZCBvdXRzaWRlIG9mIEFy
bSBjb2RlIGluIGl0cwpjdXJyZW50IGZvcm0uCgpSZXF1ZXN0ZWQtYnk6IEphbiBCZXVsaWNoIDxq
YmV1bGljaEBzdXNlLmNvbT4KU2lnbmVkLW9mZi1ieTogV2VpIExpdSA8bGl1d2VAbWljcm9zb2Z0
LmNvbT4KLS0tCiB4ZW4vaW5jbHVkZS9hc20teDg2L2d1ZXN0L2h5cGVydi10bGZzLmggfCA2ICsr
Ky0tLQogMSBmaWxlIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKSwgMyBkZWxldGlvbnMoLSkKCmRp
ZmYgLS1naXQgYS94ZW4vaW5jbHVkZS9hc20teDg2L2d1ZXN0L2h5cGVydi10bGZzLmggYi94ZW4v
aW5jbHVkZS9hc20teDg2L2d1ZXN0L2h5cGVydi10bGZzLmgKaW5kZXggNWI0M2Y5OWRlOC4uZTQx
ODNjODAyYyAxMDA2NDQKLS0tIGEveGVuL2luY2x1ZGUvYXNtLXg4Ni9ndWVzdC9oeXBlcnYtdGxm
cy5oCisrKyBiL3hlbi9pbmNsdWRlL2FzbS14ODYvZ3Vlc3QvaHlwZXJ2LXRsZnMuaApAQCAtNDE1
LDEzICs0MTUsMTMgQEAgZW51bSBIVl9HRU5FUklDX1NFVF9GT1JNQVQgewogCUhWX0dFTkVSSUNf
U0VUX0FMTCwKIH07CiAKLSNkZWZpbmUgSFZfSFlQRVJDQUxMX1JFU1VMVF9NQVNLCUdFTk1BU0tf
VUxMKDE1LCAwKQorI2RlZmluZSBIVl9IWVBFUkNBTExfUkVTVUxUX01BU0sJMHhmZmZmIC8qIEdF
Tk1BU0tfVUxMKDE1LCAwKSAqLwogI2RlZmluZSBIVl9IWVBFUkNBTExfRkFTVF9CSVQJCUJJVCgx
NiwgVUwpCiAjZGVmaW5lIEhWX0hZUEVSQ0FMTF9WQVJIRUFEX09GRlNFVAkxNwogI2RlZmluZSBI
Vl9IWVBFUkNBTExfUkVQX0NPTVBfT0ZGU0VUCTMyCi0jZGVmaW5lIEhWX0hZUEVSQ0FMTF9SRVBf
Q09NUF9NQVNLCUdFTk1BU0tfVUxMKDQzLCAzMikKKyNkZWZpbmUgSFZfSFlQRVJDQUxMX1JFUF9D
T01QX01BU0sJMHhmZmYwMDAwMDAwMCAvKiBHRU5NQVNLX1VMTCg0MywgMzIpICovCiAjZGVmaW5l
IEhWX0hZUEVSQ0FMTF9SRVBfU1RBUlRfT0ZGU0VUCTQ4Ci0jZGVmaW5lIEhWX0hZUEVSQ0FMTF9S
RVBfU1RBUlRfTUFTSwlHRU5NQVNLX1VMTCg1OSwgNDgpCisjZGVmaW5lIEhWX0hZUEVSQ0FMTF9S
RVBfU1RBUlRfTUFTSwkweGZmZjAwMDAwMDAwMDAwMCAvKiBHRU5NQVNLX1VMTCg1OSwgNDgpICov
CiAKIC8qIGh5cGVyY2FsbCBzdGF0dXMgY29kZSAqLwogI2RlZmluZSBIVl9TVEFUVVNfU1VDQ0VT
UwkJCTAKLS0gCjIuMjAuMQoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2pl
Y3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4t
ZGV2ZWw=
