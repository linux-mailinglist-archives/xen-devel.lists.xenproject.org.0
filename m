Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E74E28CFC3
	for <lists+xen-devel@lfdr.de>; Tue, 13 Oct 2020 16:02:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.6226.16538 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kSKsi-0007Eo-Vw; Tue, 13 Oct 2020 14:02:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 6226.16538; Tue, 13 Oct 2020 14:02:24 +0000
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
	id 1kSKsi-0007ER-Sg; Tue, 13 Oct 2020 14:02:24 +0000
Received: by outflank-mailman (input) for mailman id 6226;
 Tue, 13 Oct 2020 14:02:23 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=VY8U=DU=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kSKsh-0007EM-Ll
 for xen-devel@lists.xenproject.org; Tue, 13 Oct 2020 14:02:23 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 970a5cd2-25e3-4fbc-865c-fa55bbafd943;
 Tue, 13 Oct 2020 14:02:23 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 2D49AAC82;
 Tue, 13 Oct 2020 14:02:22 +0000 (UTC)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=VY8U=DU=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
	id 1kSKsh-0007EM-Ll
	for xen-devel@lists.xenproject.org; Tue, 13 Oct 2020 14:02:23 +0000
X-Inumbo-ID: 970a5cd2-25e3-4fbc-865c-fa55bbafd943
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 970a5cd2-25e3-4fbc-865c-fa55bbafd943;
	Tue, 13 Oct 2020 14:02:23 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1602597742;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ZTMb8P3RFOYYRXGyxDpKdMUHUSlVSwvG1R2W7s/1H4g=;
	b=RMecgYoymqF44kWIXrvOlavRoB4icldnKtXAeGWHvennoW1TDVSM+L6lGEz2YJkj6Qo0Pd
	tuNbvAlJe2I65tH2iv71wFkvWLgExWNUra6C8S4MxiIRETusrFgqALUqLog2sUznFrBAsA
	Y+0Nybry2P7cTocR3j19SgPiR3A63Nc=
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 2D49AAC82;
	Tue, 13 Oct 2020 14:02:22 +0000 (UTC)
Subject: Re: [PATCH v2 2/2] xen/evtchn: rework per event channel lock
To: Juergen Gross <jgross@suse.com>
Cc: xen-devel@lists.xenproject.org, Andrew Cooper
 <andrew.cooper3@citrix.com>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>, Wei Liu <wl@xen.org>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>
References: <20201012092740.1617-1-jgross@suse.com>
 <20201012092740.1617-3-jgross@suse.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <3a15ba70-c6b1-dd07-12fe-f8d7a1e6c4d9@suse.com>
Date: Tue, 13 Oct 2020 16:02:19 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20201012092740.1617-3-jgross@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 12.10.2020 11:27, Juergen Gross wrote:
> Currently the lock for a single event channel needs to be taken with
> interrupts off, which causes deadlocks in some cases.
> 
> Rework the per event channel lock to be non-blocking for the case of
> sending an event and removing the need for disabling interrupts for
> taking the lock.
> 
> The lock is needed for avoiding races between sending an event or
> querying the channel's state against removal of the event channel.
> 
> Use a locking scheme similar to a rwlock, but with some modifications:
> 
> - sending an event or querying the event channel's state uses an
>   operation similar to read_trylock(), in case of not obtaining the
>   lock the sending is omitted or a default state is returned

And how come omitting the send or returning default state is valid?

Jan

