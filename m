Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 07E331E47C1
	for <lists+xen-devel@lfdr.de>; Wed, 27 May 2020 17:41:28 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jdyBD-0001Tw-CB; Wed, 27 May 2020 15:41:19 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Mtku=7J=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1jdyBB-0001Tp-Kr
 for xen-devel@lists.xenproject.org; Wed, 27 May 2020 15:41:17 +0000
X-Inumbo-ID: 8066da2c-a030-11ea-a760-12813bfff9fa
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 8066da2c-a030-11ea-a760-12813bfff9fa;
 Wed, 27 May 2020 15:41:16 +0000 (UTC)
Authentication-Results: esa1.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: CLmjROcVQQK0tn0MKoOfTvUKHIX4tqItm1DRqIcOLCRMrh7uoUXcGWom/0YaSYZjr75L5VGHkK
 n+esSnZraN0kir/DTgImwLUoc48LeHfcmxuVFNVGBlC4CiTEHFrtw0YchCW2p9wEKCdHCxbYYn
 2Gju2dbJdGSc5q8rO2UUFsSUAIvJ8KCZx+UF9/h9XORd32Q7SccA/JxXh4BayEA7q5B0V1i4/t
 +uxdpXQ3oKYwpf1DRsuuJYD1lgaqBDbQ2cdz1MDA6qIn2gYOcpGrQVSctal3y43GVT0MI4cfTf
 Z/A=
X-SBRS: 2.7
X-MesageID: 18864744
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.73,441,1583211600"; d="scan'208";a="18864744"
From: Ian Jackson <ian.jackson@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Message-ID: <24270.35349.838484.116865@mariner.uk.xensource.com>
Date: Wed, 27 May 2020 16:41:09 +0100
To: Daniel De Graaf <dgdegra@tycho.nsa.gov>, Andrew Cooper
 <andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, "Jan
 Beulich" <jbeulich@suse.com>, Julien Grall <julien@xen.org>, "Stefano
 Stabellini" <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
Subject: Xen XSM/FLASK policy, grub defaults, etc.
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: xen-devel@lists.xenproject.org, cjwatson@debian.org
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

The Xen tools build system builds a FLASK policy by default.  It does
this even if the hypervisor build for XSM is disabled.

I recently sent patches upstream to grub to support XSM in
update-grub.  update-grub is the program which examines your /boot and
generates appropriate bootloader entries.  My merge request
  https://salsa.debian.org/grub-team/grub/-/merge_requests/18
finds XSM policy files, and when theya are found, generates "XSM
enabled" bootloader entries. [1]

The result of these two things together is that a default build of
grub will result in these "XSM enabled" bootloader entries.  In
practice I think these entries will boot because everything ignores
the additional XSM policy file (!) and Xen ignores the
"flask=enforcing" option (!!)

This is not particularly good.  Offering people an "XSM enabled"
option which does nothing is poor because it might think they have the
extra security but actually significantly more steps are needed.  But
there doesn't appear to be any way for update-grub to tell whether a
particular hypervisor does support XSM or not.

I think the following changes would be good:

1. Xen should reject "flask=enforcing" if it is built without FLASK
support, rather than ignoring it.  This will ensure users are not
misled by these boot options since they will be broken.

2. Xen should disable the XSM policy build when FLASK is disabled.
This is unfortunately not so simple because the XSM policy build is a
tools option and FLASK is a Xen option and the configuration systems
are disjoint.  But at the very least a default build, which has no XSM
support, should not build an XSM policy file either.

3. Failing that, Xen should provide some other mechanism which would
enable something like update-grub to determine whether a particular
hypervisor can sensibly be run with a policy file and flask=enforcing.

Opinions?

Thanks,
Ian.

[1] osstest has been doing this approximately forever.  Due to
accidents of boot config ordering, these entries have not been used by
default.

