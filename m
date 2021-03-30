Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 264A834EC08
	for <lists+xen-devel@lfdr.de>; Tue, 30 Mar 2021 17:21:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.103568.197558 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lRGB0-0003KG-3r; Tue, 30 Mar 2021 15:21:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 103568.197558; Tue, 30 Mar 2021 15:21:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lRGAz-0003Jq-WC; Tue, 30 Mar 2021 15:21:05 +0000
Received: by outflank-mailman (input) for mailman id 103568;
 Tue, 30 Mar 2021 15:21:03 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=2mYN=I4=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lRGAx-0003BT-TM
 for xen-devel@lists.xenproject.org; Tue, 30 Mar 2021 15:21:03 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 7d8b7aba-23d3-43d0-bf25-f3e86880361e;
 Tue, 30 Mar 2021 15:21:02 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 45424B090;
 Tue, 30 Mar 2021 15:21:01 +0000 (UTC)
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
X-Inumbo-ID: 7d8b7aba-23d3-43d0-bf25-f3e86880361e
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1617117661; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ZK9XnRQ2r2TuoLAwRNNkf3RMjShk6frjeRoB81m4JcQ=;
	b=OFbhKwaWaAs4k/2Q7C0b7PvakySvXUNCrCe5GVPIZVlBwBJk5q1aLrC9907SCcPN10ISaZ
	GjNZsLuVJtKNhB1a6i8d86dKmXhunL2d2vOMGYsCZQ4wqfr81GJdq3R2RlW0j8jMgXwhuk
	SCsAQusGYrfz3wY+6067dxyvwm8sT6Y=
Subject: Re: [PATCH 01/21] libxl: don't ignore the return value from
 xc_cpuid_apply_policy
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>,
 Anthony PERARD <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org
References: <20210323095849.37858-1-roger.pau@citrix.com>
 <20210323095849.37858-2-roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <3a8eb714-563f-02b7-3098-6479789d7e8b@suse.com>
Date: Tue, 30 Mar 2021 17:21:00 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.0
MIME-Version: 1.0
In-Reply-To: <20210323095849.37858-2-roger.pau@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 23.03.2021 10:58, Roger Pau Monne wrote:
> Also change libxl__cpuid_legacy to propagate the error from
> xc_cpuid_apply_policy into callers.
> 
> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>

This looks to do what it means to do and also none of the present
callers of the functions modified here ignore the return values, so
Reviewed-by: Jan Beulich <jbeulich@suse.com>

I wonder however how to ensure similar problems won't get
re-introduced down the road. In the hypervisor I'd recommend adding
__must_check everywhere, but I have no idea what the tool stack
policy is in this regard.

Jan

