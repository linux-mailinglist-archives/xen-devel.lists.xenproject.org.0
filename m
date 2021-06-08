Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FF2D39EE76
	for <lists+xen-devel@lfdr.de>; Tue,  8 Jun 2021 07:59:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.138272.256011 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lqUlH-0001fy-5y; Tue, 08 Jun 2021 05:58:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 138272.256011; Tue, 08 Jun 2021 05:58:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lqUlH-0001af-1j; Tue, 08 Jun 2021 05:58:51 +0000
Received: by outflank-mailman (input) for mailman id 138272;
 Tue, 08 Jun 2021 05:58:49 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Q7uu=LC=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1lqUlF-0001Yg-8N
 for xen-devel@lists.xenproject.org; Tue, 08 Jun 2021 05:58:49 +0000
Received: from smtp-out2.suse.de (unknown [195.135.220.29])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 637c64fe-7675-47b5-8291-cde4e509faf4;
 Tue, 08 Jun 2021 05:58:47 +0000 (UTC)
Received: from imap.suse.de (imap-alt.suse-dmz.suse.de [192.168.254.47])
 (using TLSv1.2 with cipher ECDHE-ECDSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id EB9F91FD4F;
 Tue,  8 Jun 2021 05:58:46 +0000 (UTC)
Received: from imap3-int (imap-alt.suse-dmz.suse.de [192.168.254.47])
 by imap.suse.de (Postfix) with ESMTP id BF92A118DD;
 Tue,  8 Jun 2021 05:58:46 +0000 (UTC)
Received: from director2.suse.de ([192.168.254.72]) by imap3-int with ESMTPSA
 id qBGWLRYHv2AQbAAALh3uQQ
 (envelope-from <jgross@suse.com>); Tue, 08 Jun 2021 05:58:46 +0000
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
X-Inumbo-ID: 637c64fe-7675-47b5-8291-cde4e509faf4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1623131926; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=oLhrbQjDOgrh2m0VWXxv7u2I2PbmH1A+bc+g88dARsk=;
	b=Nm5a9vOjlJmddT2kOVdE30SuJTCxVMDmklP+HCbTcMpU+uLMlO4UKFOu1CpI4EC/J5n2Hn
	OVmLtq999PjiwYI38qK+mhURy/7BxoZ878GkDFXMCymGZMIjdgW7I+VkLm5M6CxE/ojEb7
	OBph9jymXJZyhxgXjIlvJZyAddDM+iM=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1623131926; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=oLhrbQjDOgrh2m0VWXxv7u2I2PbmH1A+bc+g88dARsk=;
	b=Nm5a9vOjlJmddT2kOVdE30SuJTCxVMDmklP+HCbTcMpU+uLMlO4UKFOu1CpI4EC/J5n2Hn
	OVmLtq999PjiwYI38qK+mhURy/7BxoZ878GkDFXMCymGZMIjdgW7I+VkLm5M6CxE/ojEb7
	OBph9jymXJZyhxgXjIlvJZyAddDM+iM=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Ian Jackson <iwj@xenproject.org>,
	Wei Liu <wl@xen.org>
Subject: [PATCH v2 0/2] tools/xenstore: set resource limits of xenstored
Date: Tue,  8 Jun 2021 07:58:37 +0200
Message-Id: <20210608055839.10313-1-jgross@suse.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Set some limits for xenstored in order to avoid it being killed by
OOM killer, or to run out of file descriptors.

Changes in V2:
- split into 2 patches
- set limits from start script

Juergen Gross (2):
  tools/xenstore: set oom score for xenstore daemon on Linux
  tools/xenstore: set open file descriptor limit for xenstored

 tools/hotplug/Linux/init.d/sysconfig.xencommons.in | 7 +++++++
 tools/hotplug/Linux/launch-xenstore.in             | 6 ++++++
 2 files changed, 13 insertions(+)

-- 
2.26.2


