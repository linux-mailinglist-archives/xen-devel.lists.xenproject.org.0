Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AE96461E6D8
	for <lists+xen-devel@lfdr.de>; Sun,  6 Nov 2022 23:19:35 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.439030.692971 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ornyE-0006s5-BD; Sun, 06 Nov 2022 22:18:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 439030.692971; Sun, 06 Nov 2022 22:18:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ornyE-0006p6-7H; Sun, 06 Nov 2022 22:18:26 +0000
Received: by outflank-mailman (input) for mailman id 439030;
 Sun, 06 Nov 2022 22:18:25 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1ornyD-0006p0-AR
 for xen-devel@lists.xenproject.org; Sun, 06 Nov 2022 22:18:25 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1ornyD-0002TY-2Q; Sun, 06 Nov 2022 22:18:25 +0000
Received: from gw1.octic.net ([81.187.162.82] helo=[10.0.1.102])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1ornyC-0001AL-Re; Sun, 06 Nov 2022 22:18:24 +0000
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
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:Subject:
	From:References:Cc:To:MIME-Version:Date:Message-ID;
	bh=GdkNH0pYzaFQ7fGvbHxJkefbGqKit1QqFWVdGTWv1q4=; b=QQDdTvH2oNhE0qVY5RHOj8tAhr
	eKoTdPrA3tT5EXktq/MlY5CfwmoKSY0JgsQOQHZ6X+kHak7X2h5acOURQAso2v+DOZktEoUzt0gba
	F+TvDysqQUlwFni85a8XlLiGvL3kNTsnyGPu5ZB7lrdt/kEJ2asFZtFUtZJZCgn+JP+U=;
Message-ID: <33e9e356-e8d7-2dfc-a71d-ecbf50a00786@xen.org>
Date: Sun, 6 Nov 2022 22:18:22 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.4.1
To: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Anthony PERARD <anthony.perard@citrix.com>
References: <20221101152842.4257-1-jgross@suse.com>
 <20221101152842.4257-20-jgross@suse.com>
From: Julien Grall <julien@xen.org>
Subject: Re: [PATCH 19/20] tools/xenstore: introduce trace classes
In-Reply-To: <20221101152842.4257-20-jgross@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Juergen,

I haven't yet look at the code itself. I wanted to comment on the 
external interfaces.


On 01/11/2022 15:28, Juergen Gross wrote:
> Make the xenstored internal trace configurable by adding classes
> which can be switched on and off independently from each other.
> 
> Define the following classes:
> 
> - obj: Creation and deletion of interesting "objects" (watch,
>    transaction, connection)
> - io: incoming requests and outgoing responses
> - wrl: write limiting
> 
> Per default "obj" and "io" are switched on.
> 
> Entries written via trace() will always be printed (if tracing is on
> at all).
> 
> Rename the misnamed xenstore-control commands "logfile" to "tracefile"
> and "log" to "trace".

While I understand this may be misnamed, this also means that there is 
an ABI breakage between current Xenstored and the future one.

I am not convinced this is justified. Therefore, I think we should at 
minimum keep the compatibility.

> 
> Add the capability to control the trace settings via the "trace"
> command and via a new "--trace-control" command line option.
> 
> Add a missing trace_create() call for creating a transaction.
> 
> Signed-off-by: Juergen Gross <jgross@suse.com>
> ---
>   docs/misc/xenstore.txt                 | 18 +++++++----
>   tools/xenstore/xenstored_control.c     | 41 +++++++++++++++++++-----
>   tools/xenstore/xenstored_core.c        | 44 +++++++++++++++++++++++---
>   tools/xenstore/xenstored_core.h        |  6 ++++
>   tools/xenstore/xenstored_domain.c      | 27 ++++++++--------
>   tools/xenstore/xenstored_transaction.c |  1 +
>   6 files changed, 105 insertions(+), 32 deletions(-)
> 
> diff --git a/docs/misc/xenstore.txt b/docs/misc/xenstore.txt
> index 44428ae3a7..9db0385120 100644
> --- a/docs/misc/xenstore.txt
> +++ b/docs/misc/xenstore.txt
> @@ -409,14 +409,8 @@ CONTROL			<command>|[<parameters>|]
>   		error string in case of failure. -s can return "BUSY" in case
>   		of an active transaction, a retry of -s can be done in that
>   		case.
> -	log|on
> -		turn xenstore logging on
> -	log|off
> -		turn xenstore logging off
> -	logfile|<file-name>
> -		log to specified file

Technically xenstore.txt is meant to describe an interface that is 
implementation agnostics. Can you outline in the documentation why 
removing them is fine?

>   	memreport|[<file-name>]
> -		print memory statistics to logfile (no <file-name>
> +		print memory statistics to tracefile (no <file-name>
>   		specified) or to specific file
>   	print|<string>
>   		print <string> to syslog (xenstore runs as daemon) or
> @@ -432,6 +426,16 @@ CONTROL			<command>|[<parameters>|]
>   		the domain <domid>
>   	quota-soft|[set <name> <val>]
>   		like the "quota" command, but for soft-quota.
> +	trace|[+|-<switch>]

The regex here is a bit ambiguous because it technically means either 
"+" or "-<switch>". Furthermore, within this docs, there are case where 
| is included in between [] to indicate the this is terminated by a \0.

So it would be better to define it over 3 lines:

trace
trace|+<switch>
trace|-<switch>

I think it would be fine if there is only one paragraph of explanation 
for the 3.

> +		without parameters: show possible trace switches
> +		+<switch> activates trace entries for <switch>,
> +		-<switch> deactivates trace entries for <switch>
> +	trace|on
> +		turn xenstore tracing on
> +	trace|off
> +		turn xenstore tracing off
> +	tracefile|<file-name>
> +		trace to specified file
>   	help			<supported-commands>
>   		return list of supported commands for CONTROL
>   

Cheers,

-- 
Julien Grall

