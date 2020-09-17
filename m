Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2520126D75C
	for <lists+xen-devel@lfdr.de>; Thu, 17 Sep 2020 11:05:30 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kIppo-0008Iu-Qm; Thu, 17 Sep 2020 09:04:08 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=3K40=C2=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1kIppm-0008Ip-SP
 for xen-devel@lists.xenproject.org; Thu, 17 Sep 2020 09:04:06 +0000
X-Inumbo-ID: a2f169d3-9c96-4612-ac5c-64e2c28e44d1
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id a2f169d3-9c96-4612-ac5c-64e2c28e44d1;
 Thu, 17 Sep 2020 09:04:05 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com;
 s=cantorsusede; t=1600333445;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=YVrtndPtxAZKpXLNGpWk/DY94eJoc8N6cyZZYtYczvI=;
 b=nLxpT6dch4dq02JIhuGBxVdDwS+PI9tLoAHkbqReCWSPg9vM/ifMd/XcBS/rCHrzljbjVV
 CYrivln7EDUkHVlI/3rILZjgNQBPMgtdjXzV5o72xRF1B1wrmXKeHX05jkBWqtsXc/uWi+
 aiNOmLO3mTIq9bCwmJSHmsFPoCTQK2FAWzsNPyLeXVcn8vq/vcJvw9WgRHfe6PzfV0DIc1
 qPgdgNOFzgm8WZxS8UyKNxwKH79mqokXU8SoBvZq2iS84/TWyY4B9aPB16MOy3ywouzKSj
 m5qGkT3UdZ541hn5QZSZCSkQCe0FgfSEFVVImNQdhzsK5OpN0meNOInuufIqPQ==
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id D247CABD2;
 Thu, 17 Sep 2020 09:04:38 +0000 (UTC)
Subject: Re: [PATCH 5/5] sched/arinc653: Implement CAST-32A multicore
 scheduling
To: Jeff Kubascik <jeff.kubascik@dornerworks.com>,
 xen-devel@lists.xenproject.org
Cc: xen-devel@dornerworks.com, Josh Whitehead <josh.whitehead@dornerworks.com>,
 Stewart Hildebrand <stewart.hildebrand@dornerworks.com>,
 George Dunlap <george.dunlap@citrix.com>, Dario Faggioli <dfaggioli@suse.com>
References: <20200916181854.75563-1-jeff.kubascik@dornerworks.com>
 <20200916181854.75563-6-jeff.kubascik@dornerworks.com>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <d2973002-86b5-17b7-cbfa-ba235af75ba3@suse.com>
Date: Thu, 17 Sep 2020 11:04:04 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20200916181854.75563-6-jeff.kubascik@dornerworks.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 16.09.20 20:18, Jeff Kubascik wrote:
> This change is an overhaul of the ARINC653 scheduler to enable CAST-32A
> multicore scheduling. CAST-32A specifies that only one partition
> (domain) can run during a minor frame, but that domain is now allowed to
> have more than one vCPU.

It might be worth to consider using just the core scheduling framework
in order to achive this. Using a sched_granularity with the number of
cpus in the cpupool running ARINC653 scheduler should already do the
trick. There should be no further midification of ARINC653 scheduler
required.


Juergen

