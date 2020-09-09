Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BCF0B2630D1
	for <lists+xen-devel@lfdr.de>; Wed,  9 Sep 2020 17:45:57 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kG2I1-0001Th-3b; Wed, 09 Sep 2020 15:45:41 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Y3mV=CS=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kG2Hy-0001Tc-V5
 for xen-devel@lists.xenproject.org; Wed, 09 Sep 2020 15:45:38 +0000
X-Inumbo-ID: d727f976-cad1-4e12-a4b5-0bec3887d335
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id d727f976-cad1-4e12-a4b5-0bec3887d335;
 Wed, 09 Sep 2020 15:45:37 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id C1B2FAD18;
 Wed,  9 Sep 2020 15:45:51 +0000 (UTC)
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH] x86: drop use of prelink-efi_lto.o
Message-ID: <1b0f6e53-4548-c8ed-7270-53a9a4557b78@suse.com>
Date: Wed, 9 Sep 2020 17:45:36 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

As of de94e8b4f996 ("x86/EFI: sanitize build logic") it is identical to
prelink_lto.o.

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/arch/x86/Makefile
+++ b/xen/arch/x86/Makefile
@@ -135,14 +135,11 @@ ifeq ($(CONFIG_LTO),y)
 prelink_lto.o: $(ALL_OBJS)
 	$(LD_LTO) -r -o $@ $^
 
-prelink-efi_lto.o: $(ALL_OBJS)
-	$(LD_LTO) -r -o $@ $^
-
 # Link it with all the binary objects
 prelink.o: $(patsubst %/built_in.o,%/built_in_bin.o,$(ALL_OBJS)) prelink_lto.o $(EFI_OBJS-y)
 	$(LD) $(XEN_LDFLAGS) -r -o $@ $^
 
-prelink-efi.o: $(patsubst %/built_in.o,%/built_in_bin.o,$(ALL_OBJS)) prelink-efi_lto.o
+prelink-efi.o: $(patsubst %/built_in.o,%/built_in_bin.o,$(ALL_OBJS)) prelink_lto.o
 	$(LD) $(XEN_LDFLAGS) -r -o $@ $^
 else
 prelink.o: $(ALL_OBJS) $(EFI_OBJS-y)

