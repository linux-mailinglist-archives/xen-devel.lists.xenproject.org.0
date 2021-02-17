Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2861531D7A5
	for <lists+xen-devel@lfdr.de>; Wed, 17 Feb 2021 11:43:57 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.86199.161597 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lCKIC-0008Ua-Um; Wed, 17 Feb 2021 10:42:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 86199.161597; Wed, 17 Feb 2021 10:42:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lCKIC-0008UE-Ri; Wed, 17 Feb 2021 10:42:48 +0000
Received: by outflank-mailman (input) for mailman id 86199;
 Wed, 17 Feb 2021 10:42:47 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=XFXw=HT=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lCKIB-0008U9-Hy
 for xen-devel@lists.xenproject.org; Wed, 17 Feb 2021 10:42:47 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id c19b84b1-a893-48f8-84af-fcd536900b0f;
 Wed, 17 Feb 2021 10:42:46 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 7E84DB154;
 Wed, 17 Feb 2021 10:42:45 +0000 (UTC)
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
X-Inumbo-ID: c19b84b1-a893-48f8-84af-fcd536900b0f
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1613558565; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=JptSK0y1QceLM0NpaVhOXeL+/6/LV1pc12AWn8xXNy0=;
	b=ZFQ4Q64Tt7EQ1Lx3hjCDtSX7YzoK1/23jigqMw3IGuo2nz2+cCoNUXxQK0CI33+LQD40tO
	IUdg1h4Oj2OERY87hmGDDkg5yiWAW/tfOoVT+/uYy0JS2V6s7gDa0DsSJjHn0BUvw71Xi/
	b2CtQx1tP1zkSbgydpsFL/EXW1HxAlA=
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH 0/3] gnttab: misc fixes
Message-ID: <156559d5-853a-5bb9-942b-f623627e0907@suse.com>
Date: Wed, 17 Feb 2021 11:42:44 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

Patches 1 and 2 clearly are intended for 4.15; patch 3 is possibly
controversial (along the lines of similar relaxation proposed for
other (sub-)hypercalls), and hence unlikely to be a candidate as
well.

1: never permit mapping transitive grants
2: bypass IOMMU (un)mapping when a domain is (un)mapping its own grant
3: GTF_sub_page is a v2-only flag

Jan

