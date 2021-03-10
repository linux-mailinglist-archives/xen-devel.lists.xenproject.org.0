Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DC27C333A79
	for <lists+xen-devel@lfdr.de>; Wed, 10 Mar 2021 11:44:21 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.95966.181291 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lJwK6-0003Sz-Gd; Wed, 10 Mar 2021 10:44:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 95966.181291; Wed, 10 Mar 2021 10:44:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lJwK6-0003SK-Ch; Wed, 10 Mar 2021 10:44:14 +0000
Received: by outflank-mailman (input) for mailman id 95966;
 Wed, 10 Mar 2021 10:44:13 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=W5NQ=II=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lJwK5-0003RY-1p
 for xen-devel@lists.xenproject.org; Wed, 10 Mar 2021 10:44:13 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 93b01f98-da1d-451a-93ce-e0d8e3e4f515;
 Wed, 10 Mar 2021 10:44:11 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 7FD74AC24;
 Wed, 10 Mar 2021 10:44:10 +0000 (UTC)
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
X-Inumbo-ID: 93b01f98-da1d-451a-93ce-e0d8e3e4f515
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1615373050; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=X3I7a1Jog+rvSfEanA/u+E2mxc+RtRHVujTNsBgcfZg=;
	b=hJSuf3eMlCC3/Fr6rHTVlPyUgb55lfAQEwjDDAJnM+VNyaS6haV65zDdZ2tb/OGNlOCw8P
	ChwbqMUZwBSOFULHIVe9PvU4sSbjinzgvKSCRoao+EJTWdC8D3lx6ISJ4xZxZesjpRqoeW
	oF77v4z6ZffBm3R4LbxlARH9Abz/jok=
To: Juergen Gross <jgross@suse.com>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Stefano Stabellini <sstabellini@kernel.org>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH 0/3] Xen: grant table related adjustments following recent
 XSAs
Message-ID: <2b326dc6-c624-c97b-f9c4-4cc68dd013ba@suse.com>
Date: Wed, 10 Mar 2021 11:44:10 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

While addressing the XSAs a number of further oddities were noticed.
Try to take care of them.

1: gntdev: don't needlessly allocate k{,un}map_ops[]
2: gnttab: introduce common INVALID_GRANT_{HANDLE,REF}
3: gntdev: don't needlessly use kvcalloc()

Jan

