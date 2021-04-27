Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7659E36C67B
	for <lists+xen-devel@lfdr.de>; Tue, 27 Apr 2021 14:55:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.118444.224575 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lbNFN-0003ML-E3; Tue, 27 Apr 2021 12:55:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 118444.224575; Tue, 27 Apr 2021 12:55:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lbNFN-0003Ly-Aq; Tue, 27 Apr 2021 12:55:25 +0000
Received: by outflank-mailman (input) for mailman id 118444;
 Tue, 27 Apr 2021 12:55:23 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=4dJ3=JY=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lbNFL-0003Lo-Mt
 for xen-devel@lists.xenproject.org; Tue, 27 Apr 2021 12:55:23 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 3bb411cd-11a1-47c0-b1a6-4f2ce7d9945b;
 Tue, 27 Apr 2021 12:55:23 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 5F6FAB190;
 Tue, 27 Apr 2021 12:55:22 +0000 (UTC)
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
X-Inumbo-ID: 3bb411cd-11a1-47c0-b1a6-4f2ce7d9945b
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1619528122; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=s14UwhbZNQTt7lOAtjre/DnjC1roVy/CdMyBN/BeKjU=;
	b=j0ZgO+8VYxR9jYhyKz3/FGOkEndMeocpXtE5n0MpwOczBwQyH4bAc+PGBsMTydViUUedqr
	v/W1obmYpbHqxLSrteNgjyW3Uj1gJqC983XytjkDhGjHdRkF5Mbus7VNZdhqYVuxqS14jK
	3Tok0bQaM9vLrZImIvz/6Bqp0CNTYQE=
Subject: [PATCH 5/7] video/vesa: unmap frame buffer when relinquishing console
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <6d6da76c-ccc8-afa2-bd06-5ae132c354f2@suse.com>
Message-ID: <46af3a52-e0e3-a85e-7957-21bee8877836@suse.com>
Date: Tue, 27 Apr 2021 14:55:21 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <6d6da76c-ccc8-afa2-bd06-5ae132c354f2@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

There's no point in keeping the VA space occupied when no further output
will occur.

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/drivers/video/lfb.c
+++ b/xen/drivers/video/lfb.c
@@ -168,4 +168,5 @@ void lfb_free(void)
     xfree(lfb.lbuf);
     xfree(lfb.text_buf);
     xfree(lfb.line_len);
+    lfb.lfbp.lfb = ZERO_BLOCK_PTR;
 }
--- a/xen/drivers/video/vesa.c
+++ b/xen/drivers/video/vesa.c
@@ -197,5 +197,7 @@ void __init vesa_endboot(bool_t keep)
                    vlfb_info.width * bpp);
         lfb_flush();
         lfb_free();
+        iounmap(lfb);
+        lfb = ZERO_BLOCK_PTR;
     }
 }


