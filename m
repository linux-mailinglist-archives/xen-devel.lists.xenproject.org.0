Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A5CB25BB03
	for <lists+xen-devel@lfdr.de>; Thu,  3 Sep 2020 08:26:55 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kDigT-0004jA-Nm; Thu, 03 Sep 2020 06:25:21 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=kD+y=CM=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kDigS-0004j5-16
 for xen-devel@lists.xenproject.org; Thu, 03 Sep 2020 06:25:20 +0000
X-Inumbo-ID: 156a72aa-ba0e-4ed8-80b2-435166e0d988
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 156a72aa-ba0e-4ed8-80b2-435166e0d988;
 Thu, 03 Sep 2020 06:25:19 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 36E09AC85;
 Thu,  3 Sep 2020 06:25:19 +0000 (UTC)
Subject: Re: [PATCH v3 1/8] x86: fix compat header generation
To: Don Slutz <don.slutz@gmail.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@citrix.com>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>
References: <adb0fe93-c251-b84a-a357-936029af0e9c@suse.com>
 <c2cb193c-f162-485e-1997-fb74e40c0cc5@suse.com>
 <83dfb28c-bb94-e582-b437-39e37f026741@suse.com>
 <d2f0abf4-37f1-7072-64e4-f524fd128551@Gmail.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <05d3028b-6a7e-82bf-5515-50e4ede82f15@suse.com>
Date: Thu, 3 Sep 2020 08:25:27 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <d2f0abf4-37f1-7072-64e4-f524fd128551@Gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
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

On 02.09.2020 23:23, Don Slutz wrote:
> On 8/31/2020 9:07 AM, Jan Beulich wrote:
>> unmatched group
> 
> I just got to this today.  The following work for me with python 3.4.6, 
> basically add an extra group that is not part of a conditional match:

Oh, good, thanks. I'll fold this in once I've tested it. Neater than
having to split the patterns in any event.

Jan

>  From 0ee501b7491cf62e18a454dcebc12b1b6d36e9e9 Mon Sep 17 00:00:00 2001
> Message-Id: 
> <0ee501b7491cf62e18a454dcebc12b1b6d36e9e9.1599081619.git.don.slutz@gmail.com>
> From: Don Slutz <don.slutz@gmail.com>
> Date: Wed, 2 Sep 2020 17:18:43 -0400
> Subject: [PATCH] Add extra group to avoid python bug 3.4.6 about 'unmatched
>   group'
> 
> Signed-off-by: Don Slutz <don.slutz@gmail.com>
> ---
>   xen/tools/compat-build-header.py | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/xen/tools/compat-build-header.py 
> b/xen/tools/compat-build-header.py
> index 54c121b..ca706ce 100755
> --- a/xen/tools/compat-build-header.py
> +++ b/xen/tools/compat-build-header.py
> @@ -11,8 +11,8 @@ pats = [
>    [ r"__UnDeF__", r"#undef" ],
>    [ r"\"xen-compat.h\"", r"<public/xen-compat.h>" ],
>    [ r"(struct|union|enum)\s+(xen_?)?(\w)", r"\1 compat_\3" ],
> - [ r"typedef(.*)@KeeP@(xen_?)?([\w]+)([^\w])",
> -   r"typedef\1\2\3 
> __attribute__((__aligned__(__alignof(\1compat_\3))))\4" ],
> + [ r"typedef(.*)@KeeP@((xen_?)?)([\w]+)([^\w])",
> +   r"typedef\1\2\4 
> __attribute__((__aligned__(__alignof(\1compat_\4))))\5" ],
>    [ r"_t([^\w]|$)", r"_compat_t\1" ],
>    [ r"int(8|16|32|64_aligned)_compat_t([^\w]|$)", r"int\1_t\2" ],
>    [ r"(\su?int64(_compat)?)_T([^\w]|$)", r"\1_t\3" ],
> 


