Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B8EA88C2DA8
	for <lists+xen-devel@lfdr.de>; Sat, 11 May 2024 01:37:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.720128.1123160 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s5Znj-0003vA-FP; Fri, 10 May 2024 23:37:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 720128.1123160; Fri, 10 May 2024 23:37:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s5Znj-0003sO-CM; Fri, 10 May 2024 23:37:19 +0000
Received: by outflank-mailman (input) for mailman id 720128;
 Fri, 10 May 2024 23:37:18 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=pcT1=MN=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1s5Zni-0003s2-7O
 for xen-devel@lists.xenproject.org; Fri, 10 May 2024 23:37:18 +0000
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3b5c99a0-0f26-11ef-909d-e314d9c70b13;
 Sat, 11 May 2024 01:37:17 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 66609CE1F22;
 Fri, 10 May 2024 23:37:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7B93DC113CC;
 Fri, 10 May 2024 23:37:12 +0000 (UTC)
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
X-Inumbo-ID: 3b5c99a0-0f26-11ef-909d-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1715384233;
	bh=jywT3wBiVd/k0saOAsMgRhZQlshpedfhcqSBOO7XSo8=;
	h=Date:From:To:cc:Subject:From;
	b=K/7EKbMzmOGrUOGebLZVEW498lySajGEkl+yNbCmMK/vuyxSynTkDIJjS8Qln7rFZ
	 ppXY/I64SRXaq8+qqVo32M+B0bqA+glspr0mkTlG9IjH1laOQKDGdYJgEK7vf8ARME
	 QTUY4DatJ4I+xWPhyqLgFHmqfMrK41BQphKWahZwfskngOzIN9kE8IdOYQRaBnG16F
	 kLUrfKgsTH3uGoiPWAkyhqclpVgKRM3VoxZIBIEt0bHSrur7P7n9vTyZflscgCd3Yn
	 InOrxZ/ax+n9SoYkg6mHaZBKgiOSuV1Nfughyu9cZAdm8PrIwZ6Y1C3/WMsaGtiohV
	 v6vEqvnbKmYBQ==
Date: Fri, 10 May 2024 16:37:11 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: xen-devel@lists.xenproject.org
cc: sstabellini@kernel.org, andrew.cooper3@citrix.com, 
    george.dunlap@citrix.com, jbeulich@suse.com, julien@xen.org, 
    roger.pau@citrix.com, bertrand.marquis@arm.com, michal.orzel@amd.com
Subject: [PATCH] fix Rule 10.2 violation
Message-ID: <alpine.DEB.2.22.394.2405101634500.2544314@ubuntu-linux-20-04-desktop>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

Change opt_conswitch to char to fix a violation of Rule 10.2.

Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>

diff --git a/xen/drivers/char/console.c b/xen/drivers/char/console.c
index 2c363d9c1d..3a3a97bcbe 100644
--- a/xen/drivers/char/console.c
+++ b/xen/drivers/char/console.c
@@ -49,7 +49,7 @@ string_param("console", opt_console);
 /* Char 1: CTRL+<char1> is used to switch console input between Xen and DOM0 */
 /* Char 2: If this character is 'x', then do not auto-switch to DOM0 when it */
 /*         boots. Any other value, or omitting the char, enables auto-switch */
-static unsigned char __read_mostly opt_conswitch[3] = "a";
+static char __read_mostly opt_conswitch[3] = "a";
 string_runtime_param("conswitch", opt_conswitch);
 
 /* sync_console: force synchronous console output (useful for debugging). */

