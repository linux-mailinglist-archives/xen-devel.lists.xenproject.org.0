Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F6CD2A6144
	for <lists+xen-devel@lfdr.de>; Wed,  4 Nov 2020 11:12:54 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.19004.44196 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kaFmJ-0005Uc-St; Wed, 04 Nov 2020 10:12:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 19004.44196; Wed, 04 Nov 2020 10:12:31 +0000
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
	id 1kaFmJ-0005UD-Po; Wed, 04 Nov 2020 10:12:31 +0000
Received: by outflank-mailman (input) for mailman id 19004;
 Wed, 04 Nov 2020 10:12:30 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=gnt3=EK=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kaFmI-0005U5-Al
 for xen-devel@lists.xenproject.org; Wed, 04 Nov 2020 10:12:30 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 61f7ed7a-541d-45b3-92bd-abbb56f19f3d;
 Wed, 04 Nov 2020 10:12:28 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id E2976AC77;
 Wed,  4 Nov 2020 10:12:27 +0000 (UTC)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=gnt3=EK=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
	id 1kaFmI-0005U5-Al
	for xen-devel@lists.xenproject.org; Wed, 04 Nov 2020 10:12:30 +0000
X-Inumbo-ID: 61f7ed7a-541d-45b3-92bd-abbb56f19f3d
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id 61f7ed7a-541d-45b3-92bd-abbb56f19f3d;
	Wed, 04 Nov 2020 10:12:28 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1604484748;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=nYkgYjJKItVDm4UZe+Prw4nKA6Okw2VxbQyIPXk2Tr4=;
	b=IYzY6CJlH94WeCAsa5YD9hwvFTHMbh/v2n11VzME6Qj39/lJIzZLZPRyfVhqOlP31lFYn8
	Dx13DPYwsR9nKepybQaqdwTOHJfDgUzmgwMevB+Oht+ODfH6HQKvBDf/Z6XDR7mwDMhSEg
	yzoPpN+J25h78griATtahayjoZdPLss=
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id E2976AC77;
	Wed,  4 Nov 2020 10:12:27 +0000 (UTC)
From: Jan Beulich <jbeulich@suse.com>
Subject: preparations for 4.14.1
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: George Dunlap <george.dunlap@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Ian Jackson <ian.jackson@citrix.com>, Wei Liu <wl@xen.org>,
 Anthony Perard <anthony.perard@citrix.com>, Julien Grall <julien@xen.org>
Message-ID: <5aa0791a-db56-8f5a-51a1-5863748ce7f1@suse.com>
Date: Wed, 4 Nov 2020 11:12:27 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

All,

the release is due in a couple of weeks time. Please point out
backports you find missing from the respective staging branch,
but which you consider relevant. (Ian: Please double check
there are indeed no tools side backports needed here.)

Julien, Stefano, on the Arm side I'd like to ask for

5d45ecabe3c0 xen/arm64: force gcc 10+ to always inline generic atomics helpers

just like I did when sending the respective 4.13.2 / 4.12.4
mail. Is there a particular reason it wasn't put in?

Jan

