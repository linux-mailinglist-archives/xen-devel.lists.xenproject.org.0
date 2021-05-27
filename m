Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 57850392E0F
	for <lists+xen-devel@lfdr.de>; Thu, 27 May 2021 14:34:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.133128.248220 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lmFDF-0006Tv-6h; Thu, 27 May 2021 12:34:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 133128.248220; Thu, 27 May 2021 12:34:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lmFDF-0006Ro-2p; Thu, 27 May 2021 12:34:09 +0000
Received: by outflank-mailman (input) for mailman id 133128;
 Thu, 27 May 2021 12:34:07 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=HjtO=KW=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lmFDD-0006Pc-8Z
 for xen-devel@lists.xenproject.org; Thu, 27 May 2021 12:34:07 +0000
Received: from smtp-out2.suse.de (unknown [195.135.220.29])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 9815c3a5-9e12-4398-ac35-e8ac1248d20e;
 Thu, 27 May 2021 12:34:06 +0000 (UTC)
Received: from imap.suse.de (imap-alt.suse-dmz.suse.de [192.168.254.47])
 (using TLSv1.2 with cipher ECDHE-ECDSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id C04991FD2E;
 Thu, 27 May 2021 12:34:05 +0000 (UTC)
Received: from director2.suse.de (director2.suse-dmz.suse.de [192.168.254.72])
 by imap.suse.de (Postfix) with ESMTPSA id A413711A98;
 Thu, 27 May 2021 12:34:05 +0000 (UTC)
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
X-Inumbo-ID: 9815c3a5-9e12-4398-ac35-e8ac1248d20e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1622118845; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=T37zxeTBRZgcSqOKYX7WewAeIo59kPVTD7P0XmcfTcQ=;
	b=CEkK6A2AMkUaWy8Wpu9K+D3Mohi0H8TEqiEQ6bDFXg/HHxe6WoKkzElzBjjdtn9P0GsmRT
	BVnYJt9bcBwt6ByA8kPrJNHevC4rwR291N02RXw7NY+C34GRfp23NlbvNPY2TzBzNstqLy
	dY4pMCyVCkI0DzGydfYGdIuj/QcAqjM=
Subject: [PATCH v2 08/12] x86: move .text.kexec
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <8f56a8f4-0482-932f-96a9-c791bebb4610@suse.com>
Message-ID: <f964e5bb-6b84-40d6-d247-7655ef09d47b@suse.com>
Date: Thu, 27 May 2021 14:34:02 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.2
MIME-Version: 1.0
In-Reply-To: <8f56a8f4-0482-932f-96a9-c791bebb4610@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

The source file requests page alignment - avoid a padding hole by
placing it right after .text.entry. On average this yields a .text size
reduction of 2k.

Requested-by: Andrew Cooper <andrew.cooper3@citrix.com>
Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
v2: New.

--- a/xen/arch/x86/xen.lds.S
+++ b/xen/arch/x86/xen.lds.S
@@ -83,10 +83,11 @@ SECTIONS
        . = ALIGN(PAGE_SIZE);
        _etextentry = .;
 
+       *(.text.kexec)          /* Page aligned in the object file. */
+
        *(.text.cold)
        *(.text.unlikely)
        *(.fixup)
-       *(.text.kexec)
        *(.gnu.warning)
        _etext = .;             /* End of text section */
   } PHDR(text) = 0x9090


