Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 958BA2C3B49
	for <lists+xen-devel@lfdr.de>; Wed, 25 Nov 2020 09:46:06 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.37437.69799 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1khqR4-00035F-HJ; Wed, 25 Nov 2020 08:45:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 37437.69799; Wed, 25 Nov 2020 08:45:58 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1khqR4-00034u-Dq; Wed, 25 Nov 2020 08:45:58 +0000
Received: by outflank-mailman (input) for mailman id 37437;
 Wed, 25 Nov 2020 08:45:57 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=dO0Y=E7=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1khqR3-00034o-1L
 for xen-devel@lists.xenproject.org; Wed, 25 Nov 2020 08:45:57 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id c074e09a-f2bc-462e-8dfb-c66fae4928e8;
 Wed, 25 Nov 2020 08:45:56 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 7DEB7ABD7;
 Wed, 25 Nov 2020 08:45:55 +0000 (UTC)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=dO0Y=E7=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
	id 1khqR3-00034o-1L
	for xen-devel@lists.xenproject.org; Wed, 25 Nov 2020 08:45:57 +0000
X-Inumbo-ID: c074e09a-f2bc-462e-8dfb-c66fae4928e8
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id c074e09a-f2bc-462e-8dfb-c66fae4928e8;
	Wed, 25 Nov 2020 08:45:56 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1606293955; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=B+q6b8HTVycttCqpnu1a9+GhKtnMC72vN0yNLtGmp6M=;
	b=IXD9JNw6jO7p6Kzmz1opC7pNa+yQrmPIE1cc9xpDxRe3V8UsVu9lSH4QH0KftAufQHUm5y
	Rt5cYTtfNRJaXojItBBvgUsneqbeZf0R/vQU2KPOvig5MaZTqlpfohoYHy/cqXHUwzZrQH
	rOeXVYgoiIzGZLzAFrs6HtaUVZjOoAI=
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 7DEB7ABD7;
	Wed, 25 Nov 2020 08:45:55 +0000 (UTC)
Subject: [PATCH 1/5] x86/build: limit rebuilding of asm-offsets.h
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <46d83c92-0b06-fc09-4832-7a7d7935d5c2@suse.com>
Message-ID: <d437bdbf-3047-06ad-2fe8-f445cf8b3240@suse.com>
Date: Wed, 25 Nov 2020 09:45:56 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <46d83c92-0b06-fc09-4832-7a7d7935d5c2@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

This file has a long dependencies list (through asm-offsets.s) and a
long list of dependents. IOW if any of the former changes, all of the
latter will be rebuilt, even if there's no actual change to the
generated file. This is the primary scenario we have the move-if-changed
macro for.

Since debug information may easily cause the file contents to change in
benign ways, also avoid emitting this into the output file.

Finally already before this change *.new files needed including in what
gets removed by the "clean" target.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
Perhaps Arm would want doing the same. In fact perhaps the rules should
be unified by moving to common code?

--- a/xen/arch/x86/Makefile
+++ b/xen/arch/x86/Makefile
@@ -235,7 +235,8 @@ efi/buildid.o efi/relocs-dummy.o: $(BASE
 efi/buildid.o efi/relocs-dummy.o: ;
 
 asm-offsets.s: $(TARGET_SUBARCH)/asm-offsets.c $(BASEDIR)/include/asm-x86/asm-macros.h
-	$(CC) $(filter-out -Wa$(comma)% -flto,$(c_flags)) -S -o $@ $<
+	$(CC) $(filter-out -Wa$(comma)% -flto,$(c_flags)) -S -g0 -o $@.new $<
+	$(call move-if-changed,$@.new,$@)
 
 asm-macros.i: CFLAGS-y += -D__ASSEMBLY__ -P
 
@@ -262,7 +263,7 @@ efi/mkreloc: efi/mkreloc.c
 
 .PHONY: clean
 clean::
-	rm -f asm-offsets.s *.lds boot/*.o boot/*~ boot/core boot/mkelf32
+	rm -f asm-offsets.s *.lds *.new boot/*.o boot/*~ boot/core boot/mkelf32
 	rm -f asm-macros.i $(BASEDIR)/include/asm-x86/asm-macros.*
 	rm -f $(BASEDIR)/.xen-syms.[0-9]* boot/.*.d $(BASEDIR)/.xen.elf32
 	rm -f $(BASEDIR)/.xen.efi.[0-9]* efi/*.efi efi/mkreloc

