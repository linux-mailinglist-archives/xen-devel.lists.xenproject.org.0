Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 094BB28E417
	for <lists+xen-devel@lfdr.de>; Wed, 14 Oct 2020 18:12:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.6850.17991 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kSjOE-00041a-Hr; Wed, 14 Oct 2020 16:12:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 6850.17991; Wed, 14 Oct 2020 16:12:34 +0000
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
	id 1kSjOE-00041B-Eh; Wed, 14 Oct 2020 16:12:34 +0000
Received: by outflank-mailman (input) for mailman id 6850;
 Wed, 14 Oct 2020 16:12:33 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=+Hv6=DV=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1kSjOD-000416-60
 for xen-devel@lists.xenproject.org; Wed, 14 Oct 2020 16:12:33 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 8f7eb236-8670-46b5-a0a2-d44f0e04382b;
 Wed, 14 Oct 2020 16:12:32 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 9B843AB95;
 Wed, 14 Oct 2020 16:12:31 +0000 (UTC)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=+Hv6=DV=suse.com=jgross@srs-us1.protection.inumbo.net>)
	id 1kSjOD-000416-60
	for xen-devel@lists.xenproject.org; Wed, 14 Oct 2020 16:12:33 +0000
X-Inumbo-ID: 8f7eb236-8670-46b5-a0a2-d44f0e04382b
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 8f7eb236-8670-46b5-a0a2-d44f0e04382b;
	Wed, 14 Oct 2020 16:12:32 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1602691951;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=OxMMnS5B+nWAljHNp7JmzV04WRtDVUgeRIpunFkUjx4=;
	b=I93qXBnOT+TO0xXsXDgiTZrpYeuwPlvtgPp+Mh5nh/xN974lqsNtxSk+uUQQuHOyOPHHkL
	c0eicMZhw/6b+l4RHrKHv/lOHz4yR7W9/B0dpyvdCXG5MSSgF7/9ZJVhBNnjzIZKaSfapo
	SySDKMnpvUB37JypmAG2X+cripOp4m8=
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 9B843AB95;
	Wed, 14 Oct 2020 16:12:31 +0000 (UTC)
Subject: Re: [PATCH] libelf: Handle PVH kernels lacking ENTRY elfnote
To: Jason Andryuk <jandryuk@gmail.com>, xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
References: <20201014153150.83875-1-jandryuk@gmail.com>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <77e8bf3b-6172-2900-dd5e-9d059a410b0e@suse.com>
Date: Wed, 14 Oct 2020 18:12:30 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20201014153150.83875-1-jandryuk@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 14.10.20 17:31, Jason Andryuk wrote:
> Linux kernels only have an ENTRY elfnote when built with CONFIG_PV.  A

This wrong. Have a look into arch/x86/platform/pvh/head.S


Juergen

