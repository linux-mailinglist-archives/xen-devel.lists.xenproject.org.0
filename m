Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A6E45358316
	for <lists+xen-devel@lfdr.de>; Thu,  8 Apr 2021 14:18:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.107237.204992 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lUTbl-0003aE-OH; Thu, 08 Apr 2021 12:18:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 107237.204992; Thu, 08 Apr 2021 12:18:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lUTbl-0003Zs-KM; Thu, 08 Apr 2021 12:18:01 +0000
Received: by outflank-mailman (input) for mailman id 107237;
 Thu, 08 Apr 2021 12:17:59 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=e/uL=JF=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lUTbj-0003ZO-T4
 for xen-devel@lists.xenproject.org; Thu, 08 Apr 2021 12:17:59 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 90761739-f7d3-4dd4-80d1-076cba7ebca2;
 Thu, 08 Apr 2021 12:17:59 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 4EF1FB090;
 Thu,  8 Apr 2021 12:17:58 +0000 (UTC)
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
X-Inumbo-ID: 90761739-f7d3-4dd4-80d1-076cba7ebca2
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1617884278; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=QnmG9k8Zw1WTHYZkvL1RP6b1ZHGImCYwyft4ku4C/6U=;
	b=jARlKgxxgKd+LvB/iXqHR4JKLtrBD7/3V9FIdXlHV+vniPp/MLLCibRxuHF+WQxNFcZbdp
	SzojpNL3PZBmLmiHV7drDOaPWnEAJXsTNHahdvT7+/kC2vPdpEym1XinF+WcujsqSjmbSl
	5s1M7h/eHRv274C0zjtxNc5RT3sLpM8=
Subject: [PATCH 03/11] x86/MCE: avoid effectively open-coding xmalloc_array()
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <a3fef3b0-c9f3-208e-3728-62ca9cff70ba@suse.com>
Message-ID: <47101cea-a856-3921-dd19-89ce766aaaeb@suse.com>
Date: Thu, 8 Apr 2021 14:17:58 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.0
MIME-Version: 1.0
In-Reply-To: <a3fef3b0-c9f3-208e-3728-62ca9cff70ba@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

There is a difference in generated code: xmalloc_bytes() forces
SMP_CACHE_BYTES alignment. I think we not only don't need this here, but
actually don't want it.

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/arch/x86/cpu/mcheck/mctelem.c
+++ b/xen/arch/x86/cpu/mcheck/mctelem.c
@@ -345,7 +345,7 @@ void __init mctelem_init(unsigned int da
 
 	if ((mctctl.mctc_elems = xmalloc_array(struct mctelem_ent,
 	    MC_NENT)) == NULL ||
-	    (datarr = xmalloc_bytes(MC_NENT * datasz)) == NULL) {
+	    (datarr = xmalloc_array(char, MC_NENT * datasz)) == NULL) {
 		xfree(mctctl.mctc_elems);
 		printk("Allocations for MCA telemetry failed\n");
 		return;


