Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 82933364732
	for <lists+xen-devel@lfdr.de>; Mon, 19 Apr 2021 17:32:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.113049.215428 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lYVrZ-0006i0-Dl; Mon, 19 Apr 2021 15:31:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 113049.215428; Mon, 19 Apr 2021 15:31:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lYVrZ-0006hd-AW; Mon, 19 Apr 2021 15:31:01 +0000
Received: by outflank-mailman (input) for mailman id 113049;
 Mon, 19 Apr 2021 15:31:00 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=EHwQ=JQ=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lYVrY-0006hX-Au
 for xen-devel@lists.xenproject.org; Mon, 19 Apr 2021 15:31:00 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id e9f7834b-e88a-481e-818d-7a585226c64c;
 Mon, 19 Apr 2021 15:30:59 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 8CBEBAD09;
 Mon, 19 Apr 2021 15:30:58 +0000 (UTC)
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
X-Inumbo-ID: e9f7834b-e88a-481e-818d-7a585226c64c
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1618846258; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=sHNcOcJ9rIpDXtzuCOh89Oka1MXiX02W2jGlstGd3bw=;
	b=PgSgFLjiHL1MtmUVxMqMULnCrn4i6rNfS2opHN8VEtQ+aqvATDqdIDpEvYDeKuuDOBB34S
	EiWNc5Cr8SQZ+QRA0qMU+S8iwKWWRUWTlXm23W9CGRc+68ghwm0Pv7I6OwIBSmnwTBKdY0
	w9Zwzq4qH1KdR7YYoNWEEtsXz8+SMKI=
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH] x86emul: fix test harness build for gas 2.36
Message-ID: <723af87e-329d-6f52-ece4-fc3314796960@suse.com>
Date: Mon, 19 Apr 2021 17:30:58 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.1
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

All of the sudden, besides .text and .rodata and alike, an always
present .note.gnu.property section has appeared. This section, when
converting to binary format output, gets placed according to its
linked address, causing the resulting blobs to be about 128Mb in size.
The resulting headers with a C representation of the binary blobs then
are, of course all a multiple of that size (and take accordingly long
to create). I didn't bother waiting to see what size the final
test_x86_emulator binary then would have had.

See also https://sourceware.org/bugzilla/show_bug.cgi?id=27753.

Rather than figuring out whether gas supports -mx86-used-note=, simply
remove the section while creating *.bin.

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/tools/tests/x86_emulator/testcase.mk
+++ b/tools/tests/x86_emulator/testcase.mk
@@ -12,11 +12,11 @@ all: $(TESTCASE).bin
 %.bin: %.c
 	$(CC) $(filter-out -M% .%,$(CFLAGS)) -c $<
 	$(LD) $(LDFLAGS_DIRECT) -N -Ttext 0x100000 -o $*.tmp $*.o
-	$(OBJCOPY) -O binary $*.tmp $@
+	$(OBJCOPY) -O binary -R .note.gnu.property $*.tmp $@
 	rm -f $*.tmp
 
 %-opmask.bin: opmask.S
 	$(CC) $(filter-out -M% .%,$(CFLAGS)) -c $< -o $(basename $@).o
 	$(LD) $(LDFLAGS_DIRECT) -N -Ttext 0x100000 -o $(basename $@).tmp $(basename $@).o
-	$(OBJCOPY) -O binary $(basename $@).tmp $@
+	$(OBJCOPY) -O binary -R .note.gnu.property $(basename $@).tmp $@
 	rm -f $(basename $@).tmp

