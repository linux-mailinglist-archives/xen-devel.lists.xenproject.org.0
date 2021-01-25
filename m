Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E86A530240A
	for <lists+xen-devel@lfdr.de>; Mon, 25 Jan 2021 12:04:55 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.74011.133024 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l3zeu-0003D3-0B; Mon, 25 Jan 2021 11:03:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 74011.133024; Mon, 25 Jan 2021 11:03:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l3zet-0003Ce-Se; Mon, 25 Jan 2021 11:03:47 +0000
Received: by outflank-mailman (input) for mailman id 74011;
 Mon, 25 Jan 2021 11:03:47 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=dw2F=G4=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1l3zet-0003CZ-4M
 for xen-devel@lists.xenproject.org; Mon, 25 Jan 2021 11:03:47 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 67eecc7b-cbd3-4498-86a7-756149fc3f43;
 Mon, 25 Jan 2021 11:03:46 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 3E19AAD8C;
 Mon, 25 Jan 2021 11:03:45 +0000 (UTC)
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
X-Inumbo-ID: 67eecc7b-cbd3-4498-86a7-756149fc3f43
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1611572625; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=S39/bDzsIvY8wZJwPoX2Sm0DQ94xYju2x7QSfr1JP5g=;
	b=jfXz4duSD8LcY6TAgBqYJcXlEb1JMZeFdnp3+Pf4TosSB1hhmYtaxnNNnO5goNCDwh5VQh
	bziH/ysqDgn8Ft5pNc4QpO3tOq/sx5mryMJHwRQtG6Q85K1ot0tdGqidihcVdd1NNIN2/3
	EMxF52Sg7RJvgZQl9rDw3MYuUIiDJ20=
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH] xen/include: compat/xlat.h may change with .config changes
Message-ID: <2bd62f36-e878-8a0b-6e64-d25f5818331c@suse.com>
Date: Mon, 25 Jan 2021 12:03:44 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

$(xlat-y) getting derived from $(headers-y) means its contents may
change with changes to .config. The individual files $(xlat-y) refers
to, otoh, may not change, and hence not trigger rebuilding of xlat.h.
(Note that the issue was already present before the commit referred to
below, but it was far more limited in affecting only changes to
CONFIG_XSM_FLASK.)

Fixes: 2c8fabb2232d ("x86: only generate compat headers actually needed")
Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/include/Makefile
+++ b/xen/include/Makefile
@@ -81,7 +81,7 @@ compat/.xlat/%.lst: xlat.lst Makefile
 xlat-y := $(shell sed -ne 's,@arch@,$(compat-arch-y),g' -re 's,^[?!][[:blank:]]+[^[:blank:]]+[[:blank:]]+,,p' xlat.lst | uniq)
 xlat-y := $(filter $(patsubst compat/%,%,$(headers-y)),$(xlat-y))
 
-compat/xlat.h: $(addprefix compat/.xlat/,$(xlat-y)) Makefile
+compat/xlat.h: $(addprefix compat/.xlat/,$(xlat-y)) config/auto.conf Makefile
 	cat $(filter %.h,$^) >$@.new
 	mv -f $@.new $@
 

