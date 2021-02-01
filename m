Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E83230A7D0
	for <lists+xen-devel@lfdr.de>; Mon,  1 Feb 2021 13:42:11 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.79836.145451 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l6YWa-0003BG-5l; Mon, 01 Feb 2021 12:41:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 79836.145451; Mon, 01 Feb 2021 12:41:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l6YWa-0003Ar-2n; Mon, 01 Feb 2021 12:41:48 +0000
Received: by outflank-mailman (input) for mailman id 79836;
 Mon, 01 Feb 2021 12:41:46 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=4N3t=HD=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1l6YWX-0003Am-UU
 for xen-devel@lists.xenproject.org; Mon, 01 Feb 2021 12:41:45 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 864af19d-4885-4521-bd63-36209379be20;
 Mon, 01 Feb 2021 12:41:43 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id D2A4DAB92;
 Mon,  1 Feb 2021 12:41:42 +0000 (UTC)
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
X-Inumbo-ID: 864af19d-4885-4521-bd63-36209379be20
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1612183302; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=eNLWhHPDsMuX+VaPLPf7HucG8rgFqcAlJfgfgBVrV1o=;
	b=hz08KS8bNOMxQvHLXzdLz303Ow4YoL3Pp1OU9PAdCoCEFa4HelH8jXVjP4oUQgTJteD0ab
	+xOxO7LcUGSvpQd4QArHku3+7v/gU66nooYuQux1FaMan7W5wPsgNRoqlpJBVhRt1eL5TB
	c/AMGgD9Or0OkQAjbleXX9+Nw6I5VNI=
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH v2 0/3] x86/time: calibration rendezvous adjustments
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Claudemir Todo Bom <claudemir@todobom.com>
Message-ID: <b8d1d4f8-8675-1393-8524-d060ffb1551a@suse.com>
Date: Mon, 1 Feb 2021 13:41:41 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

The latter two patches are meant to address a regression reported on
the list under "Problems with APIC on versions 4.9 and later (4.8
works)". In the course of analyzing output from a debugging patch I
ran into another anomaly again, which I thought I should finally try
to address. Hence patch 1.

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

Jan

