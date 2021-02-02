Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B53C30C327
	for <lists+xen-devel@lfdr.de>; Tue,  2 Feb 2021 16:13:17 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.80592.147463 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l6xMV-0000Vm-9B; Tue, 02 Feb 2021 15:13:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 80592.147463; Tue, 02 Feb 2021 15:13:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l6xMV-0000VP-61; Tue, 02 Feb 2021 15:13:03 +0000
Received: by outflank-mailman (input) for mailman id 80592;
 Tue, 02 Feb 2021 15:13:01 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=licP=HE=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1l6xMT-0000VK-I0
 for xen-devel@lists.xenproject.org; Tue, 02 Feb 2021 15:13:01 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 3be95d28-36fb-4b15-8d37-c9ee70c859b2;
 Tue, 02 Feb 2021 15:13:00 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 81D17AD3E;
 Tue,  2 Feb 2021 15:12:59 +0000 (UTC)
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
X-Inumbo-ID: 3be95d28-36fb-4b15-8d37-c9ee70c859b2
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1612278779; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=Z01t98c2lAkI9ynOf8Dr+sYJGnNib0dWzziTUSbDUgs=;
	b=LOATRheeZQUTPtcAJkoCO1/kZsaCOHwUtfAcaKV5F/63+M+eEsufLPS9Vgb0AHeGZ38AzW
	p9osKcPkDkPe5bqe4AcD58ZskaAKBv+jorjMG31Gy1gXkyvVkbw0E73JNg4h8BBBCJjA7c
	ZVvPn4nFIVxyMKigQX/wRgszmBtu5lU=
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Paul Durrant <paul@xen.org>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 George Dunlap <george.dunlap@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH v2 0/2] IOREQ: mapcache invalidation request sending
 corrections
Message-ID: <0e7265fe-8d89-facb-790d-9232c742c3fa@suse.com>
Date: Tue, 2 Feb 2021 16:13:00 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

I'm sorry it took so long to prepare v2. I had some trouble
figuring a reasonable way to address the main earlier review
requests in what is now patch 2; see there for what changed.
Patch 1 is new.

1: fix waiting for broadcast completion
2: refine when to send mapcache invalidation request

Jan

