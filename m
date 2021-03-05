Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 941B232EA8C
	for <lists+xen-devel@lfdr.de>; Fri,  5 Mar 2021 13:40:29 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.93653.176634 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lI9ka-0001VO-32; Fri, 05 Mar 2021 12:40:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 93653.176634; Fri, 05 Mar 2021 12:40:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lI9kZ-0001Uw-Vc; Fri, 05 Mar 2021 12:40:11 +0000
Received: by outflank-mailman (input) for mailman id 93653;
 Fri, 05 Mar 2021 12:40:10 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1lI9kY-0001Um-Di
 for xen-devel@lists.xenproject.org; Fri, 05 Mar 2021 12:40:10 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lI9kX-0005oP-0K; Fri, 05 Mar 2021 12:40:09 +0000
Received: from 54-240-197-235.amazon.com ([54.240.197.235]
 helo=ufe34d9ed68d054.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lI9kW-0007BR-Ii; Fri, 05 Mar 2021 12:40:08 +0000
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
	s=20200302mail; h=Message-Id:Date:Subject:Cc:To:From;
	bh=+VjLZQBhc666M8NTpQi/Yp6KL24Z+yakIHai6jv4bDs=; b=q9fmNvyNos17Zrk3/ZynkgP0cr
	1Bt6ydYDzg/rYKW4nKralaDY8O3luOlsD+4whVa/rd2lXBmAGRclN4Ee3mcFvEEpVNOwR2KTOs/Ca
	KWmkykTm/PzkoPs3cSjzqsfVdhS3Be41vR1ye9xgkgnSdnw41q4HE1ZY2UA8o6lM5XAE=;
From: Julien Grall <julien@xen.org>
To: xen-devel@lists.xenproject.org
Cc: raphning@amazon.co.uk,
	iwj@xenproject.org,
	Julien Grall <jgrall@amazon.com>,
	Wei Liu <wl@xen.org>,
	Juergen Gross <jgross@suse.com>
Subject: [PATCH for-4.15 0/2] xenstore: Check format printf
Date: Fri,  5 Mar 2021 12:40:01 +0000
Message-Id: <20210305124003.13582-1-julien@xen.org>
X-Mailer: git-send-email 2.17.1

From: Julien Grall <jgrall@amazon.com>

This patch is a follow-up to Norbert's series [1].

The first patch will define PRINTF_ATTRIBUTE the same way everywhere.
The second patch will check the format printf on a few more calls.

Both patches are candidate for 4.15. They only affects the build system
and therefore would consider them low-risk.

Cheers,

[1] https://lore.kernel.org/xen-devel/20210226144144.9252-1-nmanthey@amazon.de/

Julien Grall (2):
  tools/xenstore: Consolidate PRINTF_ATTRIBUTE() in utils.h
  tools/xenstore: Check the format printf for xprintf() and
    barf{,_perror}()

 tools/xenstore/talloc.h | 15 ++-------------
 tools/xenstore/tdb.h    |  6 ++----
 tools/xenstore/utils.h  | 10 +++++++---
 3 files changed, 11 insertions(+), 20 deletions(-)

-- 
2.17.1


