Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D6A72B8E4A
	for <lists+xen-devel@lfdr.de>; Thu, 19 Nov 2020 09:58:03 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.30481.60520 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kfflL-0006ig-Qf; Thu, 19 Nov 2020 08:57:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 30481.60520; Thu, 19 Nov 2020 08:57:55 +0000
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
	id 1kfflL-0006iH-NW; Thu, 19 Nov 2020 08:57:55 +0000
Received: by outflank-mailman (input) for mailman id 30481;
 Thu, 19 Nov 2020 08:57:54 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=PWQs=EZ=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kfflK-0006hJ-Bp
 for xen-devel@lists.xenproject.org; Thu, 19 Nov 2020 08:57:54 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 39181b60-33e7-40bd-9e5d-fe6ef796f688;
 Thu, 19 Nov 2020 08:57:53 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 8CFAEAD2F;
 Thu, 19 Nov 2020 08:57:52 +0000 (UTC)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=PWQs=EZ=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
	id 1kfflK-0006hJ-Bp
	for xen-devel@lists.xenproject.org; Thu, 19 Nov 2020 08:57:54 +0000
X-Inumbo-ID: 39181b60-33e7-40bd-9e5d-fe6ef796f688
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id 39181b60-33e7-40bd-9e5d-fe6ef796f688;
	Thu, 19 Nov 2020 08:57:53 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1605776272; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=crdjdM7DkXckInu6b41yqI+iMgZG4mEeVJLCAwg6n94=;
	b=f08MdXrgrVvmsx1/OmMAn7evZs1MuyGyfJ2FgL2Ow/nYJmYC0/CfEdCIfOgIw8D4sSMq1T
	nI422J0yc8a/yHtyRB5EtmMebeNakNMFzT+9f80qOmpsx/RSWWVJi98tImcT9kN40fu/uj
	VMwDDJB4lthuxvZcuiXOpDNROSB5OAg=
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 8CFAEAD2F;
	Thu, 19 Nov 2020 08:57:52 +0000 (UTC)
Subject: [PATCH 2/2] ns16550: drop stray "#ifdef CONFIG_HAS_PCI"
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>
References: <b74ba81a-da34-1e9a-9a15-f9dbb6005de8@suse.com>
Message-ID: <b4617026-32fb-8840-8998-90273a13fb39@suse.com>
Date: Thu, 19 Nov 2020 09:57:52 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.3
MIME-Version: 1.0
In-Reply-To: <b74ba81a-da34-1e9a-9a15-f9dbb6005de8@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

There's no point wrapping the function invocation when
- the function body is already suitably wrapped,
- the function itself is unconditionally available.

Reported-by: Julien Grall <julien@xen.org>
Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/drivers/char/ns16550.c
+++ b/xen/drivers/char/ns16550.c
@@ -968,9 +968,7 @@ static int __init check_existence(struct
     return 1; /* Everything is MMIO */
 #endif
 
-#ifdef CONFIG_HAS_PCI
     pci_serial_early_init(uart);
-#endif
 
     /*
      * Do a simple existence test first; if we fail this,


