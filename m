Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BB2593918C0
	for <lists+xen-devel@lfdr.de>; Wed, 26 May 2021 15:24:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.132509.247138 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lltWG-0006eC-Oa; Wed, 26 May 2021 13:24:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 132509.247138; Wed, 26 May 2021 13:24:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lltWG-0006bx-La; Wed, 26 May 2021 13:24:20 +0000
Received: by outflank-mailman (input) for mailman id 132509;
 Wed, 26 May 2021 13:24:19 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ZGBu=KV=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lltWF-0006br-MV
 for xen-devel@lists.xenproject.org; Wed, 26 May 2021 13:24:19 +0000
Received: from smtp-out2.suse.de (unknown [195.135.220.29])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id a477c6bb-2de4-4ea5-bf25-0b6c1c525132;
 Wed, 26 May 2021 13:24:18 +0000 (UTC)
Received: from imap.suse.de (imap-alt.suse-dmz.suse.de [192.168.254.47])
 by smtp-out2.suse.de (Postfix) with ESMTP id C3B2D1FD2A;
 Wed, 26 May 2021 13:24:17 +0000 (UTC)
Received: from director2.suse.de (director2.suse-dmz.suse.de [192.168.254.72])
 by imap.suse.de (Postfix) with ESMTPSA id 9D37111A98;
 Wed, 26 May 2021 13:24:17 +0000 (UTC)
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
X-Inumbo-ID: a477c6bb-2de4-4ea5-bf25-0b6c1c525132
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1622035457; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=EtfsgYNsPNzJpxDuCz6haBq85KulN4as1kYTkz2nBg8=;
	b=eaP8ax7g2oMaBP2fu3arukDLr7mAiE34LLpeODZkkiWDuLaYDF5fbgSXNngAB8DhO2Um35
	PUrrP+JrYK2QBMfWa3Wnw5n99kury/7d4WUMM/gyc2DIxfFmGaqGr54yKKFL7/ECUTLd9A
	f1zHzE73krU6VpyHaUkZ8ZfwYz8vmPg=
Subject: Re: [PATCH 02/13] cpufreq: Add perf_freq to cpuinfo
To: Jason Andryuk <jandryuk@gmail.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, xen-devel@lists.xenproject.org
References: <20210503192810.36084-1-jandryuk@gmail.com>
 <20210503192810.36084-3-jandryuk@gmail.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <6f3d3833-8540-ca92-8d1c-e4b7bd2217ce@suse.com>
Date: Wed, 26 May 2021 15:24:13 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.2
MIME-Version: 1.0
In-Reply-To: <20210503192810.36084-3-jandryuk@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 03.05.2021 21:27, Jason Andryuk wrote:
> acpi-cpufreq scales the aperf/mperf measurements by max_freq, but HWP
> needs to scale by base frequency.  Settings max_freq to base_freq
> "works" but the code is not obvious, and returning values to userspace
> is tricky.  Add an additonal perf_freq member which is used for scaling
> aperf/mperf measurements.
> 
> Signed-off-by: Jason Andryuk <jandryuk@gmail.com>
> ---
> I don't like this, but it seems the best way to re-use the common
> aperf/mperf code.  The other option would be to add wrappers that then
> do the acpi vs. hwp scaling.

Not sure I understand what you mean by "wrappers". I would assume that
for hwp you simply install a different getavg hook? Or else I guess
I'd need to see at least an outline of what you see as the alternative.

Jan

