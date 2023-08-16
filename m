Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B971C77EBA2
	for <lists+xen-devel@lfdr.de>; Wed, 16 Aug 2023 23:22:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.584920.915820 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qWNwk-0001Uo-Ci; Wed, 16 Aug 2023 21:20:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 584920.915820; Wed, 16 Aug 2023 21:20:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qWNwk-0001Rv-8Z; Wed, 16 Aug 2023 21:20:54 +0000
Received: by outflank-mailman (input) for mailman id 584920;
 Wed, 16 Aug 2023 21:20:52 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=8vYs=EB=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1qWNwi-0001Rp-E0
 for xen-devel@lists.xenproject.org; Wed, 16 Aug 2023 21:20:52 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c5456498-3c7a-11ee-8779-cb3800f73035;
 Wed, 16 Aug 2023 23:20:50 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 49F066291A;
 Wed, 16 Aug 2023 21:20:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1AF1EC433C8;
 Wed, 16 Aug 2023 21:20:28 +0000 (UTC)
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
X-Inumbo-ID: c5456498-3c7a-11ee-8779-cb3800f73035
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1692220847;
	bh=UAa9jfrw9B31uxwZ3CgdtOpzmEcru9OUHJVUo9PeOy0=;
	h=Date:From:To:cc:Subject:From;
	b=cCCX4Nn6Z+nE8RRzqJi7tqZ6pd4Sgv7W9zHTRgKeMtysHe406Fh29qfdLG4iijQGu
	 mNpwNt5OUjrnEZLymlWobR1Si+RNDk9lZF4nq3+RqIwE1EGFnVam1IjdD0rGKw02Yd
	 rsNZISAiANuW0NTlg7oeso0xOWkmpH6cB+RyPfDV/CGor98vAeW7qTYHEAIzuqOHKj
	 wD8OErkPqdSVT/iUZWr/ev7Qy+OZl+W2x1Au/0Ut6gAjBZQaamMrA++YiGKUN/sarD
	 i0BLDqZwSOoqruewD72YjfUrTcNj3tX51rQOnQFy78KLkeN3y/fKtbey05iqFVo3+5
	 TLNmd0EsKzcfg==
Date: Wed, 16 Aug 2023 14:20:21 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: xen-devel@lists.xenproject.org
cc: sstabellini@kernel.org, andrew.cooper3@citrix.com, 
    george.dunlap@citrix.com, jbeulich@suse.com, julien@xen.org, wl@xen.org, 
    roger.pau@citrix.com, bertrand.marquis@arm.com, anthony.perard@citrix.com, 
    jgross@suse.com, cardoe@cardoe.com
Subject: [ANNOUNCE] First step toward "gating" Gitlab testing
Message-ID: <alpine.DEB.2.22.394.2308161242070.6458@ubuntu-linux-20-04-desktop>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

Hi all,

The Gitlab test infrastructure for Xen has come a long way since its
inception. It has become a critical part of the Xen community
infrastructure.

As a first step toward the goal of making Gitlab tests gating (a failed
test blocks commits from entering the "master" branch), the committers
will soon start to commit patches to a git tree under
gitlab.com/xen-project rather than xenbits.xenproject.org. The change
will take effect at the very beginning of the 4.19 release cycle. The
Gitlab tree is [1] https://gitlab.com/xen-project/hardware/xen. (In case
of changes to the new Gitlab repository name, we'll provide an update.)

It will be a change for committers, but what does change for everyone
else?

If you are not a committer, nothing will change. The Xen tree on Xenbits
[2] git://xenbits.xenproject.org/xen.git will be kept up-to-date. The
committers will commit to "staging" on Gitlab [1], then a script will
automatically update "staging" on Xenbits [2].

Thus, you can continue to git fetch from your usual git source. OSSTest
will still run after the Xenbits tree [2] is updated and will still be
responsible for pushing to the "master" branch on success, the same as
today.

At first, the Gitlab test pipeline [1] will run in parallel to OSSTest.
As a follow-up step, we plan to run the Gitlab test pipeline before
updating "staging" on Xenbits, thus saving OSSTest bandwidth in case of
failures and keeping the Xen git history of "staging" cleaner. More
details will be provided at that time.

Stay tuned!

Cheers,

Stefano

