Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B0E9136C671
	for <lists+xen-devel@lfdr.de>; Tue, 27 Apr 2021 14:53:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.118415.224516 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lbNC6-0002jJ-R9; Tue, 27 Apr 2021 12:52:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 118415.224516; Tue, 27 Apr 2021 12:52:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lbNC6-0002iu-Nn; Tue, 27 Apr 2021 12:52:02 +0000
Received: by outflank-mailman (input) for mailman id 118415;
 Tue, 27 Apr 2021 12:52:01 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=4dJ3=JY=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lbNC5-0002ip-JH
 for xen-devel@lists.xenproject.org; Tue, 27 Apr 2021 12:52:01 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 462ed3de-a0a4-4632-9a81-72e20029f8b5;
 Tue, 27 Apr 2021 12:52:00 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id D0F24B190;
 Tue, 27 Apr 2021 12:51:59 +0000 (UTC)
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
X-Inumbo-ID: 462ed3de-a0a4-4632-9a81-72e20029f8b5
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1619527919; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=Gbc0X2QS/6HUJBiSa/FTfSmvRkFaJfU/nMdzne667GI=;
	b=o/uqEfGJUDRAnec3Bvbq4H81ePpSu18IluizQyp6+6QFl5i4KneyFuXxytF54R95ruxesL
	EpjakhDIF8p3FFRVnHuTDd02R8Rsr1IURyiCukcxqD5HBGmsfOwYzRwyQBnKdFvg7y9xDB
	D+y4bE4zoir7G6guqM7LYBmiyvp61ZI=
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH 0/7] x86: memcpy() / memset() (non-)ERMS flavors plus fallout
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Message-ID: <6d6da76c-ccc8-afa2-bd06-5ae132c354f2@suse.com>
Date: Tue, 27 Apr 2021 14:51:59 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

While the performance varies quite a bit on older (pre-ERMS) and
newer (ERMS) hardware, so far we've been going with just a single
flavor of these two functions, and oddly enough with ones not
consistent with one another. Using plain memcpy() / memset() on
MMIO (video frame buffer) is generally okay, but the ERMS variant
of memcpy() turned out to regress (boot) performance in a way
easily visible to the human eye. Hence as a prerequisite step
this series switches the frame buffer (and VGA) mapping to be
write-combining independent of firmware arrangements (of MTRRs
in particular).

1: x86: correct comment about alternatives ordering
2: x86: introduce ioremap_wc()
3: x86: re-work memset()
4: x86: re-work memcpy()
5: video/vesa: unmap frame buffer when relinquishing console
6: video/vesa: drop "vesa-mtrr" command line option
7: video/vesa: adjust (not just) command line option handling

Side note: While strictly speaking the xen/drivers/video/ changes
fall under REST maintainership, with that code getting built for
x86 only I'm restricting Cc-s to x86 maintainers.

Jan

