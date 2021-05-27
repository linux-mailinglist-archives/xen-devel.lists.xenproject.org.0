Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F3463931C2
	for <lists+xen-devel@lfdr.de>; Thu, 27 May 2021 17:06:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.133558.248901 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lmHaa-0003Ci-Ht; Thu, 27 May 2021 15:06:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 133558.248901; Thu, 27 May 2021 15:06:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lmHaa-0003A7-ES; Thu, 27 May 2021 15:06:24 +0000
Received: by outflank-mailman (input) for mailman id 133558;
 Thu, 27 May 2021 15:06:22 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=HjtO=KW=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lmHaY-0003A1-Ja
 for xen-devel@lists.xenproject.org; Thu, 27 May 2021 15:06:22 +0000
Received: from smtp-out2.suse.de (unknown [195.135.220.29])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id dd97c960-f88d-41ad-b0b9-81af9cebaf2f;
 Thu, 27 May 2021 15:06:22 +0000 (UTC)
Received: from imap.suse.de (imap-alt.suse-dmz.suse.de [192.168.254.47])
 (using TLSv1.2 with cipher ECDHE-ECDSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 306171FD2E;
 Thu, 27 May 2021 15:06:21 +0000 (UTC)
Received: from director2.suse.de (director2.suse-dmz.suse.de [192.168.254.72])
 by imap.suse.de (Postfix) with ESMTPSA id EEC6911A98;
 Thu, 27 May 2021 15:06:20 +0000 (UTC)
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
X-Inumbo-ID: dd97c960-f88d-41ad-b0b9-81af9cebaf2f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1622127981; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=2MG+X7HMN6JVp/a7DMrpxb+F+vbWGuxR0Undhpjchoc=;
	b=ALUrMSyyL6Xj+Bdl6gbJtOIbByn5ttrvmz473hBLuIwefjXF1uVqKeXL9/CE6EFeECEBSw
	tHh4+3D9FEsvQV0XV2ZyanAaY1Z68vydA3UmrcLr9Budw6f1dGRf2KEuc+a63hT6O8k+BJ
	TmH0GWGYcH6zvod8J0b4IwiOzid+SQI=
Subject: Re: [PATCH 2/3] x86/tsx: Minor cleanup and improvements
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20210527132519.21730-1-andrew.cooper3@citrix.com>
 <20210527132519.21730-3-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <ec271eb5-291d-2026-2bd9-5a12190e29be@suse.com>
Date: Thu, 27 May 2021 17:06:20 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.2
MIME-Version: 1.0
In-Reply-To: <20210527132519.21730-3-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 27.05.2021 15:25, Andrew Cooper wrote:
>  * Introduce cpu_has_arch_caps and replace boot_cpu_has(X86_FEATURE_ARCH_CAPS)
>  * Read CPUID data into the appropriate boot_cpu_data.x86_capability[]
>    element, as subsequent changes are going to need more cpu_has_* logic.
>  * Use the hi/lo MSR helpers, which substantially improves code generation.
> 
> No practical change.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Acked-by: Jan Beulich <jbeulich@suse.com>


