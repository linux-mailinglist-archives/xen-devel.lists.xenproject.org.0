Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C342334A808
	for <lists+xen-devel@lfdr.de>; Fri, 26 Mar 2021 14:22:57 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.101797.194919 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lPmQA-0005QR-Hu; Fri, 26 Mar 2021 13:22:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 101797.194919; Fri, 26 Mar 2021 13:22:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lPmQA-0005Q2-Ei; Fri, 26 Mar 2021 13:22:38 +0000
Received: by outflank-mailman (input) for mailman id 101797;
 Fri, 26 Mar 2021 13:22:37 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=G+eI=IY=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lPmQ9-0005Pv-0E
 for xen-devel@lists.xenproject.org; Fri, 26 Mar 2021 13:22:37 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id efcfec63-6af8-4d0b-b469-acc1d26e8cf6;
 Fri, 26 Mar 2021 13:22:35 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 00065ADD7;
 Fri, 26 Mar 2021 13:22:34 +0000 (UTC)
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
X-Inumbo-ID: efcfec63-6af8-4d0b-b469-acc1d26e8cf6
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1616764955; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=5xTRBoX5Eec5DHd69ZJfPbue1Pa6T+i8850yVhierx0=;
	b=oVL9MqHHbSf/WPKFGT4yqE535Dr2LmNo+EXVlcQkqgSzxwdUNBaUi/1STJ1lMrjgbInRop
	d4gy9uiL4wihXrNhUvigCNV3GmFNu8IM5DDXZFzOytPJy141hcqBcvy6skoHmxqoLBEQtG
	JIfNReg4CWLn9vkXglZV1X4bagko4mE=
Subject: Re: [PATCH][4.15] Performance regression due to XSA-336
To: Ian Jackson <iwj@xenproject.org>
Cc: Boris Ostrovsky <boris.ostrovsky@oracle.com>, andrew.cooper3@citrix.com,
 roger.pau@citrix.com, wl@xen.org, stephen.s.brennan@oracle.com,
 xen-devel@lists.xenproject.org
References: <1616619905-640-1-git-send-email-boris.ostrovsky@oracle.com>
 <e3657f74-5b62-fe59-3bbf-41df5fbe4593@suse.com>
 <24669.52030.995324.426028@mariner.uk.xensource.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <0f14edcd-5ac7-0403-bccb-a97bf27bf392@suse.com>
Date: Fri, 26 Mar 2021 14:22:34 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.0
MIME-Version: 1.0
In-Reply-To: <24669.52030.995324.426028@mariner.uk.xensource.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 26.03.2021 12:53, Ian Jackson wrote:
> Jan Beulich writes ("Re: [PATCH][4.15] Performance regression due to XSA-336"):
>> While the change is more intrusive than one would like at this point, an
>> up-to-40% regression imo makes this at least a change to be considered
>> for 4.15. I will admit though that before next week I won't get around
>> to look at this in any more detail than just having read through this
>> cover letter. But perhaps someone else might find time earlier.
> 
> As I understand it:
> 
> This amounts to a request to consider a release ack for "x86/vpt:
> Replace per-guest pt_migrate lock with per pt lock".

Or, as already suggested by Roger, perhaps something simpler. First of
all I wanted you to be aware.

> That patch fixes a regression due to XSA-336.  XSA-336 affected many
> versions of Xen.  Therefore this is not a regression between 4.14 and
> 4.15; rather it's a regresion from pre-XSA-336 to post-XSA-336.
> 
> I looked at the patch and I am really not comfortable with that kind
> of change at this stage of the release.
> 
> So I'm afraid the answer is no, unless I have misunderstood something.

Understood.

Jan

