Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 28EFD38B254
	for <lists+xen-devel@lfdr.de>; Thu, 20 May 2021 16:58:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.131028.245109 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ljk7O-0001Sx-Q1; Thu, 20 May 2021 14:57:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 131028.245109; Thu, 20 May 2021 14:57:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ljk7O-0001R3-Md; Thu, 20 May 2021 14:57:46 +0000
Received: by outflank-mailman (input) for mailman id 131028;
 Thu, 20 May 2021 14:57:44 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=3HBq=KP=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1ljk7M-0001Qu-R6
 for xen-devel@lists.xenproject.org; Thu, 20 May 2021 14:57:44 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 246ef10a-802a-4653-908c-a78f08872746;
 Thu, 20 May 2021 14:57:44 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 25032ABC2;
 Thu, 20 May 2021 14:57:43 +0000 (UTC)
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
X-Inumbo-ID: 246ef10a-802a-4653-908c-a78f08872746
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1621522663; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ST0sC9uQ5RgchluVr6oobddJnoUy7XzyvU3yLAJB2xU=;
	b=qpY1R+PqGfmIgFTc5q7q5fJiAd07H+9DwlKe3PY7TzsPsPEFKOTPbnpSER9+ttE5zbu9wi
	j9Y13fw+S3KdBe6bjQbJxbthGBpZGr/CeyDrE09CFaKDf+cHmcNWIvdqyBto5tQgsgyYWD
	d/hGNYtAFJgxqaw8pKCxJRjadAnBpyo=
Subject: Re: [PATCH 00/13] Intel Hardware P-States (HWP) support
To: Jason Andryuk <jandryuk@gmail.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, George Dunlap <george.dunlap@citrix.com>,
 Ian Jackson <iwj@xenproject.org>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Community Manager <community.manager@xenproject.org>,
 xen-devel@lists.xenproject.org
References: <20210503192810.36084-1-jandryuk@gmail.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <572e0a5f-8ade-1a06-c7a2-cfcfc64c6fe6@suse.com>
Date: Thu, 20 May 2021 16:57:42 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.2
MIME-Version: 1.0
In-Reply-To: <20210503192810.36084-1-jandryuk@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 03.05.2021 21:27, Jason Andryuk wrote:
> Open questions:
> 
> HWP defaults to enabled and running in balanced mode.  This is useful
> for testing, but should the old ACPI cpufreq driver remain the default?

As long as this new code is experimental, yes. But once it's deemed
stable and fully supported, I think on HWP-capable hardware the new
driver should be used by default.

> This series unilaterally enables Hardware Duty Cycling (HDC) which is
> another feature to autonomously powerdown things.  That is enabled if
> HWP is enabled.  Maybe that want to be configurable?

Probably; not even sure what the default would want to be.

Jan

