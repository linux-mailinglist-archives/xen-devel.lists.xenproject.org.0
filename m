Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 39DFC391C02
	for <lists+xen-devel@lfdr.de>; Wed, 26 May 2021 17:30:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.132598.247273 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1llvU5-0007l3-N0; Wed, 26 May 2021 15:30:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 132598.247273; Wed, 26 May 2021 15:30:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1llvU5-0007iT-Jn; Wed, 26 May 2021 15:30:13 +0000
Received: by outflank-mailman (input) for mailman id 132598;
 Wed, 26 May 2021 15:30:11 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ZGBu=KV=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1llvU3-0007iN-Aw
 for xen-devel@lists.xenproject.org; Wed, 26 May 2021 15:30:11 +0000
Received: from smtp-out1.suse.de (unknown [195.135.220.28])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 445dedcd-f50b-4cc9-aec7-897f1bcb5586;
 Wed, 26 May 2021 15:30:10 +0000 (UTC)
Received: from imap.suse.de (imap-alt.suse-dmz.suse.de [192.168.254.47])
 (using TLSv1.2 with cipher ECDHE-ECDSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 5184F218DB;
 Wed, 26 May 2021 15:21:21 +0000 (UTC)
Received: from director2.suse.de (director2.suse-dmz.suse.de [192.168.254.72])
 by imap.suse.de (Postfix) with ESMTPSA id 309DA11A98;
 Wed, 26 May 2021 15:21:21 +0000 (UTC)
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
X-Inumbo-ID: 445dedcd-f50b-4cc9-aec7-897f1bcb5586
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1622042481; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=YzBKnSnWaD5YH4S63kNMFRWzin/vk7cbPdsaL2ae/GY=;
	b=UYRNgKzhDTF4XoCsKBio0coNtDMW6NNbaL+iQ7e0y02koXaXCu5UXsb9cjLsX2oXzspluN
	QFCvVcf+rTSrstQyMz5EtcI5aA+ukQyf64oVEDGQjvKRvHoh46j0BgTk90hF4LwfI7sFMV
	mkOO8oU55ovixoREjVVeXuuRMupgQDk=
Subject: Re: [PATCH 05/13] xenpm: Change get-cpufreq-para output for internal
To: Jason Andryuk <jandryuk@gmail.com>
Cc: Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <20210503192810.36084-1-jandryuk@gmail.com>
 <20210503192810.36084-6-jandryuk@gmail.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <a8180fa6-9b7d-52cd-c055-71ca28b08325@suse.com>
Date: Wed, 26 May 2021 17:21:17 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.2
MIME-Version: 1.0
In-Reply-To: <20210503192810.36084-6-jandryuk@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 03.05.2021 21:28, Jason Andryuk wrote:
> --- a/tools/misc/xenpm.c
> +++ b/tools/misc/xenpm.c
> @@ -711,6 +711,7 @@ void start_gather_func(int argc, char *argv[])
>  /* print out parameters about cpu frequency */
>  static void print_cpufreq_para(int cpuid, struct xc_get_cpufreq_para *p_cpufreq)
>  {
> +    bool internal = strstr(p_cpufreq->scaling_governor, "internal");

Like suggested for the hypervisor, perhaps better check for names
ending in "-internal"?

> @@ -720,10 +721,19 @@ static void print_cpufreq_para(int cpuid, struct xc_get_cpufreq_para *p_cpufreq)
>          printf(" %d", p_cpufreq->affected_cpus[i]);
>      printf("\n");
>  
> -    printf("cpuinfo frequency    : max [%u] min [%u] cur [%u]\n",
> -           p_cpufreq->cpuinfo_max_freq,
> -           p_cpufreq->cpuinfo_min_freq,
> -           p_cpufreq->cpuinfo_cur_freq);
> +    if ( internal )
> +    {
> +        printf("cpuinfo frequency    : base [%u] turbo [%u]\n",
> +               p_cpufreq->cpuinfo_min_freq,
> +               p_cpufreq->cpuinfo_max_freq);
> +    }
> +    else
> +    {
> +        printf("cpuinfo frequency    : max [%u] min [%u] cur [%u]\n",
> +               p_cpufreq->cpuinfo_max_freq,
> +               p_cpufreq->cpuinfo_min_freq,
> +               p_cpufreq->cpuinfo_cur_freq);
> +    }

Since the file adopts hypervisor coding style, the unnecessary
braces would again better be omitted.

Jan

