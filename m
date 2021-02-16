Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E697F31CA96
	for <lists+xen-devel@lfdr.de>; Tue, 16 Feb 2021 13:36:32 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.85536.160474 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lBzaE-0002Gl-IB; Tue, 16 Feb 2021 12:36:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 85536.160474; Tue, 16 Feb 2021 12:36:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lBzaE-0002G5-DW; Tue, 16 Feb 2021 12:36:02 +0000
Received: by outflank-mailman (input) for mailman id 85536;
 Tue, 16 Feb 2021 12:36:00 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=y7oK=HS=xenbits.xen.org=iwj@srs-us1.protection.inumbo.net>)
 id 1lBzaC-0001zG-QO
 for xen-devel@lists.xen.org; Tue, 16 Feb 2021 12:36:00 +0000
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id cc82297d-811e-47da-95c3-8465355eaf5e;
 Tue, 16 Feb 2021 12:35:35 +0000 (UTC)
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenbits.xen.org>)
 id 1lBzZi-0008Mx-Q1; Tue, 16 Feb 2021 12:35:30 +0000
Received: from iwj by xenbits.xenproject.org with local (Exim 4.92)
 (envelope-from <iwj@xenbits.xen.org>)
 id 1lBzZi-0002bO-P6; Tue, 16 Feb 2021 12:35:30 +0000
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
X-Inumbo-ID: cc82297d-811e-47da-95c3-8465355eaf5e
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Date:Message-Id:Subject:CC:From:To:MIME-Version:
	Content-Transfer-Encoding:Content-Type;
	bh=CNx9HA2TuAgcqoV4Hd77YdCoDcvs1DeLFjIGIr9cIf8=; b=VNhge+CiWitYtuDMDdiguZfn3B
	obUidPsr5cz3im2ad4rV5YsGbjJbYFE5FYlUnP8elWnZbO9bjGekvUFcfkltrDh9aipBXOd65NcP0
	j4WJcnoja+Yva7WGZjdXG/fdKbPHTdz3VuXv+wY+CqwcQZprR16SROClEB74DU33CmgQ=;
Content-Type: multipart/mixed; boundary="=separator"; charset="utf-8"
Content-Transfer-Encoding: binary
MIME-Version: 1.0
X-Mailer: MIME-tools 5.509 (Entity 5.509)
To: xen-announce@lists.xen.org, xen-devel@lists.xen.org,
 xen-users@lists.xen.org, oss-security@lists.openwall.com
From: Xen.org security team <security@xen.org>
CC: Xen.org security team <security-team-members@xen.org>
Subject: Xen Security Advisory 363 v3 (CVE-2021-26934) - Linux: display
 frontend "be-alloc" mode is unsupported
Message-Id: <E1lBzZi-0002bO-P6@xenbits.xenproject.org>
Date: Tue, 16 Feb 2021 12:35:30 +0000

--=separator
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA256

            Xen Security Advisory CVE-2021-26934 / XSA-363
                               version 3

        Linux: display frontend "be-alloc" mode is unsupported

UPDATES IN VERSION 3
====================

Public release.

ISSUE DESCRIPTION
=================

The backend allocation mode of Linux'es drm_xen_front drivers was
not meant to be a supported configuration, but this wasn't stated
accordingly in its support status entry.

IMPACT
======

Use of the feature may have unknown effects.

VULNERABLE SYSTEMS
==================

Linux versions from 4.18 onwards are affected.  Earlier Linux versions
do not provide the affected driver.

MITIGATION
==========

Not using the driver or its backend allocation mode will avoid the
vulnerability.

CREDITS
=======

This issue was discovered by Jan Beulich of SUSE.

RESOLUTION
==========

Applying the attached patch documents the situation.  The patch does
not fix any security issues.

xsa363.patch           xen-unstable

$ sha256sum xsa363*
cf2f2eff446aec625b19d9d01301ec66098b58b792d74012235f10c62a21bb68  xsa363.patch
$

-----BEGIN PGP SIGNATURE-----

iQFABAEBCAAqFiEEI+MiLBRfRHX6gGCng/4UyVfoK9kFAmAru/UMHHBncEB4ZW4u
b3JnAAoJEIP+FMlX6CvZSocH/3jAI0MeZtnhvuyOM4CxkNmr0fI4HIXnA1xGNhWY
Wa2WgtOuFVaPUFX1Tj/e6zCoibatl1gicETI9hL+w4Dg6/GzIeTogOuzv5D6Ux91
9a6n2tryFfSAs0OxTKq6etLv63VEEicYMHrZT8n700JFvJsAWYAMvuanMDknGxBP
5/Z+DASnZxT09cpvP4REKuG7rW9vIif+6EZ0T0kU87InouDts/YOhzNsdvBD1wKH
y5e/MZh2sOyMOovuhgbvoK+YezHTAcZeGWnUk3yQoTGnW3p+W9XZVURsc8/e2FbZ
heY3Tj918LsY50wGpMZ2PDoHC8PSHaUqEOTq0MPmnPlppvU=
=tJD0
-----END PGP SIGNATURE-----

--=separator
Content-Type: application/octet-stream; name="xsa363.patch"
Content-Disposition: attachment; filename="xsa363.patch"
Content-Transfer-Encoding: base64

RnJvbTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgpTdWJqZWN0
OiBTVVBQT1JULm1kOiBQViBkaXNwbGF5IGZyb250ZW5kIGlzIHVuc3VwcG9y
dGVkIGluICJiYWNrZW5kIGFsbG9jYXRpb24iIG1vZGUKClRoaXMgd2Fzbid0
IG1lYW50IHRvIGJlIHN1cHBvcnRlZCwgYnV0IHdhc24ndCBzdGF0ZWQgdGhp
cyB3YXkuCgpUaGlzIGlzIFhTQS0zNjMuCgpSZXBvcnRlZC1ieTogSmFuIEJl
bGljaCA8amJldWxpY2hAc3VzZS5jb20+ClNpZ25lZC1vZmYtYnk6IEphbiBC
ZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4KCi0tLSBhL1NVUFBPUlQubWQK
KysrIGIvU1VQUE9SVC5tZApAQCAtNDE0LDcgKzQxNCw4IEBAIEd1ZXN0LXNp
ZGUgZHJpdmVyIGNhcGFibGUgb2Ygc3BlYWtpbmcgdGgKIAogR3Vlc3Qtc2lk
ZSBkcml2ZXIgY2FwYWJsZSBvZiBzcGVha2luZyB0aGUgWGVuIFBWIGRpc3Bs
YXkgcHJvdG9jb2wKIAotICAgIFN0YXR1cywgTGludXg6IFN1cHBvcnRlZAor
ICAgIFN0YXR1cywgTGludXg6IFN1cHBvcnRlZCAob3V0c2lkZSBvZiAiYmFj
a2VuZCBhbGxvY2F0aW9uIiBtb2RlKQorICAgIFN0YXR1cywgTGludXg6IEV4
cGVyaW1lbnRhbCAoaW4gImJhY2tlbmQgYWxsb2NhdGlvbiIgbW9kZSkKIAog
IyMjIFBWIENvbnNvbGUgKGZyb250ZW5kKQogCg==

--=separator--

