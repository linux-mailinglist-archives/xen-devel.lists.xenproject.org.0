Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 51442127D36
	for <lists+xen-devel@lfdr.de>; Fri, 20 Dec 2019 15:37:16 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iiJN8-0006KG-QX; Fri, 20 Dec 2019 14:35:18 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=9gvH=2K=kernel.org=sashal@srs-us1.protection.inumbo.net>)
 id 1iiJN7-0006Jh-Ai
 for xen-devel@lists.xenproject.org; Fri, 20 Dec 2019 14:35:17 +0000
X-Inumbo-ID: f0abafe2-2335-11ea-9371-12813bfff9fa
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id f0abafe2-2335-11ea-9371-12813bfff9fa;
 Fri, 20 Dec 2019 14:35:17 +0000 (UTC)
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id A42E124684;
 Fri, 20 Dec 2019 14:35:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1576852516;
 bh=0HuyhNq1O9Gim5LLI5/7VvT3lzV6D6Lo2ykpaANOOTs=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=wW7cgZmriKsdJJD92QBlUSCHX4lkVW+dR3CQC8p+3T1v1hYq2SIDtV4LH2eFk7ydy
 nKvOkD+hMFcT2Lp8H5vI5vh0JOjHXgFwCQIytjleayQrht4TE47A48gKZ64pUB0FzH
 60/CBAFVdtiFmlGXvkHiArhtgDTJNw3yjinE/FGs=
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Date: Fri, 20 Dec 2019 09:34:32 -0500
Message-Id: <20191220143433.9922-33-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191220143433.9922-1-sashal@kernel.org>
References: <20191220143433.9922-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Subject: [Xen-devel] [PATCH AUTOSEL 4.19 33/34] xen/balloon: fix ballooned
 page accounting without hotplug enabled
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
Cc: Juergen Gross <jgross@suse.com>, Sasha Levin <sashal@kernel.org>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>, xen-devel@lists.xenproject.org,
 Nicholas Tsirakis <niko.tsirakis@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

RnJvbTogSnVlcmdlbiBHcm9zcyA8amdyb3NzQHN1c2UuY29tPgoKWyBVcHN0cmVhbSBjb21taXQg
YzY3M2VjNjFhZGU4OWJmMmY0MTc5NjBmOTg2YmMyNTY3MTc2MmVmYiBdCgpXaGVuIENPTkZJR19Y
RU5fQkFMTE9PTl9NRU1PUllfSE9UUExVRyBpcyBub3QgZGVmaW5lZApyZXNlcnZlX2FkZGl0aW9u
YWxfbWVtb3J5KCkgd2lsbCBzZXQgYmFsbG9vbl9zdGF0cy50YXJnZXRfcGFnZXMgdG8gYQp3cm9u
ZyB2YWx1ZSBpbiBjYXNlIHRoZXJlIGFyZSBzdGlsbCBzb21lIGJhbGxvb25lZCBwYWdlcyBhbGxv
Y2F0ZWQgdmlhCmFsbG9jX3hlbmJhbGxvb25lZF9wYWdlcygpLgoKVGhpcyB3aWxsIHJlc3VsdCBp
biBiYWxsb29uX3Byb2Nlc3MoKSBubyBsb25nZXIgYmUgdHJpZ2dlcmVkIHdoZW4KYmFsbG9vbmVk
IHBhZ2VzIGFyZSBmcmVlZCBpbiBiYXRjaGVzLgoKUmVwb3J0ZWQtYnk6IE5pY2hvbGFzIFRzaXJh
a2lzIDxuaWtvLnRzaXJha2lzQGdtYWlsLmNvbT4KU2lnbmVkLW9mZi1ieTogSnVlcmdlbiBHcm9z
cyA8amdyb3NzQHN1c2UuY29tPgpSZXZpZXdlZC1ieTogQm9yaXMgT3N0cm92c2t5IDxib3Jpcy5v
c3Ryb3Zza3lAb3JhY2xlLmNvbT4KU2lnbmVkLW9mZi1ieTogSnVlcmdlbiBHcm9zcyA8amdyb3Nz
QHN1c2UuY29tPgpTaWduZWQtb2ZmLWJ5OiBTYXNoYSBMZXZpbiA8c2FzaGFsQGtlcm5lbC5vcmc+
Ci0tLQogZHJpdmVycy94ZW4vYmFsbG9vbi5jIHwgMyArKy0KIDEgZmlsZSBjaGFuZ2VkLCAyIGlu
c2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL3hlbi9iYWxs
b29uLmMgYi9kcml2ZXJzL3hlbi9iYWxsb29uLmMKaW5kZXggNzQ3YTE1YWNiY2UzNy4uNmZhNzIw
OWYyNGY0MyAxMDA2NDQKLS0tIGEvZHJpdmVycy94ZW4vYmFsbG9vbi5jCisrKyBiL2RyaXZlcnMv
eGVuL2JhbGxvb24uYwpAQCAtMzk1LDcgKzM5NSw4IEBAIHN0YXRpYyBzdHJ1Y3Qgbm90aWZpZXJf
YmxvY2sgeGVuX21lbW9yeV9uYiA9IHsKICNlbHNlCiBzdGF0aWMgZW51bSBicF9zdGF0ZSByZXNl
cnZlX2FkZGl0aW9uYWxfbWVtb3J5KHZvaWQpCiB7Ci0JYmFsbG9vbl9zdGF0cy50YXJnZXRfcGFn
ZXMgPSBiYWxsb29uX3N0YXRzLmN1cnJlbnRfcGFnZXM7CisJYmFsbG9vbl9zdGF0cy50YXJnZXRf
cGFnZXMgPSBiYWxsb29uX3N0YXRzLmN1cnJlbnRfcGFnZXMgKworCQkJCSAgICAgYmFsbG9vbl9z
dGF0cy50YXJnZXRfdW5wb3B1bGF0ZWQ7CiAJcmV0dXJuIEJQX0VDQU5DRUxFRDsKIH0KICNlbmRp
ZiAvKiBDT05GSUdfWEVOX0JBTExPT05fTUVNT1JZX0hPVFBMVUcgKi8KLS0gCjIuMjAuMQoKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBt
YWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMu
eGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
