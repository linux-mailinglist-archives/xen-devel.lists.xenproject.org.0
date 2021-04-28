Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F64736D1F3
	for <lists+xen-devel@lfdr.de>; Wed, 28 Apr 2021 08:02:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.119000.225291 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lbdG6-0007C9-GY; Wed, 28 Apr 2021 06:01:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 119000.225291; Wed, 28 Apr 2021 06:01:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lbdG6-0007Bk-DP; Wed, 28 Apr 2021 06:01:14 +0000
Received: by outflank-mailman (input) for mailman id 119000;
 Wed, 28 Apr 2021 06:01:12 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=x+xa=JZ=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lbdG4-0007Bf-Hd
 for xen-devel@lists.xenproject.org; Wed, 28 Apr 2021 06:01:12 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id dbbcd946-a80a-40bd-a50e-0e6a8f1c75a6;
 Wed, 28 Apr 2021 06:01:11 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 3C8EFAF23;
 Wed, 28 Apr 2021 06:01:10 +0000 (UTC)
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
X-Inumbo-ID: dbbcd946-a80a-40bd-a50e-0e6a8f1c75a6
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1619589670; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=bap4zeVnkWqoXJ6yYYfr2X8lZzJ6fexJMyGXHLG5GN0=;
	b=pJIUUbgAV6mnACd2dUmXQ9i70pmyB0vgmF7ZVx30XAy4RTw/sAtGcXFkLS2rRsRaR1XaIh
	3P4VlyCQrRDpJfxXdvGYJtP12EK1f6YNc7+G7tmpunp6DM6y6H29+3QOfAhybj/ROdxolS
	g+v3ugZAw/QKNOWU3mAKaaI7yzo+cik=
Subject: Re: [PATCH v3] x86/oprofile: remove compat accessors usage from
 backtrace
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <20210427142113.31961-1-roger.pau@citrix.com>
 <6812da01-72ef-7b88-9512-2feb250de223@suse.com>
 <YIhS79tn2J3FpJSy@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <5e2307ed-ce38-f006-e221-98b629ca5a33@suse.com>
Date: Wed, 28 Apr 2021 08:01:04 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <YIhS79tn2J3FpJSy@Air-de-Roger>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 27.04.2021 20:07, Roger Pau Monné wrote:
> On Tue, Apr 27, 2021 at 05:37:22PM +0200, Jan Beulich wrote:
>> On 27.04.2021 16:21, Roger Pau Monne wrote:
>>> Remove the unneeded usage of the compat layer to copy frame pointers
>>> from guest address space. Instead just use raw_copy_from_guest.
>>>
>>> While there change the accessibility check of one frame_head beyond to
>>> be performed as part of the copy, like it's done in the Linux code.
>>
>> Oh, one further question: I suppose you mean historic Linux here? I
>> can't find anything like this anymore in current one. If so, I'm
>> inclined to suggest "..., like used to be done in the Linux code."
>> Or something substantially similar.
> 
> Oh, so my local copy of Linux seems to be circa 5.11, and AFAICT the
> code was removed in 5.12. I can reword as: "..., like it's done in the
> Linux code in 5.11 and earlier versions".

Oh, I will admit I didn't look at the date of the removal commit.
I just double checked that it didn't get moved elsewhere.

Jan

