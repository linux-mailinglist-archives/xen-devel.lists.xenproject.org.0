Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C7897EB9B3
	for <lists+xen-devel@lfdr.de>; Tue, 14 Nov 2023 23:59:35 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.633378.988121 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r32NF-0004we-NZ; Tue, 14 Nov 2023 22:59:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 633378.988121; Tue, 14 Nov 2023 22:59:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r32NF-0004uE-Ky; Tue, 14 Nov 2023 22:59:13 +0000
Received: by outflank-mailman (input) for mailman id 633378;
 Tue, 14 Nov 2023 22:59:12 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=wE9C=G3=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1r32NE-0004u8-MD
 for xen-devel@lists.xenproject.org; Tue, 14 Nov 2023 22:59:12 +0000
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6c18ac9f-8341-11ee-9b0e-b553b5be7939;
 Tue, 14 Nov 2023 23:59:10 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by ams.source.kernel.org (Postfix) with ESMTP id C9DA5B8183A;
 Tue, 14 Nov 2023 22:59:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 24133C433C8;
 Tue, 14 Nov 2023 22:59:08 +0000 (UTC)
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
X-Inumbo-ID: 6c18ac9f-8341-11ee-9b0e-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1700002749;
	bh=3WOzegH/jpj+Km8ZCQS1hwV5ev7D6Vib8rjJMh8euFo=;
	h=Date:From:To:cc:Subject:From;
	b=uTk8gfftzACR8lLlt/3YfMA/nvsp07yBzobful+dHgaT8pp30JFTPAKu9NeUGjT8+
	 zHhrq2OCRI0oVETkInUKEpUv3GcqRmu8NoWs/PNSBEPfOYQIcci686EqIN3vUG0fLy
	 Nj7LhkwwgG6YJoCLVa2UUWUcouY0Slyt5K8+PjI7HZmRcAKeB/LZRvpYLfTrRBnJga
	 XGRt2LW1pE7/vtQXNxZpDqCcPk0TQd4kExm12rMuDExsghb8CHJrkRnW8uNVCagFsi
	 D2DTbNq00wvYpUQmWrboTpMLXW+a97WpmkfRgFQGRXt+6nuWXSFfcOldQN+w1KtluD
	 I8egvRYaRChyA==
Date: Tue, 14 Nov 2023 14:59:06 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: xen-devel@lists.xenproject.org
cc: sstabellini@kernel.org, Jan Beulich <jbeulich@suse.com>, 
    Andrew Cooper <andrew.cooper3@citrix.com>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
    Bertrand Marquis <bertrand.marquis@arm.com>, Julien Grall <julien@xen.org>
Subject: [PATCH v2] misra: add R21.1 R21.2
Message-ID: <alpine.DEB.2.22.394.2311141458020.160649@ubuntu-linux-20-04-desktop>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

Add 21.1 and 21.2, with a longer comment to explain how strategy with
leading underscores and why we think we are safe today.

Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>
---
Changes in v2:
- remove R14.4
- update note section of 21.1
---
 docs/misra/rules.rst | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/docs/misra/rules.rst b/docs/misra/rules.rst
index da343ab3ac..375a886607 100644
--- a/docs/misra/rules.rst
+++ b/docs/misra/rules.rst
@@ -519,6 +519,28 @@ maintainers if you want to suggest a change.
        they are related
      -
 
+   * - `Rule 21.1 <https://gitlab.com/MISRA/MISRA-C/MISRA-C-2012/Example-Suite/-/blob/master/R_21_01.c>`_
+     - Required
+     - #define and #undef shall not be used on a reserved identifier or
+       reserved macro name
+     - Identifiers starting with an underscore followed by another underscore
+       or an upper-case letter are reserved. Today Xen uses many, such as
+       header guards and bitwise manipulation functions. Upon analysis it turns
+       out Xen identifiers do not clash with the identifiers used by modern
+       GCC, but that is not a guarantee that there won't be a naming clash in
+       the future or with another compiler.  For these reasons we discourage
+       the introduction of new reserved identifiers in Xen, and we see it as
+       positive the reduction of reserved identifiers. At the same time,
+       certain identifiers starting with an underscore are also commonly used
+       in Linux (e.g. __set_bit) and we don't think it would be an improvement
+       to rename them.
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
-- 
2.25.1


