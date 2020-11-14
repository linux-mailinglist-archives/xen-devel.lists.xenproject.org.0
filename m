Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 59C2F2B2AC7
	for <lists+xen-devel@lfdr.de>; Sat, 14 Nov 2020 03:12:46 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.27050.55731 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kdl2i-0006Ft-TU; Sat, 14 Nov 2020 02:11:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 27050.55731; Sat, 14 Nov 2020 02:11:56 +0000
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
	id 1kdl2i-0006Fb-Q0; Sat, 14 Nov 2020 02:11:56 +0000
Received: by outflank-mailman (input) for mailman id 27050;
 Sat, 14 Nov 2020 02:11:55 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=8rVh=EU=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1kdl2h-0006FW-FO
 for xen-devel@lists.xenproject.org; Sat, 14 Nov 2020 02:11:55 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id ed1db482-3350-4fac-94b2-7d9d96ba054d;
 Sat, 14 Nov 2020 02:11:54 +0000 (UTC)
Received: from sstabellini-ThinkPad-T480s (c-24-130-65-46.hsd1.ca.comcast.net
 [24.130.65.46])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id D25F92225D;
 Sat, 14 Nov 2020 02:11:53 +0000 (UTC)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=8rVh=EU=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
	id 1kdl2h-0006FW-FO
	for xen-devel@lists.xenproject.org; Sat, 14 Nov 2020 02:11:55 +0000
X-Inumbo-ID: ed1db482-3350-4fac-94b2-7d9d96ba054d
Received: from mail.kernel.org (unknown [198.145.29.99])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id ed1db482-3350-4fac-94b2-7d9d96ba054d;
	Sat, 14 Nov 2020 02:11:54 +0000 (UTC)
Received: from sstabellini-ThinkPad-T480s (c-24-130-65-46.hsd1.ca.comcast.net [24.130.65.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id D25F92225D;
	Sat, 14 Nov 2020 02:11:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1605319914;
	bh=+DdL6JZH1w++1IqLUX2/aasJClhdWwwHzAyz0B//UrE=;
	h=Date:From:To:cc:Subject:From;
	b=yFvefLeIic6y3QNKZp7jJ7hyVIq3ub3ZZfTih81Q0reel+Iqvp8QSJ4NnuCu5Qrpb
	 PLbH93Aubcl0FXypHjwWMKnOMq8JGq8D/VQ1JypI5RmKxZKuXHXhuzLa9VFLsQa8ZL
	 BcCInjsfBfaDm+RMgtJKN1G5rMWSWXdTB7x7x/Z4=
Date: Fri, 13 Nov 2020 18:11:53 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Andrew Cooper <andrew.cooper3@citrix.com>, cardoe@cardoe.com, wl@xen.org
cc: sstabellini@kernel.org, xen-devel@lists.xenproject.org
Subject: [PATCH 0/2] automation: arm64 dom0less smoke test
Message-ID: <alpine.DEB.2.21.2011131751380.20906@sstabellini-ThinkPad-T480s>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

Hi all,

This short series introduces a very simple Xen Dom0less smoke test based
on qemu-system-aarch64 to be run as part of the gitlab CI-loop. It
currently passes on staging.

Cheers,

Stefano


Stefano Stabellini (2):
      automation: add a QEMU aarch64 smoke test
      automation: add dom0less to the QEMU aarch64 smoke test

 automation/gitlab-ci/test.yaml         |  23 ++++++++
 automation/scripts/build               |   8 +--
 automation/scripts/qemu-smoke-arm64.sh | 105 +++++++++++++++++++++++++++++++++
 3 files changed, 131 insertions(+), 5 deletions(-)
 create mode 100755 automation/scripts/qemu-smoke-arm64.sh

