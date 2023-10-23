Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A01487D433E
	for <lists+xen-devel@lfdr.de>; Tue, 24 Oct 2023 01:33:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.621636.968299 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qv4Ov-0004N1-10; Mon, 23 Oct 2023 23:32:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 621636.968299; Mon, 23 Oct 2023 23:32:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qv4Ou-0004LJ-UM; Mon, 23 Oct 2023 23:32:00 +0000
Received: by outflank-mailman (input) for mailman id 621636;
 Mon, 23 Oct 2023 23:31:59 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=D6cm=GF=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1qv4Ot-0004LD-5x
 for xen-devel@lists.xenproject.org; Mon, 23 Oct 2023 23:31:59 +0000
Received: from ams.source.kernel.org (ams.source.kernel.org
 [2604:1380:4601:e00::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5b747218-71fc-11ee-98d5-6d05b1d4d9a1;
 Tue, 24 Oct 2023 01:31:57 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by ams.source.kernel.org (Postfix) with ESMTP id 01D1AB82233;
 Mon, 23 Oct 2023 23:31:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4B579C433C8;
 Mon, 23 Oct 2023 23:31:55 +0000 (UTC)
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
X-Inumbo-ID: 5b747218-71fc-11ee-98d5-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1698103916;
	bh=iXNzi5iroBNeb9pIMHBuep9UHo+puTOOWGi6z4zxu/s=;
	h=Date:From:To:cc:Subject:From;
	b=Ame/hgz/prttA/d1/QfYGMv0cpgbzyNm+NDKRTNb8NdRegeLm7+/KbdsYsnntwNkk
	 c1++LBhkZOhWpheXl7LHYSO/GqRz4gDI9PCqMJwAC3IoAZsTfQB+TxS9wcw6TdujUl
	 gSKgrPhWmHlfVEwf4mpcvRVWjBM78wkDcPaQz+aJYIQ/yaBqzFe4D2p0VCr3aekwpH
	 JXUnuD4FPWTTGNJm+GojZdbsbfWhlzaQ623cUFMLtTAtnTkWEqqE1lNflguSK6e/BU
	 BdcKhATVtWlhaIql2YFsUU11DCXpozQ4uf2Ke623eHsdJeWDs9cGhtAxIpeF0rUNmT
	 ClrjFMaBtY2zA==
Date: Mon, 23 Oct 2023 16:31:53 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: xen-devel@lists.xenproject.org
cc: sstabellini@kernel.org, julien@xen.org, bertrand.marquis@arm.com, 
    andrew.cooper3@citrix.com, jbeulich@suse.com, roger.pau@citrix.com, 
    george.dunlap@citrix.com
Subject: [PATCH] misra: add R14.4 R21.1 R21.2
Message-ID: <alpine.DEB.2.22.394.2310231628500.3516@ubuntu-linux-20-04-desktop>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

Add 14.4, with the same note and exception already listed for 10.1.

Add 21.1 and 21.2, with a longer comment to explain how strategy with
leading underscores and why we think we are safe today.

Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>

diff --git a/docs/misra/rules.rst b/docs/misra/rules.rst
index b423580b23..56eec8bafd 100644
--- a/docs/misra/rules.rst
+++ b/docs/misra/rules.rst
@@ -422,6 +422,13 @@ maintainers if you want to suggest a change.
 
        while(0) and while(1) and alike are allowed.
 
+   * - `Rule 14.4 <https://gitlab.com/MISRA/MISRA-C/MISRA-C-2012/Example-Suite/-/blob/master/R_14_04.c>`_
+     - Required
+     - The controlling expression of an if statement and the controlling
+       expression of an iteration-statement shall have essentially
+       Boolean type
+     - Implicit conversions to boolean are allowed
+
    * - `Rule 16.7 <https://gitlab.com/MISRA/MISRA-C/MISRA-C-2012/Example-Suite/-/blob/master/R_16_07.c>`_
      - Required
      - A switch-expression shall not have essentially Boolean type
@@ -479,6 +486,24 @@ maintainers if you want to suggest a change.
        they are related
      -
 
+   * - `Rule 21.1 <https://gitlab.com/MISRA/MISRA-C/MISRA-C-2012/Example-Suite/-/blob/master/R_21_01.c>`_
+     - Required
+     - #define and #undef shall not be used on a reserved identifier or
+       reserved macro name
+     - No identifiers should start with _BUILTIN to avoid clashes with
+       GCC reserved identifiers. In general, all identifiers starting with
+       an underscore are reserved, and are best avoided. However, Xen
+       makes extensive usage of leading underscores in header guards,
+       bitwise manipulation functions, and a few other places. They are
+       considered safe as checks have been done against the list of
+       GCC's reserved identifiers. They don't need to be replaced.
+
+   * - `Rule 21.2 <https://gitlab.com/MISRA/MISRA-C/MISRA-C-2012/Example-Suite/-/blob/master/R_21_02.c>`_
+     - Required
+     - A reserved identifier or reserved macro name shall not be
+       declared
+     - See comment for Rule 21.1
+
    * - `Rule 21.13 <https://gitlab.com/MISRA/MISRA-C/MISRA-C-2012/Example-Suite/-/blob/master/R_21_13.c>`_
      - Mandatory
      - Any value passed to a function in <ctype.h> shall be representable as an

