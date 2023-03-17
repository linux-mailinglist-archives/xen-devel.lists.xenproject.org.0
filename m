Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D4766BE7CA
	for <lists+xen-devel@lfdr.de>; Fri, 17 Mar 2023 12:16:02 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.511016.789713 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pd83s-0008Ma-Tv; Fri, 17 Mar 2023 11:15:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 511016.789713; Fri, 17 Mar 2023 11:15:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pd83s-0008Jw-Qy; Fri, 17 Mar 2023 11:15:52 +0000
Received: by outflank-mailman (input) for mailman id 511016;
 Fri, 17 Mar 2023 11:15:50 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=hL2n=7J=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1pd83q-0008Jo-Ru
 for xen-devel@lists.xenproject.org; Fri, 17 Mar 2023 11:15:50 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1185652a-c4b5-11ed-b464-930f4c7d94ae;
 Fri, 17 Mar 2023 12:15:48 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id B4BDD21A3D;
 Fri, 17 Mar 2023 11:15:47 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 787E113428;
 Fri, 17 Mar 2023 11:15:47 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id JEgYG+NLFGSiCwAAMHmgww
 (envelope-from <jgross@suse.com>); Fri, 17 Mar 2023 11:15:47 +0000
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
X-Inumbo-ID: 1185652a-c4b5-11ed-b464-930f4c7d94ae
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1679051747; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=LRLpdVOFKwWv8snzVbrMxqxD2laV46O+Xpy4PE5WeMM=;
	b=rF6fvJyO1ENos5wgLLsI3T1nwodiS9WYnP3vDRKW3M0s5lu9+FEhqZ15z0imi0pcz3ZwRZ
	5vG7uLkU79gjjFm9W2gv3HOhdTvLN8nuttOwcKgIpSxHf0izKluIPQhVzjELp75DoMjS+q
	Zcfev1dxhAULXyREEq4ZvxBiWGRbGL4=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>
Subject: [PATCH 0/2] tools/xl: small cleanup of parsing code
Date: Fri, 17 Mar 2023 12:15:44 +0100
Message-Id: <20230317111546.18061-1-jgross@suse.com>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

2 small patches cleaning up the parsing code in xl a little bit.

Juergen Gross (2):
  tools/xl: allow split_string_into_pair() to trim values
  tools/xl: rework p9 config parsing

 tools/xl/xl_parse.c | 114 +++++++++++++++++++++-----------------------
 tools/xl/xl_parse.h |   4 +-
 2 files changed, 56 insertions(+), 62 deletions(-)

-- 
2.35.3


