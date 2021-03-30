Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 488FC34E6FF
	for <lists+xen-devel@lfdr.de>; Tue, 30 Mar 2021 14:02:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.103433.197358 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lRD4J-0006E6-50; Tue, 30 Mar 2021 12:01:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 103433.197358; Tue, 30 Mar 2021 12:01:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lRD4J-0006Dc-0o; Tue, 30 Mar 2021 12:01:59 +0000
Received: by outflank-mailman (input) for mailman id 103433;
 Tue, 30 Mar 2021 12:01:57 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=PAXT=I4=xenbits.xen.org=iwj@srs-us1.protection.inumbo.net>)
 id 1lRD4H-0006BX-Db
 for xen-devel@lists.xen.org; Tue, 30 Mar 2021 12:01:57 +0000
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 792c86ef-4c9b-43b5-8be2-c91b175898c9;
 Tue, 30 Mar 2021 12:01:50 +0000 (UTC)
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenbits.xen.org>)
 id 1lRD3z-0003Uf-Uy; Tue, 30 Mar 2021 12:01:39 +0000
Received: from iwj by xenbits.xenproject.org with local (Exim 4.92)
 (envelope-from <iwj@xenbits.xen.org>)
 id 1lRD3z-0005Dv-Rd; Tue, 30 Mar 2021 12:01:39 +0000
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
X-Inumbo-ID: 792c86ef-4c9b-43b5-8be2-c91b175898c9
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Date:Message-Id:Subject:CC:From:To:MIME-Version:
	Content-Transfer-Encoding:Content-Type;
	bh=NHPFu1XAUVlJbUfeISmXiuipVxaCU0mvsytRR5Xe7gc=; b=L9zjRtVYmmNayLh/y6MP7JX8ER
	I3AgjlvIFboC04oIQZxXoJCdQ6p9v41/TZqHZCwuH6RVenbOFaBtQ/Hk5ff3aFmmrBVM6C8AZzcms
	tAfIKTsKy8k/ZNv6aaLM1our1QttBgIeiQHanCx/DuDVXDuGGnwVpYwiAei6HHu3cC24=;
Content-Type: multipart/mixed; boundary="=separator"; charset="utf-8"
Content-Transfer-Encoding: binary
MIME-Version: 1.0
X-Mailer: MIME-tools 5.509 (Entity 5.509)
To: xen-announce@lists.xen.org, xen-devel@lists.xen.org,
 xen-users@lists.xen.org, oss-security@lists.openwall.com
From: Xen.org security team <security@xen.org>
CC: Xen.org security team <security-team-members@xen.org>
Subject: Xen Security Advisory 371 v3 (CVE-2021-28688) - Linux: blkback
 driver may leak persistent grants
Message-Id: <E1lRD3z-0005Dv-Rd@xenbits.xenproject.org>
Date: Tue, 30 Mar 2021 12:01:39 +0000

--=separator
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA256

            Xen Security Advisory CVE-2021-28688 / XSA-371
                               version 3

           Linux: blkback driver may leak persistent grants

UPDATES IN VERSION 3
====================

Public release.

ISSUE DESCRIPTION
=================

The fix for XSA-365 includes initialization of pointers such that
subsequent cleanup code wouldn't use uninitialized or stale values.
This initialization went too far and may under certain conditions also
overwrite pointers which are in need of cleaning up.  The lack of
cleanup would result in leaking persistent grants.  The leak in turn
would prevent fully cleaning up after a respective guest has died,
leaving around zombie domains.

IMPACT
======

A malicious or buggy frontend driver may be able to cause resource leaks
from the corresponding backend driver.  This can result in a host-wide
Denial of Sevice (DoS).

VULNERABLE SYSTEMS
==================

All Linux versions having the fix for XSA-365 applied are vulnerable.
XSA-365 was classified to affect versions back to at least 3.11.

MITIGATION
==========

Reconfiguring guests to use alternative (e.g. qemu-based) backends may
avoid the vulnerability.

Avoiding the use of persistent grants will also avoid the vulnerability.
This can be achieved by passing the "feature_persistent=0" module option
to the xen-blkback driver.

CREDITS
=======

This issue was discovered by Nicolai Stange of SUSE.

RESOLUTION
==========

Applying the attached patch resolves this issue.

xsa371-linux.patch           Linux 5.12-rc, 5.11.1 onwards, 5.10.18 onwards
<not directly affected>      Linux 5.10.0 - 5.10.17, 5.11.0
<applicability unknown>      Linux 4.4 - 5.9
<no fix available>           Linux 3.11 - 4.3

$ sha256sum xsa371*
1b2472253aa82385b3eff280fa4adf52742f06813fc093f5f86cd4a3021f736c  xsa371-linux.patch
$

DEPLOYMENT DURING EMBARGO
=========================

Deployment of the patches described above (or others which are
substantially similar) is permitted during the embargo, even on
public-facing systems with untrusted guest users and administrators.

