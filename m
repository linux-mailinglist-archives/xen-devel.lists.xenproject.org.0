Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id bJs2FzT0g2kSwQMAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 05 Feb 2026 02:36:52 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A547EDB35
	for <lists+xen-devel@lfdr.de>; Thu, 05 Feb 2026 02:36:52 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1221350.1529611 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vnoI3-0001lk-Eo; Thu, 05 Feb 2026 01:36:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1221350.1529611; Thu, 05 Feb 2026 01:36:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vnoI3-0001ib-8G; Thu, 05 Feb 2026 01:36:15 +0000
Received: by outflank-mailman (input) for mailman id 1221350;
 Thu, 05 Feb 2026 01:36:14 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <dmukhin@xen.org>) id 1vnoI2-0001iV-EZ
 for xen-devel@lists.xenproject.org; Thu, 05 Feb 2026 01:36:14 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <dmukhin@xen.org>) id 1vnoI2-003wQ6-0f;
 Thu, 05 Feb 2026 01:36:13 +0000
Received: from [140.209.201.102] (helo=localhost)
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <dmukhin@xen.org>) id 1vnoI1-00HVWq-1z;
 Thu, 05 Feb 2026 01:36:13 +0000
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
	Subject:Cc:To:From; bh=/gKg0E53LxUxIKjZV4BVNDkp/q7tuKx1vt5Xw35g7Hg=; b=EcMmvu
	bT+5dmIcIKh8n31KBOCNZhujQFSOoKkIVqTksFZLOXBtqM7lMar+v2uY61OCkAfPaDoJ80WPzgcJk
	Oa9qxd48RWqpdoB/t/gxdcCLkb7HAWRLK/T8IuT3wshOS3bNtDkaO3VyklnJpZOP5Oo6Y8YPZ0Xtt
	Cndusu7aXzQ=;
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
Subject: [PATCH v5 0/6] xen/console: configurable conring size
Date: Wed,  4 Feb 2026 17:36:00 -0800
Message-ID: <20260205013606.3384798-1-dmukhin@ford.com>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.19 / 15.00];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[xen.org:s=20200302mail];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[mailman];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:jbeulich@suse.com,m:julien@xen.org,m:michal.orzel@amd.com,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:dmukhin@ford.com,s:lists@lfdr.de];
	DMARC_NA(0.00)[xen.org];
	FORGED_SENDER(0.00)[dmukhin@xen.org,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[xen.org:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	TO_DN_NONE(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[xen.org:dkim,gitlab.com:url,ford.com:mid];
	FROM_NEQ_ENVFROM(0.00)[dmukhin@xen.org,xen-devel-bounces@lists.xenproject.org];
	FROM_NO_DN(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[9];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 3A547EDB35
X-Rspamd-Action: no action

This series originates from [1] which addresses feedback [2].
Sending this as v5 since [1] was posted as v4...

Briefly, here is what the series covers:

Patch 1 groups conring code together to better maintainability.
There were conring bits all over the place in console.c.

Patch 2 introduces CONRING_CONRING_SHIFT to select compile-time
conring buffer size.

Patch 3 updates conring{,_size} annotations to __ro_after_init as per [2].

Patch 4 optimizes switch from early conring to permanent conring.

Patches 5-6 update the conring buffer allocation code and add some
verbose logging around buffer size selection.

[1] Link to v4: https://lore.kernel.org/xen-devel/20250311070912.730334-1-dmkhn@proton.me/
[2] https://lore.kernel.org/xen-devel/1a5ed8ad-0cc7-4e05-9b9c-cd6930d9b9ea@citrix.com
[3] Link to CI: https://gitlab.com/xen-project/people/dmukhin/xen/-/pipelines/2306728453

Denis Mukhin (6):
  xen/console: group conring code together
  xen/console: make console buffer size configurable
  xen/console: promote conring{,_size} to __ro_after_init
  xen/console: use memcpy() in console_init_ring()
  xen/console: update conring memory allocation
  xen/console: add conring buffer size alignment setting

 docs/misc/xen-command-line.pandoc |   5 +-
 xen/drivers/char/Kconfig          |  31 +++++
 xen/drivers/char/console.c        | 190 +++++++++++++++++-------------
 3 files changed, 143 insertions(+), 83 deletions(-)

-- 
2.52.0


