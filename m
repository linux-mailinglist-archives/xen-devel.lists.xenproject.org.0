Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C5A8308A29
	for <lists+xen-devel@lfdr.de>; Fri, 29 Jan 2021 17:18:30 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.78282.142352 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l5WTT-0006ls-Da; Fri, 29 Jan 2021 16:18:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 78282.142352; Fri, 29 Jan 2021 16:18:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l5WTT-0006lT-9q; Fri, 29 Jan 2021 16:18:19 +0000
Received: by outflank-mailman (input) for mailman id 78282;
 Fri, 29 Jan 2021 16:18:18 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Mmvf=HA=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1l5WTS-0006lN-5M
 for xen-devel@lists.xenproject.org; Fri, 29 Jan 2021 16:18:18 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 2b871c59-35ee-4a90-a9ac-9fed7edcb252;
 Fri, 29 Jan 2021 16:18:16 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 13600B040;
 Fri, 29 Jan 2021 16:18:16 +0000 (UTC)
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
X-Inumbo-ID: 2b871c59-35ee-4a90-a9ac-9fed7edcb252
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1611937096; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=4tl2B4/R4z5tsFJOc+Ea0sZDAe96QRFUT5zDSpZqvLE=;
	b=py4LSeWjkSIQf64rZGGTBjmloFSGe5GYUc83zF9e3a1IUQlp84J0hv+4khqBK2GZRr93zX
	MhOcBzCJ0ZLJK0fgwyQdSkCajHepXQl/OLGMRKOxyF6EXx02+b17QUav/Lubf+/vWf4M+N
	xXtcyvMEQVL62LfC1XAgxPufmxaA3PU=
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH 0/2] x86/time: calibration rendezvous adjustments
Message-ID: <35443b5a-1410-7099-a937-e9f537bbe989@suse.com>
Date: Fri, 29 Jan 2021 17:18:16 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

The 2nd patch (RFC for now) is meant to address a regression
reported on the list under "Problems with APIC on versions 4.9
and later (4.8 works)". In the course of analyzing output from
a debugging patch I ran into another anomaly again, which I
thought I should finally try to address. Hence patch 1.

1: change initiation of the calibration timer
2: don't move TSC backwards in time_calibration_tsc_rendezvous()

Jan

