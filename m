Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 26FE7257A0E
	for <lists+xen-devel@lfdr.de>; Mon, 31 Aug 2020 15:08:42 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kCjXS-0000Wt-G7; Mon, 31 Aug 2020 13:07:58 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=RZUy=CJ=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kCjXQ-0000Wo-Mb
 for xen-devel@lists.xenproject.org; Mon, 31 Aug 2020 13:07:56 +0000
X-Inumbo-ID: fbb0f084-b123-46a9-a217-cd0c347758aa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id fbb0f084-b123-46a9-a217-cd0c347758aa;
 Mon, 31 Aug 2020 13:07:55 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 8C234B8E6;
 Mon, 31 Aug 2020 13:07:54 +0000 (UTC)
Subject: Re: [PATCH v3 1/8] x86: fix compat header generation
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Wei Liu <wl@xen.org>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@citrix.com>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>
References: <adb0fe93-c251-b84a-a357-936029af0e9c@suse.com>
 <c2cb193c-f162-485e-1997-fb74e40c0cc5@suse.com>
Message-ID: <83dfb28c-bb94-e582-b437-39e37f026741@suse.com>
Date: Mon, 31 Aug 2020 15:07:59 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <c2cb193c-f162-485e-1997-fb74e40c0cc5@suse.com>
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

On 23.07.2020 17:48, Jan Beulich wrote:
> --- a/xen/tools/compat-build-header.py
> +++ b/xen/tools/compat-build-header.py
> @@ -3,7 +3,7 @@
>  import re,sys
>  
>  pats = [
> - [ r"__InClUdE__(.*)", r"#include\1\n#pragma pack(4)" ],
> + [ r"__InClUdE__(.*)", r"#include\1" ],
>   [ r"__IfDeF__ (XEN_HAVE.*)", r"#ifdef \1" ],
>   [ r"__ElSe__", r"#else" ],
>   [ r"__EnDif__", r"#endif" ],
> @@ -11,9 +11,11 @@ pats = [
>   [ r"__UnDeF__", r"#undef" ],
>   [ r"\"xen-compat.h\"", r"<public/xen-compat.h>" ],
>   [ r"(struct|union|enum)\s+(xen_?)?(\w)", r"\1 compat_\3" ],
> - [ r"@KeeP@", r"" ],
> + [ r"typedef(.*)@KeeP@(xen_?)?([\w]+)([^\w])",
> +   r"typedef\1\2\3 __attribute__((__aligned__(__alignof(\1compat_\3))))\4" ],

I've noticed only very recently that this (but not ...

>   [ r"_t([^\w]|$)", r"_compat_t\1" ],
> - [ r"(8|16|32|64)_compat_t([^\w]|$)", r"\1_t\2" ],
> + [ r"int(8|16|32|64_aligned)_compat_t([^\w]|$)", r"int\1_t\2" ],
> + [ r"(\su?int64(_compat)?)_T([^\w]|$)", r"\1_t\3" ],

... this) trips an apparent bug in Python up to at least 3.4.6:
"unmatched group". It's been working fine for me with 3.7. I'm
not going to rule out I've screwed up the regex, but I can't
see in which way. Obviously I can't commit this knowing of this
issue. I'd be glad if people with better Python knowledge than
mine could suggest how to fix the expression or work around the
issue.

Thanks much, Jan

