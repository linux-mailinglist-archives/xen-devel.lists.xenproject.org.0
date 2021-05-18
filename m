Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C8FA5387351
	for <lists+xen-devel@lfdr.de>; Tue, 18 May 2021 09:28:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.128890.241929 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1liu95-0004RD-LH; Tue, 18 May 2021 07:28:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 128890.241929; Tue, 18 May 2021 07:28:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1liu95-0004Ot-HE; Tue, 18 May 2021 07:28:03 +0000
Received: by outflank-mailman (input) for mailman id 128890;
 Tue, 18 May 2021 07:28:01 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=tO0P=KN=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1liu93-0004Oi-59
 for xen-devel@lists.xenproject.org; Tue, 18 May 2021 07:28:01 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id e7e31dd5-77d0-47ec-a44f-5ed0a5a838a1;
 Tue, 18 May 2021 07:28:00 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id B3EC6AD12;
 Tue, 18 May 2021 07:27:59 +0000 (UTC)
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
X-Inumbo-ID: e7e31dd5-77d0-47ec-a44f-5ed0a5a838a1
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1621322879; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=okVqz5iwYM84IBzU/vQJDnw5VWOy4jzxieeVsM429Go=;
	b=V3nmKJIMpoYOEH5pYDx7JcGrusF7dTf7kcJO8QuHTAzjK57Qk8fQ7lLplxxBx2z2hjon+c
	E/VU1QEpHSEF5BdzLYBWsMaaQEYiUqECcJ7PTpeZGWyDYZwjlD/KFo+7HnwXirrftxSvkS
	cUCR29FBPznTU1fBHlqQudWPSul32GA=
Subject: Re: [PATCH 06/10] xen: replace order with nr_pfns in assign_pages for
 better compatibility
To: Penny Zheng <penny.zheng@arm.com>
Cc: Bertrand.Marquis@arm.com, Wei.Chen@arm.com, nd@arm.com,
 xen-devel@lists.xenproject.org, sstabellini@kernel.org, julien@xen.org
References: <20210518052113.725808-1-penny.zheng@arm.com>
 <20210518052113.725808-7-penny.zheng@arm.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <ede08d62-5240-bc52-3475-abdaef1afd30@suse.com>
Date: Tue, 18 May 2021 09:27:59 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210518052113.725808-7-penny.zheng@arm.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 18.05.2021 07:21, Penny Zheng wrote:
> Function parameter order in assign_pages is always used as 1ul << order,
> referring to 2@order pages.
> 
> Now, for better compatibility with new static memory, order shall
> be replaced with nr_pfns pointing to page count with no constraint,
> like 250MB.

While I'm not entirely opposed, I'm also not convinced. The new
user could as well break up the range into suitable power-of-2
chunks. In no case do I view the wording "compatibility" here as
appropriate. There's no incompatibility at present.

Jan

