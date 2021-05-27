Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 146C9392E03
	for <lists+xen-devel@lfdr.de>; Thu, 27 May 2021 14:31:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.133097.248176 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lmFAy-0003mL-UQ; Thu, 27 May 2021 12:31:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 133097.248176; Thu, 27 May 2021 12:31:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lmFAy-0003jf-QD; Thu, 27 May 2021 12:31:48 +0000
Received: by outflank-mailman (input) for mailman id 133097;
 Thu, 27 May 2021 12:31:47 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=HjtO=KW=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lmFAx-0003iF-DD
 for xen-devel@lists.xenproject.org; Thu, 27 May 2021 12:31:47 +0000
Received: from smtp-out2.suse.de (unknown [195.135.220.29])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 10a0f0d3-1038-4943-a11f-f1120438c9b8;
 Thu, 27 May 2021 12:31:46 +0000 (UTC)
Received: from imap.suse.de (imap-alt.suse-dmz.suse.de [192.168.254.47])
 (using TLSv1.2 with cipher ECDHE-ECDSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 8BEE71FD2F;
 Thu, 27 May 2021 12:31:45 +0000 (UTC)
Received: from director2.suse.de (director2.suse-dmz.suse.de [192.168.254.72])
 by imap.suse.de (Postfix) with ESMTPSA id 66A9411A98;
 Thu, 27 May 2021 12:31:45 +0000 (UTC)
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
X-Inumbo-ID: 10a0f0d3-1038-4943-a11f-f1120438c9b8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1622118705; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=QcysIdV+/q7pgDThgMz+fBurt337dZex+nTBiQnp9G4=;
	b=TDq+Sg+A4U8B3V4H5lq5PraXQrPLCy0lNJIXEiHPUKfVPqPRcqZlaFl2KgbmRrx5yFDZPm
	BBunpHeBZj/w92ikA999jOuWKqW7OeEhsy7CNnLVXSH5FaJZsi8KgeS5G3D3lX/UejSyPZ
	h6VokZGVyR0VW0XIbjsfL+CwwwFEh0Y=
Subject: [PATCH v2 04/12] x86: control memset() and memcpy() inlining
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <8f56a8f4-0482-932f-96a9-c791bebb4610@suse.com>
Message-ID: <654762fa-a7e2-3121-21d5-b992e8428d0e@suse.com>
Date: Thu, 27 May 2021 14:31:44 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.2
MIME-Version: 1.0
In-Reply-To: <8f56a8f4-0482-932f-96a9-c791bebb4610@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

Stop the compiler from inlining non-trivial memset() and memcpy() (for
memset() see e.g. map_vcpu_info() or kimage_load_segments() for
examples). This way we even keep the compiler from using REP STOSQ /
REP MOVSQ when we'd prefer REP STOSB / REP MOVSB (when ERMS is
available).

With gcc10 this yields a modest .text size reduction (release build) of
around 2k.

Unfortunately these options aren't understood by the clang versions I
have readily available for testing with; I'm unaware of equivalents.

Note also that using cc-option-add is not an option here, or at least I
couldn't make things work with it (in case the option was not supported
by the compiler): The embedded comma in the option looks to be getting
in the way.

Requested-by: Andrew Cooper <andrew.cooper3@citrix.com>
Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
v2: New.
---
The boundary values are of course up for discussion - I wasn't really
certain whether to use 16 or 32; I'd be less certain about using yet
larger values.

Similarly whether to permit the compiler to emit REP STOSQ / REP MOVSQ
for known size, properly aligned blocks is up for discussion.

--- a/xen/arch/x86/arch.mk
+++ b/xen/arch/x86/arch.mk
@@ -51,6 +51,9 @@ CFLAGS-$(CONFIG_INDIRECT_THUNK) += -fno-
 $(call cc-option-add,CFLAGS-stack-boundary,CC,-mpreferred-stack-boundary=3)
 export CFLAGS-stack-boundary
 
+CFLAGS += $(call cc-option,$(CC),-mmemcpy-strategy=unrolled_loop:16:noalign$(comma)libcall:-1:noalign)
+CFLAGS += $(call cc-option,$(CC),-mmemset-strategy=unrolled_loop:16:noalign$(comma)libcall:-1:noalign)
+
 ifeq ($(CONFIG_UBSAN),y)
 # Don't enable alignment sanitisation.  x86 has efficient unaligned accesses,
 # and various things (ACPI tables, hypercall pages, stubs, etc) are wont-fix.


