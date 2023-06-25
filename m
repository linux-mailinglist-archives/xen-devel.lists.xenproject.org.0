Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CAD673D439
	for <lists+xen-devel@lfdr.de>; Sun, 25 Jun 2023 22:50:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.554871.866287 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qDWfe-0002e3-7c; Sun, 25 Jun 2023 20:49:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 554871.866287; Sun, 25 Jun 2023 20:49:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qDWfe-0002bw-3X; Sun, 25 Jun 2023 20:49:18 +0000
Received: by outflank-mailman (input) for mailman id 554871;
 Sun, 25 Jun 2023 20:49:16 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1qDWfc-0002bk-1q
 for xen-devel@lists.xenproject.org; Sun, 25 Jun 2023 20:49:16 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qDWfb-0003Lm-FS; Sun, 25 Jun 2023 20:49:15 +0000
Received: from 54-240-197-232.amazon.com ([54.240.197.232]
 helo=dev-dsk-jgrall-1b-035652ec.eu-west-1.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qDWfb-00021M-6f; Sun, 25 Jun 2023 20:49:15 +0000
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
	s=20200302mail; h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:
	Subject:Cc:To:From; bh=1fhIEl6j2vrUnpIMcwhx1Ag70rRvI+I121vLxzmF4o0=; b=OzIxOp
	ylOUGwblfw1K313bxJYeP87ZQlpYRcKp26Mxr4x/WsmRYRNskc2kTR8rgw8/EBdGS7nQhOGedh8RO
	QdpEzvf2puMIVBppod7nRWo6HFlgttZusl2+/axFHXnF5+J0rE37G156jgY/7OueWWF6EqNHCCM54
	VDAkVo8/CAU=;
From: Julien Grall <julien@xen.org>
To: xen-devel@lists.xenproject.org
Cc: Luca.Fancellu@arm.com,
	michal.orzel@amd.com,
	Henry.Wang@arm.com,
	Julien Grall <jgrall@amazon.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH 0/9] xen/arm: Enable UBSAN support
Date: Sun, 25 Jun 2023 21:48:58 +0100
Message-Id: <20230625204907.57291-1-julien@xen.org>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Julien Grall <jgrall@amazon.com>

Hi all,

At the moment, we are not able to enable UBSAN on Arm because the
final binary will be over the maximum size of Xen we currently support
(i.e. 2MB).

This patch series aim to lift the restrictions and also
enable UBSAN. Lastly, at the end of the series, there is the first
issue found by USBAN.

There are a few of others. One will be fixed by the MISRA work
in [1] and the other is a bit tricky. One the splat is (the
others seems to be for similar reasons)

(XEN) ================================================================================
(XEN) UBSAN: Undefined behaviour in common/sched/credit2.c:2437:5
(XEN) member access within misaligned address 43feefbc for type 'struct csched2_runqueue_data'
(XEN) which requires 8 byte alignment
(XEN) Xen WARN at common/ubsan/ubsan.c:172

This is on 32-bit and UBSAN seems to complain about the check in
list_for_each_entry. I haven't yet dived into the issue yet.

Cheers,

[1] cover.1687250177.git.gianluca.luparini@bugseng.com

Julien Grall (9):
  xen/arm: Check Xen size when linking
  xen/arm64: head: Don't map too much in boot_third
  xen/arm32: head: Don't map too much in boot_third
  xen/arm32: head: Remove 'r6' from the clobber list of
    create_page_tables()
  xen/arm: Rework the code mapping Xen to avoid relying on the size of
    Xen
  xen/arm64: entry: Don't jump outside of an alternative
  xen/arm64: head: Rework PRINT() to work when the string is not withing
    +/- 1MB
  xen/arm: Allow the user to build Xen with USBAN
  xen/arm32: vfp: Add missing U for shifted constant

 xen/arch/arm/Kconfig                 |  1 +
 xen/arch/arm/arm32/head.S            | 79 +++++++++++++++++++++-------
 xen/arch/arm/arm64/entry.S           | 21 ++++++--
 xen/arch/arm/arm64/head.S            | 68 +++++++++++++++++++-----
 xen/arch/arm/include/asm/arm32/vfp.h | 18 +++----
 xen/arch/arm/include/asm/config.h    | 19 +++----
 xen/arch/arm/include/asm/lpae.h      |  8 +--
 xen/arch/arm/mm.c                    | 24 +++++----
 xen/arch/arm/xen.lds.S               |  4 ++
 9 files changed, 176 insertions(+), 66 deletions(-)

-- 
2.40.1


