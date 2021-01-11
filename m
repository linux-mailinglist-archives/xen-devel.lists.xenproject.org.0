Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 389022F1874
	for <lists+xen-devel@lfdr.de>; Mon, 11 Jan 2021 15:41:21 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.64914.114808 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kyyNC-0007sM-K6; Mon, 11 Jan 2021 14:40:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 64914.114808; Mon, 11 Jan 2021 14:40:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kyyNC-0007rx-Gn; Mon, 11 Jan 2021 14:40:46 +0000
Received: by outflank-mailman (input) for mailman id 64914;
 Mon, 11 Jan 2021 14:40:45 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ekcf=GO=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kyyNB-0007rs-Og
 for xen-devel@lists.xenproject.org; Mon, 11 Jan 2021 14:40:45 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id a7c78755-15d1-4c5b-bb7c-914fc1377d8e;
 Mon, 11 Jan 2021 14:40:44 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 1DA97AD1E;
 Mon, 11 Jan 2021 14:40:44 +0000 (UTC)
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
X-Inumbo-ID: a7c78755-15d1-4c5b-bb7c-914fc1377d8e
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1610376044; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=Par2CaqGT0hQZ6YPwHpXBmVW79BVGk3s0ae9AIJ2wmo=;
	b=j4DIWZIo/R0pd/YaOUVH3iLj9Kb260hhu2cbjVMwqfENu0nkr6zPOLdupbcXmp5ConqHq+
	7DhCek048AX3URkqDxtWgpxGyIg/nQAaUqqdW5+Wckad95lvE0n5OrdwWpLuqIZ2e3vvwT
	jd0ss1afQ/LfnpqEeEjVyBeTKwJcPHs=
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH] tools/libxenstat: ensure strnlen() declaration is visible
Message-ID: <ae0d2084-75d7-bcd9-33bc-54b846dd5681@suse.com>
Date: Mon, 11 Jan 2021 15:40:43 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

Its guard was updated such that it is visible by default when POSIX 2008
was adopted by glibc. It's not visible by default on older glibc.

Fixes: 40fe714ca424 ("tools/libs/stat: use memcpy instead of strncpy in getBridge")
Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/tools/libs/stat/xenstat_linux.c
+++ b/tools/libs/stat/xenstat_linux.c
@@ -20,6 +20,7 @@
  * Use is subject to license terms.
  */
 
+#define _GNU_SOURCE
 #include <fcntl.h>
 #include <dirent.h>
 #include <sys/types.h>

