Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 94EF331EB35
	for <lists+xen-devel@lfdr.de>; Thu, 18 Feb 2021 16:02:33 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.86671.162861 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lCkot-00048k-HW; Thu, 18 Feb 2021 15:02:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 86671.162861; Thu, 18 Feb 2021 15:02:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lCkot-00048L-EE; Thu, 18 Feb 2021 15:02:19 +0000
Received: by outflank-mailman (input) for mailman id 86671;
 Thu, 18 Feb 2021 15:02:17 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=x3vz=HU=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lCkor-00048G-Mf
 for xen-devel@lists.xenproject.org; Thu, 18 Feb 2021 15:02:17 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 5ac93afd-5cec-4253-945a-d9c8402057f3;
 Thu, 18 Feb 2021 15:02:16 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 7931DAE6E;
 Thu, 18 Feb 2021 15:02:15 +0000 (UTC)
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
X-Inumbo-ID: 5ac93afd-5cec-4253-945a-d9c8402057f3
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1613660535; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=JWCDGoQxl/o3awx8vCD48SSwoRU3YNAxpRjz1eq7XqM=;
	b=mUOP/pE27q42jvBJvzpWUj0C4AKBMSyLHrcDEyVcC8xsIfBu5mkiiw74NrBn2IqSu0B8zf
	lPVPwuUpQLjmb4rJebOIevthPYnnSI5dFwB4bwkTxhOPh2Hoivi2SNooNuWba1DYDiRaSM
	YDk8cRpRtFodurMfHtmuSz+5hWlOHdw=
Subject: Re: [PATCH 3/3] gnttab: GTF_sub_page is a v2-only flag
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: George Dunlap <george.dunlap@citrix.com>, Ian Jackson
 <iwj@xenproject.org>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <156559d5-853a-5bb9-942b-f623627e0907@suse.com>
 <2bf46266-785d-0de3-5f61-48c3fd191a5c@suse.com>
 <e00d9bed-20e4-b5a5-91e8-02f7a6689f86@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <a1a0587e-3e20-a023-6dd0-3b37b34fdf17@suse.com>
Date: Thu, 18 Feb 2021 16:02:14 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <e00d9bed-20e4-b5a5-91e8-02f7a6689f86@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 18.02.2021 15:22, Andrew Cooper wrote:
> On 17/02/2021 10:46, Jan Beulich wrote:
>> Prior to its introduction, v1 entries weren't checked for this flag, and
>> the flag also has been meaningless for v1 entries. Therefore it also
>> shouldn't be checked. (The only consistent alternative would be to also
>> check for all currently undefined flags to be clear.)
> 
> We recently had a similar discussion for the stable libs.
> 
> Whatever we do, an unexpected corner case needs to break.  Checking for
> all undefined flags up front is far cleaner - absolutely nothing good
> can come for a guest which set GTF_sub_page with v1, and is expecting it
> to work, and this way, we do all breaking in one go, rather than
> breaking $N times in the future as new flags get added.

Except that there doesn't need to be any breaking: v1 could continue
to ignore all originally undefined flags. v1 and v2 could continue to
ignore all flags presently undefined. See also Julien's question
about GTF_sub_page on a transitive grant entry. That's presently an
ignored setting as well (and, as an implementation detail, in fact
getting forced to be set, but with a range covering the entire page).

Retroactively starting to check (and reject) undefined flags isn't
going to be nice; nevertheless I wanted to put this up as an at
least theoretical alternative. Perhaps a topic for the next community
call, if I don't forget by the time an agenda page appears.

Jan

