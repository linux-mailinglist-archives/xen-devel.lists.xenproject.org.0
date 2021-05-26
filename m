Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C68D139189B
	for <lists+xen-devel@lfdr.de>; Wed, 26 May 2021 15:19:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.132496.247119 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lltQk-0004ym-W7; Wed, 26 May 2021 13:18:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 132496.247119; Wed, 26 May 2021 13:18:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lltQk-0004wk-SH; Wed, 26 May 2021 13:18:38 +0000
Received: by outflank-mailman (input) for mailman id 132496;
 Wed, 26 May 2021 13:18:36 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ZGBu=KV=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lltQi-0004wd-NY
 for xen-devel@lists.xenproject.org; Wed, 26 May 2021 13:18:36 +0000
Received: from smtp-out2.suse.de (unknown [195.135.220.29])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 6e0c7ee0-f5eb-40ed-bc05-ec69dc22df22;
 Wed, 26 May 2021 13:18:35 +0000 (UTC)
Received: from imap.suse.de (imap-alt.suse-dmz.suse.de [192.168.254.47])
 by smtp-out2.suse.de (Postfix) with ESMTP id D50D21FD29;
 Wed, 26 May 2021 13:18:34 +0000 (UTC)
Received: from director2.suse.de (director2.suse-dmz.suse.de [192.168.254.72])
 by imap.suse.de (Postfix) with ESMTPSA id C218711A98;
 Wed, 26 May 2021 13:18:34 +0000 (UTC)
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
X-Inumbo-ID: 6e0c7ee0-f5eb-40ed-bc05-ec69dc22df22
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1622035114; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=c/RaWJzeeSzUVsZjxQFr9uaJNCVGVhWTqv3Zw8iL1fc=;
	b=EapiWJsHHON8KctPld+xvh3y2XUGZgJNYPOzxkgKupLvUIZm8rBM/be0pI297i3ZIeR0qs
	Jcd+5DRL3q36lDb8dmmBR43hjcr05aPpn6rF8096poGbYKc0N8BOLBJWwQGq5nENaj2OJ/
	rlZtPA/UdpjF5d6TO33B8nZY1/kNoFA=
Subject: Re: [PATCH 01/13] cpufreq: Allow restricting to internal governors
 only
To: Jason Andryuk <jandryuk@gmail.com>
References: <20210503192810.36084-1-jandryuk@gmail.com>
 <20210503192810.36084-2-jandryuk@gmail.com>
Cc: xen-devel@lists.xenproject.org
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <927b886a-9b0c-2162-763b-9c2147227b8c@suse.com>
Date: Wed, 26 May 2021 15:18:30 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.2
MIME-Version: 1.0
In-Reply-To: <20210503192810.36084-2-jandryuk@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 03.05.2021 21:27, Jason Andryuk wrote:
> For hwp, the standard governors are not usable, and only the internal
> one is applicable.

So you say "one" here but use plural in the subject. Which one is
it (going to be)?

>  Add the cpufreq_governor_internal boolean to
> indicate when an internal governor, like hwp-internal, will be used.
> This is set during presmp_initcall, so that it can suppress governor

DYM s/is/will be/? Afaict this is going to happen later in the series.
Which is a good indication that such "hanging in the air" changes
aren't necessarily the best way of splitting a set of changes, ...

> --- a/xen/drivers/cpufreq/cpufreq.c
> +++ b/xen/drivers/cpufreq/cpufreq.c
> @@ -57,6 +57,7 @@ struct cpufreq_dom {
>  };
>  static LIST_HEAD_READ_MOSTLY(cpufreq_dom_list_head);
>  
> +bool __read_mostly cpufreq_governor_internal;

... also supported by you introducing a non-static variable without
any consumer outside of this file (and without any producer at all).

> @@ -122,6 +123,9 @@ int __init cpufreq_register_governor(struct cpufreq_governor *governor)
>      if (!governor)
>          return -EINVAL;
>  
> +    if (cpufreq_governor_internal && strstr(governor->name, "internal") == NULL)

I wonder whether designating any governors ending in "-internal"
wouldn't be less prone for possible future ambiguities.

> --- a/xen/include/acpi/cpufreq/cpufreq.h
> +++ b/xen/include/acpi/cpufreq/cpufreq.h
> @@ -115,6 +115,7 @@ extern struct cpufreq_governor cpufreq_gov_dbs;
>  extern struct cpufreq_governor cpufreq_gov_userspace;
>  extern struct cpufreq_governor cpufreq_gov_performance;
>  extern struct cpufreq_governor cpufreq_gov_powersave;
> +extern bool cpufreq_governor_internal;

Please separate from the governor declarations by a blank line.

Sorry, all quite nit-like remarks, but still ...

Jan

