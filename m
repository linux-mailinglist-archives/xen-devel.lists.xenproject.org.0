Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C1DED314FAC
	for <lists+xen-devel@lfdr.de>; Tue,  9 Feb 2021 14:02:38 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.83234.154372 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l9Seq-0000ks-SM; Tue, 09 Feb 2021 13:02:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 83234.154372; Tue, 09 Feb 2021 13:02:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l9Seq-0000kT-Oj; Tue, 09 Feb 2021 13:02:20 +0000
Received: by outflank-mailman (input) for mailman id 83234;
 Tue, 09 Feb 2021 13:02:19 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=BG3/=HL=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1l9Seo-0000kL-Vd
 for xen-devel@lists.xenproject.org; Tue, 09 Feb 2021 13:02:19 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id fdd56266-18b9-45e0-8ced-70d5c545f552;
 Tue, 09 Feb 2021 13:02:17 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id BD7CAAD6A;
 Tue,  9 Feb 2021 13:02:16 +0000 (UTC)
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
X-Inumbo-ID: fdd56266-18b9-45e0-8ced-70d5c545f552
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1612875736; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=pm1SXLBpvnL4ukE2e2l7lHTnGHmAvihoOGdi1YBFjwM=;
	b=VUxofy4sEx8Fhj1IzhsRGNvv+K+xEMVx4cMyo+VqbgiGnoZhbG/5NNlJYnNoQsTEEPPyjl
	kr7UnwQe4gGSqGUd0np5KeBnBtzlkEDnwj6df6shvJBOsrCV/KfpUctezTG8uiEJR7ZtUD
	bL7MJexcf8N1Zv7w4CyWaDdAZV2gS28=
Subject: Re: [PATCH v3 0/4] x86/time: calibration rendezvous adjustments
From: Jan Beulich <jbeulich@suse.com>
To: Ian Jackson <iwj@xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <bb7494b9-f4d1-f0c0-2fb2-5201559c1962@suse.com>
Message-ID: <a3be96d8-1480-8af4-601b-a55ab3819f97@suse.com>
Date: Tue, 9 Feb 2021 14:02:17 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <bb7494b9-f4d1-f0c0-2fb2-5201559c1962@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 09.02.2021 13:53, Jan Beulich wrote:
> The middle two patches are meant to address a regression reported on
> the list under "Problems with APIC on versions 4.9 and later (4.8
> works)". In the course of analyzing output from a debugging patch I
> ran into another anomaly again, which I thought I should finally try
> to address. Hence patch 1. Patch 4 is new in v3 and RFC for now.

Of course this is the kind of change I'd prefer doing early in a
release cycle. I don't think there are severe risks from patch 1, but
I'm not going to claim patches 2 and 3 are risk free. They fix booting
Xen on a system left in rather awkward state by the firmware. And
they shouldn't affect well behaved modern systems at all (due to
those using a different rendezvous function). While we've been having
this issue for years, I also consider this set a backporting
candidate. Hence I can see reasons pro and con inclusion in 4.15.

Jan

> 1: change initiation of the calibration timer
> 2: adjust time recording time_calibration_tsc_rendezvous()
> 3: don't move TSC backwards in time_calibration_tsc_rendezvous()
> 4: re-arrange struct calibration_rendezvous
> 
> Jan
> 


