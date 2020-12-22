Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 68BA92E071D
	for <lists+xen-devel@lfdr.de>; Tue, 22 Dec 2020 09:15:06 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.57679.101009 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1krcos-0006FH-0t; Tue, 22 Dec 2020 08:14:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 57679.101009; Tue, 22 Dec 2020 08:14:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1krcor-0006Es-TW; Tue, 22 Dec 2020 08:14:57 +0000
Received: by outflank-mailman (input) for mailman id 57679;
 Tue, 22 Dec 2020 08:14:57 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=9/vU=F2=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1krcoq-0006En-Vq
 for xen-devel@lists.xenproject.org; Tue, 22 Dec 2020 08:14:57 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 14bfdcb8-9f27-441a-8237-81120a20c491;
 Tue, 22 Dec 2020 08:14:56 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id B03D9AD2B;
 Tue, 22 Dec 2020 08:14:55 +0000 (UTC)
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
X-Inumbo-ID: 14bfdcb8-9f27-441a-8237-81120a20c491
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1608624895; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=kZqYO32yoJl+M6jmkojCUtPfHQ2G3qp95VKtN5NbHxY=;
	b=V43AgfDXo3UGyjSvrLEWm64SmYCGxNzw9dKv581peUOMuureGcuFWWwtmcxmLkwp48irtN
	7CgLmG1H1DA1XUt7r301XHMDvNUzFhkPClD7crcu4XP8XAFefPJxLspB+ATsDghYza5tKr
	qoaPnsqwaziNbU0BRP1B7VH1HZNcXDI=
Subject: [PATCH v2 1/2] common: map_vcpu_info() cosmetics
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Ian Jackson <ian.jackson@citrix.com>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Stefano Stabellini <sstabellini@kernel.org>
References: <2a08aa31-fdbf-89ee-cd49-813f818b709a@suse.com>
Message-ID: <29514f9a-b630-f66e-286e-8b73fcf4d58a@suse.com>
Date: Tue, 22 Dec 2020 09:14:55 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <2a08aa31-fdbf-89ee-cd49-813f818b709a@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

Use ENXIO instead of EINVAL to cover the two cases of the address not
satisfying the requirements. This will make an issue here better stand
out at the call site.

Also add a missing compat-mode related size check: If the sizes
differed, other code in the function would need changing. Accompany this
by a change to the initial sizeof() expression, tying it to the type of
the variable we're actually after (matching e.g. the alignof() added by
XSA-327).

Signed-off-by: Jan Beulich <jbeulich@suse.com>
Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>

--- a/xen/common/domain.c
+++ b/xen/common/domain.c
@@ -1241,17 +1241,18 @@ int map_vcpu_info(struct vcpu *v, unsign
     struct page_info *page;
     unsigned int align;
 
-    if ( offset > (PAGE_SIZE - sizeof(vcpu_info_t)) )
-        return -EINVAL;
+    if ( offset > (PAGE_SIZE - sizeof(*new_info)) )
+        return -ENXIO;
 
 #ifdef CONFIG_COMPAT
+    BUILD_BUG_ON(sizeof(*new_info) != sizeof(new_info->compat));
     if ( has_32bit_shinfo(d) )
         align = alignof(new_info->compat);
     else
 #endif
         align = alignof(*new_info);
     if ( offset & (align - 1) )
-        return -EINVAL;
+        return -ENXIO;
 
     if ( !mfn_eq(v->vcpu_info_mfn, INVALID_MFN) )
         return -EINVAL;


