Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B106F27FEA5
	for <lists+xen-devel@lfdr.de>; Thu,  1 Oct 2020 13:51:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1230.4143 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kNx7S-0007Mw-6N; Thu, 01 Oct 2020 11:51:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1230.4143; Thu, 01 Oct 2020 11:51:30 +0000
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
	id 1kNx7S-0007MX-2v; Thu, 01 Oct 2020 11:51:30 +0000
Received: by outflank-mailman (input) for mailman id 1230;
 Thu, 01 Oct 2020 11:51:28 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=bOcq=DI=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kNx7Q-0007MS-PJ
 for xen-devel@lists.xenproject.org; Thu, 01 Oct 2020 11:51:28 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 6e4e6e1b-571e-4343-9046-c2b5535d3c01;
 Thu, 01 Oct 2020 11:51:27 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 12D18AFBF;
 Thu,  1 Oct 2020 11:51:27 +0000 (UTC)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=bOcq=DI=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
	id 1kNx7Q-0007MS-PJ
	for xen-devel@lists.xenproject.org; Thu, 01 Oct 2020 11:51:28 +0000
X-Inumbo-ID: 6e4e6e1b-571e-4343-9046-c2b5535d3c01
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 6e4e6e1b-571e-4343-9046-c2b5535d3c01;
	Thu, 01 Oct 2020 11:51:27 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1601553087;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=DiM82XdN6Au6EVTl0sxOpxzjPI5q031P49dRd7AVWT8=;
	b=jD0RYAQDojg0PBw2BztGPq4U8006WfZAV+DZDdLCiW1XDTlgsz3Gp0e096OXUJuWgpT3sM
	OyFz0A8rX5iTvxOtfnmv797sOiI1plOUt5cvmxoLdVt0JPzpy/PebYyp6MF2t7kJfNrR/Z
	tjt6XyCZNIYbn0MoVXsTznCILPtg/fA=
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 12D18AFBF;
	Thu,  1 Oct 2020 11:51:27 +0000 (UTC)
Subject: Re: [PATCH] xen/domain: check IOMMU options doesn't contain unknown
 bits set
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: xen-devel@lists.xenproject.org, Andrew Cooper
 <andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>,
 Ian Jackson <iwj@xenproject.org>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
References: <20201001114407.44532-1-roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <70b44d77-8c49-2394-ac62-a81fa52cb049@suse.com>
Date: Thu, 1 Oct 2020 13:51:28 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20201001114407.44532-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 01.10.2020 13:44, Roger Pau Monne wrote:
> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>

