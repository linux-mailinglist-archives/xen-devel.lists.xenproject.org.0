Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E87F354E25
	for <lists+xen-devel@lfdr.de>; Tue,  6 Apr 2021 09:51:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.105663.202099 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lTgU0-0001yX-3g; Tue, 06 Apr 2021 07:50:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 105663.202099; Tue, 06 Apr 2021 07:50:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lTgTz-0001y8-WD; Tue, 06 Apr 2021 07:50:44 +0000
Received: by outflank-mailman (input) for mailman id 105663;
 Tue, 06 Apr 2021 07:50:43 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=vt1H=JD=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lTgTy-0001y3-Uy
 for xen-devel@lists.xenproject.org; Tue, 06 Apr 2021 07:50:42 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 825afaef-827f-4d03-bf4e-d7c001191e12;
 Tue, 06 Apr 2021 07:50:42 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 8B9D1AFCB;
 Tue,  6 Apr 2021 07:50:41 +0000 (UTC)
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
X-Inumbo-ID: 825afaef-827f-4d03-bf4e-d7c001191e12
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1617695441; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=XEbKX/Z1ETdz+l1++th0T2qOpGnkM3VaHCw6qeEZGt4=;
	b=WaWbsrn2ZuLWhNWodEyEB/p0zQfyLi/1M3nqb/OAP80ypUdgjgyt4LYSawdVXj7rUPa4w8
	CA1WeSp+2lhtsXM4s6hKqEZ+T3NGaGQhFedvbnCQMLFHRUEknu3/eWlYK2n/OW6GSikzUf
	kVXyDqAfGQHNcqbK7+RZHIpAc+8mcDY=
Subject: Re: [PATCH 00/14] Use const whether we point to literal strings (take
 1)
To: Julien Grall <julien@xen.org>
Cc: Julien Grall <jgrall@amazon.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Dario Faggioli <dfaggioli@suse.com>, Tim Deegan <tim@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Anthony PERARD <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org
References: <20210405155713.29754-1-julien@xen.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <bdcf123c-0345-a496-03fa-4279726469ea@suse.com>
Date: Tue, 6 Apr 2021 09:50:44 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.0
MIME-Version: 1.0
In-Reply-To: <20210405155713.29754-1-julien@xen.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 05.04.2021 17:56, Julien Grall wrote:
> From: Julien Grall <jgrall@amazon.com>
> 
> Hi all,
> 
> By default, both Clang and GCC will happily compile C code where
> non-const char * point to literal strings. This means the following
> code will be accepted:
> 
>     char *str = "test";
> 
>     str[0] = 'a';
> 
> Literal strings will reside in rodata, so they are not modifiable.
> This will result to an permission fault at runtime if the permissions
> are enforced in the page-tables (this is the case in Xen).
> 
> I am not aware of code trying to modify literal strings in Xen.
> However, there is a frequent use of non-const char * to point to
> literal strings. Given the size of the codebase, there is a risk
> to involuntarily introduce code that will modify literal strings.
> 
> Therefore it would be better to enforce using const when pointing
> to such strings. Both GCC and Clang provide an option to warn
> for such case (see -Wwrite-strings) and therefore could be used
> by Xen.
> 
> This series doesn't yet make use of -Wwrite-strings because
> the tree is not fully converted. Instead, it contains some easy
> and likely non-controversial use const in the code.
> 
> The major blockers to enable -Wwrite-strings are the following:
>     - xen/common/efi: union string is used in both const and
>     non-const situation. It doesn't feel right to specific one member
>     const and the other non-const.

I'd be happy to see a suggestion of how to avoid this in a not overly
intrusive way.

>     - libxl: the major block is the flexarray framework as we would use
>     it with string (now const char*). I thought it would be possible to
>     make the interface const, but it looks like there are a couple of
>     places where we need to modify the content (such as in
>     libxl_json.c).
> 
> Ideally, I would like to have -Wwrite-strings unconditionally used
> tree-wide. But, some of the area may required some heavy refactoring.
> 
> One solution would be to enable it tree-wide but turned it off at a
> directroy/file level.

At least as a transient approach I think this would make sense. EFI in
particular has other reasons already to specify a custom option
(-fshort-wchar).

Jan

