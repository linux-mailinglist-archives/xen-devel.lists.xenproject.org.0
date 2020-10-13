Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B56628CFA4
	for <lists+xen-devel@lfdr.de>; Tue, 13 Oct 2020 15:58:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.6223.16525 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kSKpA-0006LV-FE; Tue, 13 Oct 2020 13:58:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 6223.16525; Tue, 13 Oct 2020 13:58:44 +0000
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
	id 1kSKpA-0006L6-C8; Tue, 13 Oct 2020 13:58:44 +0000
Received: by outflank-mailman (input) for mailman id 6223;
 Tue, 13 Oct 2020 13:58:42 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=VY8U=DU=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kSKp8-0006L1-A5
 for xen-devel@lists.xenproject.org; Tue, 13 Oct 2020 13:58:42 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 64cf5fd2-3f6b-4b80-b003-3c4bc9bb8775;
 Tue, 13 Oct 2020 13:58:41 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id A79FCACBF;
 Tue, 13 Oct 2020 13:58:40 +0000 (UTC)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=VY8U=DU=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
	id 1kSKp8-0006L1-A5
	for xen-devel@lists.xenproject.org; Tue, 13 Oct 2020 13:58:42 +0000
X-Inumbo-ID: 64cf5fd2-3f6b-4b80-b003-3c4bc9bb8775
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 64cf5fd2-3f6b-4b80-b003-3c4bc9bb8775;
	Tue, 13 Oct 2020 13:58:41 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1602597520;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=mKiytihRbzR69xYtsHkh753vQVOTmQL2tS6ZPS+MFvM=;
	b=swgRKTXdEDMk0o/6UAYn5eGKFDy3dbBEebQVgyaOmBiQ8F67NI6RpfFaWJSGAvwzz7RfEV
	DZt8u4Cp09LyNfynEL2mZO6KKeph2cCMp3dJA5PKN8RTFxtHRsf7nkrhkuXZnHSChtjNOr
	msgzDRlCwIfH5YH7y3cIEvWs6GXHCMU=
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id A79FCACBF;
	Tue, 13 Oct 2020 13:58:40 +0000 (UTC)
Subject: Re: [PATCH v2 1/2] xen/events: access last_priority and last_vcpu_id
 together
To: Juergen Gross <jgross@suse.com>
Cc: xen-devel@lists.xenproject.org, Andrew Cooper
 <andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>,
 Ian Jackson <iwj@xenproject.org>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
References: <20201012092740.1617-1-jgross@suse.com>
 <20201012092740.1617-2-jgross@suse.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <9485004c-b739-5590-202b-c8e6f84e5e54@suse.com>
Date: Tue, 13 Oct 2020 15:58:37 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20201012092740.1617-2-jgross@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 12.10.2020 11:27, Juergen Gross wrote:
> The queue for a fifo event is depending on the vcpu_id and the
> priority of the event. When sending an event it might happen the
> event needs to change queues and the old queue needs to be kept for
> keeping the links between queue elements intact. For this purpose
> the event channel contains last_priority and last_vcpu_id values
> elements for being able to identify the old queue.
> 
> In order to avoid races always access last_priority and last_vcpu_id
> with a single atomic operation avoiding any inconsistencies.
> 
> Signed-off-by: Juergen Gross <jgross@suse.com>

I seem to vaguely recall that at the time this seemingly racy
access was done on purpose by David. Did you go look at the
old commits to understand whether there really is a race which
can't be tolerated within the spec?

> --- a/xen/include/xen/sched.h
> +++ b/xen/include/xen/sched.h
> @@ -114,8 +114,7 @@ struct evtchn
>          u16 virq;      /* state == ECS_VIRQ */
>      } u;
>      u8 priority;
> -    u8 last_priority;
> -    u16 last_vcpu_id;
> +    u32 fifo_lastq;    /* Data for fifo events identifying last queue. */

This grows struct evtchn's size on at least 32-bit Arm. I'd
like to suggest including "priority" in the union, and call the
new field simply "fifo" or some such.

Jan

