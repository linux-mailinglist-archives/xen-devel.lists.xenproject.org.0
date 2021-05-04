Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EC7BB3729FC
	for <lists+xen-devel@lfdr.de>; Tue,  4 May 2021 14:20:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.122241.230526 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ldu2H-0003Qe-2j; Tue, 04 May 2021 12:20:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 122241.230526; Tue, 04 May 2021 12:20:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ldu2G-0003QI-VP; Tue, 04 May 2021 12:20:20 +0000
Received: by outflank-mailman (input) for mailman id 122241;
 Tue, 04 May 2021 12:20:19 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=1gXq=J7=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1ldu2F-0003QC-QL
 for xen-devel@lists.xenproject.org; Tue, 04 May 2021 12:20:19 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 527c3065-17ca-414d-b096-4d75b3d4d810;
 Tue, 04 May 2021 12:20:18 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id B6BD9AE1C;
 Tue,  4 May 2021 12:20:17 +0000 (UTC)
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
X-Inumbo-ID: 527c3065-17ca-414d-b096-4d75b3d4d810
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1620130817; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=AJIMTLKRZlb0O5yvWX57lbNP8pcOMKvO2QN5/I5G4Os=;
	b=IZ8uyWmpKGD4krYRX6kgIX3lS9xLfH8hVtGEgU21q4SIf/R0p8weTE4P9loPu9t7U419jP
	MUiUTvEhCu2PeT5VE+iq01Rw/RHR9hDkhgzx+wmOUbRxubr1h+iONxlSSuN3eVXZGoiV3e
	uwEzSjFXGcz8Jg7SjdrzCL08CfhhQ1c=
Subject: Re: [PATCH 3/5] x86/xstate: Rework xstate_ctxt_size() as
 xstate_uncompressed_size()
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20210503153938.14109-1-andrew.cooper3@citrix.com>
 <20210503153938.14109-4-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <4deac8bb-3252-36e0-b728-b78c2132984b@suse.com>
Date: Tue, 4 May 2021 14:20:17 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <20210503153938.14109-4-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 03.05.2021 17:39, Andrew Cooper wrote:
> @@ -568,16 +568,38 @@ static unsigned int hw_uncompressed_size(uint64_t xcr0)
>      return size;
>  }
>  
> -/* Fastpath for common xstate size requests, avoiding reloads of xcr0. */
> -unsigned int xstate_ctxt_size(u64 xcr0)
> +unsigned int xstate_uncompressed_size(uint64_t xcr0)

Since you rewrite the function anyway, and since taking into account
the XSS-controlled features here is going to be necessary as well
(even if just down the road, but that's what your ultimate goal is
from all I can tell), how about renaming the parameter to "xstates"
or "states" at the same time?

Jan

