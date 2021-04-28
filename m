Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C0DE436D4FC
	for <lists+xen-devel@lfdr.de>; Wed, 28 Apr 2021 11:50:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.119151.225525 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lbgpY-0003MU-Gn; Wed, 28 Apr 2021 09:50:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 119151.225525; Wed, 28 Apr 2021 09:50:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lbgpY-0003Js-Da; Wed, 28 Apr 2021 09:50:04 +0000
Received: by outflank-mailman (input) for mailman id 119151;
 Wed, 28 Apr 2021 09:50:02 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=x+xa=JZ=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lbgpW-00037t-ES
 for xen-devel@lists.xenproject.org; Wed, 28 Apr 2021 09:50:02 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 8e74ee31-f046-4686-b230-d063dbf4667f;
 Wed, 28 Apr 2021 09:50:01 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 994E7B009;
 Wed, 28 Apr 2021 09:50:00 +0000 (UTC)
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
X-Inumbo-ID: 8e74ee31-f046-4686-b230-d063dbf4667f
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1619603400; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=rgjffVT7rN9FXahfIWa5+HxfMwWfZyhCzfD9lwf9tT4=;
	b=U7T2cRB/e1AL0/hnFIPB8MYqvmOXvYsXzE10pEotpEWodfcXB/VISFWkyzF5f3nFWqueau
	pIP+E8dKWOl9SMBeiB22R9FGB/FbsQLeR3Zef/9zAfXK1EN8u7dXimx4RnYeFSJ4R6U9XF
	z8q1LpxXZH9pEj2094x4Yr2fp2TTrb4=
Subject: Re: obtain a list of granttable PFNs from toolstack
To: Olaf Hering <olaf@aepfle.de>
References: <20210428095049.14a8272b.olaf@aepfle.de>
Cc: xen-devel@lists.xenproject.org
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <8427397f-0953-94df-04f6-8dfe2a4ceee8@suse.com>
Date: Wed, 28 Apr 2021 11:49:59 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <20210428095049.14a8272b.olaf@aepfle.de>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 28.04.2021 09:50, Olaf Hering wrote:
> Is there an API to get a list of PFNs which are currently being active in the grant table for a given domid?

Do you really mean PFNs? For PV, the P <=> M relationship is
guest-managed, and hence any value returned here would be stale by
the time the caller gets to use it, even if the grant table itself
didn't change.

Also, what do you mean by "active in the grant table"? A grant
present in the table referencing said page? Or a page comprising
the grant table? In the latter case, the acquire-resource interface
would allow you to obtain the MFNs from a PV guest; a HVM caller
would specify GFNs as input, for the MFNs to get (foreign-)mapped
at instead.

Jan

