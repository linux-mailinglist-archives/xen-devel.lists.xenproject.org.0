Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EE654875E0
	for <lists+xen-devel@lfdr.de>; Fri,  7 Jan 2022 11:47:29 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.254353.436120 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n5mm8-0004AF-Hp; Fri, 07 Jan 2022 10:47:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 254353.436120; Fri, 07 Jan 2022 10:47:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n5mm8-000461-Af; Fri, 07 Jan 2022 10:47:12 +0000
Received: by outflank-mailman (input) for mailman id 254353;
 Fri, 07 Jan 2022 10:47:10 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=kqIQ=RX=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1n5mm6-00042l-D6
 for xen-devel@lists.xenproject.org; Fri, 07 Jan 2022 10:47:10 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2983f7cb-6fa7-11ec-81c0-a30af7de8005;
 Fri, 07 Jan 2022 11:47:09 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 8F2BE1F39C;
 Fri,  7 Jan 2022 10:47:08 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 67E3613CCC;
 Fri,  7 Jan 2022 10:47:08 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id S1EFGCwa2GHoEQAAMHmgww
 (envelope-from <jgross@suse.com>); Fri, 07 Jan 2022 10:47:08 +0000
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
X-Inumbo-ID: 2983f7cb-6fa7-11ec-81c0-a30af7de8005
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1641552428; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=yauxqOoJpXr2IEhNqv7BHVtNMqveFThpzv2/vAab4VQ=;
	b=LkEoP6u6oD3a3F4VjQ6bC7bhvC8snDCYNBoiqgVF54jARxwz+kXxXd5UeiQyodY6qzrWPl
	HFDEEbefcc2eaS/NzIIaTbL2jjdIXgQwNFRtJM4brlRlIrIc7hU0T+fj5z3oxdHWT5gywt
	M2Jttss/whvfjsh7pp+HXNY2XzhnGVY=
From: Juergen Gross <jgross@suse.com>
To: minios-devel@lists.xenproject.org,
	xen-devel@lists.xenproject.org
Cc: samuel.thibault@ens-lyon.org,
	wl@xen.org,
	Juergen Gross <jgross@suse.com>
Subject: [PATCH 0/2] mini-os: remove device specific struct file members
Date: Fri,  7 Jan 2022 11:47:04 +0100
Message-Id: <20220107104706.9859-1-jgross@suse.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This small series is a followup to the series sent recently:

https://lists.xen.org/archives/html/xen-devel/2022-01/threads.html#00110

It contains the last cleanups related to struct file and can only be
applied after the Xen libraries have stopped using the related union
members.

Juergen Gross (2):
  mini-os: remove event channel specific struct file member
  mini-os: remove gnttab specific member from struct file

 include/lib.h | 13 -------------
 1 file changed, 13 deletions(-)

-- 
2.26.2


