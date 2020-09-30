Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3196927E3CC
	for <lists+xen-devel@lfdr.de>; Wed, 30 Sep 2020 10:33:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.479.1509 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kNXXj-0003tb-5u; Wed, 30 Sep 2020 08:32:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 479.1509; Wed, 30 Sep 2020 08:32:55 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kNXXj-0003tC-20; Wed, 30 Sep 2020 08:32:55 +0000
Received: by outflank-mailman (input) for mailman id 479;
 Wed, 30 Sep 2020 08:32:54 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=FBlW=DH=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kNXXi-0003t7-62
 for xen-devel@lists.xenproject.org; Wed, 30 Sep 2020 08:32:54 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 4ac61624-3d16-4cd0-9aca-e2e1cbb027c6;
 Wed, 30 Sep 2020 08:32:53 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 835BCAB0E;
 Wed, 30 Sep 2020 08:32:52 +0000 (UTC)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=FBlW=DH=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
	id 1kNXXi-0003t7-62
	for xen-devel@lists.xenproject.org; Wed, 30 Sep 2020 08:32:54 +0000
X-Inumbo-ID: 4ac61624-3d16-4cd0-9aca-e2e1cbb027c6
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id 4ac61624-3d16-4cd0-9aca-e2e1cbb027c6;
	Wed, 30 Sep 2020 08:32:53 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1601454772;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=q2VH0gXd4/4pI1opDer2cumxm5SoaPqoMbnD6Az2yEA=;
	b=me4drWW8eaPWye2BysIbtD3EaFAA3hhSbh5es4WDQ9/a3G8HIUk8hx62CTUe8Pd8oy0nBE
	R375ecm+NDM+AZ5GoSETzxZRnLBd0wC8LTAWTYTNa5tzM4Z9AzG3jc8ZUydtViRTMswnPG
	FOoKzOCRH2k7r1oXHKbEaARyNlC+rzw=
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 835BCAB0E;
	Wed, 30 Sep 2020 08:32:52 +0000 (UTC)
Subject: Re: [PATCH 09/12] evtchn: move FIFO-private struct declarations
To: paul@xen.org
Cc: xen-devel@lists.xenproject.org,
 'Andrew Cooper' <andrew.cooper3@citrix.com>,
 'George Dunlap' <George.Dunlap@eu.citrix.com>,
 'Ian Jackson' <iwj@xenproject.org>, 'Julien Grall' <julien@xen.org>,
 'Wei Liu' <wl@xen.org>, 'Stefano Stabellini' <sstabellini@kernel.org>
References: <0d5ffc89-4b04-3e06-e950-f0cb171c7419@suse.com>
 <de54075d-2d2f-e4ca-8252-c6f333571027@suse.com>
 <004601d696fc$93d800a0$bb8801e0$@xen.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <91f0bd7e-a5c7-c50b-80a6-96d6bf5faa70@suse.com>
Date: Wed, 30 Sep 2020 10:32:53 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <004601d696fc$93d800a0$bb8801e0$@xen.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 30.09.2020 09:37, Paul Durrant wrote:
>> From: Xen-devel <xen-devel-bounces@lists.xenproject.org> On Behalf Of Jan Beulich
>> Sent: 28 September 2020 12:01
>>
>> There's no need to expose them.
>>
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>> ---
>> I wonder whether we shouldn't do away with event_fifo.h altogether.
>>
> 
> +1
> 
> I can't see why it needs to exist. 2l doesn't have a header.

Okay, yet another patch then (I don't think I want to extend this one).

Jan

