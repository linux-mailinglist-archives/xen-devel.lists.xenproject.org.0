Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DBB7F1A225C
	for <lists+xen-devel@lfdr.de>; Wed,  8 Apr 2020 14:55:01 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jMAE7-0003m6-Q9; Wed, 08 Apr 2020 12:54:43 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=N8iV=5Y=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jMAE6-0003m1-8i
 for xen-devel@lists.xenproject.org; Wed, 08 Apr 2020 12:54:42 +0000
X-Inumbo-ID: 1c7c2e72-7998-11ea-81e1-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 1c7c2e72-7998-11ea-81e1-12813bfff9fa;
 Wed, 08 Apr 2020 12:54:41 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 3F373ACB8;
 Wed,  8 Apr 2020 12:54:39 +0000 (UTC)
Subject: Re: [XEN PATCH v4 14/18] xen,symbols: rework file symbols selection
To: Anthony PERARD <anthony.perard@citrix.com>
References: <20200331103102.1105674-1-anthony.perard@citrix.com>
 <20200331103102.1105674-15-anthony.perard@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <e28fa2b6-89c9-8e87-eaf0-91a3d6f6a62f@suse.com>
Date: Wed, 8 Apr 2020 14:54:35 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <20200331103102.1105674-15-anthony.perard@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, xen-devel@lists.xenproject.org
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 31.03.2020 12:30, Anthony PERARD wrote:
> We want to use the same rune to build mm/*/guest_*.o as the one use to
> build every other *.o object. The consequence it that file symbols that
> the program ./symbols prefer changes with CONFIG_ENFORCE_UNIQUE_SYMBOLS=y.
> 
> (1) Currently we have those two file symbols:
>     guest_walk.c
>     guest_walk_2.o
> (2) with CONFIG_ENFORCE_UNIQUE_SYMBOLS used on guest_walk.c, we will have:
>     arch/x86/mm/guest_walk.c
>     guest_walk_2.o
> 
> The order in which those symbols are present may be different.
> 
> Currently, in case (1) ./symbols chooses the *.o symbol (object file
> name). But in case (2), may choose the *.c symbol (source file name with
> path component) if it is first
> 
> We want to have ./symbols choose the object file name symbol in both
> cases.

I guess the reason for wanting this is somehow connected to the
statement at the beginning of the description, but I can't seem
to be able to make the connection.

> So this patch changes that ./symbols prefer the "object file
> name" symbol over the "source file name with path component" symbols.
> 
> The new intended order of preference is:
>     - first object file name symbol
>     - first source file name with path components symbol
>     - last source file name without any path component symbol

Isn't this going to lead to ambiguities again when
CONFIG_ENFORCE_UNIQUE_SYMBOLS? Several object files (in different
dirs) are named the same, after all. Static symbols with the same
name in such objects would hence resolve to the same kallsyms
name.

Jan

