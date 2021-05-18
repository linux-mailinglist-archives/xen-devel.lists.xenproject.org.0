Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 153E4387DD5
	for <lists+xen-devel@lfdr.de>; Tue, 18 May 2021 18:43:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.129456.242982 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lj2nl-00057R-6V; Tue, 18 May 2021 16:42:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 129456.242982; Tue, 18 May 2021 16:42:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lj2nl-00055N-1O; Tue, 18 May 2021 16:42:37 +0000
Received: by outflank-mailman (input) for mailman id 129456;
 Tue, 18 May 2021 16:42:36 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=h4/q=KN=suse.com=dfaggioli@srs-us1.protection.inumbo.net>)
 id 1lj2nk-00055E-3m
 for xen-devel@lists.xenproject.org; Tue, 18 May 2021 16:42:36 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 1ffad699-c342-421e-9f5a-85064485cb1e;
 Tue, 18 May 2021 16:42:35 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 6EB20AEA8;
 Tue, 18 May 2021 16:42:34 +0000 (UTC)
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
X-Inumbo-ID: 1ffad699-c342-421e-9f5a-85064485cb1e
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1621356154; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=fz26dujv6Bet8gex+riX+B35ZkBkrIv/4Cx5jjYEB0E=;
	b=pbhx93TU2knJKiaDiY8rOQ2fDJCMgYW5JdnzUgFxTxsoT1i+D6fcumiHBI1R/FfBSgt9iE
	wzs2UkEQSOAwbLYPupTQuQPdRj8v9ibnE3IEjhjJib026BL2JPWFWgXbEBNDUxb1s2Vn95
	AxcmIvrqSvzGUHWYpssus0jCoStd/lA=
Subject: [PATCH v2 0/2] automation: fix building in the openSUSE Tumbleweed
From: Dario Faggioli <dfaggioli@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Doug Goldstein <cardoe@cardoe.com>,
 Roger Pau Monne <roger.pau@citrix.com>,
 =?utf-8?q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>
Date: Tue, 18 May 2021 18:42:33 +0200
Message-ID: <162135593827.20014.14959979363028895972.stgit@Wayrath>
User-Agent: StGit/0.23
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit

Fix the build in the openSUSE Tumbleweed container within our CI. There
was a missing dependency (libzstd-devel), which needs to be added to the
dockerfile.

OTOH, python3-devel was in the dockerfile already, and hence it should
be there in the image. Yet, build was failing due to that... Maybe we
forgot to build and then push a new image after adding it?

Well, whatever. If this change is accepted, I'm happy to push a new,
updated, image to our registry (ISTR that I used to have the right to
do that).

While there, extend the generalization of the container runtime to use
(we have that in containerize already, through the DOCKER_CMD variable)
to the local building of the containers as well.

Thanks and Regards
---
Dario Faggioli (2):
      automation: use DOCKER_CMD for building containers too
      automation: fix dependencies on openSUSE Tumbleweed containers

 automation/build/suse/opensuse-tumbleweed.dockerfile | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
--
Dario Faggioli, Ph.D
http://about.me/dario.faggioli
Virtualization Software Engineer
SUSE Labs, SUSE https://www.suse.com/
-------------------------------------------------------------------
<<This happens because _I_ choose it to happen!>> (Raistlin Majere)


