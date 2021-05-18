Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CC94A387A98
	for <lists+xen-devel@lfdr.de>; Tue, 18 May 2021 16:01:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.129235.242608 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lj0I2-0007KT-6m; Tue, 18 May 2021 14:01:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 129235.242608; Tue, 18 May 2021 14:01:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lj0I2-0007ID-1O; Tue, 18 May 2021 14:01:42 +0000
Received: by outflank-mailman (input) for mailman id 129235;
 Tue, 18 May 2021 14:01:40 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1lj0Hz-0007I1-VN
 for xen-devel@lists.xenproject.org; Tue, 18 May 2021 14:01:39 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lj0Hy-00047v-JD; Tue, 18 May 2021 14:01:38 +0000
Received: from 54-240-197-235.amazon.com ([54.240.197.235]
 helo=ufe34d9ed68d054.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lj0Hy-0001pY-9t; Tue, 18 May 2021 14:01:38 +0000
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
	bh=7PXQN3S7KHSj3e/q5/numPsRjous6camyiVOt5f8VAI=; b=ku6rIq1CIlaGIknXCztT8RkspT
	GYLdSi9Do5yKkRtBE4bSggYDax5ytjvl/zO8YoGDd/55Osg9bLdxIAHSIXICSQP4F7QANpA0XMz9/
	dHeEppqO0zTcx6wQ6tZgKGIKobRbS84YoZO+4jpOOzKYZ4vp13S3FDtgozNaOUAu/X2E=;
From: Julien Grall <julien@xen.org>
To: xen-devel@lists.xenproject.org
Cc: julien@xen.org,
	Julien Grall <jgrall@amazon.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Ian Jackson <iwj@xenproject.org>,
	Jan Beulich <jbeulich@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>
Subject: [PATCH v2 0/2] Use const whenever we point to literal strings (take 1)
Date: Tue, 18 May 2021 15:01:32 +0100
Message-Id: <20210518140134.31541-1-julien@xen.org>
X-Mailer: git-send-email 2.17.1

From: Julien Grall <jgrall@amazon.com>

Hi all,

By default, both Clang and GCC will happily compile C code where
non-const char * point to literal strings. This means the following
code will be accepted:

    char *str = "test";

    str[0] = 'a';

Literal strings will reside in rodata, so they are not modifiable.
This will result to an permission fault at runtime if the permissions
are enforced in the page-tables (this is the case in Xen).

I am not aware of code trying to modify literal strings in Xen.
However, there is a frequent use of non-const char * to point to
literal strings. Given the size of the codebase, there is a risk
to involuntarily introduce code that will modify literal strings.

Therefore it would be better to enforce using const when pointing
to such strings. Both GCC and Clang provide an option to warn
for such case (see -Wwrite-strings) and therefore could be used
by Xen.

This series doesn't yet make use of -Wwrite-strings because
the tree is not fully converted. Instead, it contains some easy
and non-controversial use of const in the code.

Julien Grall (2):
  xen/char: console: Use const whenever we point to literal strings
  tools/console: Use const whenever we point to literal strings

 tools/console/client/main.c |  4 ++--
 tools/console/daemon/io.c   | 15 ++++++++-------
 xen/drivers/char/console.c  |  7 ++++---
 3 files changed, 14 insertions(+), 12 deletions(-)

-- 
2.17.1


