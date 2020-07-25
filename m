Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C7DB222D7FE
	for <lists+xen-devel@lfdr.de>; Sat, 25 Jul 2020 16:13:25 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jzKuG-0006S1-HE; Sat, 25 Jul 2020 14:12:08 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=179P=BE=lucina.net=martin@srs-us1.protection.inumbo.net>)
 id 1jzKuE-0006Rk-FY
 for xen-devel@lists.xenproject.org; Sat, 25 Jul 2020 14:12:06 +0000
X-Inumbo-ID: cd619335-ce80-11ea-8935-bc764e2007e4
Received: from smtp.lucina.net (unknown [62.176.169.44])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id cd619335-ce80-11ea-8935-bc764e2007e4;
 Sat, 25 Jul 2020 14:11:59 +0000 (UTC)
Received: from nodbug.lucina.net (78-141-76-187.dynamic.orange.sk
 [78.141.76.187])
 by smtp.lucina.net (Postfix) with ESMTPSA id 6C587122804;
 Sat, 25 Jul 2020 16:11:58 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lucina.net;
 s=dkim-201811; t=1595686318;
 bh=dJpr3t/Bj4rG8E80K4sYxz7KiwigcQD6C2SSO9jK4Go=;
 h=Date:From:To:Cc:Subject:From;
 b=J+JHXndnSp4CdkOvsT84v5Z3sryLP8ktj1SQiH45oyp4TbvmZUd3eY+2jU3/f4xs6
 9v5EddytEVhRUF7ECColBXXS2ZW9ETuGyAS0tQs0zSEh2gQazN3zyXNX+oTTn3T25L
 oztnTdFZrxYDOxyVz2wOXNhG/+vEYYiDXiMpHGFpq+CM6GKYwUvl3pRUm99kJKNZ24
 qZCV0oSJskPyFFFpAziTcI6vigUWdVXr24n0QfUq6z6Vnpz//+pFuPrw7buCeO5e7U
 OuTsDuMe++JM4nVt1VgycBBFkbmjXuBXoC4bhqYIg2flvZxHsImmop5xMd5gewpV9s
 ClQme5k1YUOHg==
Received: by nodbug.lucina.net (Postfix, from userid 1000)
 id 5B0122684962; Sat, 25 Jul 2020 16:11:58 +0200 (CEST)
Date: Sat, 25 Jul 2020 16:11:58 +0200
From: Martin Lucina <martin@lucina.net>
To: mirageos-devel@lists.xenproject.org
Subject: Call for testing: New MirageOS Xen platform stack
Message-ID: <20200725141158.GD27205@nodbug.lucina.net>
Mail-Followup-To: Martin Lucina <martin@lucina.net>,
 mirageos-devel@lists.xenproject.org, xen-devel@lists.xenproject.org
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: xen-devel@lists.xenproject.org
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Hello,

over the past couple of months we have developed a new Xen platform stack [1]
for MirageOS, replacing our use of Mini-OS for the low-level C startup and
interfaces to Xen, and aligning the entire stack with our existing
Solo5-based backends as much as is practical.

The implementation is now functionally complete, including the dependent
packages/driver implementation used by the majority of MirageOS
unikernels. The new stack brings support for running MirageOS unikernels as
PVHv2 domUs, and various long-awaited improvements to the overall security
posture for MirageOS unikernels on Xen [2].
 
As this is a from-scratch rewite, I'd like to invite folks to test and
review it before we start the release train. The plan is to release a
version of Mirage 3.x with the new Xen stack early after the summer.

Please note that the new stack builds MirageOS unikernels exclusively as
PVHv2 domUs and thus requires Xen 4.10 or later.  Also, we have removed
support for ARM32 as this never got much traction, so the current
implementation is x86_64-only.

For Qubes OS users, given that the current release of Qubes OS ships with
Xen 4.8 which the new stack does not support, you will need to wait until
testing builds of Qubes OS 4.1 are available.

If you'd like to test your unikernels against the new stack, you can do so
by installing MirageOS from scratch in a new OPAM switch, using the OPAM
repository containing the updated packages as follows:

    opam repo add mirage-dev-3.x+xen-pvh-via-solo5 git+https://github.com/mirage/mirage-dev.git#3.x+xen-pvh-via-solo5

Followed by building MirageOS unikernels for the 'xen' target as usual.

Please report any failures and successes here, or in the overall tracking
issue on Github [1], where you can also find more details on what has
changed from a feature and interface point of view. Note that unikernels or
libraries which access Xen-specific MirageOS interfaces may need to be
updated, see [2] for details.

Martin

[1] https://github.com/mirage/mirage/issues/1159
[2] https://github.com/mirage/mirage-xen/pull/23

