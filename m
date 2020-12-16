Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CE322DBC78
	for <lists+xen-devel@lfdr.de>; Wed, 16 Dec 2020 09:13:57 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.55101.95875 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kpRvQ-0006lf-4Z; Wed, 16 Dec 2020 08:12:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 55101.95875; Wed, 16 Dec 2020 08:12:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kpRvQ-0006lG-0n; Wed, 16 Dec 2020 08:12:44 +0000
Received: by outflank-mailman (input) for mailman id 55101;
 Wed, 16 Dec 2020 08:12:43 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=uZEz=FU=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kpRvP-0006lB-5X
 for xen-devel@lists.xenproject.org; Wed, 16 Dec 2020 08:12:43 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 6ff6bf1a-01bf-424c-a5be-d29a118f6f37;
 Wed, 16 Dec 2020 08:12:41 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id ECEBAACBD;
 Wed, 16 Dec 2020 08:12:40 +0000 (UTC)
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
X-Inumbo-ID: 6ff6bf1a-01bf-424c-a5be-d29a118f6f37
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1608106361; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=7ValLgEYg1KF55nl6jtub6eAGN5kJomEIMPabfj9FNg=;
	b=L9k5pgKgmcGhB75QAL5J+KZORFEZIh8g3YapR0dsEfJSZaRegsqssj27mT2SDiB5+J598m
	PCvsNgorp7Wc+3U+C8gA1sPlsC3/WjxQ7ZTgCOPegrEntF9ZbunaxD1+8fOMj6mqV9M63i
	RGkQL2xUKm6ZF2YtrVwKuA25facusOA=
Subject: Re: Recent upgrade of 4.13 -> 4.14 issue
To: Liwei <xieliwei@gmail.com>
Cc: =?UTF-8?B?RnLDqWTDqXJpYyBQaWVycmV0?= <frederic.pierret@qubes-os.org>,
 Dario Faggioli <dfaggioli@suse.com>, xen-devel@lists.xenproject.org
References: <mailman.2112.1604414193.711.xen-devel@lists.xenproject.org>
 <CAPE0SYz0be1ZOoNqDHpeJWeZS-1BM_zy50=Cmeo+4Aq1Na0eNQ@mail.gmail.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <4a0d9b00-5f1f-e9e1-fccf-1f26762134e8@suse.com>
Date: Wed, 16 Dec 2020 09:12:40 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.1
MIME-Version: 1.0
In-Reply-To: <CAPE0SYz0be1ZOoNqDHpeJWeZS-1BM_zy50=Cmeo+4Aq1Na0eNQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 15.12.2020 20:08, Liwei wrote:
> Hi list,
>     This is a reply to the thread of the same title (linked here:
> https://www.mail-archive.com/xen-devel@lists.xenproject.org/msg84916.html
> ) which I could not reply to because I receive this list by digest.
> 
>     I'm unclear if this is exactly the reason, but I experienced the
> same symptoms when upgrading to 4.14. The issue does not occur if I
> downgrade to 4.11 (the previous version that was provided by Debian).
> Kernel is 5.9.11 and unchanged between xen versions.
> 
>     One thing I noticed is that if I disable the monitor/mwait
> instructions on my CPU (Intel Xeon E5-2699 v4 ES), the stalls seem to
> occur later into the boot. With the instructions enabled, the system
> usually stalls less than a few minutes after boot; disabled, it can
> last for tens of minutes.
> 
>     Further disabling the HPET or forcing the kernel to use PIT causes
> it to be somewhat usable. The stalls still occur tens of minutes in
> but somehow everything seems to continue chugging along fine?

By "the kernel" do you really mean the kernel, or Xen?

>     I've also verified that the stalls do not occur in all the above
> cases if I just boot into the kernel without xen.
> 
>     When the stalls happen, I get the "rcu: INFO: rcu_sched detected
> stalls on CPUs/tasks" backtraces printed on the console periodically,
> but keystrokes don't do anything on the console, and I can't spawn new
> SSH sessions even though pinging the system produces a reply. The last
> item in the call trace is usually "xen_safe_halt", but I've seen it
> occur for other functions related to btrfs and the network adapter as
> well.

The kernel log may not be the only relevant thing here - the hypervisor
log may also need looking at (with full verbosity enabled and
preferably a debug build in use).

>     Do let me know if there's anything I can provide to help
> troubleshoot this. At the moment I've reverted to 4.11, but I can
> temporarily switch over to 4.14 to collect any necessary information.

In that earlier thread a number of things to try were suggested, iirc
(switching scheduler or disabling use of deep C states come to mind).
Did you experiment with those? If so, can you let us know of the
results, so we can see whether there's a pattern?

Jan

