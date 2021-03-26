Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B1BB34A87B
	for <lists+xen-devel@lfdr.de>; Fri, 26 Mar 2021 14:46:32 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.101826.195010 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lPmn5-0008V7-9Q; Fri, 26 Mar 2021 13:46:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 101826.195010; Fri, 26 Mar 2021 13:46:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lPmn5-0008Uf-2p; Fri, 26 Mar 2021 13:46:19 +0000
Received: by outflank-mailman (input) for mailman id 101826;
 Fri, 26 Mar 2021 13:46:17 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=MLVS=IY=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1lPmn3-0008UU-Eo
 for xen-devel@lists.xenproject.org; Fri, 26 Mar 2021 13:46:17 +0000
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id aa138d34-f176-48a5-80cc-c0c311781557;
 Fri, 26 Mar 2021 13:46:16 +0000 (UTC)
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
X-Inumbo-ID: aa138d34-f176-48a5-80cc-c0c311781557
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1616766375;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=eBESrAlQIvnE3PocElkQU9g4GiG+/jBNOAhR9ADzN6c=;
  b=J5Ie4nl8FMr7h/gFpGDWGShOEa3m8jTmcW0cx4UgOr+TpE8k4UPNhlLD
   mVI5B8LE/9q7IljZ6WFuq7mdYflWNz7ruzInqKLLNxd4llcaBkbvKPgnz
   VDz6+ad4CwCxfrB+CvjS5+iCDjbNQPMoS69H4bmIBBZgIlbqO5byqlcYm
   Q=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: hM6SmnbWYwSO+lsH/i9e6pQRDCyjwtqObVGJ+THLtcdqR/HkltPp+gjYBAC0vUYzj9EwmQCF7R
 9Fw0d20vijTMqb7BrHx/gljXtHAdrWQNA2Z8CXjJ4SYh8FDGjRByNg88WOljFnnzslugeAOK+o
 vMF2NaWNHaH9lEPBruDinFHte4DNkxoYly7zHeT3QL9riGo6zKukwALSKHyWMcraz1pSjqVtDL
 vFgc20EAav89NrSfWC1TQe7qC+sGRYTPXxfQKeW+qPn/NoQaolkxFvhZRRTXXOjNob55PX0WMi
 4+c=
X-SBRS: 4.0
X-MesageID: 41660996
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:O/JmtavBU9L2N74XfUIJIvjO7skCpIMji2hD6mlwRA09T+Wxi9
 2ukPMH1RX9lTYWXzUalcqdPbSbKEmwybde6+AqXYuKdg/gpWeuMcVe/ZLvqgeQfxHW28x88e
 Nbc6Z4AMDtFlQSt6zHySSxDtpI+ra62Y+yg+O29RlQZCVLT40l0AtjEAacFSRNNWx7LL40Do
 CV6MYChxfIQwV1Uu2BCnMIX/fOqrTw/fqLXTc8CwM68w7LtDu06dfBeCSw5AsUUD9E3N4ZgA
 r4ujH+j5/Dj9iLjiXy+kWWxJRQldvnxLJ4dbGxo/lQEBrAoEKFYIxgXpeLoTw6pvq+gWxa7O
 XkklMbEOlYr1/XY2GpsTvhsjOQrwoG2jvZ5nKzxVvlvMDjSzoxB6N69PxkWyqc0WUMlpVY8s
 twrgWknqsSNzzstmDBwuKNcBdQmk+9sRMZ4JUupk0aa6QyQvtst4AFlXkldqsoLWbBx60MNv
 JhN83Y7OY+SyLhU1np+lNix9GhRR0Ib267a3lHvsSU1g5fl2xiw30Zw9QCnmwB+IhVceg929
 j5
X-IronPort-AV: E=Sophos;i="5.81,280,1610427600"; 
   d="scan'208";a="41660996"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson
	<iwj@xenproject.org>, Wei Liu <wl@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>, Doug Goldstein
	<cardoe@cardoe.com>
Subject: [PATCH for-4.15 0/2] CI adjustments
Date: Fri, 26 Mar 2021 13:45:56 +0000
Message-ID: <20210326134558.7751-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

Adjustements to CI infrastructure for changes in build dependencies.

Andrew Cooper (2):
  tools: Drop gettext as a build dependency
  CI: Add zstd/etc libraries to build environments

 .cirrus.yml                                        |  2 +-
 .travis.yml                                        |  1 -
 README                                             |  1 -
 automation/build/alpine/3.12-arm64v8.dockerfile    |  1 -
 automation/build/alpine/3.12.dockerfile            |  3 +-
 automation/build/centos/7.2.dockerfile             |  1 +
 automation/build/centos/7.dockerfile               |  1 +
 automation/build/debian/jessie-i386.dockerfile     |  1 +
 automation/build/debian/jessie.dockerfile          |  1 +
 automation/build/debian/stretch-i386.dockerfile    |  1 +
 automation/build/debian/stretch.dockerfile         |  1 +
 .../build/debian/unstable-arm64v8.dockerfile       |  1 +
 automation/build/debian/unstable-i386.dockerfile   |  1 +
 automation/build/debian/unstable.dockerfile        |  1 +
 automation/build/fedora/29.dockerfile              |  1 +
 automation/build/suse/opensuse-leap.dockerfile     |  1 +
 .../build/suse/opensuse-tumbleweed.dockerfile      |  1 +
 automation/build/ubuntu/bionic.dockerfile          |  1 +
 automation/build/ubuntu/focal.dockerfile           |  3 +-
 automation/build/ubuntu/trusty.dockerfile          |  1 +
 automation/build/ubuntu/xenial.dockerfile          |  1 +
 .../tests-artifacts/alpine/3.12-arm64v8.dockerfile |  1 +
 tools/configure                                    | 49 ----------------------
 tools/configure.ac                                 |  2 -
 24 files changed, 21 insertions(+), 57 deletions(-)

-- 
2.11.0


