Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B916F97C0B5
	for <lists+xen-devel@lfdr.de>; Wed, 18 Sep 2024 22:23:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.800428.1210357 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sr1Cw-0003RV-Fw; Wed, 18 Sep 2024 20:23:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 800428.1210357; Wed, 18 Sep 2024 20:23:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sr1Cw-0003P5-D6; Wed, 18 Sep 2024 20:23:26 +0000
Received: by outflank-mailman (input) for mailman id 800428;
 Wed, 18 Sep 2024 20:23:24 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=uy3Y=QQ=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1sr1Cu-0003Or-LI
 for xen-devel@lists.xenproject.org; Wed, 18 Sep 2024 20:23:24 +0000
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d9add269-75fb-11ef-99a2-01e77a169b0f;
 Wed, 18 Sep 2024 22:23:22 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id E4027A43896;
 Wed, 18 Sep 2024 20:23:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7CAFEC4CEC2;
 Wed, 18 Sep 2024 20:23:20 +0000 (UTC)
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
X-Inumbo-ID: d9add269-75fb-11ef-99a2-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1726691001;
	bh=vOu/o5clrzCVae86YzB7vo3nlDfwj2I+Qqqu2LEkIz8=;
	h=Date:From:To:cc:Subject:From;
	b=EuQSLH5DgKUQH9vOAVfDLy+FC86w/kd3k07CWXFFDN/voqB3/vVhOmlRxW8HuOCbW
	 tw9MZLQ2dCMKVQZvgVsf/DDruh2DYYgEtLk3leeGjwluF2yGgeQmkudJocLxnMkNq3
	 vGhRnMYgmQpdlieuP2gLrpvx0Qzar/WFygEZHcdMNscA2CaCh5PsJkD6CVk5oje8Px
	 6ZvX6XBnSR5oh4eGvJSfSj+MrP3ojwvsaNBLm0qoynJ0bg4x0WcS+jvowkSZQgKcpk
	 gCcL/L2IK/ZhMYLzTN+fK4wMs6WDSHpqnZTGZr8Y2ao6Gjv/eNSdcCenqh0LlmMCUT
	 wQBZjEohi07Uw==
Date: Wed, 18 Sep 2024 13:23:19 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: xen-devel@lists.xenproject.org
cc: sstabellini@kernel.org, Andrew Cooper <andrew.cooper3@citrix.com>, 
    Jan Beulich <jbeulich@suse.com>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
    Bertrand Marquis <bertrand.marquis@arm.com>, Julien Grall <julien@xen.org>, 
    michal.orzel@amd.com
Subject: [PATCH v2] docs/misra: add R17.2 and R18.2
Message-ID: <alpine.DEB.2.22.394.2409181322070.1417852@ubuntu-linux-20-04-desktop>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

The Xen community is already informally following both rules. Let's make
it explicit. Both rules have zero violations, only cautions. While we
want to go down to zero cautions in time, adding both rules to rules.rst
enables us to immediately make both rules gating in the ECLAIR job part
of gitlab-ci.

Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>
---
Changes in v2:
- improve the note of 17.2

diff --git a/docs/misra/rules.rst b/docs/misra/rules.rst
index e99cb81089..4a144da8d6 100644
--- a/docs/misra/rules.rst
+++ b/docs/misra/rules.rst
@@ -561,6 +561,13 @@ maintainers if you want to suggest a change.
      - The features of <stdarg.h> shall not be used
      -
 
+   * - `Rule 17.2 <https://gitlab.com/MISRA/MISRA-C/MISRA-C-2012/Example-Suite/-/blob/master/R_17_02.c>`_
+     - Required
+     - Functions shall not call themselves, either directly or indirectly
+     - Limited forms of recursion are allowed if the recursion is bound
+       (there is an upper limit and the upper limit is enforced.) The
+       bounding should be explained in a comment or in a deviation.
+
    * - `Rule 17.3 <https://gitlab.com/MISRA/MISRA-C/MISRA-C-2012/Example-Suite/-/blob/master/R_17_03.c>`_
      - Mandatory
      - A function shall not be declared implicitly
@@ -593,6 +600,12 @@ maintainers if you want to suggest a change.
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

