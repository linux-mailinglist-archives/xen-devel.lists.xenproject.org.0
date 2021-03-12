Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A93E3386DA
	for <lists+xen-devel@lfdr.de>; Fri, 12 Mar 2021 08:54:10 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.96867.183710 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lKccC-00076h-AW; Fri, 12 Mar 2021 07:53:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 96867.183710; Fri, 12 Mar 2021 07:53:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lKccC-00076I-7W; Fri, 12 Mar 2021 07:53:44 +0000
Received: by outflank-mailman (input) for mailman id 96867;
 Fri, 12 Mar 2021 07:53:42 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=F/Rg=IK=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lKcc9-00076B-Uq
 for xen-devel@lists.xenproject.org; Fri, 12 Mar 2021 07:53:42 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 5531c1d5-b7c1-497f-94b5-3f42fe9f39e5;
 Fri, 12 Mar 2021 07:53:41 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 3121CAEAE;
 Fri, 12 Mar 2021 07:53:40 +0000 (UTC)
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
X-Inumbo-ID: 5531c1d5-b7c1-497f-94b5-3f42fe9f39e5
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1615535620; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=RF0NUXMdM1b19HvTDj8cmhyUhkT2qR2UVX4/UdCwo30=;
	b=Fja+yea6BGMQHghgc9Mi5VglzHCTb8jXVEWd/RH5ghHclSsHKzgJudtI5HFtTehUT57G9s
	qTV7QrG0BMRXLRh9akuoPhUaWQT7/sudTHinnz1tNaAuka1lfgYzgvbes+NRn9Hu1rGt7W
	eF/wNQqiMcL8/DY1WG7AY/S3G237I68=
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH v3 0/2][4.15] x86: guest MSR access handling tweaks
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Ian Jackson <iwj@xenproject.org>
Message-ID: <7a84bc56-0045-2111-6888-8db830335ad1@suse.com>
Date: Fri, 12 Mar 2021 08:53:41 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

Addressing review feedback, albeit some of it still looks to be
stalled. But I didn't want to wait longer.

1: PV: conditionally avoid raising #GP for early guest MSR reads
2: AMD: expose HWCR.TscFreqSel to guests

Jan

