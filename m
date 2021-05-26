Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 97D6E39192F
	for <lists+xen-devel@lfdr.de>; Wed, 26 May 2021 15:47:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.132518.247149 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1llts3-0000Vn-J1; Wed, 26 May 2021 13:46:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 132518.247149; Wed, 26 May 2021 13:46:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1llts3-0000TC-Fu; Wed, 26 May 2021 13:46:51 +0000
Received: by outflank-mailman (input) for mailman id 132518;
 Wed, 26 May 2021 13:46:50 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ZGBu=KV=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1llts2-0000T6-IN
 for xen-devel@lists.xenproject.org; Wed, 26 May 2021 13:46:50 +0000
Received: from smtp-out1.suse.de (unknown [195.135.220.28])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 9194cb9a-5b12-452a-b352-1b2048d5c4ca;
 Wed, 26 May 2021 13:46:49 +0000 (UTC)
Received: from imap.suse.de (imap-alt.suse-dmz.suse.de [192.168.254.47])
 by smtp-out1.suse.de (Postfix) with ESMTP id 11316218C1;
 Wed, 26 May 2021 13:27:14 +0000 (UTC)
Received: from director2.suse.de (director2.suse-dmz.suse.de [192.168.254.72])
 by imap.suse.de (Postfix) with ESMTPSA id E5D3711A98;
 Wed, 26 May 2021 13:27:13 +0000 (UTC)
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
X-Inumbo-ID: 9194cb9a-5b12-452a-b352-1b2048d5c4ca
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1622035634; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=CX/wrSTqHD/qc2J/s31eFXwhF2y71gJjkVHsKXIRBuY=;
	b=oqatW4EKVQ7t4b9SAAQbSGSH3qLCyA6bc6I1C4Jpq6MRCLAmo7eF1DE57MwFz17IEgttpF
	zoLbBCMp4NtQXNCYurJ6t9PtVqa3GVy7FGblKuuXJ8vyxbTCZk4yMoDOMo5FGFnKKVVLEf
	k5CPajSPCrKz41o54KbQsQ3ViCvZDbw=
Subject: Re: [PATCH 03/13] cpufreq: Export intel_feature_detect
To: Jason Andryuk <jandryuk@gmail.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, xen-devel@lists.xenproject.org
References: <20210503192810.36084-1-jandryuk@gmail.com>
 <20210503192810.36084-4-jandryuk@gmail.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <68c32d6e-8c6f-35da-c9cd-a560d3d6895b@suse.com>
Date: Wed, 26 May 2021 15:27:10 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.2
MIME-Version: 1.0
In-Reply-To: <20210503192810.36084-4-jandryuk@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 03.05.2021 21:28, Jason Andryuk wrote:
> Export feature_detect as intel_feature_detect so it can be re-used by
> HWP.
> 
> Signed-off-by: Jason Andryuk <jandryuk@gmail.com>

Acked-by: Jan Beulich <jbeulich@suse.com>
albeit ...

> --- a/xen/arch/x86/acpi/cpufreq/cpufreq.c
> +++ b/xen/arch/x86/acpi/cpufreq/cpufreq.c
> @@ -340,7 +340,7 @@ static unsigned int get_cur_freq_on_cpu(unsigned int cpu)
>      return extract_freq(get_cur_val(cpumask_of(cpu)), data);
>  }
>  
> -static void feature_detect(void *info)
> +void intel_feature_detect(void *info)
>  {
>      struct cpufreq_policy *policy = info;

... because of this (requiring the hwp code to stay in sync with
possible changes here, without the compiler being able to point
out inconsistencies) I'm not overly happy with such a change. Yet
I guess this isn't the first case we have in the code base.

Jan

