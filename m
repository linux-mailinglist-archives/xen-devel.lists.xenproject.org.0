Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E63092B58C1
	for <lists+xen-devel@lfdr.de>; Tue, 17 Nov 2020 05:22:11 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.28707.57764 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kesUd-0007Um-5G; Tue, 17 Nov 2020 04:21:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 28707.57764; Tue, 17 Nov 2020 04:21:23 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kesUd-0007US-23; Tue, 17 Nov 2020 04:21:23 +0000
Received: by outflank-mailman (input) for mailman id 28707;
 Tue, 17 Nov 2020 04:21:21 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Shnx=EX=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1kesUb-0007UN-M9
 for xen-devel@lists.xenproject.org; Tue, 17 Nov 2020 04:21:21 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 3a023934-3978-452a-981b-7676b368c567;
 Tue, 17 Nov 2020 04:21:20 +0000 (UTC)
Received: from sstabellini-ThinkPad-T480s (c-24-130-65-46.hsd1.ca.comcast.net
 [24.130.65.46])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 46C912463D;
 Tue, 17 Nov 2020 04:21:19 +0000 (UTC)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=Shnx=EX=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
	id 1kesUb-0007UN-M9
	for xen-devel@lists.xenproject.org; Tue, 17 Nov 2020 04:21:21 +0000
X-Inumbo-ID: 3a023934-3978-452a-981b-7676b368c567
Received: from mail.kernel.org (unknown [198.145.29.99])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id 3a023934-3978-452a-981b-7676b368c567;
	Tue, 17 Nov 2020 04:21:20 +0000 (UTC)
Received: from sstabellini-ThinkPad-T480s (c-24-130-65-46.hsd1.ca.comcast.net [24.130.65.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id 46C912463D;
	Tue, 17 Nov 2020 04:21:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1605586879;
	bh=R6i+XqfnLhuveeIQ6z4Pa7aQo539h24oDLTz60FS9m8=;
	h=Date:From:To:cc:Subject:From;
	b=XErBTo4BlFkES9XJImN7r9Fh/nYvKa+RNl/78SN7HI4vjgPfxw/7CIuZ2yiIHn4n8
	 8jeiWlJiR7fOYAed+B+cUc/ITchSYrZLcvSvqSaauReg1ZwDoPw1BQIxHrT9X/S7ba
	 pUYECSazW1ykSbYjK56RBJm6StZU0aS8LI6B4xzY=
Date: Mon, 16 Nov 2020 20:21:18 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: andrew.cooper3@citrix.com, cardoe@cardoe.com, wl@xen.org
cc: sstabellini@kernel.org, xen-devel@lists.xenproject.org
Subject: [PATCH v2 0/2] automation: arm64 dom0less smoke test
Message-ID: <alpine.DEB.2.21.2011161927120.20906@sstabellini-ThinkPad-T480s>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

Hi all,

This short series introduces a very simple Xen Dom0less smoke test based
on qemu-system-aarch64 to be run as part of the gitlab CI-loop. It
currently passes on staging.

Cheers,

Stefano


Changes in v2:
- use the Debian kernel for testing instead of building your own
- fix x86_32 build


Stefano Stabellini (2):
      automation: add a QEMU aarch64 smoke test
      automation: add dom0less to the QEMU aarch64 smoke test

 automation/gitlab-ci/test.yaml         | 23 ++++++++
 automation/scripts/build               |  6 +--
 automation/scripts/qemu-smoke-arm64.sh | 98 ++++++++++++++++++++++++++++++++++
 3 files changed, 124 insertions(+), 3 deletions(-)
 create mode 100755 automation/scripts/qemu-smoke-arm64.sh

