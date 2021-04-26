Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E0A636B11B
	for <lists+xen-devel@lfdr.de>; Mon, 26 Apr 2021 11:54:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.117535.223462 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1laxwW-0001i9-OY; Mon, 26 Apr 2021 09:54:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 117535.223462; Mon, 26 Apr 2021 09:54:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1laxwW-0001hk-LV; Mon, 26 Apr 2021 09:54:16 +0000
Received: by outflank-mailman (input) for mailman id 117535;
 Mon, 26 Apr 2021 09:54:15 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=l+oD=JX=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1laxwV-0001hf-HU
 for xen-devel@lists.xenproject.org; Mon, 26 Apr 2021 09:54:15 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 5b5adb57-707f-4978-92bf-2b11decc674b;
 Mon, 26 Apr 2021 09:54:14 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id A7072ADA2;
 Mon, 26 Apr 2021 09:54:13 +0000 (UTC)
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
X-Inumbo-ID: 5b5adb57-707f-4978-92bf-2b11decc674b
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1619430853; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=ie/uZd0oRdkfScOgFpcaD7DCEzFZHlhzJX6XVwGYkWU=;
	b=FLIddvawrFUkLsy6lMVKCohXAVrQ7BTcgZ9ZaGMykl8XPSOmxu3o4qjiQUR0GOdM3svmk4
	9eaYUiMI40fYGTw4xahEBqKD+33ezNFwMss+8JfzpSzC54mPLBIUZIx5oyuWxJHiWbaEh0
	9xZ1KsyO7Vt0Pf+HElwBzBojcJxsv3I=
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH] x86: fix build race when generating temporary object files
 (take 2)
Message-ID: <c35ad629-0dea-688a-199d-895186aeffb2@suse.com>
Date: Mon, 26 Apr 2021 11:54:13 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

The original commit wasn't quite sufficient: Emptying DEPS is helpful
only when nothing will get added to it subsequently. xen/Rules.mk will,
after including the local Makefile, amend DEPS by dependencies for
objects living in sub-directories though. For the purpose of suppressing
dependencies of the makefiles on the .*.d2 files (and thus to avoid
their re-generation) it is, however, not necessary at all to play with
DEPS. Instead we can override DEPS_INCLUDE (which generally is a late-
expansion variable).

Fixes: 761bb575ce97 ("x86: fix build race when generating temporary object files")
Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/arch/x86/Makefile
+++ b/xen/arch/x86/Makefile
@@ -314,5 +314,5 @@ clean::
 # Suppress loading of DEPS files for internal, temporary target files.  This
 # then also suppresses re-generation of the respective .*.d2 files.
 ifeq ($(filter-out .xen%.o,$(notdir $(MAKECMDGOALS))),)
-DEPS:=
+DEPS_INCLUDE:=
 endif

