Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A9EDCAC6158
	for <lists+xen-devel@lfdr.de>; Wed, 28 May 2025 07:44:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.998761.1379624 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uK9Zt-0003NR-Lk; Wed, 28 May 2025 05:43:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 998761.1379624; Wed, 28 May 2025 05:43:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uK9Zt-0003LN-J9; Wed, 28 May 2025 05:43:49 +0000
Received: by outflank-mailman (input) for mailman id 998761;
 Tue, 27 May 2025 21:29:41 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ZnZd=YL=contentwise.tech=evgeny@srs-se1.protection.inumbo.net>)
 id 1uK1rh-00043H-Gk
 for xen-devel@lists.xenproject.org; Tue, 27 May 2025 21:29:41 +0000
Received: from mailrelay2-1.pub.mailoutpod3-cph3.one.com
 (mailrelay2-1.pub.mailoutpod3-cph3.one.com [2a02:2350:5:421::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id aec6fc42-3b41-11f0-b894-0df219b8e170;
 Tue, 27 May 2025 23:29:39 +0200 (CEST)
Received: from onecom-webmail-backend-production-66cfbfc4bc-dsl4r
 (service.pub.live1-k8s-cph3.one.com [46.30.212.67])
 by mailrelay2.pub.mailoutpod3-cph3.one.com (Halon) with ESMTPSA
 id ae4d2930-3b41-11f0-bbb9-b37c246f863f;
 Tue, 27 May 2025 21:29:33 +0000 (UTC)
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
X-Inumbo-ID: aec6fc42-3b41-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1748381373; x=1748986173;
	d=contentwise.tech; s=rsa1;
	h=content-type:subject:reply-to:from:to:message-id:mime-version:date:from;
	bh=82lleuMVJ4vdnG8UNVg3X6/QtlcEgxb3VpDf/bSxoKI=;
	b=NHyXPsZnkPZm47AGHZBrBD1t7RwgvNWhatgOc/u7Hp6BQGuGYKaBE0ViCV1nWePsCa9204fIZOFqy
	 Iho+VenZbkNxFKShT8MQd4F3BBuVd1ErhRLE4AFTmGKnQuSH5qHBlkI9xBmK7Nc2+uxA4q6ItTXOA8
	 ihaai4oVKL9ym+Mq12Edu6TRm46FdWqRTLdhXjIiNBSn2KNVA6s3Ywk+48qoKQ3M2GqAMV9Wbd95Wp
	 oksMjf8fKf1CpskeAgFFPJpfcY9gygtpCK6AJP7J5o2i2X7OyCIM/GMHxFw2Cp3FnsQ83mVGON4T1r
	 8ohk8o/YkqtH1LWyjtYwGWUCr9zaNbQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1748381373; x=1748986173;
	d=contentwise.tech; s=ed1;
	h=content-type:subject:reply-to:from:to:message-id:mime-version:date:from;
	bh=82lleuMVJ4vdnG8UNVg3X6/QtlcEgxb3VpDf/bSxoKI=;
	b=tvKiGAyuTqX+9XB3X3gobfpfOCshhICay2uhWGCkbwfrTk1BwE2FUuuYHshANAex+dnA8OgGbxS94
	 7AJL1JUBQ==
X-HalOne-ID: ae4d2930-3b41-11f0-bbb9-b37c246f863f
X-Originating-IP: 83.44.120.208
User-Agent: One.com webmail 48.1.11
Date: Tue, 27 May 2025 23:29:32 +0200
MIME-Version: 1.0
Message-ID: <1748381372906.7.62038@webmail-backend-production-66cfbfc4bc-ddzt7>
To: <xen-devel@lists.xenproject.org>, "Julien Grall" <julien@xen.org>,
 "Stefano Stabellini" <sstabellini@kernel.org>, "Bertrand Marquis"
 <bertrand.marquis@arm.com>, "Volodymyr Babchuk" <Volodymyr_Babchuk@epam.com>,
 <xen-devel@lists.xenproject.org>, <miro@contentwise.tech>
From: "Evgeny Beysembaev" <evgeny@contentwise.tech>
Reply-To: <evgeny@contentwise.tech>
Subject: [PATCH] BCM2711 reboot fix
Content-Type: multipart/mixed; boundary="----------62036-1748381372906-1"

This is a multipart message in MIME format.

------------62036-1748381372906-1
Content-Type: multipart/alternative;
 boundary="----------62036-1748381372906-2"

------------62036-1748381372906-2
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8





------------62036-1748381372906-2
Content-Type: multipart/related; boundary="----------62036-1748381372906-3"

------------62036-1748381372906-3
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html; charset=UTF-8

<div><br></div><div><br></div>

------------62036-1748381372906-3--
------------62036-1748381372906-2--
------------62036-1748381372906-1
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename=0001-BCM2711-reboot-fix.patch
Content-Type: text/x-patch; name="0001-BCM2711-reboot-fix.patch"

RnJvbSAwMDU3ZDE0NWRkZDkwYzAxOTIyNjM2MjA1NDg0MDg4YzAyYTBlNDVhIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpNZXNzYWdlLUlEOiA8MDA1N2QxNDVkZGQ5MGMwMTkyMjYzNjIwNTQ4NDA4
OGMwMmEwZTQ1YS4xNzQ4MzgwODAwLmdpdC5tZWdhYm90dmFAZ21haWwuY29tPgpGcm9tOiBFdmdl
bnkgQmV5c2VtYmFldiA8ZXZnZW55QGNvbnRlbnR3aXNlLnRlY2g+CkRhdGU6IFR1ZSwgMjcgTWF5
IDIwMjUgMTM6NDg6MzEgKzAyMDAKU3ViamVjdDogW1BBVENIXSBCQ00yNzExIHJlYm9vdCBmaXgK
CkFjY29yZGluZyB0byB0aGUgY29tbWl0IGIzMzRjMWFmYWQxNzEzMmEzYzIzNjBkZTY0YzFjZmZm
OTA5MDg3MzkgaW4gTGludXgKa2VybmVsLCB0aGUgYGNvbXBhdGlibGVgIHN0cmluZyBmb3IgdGhl
IHdhdGNoZG9nIHBlcmlwaGVyYWwgaW4gdGhlIERUUyB3YXMgbW9kaWZpZWQgZnJvbQpgYnJjbSxi
Y20yODM1LXBtYCB0byBgYnJjbSxiY20yNzExLXBtYCwgd2hpY2ggY2F1c2VkCmBycGk0X21hcF93
YXRjaGRvZygpYCBmdW5jdGlvbiB0byBmYWlsLCBsZWFkaW5nIHRvIGluYWJpbGl0eSB0byByZWJv
b3QKdGhlIHN5c3RlbSB1bmRlciBYZW4gaHlwZXJ2aXNvci4KClNpZ25lZC1vZmYtYnk6IEV2Z2Vu
eSBCZXlzZW1iYWV2IDxldmdlbnlAY29udGVudHdpc2UudGVjaD4KLS0tCiB4ZW4vYXJjaC9hcm0v
cGxhdGZvcm1zL2JyY20tcmFzcGJlcnJ5LXBpLmMgfCAyICstCiAxIGZpbGUgY2hhbmdlZCwgMSBp
bnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS94ZW4vYXJjaC9hcm0vcGxh
dGZvcm1zL2JyY20tcmFzcGJlcnJ5LXBpLmMgYi94ZW4vYXJjaC9hcm0vcGxhdGZvcm1zL2JyY20t
cmFzcGJlcnJ5LXBpLmMKaW5kZXggODExYjQwYjFhNi4uMTFlNzk4NTU3NSAxMDA2NDQKLS0tIGEv
eGVuL2FyY2gvYXJtL3BsYXRmb3Jtcy9icmNtLXJhc3BiZXJyeS1waS5jCisrKyBiL3hlbi9hcmNo
L2FybS9wbGF0Zm9ybXMvYnJjbS1yYXNwYmVycnktcGkuYwpAQCAtNjAsNyArNjAsNyBAQCBzdGF0
aWMgdm9pZCBfX2lvbWVtICpycGk0X21hcF93YXRjaGRvZyh2b2lkKQogICAgIHBhZGRyX3Qgc3Rh
cnQsIGxlbjsKICAgICBpbnQgcmV0OwogCi0gICAgbm9kZSA9IGR0X2ZpbmRfY29tcGF0aWJsZV9u
b2RlKE5VTEwsIE5VTEwsICJicmNtLGJjbTI4MzUtcG0iKTsKKyAgICBub2RlID0gZHRfZmluZF9j
b21wYXRpYmxlX25vZGUoTlVMTCwgTlVMTCwgImJyY20sYmNtMjcxMS1wbSIpOwogICAgIGlmICgg
IW5vZGUgKQogICAgICAgICByZXR1cm4gTlVMTDsKIAotLSAKMi40Ny4yCgo=

------------62036-1748381372906-1--


