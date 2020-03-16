Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B6D38186FB3
	for <lists+xen-devel@lfdr.de>; Mon, 16 Mar 2020 17:11:38 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jDsI0-0007Nj-4P; Mon, 16 Mar 2020 16:08:28 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=ek3V=5B=redhat.com=philmd@srs-us1.protection.inumbo.net>)
 id 1jDsHz-0007Nb-BM
 for xen-devel@lists.xenproject.org; Mon, 16 Mar 2020 16:08:27 +0000
X-Inumbo-ID: 5e2b5c62-67a0-11ea-b85d-12813bfff9fa
Received: from us-smtp-delivery-74.mimecast.com (unknown [63.128.21.74])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id 5e2b5c62-67a0-11ea-b85d-12813bfff9fa;
 Mon, 16 Mar 2020 16:08:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1584374905;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=kzAY54Ug/Dgdb4+XERmlSJiZ/8IMgFtKzZJKBnbDjxY=;
 b=X4WKY88qS7QmAUGb7taUeEEVR0JziNXcDQXn/G988BDMIUUc+YhNwUkgj8OJx+lSnS2ssE
 wLCfcsBK6DvdwgE4gPYW1eXDqTB1d3KVEHQ2WpVCFM6f9JzDhxiZsj0csHgXpX17MELeCZ
 VnqvrK3dq77+nA1Ld3zkNPa+rwaiXDc=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-146-kPtC9XoaOVmiXBHYGvYSNA-1; Mon, 16 Mar 2020 12:08:20 -0400
X-MC-Unique: kPtC9XoaOVmiXBHYGvYSNA-1
Received: by mail-ed1-f70.google.com with SMTP id y23so15568661edt.2
 for <xen-devel@lists.xenproject.org>; Mon, 16 Mar 2020 09:08:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Q9pxkDoDUc80lR6q2sbnb9Lu1UrGguk51WkG66GGoIk=;
 b=TrzSfNBr2YTu0bS5EuCpz7PlOSLOPWcGLfZIpjZh2mgTR1YmgItulPL+xBZSvl75z7
 THexDSM01Az/af+f2slK9npY6YDqsrquUmySWwJYds56Vx18OXr/VSZcRPNrGEeMnKJd
 u9XpJ0f0pMkT6tAGnGRiulQOtiHnK8ANdKUaX0Q/96qu8XUKLJW6HO+Itd87x4GN6AmZ
 90e2cE0cQwCIuz2bJtQKCUnO/h5J2uWRjTGhxDIFC8gtWY30BfMWgyYPgMOYgfdjhkpS
 UX52DxxXxkraIC/Z82xE/1Jiuud5sHy0pqaTAAsYOJJbC7iX8W0MuK6uElMC3yOABXd/
 Ct5g==
X-Gm-Message-State: ANhLgQ3xqX/sjbIUtp+YP6wUfdvGUlv7eaO1r5K/D3ZGth6IMJ/Eftwp
 6djK9naLwzt8gL8qRtFIT9wFGvT7AcdsECax7X2eIeZWwbPioC0fRq+82jd18/u2/3DfVP9wJJl
 3lTe9RgPiNde6iAl5u5SSh5d/lQs=
X-Received: by 2002:a50:e44a:: with SMTP id e10mr721634edm.210.1584374898021; 
 Mon, 16 Mar 2020 09:08:18 -0700 (PDT)
X-Google-Smtp-Source: ADFU+vtucDPtYCUUmNKo1v786732XgsbrhpkRJ66ECnTqKEicI6pa/tNzUTcvXKFSS8tLcL/QhoQsA==
X-Received: by 2002:adf:b3d6:: with SMTP id x22mr99071wrd.242.1584374896425;
 Mon, 16 Mar 2020 09:08:16 -0700 (PDT)
Received: from localhost.localdomain (96.red-83-59-163.dynamicip.rima-tde.net.
 [83.59.163.96])
 by smtp.gmail.com with ESMTPSA id x13sm268246wmj.5.2020.03.16.09.08.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Mar 2020 09:08:15 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Date: Mon, 16 Mar 2020 17:06:33 +0100
Message-Id: <20200316160634.3386-19-philmd@redhat.com>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200316160634.3386-1-philmd@redhat.com>
References: <20200316160634.3386-1-philmd@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Subject: [Xen-devel] [PATCH v3 18/19] hw/arm: Do not build to 'virt' machine
 on Xen
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
Cc: Fam Zheng <fam@euphon.net>, Peter Maydell <peter.maydell@linaro.org>,
 Thomas Huth <thuth@redhat.com>, Stefano Stabellini <sstabellini@kernel.org>,
 kvm@vger.kernel.org, Paul Durrant <paul@xen.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-arm@nongnu.org,
 xen-devel@lists.xenproject.org, Anthony Perard <anthony.perard@citrix.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

WGVuIG9uIEFSTSBkb2VzIG5vdCB1c2UgUUVNVSBtYWNoaW5lcyBbKl0uIERpc2FibGUgdGhlICd2
aXJ0JwptYWNoaW5lIHRoZXJlIHRvIGF2b2lkIG9kZCBlcnJvcnMgc3VjaDoKCiAgICBDQyAgICAg
IGkzODYtc29mdG1tdS9ody9jcHUvYTE1bXBjb3JlLm8KICBody9jcHUvYTE1bXBjb3JlLmM6Mjg6
MTA6IGZhdGFsIGVycm9yOiBrdm1fYXJtLmg6IE5vIHN1Y2ggZmlsZSBvciBkaXJlY3RvcnkKClsq
XSBodHRwczovL3dpa2kueGVucHJvamVjdC5vcmcvd2lraS9YZW5fQVJNX3dpdGhfVmlydHVhbGl6
YXRpb25fRXh0ZW5zaW9ucyNVc2Vfb2ZfcWVtdS1zeXN0ZW0taTM4Nl9vbl9BUk0KClNpZ25lZC1v
ZmYtYnk6IFBoaWxpcHBlIE1hdGhpZXUtRGF1ZMOpIDxwaGlsbWRAcmVkaGF0LmNvbT4KLS0tCkNj
OiBTdGVmYW5vIFN0YWJlbGxpbmkgPHNzdGFiZWxsaW5pQGtlcm5lbC5vcmc+CkNjOiBBbnRob255
IFBlcmFyZCA8YW50aG9ueS5wZXJhcmRAY2l0cml4LmNvbT4KQ2M6IFBhdWwgRHVycmFudCA8cGF1
bEB4ZW4ub3JnPgpDYzogeGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCi0tLQogaHcvYXJt
L0tjb25maWcgfCAxICsKIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKQoKZGlmZiAtLWdp
dCBhL2h3L2FybS9LY29uZmlnIGIvaHcvYXJtL0tjb25maWcKaW5kZXggOGU4MDFjZDE1Zi4uNjlh
OGUzMDEyNSAxMDA2NDQKLS0tIGEvaHcvYXJtL0tjb25maWcKKysrIGIvaHcvYXJtL0tjb25maWcK
QEAgLTEsNSArMSw2IEBACiBjb25maWcgQVJNX1ZJUlQKICAgICBib29sCisgICAgZGVwZW5kcyBv
biAhWEVOCiAgICAgZGVmYXVsdCB5IGlmIEtWTQogICAgIGltcGx5IFBDSV9ERVZJQ0VTCiAgICAg
aW1wbHkgVEVTVF9ERVZJQ0VTCi0tIAoyLjIxLjEKCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBs
aXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4v
bGlzdGluZm8veGVuLWRldmVs
