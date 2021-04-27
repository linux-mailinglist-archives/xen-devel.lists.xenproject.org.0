Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CDDC36C672
	for <lists+xen-devel@lfdr.de>; Tue, 27 Apr 2021 14:53:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.118424.224528 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lbNDE-0002rx-9K; Tue, 27 Apr 2021 12:53:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 118424.224528; Tue, 27 Apr 2021 12:53:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lbNDE-0002rY-6O; Tue, 27 Apr 2021 12:53:12 +0000
Received: by outflank-mailman (input) for mailman id 118424;
 Tue, 27 Apr 2021 12:53:10 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=4dJ3=JY=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lbNDC-0002rS-6q
 for xen-devel@lists.xenproject.org; Tue, 27 Apr 2021 12:53:10 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 2f82e92e-5cd4-4e22-a8aa-3c780d14dad7;
 Tue, 27 Apr 2021 12:53:09 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id BFE99B19D;
 Tue, 27 Apr 2021 12:53:08 +0000 (UTC)
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
X-Inumbo-ID: 2f82e92e-5cd4-4e22-a8aa-3c780d14dad7
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1619527988; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=5HO69LOYF/q+tMqUDzvDRQvMkLc5+o3wKO8eXoOtaQw=;
	b=ZcDjdrS+nrZcOBJjf3H1DMDCmoQXr+fLdQGL/aJRjASAKoL2G1J9w6sd678pAZe6s3LfLZ
	PkAdcOlKWqtOmN/zGwbo1Pd8eD8c2iHT+HYUBm+RYzPM+jA9c0gFM0Ck/PzpHNvcm2ZzQh
	QL2GNmZgX2Tvr45++JbfNeSjPkPkzYo=
Subject: [PATCH 1/7] x86: correct comment about alternatives ordering
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <6d6da76c-ccc8-afa2-bd06-5ae132c354f2@suse.com>
Message-ID: <e6f362b3-2339-c5cb-362b-743271dbe826@suse.com>
Date: Tue, 27 Apr 2021 14:53:08 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <6d6da76c-ccc8-afa2-bd06-5ae132c354f2@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

Unlike Linux, Xen has never (so far) used alternatives patching for
memcpy() or memset(), even less such utilizing multiple alternatives.
Correct the Linux-inherited comment to match reality.

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/arch/x86/alternative.c
+++ b/xen/arch/x86/alternative.c
@@ -194,8 +194,7 @@ static void init_or_livepatch _apply_alt
     /*
      * The scan order should be from start to end. A later scanned
      * alternative code can overwrite a previous scanned alternative code.
-     * Some kernel functions (e.g. memcpy, memset, etc) use this order to
-     * patch code.
+     * Some code (e.g. ALTERNATIVE_2()) relies on this order of patching.
      *
      * So be careful if you want to change the scan order to any other
      * order.


