Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E97E72F6434
	for <lists+xen-devel@lfdr.de>; Thu, 14 Jan 2021 16:20:17 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.67155.119605 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l04Pa-0008AN-Tt; Thu, 14 Jan 2021 15:19:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 67155.119605; Thu, 14 Jan 2021 15:19:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l04Pa-00089y-Qb; Thu, 14 Jan 2021 15:19:46 +0000
Received: by outflank-mailman (input) for mailman id 67155;
 Thu, 14 Jan 2021 15:19:45 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=J1hy=GR=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1l04PZ-00089t-FR
 for xen-devel@lists.xenproject.org; Thu, 14 Jan 2021 15:19:45 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id a7b5725e-e409-4517-85f1-837ca26d2dcf;
 Thu, 14 Jan 2021 15:19:44 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id CD820AEAB;
 Thu, 14 Jan 2021 15:19:43 +0000 (UTC)
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
X-Inumbo-ID: a7b5725e-e409-4517-85f1-837ca26d2dcf
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1610637583; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=iUMLClWauN3HOi/Q2U8PgmEKtyXCELrr2BCuoWVH+X8=;
	b=s7ihSwOxpctGGw2Upi8gmH1Ky6A0n6Qxpn9brHr6Sv1fyTaX86YAUnKObDknU30jPYSMlx
	uWtq+J9CHfIXncgCj1XSKWfgHzyPgNjCvWvf4fKbEPnH2mTH+u262SvKO6tx+WNJ8MgU42
	Hq/fyAaDkNi86ft2DWopgO9+BSnB+LY=
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH 0/3] gnttab: pin count related adjustments & more
Message-ID: <556c42fd-d7f8-f09f-eb3a-6b724d2b467d@suse.com>
Date: Thu, 14 Jan 2021 16:19:44 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

Getting rid of the literal number has been something I've been
hoping to see happen for perhaps over 10 years, along with
doing away with some unnecessary refusal of operations. The
other two changes are "collateral damage" from doing that
change.

1: gnttab: adjust pin count overflow checks
2: gnttab: consolidate pin-to-status syncing
3: Arm: don't hard-code grant table limits in create_domUs()

Jan

