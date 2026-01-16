Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BAC0CD2B742
	for <lists+xen-devel@lfdr.de>; Fri, 16 Jan 2026 05:35:38 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1206118.1519840 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vgbYB-0005HJ-Av; Fri, 16 Jan 2026 04:35:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1206118.1519840; Fri, 16 Jan 2026 04:35:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vgbYB-0005EC-7L; Fri, 16 Jan 2026 04:35:07 +0000
Received: by outflank-mailman (input) for mailman id 1206118;
 Fri, 16 Jan 2026 04:35:05 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <dmukhin@xen.org>) id 1vgbY9-0005E0-NW
 for xen-devel@lists.xenproject.org; Fri, 16 Jan 2026 04:35:05 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <dmukhin@xen.org>) id 1vgbY9-006CyY-1Z;
 Fri, 16 Jan 2026 04:35:05 +0000
Received: from [19.12.91.86] (helo=localhost)
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <dmukhin@xen.org>) id 1vgbY8-005RBx-2j;
 Fri, 16 Jan 2026 04:35:05 +0000
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:
	Subject:Cc:To:From; bh=g09Ig48jUKT3edah76oufAL+kURNVPKdk9sZlJC36mU=; b=WKQ3ic
	ENbdioXeYd1Oh74oCPROMz67JIEfOI6aadXFgK9I0Gx4/H/fNOOxsFBcPlrBR/3QgTT+rGRl7wBzF
	WHtYn9rJJIRLIpG1BWmgSmfTIbym5NXlhVnL1wQyq7z1XJS84lNEOWcQkhbTpCoeuvDbPUSAw9md6
	yIVcaaQ867c=;
From: dmukhin@xen.org
To: xen-devel@lists.xenproject.org
Cc: andrew.cooper3@citrix.com,
	anthony.perard@vates.tech,
	jbeulich@suse.com,
	julien@xen.org,
	michal.orzel@amd.com,
	roger.pau@citrix.com,
	sstabellini@kernel.org,
	dmukhin@ford.com
Subject: [PATCH v1 0/4] introduce xen/scripts/config
Date: Thu, 15 Jan 2026 20:34:54 -0800
Message-ID: <20260116043458.730728-1-dmukhin@ford.com>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

There is currently no in-tree tool to manipulate Kconfig settings in a
non-interactive way similar to the Linux scripts/config utility [1].
Such tooling is useful when building Xen via external build systems (e.g.,
Yocto) and can also simplify custom CI configuration.

This series imports the Linux scripts/config helper and integrates it
into an existing Xen automation script.

Example of usage:

  ./xen/scripts/config --file xen/.config -y FOO -n BAR -y BAZ

Patch 1 imports scripts/config from Linux (based on v6.19-rc5) [1].
Patch 2 drops the -m option, since Xen does not support modules.
Patch 3 adds convenience flags -y (set to yes) and -n (set to no).
Patch 4 performs minimal integration into existing Xen build system.

[1] https://github.com/torvalds/linux/blob/master/scripts/config
[2] https://gitlab.com/xen-project/people/dmukhin/xen/-/pipelines/2266369021

Denis Mukhin (4):
  scripts/config: import Kconfig manipulation tool from Linux
  scripts/config: drop modules support
  scripts/config: add -y|-n flags
  scripts/config: hook to automation build script

 automation/scripts/build |   2 +-
 xen/scripts/config       | 225 +++++++++++++++++++++++++++++++++++++++
 2 files changed, 226 insertions(+), 1 deletion(-)
 create mode 100755 xen/scripts/config

-- 
2.52.0


