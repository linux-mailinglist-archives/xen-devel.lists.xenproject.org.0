Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AFABD3387D5
	for <lists+xen-devel@lfdr.de>; Fri, 12 Mar 2021 09:46:13 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.96904.183816 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lKdQQ-0004tr-Jg; Fri, 12 Mar 2021 08:45:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 96904.183816; Fri, 12 Mar 2021 08:45:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lKdQQ-0004tS-GC; Fri, 12 Mar 2021 08:45:38 +0000
Received: by outflank-mailman (input) for mailman id 96904;
 Fri, 12 Mar 2021 08:45:37 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=F/Rg=IK=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lKdQP-0004t7-0N
 for xen-devel@lists.xenproject.org; Fri, 12 Mar 2021 08:45:37 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 64586895-11fd-46c6-aee8-15d1d89af5a0;
 Fri, 12 Mar 2021 08:45:35 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 0CE1EAF39;
 Fri, 12 Mar 2021 08:45:35 +0000 (UTC)
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
X-Inumbo-ID: 64586895-11fd-46c6-aee8-15d1d89af5a0
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1615538735; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/fnIlZATBHUFmI4G1S8Zhc4vjygJLmS5ZGQ/SPaaRsc=;
	b=oCxLRgcp6kEl4U7811tB5kasuTgWBDUugdQfAA2oYsakNWbORHVeGMUnhI4Lx9Xv4yWT9a
	le0ZhcRKakEsN1WGibYhY5YOC4Ogr9+RexibIDgWrhX4soCoUxRZCbkuaQiSkU0OWgZ+sW
	deKVypQcNeS48+BHUx5qNMIC2EbACk4=
Subject: Re: [PATCH v2 1/2][4.15] tools/x86: don't rebuild cpuid-autogen.h
 every time
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Ian Jackson <iwj@xenproject.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Wei Liu <wl@xen.org>
References: <1365013b-1e90-aeb2-3c80-7a5c6284c46a@suse.com>
 <1b8aee19-9194-153c-8dbb-0aec3412e255@suse.com>
 <YEo3VzlTRTaBUkqw@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <c88981fc-b83b-b3c0-f003-59af72e6065b@suse.com>
Date: Fri, 12 Mar 2021 09:45:35 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <YEo3VzlTRTaBUkqw@Air-de-Roger>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 11.03.2021 16:29, Roger Pau Monné wrote:
> On Thu, Mar 11, 2021 at 03:40:05PM +0100, Jan Beulich wrote:
>> The first thing the "xen-dir" rule does is delete the entire xen/
>> subtree. Obviously this includes deleting xen/lib/x86/*autogen.h. As a
>> result there's no original version for $(move-if-changed ...) to compare
>> against, and hence the file and all its consumers would get rebuilt
>> every time. Instead only find and delete all the symlinks.
>>
>> Fixes: eddf9559c977 ("libx86: generate cpuid-autogen.h in the libx86 include dir")
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>> ---
>> v2: Different approach.
>> ---
>> Ian did suggest to pass -0r to xargs (and -print0 to find), but I
>> couldn't convince myself that these are standard compliant options. We
>> don't use any special characters in file names, so -print0 / -0
>> shouldn't be necessary at all. The stray rm invocation when there is no
>> output from find can be taken care of by passing -f to it.
> 
> Why not use `-exec rm -f {} +` instead? That seems to be part of
> POSIX and is likely nicer than piping to xargs?

I've looked around some more and also remembered an aspect because
of the looking around.

1) xargs has special provisions to not overrun argument space (leaving
a gap of 2048 bytes). Nothing like this is said in the spec for find,
and in fact I recall having had issues when the accumulated arguments
needed splitting. This was on an old distro, but I wanted to mention
it.

2) I've found (old) indications that the {} may be troublesome to
some distros (Solaris was mentioned) and might need quoting. (This
would of course be easy to deal with.)

Jan

