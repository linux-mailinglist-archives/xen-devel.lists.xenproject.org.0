Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7340F76B978
	for <lists+xen-devel@lfdr.de>; Tue,  1 Aug 2023 18:14:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.574420.899669 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qQs0x-00011a-Dg; Tue, 01 Aug 2023 16:14:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 574420.899669; Tue, 01 Aug 2023 16:14:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qQs0x-0000ze-Ab; Tue, 01 Aug 2023 16:14:27 +0000
Received: by outflank-mailman (input) for mailman id 574420;
 Tue, 01 Aug 2023 16:14:25 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=B3Rc=DS=apertussolutions.com=dpsmith@srs-se1.protection.inumbo.net>)
 id 1qQs0v-0000zY-I1
 for xen-devel@lists.xenproject.org; Tue, 01 Aug 2023 16:14:25 +0000
Received: from sender3-of-o58.zoho.com (sender3-of-o58.zoho.com
 [136.143.184.58]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 79b057a0-3086-11ee-b25c-6b7b168915f2;
 Tue, 01 Aug 2023 18:14:23 +0200 (CEST)
Delivered-To: dpsmith@apertussolutions.com
Received: from sisyou.hme. (static-72-81-132-2.bltmmd.fios.verizon.net
 [72.81.132.2]) by mx.zohomail.com
 with SMTPS id 1690906457983258.8849360837505;
 Tue, 1 Aug 2023 09:14:17 -0700 (PDT)
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
X-Inumbo-ID: 79b057a0-3086-11ee-b25c-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; t=1690906459; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=FCalTfY/E0aAARrLJfuwrakIySVz0BGh0t/d7czwDRM+5whXdVj55Wyhmfw5KtjvO7SwBDNOF2w+3S2RM+P9c7vuuTN4LYsvXbQV7cZtO9H1ZpNhdvn4GSA36F4Fqv1kSCuGLqFn+jOAXOyA6x+HiLff1ywRsb756w3IsS/mEIw=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1690906459; h=Content-Transfer-Encoding:Cc:Date:From:MIME-Version:Message-ID:Subject:To; 
	bh=pCr0JdRG9q1ElrX475c2UAk9oXat/55aUxS95iDoabE=; 
	b=DB0OBlpAaswZDKABw4uoCZGGdWImU4i0kh6Ko+nE+1BcwvACU+LSXiUUnOf3MMP5LHlljox1ikMEMan5z/N0aPAtItcRtQVllVqUYCICLTThNJ5LuUcG0ivGY25pqLSkPwgZFaeY2mLNGxKF6GlcGohJT8m61yw7JwTYqBpZMLo=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1690906459;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-Id:Message-Id:MIME-Version:Content-Transfer-Encoding:Reply-To;
	bh=pCr0JdRG9q1ElrX475c2UAk9oXat/55aUxS95iDoabE=;
	b=ggNPW559vdCH4iJr7NqNzPpzSbA37ybSIczyTfldvLc3ZQxk6hnmCmIkdE3uoso9
	i0btBdjGB8MFS818MIwx7l12lrSIU41qfZk4CU6tlz9+hnC6V+ggQzewfqnWJqEd1ir
	nOOvAwD/291TBm/IAxcyMc9KwWaMsbT7oFHOKiTY=
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
To: xen-devel@lists.xenproject.org
Cc: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
	Christopher Clark <christopher.w.clark@gmail.com>,
	Rich Persaud <persaur@gmail.com>,
	Luca Fancellu <luca.fancellu@arm.com>,
	Henry Wang <Henry.Wang@arm.com>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Anthony PERARD <anthony.perard@citrix.com>
Subject: [PATCH 0/2] Rebranding dom0less to hyperlaunch part 1
Date: Tue,  1 Aug 2023 12:14:07 -0400
Message-Id: <20230801161409.25905-1-dpsmith@apertussolutions.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

This is the first series of the proposal put forth on moving to have dom0less
folded under and thus rebranded as a part of hyperlaunch. As laid out in the
proposal, the series updates the hyperlaunch device tree documentation and
applies the general refactoring of FDT parsing to make core logic common.

Daniel P. Smith (2):
  docs: update hyperlaunch device tree
  fdt: make fdt handling reusable across arch

 MAINTAINERS                                   |  11 +
 .../designs/launch/hyperlaunch-devicetree.rst | 566 ++++++++++--------
 xen/arch/arm/bootfdt.c                        | 141 +----
 xen/common/Kconfig                            |   4 +
 xen/common/Makefile                           |   3 +-
 xen/common/fdt.c                              | 153 +++++
 xen/include/xen/device_tree.h                 |  50 +-
 xen/include/xen/fdt.h                         |  79 +++
 8 files changed, 551 insertions(+), 456 deletions(-)
 create mode 100644 xen/common/fdt.c
 create mode 100644 xen/include/xen/fdt.h

-- 
2.20.1


