Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1ACC8180451
	for <lists+xen-devel@lfdr.de>; Tue, 10 Mar 2020 18:05:47 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jBiH3-0003l9-73; Tue, 10 Mar 2020 17:02:33 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=A/xx=43=xenbits.xen.org=iwj@srs-us1.protection.inumbo.net>)
 id 1jBiH0-0003l4-UV
 for xen-devel@lists.xen.org; Tue, 10 Mar 2020 17:02:30 +0000
X-Inumbo-ID: ec4fe706-62f0-11ea-adf4-12813bfff9fa
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id ec4fe706-62f0-11ea-adf4-12813bfff9fa;
 Tue, 10 Mar 2020 17:02:29 +0000 (UTC)
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <iwj@xenbits.xen.org>)
 id 1jBiGr-0004P7-Fk; Tue, 10 Mar 2020 17:02:21 +0000
Received: from iwj by xenbits.xenproject.org with local (Exim 4.89)
 (envelope-from <iwj@xenbits.xen.org>)
 id 1jBiGr-0008Uj-Ds; Tue, 10 Mar 2020 17:02:21 +0000
Content-Type: multipart/mixed; boundary="=separator"; charset="utf-8"
Content-Transfer-Encoding: binary
MIME-Version: 1.0
X-Mailer: MIME-tools 5.508 (Entity 5.508)
To: xen-announce@lists.xen.org, xen-devel@lists.xen.org,
 xen-users@lists.xen.org, oss-security@lists.openwall.com
From: Xen.org security team <security@xen.org>
Message-Id: <E1jBiGr-0008Uj-Ds@xenbits.xenproject.org>
Date: Tue, 10 Mar 2020 17:02:21 +0000
Subject: [Xen-devel] Xen Security Advisory 315 v1 (CVE-2020-0551) - Load
 Value Injection (LVI) speculative side channel
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
Cc: "Xen.org security team" <security-team-members@xen.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

--=separator
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA256

            Xen Security Advisory CVE-2020-0551 / XSA-315

           Load Value Injection (LVI) speculative side channel

ISSUE DESCRIPTION
=================

This is very closely related to the Microarchitectural Data Sampling
vulnerabilities from May 2019.

Please see https://xenbits.xen.org/xsa/advisory-297.html for details
about MDS.

A new way of using the micro-architectural details behind MDS has been
identified.  Instead of simply trying to sample data from a different
privilege context, an attacker can arrange for poisoned data to be
consumed (speculatively) in a victim context.

This expands the range of tools by which an attacker can manipulate
speculation in the victim context to leak data via a side channel.

For more details, see:
  https://software.intel.com/security-software-guidance/insights/deep-dive-load-value-injection

IMPACT
======

An attacker, which could include a malicious untrusted user process on a
trusted guest, or an untrusted guest, can potentially cause a victim
context (process, or guest, or guest kernel, or hypervisor) to leak
secrets available to it.

VULNERABLE SYSTEMS
==================

Systems running all versions of Xen are affected.

Only x86 processors are vulnerable.
ARM processors are not believed to be vulnerable.

Only Intel based processors are potentially affected.  Processors from
other manufacturers (e.g. AMD) are not believed to be vulnerable.

Please consult the Intel Security Advisory for details on the affected
processors.

MITIGATION
==========

Xen does not support the use of SGX (Software Guard Extensions).
Outside of the SGX enclave case, the attacker has a limited ability to
control the paging behaviour in the victim context.

Therefore, it is not believed that there is a practical way to attack a
victim context which is not an SGX enclave.

Furthermore, preexisting work (including fixes for MDS, SMAP hardening
for user pointers) and in-progress work (core scheduling for SMT
systems) all raise the bar further for an attacker.

There are no known LVI gadgets within Xen.  As a result, we have
decided not to make any changes to default configurations of Xen.

Systems with untrusted PV guests, and whose host administrators are
worried about potential LVI gadgets, might wish to consider changing
the VM to be HVM instead, or make use of PV-Shim, to limit the scope
of a potential attack.

NOTE REGARDING PAGE MODIFICATION LOGGING
========================================

Included for completeness, rather than due to being a realistic concern:

On Intel Broadwell and later systems, Xen uses Page Modification Logging
to accelerate logdirty tracking on migration.  The use of this does put
the guest kernel at a higher risk of being attacked, due to the use of
EPT Access/Dirty bits used behind the scenes.  Userspace shouldn't be
able to influence when a migration occurs, but booting Xen with
`ept=no-ad` will mitigate this concern by causing Xen to fall back to
software logdirty tracking.

RESOLUTION
==========

There is no complete resolution available.

In general, administrators of Xen systems are recommended to take no
action in response to this vulnerability.

If potential LVI gadgets are discovered in Xen, they will be addressed
on a case by case basis, in the same way as Spectre v1 hardening.

NOTE REGARDING LACK OF EMBARGO
==============================

Despite an attempt to organise predisclosure, the discoverers ultimately
did not authorise a predisclosure.
-----BEGIN PGP SIGNATURE-----

iQFABAEBCAAqFiEEI+MiLBRfRHX6gGCng/4UyVfoK9kFAl5nyAsMHHBncEB4ZW4u
b3JnAAoJEIP+FMlX6CvZposH/0ZH/AXAFND2aBRdxKoWZtWyAaxrI0NPRz/H+AEZ
CKtoV7E0HmwCSucxJOCe95yv/shKYSqoG4mMkxT+6v1gH7Hv/2dbl12G0Nlo5lyq
LSkbvyLwCa1ceL6xa5qanx0GkJL+tiOP3EPDBKpO5Lqok5WS/uXQRwIequArPLNi
S4xmE0oKv/yOXRRe2BhnAp6+lY/U6kuMxVNEXF5/6p3/31tnZhabkLJp5N2yl5Ts
OEVjwnzEYRgi5npes1TW6PkPA5p0L4rq/oiVPvTqJsNWRkCmHvR2uRXDc1cI/9gs
wnam4wTVF2tOXZ8/+n+XvUVUPeLAqzncv2D8+RWkX8pKu18=
=DFQP
-----END PGP SIGNATURE-----

--=separator
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--=separator--

