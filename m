Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 39230387869
	for <lists+xen-devel@lfdr.de>; Tue, 18 May 2021 14:04:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.129125.242393 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1liySE-00065F-JJ; Tue, 18 May 2021 12:04:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 129125.242393; Tue, 18 May 2021 12:04:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1liySE-00062n-GG; Tue, 18 May 2021 12:04:06 +0000
Received: by outflank-mailman (input) for mailman id 129125;
 Tue, 18 May 2021 12:04:04 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=h4/q=KN=suse.com=dfaggioli@srs-us1.protection.inumbo.net>)
 id 1liySC-00061r-Q0
 for xen-devel@lists.xenproject.org; Tue, 18 May 2021 12:04:04 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id b615a3b2-df48-4451-b539-484ab59b726e;
 Tue, 18 May 2021 12:04:03 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id BC99BAE58;
 Tue, 18 May 2021 12:04:02 +0000 (UTC)
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
X-Inumbo-ID: b615a3b2-df48-4451-b539-484ab59b726e
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1621339442; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=UMXYFcUxc0UVJaWe2oeuoPn4/3Ru9pOjbKNvFVy4ETM=;
	b=rBUpWMgv2QEfnJROEx+VxI1V3L2nK5TYoevgFXX4Ot3U6gNq1H1yRSRT5E8wtyY01ux/kC
	cuhEm56msvFycCN45D9n3WtPxx6I506Bi5xUT1yTIeWxUSOnhAPWGiePXp6wcMG09a4fEc
	WpdFpit1t1caKB7Qn4QB6ELCUBbN5zg=
Subject: [PATCH 0/2] automation: fix building in the openSUSE Tumbleweed
From: Dario Faggioli <dfaggioli@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Doug Goldstein <cardoe@cardoe.com>
Date: Tue, 18 May 2021 14:04:01 +0200
Message-ID: <162133919718.25010.4197057069904956422.stgit@Wayrath>
User-Agent: StGit/0.23
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit

Building Xen in openSUSE Tumbleweed in the GitLab CI was broken due to
python and libzstd development dependencies, so let's update the docker
file to fix that.

If this change is accepted, I'm happy to push a new, updated, image to
our registry (ISTR that I used to have the right to do that).

While there, extend the generalization of the container runtime to use
(we have that in containerize already, through the DOCKER_CMD variable)
to the local building of the containers as well.

Regards
---
Dario Faggioli (2):
      automation: use DOCKER_CMD for building containers too
      automation: fix dependencies on openSUSE Tumbleweed containers

 automation/build/suse/opensuse-tumbleweed.dockerfile | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)
--
Dario Faggioli, Ph.D
http://about.me/dario.faggioli
Virtualization Software Engineer
SUSE Labs, SUSE https://www.suse.com/
-------------------------------------------------------------------
<<This happens because _I_ choose it to happen!>> (Raistlin Majere)


