Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D1D6632EF01
	for <lists+xen-devel@lfdr.de>; Fri,  5 Mar 2021 16:37:14 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.93846.177265 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lICUx-0005zY-Uu; Fri, 05 Mar 2021 15:36:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 93846.177265; Fri, 05 Mar 2021 15:36:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lICUx-0005z9-Rg; Fri, 05 Mar 2021 15:36:15 +0000
Received: by outflank-mailman (input) for mailman id 93846;
 Fri, 05 Mar 2021 15:36:14 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=IQfx=ID=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lICUw-0005z4-Ae
 for xen-devel@lists.xenproject.org; Fri, 05 Mar 2021 15:36:14 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 2e24bb74-7643-4cc7-a9fb-4ec94f7ea29b;
 Fri, 05 Mar 2021 15:36:13 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id AF84DAD72;
 Fri,  5 Mar 2021 15:36:12 +0000 (UTC)
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
X-Inumbo-ID: 2e24bb74-7643-4cc7-a9fb-4ec94f7ea29b
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1614958572; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=LKMg3/gTyoAPIQ6oDN88wxQX2CgJkK/YgqsHUdKYIxY=;
	b=GglIZltPpQH5hNeIVfT4p8GjoAHovwneZ0k2ypYVMmXlr2azCbs8C0/mFjDceoiG0u5PDG
	ATageAbctyT4eMUdr1TrELOQ5Q0eiQaXq7UD9Jre7G4Em7DL/t1Ppd3cSJ/AKFTrjOQTc3
	bB6EZ1BnARzAGEsADF4iNUeiqKjMLjY=
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Tim Deegan <tim@xen.org>, George Dunlap <george.dunlap@citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Ian Jackson <iwj@xenproject.org>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH 0/2][4.15?] x86/shadow: further refinements to "fast fault
 path" suppression
Message-ID: <d0190313-921f-7cbc-4659-9a79f6299fab@suse.com>
Date: Fri, 5 Mar 2021 16:36:12 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

Andrew points out that 'x86/shadow: suppress "fast fault path"
optimization without reserved bits' assumes firm knowledge of the
physical machine's address width. When we run virtualized
ourselves, we can't reasonably assume that we do, the more that
the property may change as we may get migrated.

Since we want to further refine this logic anyway, I thought I'd
also include the other change that I've previously mentioned, at
least for consideration whether to take for 4.15. This reduces
the performance impact (albeit perhaps only for very large or
exotic guests) that the earlier patch has.

1: suppress "fast fault path" optimization when running virtualized
2: encode full GFN in magic MMIO entries

Jan

