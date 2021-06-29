Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C7323B76EE
	for <lists+xen-devel@lfdr.de>; Tue, 29 Jun 2021 19:10:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.148058.273471 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lyHEf-0003LH-L0; Tue, 29 Jun 2021 17:09:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 148058.273471; Tue, 29 Jun 2021 17:09:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lyHEf-0003J0-Hw; Tue, 29 Jun 2021 17:09:21 +0000
Received: by outflank-mailman (input) for mailman id 148058;
 Tue, 29 Jun 2021 17:09:20 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=vrVS=LX=arm.com=bertrand.marquis@srs-us1.protection.inumbo.net>)
 id 1lyHEe-0003Iu-8h
 for xen-devel@lists.xenproject.org; Tue, 29 Jun 2021 17:09:20 +0000
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id 54126923-46df-40e4-951c-a7a05d98cfec;
 Tue, 29 Jun 2021 17:09:18 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7E8081FB;
 Tue, 29 Jun 2021 10:09:18 -0700 (PDT)
Received: from e109506.cambridge.arm.com (e109506.cambridge.arm.com
 [10.1.199.1])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 414B43F694;
 Tue, 29 Jun 2021 10:09:17 -0700 (PDT)
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
X-Inumbo-ID: 54126923-46df-40e4-951c-a7a05d98cfec
From: Bertrand Marquis <bertrand.marquis@arm.com>
To: xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Ian Jackson <iwj@xenproject.org>,
	Jan Beulich <jbeulich@suse.com>,
	Wei Liu <wl@xen.org>
Subject: [RFC PATCH 0/4] xen/arm: Sanitize cpuinfo
Date: Tue, 29 Jun 2021 18:08:52 +0100
Message-Id: <cover.1624974370.git.bertrand.marquis@arm.com>
X-Mailer: git-send-email 2.17.1

On arm architecture we might have heterogeneous platforms with different
types of cores. As a guest can potentialy run on any of those cores we
have to present them cpu features which are compatible with all cores
and discard the features which are only available on some cores.

As the features can be fairly complex, the way to deduce from 2
different features, what should be the acceptable minimal feature can be
complex (and sometime impossible).

This RFC is a first attempt for a solution to start a discussion and get
inputs from the community.

To reduce the implementation effort in Xen, this serie is importing the
structures and filtering system used by Linux in order to build a
cpuinfo containing the best values compatible with all cores on the
platform.

The serie start by importing the necessary code and structure from Linux
and then use it to sanitize the boot cpuinfo.
Finally it is simplifying some Xen code which was doing the same in p2m
and allows to use heterogeneous platforms on arm64.


Bertrand Marquis (4):
  xen/arm: Import ID registers definitions from Linux
  xen/arm: Import ID features sanitize from linux
  xen/arm: Sanitize cpuinfo ID registers fields
  xen/arm: Use sanitize values for p2m

 xen/arch/arm/arm64/Makefile         |   1 +
 xen/arch/arm/arm64/cpusanitize.c    | 628 ++++++++++++++++++++++++++++
 xen/arch/arm/p2m.c                  |  30 +-
 xen/arch/arm/smpboot.c              |   5 +-
 xen/include/asm-arm/arm64/sysregs.h | 312 ++++++++++++++
 xen/include/asm-arm/cpufeature.h    |   9 +
 xen/include/xen/lib.h               |   1 +
 7 files changed, 965 insertions(+), 21 deletions(-)
 create mode 100644 xen/arch/arm/arm64/cpusanitize.c

-- 
2.17.1


