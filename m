Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C6E829CE8A
	for <lists+xen-devel@lfdr.de>; Wed, 28 Oct 2020 08:46:19 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.13331.33894 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kXg9Y-0003RU-A0; Wed, 28 Oct 2020 07:45:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 13331.33894; Wed, 28 Oct 2020 07:45:52 +0000
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
	id 1kXg9Y-0003R5-70; Wed, 28 Oct 2020 07:45:52 +0000
Received: by outflank-mailman (input) for mailman id 13331;
 Wed, 28 Oct 2020 07:45:50 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=dk2S=ED=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kXg9W-0003R0-S9
 for xen-devel@lists.xenproject.org; Wed, 28 Oct 2020 07:45:50 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 3caef230-27a6-405f-adbe-60eb8dcc4987;
 Wed, 28 Oct 2020 07:45:49 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id A059AACDB;
 Wed, 28 Oct 2020 07:45:48 +0000 (UTC)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=dk2S=ED=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
	id 1kXg9W-0003R0-S9
	for xen-devel@lists.xenproject.org; Wed, 28 Oct 2020 07:45:50 +0000
X-Inumbo-ID: 3caef230-27a6-405f-adbe-60eb8dcc4987
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 3caef230-27a6-405f-adbe-60eb8dcc4987;
	Wed, 28 Oct 2020 07:45:49 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1603871148;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+Wpz5kToeasQpm0ZCbD9yjn9dEBHaiD7pOorXoT+ulA=;
	b=QQq3/IbjlZ+dN8WfbF4jvMc6EmLI4P50iwmcH20Gdm7Zc9fwJ/brdhO1GGUPpfoPxSgOWr
	jZ3WtG+UGm3uXUNI+21KZtnQpXb7zsBQIMuoiiOUUGbDCcHkWdmUFm1Y6H515OYnRzoCkC
	T/92iYdB1x8QBYScT6NOWriNKBdG10g=
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id A059AACDB;
	Wed, 28 Oct 2020 07:45:48 +0000 (UTC)
Subject: Re: BUG: credit=sched2 machine hang when using DRAKVUF
To: =?UTF-8?Q?Micha=c5=82_Leszczy=c5=84ski?= <michal.leszczynski@cert.pl>
Cc: xen-devel@lists.xenproject.org, =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?=
 <jgross@suse.com>
References: <157653679.6164.1603407559737.JavaMail.zimbra@nask.pl>
 <a80f05ac-bd18-563e-12f7-1a0f9f0d4f6b@suse.com>
 <1747162107.4472424.1603850652584.JavaMail.zimbra@nask.pl>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <66f4b628-970c-9990-118a-572f971d6ed2@suse.com>
Date: Wed, 28 Oct 2020 08:45:49 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <1747162107.4472424.1603850652584.JavaMail.zimbra@nask.pl>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 28.10.2020 03:04, Michał Leszczyński wrote:
> As I've said before, I'm using RELEASE-4.14.0, this is DELL PowerEdge R640 with 14 PCPUs.

I.e. you haven't tried the tip of the 4.14 stable branch?

> I have the following additional pieces of log (enclosed below). As you could see, the issue is about particular vCPUs of Dom0 not being scheduled for a long time, which really decreases stability of the host system.

I have to admit that the log makes me wonder whether this isn't a
Dom0 internal issue:

> [  338.968676] watchdog: BUG: soft lockup - CPU#5 stuck for 22s! [sshd:5991]
> [  346.963959] watchdog: BUG: soft lockup - CPU#2 stuck for 23s! [xenconsoled:2747]

For these two vCPU-s we see ...

> (XEN) Domain info:
> (XEN)   Domain: 0 w 256 c 0 v 14
> (XEN)     1: [0.0] flags=20 cpu=0 credit=-10000000 [w=256] load=4594 (~1%)
> (XEN)     2: [0.1] flags=20 cpu=2 credit=9134904 [w=256] load=262144 (~100%)
> (XEN)     3: [0.2] flags=22 cpu=4 credit=-10000000 [w=256] load=262144 (~100%)
> (XEN)     4: [0.3] flags=20 cpu=6 credit=-10000000 [w=256] load=4299 (~1%)
> (XEN)     5: [0.4] flags=20 cpu=8 credit=-10000000 [w=256] load=4537 (~1%)
> (XEN)     6: [0.5] flags=22 cpu=10 credit=-10000000 [w=256] load=262144 (~100%)

... that both are fully loaded and ...

> (XEN) Runqueue 0:
> (XEN) CPU[00] runq=0, sibling={0}, core={0,2,4,6,8,10,12,14,16,18,20,22,24,26}
> (XEN) CPU[02] runq=0, sibling={2}, core={0,2,4,6,8,10,12,14,16,18,20,22,24,26}
> (XEN) CPU[04] runq=0, sibling={4}, core={0,2,4,6,8,10,12,14,16,18,20,22,24,26}
> (XEN)   run: [0.2] flags=22 cpu=4 credit=-10000000 [w=256] load=262144 (~100%)
> (XEN) CPU[06] runq=0, sibling={6}, core={0,2,4,6,8,10,12,14,16,18,20,22,24,26}
> (XEN) CPU[08] runq=0, sibling={8}, core={0,2,4,6,8,10,12,14,16,18,20,22,24,26}
> (XEN) CPU[10] runq=0, sibling={10}, core={0,2,4,6,8,10,12,14,16,18,20,22,24,26}
> (XEN)   run: [0.5] flags=22 cpu=10 credit=-10000000 [w=256] load=262144 (~100%)

... they're actively running, confirmed another time ...

> (XEN) RUNQ:
> (XEN) CPUs info:
> (XEN) CPU[00] current=d[IDLE]v0, curr=d[IDLE]v0, prev=NULL
> (XEN) CPU[02] current=d[IDLE]v2, curr=d[IDLE]v2, prev=NULL
> (XEN) CPU[04] current=d0v2, curr=d0v2, prev=NULL
> (XEN) CPU[06] current=d[IDLE]v6, curr=d[IDLE]v6, prev=NULL
> (XEN) CPU[08] current=d[IDLE]v8, curr=d[IDLE]v8, prev=NULL
> (XEN) CPU[10] current=d0v5, curr=d0v5, prev=NULL

... here. Hence an additional question is what exactly they're doing.
'0' and possibly 'd' debug key output may shed some light on it, but
to interpret that output the exact kernel and hypervisor binaries
would need to be known / available.

Furthermore to tell dead lock from live lock, more than one invocation
of any of the involved debug keys is often helpful.

Jan

