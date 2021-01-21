Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6456D2FE46E
	for <lists+xen-devel@lfdr.de>; Thu, 21 Jan 2021 08:56:03 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.71909.129135 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l2Uoa-0006i7-Jj; Thu, 21 Jan 2021 07:55:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 71909.129135; Thu, 21 Jan 2021 07:55:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l2Uoa-0006hl-Gd; Thu, 21 Jan 2021 07:55:36 +0000
Received: by outflank-mailman (input) for mailman id 71909;
 Thu, 21 Jan 2021 07:55:35 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=iH6i=GY=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1l2UoZ-0006he-AM
 for xen-devel@lists.xenproject.org; Thu, 21 Jan 2021 07:55:35 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 2dd5e270-946d-4418-af20-6e9358c593ac;
 Thu, 21 Jan 2021 07:55:28 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id D48FFAFE2;
 Thu, 21 Jan 2021 07:55:27 +0000 (UTC)
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
X-Inumbo-ID: 2dd5e270-946d-4418-af20-6e9358c593ac
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1611215728; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Cx2LS14/cheycuTz6kW6/vZFEa6Gebybd2ets1oUeeg=;
	b=X1xUrs0RH/wXaHL7nw8DWVDeCEHbp6PpHwHXHxLDiDhlMTXMgEyo434pmHjBsiImbwf2vE
	/lGoC0HxmiFC7UxZS2tcoPs4SuHuZFEwcZ/dkiO8+g8UY8hA5XJ/1QqWh+NGaDnGr69pQZ
	2+bmuwbTxstXzYmDT+zvdjyQHhbnyls=
Subject: Re: [PATCH v6 1/3] xen/arm: add support for
 run_in_exception_handler()
To: Julien Grall <julien@xen.org>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Wei Liu <wl@xen.org>, xen-devel@lists.xenproject.org,
 Juergen Gross <jgross@suse.com>
References: <20210116103339.21708-1-jgross@suse.com>
 <20210116103339.21708-2-jgross@suse.com>
 <4e8cc6e6-dc55-6dda-ffbc-6487e45d5aaf@xen.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <9437a37b-a32c-c8c9-a539-fcc1ac3bfc3d@suse.com>
Date: Thu, 21 Jan 2021 08:55:27 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <4e8cc6e6-dc55-6dda-ffbc-6487e45d5aaf@xen.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 20.01.2021 19:20, Julien Grall wrote:
> On 16/01/2021 10:33, Juergen Gross wrote:
>> Add support to run a function in an exception handler for Arm. Do it
>> as on x86 via a bug_frame, but pass the function pointer via a
>> register (this needs to be done that way, because inline asm support
>> for 32-bit Arm lacks the needed functionality to reference an
>> arbitrary function via the bugframe).
> 
> I was going to commit the series, but then realized the commit message 
> and comment needs some tweaking because technically GCC is supporting 
> 'i' (I managed to get it working with -fno-pie).
> 
> So how about:
> 
> "This is needed to be done that way because GCC complains about invalid 
> constraint when using a function pointer with "i" and PIE is enabled 
> (default on most of GCC shipped with distro). Clang happily accepts it, 
> so it may be a bug in GCC."

May I ask why you think it's a bug in gcc? I'd rather consider it
a bug in clang. Taking the address of a symbol doesn't yield a
constant in PIC or PIE code, aiui.

Jan

