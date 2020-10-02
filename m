Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BE17B28109A
	for <lists+xen-devel@lfdr.de>; Fri,  2 Oct 2020 12:31:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1849.5584 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kOIKh-0004wU-HW; Fri, 02 Oct 2020 10:30:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1849.5584; Fri, 02 Oct 2020 10:30:35 +0000
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
	id 1kOIKh-0004w5-Ds; Fri, 02 Oct 2020 10:30:35 +0000
Received: by outflank-mailman (input) for mailman id 1849;
 Fri, 02 Oct 2020 10:30:33 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=5pZ8=DJ=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kOIKf-0004w0-Bi
 for xen-devel@lists.xenproject.org; Fri, 02 Oct 2020 10:30:33 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id ab73ea1a-e6fd-4233-9048-6f176f74fd74;
 Fri, 02 Oct 2020 10:30:32 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id E20C1ACC6;
 Fri,  2 Oct 2020 10:30:31 +0000 (UTC)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=5pZ8=DJ=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
	id 1kOIKf-0004w0-Bi
	for xen-devel@lists.xenproject.org; Fri, 02 Oct 2020 10:30:33 +0000
X-Inumbo-ID: ab73ea1a-e6fd-4233-9048-6f176f74fd74
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id ab73ea1a-e6fd-4233-9048-6f176f74fd74;
	Fri, 02 Oct 2020 10:30:32 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1601634632;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=XdsMYE0BREfIJTOQGEmjhjAj/gWEweIFrPxOUmgOUfI=;
	b=KIGgJtKXlcAxhSCjifoOrdFpz5YkynvtwE2vY9+5UG0ZKBmflayOcb6mVzk8VbLblLfKgy
	4RMozPTkVTVTtk2lm4sTRBUXdrFYmhT8c8w8cAzB9f/ydWZCtJcwgkCzKWMJrLmAKEKeVj
	MDUegCWRnxAoTc05UXWXFK0GItILIk8=
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id E20C1ACC6;
	Fri,  2 Oct 2020 10:30:31 +0000 (UTC)
Subject: [PATCH 1/3] x86/vLAPIC: don't leak regs page from vlapic_init() upon
 error
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <1a55f2f0-f0aa-4a33-1219-1091ed9150df@suse.com>
Message-ID: <b437de21-f108-c30e-4e0c-1137ad7d99fe@suse.com>
Date: Fri, 2 Oct 2020 12:30:34 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <1a55f2f0-f0aa-4a33-1219-1091ed9150df@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

Fixes: 8a981e0bf25e ("Make map_domain_page_global fail")
Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/arch/x86/hvm/vlapic.c
+++ b/xen/arch/x86/hvm/vlapic.c
@@ -1625,6 +1625,7 @@ int vlapic_init(struct vcpu *v)
         vlapic->regs = __map_domain_page_global(vlapic->regs_page);
         if ( vlapic->regs == NULL )
         {
+            free_domheap_page(vlapic->regs_page);
             dprintk(XENLOG_ERR, "map vlapic regs error: %d/%d\n",
                     v->domain->domain_id, v->vcpu_id);
             return -ENOMEM;


