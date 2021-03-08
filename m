Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4542B330EE7
	for <lists+xen-devel@lfdr.de>; Mon,  8 Mar 2021 14:11:35 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.94920.178891 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lJFej-0002VR-88; Mon, 08 Mar 2021 13:10:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 94920.178891; Mon, 08 Mar 2021 13:10:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lJFej-0002V2-4R; Mon, 08 Mar 2021 13:10:41 +0000
Received: by outflank-mailman (input) for mailman id 94920;
 Mon, 08 Mar 2021 13:10:39 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=mI6H=IG=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lJFeh-0002Ux-QO
 for xen-devel@lists.xenproject.org; Mon, 08 Mar 2021 13:10:39 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 832f2f00-2fbc-46ee-845e-705b938986ad;
 Mon, 08 Mar 2021 13:10:38 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id ABC5EAC0C;
 Mon,  8 Mar 2021 13:10:37 +0000 (UTC)
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
X-Inumbo-ID: 832f2f00-2fbc-46ee-845e-705b938986ad
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1615209037; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ikaHvOZsjSFcGHp0AkpHCM+bRv7UlS2puP/A0AQjKV4=;
	b=QezPYhdcVlp9hURmJwSkcDHhykjy2hmQ43JCcowlZh+paN9j0OtPP/PgH0nSh/P46/kufO
	w+W6gfykckCYXnn7HErep17JIj7iAJcsBVX+K91DQ/j9g5/VBLgOmFL63fFlAA+p4K9fSI
	4D1cLQhhLW5uchORYxsDmLiLUBZy7b4=
Subject: Re: [PATCH 1/2][4.15?] tools/x86: don't rebuild cpuid-autogen.h every
 time
To: Ian Jackson <iwj@xenproject.org>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <d08ec3ba-dff1-cb1c-9103-949e15774fd5@suse.com>
 <336aaf51-f163-8ee7-d8ee-297f6f3052fd@suse.com>
 <24645.62832.737310.550811@mariner.uk.xensource.com>
 <2857440d-058f-5c85-32d3-87e2fe65bb9a@suse.com>
 <24646.1454.55437.250075@mariner.uk.xensource.com>
 <78259adb-89b1-06a6-c1f4-c0659134e309@suse.com>
 <24646.5291.124853.270432@mariner.uk.xensource.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <5be57f5c-e055-8d92-832e-f1a17352452d@suse.com>
Date: Mon, 8 Mar 2021 14:10:32 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <24646.5291.124853.270432@mariner.uk.xensource.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 08.03.2021 13:12, Ian Jackson wrote:
> Jan Beulich writes ("Re: [PATCH 1/2][4.15?] tools/x86: don't rebuild cpuid-autogen.h every time"):
>> Possibly, but it may end up being more complex: We want to only
>> retain files of specific names from a single dir. I don't think
>> this is as straightforward to express in a find rune. Of course
>> I'll be fine whichever way the bug gets fixed, but I'm afraid I
>> don't feel convinced I want to put time into trying the alternative
>> you suggest. If otoh you wanted to try out yours and it turned out
>> equivalent or better, I wouldn't mind at all.
> 
> Untested, but I think something like this should DTRT
> 
>  find xen ! -type d ! -path 'xen/lib/x86/*-autogen.h' -print0 | xargs -0r rm --
> 
> Since my background is GNU utilities, I checked the FreeBSD manpages
> for find, xargs and rm.  They support these options.
> 
> This will leave the entire directory structure but I think that is
> fine.  The xen-dir target uses mkdir -p and should there be any stale
> directories (eg due to switching branches or whatever) they wouldn't
> be a problem.

Right. Thinking of it though - all we do is setting up symlinks
plus produce this generated header. Couldn't we therefore have
find simply arrange for all symlinks to be found and deleted?

Jan

