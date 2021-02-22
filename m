Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 86E8F321488
	for <lists+xen-devel@lfdr.de>; Mon, 22 Feb 2021 11:56:13 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.87920.165161 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lE8si-00042l-Ss; Mon, 22 Feb 2021 10:56:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 87920.165161; Mon, 22 Feb 2021 10:56:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lE8si-00042M-Pm; Mon, 22 Feb 2021 10:56:00 +0000
Received: by outflank-mailman (input) for mailman id 87920;
 Mon, 22 Feb 2021 10:55:58 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=6bXc=HY=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lE8sg-00042H-Kq
 for xen-devel@lists.xenproject.org; Mon, 22 Feb 2021 10:55:58 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 00da6c20-e4f0-4600-b025-ae603449b97f;
 Mon, 22 Feb 2021 10:55:57 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id EB0CCACCF;
 Mon, 22 Feb 2021 10:55:56 +0000 (UTC)
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
X-Inumbo-ID: 00da6c20-e4f0-4600-b025-ae603449b97f
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1613991357; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=8JXC8hn+A4ki/3rMcvz1kCsidmRm0ApTLUBjTGwtAHg=;
	b=ixiyzA2nnDfiI5KzAcDG44A6D9sqE6q/KFOdxyozncflSud0ssLYtAA7lM8VRAuBP/yJ0+
	UhKYF+iEcywOd6/Sf9fVd6FT4DFFjSW56KvqpY+fqF2vzC3xKPxtoiKaZTXUcpnFK3b4Ih
	W+zmWZR/CFsbXAxV+kUe7SzSCapgz28=
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Ian Jackson <iwj@xenproject.org>, George Dunlap <george.dunlap@citrix.com>,
 Kevin Tian <kevin.tian@intel.com>, Jun Nakajima <jun.nakajima@intel.com>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH v3 0/2] VMX: apic access page handling adjustments
Message-ID: <4731a3a3-906a-98ac-11ba-6a0723903391@suse.com>
Date: Mon, 22 Feb 2021 11:55:56 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

The latter of the two changes was on my mental todo list for a
very long time. With Julien reporting a problem with the handling
of this page, I finally felt urged to make a patch. As it turns
out, for addressing this problem only the first of the now split
pages is needed, and the second can be further discussed and
considered for 4.16.

1: delay p2m insertion of APIC access page
2: use a single, global APIC access page

Jan

