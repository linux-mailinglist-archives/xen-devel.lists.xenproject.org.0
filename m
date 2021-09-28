Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E182B41AB97
	for <lists+xen-devel@lfdr.de>; Tue, 28 Sep 2021 11:15:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.197843.351109 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mV9D0-0002Gd-Rs; Tue, 28 Sep 2021 09:15:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 197843.351109; Tue, 28 Sep 2021 09:15:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mV9D0-0002En-Ov; Tue, 28 Sep 2021 09:15:30 +0000
Received: by outflank-mailman (input) for mailman id 197843;
 Tue, 28 Sep 2021 09:15:28 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=TiGH=OS=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1mV9Cy-0002Eh-JV
 for xen-devel@lists.xenproject.org; Tue, 28 Sep 2021 09:15:28 +0000
Received: from smtp-out1.suse.de (unknown [195.135.220.28])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 9e7a1e42-203c-11ec-bc75-12813bfff9fa;
 Tue, 28 Sep 2021 09:15:27 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id CC199222BB;
 Tue, 28 Sep 2021 09:15:26 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 8F18D13A4A;
 Tue, 28 Sep 2021 09:15:26 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id vKTnHy7dUmESHQAAMHmgww
 (envelope-from <jgross@suse.com>); Tue, 28 Sep 2021 09:15:26 +0000
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
X-Inumbo-ID: 9e7a1e42-203c-11ec-bc75-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1632820526; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=K1gJm0tU9vRsReq+9DJ5wsBzXrvm3Rb7hqXFabtbdQo=;
	b=rsnuLQwJQb+B1cV/0ASiamB8vIJdrKEFKLMo80wPaJ6kX7GGS/Qw9+D6pYOM+oKtj4PjS3
	FH10YGaHS+KEILv2dDJ2x6P/HYh+Rce1/RS8PIxEEjWbSc4w4A+/JoqBuvr8RDS90u/n8y
	l6lLUfTzJBDUpcpH5oF1V+tI2OVY7SQ=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Ian Jackson <iwj@xenproject.org>,
	Wei Liu <wl@xen.org>
Subject: [PATCH v5 0/2] tools/xenstore: set resource limits of xenstored
Date: Tue, 28 Sep 2021 11:15:15 +0200
Message-Id: <20210928091517.9761-1-jgross@suse.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Set some limits for xenstored in order to avoid it being killed by
OOM killer, or to run out of file descriptors.

Changes in V5:
- respect /proc/sys/fs/nr_open (Ian Jackson)

Changes in V4:
- add comments
- switch to configure open file descriptors directly

Changes in V3:
- make oom score configurable

Changes in V2:
- split into 2 patches
- set limits from start script

Juergen Gross (2):
  tools/xenstore: set oom score for xenstore daemon on Linux
  tools/xenstore: set open file descriptor limit for xenstored

 .../Linux/init.d/sysconfig.xencommons.in      | 22 ++++++++++++++++
 tools/hotplug/Linux/launch-xenstore.in        | 26 +++++++++++++++++++
 2 files changed, 48 insertions(+)

-- 
2.26.2


