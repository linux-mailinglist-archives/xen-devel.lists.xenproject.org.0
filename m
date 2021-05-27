Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C96E392B14
	for <lists+xen-devel@lfdr.de>; Thu, 27 May 2021 11:47:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.132944.247912 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lmCaU-0003Zf-Qi; Thu, 27 May 2021 09:45:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 132944.247912; Thu, 27 May 2021 09:45:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lmCaU-0003Wt-MS; Thu, 27 May 2021 09:45:58 +0000
Received: by outflank-mailman (input) for mailman id 132944;
 Thu, 27 May 2021 09:45:57 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=HjtO=KW=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lmCaT-0003Wn-Kg
 for xen-devel@lists.xenproject.org; Thu, 27 May 2021 09:45:57 +0000
Received: from smtp-out1.suse.de (unknown [195.135.220.28])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id e7d14f91-6856-4b89-9659-88547c01e8f3;
 Thu, 27 May 2021 09:45:56 +0000 (UTC)
Received: from imap.suse.de (imap-alt.suse-dmz.suse.de [192.168.254.47])
 (using TLSv1.2 with cipher ECDHE-ECDSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id B23E42190B;
 Thu, 27 May 2021 09:45:55 +0000 (UTC)
Received: from director2.suse.de (director2.suse-dmz.suse.de [192.168.254.72])
 by imap.suse.de (Postfix) with ESMTPSA id 83F2611A98;
 Thu, 27 May 2021 09:45:55 +0000 (UTC)
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
X-Inumbo-ID: e7d14f91-6856-4b89-9659-88547c01e8f3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1622108755; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ZMfg0ZqAjEjaoCXvWTP+GjBsqLLG3fjL71ifeFrWL6I=;
	b=sp1a2HC7UbuUGf5kQsnOB9sQ0TqJzNc+AWUsNqDtyqLsd8/aFXk6twDGiwEaRrz3jtZYd1
	aZGFo7mlbi5PXXWBDGtxfyP79mtqzdz11a9Ky2ACz8TWl1bwNYcA0h1t515u75kTDUTNb9
	jm7RwEmS7gY8UYR5DS3nO6bwvXzO+fs=
Subject: Re: [PATCH 10/13] libxc: Add xc_set_cpufreq_hwp
To: Jason Andryuk <jandryuk@gmail.com>
Cc: Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <20210503192810.36084-1-jandryuk@gmail.com>
 <20210503192810.36084-11-jandryuk@gmail.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <8871a5b3-c03d-8438-b228-b1699c5b2747@suse.com>
Date: Thu, 27 May 2021 11:45:51 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.2
MIME-Version: 1.0
In-Reply-To: <20210503192810.36084-11-jandryuk@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 03.05.2021 21:28, Jason Andryuk wrote:
> --- a/tools/libs/ctrl/xc_pm.c
> +++ b/tools/libs/ctrl/xc_pm.c
> @@ -330,6 +330,24 @@ int xc_set_cpufreq_para(xc_interface *xch, int cpuid,
>      return xc_sysctl(xch, &sysctl);
>  }
>  
> +int xc_set_cpufreq_hwp(xc_interface *xch, int cpuid,
> +                       xc_set_hwp_para_t *set_hwp)

Besides for general considerations, for xenpm to legitimately pass
the same struct instance into this function multiple times, the
last parameter wants to be pointer-to-const, declaring the intent
of the function to leave the struct unaltered.

Jan

