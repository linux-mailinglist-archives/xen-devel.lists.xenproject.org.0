Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FD1C3C188B
	for <lists+xen-devel@lfdr.de>; Thu,  8 Jul 2021 19:40:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.153255.283154 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m1Y0V-00083b-PQ; Thu, 08 Jul 2021 17:40:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 153255.283154; Thu, 08 Jul 2021 17:40:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m1Y0V-00081A-Li; Thu, 08 Jul 2021 17:40:15 +0000
Received: by outflank-mailman (input) for mailman id 153255;
 Thu, 08 Jul 2021 17:40:14 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1m1Y0U-00080S-5C
 for xen-devel@lists.xenproject.org; Thu, 08 Jul 2021 17:40:14 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1m1Y0T-0003SB-Bi; Thu, 08 Jul 2021 17:40:13 +0000
Received: from [54.239.6.177] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1m1Y0T-0000rh-5s; Thu, 08 Jul 2021 17:40:13 +0000
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
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
	MIME-Version:Date:Message-ID:From:References:Cc:To:Subject;
	bh=7KxRVb+n4c1aHg1YBSgHb3C37SPmmOt7z4Bqs3aKzKc=; b=oj0mN/U8s1ZmOR9Kjux5NZEaTQ
	UfCAGRziEu9mq2sWAgczNei7DPnb/roH0HJEOKZr7EHSLpGPwv2qxfZWoTYgcjlNKnCawhA8b+G3W
	V3poZfDWVnY/I9ebbeBaEp/g/NqUbu9Yeqc9PhNJM+q+3w9c9MuPLKnCfhYKJDg67kUU=;
Subject: Re: [PATCH v2 1/2] tools/xenstore: set oom score for xenstore daemon
 on Linux
To: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org
Cc: Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>
References: <20210608055839.10313-1-jgross@suse.com>
 <20210608055839.10313-2-jgross@suse.com>
From: Julien Grall <julien@xen.org>
Message-ID: <467dc0c1-cf0a-2aaf-0c99-c1ca70b95912@xen.org>
Date: Thu, 8 Jul 2021 18:40:11 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210608055839.10313-2-jgross@suse.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

Hi Juergen,

On 08/06/2021 06:58, Juergen Gross wrote:
> Xenstored is absolutely mandatory for a Xen host and it can't be
> restarted, so being killed by OOM-killer in case of memory shortage is
> to be avoided.
> 
> Set /proc/$pid/oom_score_adj (if available) to -500 in order to allow
> xenstored to use large amounts of memory without being killed.
> 
> Make sure the pid file isn't a left-over from a previous run delete it
> before starting xenstored.

This sentence is a bit confusing to read. Do you mean "*To* make 
sure....*,* delete it before"?

> 
> Signed-off-by: Juergen Gross <jgross@suse.com>
> ---
> V2:
> - set oom score from launch script (Julien Grall)
> - split off open file descriptor limit setting (Julien Grall)
> ---
>   tools/hotplug/Linux/launch-xenstore.in | 3 +++
>   1 file changed, 3 insertions(+)
> 
> diff --git a/tools/hotplug/Linux/launch-xenstore.in b/tools/hotplug/Linux/launch-xenstore.in
> index 019f9d6f4d..3ad71e3d08 100644
> --- a/tools/hotplug/Linux/launch-xenstore.in
> +++ b/tools/hotplug/Linux/launch-xenstore.in
> @@ -59,11 +59,14 @@ test -f @CONFIG_DIR@/@CONFIG_LEAF_DIR@/xencommons && . @CONFIG_DIR@/@CONFIG_LEAF
>   		echo "No xenstored found"
>   		exit 1
>   	}
> +	rm -f @XEN_RUN_DIR@/xenstored.pid
>   
>   	echo -n Starting $XENSTORED...
>   	$XENSTORED --pid-file @XEN_RUN_DIR@/xenstored.pid $XENSTORED_ARGS
>   
>   	systemd-notify --booted 2>/dev/null || timeout_xenstore $XENSTORED || exit 1
> +	XS_PID=`cat @XEN_RUN_DIR@/xenstored.pid`
> +	echo -500 >/proc/$XS_PID/oom_score_adj

NIT: It would be worth considering to introduce a variable so this can 
be set from the configuration file.

With or without it:

Acked-by: Julien Grall <jgrall@amazon.com>

Cheers,

-- 
Julien Grall