HOWEVER, deployment of the mitigations described above is NOT permitted
during the embargo on public-facing systems with untrusted guest users
and administrators.  This is because such configuration changes may be
recognizable by the affected guests.

AND: Distribution of updated software is prohibited (except to other
members of the predisclosure list).

Predisclosure list members who wish to deploy significantly different
patches and/or mitigations, please contact the Xen Project Security
Team.

(Note: this during-embargo deployment notice is retained in
post-embargo publicly released Xen Project advisories, even though it
is then no longer applicable.  This is to enable the community to have
oversight of the Xen Project Security Team's decisionmaking.)

For more information about permissible uses of embargoed information,
consult the Xen Project community's agreed Security Policy:
  http://www.xenproject.org/security-policy.html
-----BEGIN PGP SIGNATURE-----

iQFABAEBCAAqFiEEI+MiLBRfRHX6gGCng/4UyVfoK9kFAmBjBWYMHHBncEB4ZW4u
b3JnAAoJEIP+FMlX6CvZbkQIAKjv5DaESSOUA8DzOk4LmBZQHIMtTsN2wF2Q0/6g
3hJ3HoGzQwul00eUem+sbAqrEKJAEGLrcWpAGlcp8jW5i+44dyHE4o4vDmUOLx/x
eJGMKwhv2Xe7Us15Fh4ioOBtmO6/AH60Scbid3aZ6zlJiUEPwpotzD9Jm/nR+B/E
/KRsXZ+dTIZpeke9vVXbml/nrq/xwvpAZrEGeXBg1FDUHNsGWEeqPFq2ZfygVw22
x5loXeb8cqIETuA3EJQ1fx0Ioqnh3Q85TtNTCTpZrKcrTqJX+lZTlrEn4iAaMvp1
Bp/Mu9dkFrIJaid0iwdJKk2STsROh5ZCXCOyFOo5LFvFoKE=
=DlVS
-----END PGP SIGNATURE-----

--=separator
Content-Type: application/octet-stream; name="xsa371-linux.patch"
Content-Disposition: attachment; filename="xsa371-linux.patch"
Content-Transfer-Encoding: base64

RnJvbTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgpTdWJqZWN0
OiB4ZW4tYmxrYmFjazogZG9uJ3QgbGVhayBwZXJzaXN0ZW50IGdyYW50cyBm
cm9tIHhlbl9ibGtia19tYXAoKQoKVGhlIGZpeCBmb3IgWFNBLTM2NSB6YXBw
ZWQgdG9vIG1hbnkgb2YgdGhlIC0+cGVyc2lzdGVudF9nbnRbXSBlbnRyaWVz
LgpPbmVzIHN1Y2Nlc3NmdWxseSBvYnRhaW5lZCBzaG91bGQgbm90IGJlIG92
ZXJ3cml0dGVuLCBidXQgaW5zdGVhZCBsZWZ0CmZvciB4ZW5fYmxrYmtfdW5t
YXBfcHJlcGFyZSgpIHRvIHBpY2sgdXAgYW5kIHB1dC4KClRoaXMgaXMgWFNB
LTM3MS4KClJlcG9ydGVkLWJ5OiBOaWNvbGFpIFN0YW5nZSA8bnN0YW5nZUBz
dXNlLmRlPgpTaWduZWQtb2ZmLWJ5OiBKYW4gQmV1bGljaCA8amJldWxpY2hA
c3VzZS5jb20+CkNjOiBzdGFibGVAdmdlci5rZXJuZWwub3JnClJldmlld2Vk
LWJ5OiBKdWVyZ2VuIEdyb3NzIDxqZ3Jvc3NAc3VzZS5jb20+ClJldmlld2Vk
LWJ5OiBXZWkgTGl1IDx3bEB4ZW4ub3JnPgoKLS0tIGEvZHJpdmVycy9ibG9j
ay94ZW4tYmxrYmFjay9ibGtiYWNrLmMKKysrIGIvZHJpdmVycy9ibG9jay94
ZW4tYmxrYmFjay9ibGtiYWNrLmMKQEAgLTg5MSw3ICs4OTEsNyBAQCBuZXh0
Ogogb3V0OgogCWZvciAoaSA9IGxhc3RfbWFwOyBpIDwgbnVtOyBpKyspIHsK
IAkJLyogRG9uJ3QgemFwIGN1cnJlbnQgYmF0Y2gncyB2YWxpZCBwZXJzaXN0
ZW50IGdyYW50cy4gKi8KLQkJaWYoaSA+PSBsYXN0X21hcCArIHNlZ3NfdG9f
bWFwKQorCQlpZihpID49IG1hcF91bnRpbCkKIAkJCXBhZ2VzW2ldLT5wZXJz
aXN0ZW50X2dudCA9IE5VTEw7CiAJCXBhZ2VzW2ldLT5oYW5kbGUgPSBCTEtC
QUNLX0lOVkFMSURfSEFORExFOwogCX0K

--=separator--

