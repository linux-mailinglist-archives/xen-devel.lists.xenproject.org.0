Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iNaNLG0OvWkz6QIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 20 Mar 2026 10:07:57 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 42AE22D7C07
	for <lists+xen-devel@lfdr.de>; Fri, 20 Mar 2026 10:07:57 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1257868.1552118 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w3VpX-00061v-FX; Fri, 20 Mar 2026 09:07:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1257868.1552118; Fri, 20 Mar 2026 09:07:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w3VpX-0005zW-CM; Fri, 20 Mar 2026 09:07:43 +0000
Received: by outflank-mailman (input) for mailman id 1257868;
 Fri, 20 Mar 2026 09:07:41 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=GknJ=BU=arm.com=bertrand.marquis@srs-se1.protection.inumbo.net>)
 id 1w3VpV-0005zQ-NN
 for xen-devel@lists.xenproject.org; Fri, 20 Mar 2026 09:07:41 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTP
 id 3c42a681-243c-11f1-9ccf-f158ae23cfc8;
 Fri, 20 Mar 2026 10:07:35 +0100 (CET)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B65621596;
 Fri, 20 Mar 2026 02:07:28 -0700 (PDT)
Received: from C3HXLD123V.arm.com (unknown [10.57.84.63])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 608AB3F778;
 Fri, 20 Mar 2026 02:07:33 -0700 (PDT)
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
X-Inumbo-ID: 3c42a681-243c-11f1-9ccf-f158ae23cfc8
From: Bertrand Marquis <bertrand.marquis@arm.com>
To: xen-devel@lists.xenproject.org
Cc: Volodymyr Babchuk <volodymyr_babchuk@epam.com>,
	Jens Wiklander <jens.wiklander@linaro.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Michal Orzel <michal.orzel@amd.com>
Subject: [PATCH 0/2] xen/arm: tee: Fix MISRA findings
Date: Fri, 20 Mar 2026 10:07:20 +0100
Message-ID: <cover.1773911799.git.bertrand.marquis@arm.com>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [1.11 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[arm.com : SPF not aligned (relaxed), No valid DKIM,none];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_SOME(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:volodymyr_babchuk@epam.com,m:jens.wiklander@linaro.org,m:sstabellini@kernel.org,m:julien@xen.org,m:michal.orzel@amd.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[bertrand.marquis@arm.com,xen-devel-bounces@lists.xenproject.org];
	ARC_NA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[mailman];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCPT_COUNT_FIVE(0.00)[6];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bertrand.marquis@arm.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.884];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	R_DKIM_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 42AE22D7C07
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

This series fixes two MISRA findings in the arm/tee mediators.

1. Rename a local variable in FF-A partition-info handling to avoid
 shadowing the global `ffa_vm_count` (Rule 5.3 report).
2. Add/document `default` switch labels in OP-TEE paths to satisfy
 Rule 16.4 checks.

This serie is based on "xen/arm: ffa: Add PARTITION_INFO_GET_REGS support"
which is pending for merge in the tree so it must not be merged before
it !!

The following pipeline executed on top of this serie shows that there
are no findings anymore in xen/arch/arm/tee:
https://gitlab.com/xen-project/people/bmarquis/xen-ffa-research/-/pipelines/2395186683

Bertrand Marquis (2):
  xen/arm: ffa: Fix local ffa_vm_count shadowing
  xen/arm: optee: Add MISRA-compliant switch default labels

 xen/arch/arm/tee/ffa_partinfo.c | 14 +++++++-------
 xen/arch/arm/tee/optee.c        | 11 +++++++++++
 2 files changed, 18 insertions(+), 7 deletions(-)

-- 
2.52.0


