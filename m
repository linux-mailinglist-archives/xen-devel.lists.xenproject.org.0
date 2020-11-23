Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D58B92C080C
	for <lists+xen-devel@lfdr.de>; Mon, 23 Nov 2020 14:13:02 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.34233.65117 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1khBeC-0005nM-Ik; Mon, 23 Nov 2020 13:12:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 34233.65117; Mon, 23 Nov 2020 13:12:48 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1khBeC-0005mx-Fb; Mon, 23 Nov 2020 13:12:48 +0000
Received: by outflank-mailman (input) for mailman id 34233;
 Mon, 23 Nov 2020 13:12:47 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=qJrE=E5=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1khBeB-0005ms-2T
 for xen-devel@lists.xenproject.org; Mon, 23 Nov 2020 13:12:47 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 399ceed5-0165-4fbc-84cf-4abea1a741e3;
 Mon, 23 Nov 2020 13:12:46 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 65E4EACD5;
 Mon, 23 Nov 2020 13:12:45 +0000 (UTC)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=qJrE=E5=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
	id 1khBeB-0005ms-2T
	for xen-devel@lists.xenproject.org; Mon, 23 Nov 2020 13:12:47 +0000
X-Inumbo-ID: 399ceed5-0165-4fbc-84cf-4abea1a741e3
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 399ceed5-0165-4fbc-84cf-4abea1a741e3;
	Mon, 23 Nov 2020 13:12:46 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1606137165; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=twROV6lJ9RY5ZXELEEcNrUSlo6tUc/6IjVY7g9rYQ58=;
	b=AFQ4R5v6o/2Td25yy0j5VSEy0PImSnoJ6mWYbpDPdlQocz5dVBTHcFMO6of6ghoPcAXU0+
	ldJ1/HKy/QA/R1qDxD365bCmbOj9eozU1NSNiOuR8sZrSXNVSt9xjs0ukls4C1pLm55zxE
	5oFYOEOW9aYneSLtrvlqn9wgSbLPhj4=
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 65E4EACD5;
	Mon, 23 Nov 2020 13:12:45 +0000 (UTC)
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH v2 0/3] ns16550: #ifdef-ary
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>, Rahul Singh <Rahul.Singh@arm.com>
Message-ID: <96115b2b-c104-e566-2368-6a2439d2c988@suse.com>
Date: Mon, 23 Nov 2020 14:12:44 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

1: move PCI arrays next to the function using them
2: "com<N>=" command line options are x86-specific
3: drop stray "#ifdef CONFIG_HAS_PCI"

Jan

