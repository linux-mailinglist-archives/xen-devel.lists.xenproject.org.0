Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BB49E2EAAF9
	for <lists+xen-devel@lfdr.de>; Tue,  5 Jan 2021 13:36:09 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.61874.109097 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kwlYa-00041C-Oq; Tue, 05 Jan 2021 12:35:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 61874.109097; Tue, 05 Jan 2021 12:35:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kwlYa-00040n-LU; Tue, 05 Jan 2021 12:35:24 +0000
Received: by outflank-mailman (input) for mailman id 61874;
 Tue, 05 Jan 2021 12:35:23 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=hFWs=GI=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kwlYZ-00040i-BJ
 for xen-devel@lists.xenproject.org; Tue, 05 Jan 2021 12:35:23 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 8c19e502-3099-4af0-a8a1-3bb565af70af;
 Tue, 05 Jan 2021 12:35:21 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 82668AA35;
 Tue,  5 Jan 2021 12:35:20 +0000 (UTC)
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
X-Inumbo-ID: 8c19e502-3099-4af0-a8a1-3bb565af70af
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1609850120; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=pOUeix5rFQpTEf17eVWovsbIjIYjoeNzqwp31IeSKf0=;
	b=pDzQ3/ecuTsBjPOSUP6JnnA3v2vIny3Sk02Uw3FdAwKwm3azb7LH2R+62kZxkkmDt1l9nO
	0nAid4cGGocFsmUVmMfvpljXTDtzpFehq6bkvECA83zXEjVBJAl8dcKSaTeJo6JOOWa9iX
	sFF21rbzDLq49QbKjAB97VFD5QgbjaM=
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH v2 0/2] a tiny bit of header disentangling
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>, Hongyan Xia <hx242@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Message-ID: <b2368cb9-5c9a-3e85-c048-383825cc5efe@suse.com>
Date: Tue, 5 Jan 2021 13:35:19 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

While reviewing Hongyan's "x86/vmap: handle superpages in
vmap_to_mfn()" it became apparent that the interaction of
xen/mm.h and asm/page.h is problematic. Therefore some basic
page size related definitions get moved out of the latter, and
the mfn_t et al ones out of the former, each into new headers.

While various configurations build fine for me with these
changes in place, it's relatively likely that this may break
some more exotic ones. Such breakage ought to be easy to
resolve, so I hope this risk isn't going to be a hindrance of
the changes here going in.

1: include: don't use asm/page.h from common headers
2: mm: split out mfn_t / gfn_t / pfn_t definitions and helpers

Jan

