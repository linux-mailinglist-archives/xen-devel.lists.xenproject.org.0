Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D9D17EB852
	for <lists+xen-devel@lfdr.de>; Tue, 14 Nov 2023 22:16:26 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.633267.987923 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r30l1-0004Wb-P1; Tue, 14 Nov 2023 21:15:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 633267.987923; Tue, 14 Nov 2023 21:15:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r30l1-0004UY-Lv; Tue, 14 Nov 2023 21:15:39 +0000
Received: by outflank-mailman (input) for mailman id 633267;
 Tue, 14 Nov 2023 21:15:38 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1r30l0-0004US-EA
 for xen-devel@lists.xenproject.org; Tue, 14 Nov 2023 21:15:38 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1r30kz-0007pw-Mz; Tue, 14 Nov 2023 21:15:37 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.1.240])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1r30kz-0005Jd-Hi; Tue, 14 Nov 2023 21:15:37 +0000
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID;
	bh=GqmJyw3dpAnI+5W3ysWe3GwbGKaU7wQTcFZjwI5Ao+g=; b=GWQyRHsbdunxivx3GlGWeA5d/s
	7z8ka7I+Z7cGsBriAYjML4MjU73w+pbRCBX4mf7odRywJUeFH9gRtagufvQjQv4foSjLpxGUieHGe
	rtN58lyfHlyoSubh6ww3Ujzv5vav4gXReUZmksX3hO2XVmTznw/A8RrIwQESZF4yqrBs=;
Message-ID: <6d7e4dd7-726f-4489-8a17-a1ea55587892@xen.org>
Date: Tue, 14 Nov 2023 21:15:36 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/5] tools/xenstored: remove "-N" command line option
Content-Language: en-GB
To: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org
Cc: Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>
References: <20231113124309.10862-1-jgross@suse.com>
 <20231113124309.10862-5-jgross@suse.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20231113124309.10862-5-jgross@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 13/11/2023 12:43, Juergen Gross wrote:
> The "-N" (do not daemonize) command line option is of questionable use:
> its sole purpose seems to be to aid debugging of xenstored by making it
> easier to start xenstored under gdb, or to see any debug messages
> easily.
> 
> Debug messages can as well be sent to syslog(), while gdb can be
> attached to the daemon easily. The only not covered case is an error
> while initializing xenstored, but this could be handled e.g. by saving
> a core dump, which can be analyzed later.

The slight trouble is a debug message in the syslog (such as from 
barf()) is often not enough. What you want is a coredump or attach gdb 
to analyze.

For the former, I found quite useful when debugging the Live-Update code 
to replace exit() with abort() in bar*(). So a coredump will be 
generated anytime barf*() is called.

> 
> The call of talloc_enable_leak_report_full() done only with "-N"
> specified is no longer needed, as the same can be achieved via
> "xenstore-control memreport".
> 
> Signed-off-by: Juergen Gross <jgross@suse.com>
> ---
> Slightly RFC, as this is making debugging a little bit harder in
> specific cases. OTOH I didn't use this option since years, in spite of
> having done a _lot_ of xenstore hacking.

I have used a few times but when trying to run Xenstored with ASAN but 
this wasn't trivial to use.

> 
> Signed-off-by: Juergen Gross <jgross@suse.com>

Reviewed-by: Julien Grall <jgrall@amazon.com.

Cheers,

-- 
Julien Grall

