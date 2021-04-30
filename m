Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AB5F536FC96
	for <lists+xen-devel@lfdr.de>; Fri, 30 Apr 2021 16:39:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.120565.228010 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lcUIW-0001hk-1m; Fri, 30 Apr 2021 14:39:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 120565.228010; Fri, 30 Apr 2021 14:39:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lcUIV-0001hJ-Uw; Fri, 30 Apr 2021 14:39:15 +0000
Received: by outflank-mailman (input) for mailman id 120565;
 Fri, 30 Apr 2021 14:39:14 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=T1Xz=J3=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lcUIU-0001hC-LO
 for xen-devel@lists.xenproject.org; Fri, 30 Apr 2021 14:39:14 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id e5b5e21b-3273-437d-95b3-307bd612ccfa;
 Fri, 30 Apr 2021 14:39:13 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 1267DB03A;
 Fri, 30 Apr 2021 14:39:13 +0000 (UTC)
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
X-Inumbo-ID: e5b5e21b-3273-437d-95b3-307bd612ccfa
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1619793553; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=cxnHY9uHGZKFgWwQkgl02BIYlcwztSONzTXf93EqENc=;
	b=JfY+w0UIbIVsCdGH2BNEJTkQXoBnE6Jm2WUaIndiTsPpNMlF780h6tA1aVTaWCqnv9c1fY
	Z9xJn3fyK/JJwYNQaNAXFIJrlZXa4HUyeBltiq1MXarv8lOxtfHq7eCDslJaRTNJHdl/of
	z00X2eWN8W+TSPJ/yQ/7s9ZdD0/OXns=
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Ian Jackson <iwj@xenproject.org>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH 0/3] firmware/shim: build adjustments
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Message-ID: <19695ffc-34d8-b682-b092-668f872d4e57@suse.com>
Date: Fri, 30 Apr 2021 16:39:12 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

Originally I meant to finally get v2 of "firmware/shim: honor symlinks
during Xen tree setup" sorted. However, the suggestion to use find's
-L option, while a suitable equivalent of the -xtype primary, has the
same drawback: It doesn't distinguish between relative and absolute
symlinks (and we specifically want to skip relative ones). Locally I'm
using '(' -type f -o -lname '/*' ')' now, but -lname again being non-
standard I didn't think it would even be worth submitting. While
looking into that I did notice a few other anomalies, though, which
this series tries to address.

I notice tools/firmware/xen-dir/ isn't included in "X86 ARCHITECTURE".
I wonder whether that should be added.

1: update linkfarm exclusions
2: drop XEN_CONFIG_EXPERT uses
3: UNSUPPORTED=n

Jan

