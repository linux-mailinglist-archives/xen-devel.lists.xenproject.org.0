Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E5AB2F5F47
	for <lists+xen-devel@lfdr.de>; Thu, 14 Jan 2021 11:53:56 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.66931.119087 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l00Fp-0004Ye-2o; Thu, 14 Jan 2021 10:53:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 66931.119087; Thu, 14 Jan 2021 10:53:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l00Fo-0004YF-WC; Thu, 14 Jan 2021 10:53:24 +0000
Received: by outflank-mailman (input) for mailman id 66931;
 Thu, 14 Jan 2021 10:53:23 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=J1hy=GR=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1l00Fn-0004Y9-JT
 for xen-devel@lists.xenproject.org; Thu, 14 Jan 2021 10:53:23 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id a0fe90c0-820e-4290-9fe4-01b78c1fd382;
 Thu, 14 Jan 2021 10:53:22 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 665C4AB7A;
 Thu, 14 Jan 2021 10:53:21 +0000 (UTC)
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
X-Inumbo-ID: a0fe90c0-820e-4290-9fe4-01b78c1fd382
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1610621601; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=bDqTXQXdmk4fsIDpSS9BG+0sNkjlWcAvgR0KCm1vQ3I=;
	b=O/JntxaI6jEXhx+dFxcDkfw1GTuZrtGf2UPiKNlHKXQbIc1a/Gjw74M3LNhHq6/W9ZzROB
	GXw9rfQGNhzU+t4kStM6VvkvMlqP8l0Um4VjUXc21SCKVBQcECy6BtNw8aqVwrq7gONUXe
	KUy3seTU5rbJ/UWDyWPyhag74LZq8wY=
Subject: Re: [PATCH] Fix error: array subscript has type 'char'
To: Manuel Bouyer <bouyer@antioche.eu.org>
Cc: Manuel Bouyer <bouyer@netbsd.org>, Ian Jackson <iwj@xenproject.org>,
 Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <20210112181242.1570-1-bouyer@antioche.eu.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <574d9ed8-c827-6864-4732-4e1b813fc3e3@suse.com>
Date: Thu, 14 Jan 2021 11:53:20 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210112181242.1570-1-bouyer@antioche.eu.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 12.01.2021 19:12, Manuel Bouyer wrote:
> From: Manuel Bouyer <bouyer@netbsd.org>
> 
> Use unsigned char variable, or cast to (unsigned char), for
> tolower()/islower() and friends. Fix compiler error
> array subscript has type 'char' [-Werror=char-subscripts]

Isn't this something that wants changing in your ctype.h instead?
the functions (or macros), as per the C standard, ought to accept
plain char aiui, and if they use the input as an array subscript,
it should be their implementation suitably converting type first.

Jan

