Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E7AE356ED8
	for <lists+xen-devel@lfdr.de>; Wed,  7 Apr 2021 16:35:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.106707.204027 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lU9H7-0000B0-L2; Wed, 07 Apr 2021 14:35:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 106707.204027; Wed, 07 Apr 2021 14:35:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lU9H7-0000Aa-Hk; Wed, 07 Apr 2021 14:35:21 +0000
Received: by outflank-mailman (input) for mailman id 106707;
 Wed, 07 Apr 2021 14:35:19 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=fjXx=JE=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lU9H5-0000AV-Eh
 for xen-devel@lists.xenproject.org; Wed, 07 Apr 2021 14:35:19 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 3d60c8d4-34cc-4084-8833-058683277948;
 Wed, 07 Apr 2021 14:35:18 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 50A17B160;
 Wed,  7 Apr 2021 14:35:17 +0000 (UTC)
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
X-Inumbo-ID: 3d60c8d4-34cc-4084-8833-058683277948
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1617806117; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=WFSEL4nRth0J69lPxEZrlqbP01zO3uFSQEnfw8shlIo=;
	b=cHP0axwJVHRK0SRVpY7Nud60wxboW1m0zwpaLcbLxFGXiBFxksdar6zTvl2laCAXLtxbKB
	vDkSa6WinQI8eBBGiao0Ps02a1f4i7T86w+JqFDWOAd2V+hsTnyg2/Ad95iRu/PvGsSPEZ
	6hmN0RfyeQvDK6mnbsDivSkyKheV7Bs=
Cc: Juergen Gross <jgross@suse.com>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Konrad Wilk <konrad.wilk@oracle.com>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH 0/3] xen-pciback: a fix, a workaround, and some simplification
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Message-ID: <d2ac85d9-0ad1-71a3-fa3b-b99340b3204d@suse.com>
Date: Wed, 7 Apr 2021 16:35:16 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

The first change completes a several years old but still incomplete
change. As mentioned there, reverting the original change may also
be an option. The second change works around some odd libxl behavior,
as described in [1]. As per a response to that mail addressing the
issue in libxl may also be possible, but it's not clear to me who
would get to doing so at which point in time. Hence the kernel side
alternative is being proposed here. The third change is some
simplification that I noticed would be possible while doing the
other work here.

As to Konrad being on the Cc list: I find it puzzling that he's
listed under "XEN PCI SUBSYSTEM", but pciback isn't considered part
of this.

1: redo VF placement in the virtual topology
2: reconfigure also from backend watch handler
3: simplify vpci's find hook

Jan

[1] https://lists.xen.org/archives/html/xen-devel/2021-03/msg00956.html

