Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B4243402F7
	for <lists+xen-devel@lfdr.de>; Thu, 18 Mar 2021 11:13:21 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.98866.187812 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lMpdY-0007GI-14; Thu, 18 Mar 2021 10:12:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 98866.187812; Thu, 18 Mar 2021 10:12:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lMpdX-0007Ft-Ta; Thu, 18 Mar 2021 10:12:15 +0000
Received: by outflank-mailman (input) for mailman id 98866;
 Thu, 18 Mar 2021 10:12:13 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=gYlD=IQ=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lMpdV-0007FV-Qw
 for xen-devel@lists.xenproject.org; Thu, 18 Mar 2021 10:12:13 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 02c3b7f5-1177-430f-a102-acbb10363387;
 Thu, 18 Mar 2021 10:12:12 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 89C5EAC1E;
 Thu, 18 Mar 2021 10:12:11 +0000 (UTC)
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
X-Inumbo-ID: 02c3b7f5-1177-430f-a102-acbb10363387
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1616062331; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=lit+KV0NKZXvfbZ/W+r7zpLORCmoXtveGaFf5dpAd9U=;
	b=HlnpA/241fEptfr0UKjOpvqqKa93iU1m4lA/zGOjfN0271/T6OMMgtPIePOxFHpB/YsWZ5
	2Wm3KhBGqox8u4l0q3QTb7MIzXXVwDiK59727XLHxDbl0YacnJoR68VLFJmfquoBQlPPz1
	EeDmRf4tBdyMxwtLpdwPRv1kvIFC7TY=
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Kevin Tian <kevin.tian@intel.com>, Ian Jackson <iwj@xenproject.org>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH 0/4][4.15?] VT-d: mostly S3 related corrections
Message-ID: <c19fe2b5-b682-374c-d30f-83fb8b367286@suse.com>
Date: Thu, 18 Mar 2021 11:12:11 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

None of these are regressions afaict, so considering how late we are
in the 4.15 process, I can see reasons to not take any of these. All
of them are backporting candidates though, imo.

1: correct off-by-1 in number-of-IOMMUs check
2: leave FECTL write to vtd_resume()
3: re-order register restoring in vtd_resume()
4: restore flush hooks when disabling qinval

Jan

