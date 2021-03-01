Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BBD5B32792B
	for <lists+xen-devel@lfdr.de>; Mon,  1 Mar 2021 09:27:46 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.91346.172621 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lGdtk-0000tD-9e; Mon, 01 Mar 2021 08:27:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 91346.172621; Mon, 01 Mar 2021 08:27:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lGdtk-0000so-6D; Mon, 01 Mar 2021 08:27:24 +0000
Received: by outflank-mailman (input) for mailman id 91346;
 Mon, 01 Mar 2021 08:27:23 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=m81q=H7=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lGdtj-0000sj-14
 for xen-devel@lists.xenproject.org; Mon, 01 Mar 2021 08:27:23 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id c046ffd3-3237-4b60-a3e7-de7c05e65e54;
 Mon, 01 Mar 2021 08:27:22 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 661C7AA4F;
 Mon,  1 Mar 2021 08:27:21 +0000 (UTC)
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
X-Inumbo-ID: c046ffd3-3237-4b60-a3e7-de7c05e65e54
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1614587241; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=dNADWKwQDdlSEZj5GL9Dlcu8bOaDjERraCVrAxpqxjA=;
	b=ufw7JE5ieSHRZ2kmX0atf8fpV1NsJ+MV345ux35KMVqr183mYu2H/8iNjRog3AaHnHpmrI
	XJWxVSCsYvPcZHVDyS6iYmfUCcuxc8a7J5OFnXk35H28i8FkVMnVo8+BEHPYCdJoZM2SSc
	Jrr6WFR1KEHycU+jwSk25929NX4OdFU=
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Connor Davis <connojdavis@gmail.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Dario Faggioli
 <dfaggioli@suse.com>, Ian Jackson <iwj@xenproject.org>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH 0/2][4.15?] fix build when NR_CPUS == 1
Message-ID: <ad59eaf9-747c-f60e-16b7-121c9f86a1e0@suse.com>
Date: Mon, 1 Mar 2021 09:27:20 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

While we've long done away with CONFIG_SMP, we still allow
CONFIG_NR_CPUS to be set to 1. Hence at least randconfig builds
may fail, and the first of the two issues addressed was actually
observed in the RISC-V bring-up work. I didn't check whether Arm
would also have issues like these.

1: sched: fix build when NR_CPUS == 1
2: x86: fix build when NR_CPUS == 1

Jan

