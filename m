Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6989DB253BE
	for <lists+xen-devel@lfdr.de>; Wed, 13 Aug 2025 21:14:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1080219.1440779 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1umGvF-0000GX-8I; Wed, 13 Aug 2025 19:14:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1080219.1440779; Wed, 13 Aug 2025 19:14:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1umGvF-0000Ea-47; Wed, 13 Aug 2025 19:14:05 +0000
Received: by outflank-mailman (input) for mailman id 1080219;
 Wed, 13 Aug 2025 19:14:03 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=EaOB=2Z=gmail.com=nicola.vetrini@bugseng.com>)
 id 1umGvD-0008Mm-QZ
 for xen-devel@lists.xenproject.org; Wed, 13 Aug 2025 19:14:03 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ac103bdd-7879-11f0-b898-0df219b8e170;
 Wed, 13 Aug 2025 21:14:02 +0200 (CEST)
Received: from nico.tail79467d.ts.net (unknown [46.228.253.214])
 (Authenticated sender: nicola)
 by support.bugseng.com (Postfix) with ESMTPSA id E6AE34EE3C04;
 Wed, 13 Aug 2025 21:14:00 +0200 (CEST)
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
X-Inumbo-ID: ac103bdd-7879-11f0-b898-0df219b8e170
Authentication-Results: bugseng.com; arc=none smtp.remote-ip=46.228.253.214
ARC-Seal: i=1; d=bugseng.com; s=openarc; a=rsa-sha256; cv=none; t=1755112442;
	b=hEITOhzApCdd24lcK7H0iilLqOy60T139nZD1seCkR68+S+NFWvV1BJJCeeBcRb539Ae
	 xWBiRrwqhxtDcgoomNH6ImcjZZZK91lJMLfl7hIsMGPEVCMwa6Y6wHbqy8boPqM4HujF5
	 YeZMUuBYVv/4m6jU7eeHx5idxEYngmtvuDsuCe9VfWzNy7JYFREWZMy1z89pPNKfHzbgR
	 OMBZqE+d4dFwtkMjt7TJOcisH1ZOwBBqvkfOxWg8BBFU67lZ5npt9KV8USaRJhwZ/qYOT
	 q6Ad2PagcPetmy7li3QRVobVi6auyCGQriKeuzVRtPfwEN51ko/npPW+ssMqwMEGrSOv4
	 782wuU4xXMK+poCn+OOjI3UnIteXq5A50uePKbLMKKFPVv40ayu7GE5K178Q6rfD4/LQn
	 N4jSuHOeVStJ+AgTKo/ygwN+TD3xKnT091wHUqKseMePZZSbetYqj0xnRtD6XrcYl46im
	 C24xE2L5o0yt5Muiq6cO4JE9UlSvMIQZ4mgcQ1g3q+RM7x2pzjAHxevW1PRFKfo7kEfhW
	 6t/BaZ+qmJLm3RtWR241wF2X/RH7owRkpcpcaj0qaEEaO3teoAjyOS14duULTtbfg5Jcj
	 bPYyR5sbfvCYkGhOhyBeeKEnrGRIl2/VoaZlARtHqQvLHO2aqq6QW4iml734LSg=
ARC-Message-Signature: i=1; d=bugseng.com; s=openarc; a=rsa-sha256;
	c=relaxed/relaxed; t=1755112442;
	h=From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=BTUrqcilpvPjOMlf0B5Cq3Jl+kwMS+HJmY4prEiMWNg=;
	b=O4CLM2qUDYZ4TBv1+9hXsCYVZesFgktiy/JCSy+Iq5AXsrhdFZZVE/wJ7weHQKiWRomP
	 nvsZiRvGSI98XZhMrKakfa9XJwOUZbGUJe8z1MWLxXdaEiXszyK0g4LlEN43qj9ZX7Wy3
	 vbix+3v6L7NriPyycnsYAKQZSvX4R2MPMCHBud+iBjkMVH7GXhKm/G1BJu0YerVvgw3Hw
	 KW2OlGmFbfuAFPQuGfJi+YKgG25yWQnIZyK91+xbur12F7Q+vDu/OnKz/ICPREvPP8RGh
	 GqPad7CrbSsQhbwCMmttEUFyEz6PMGO20tmyBf4rOSRrlyaT+mfxLXqMCtKy2Yeu5M2Te
	 uheNT4dXFYGP6RgI4qDS5148nlUH1i9guJ2KeOHqM/qWZ8Um66pX1ur/c53j2U2/FUr94
	 Xk3JjbPVOzvOasqaw0Tpq8kyciuMMSiJEBOff/3LryHeRzkcFObTdk0j7koGf9fkQWnwA
	 3kGiIZdpDiYfjfgaWTKHdNB7S8wLdd2EiIS1+ylXv5Q1ZTv5fi/6PrNR1tetONKkFmd6o
	 VQ0o20BLO3eivw1QvVU3gKxBsJZvrxi2hzcTYGtNw1tk3cfXkkE7p1diYtrmrLkzvTyJ8
	 pzh6Vw59j9jOM7tjgyeIsFDijK0ohi6RcfXE+k5I9SJsEaGnPJZIhfeKpGGcnK4=
ARC-Authentication-Results: i=1; bugseng.com; arc=none smtp.remote-ip=46.228.253.214
From: nicola.vetrini@gmail.com
To: xen-devel@lists.xenproject.org
Cc: Nicola Vetrini <nicola.vetrini@gmail.com>,
	"Daniel P. Smith" <dpsmith@apertussolutions.com>,
	=?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [XEN PATCH 3/3] xen/efi: efibind: Drop alternative define for old GCC versions
Date: Wed, 13 Aug 2025 21:12:50 +0200
Message-ID: <4140895d7382e1e1d84b5f3988b497a7edd67034.1755111932.git.nicola.vetrini@bugseng.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1755111932.git.nicola.vetrini@bugseng.com>
References: <cover.1755111932.git.nicola.vetrini@bugseng.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Nicola Vetrini <nicola.vetrini@gmail.com>

Since the toolchain baseline for GCC is 5.1, there is no need for
this case.

Signed-off-by: Nicola Vetrini <nicola.vetrini@gmail.com>
---
Mentioned in https://gitlab.com/xen-project/xen/-/issues/201
---
 xen/arch/x86/include/asm/x86_64/efibind.h | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/xen/arch/x86/include/asm/x86_64/efibind.h b/xen/arch/x86/include/asm/x86_64/efibind.h
index b29342c61cac..d71b9324a6bb 100644
--- a/xen/arch/x86/include/asm/x86_64/efibind.h
+++ b/xen/arch/x86/include/asm/x86_64/efibind.h
@@ -173,10 +173,8 @@ typedef uint64_t   UINTN;
 #ifndef EFIAPI                  // Forces EFI calling conventions reguardless of compiler options
     #ifdef _MSC_EXTENSIONS
         #define EFIAPI __cdecl  // Force C calling convention for Microsoft C compiler
-    #elif __clang__ || __GNUC__ > 4 || (__GNUC__ == 4 && __GNUC_MINOR__ >= 4)
-        #define EFIAPI __attribute__((__ms_abi__))  // Force Microsoft ABI
     #else
-        #define EFIAPI          // Substitute expression to force C calling convention
+        #define EFIAPI __attribute__((__ms_abi__))  // Force Microsoft ABI
     #endif
 #endif
 
-- 
2.43.0


