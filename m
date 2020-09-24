Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CC66276A18
	for <lists+xen-devel@lfdr.de>; Thu, 24 Sep 2020 09:09:53 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kLLNs-0002gi-3K; Thu, 24 Sep 2020 07:09:40 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=+2aH=DB=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kLLNq-0002gd-Jp
 for xen-devel@lists.xenproject.org; Thu, 24 Sep 2020 07:09:38 +0000
X-Inumbo-ID: d9b376f4-1e32-4f47-98b2-e5703071e169
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id d9b376f4-1e32-4f47-98b2-e5703071e169;
 Thu, 24 Sep 2020 07:09:37 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
 t=1600931376;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=zLEO1ik0C3w6vyUvTbbuoSSTSsoZnaH1hc0796q857U=;
 b=aqc/KwnK0qw8Fq8WTXJnMLofCdhjM43d4XamPKS+6iSQJYtOgFg3LNLHkKyGbmlBP0sSpV
 oAq0uwSHDrPTaDKyP3ElcWnpZUhr5ZJrZTWpkApsy3trejI5eUGdcK+18kVWcHRe/fq9Je
 gmatS1qYefJVnYcJEGHDwqrZWJbLEpM=
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 8D89DAA55;
 Thu, 24 Sep 2020 07:10:14 +0000 (UTC)
Subject: Re: [PATCH 8/9] lib: move bsearch code
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 George Dunlap <George.Dunlap@eu.citrix.com>, Ian Jackson
 <iwj@xenproject.org>, Julien Grall <julien@xen.org>, Wei Liu <wl@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>
References: <aabca463-21ed-3755-0e8d-908069f40d6e@suse.com>
 <13e17bbd-4e58-d953-87c5-5fabafa21de2@suse.com>
 <b40bd4a7-b1fb-b2a0-44d1-398f533469a0@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <b330220d-3428-3cd5-53b7-6daa4a08d283@suse.com>
Date: Thu, 24 Sep 2020 09:09:37 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <b40bd4a7-b1fb-b2a0-44d1-398f533469a0@citrix.com>
Content-Type: text/plain; charset=utf-8
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

On 22.09.2020 21:34, Andrew Cooper wrote:
> On 14/09/2020 11:18, Jan Beulich wrote:
>> Build this code into an archive, which results in not linking it into
>> x86 final binaries. This saves a little bit of dead code.
>>
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> 
> This wants to be an extern inline in the header file just like in stdlib.h.

I can move it there, but why "extern" rather than "static"? We're
not at risk of conflicting with a C library implementation.

> The implementation is trivial, and much faster when the compiler can
> inline the cmp() function pointer.
> 
> I doubt we actually need out-of-line implementation (except perhaps for
> CONFIG_UBSAN builds or so).

The only references are in Arm code; I don't know enough of UBSAN to
see why uses may appear there.

Jan

