Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B26432E51D
	for <lists+xen-devel@lfdr.de>; Fri,  5 Mar 2021 10:44:04 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.93547.176495 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lI6zv-0008UG-EB; Fri, 05 Mar 2021 09:43:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 93547.176495; Fri, 05 Mar 2021 09:43:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lI6zv-0008Tr-Ai; Fri, 05 Mar 2021 09:43:51 +0000
Received: by outflank-mailman (input) for mailman id 93547;
 Fri, 05 Mar 2021 09:43:49 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=IQfx=ID=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lI6zt-0008Tm-Hu
 for xen-devel@lists.xenproject.org; Fri, 05 Mar 2021 09:43:49 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 3bba016d-431e-40b1-a5ea-bbb28c462f9a;
 Fri, 05 Mar 2021 09:43:48 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id DF80AAC54;
 Fri,  5 Mar 2021 09:43:47 +0000 (UTC)
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
X-Inumbo-ID: 3bba016d-431e-40b1-a5ea-bbb28c462f9a
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1614937428; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=kp70BljORx7nBpfqdLEHZzzKMKQGsMpWt26fzlCub88=;
	b=nhVt5EvVTTX/gbT0dfHucX1mw9rM+f+XpBMcIIkof+JDqDwLrc1JiKR86aat1zAJALKGEx
	tbIWU7X8oW5zzyla3MYUjON9qxO5T5WNIJMnF4GsulsdDI7fpCF8SA0lCuP03OSrLGXN3U
	YdlKdZLJguQJwV5UVSVbl9NjS7ZRPPc=
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Ian Jackson <iwj@xenproject.org>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH v2 0/2][4.15] x86: guest MSR access handling tweaks
Message-ID: <f5f17207-b601-2909-8a5c-55276e734272@suse.com>
Date: Fri, 5 Mar 2021 10:43:41 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

The first patch was stripped of its WRMSR adjustments, albeit I'm
not convinced we'll get away with this - see there. v2 there also
addresses further comments. The 2nd patch is new here, but the
need for something like this was mentioned in v1 already.

1: PV: conditionally avoid raising #GP for early guest MSR reads
2: AMD: expose HWCR.TscFreqSel to guests

Jan

