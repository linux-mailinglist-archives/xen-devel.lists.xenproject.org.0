Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C46FF7540B2
	for <lists+xen-devel@lfdr.de>; Fri, 14 Jul 2023 19:42:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.563721.881162 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qKMn9-00087P-Ra; Fri, 14 Jul 2023 17:41:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 563721.881162; Fri, 14 Jul 2023 17:41:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qKMn9-00085d-L8; Fri, 14 Jul 2023 17:41:19 +0000
Received: by outflank-mailman (input) for mailman id 563721;
 Fri, 14 Jul 2023 17:41:17 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=GXWP=DA=xenbits.xen.org=andrewcoop@srs-se1.protection.inumbo.net>)
 id 1qKMn7-00083u-Se
 for xen-devel@lists.xen.org; Fri, 14 Jul 2023 17:41:17 +0000
Received: from mail.xenproject.org (mail.xenproject.org [104.130.215.37])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9e7e1b83-226d-11ee-8611-37d641c3527e;
 Fri, 14 Jul 2023 19:41:14 +0200 (CEST)
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <andrewcoop@xenbits.xen.org>)
 id 1qKMmq-0000i8-Up; Fri, 14 Jul 2023 17:41:00 +0000
Received: from andrewcoop by xenbits.xenproject.org with local (Exim 4.92)
 (envelope-from <andrewcoop@xenbits.xen.org>)
 id 1qKMmq-00035B-SS; Fri, 14 Jul 2023 17:41:00 +0000
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
X-Inumbo-ID: 9e7e1b83-226d-11ee-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Date:Message-Id:Subject:CC:From:To:MIME-Version:
	Content-Transfer-Encoding:Content-Type;
	bh=gxB4B4uIvI6wAiFwKGJzyX3wE3vX8wzw64hKr8BxA9I=; b=FXF2NKoFKFfVrspdb9BJ/B/frR
	8W+LCdD1qV75H2UAogqF38xZnScWubmNwXpKQySknnKHr5impkoj7BWMp98CdeAzKJkxAW4ltoOSV
	EDXn1LNqXMD7+5wlk7QQMxOuLsHxi/jf7Wf6qJG5cnS7J3PunBsJ/tPzrcUs0aM3eJvo=;
Content-Type: multipart/mixed; boundary="=separator"; charset="utf-8"
Content-Transfer-Encoding: binary
MIME-Version: 1.0
X-Mailer: MIME-tools 5.509 (Entity 5.509)
To: xen-announce@lists.xen.org, xen-devel@lists.xen.org,
 xen-users@lists.xen.org, oss-security@lists.openwall.com
From: Xen.org security team <security@xen.org>
CC: Xen.org security team <security-team-members@xen.org>
Subject: Xen Security Notice 1 v1 - winpvdrvbuild.xenproject.org
 potentially compromised
Message-Id: <E1qKMmq-00035B-SS@xenbits.xenproject.org>
Date: Fri, 14 Jul 2023 17:41:00 +0000

--=separator
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA256

                     Xen Security Notice 1

         winpvdrvbuild.xenproject.org potentially compromised

ISSUE DESCRIPTION
=================

Software running on the Xen Project hosted subdomain
winpvdrvbuild.xenproject.org is outdated and vulnerable to several
CVEs.  Some of the reported issues include remote code execution.  The
affected host was running the Jenkins build system for the Windows PV
Drivers subproject.

IMPACT
======

Since the list of CVEs reported include remote code execution we no
longer have confidence that binaries previously available at:

https://xenbits.xen.org/pvdrivers/win/

are trustworthy.  This includes binaries signed with Xen Project's EV
key that is cross-signed by Microsoft.

Note that the source code for the windows drivers, hosted on
xenbits.xen.org is in a separate system and we are confident that it
has not been tampered with.  The EV key was also not available to the
possibly compromised system.

ACTIONS TAKEN
=============

The possibly compromised system has been decommissioned.

We have removed all previous binaries from:

https://xenbits.xen.org/pvdrivers/win/

A new set of drivers based on the current master branch
(9.0-unstable) and built on a trusted environment have been uploaded
on the same folder with the following hashes:

$ sha256sum xen*.tar
b089e46d52ffc64a14799c609272ccdded805c1552a88b45d95a64a27e775de7  xenbus.tar
afc6f11f9078cb457daa000b8b8d8ab69656d3950e7afbf6f40aaa5da217301a  xencons.tar
7bbcedcda5e2ffa8ab32eb3d207d1c7db5b91e22926b26d75750bfadde6611f0  xenhid.tar
a8f3344e370647696e3ed39201f5c9db693aca1c093a638fde8b7a928a4416c2  xeniface.tar
560d7049f5e321545dda25c26b5f56e0975a7f62d35629f4c9a73f0fbd148cf3  xennet.tar
9cb34cd135aab045a2401098c4044c95dbd179c454718e43045e433401b8e3dd  xenvbd.tar
47c1b9bc6e90e20d3f524036a3171cf7f8da1d94186febbae0d4a108db7bb3b5  xenvif.tar
09a4b108a9d3fca699c3c31aeb4836cfee2538e588462b0646dcccbde42a4263  xenvkbd.tar

ACTIONS IN PROGRESS
===================

The security team is attempting to inspect existing binaries to
determine whether there are any obvious signs of tampering.

CREDITS
=======

We would like to thank Mahmud Hasan for bringing this to our
attention.

WHAT IS AN XSN
==============

A Xen Security Notice is a mechanism the Security Team was already in
the process of introducing, for providing official communication of
security-relevant information that is not of the form that fits in the
normal XSA template.  Please bear with us as we find the right balance
while trying to fast-track it into use.
-----BEGIN PGP SIGNATURE-----

iQFABAEBCAAqFiEEI+MiLBRfRHX6gGCng/4UyVfoK9kFAmSxe3YMHHBncEB4ZW4u
b3JnAAoJEIP+FMlX6CvZgwgH/1serMIChH2tFlbU0HSgVk07KCO17lFcCJnhDSA8
uEv3uYiW8NCZEwaD2wmgxN9tW7yTIoeSrsnTyU9D305M6gy3F9g1XcktAv9HhtEO
fS/Pdq1q/ec4vStOYUzx6yG/2GIKNYny5Um4X2Odr/dvYcdZJPkmeJtv6yIa5wSC
q3jCou/VoBCwXUGqlqzRdRsJ+srmsFfmsTn/oNuM28gkV+qRAUc+J6z+psObo2yp
KE/Jgl9B6Nq2+d7sbcgto77a/4FrgtW01qFgIbvQPcE8BBlPF4xymKeCBSGEY/yL
MrOyYpw81cOd0IvSVdQglW63+DO76EksBJJWQbtazwhbPDs=
=jmGB
-----END PGP SIGNATURE-----

--=separator--

