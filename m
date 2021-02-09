Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DC758314F83
	for <lists+xen-devel@lfdr.de>; Tue,  9 Feb 2021 13:54:16 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.83219.154297 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l9SWd-0007YX-Jj; Tue, 09 Feb 2021 12:53:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 83219.154297; Tue, 09 Feb 2021 12:53:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l9SWd-0007Y8-GN; Tue, 09 Feb 2021 12:53:51 +0000
Received: by outflank-mailman (input) for mailman id 83219;
 Tue, 09 Feb 2021 12:53:50 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=BG3/=HL=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1l9SWc-0007Y3-IE
 for xen-devel@lists.xenproject.org; Tue, 09 Feb 2021 12:53:50 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 7051a01d-c083-4310-826b-3ebb13ffd65e;
 Tue, 09 Feb 2021 12:53:49 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 16D30AD6A;
 Tue,  9 Feb 2021 12:53:48 +0000 (UTC)
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
X-Inumbo-ID: 7051a01d-c083-4310-826b-3ebb13ffd65e
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1612875228; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=Xz6SEvYbpCIel5pRUo0p4mEoQEJzeymHCtV40pnxtHo=;
	b=mPpH3gVnMlhRoqlew3FuZ+8Yc0SppIiRiIjukJWGMOVwWLn9+HNk38eF8di/GOj7gJd3UH
	brVdcAqtG9HfRJFU/YEJor53qrOumR6RvhR7qG+Bs16Uj2jHC69KdERG34FJUgwdn54PIQ
	qVX74kblIKXqB8/Ts2SP+WI3YbTdRJg=
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH v3 0/4] x86/time: calibration rendezvous adjustments
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Claudemir Todo Bom <claudemir@todobom.com>, Ian Jackson <iwj@xenproject.org>
Message-ID: <bb7494b9-f4d1-f0c0-2fb2-5201559c1962@suse.com>
Date: Tue, 9 Feb 2021 13:53:48 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

The middle two patches are meant to address a regression reported on
the list under "Problems with APIC on versions 4.9 and later (4.8
works)". In the course of analyzing output from a debugging patch I
ran into another anomaly again, which I thought I should finally try
to address. Hence patch 1. Patch 4 is new in v3 and RFC for now.

While looking closely at the corresponding debugging patch'es output I
noticed a suspicious drift between local and master stime: Measured not
very precisely, local was behind master by about 200ms in about half an
hour. Interestingly the recording of ->master_stime (and hence the not
really inexpensive invocation of read_platform_stime()) looks to be
pretty pointless when CONSTANT_TSC - I haven't been able to spot an
actual consumer. IOW the drift may not be a problem, and we might be
able to eliminate the platform timer reads. (When !CONSTANT_TSC, such
drift would get corrected anyway, by local_time_calibration().)

1: change initiation of the calibration timer
2: adjust time recording time_calibration_tsc_rendezvous()
3: don't move TSC backwards in time_calibration_tsc_rendezvous()
4: re-arrange struct calibration_rendezvous

Jan

