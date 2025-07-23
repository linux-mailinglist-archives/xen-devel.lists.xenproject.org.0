Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 44851B0F5B3
	for <lists+xen-devel@lfdr.de>; Wed, 23 Jul 2025 16:46:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1054285.1423025 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ueaih-0005b2-Hr; Wed, 23 Jul 2025 14:45:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1054285.1423025; Wed, 23 Jul 2025 14:45:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ueaih-0005Yn-F5; Wed, 23 Jul 2025 14:45:23 +0000
Received: by outflank-mailman (input) for mailman id 1054285;
 Wed, 23 Jul 2025 14:45:21 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=kfeK=2E=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1ueaif-0005Yc-8f
 for xen-devel@lists.xenproject.org; Wed, 23 Jul 2025 14:45:21 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a6b3914e-67d3-11f0-a31d-13f23c93f187;
 Wed, 23 Jul 2025 16:45:19 +0200 (CEST)
Received: from nico.tail79467d.ts.net
 (host-79-60-221-62.business.telecomitalia.it [79.60.221.62])
 (Authenticated sender: nicola)
 by support.bugseng.com (Postfix) with ESMTPSA id B71964EE3C3B;
 Wed, 23 Jul 2025 16:45:16 +0200 (CEST)
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
X-Inumbo-ID: a6b3914e-67d3-11f0-a31d-13f23c93f187
Authentication-Results: bugseng.com; arc=none smtp.remote-ip=79.60.221.62
ARC-Seal: i=1; d=bugseng.com; s=openarc; a=rsa-sha256; cv=none; t=1753281917;
	b=HNy/XOWSu3g0RxS27xomgJ8S0s6gYtnS5hsl9ugpamOywLE0VAuz1VX77zAzl/0gKVqN
	 aFoIEDttDiKj9twekgaOKEWw5ZRon7rmSUZhTawbCXJtcEujnshcbLNELImdtYKd5B1QD
	 eAZn+M32RrMzohnzfEq1tG3yX32Su2FXq0Ouco13T3l7D9Al+zeXf7AFf8THSDo7FiFGE
	 FGmUBQLKj1ZpSuPsCSXFrVLBLIJHludccHxn01jA7Xw75Qf9JxSJmUREes/uRredKRYO1
	 /AY+77hkq7iKmxusmvRyzCyJt4WUx/AncFCsVubzU7dwUXJcigM8PDDMnhLnsv7DrU+XL
	 nQ6thAalLrzHGJPXz+pQpzZdy2/tOwisl2UHJaDhyGZf84Z8b6+Vmxf54DD4oNeIaW1Xw
	 42PfscWvIPzwrmCpbYu+4ArFgmSUXu//CLUbvHW1yVwWfCnZ/n5gCuuoD+VYVqrEoDZiq
	 UIsMxxx1pNmYiUR5OXDBTWF6Lm89mrANAPTBFzqzEw5wvNAgdzm5zdx81ENs0KCD2w6n8
	 hkNGZs6DvvwT8c4x5+xgNRH62gqAmu+LfttxJe5U3xncjnMe4vkC0YPoCnkcGgLU9qDl2
	 AP1IZncyY9WmbAF5cGk7IrnHh+gMG6Gg2w9CB7dMsiitlP4awwHahrgWvRN+hNU=
