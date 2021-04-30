Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 87B3836FCAC
	for <lists+xen-devel@lfdr.de>; Fri, 30 Apr 2021 16:45:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.120581.228049 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lcUOA-0002o4-9V; Fri, 30 Apr 2021 14:45:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 120581.228049; Fri, 30 Apr 2021 14:45:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lcUOA-0002nf-6C; Fri, 30 Apr 2021 14:45:06 +0000
Received: by outflank-mailman (input) for mailman id 120581;
 Fri, 30 Apr 2021 14:45:05 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=T1Xz=J3=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lcUO9-0002nX-6h
 for xen-devel@lists.xenproject.org; Fri, 30 Apr 2021 14:45:05 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 28b905ea-f032-476b-b7ca-c4d42db25261;
 Fri, 30 Apr 2021 14:45:04 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 6C597B03A;
 Fri, 30 Apr 2021 14:45:03 +0000 (UTC)
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
X-Inumbo-ID: 28b905ea-f032-476b-b7ca-c4d42db25261
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1619793903; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=5fOkOupL5RkW0UbAtmQcNHl08DT14j0dorRN/S9Rg88=;
	b=eftbUYNyaqUl+jgTZ8zJQr3xdDBe9ar7LkG8nz5He2nb+vYGoz32j1n3N+QkcoRz2KCPf7
	Dm9teJWZJejjfuOirGEeI5OoYGsj0TZottA41D+avEIhgsJjrCkddK3gDqdPa5/PZjN6kG
	IouqeWGMAJ8ReryvC4aklTnkTLYmjrY=
Subject: [PATCH 3/3] firmware/shim: UNSUPPORTED=n
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Ian Jackson <iwj@xenproject.org>, Stefano Stabellini
 <sstabellini@kernel.org>, George Dunlap <george.dunlap@citrix.com>,
 Dario Faggioli <dfaggioli@suse.com>
References: <19695ffc-34d8-b682-b092-668f872d4e57@suse.com>
Message-ID: <dbfa9126-6809-64cf-5bd5-01b402616f11@suse.com>
Date: Fri, 30 Apr 2021 16:45:03 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <19695ffc-34d8-b682-b092-668f872d4e57@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

We shouldn't default to include any unsupported code in the shim. Mark
the setting as off, replacing the ARGO specification. This points out
anomalies with the scheduler configuration: Unsupported schedulers
better don't default to Y in release builds (like is already the case
for ARINC653). Without these adjustments, the shim would suddenly build
with RTDS as its default scheduler.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
----
I'm certainly open to consider alterations on the sched/Kconfig
adjustments, but _something_ needs to be done there. In particular I'm
puzzled to find the NULL scheduler marked unsupported. Clearly with
the shim defaulting to it, it must be supported at least there.

--- a/xen/arch/x86/configs/pvshim_defconfig
+++ b/xen/arch/x86/configs/pvshim_defconfig
@@ -15,7 +15,7 @@ CONFIG_SCHED_NULL=y
 # CONFIG_KEXEC is not set
 # CONFIG_XENOPROF is not set
 # CONFIG_XSM is not set
-# CONFIG_ARGO is not set
+# CONFIG_UNSUPPORTED is not set
 # CONFIG_SCHED_CREDIT is not set
 # CONFIG_SCHED_CREDIT2 is not set
 # CONFIG_SCHED_RTDS is not set
--- a/xen/common/sched/Kconfig
+++ b/xen/common/sched/Kconfig
@@ -16,7 +16,7 @@ config SCHED_CREDIT2
 
 config SCHED_RTDS
 	bool "RTDS scheduler support (UNSUPPORTED)" if UNSUPPORTED
-	default y
+	default DEBUG
 	---help---
 	  The RTDS scheduler is a soft and firm real-time scheduler for
 	  multicore, targeted for embedded, automotive, graphics and gaming
@@ -31,7 +31,7 @@ config SCHED_ARINC653
 
 config SCHED_NULL
 	bool "Null scheduler support (UNSUPPORTED)" if UNSUPPORTED
-	default y
+	default PV_SHIM || DEBUG
 	---help---
 	  The null scheduler is a static, zero overhead scheduler,
 	  for when there always are less vCPUs than pCPUs, typically


