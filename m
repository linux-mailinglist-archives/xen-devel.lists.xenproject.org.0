Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 04464392706
	for <lists+xen-devel@lfdr.de>; Thu, 27 May 2021 07:54:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.132805.247652 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lm8yG-0008Fj-Nl; Thu, 27 May 2021 05:54:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 132805.247652; Thu, 27 May 2021 05:54:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lm8yG-0008Dp-KI; Thu, 27 May 2021 05:54:16 +0000
Received: by outflank-mailman (input) for mailman id 132805;
 Thu, 27 May 2021 05:54:15 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=HjtO=KW=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lm8yF-0008Dj-88
 for xen-devel@lists.xenproject.org; Thu, 27 May 2021 05:54:15 +0000
Received: from smtp-out1.suse.de (unknown [195.135.220.28])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 39f3508b-7916-4481-bb2f-6ea2897ef43f;
 Thu, 27 May 2021 05:54:10 +0000 (UTC)
Received: from imap.suse.de (imap-alt.suse-dmz.suse.de [192.168.254.47])
 (using TLSv1.2 with cipher ECDHE-ECDSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 36E57218D6;
 Thu, 27 May 2021 05:54:09 +0000 (UTC)
Received: from director2.suse.de (director2.suse-dmz.suse.de [192.168.254.72])
 by imap.suse.de (Postfix) with ESMTPSA id 1BA4411A98;
 Thu, 27 May 2021 05:54:09 +0000 (UTC)
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
X-Inumbo-ID: 39f3508b-7916-4481-bb2f-6ea2897ef43f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1622094849; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=cenKBmpg3IsK1rgGAIPzboMPz4WWFEeK3q+oV059KHM=;
	b=eXJClXW74ampbup5vQmG5n9z2tdXGPb3KrBkLaSy2W+mS7Y+joYRnfZGZ64diLtpFVcl3V
	0Bdv+D7+5c5sLYz2MKo4vCRs+7D2UR21YtJj884J5GGp0a50sJvDGBdWxveA2JyAfTHVUq
	ggXjpbYXQ+pxW40EZU2Ymh18K11eFeI=
Subject: Re: [PATCH 05/13] xenpm: Change get-cpufreq-para output for internal
From: Jan Beulich <jbeulich@suse.com>
To: Jason Andryuk <jandryuk@gmail.com>
Cc: Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <20210503192810.36084-1-jandryuk@gmail.com>
 <20210503192810.36084-6-jandryuk@gmail.com>
 <a8180fa6-9b7d-52cd-c055-71ca28b08325@suse.com>
Message-ID: <e6566c5d-f5ac-5724-cb26-a74b362da9e4@suse.com>
Date: Thu, 27 May 2021 07:54:05 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.2
MIME-Version: 1.0
In-Reply-To: <a8180fa6-9b7d-52cd-c055-71ca28b08325@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 26.05.2021 17:21, Jan Beulich wrote:
> On 03.05.2021 21:28, Jason Andryuk wrote:
>> --- a/tools/misc/xenpm.c
>> +++ b/tools/misc/xenpm.c
>> @@ -711,6 +711,7 @@ void start_gather_func(int argc, char *argv[])
>>  /* print out parameters about cpu frequency */
>>  static void print_cpufreq_para(int cpuid, struct xc_get_cpufreq_para *p_cpufreq)
>>  {
>> +    bool internal = strstr(p_cpufreq->scaling_governor, "internal");
> 
> Like suggested for the hypervisor, perhaps better check for names
> ending in "-internal"?

Thinking about it more, the adjustments you make aren't necessarily
applicable to other hypothetical internal governors, are they? In
which case you rather want to check for hwp specifically.

Jan