ARC-Message-Signature: i=1; d=bugseng.com; s=openarc; a=rsa-sha256;
	c=relaxed/relaxed; t=1753281917;
	h=DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 MIME-Version:Content-Transfer-Encoding;
	bh=Hj9SkBRM6qxGwniV9yn1/QKHd/6MxHEHdXZkVFwn50c=;
	b=Nzhv7/P4bPt9eOfBw/LxdGknG9qNMcJeMxxBLKCTSAyDbHdZL6b9mdgYpA9GOFp7beiD
	 5HlHAp7HPxWxzNtFV6L3xQuBAvwNknI3TVrJUlauYmj1534pB6tyxvilTbGb6qC7CcCr0
	 i+/4M1dxSi0fF80GMkD6rk3z+oA4m7lqPW5IKhrrUIbLYWEWmHSxqe4lSWIkc1nNHfqAP
	 U/8MoAaX0MzeVr8BSqu2jL0sbYNwD7vMZKtM2sdR0vYkvUIVxtUQujKbfRYqP9zEuAyLh
	 aG3uKYtWbwEaBO1MufMkzz9Qh5GbErfpkgCmRd0+37LUmxTfwztfpO5bP5ZGCqmP3Z1vP
	 JVmxOduQy/cJKXyHdneySvANaKcLYRZmU8VmK5GSNinKo9OyPpluWxQLzSmydKa1al3Hg
	 9qYk14/sY4BC0x1Us+MZtHfU03MLfpIhYKLmh9fIBNYE4hrrVHpE0FNpmkhWWDd3I4uWt
	 5Obp6eFEMKhOilms4rurPxT2usCuFZGjgPo57PwkDvlJplIqkb3w6D6KzSwyu0VTrAwyr
	 jUMgipO7cGzX75YdsqRYW/K04QO4hah7WfizSdbzTlL2D7xVxfOQWX2EteObp8R150sUg
	 zLZQPp7Wru1tNIt9uwGdq5wFijQ8zS9jsFfUkHUYTrdnrd5OT3/XcjAHMKHIJSQ=
ARC-Authentication-Results: i=1; bugseng.com; arc=none smtp.remote-ip=79.60.221.62
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=bugseng.com; s=mail;
	t=1753281917; bh=2OgX/iClwGnVDfJNs8RLc7aUT9LtrmMBOd43+2pHP9A=;
	h=From:To:Cc:Subject:Date:From;
	b=TVpT/hKTg0LjVLHxDN2YddSoXRhMUoMLOJ5EY4/Dmxq0/SZw5IXM+WVH2xGh2+I1+
	 uJO84gTK6AOM3paMNi6Q+w4O9R6cUM8fb8sjvCnb44nMYXXVEPsx6HvLNTN96CZt1H
	 ve4rOvoNdnfjpeBA8KzNRgkVhIxRe2l2b+fDXx4XNmdzFjlG4Ou4NxX1iffBvSA18c
	 5BY3mKA6y92v1+7OgpeQdS49HHuICuwveNMxa9S/JJmmFGDMlQLvjyhyqvGMu3MotZ
	 E/nJlwBsr9QENL+UsOpCtVj7V3znI3aigrdqjV7nbC9g3VEmB5kGcqOoFlNCVMJCED
	 ImesCz26b4Siw==
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: xen-deve@lists.xenproject.org,
	xen-devel@lists.xenproject.org
Cc: consulting@bugseng.com,
	Nicola Vetrini <nicola.vetrini@bugseng.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [XEN PATCH] x86/page: fix regressions of MISRA C Rule 8.2
Date: Wed, 23 Jul 2025 16:45:13 +0200
Message-ID: <9ad46ae1a1f07bdacbcd6a6befd249be95c9d5cb.1753281819.git.nicola.vetrini@bugseng.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The rule states: "Function types shall be in prototype form
with named parameters". Add missing parameter names.

Fixes: 6ff0cfbfd4f7 ("mm: allow page scrubbing routine(s) to be arch controlled")
Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
---
 xen/arch/x86/include/asm/page.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/xen/arch/x86/include/asm/page.h b/xen/arch/x86/include/asm/page.h
index d8e23e614c88..b53cd19f31a4 100644
--- a/xen/arch/x86/include/asm/page.h
+++ b/xen/arch/x86/include/asm/page.h
@@ -227,8 +227,8 @@ void copy_page_sse2(void *to, const void *from);
 #define copy_page(_t, _f)   copy_page_sse2(_t, _f)
 
 #ifdef CONFIG_DEBUG
-void scrub_page_hot(void *);
-void scrub_page_cold(void *);
+void scrub_page_hot(void *pg);
+void scrub_page_cold(void *pg);
 #endif
 
 /* Convert between Xen-heap virtual addresses and machine addresses. */
-- 
2.43.0


