Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B7BB646D96
	for <lists+xen-devel@lfdr.de>; Thu,  8 Dec 2022 11:50:12 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.457028.714862 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p3ET5-0000aO-56; Thu, 08 Dec 2022 10:49:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 457028.714862; Thu, 08 Dec 2022 10:49:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p3ET5-0000W5-0U; Thu, 08 Dec 2022 10:49:31 +0000
Received: by outflank-mailman (input) for mailman id 457028;
 Thu, 08 Dec 2022 10:49:29 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=vAIj=4G=tibco.com=gdunlap@srs-se1.protection.inumbo.net>)
 id 1p3ET3-0000Vj-Jg
 for xen-devel@lists.xenproject.org; Thu, 08 Dec 2022 10:49:29 +0000
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [2a00:1450:4864:20::42f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f6a9d299-76e5-11ed-8fd2-01056ac49cbb;
 Thu, 08 Dec 2022 11:49:17 +0100 (CET)
Received: by mail-wr1-x42f.google.com with SMTP id q7so1124480wrr.8
 for <xen-devel@lists.xenproject.org>; Thu, 08 Dec 2022 02:49:28 -0800 (PST)
Received: from CTX-Georges-MBP.citrite.net
 (default-46-102-197-194.interdsl.co.uk. [46.102.197.194])
 by smtp.gmail.com with ESMTPSA id
 s11-20020a5d424b000000b00241cfe6e286sm22479988wrr.98.2022.12.08.02.49.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Dec 2022 02:49:26 -0800 (PST)
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
X-Inumbo-ID: f6a9d299-76e5-11ed-8fd2-01056ac49cbb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Wqgt/m8zEje8YxwihiJ7H78xpx2JqsQW9T3XP6J9djI=;
        b=bzQgx553JVpSJ0ChoQsX+GU7idf9dpVexXJ0MvgPDQpDzpQ157ZAWEClNhH7mluSHF
         b+XAeIXcMVjqZlK/AykRazwKaxy0k1gBzc7TRx8ru01wpU5yLh0lCjGfRolOObXudfl1
         cRZk95c6pIqNFcsR6RbtKkak1eONeci1ZzV5U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Wqgt/m8zEje8YxwihiJ7H78xpx2JqsQW9T3XP6J9djI=;
        b=OhDbPUAP1JHeZ9TN/BdiX0QuNr/ZvzF6yUVoH1WxM0h3jCSdDZkFmdqXQutjOhSnrH
         AsU3o9Xcg+81N9MtJ6i+YPGbYO7GjKw/MqlbEF4axI/QxjkB0+AjuKzOOCs78mcqH5e5
         6uZaBqu8Eag68z3n2asOy14NlTzOsEeyUQJCJcZ7abEoF4q+y/ljLYThDdaqSpHbELmK
         7IqjMn0/KlQvyWNo43iVXUofmsEyu3p0ddb1qVKo1yo3NUf6OHEQoOhD6bAP4bs5GR2Z
         LdrXdALMXLEkGZGLhLui1Bv5GeQZpKFZFUaqVPTVHk1qBAJyfYZx/hx/uGT6Iu5977PS
         Si9A==
X-Gm-Message-State: ANoB5pn9XCpfGVicdvN4++SofhcrsFJMch7VrlUS8p1htiprnlJnlkll
	49Z9kOdyMhVM+ctvyyHlrooc8NtVhM86OR3p
X-Google-Smtp-Source: AA0mqf6PKhmvQutoSEwgcBWZaaSGX+sQYo0y+IpL3DAonntUk9kDUo0cX/1UkOHt5dhErLV0UDeL5w==
X-Received: by 2002:a5d:620e:0:b0:241:e32f:8371 with SMTP id y14-20020a5d620e000000b00241e32f8371mr42437160wru.156.1670496567236;
        Thu, 08 Dec 2022 02:49:27 -0800 (PST)
From: George Dunlap <george.dunlap@cloud.com>
To: xen-devel@lists.xenproject.org
Cc: George Dunlap <george.dunlap@citrix.com>,
	George Dunlap <george.dunlap@cloud.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>
Subject: [PATCH] MAINTAINERS: Clarify check-in requirements for mixed-author patches
Date: Thu,  8 Dec 2022 10:49:24 +0000
Message-Id: <20221208104924.76637-1-george.dunlap@cloud.com>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: George Dunlap <george.dunlap@citrix.com>

There was a question raised recently about the requriements for
checking in a patch which was originally written by one maintainer,
then picked up and modified by a second maintainer, and which they now both
agree should be checked in.

It was proposed that in that case, the following set of tags would suffice:

   Signed-off-by: First Author <...>
   Signed-off-by: Second Author <...>
   Reviewed-by: First Author <...>

The rationale was as follows:

1. The patch will be a mix of code, whose copyright is owned by the
various authors (or the companies they work for).  It's important to
keep this information around in the event, for instance, of a license
change or something else requiring knowledge of the copyright owner.

2. The Signed-off-by of the Second Author approves not only their own
code, but First Author's code; the Reviewed-by of the First Author
approves not only their own code, but the Second Author's code.  Thus
all the code has been approved by a maintainer, as well as someone who
was not the author.

In support of this, several arguments were put forward:

* We shouldn't make it harder for maintainers to get their code in
  than for non-maintiners

* The system we set up should not add pointless bureaucracy; nor
  discourage collaboration; nor encourage contributors to get around
  the rules by dropping important information.  (For instance, by
  removing the first SoB, so that the patch appears to have been
  written entirely by Second Author.)

Concerns were raised about two maintainers from the same company
colluding to get a patch in from their company; but such maintainers
could already collude, by working on the patch in secret, and posting
it publicly with only a single author's SoB, and having the other
person review it.

There's also something slightly strange about adding "Reviewed-by" to
code that you've written; but in the end you're reviewing not only the
code itself, but the final arrangement of it.  There's no need to
overcomplicate things.

Encode this in MAINTAINERS as follows:

* Refine the wording of requirement #2 in the check-in policy; such
that *each change* must have approval from someone other than *the
person who wrote it*.

* Add a paragraph explicitly stating that the multiple-SoB-approval
  system satisfies the requirements, and why.

Signed-off-by: George Dunlap <george.dunlap@cloud.com>
---
 MAINTAINERS | 18 ++++++++++++++++--
 1 file changed, 16 insertions(+), 2 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 175f10f33f..0e5eba2312 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -120,8 +120,8 @@ must be met:
 
    See below for rules on nested maintainership.
 
-2. It must have appropriate approval from someone other than the
-   submitter.  This can be either:
+2. Each change must have appropriate approval from someone other than
+   the person who wrote it.  This can be either:
 
   a. An Acked-by from a maintainer of the code being touched (a
      co-maintainer if available, or a more general level maintainer if
@@ -150,6 +150,20 @@ give their co-maintainer opportunity to give feedback, perhaps
 declaring their intention to check it in without their co-maintainers
 ack a day before doing so.
 
+In the case where two people collaborate on a patch, at least one of
+whom is a maintainer -- typically where one maintainer will do an
+early version of the patch, and another maintainer will pick it up and
+revise it -- there should be two Signed-off-by's and one Acked-by or
+Reviewed-by; with the maintainer who did the most recent change
+sending the patch, and an Acked-by or Reviewed-by coming from the
+maintainer who did not most recently edit the patch.  This satisfies
+the requirement #2 because a) the Signed-off-by of the sender approves
+the final version of the patch; including all parts of the patch that
+the sender did not write b) the Reviewed-by approves the final version
+of the patch, including all patches that the reviewer did not write.
+Thus all code in the patch has been approved by someone who did not
+write it.
+
 Maintainers may choose to override non-maintainer objections in the
 case that consensus can't be reached.
 
-- 
2.38.1


