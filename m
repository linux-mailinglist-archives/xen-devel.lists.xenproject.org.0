Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2ADE497A974
	for <lists+xen-devel@lfdr.de>; Tue, 17 Sep 2024 01:03:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.799737.1209731 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sqKkP-0002RQ-Ud; Mon, 16 Sep 2024 23:03:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 799737.1209731; Mon, 16 Sep 2024 23:03:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sqKkP-0002PC-QY; Mon, 16 Sep 2024 23:03:09 +0000
Received: by outflank-mailman (input) for mailman id 799737;
 Mon, 16 Sep 2024 23:03:08 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=D3gN=QO=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1sqKkO-0002P6-P8
 for xen-devel@lists.xenproject.org; Mon, 16 Sep 2024 23:03:08 +0000
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d0f878d1-747f-11ef-99a2-01e77a169b0f;
 Tue, 17 Sep 2024 01:02:59 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 7F926A425D5;
 Mon, 16 Sep 2024 23:02:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EE6D9C4CEC4;
 Mon, 16 Sep 2024 23:02:56 +0000 (UTC)
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
X-Inumbo-ID: d0f878d1-747f-11ef-99a2-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1726527778;
	bh=nyWW5yjpeozWsxWxn269XwPEbhXWB8FoLBWnQCLS7/o=;
	h=Date:From:To:cc:Subject:From;
	b=FkPJONCylMVo81WuoCdA1zmkn1kaF4pANIuSvvsmlK0QZ+g4EmXG7SlYYcFlPdcLJ
	 Yly1jyHUhQRDoWzHa85zpg64vGgo0hHJyUiOFQugzFafbKdeGKqgsdIgdodMmnGS02
	 3WspSERmfl8hiTcobRMTup2fUTMyGEzzB64i7Zgw9mFA4kznSjfQnH8dgJzR9cYlKT
	 FTpVZTKNF5tDMrzcjGsXCg3pphs7hfurbgznkoJYVR9JSx0qt7wK0jta0jGQBD9hJa
	 HrL3hJpjObWYDLa1iPsLw0Gtr+qOISgvH1X6V/vCvMBzxlFfyzhEiSiWaXYFmw6RC+
	 mg1xPiHQL5feA==
Date: Mon, 16 Sep 2024 16:02:55 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: xen-devel@lists.xenproject.org
cc: sstabellini@kernel.org, Andrew Cooper <andrew.cooper3@citrix.com>, 
    Jan Beulich <jbeulich@suse.com>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
    Bertrand Marquis <bertrand.marquis@arm.com>, Julien Grall <julien@xen.org>, 
    Michal Orzel <michal.orzel@amd.com>
Subject: [PATCH] docs/misra: add R17.2 and R18.2
Message-ID: <alpine.DEB.2.22.394.2409161559340.1417852@ubuntu-linux-20-04-desktop>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

The Xen community is already informally following both rules. Let's make
it explicit. Both rules have zero violations, only cautions. While we
want to go down to zero cautions in time, adding both rules to rules.rst
enables us to immediately make both rules gating in the ECLAIR job part
of gitlab-ci.

Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>

diff --git a/docs/misra/rules.rst b/docs/misra/rules.rst
index e99cb81089..9acd92cf78 100644
--- a/docs/misra/rules.rst
+++ b/docs/misra/rules.rst
@@ -561,6 +561,12 @@ maintainers if you want to suggest a change.
      - The features of <stdarg.h> shall not be used
      -
 
+   * - `Rule 17.2 <https://gitlab.com/MISRA/MISRA-C/MISRA-C-2012/Example-Suite/-/blob/master/R_17_02.c>`_
+     - Required
+     - Functions shall not call themselves, either directly or indirectly
+     - Limited forms of recursion are allowed if the recursion is bound
+       (there is an upper limit and the upper limit is enforced)
+
    * - `Rule 17.3 <https://gitlab.com/MISRA/MISRA-C/MISRA-C-2012/Example-Suite/-/blob/master/R_17_03.c>`_
      - Mandatory
      - A function shall not be declared implicitly
@@ -593,6 +599,12 @@ maintainers if you want to suggest a change.
        submitting new patches please try to decrease the number of
        violations when possible.
 
+   * - `Rule 18.1 <https://gitlab.com/MISRA/MISRA-C/MISRA-C-2012/Example-Suite/-/blob/master/R_18_01.c>`_
+     - Required
+     - A pointer resulting from arithmetic on a pointer operand shall
+       address an element of the same array as that pointer operand
+     -
+
    * - `Rule 18.2 <https://gitlab.com/MISRA/MISRA-C/MISRA-C-2012/Example-Suite/-/blob/master/R_18_02.c>`_
      - Required
      - Subtraction between pointers shall only be applied to pointers

