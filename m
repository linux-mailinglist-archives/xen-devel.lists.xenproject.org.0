Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CF58390215
	for <lists+xen-devel@lfdr.de>; Tue, 25 May 2021 15:22:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.132180.246644 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1llWzY-00054K-JE; Tue, 25 May 2021 13:21:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 132180.246644; Tue, 25 May 2021 13:21:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1llWzY-00052J-Fp; Tue, 25 May 2021 13:21:04 +0000
Received: by outflank-mailman (input) for mailman id 132180;
 Tue, 25 May 2021 13:21:02 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=n3nm=KU=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1llWzW-00052D-He
 for xen-devel@lists.xenproject.org; Tue, 25 May 2021 13:21:02 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 3efb7e8f-341f-4b0a-bce6-8cc4c7e328fb;
 Tue, 25 May 2021 13:21:01 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 2A62CAB71;
 Tue, 25 May 2021 13:21:00 +0000 (UTC)
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
X-Inumbo-ID: 3efb7e8f-341f-4b0a-bce6-8cc4c7e328fb
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1621948860; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=mTZsaQ6C2TIwnAVIj9W9dEgmWFYDSOJvMmZR7SKqcSQ=;
	b=X8OIhweXdkA0mBSmMtcIlcc37hvmprxjUCxpK7lWkgOP71VB72nSmai362Smrfj6H4Vjvs
	mHFl0d9aTuaQ+HV3Y91VDlq9K1hAFLT6u/ijn/BHImzQTV2B0kQbCi18KfsPs/IZa2VEfE
	zI9qBZKVd/AIHF6ZvZwcEA23Cq1qVU8=
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH] x86/guest: fix build when HVM and !PV32
Message-ID: <d8230ebc-a3cb-6a87-33c3-ab27bfa17862@suse.com>
Date: Tue, 25 May 2021 15:20:56 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.2
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

The commit referenced below still wasn't careful enough - with COMPAT we
will have a compat_handle_okay() visible already, which we first need to
get rid of.

Fixes: bd1e7b47bac0 ("x86/shim: fix build when !PV32")
Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/arch/x86/pv/shim.c
+++ b/xen/arch/x86/pv/shim.c
@@ -679,6 +679,7 @@ void pv_shim_inject_evtchn(unsigned int
 # include <compat/grant_table.h>
 #else
 # define compat_gnttab_setup_table gnttab_setup_table
+# undef compat_handle_okay
 # define compat_handle_okay guest_handle_okay
 #endif
 

