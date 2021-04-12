Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A4E035C4A2
	for <lists+xen-devel@lfdr.de>; Mon, 12 Apr 2021 13:03:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.108990.208018 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lVuLg-0002JJ-4j; Mon, 12 Apr 2021 11:03:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 108990.208018; Mon, 12 Apr 2021 11:03:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lVuLg-0002Iu-1Y; Mon, 12 Apr 2021 11:03:20 +0000
Received: by outflank-mailman (input) for mailman id 108990;
 Mon, 12 Apr 2021 11:03:19 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=q596=JJ=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lVuLf-0002Ip-3E
 for xen-devel@lists.xenproject.org; Mon, 12 Apr 2021 11:03:19 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id f375b326-ce99-48b1-87e4-8578bf560c5f;
 Mon, 12 Apr 2021 11:03:17 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id ACD69AE20;
 Mon, 12 Apr 2021 11:03:16 +0000 (UTC)
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
X-Inumbo-ID: f375b326-ce99-48b1-87e4-8578bf560c5f
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1618225396; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=SggUo5vEkMMchFi34/C1qyVNuuNBzopDvY6Ert2iC9s=;
	b=Fcn6dD9P6QQLrfbeg2hWV/mjhH7epteNGb3ffZenKKC/OcwwSD3i7CiHLI3E4joRtpXKCa
	rK759chmpFJC+fLmX5TXxE5ki2M4XA2Dr9kR+6sM94ljaf6GSbmC5UWNrpYlP38JYapnsD
	LJlkmQCKC1/4ksI/icLiI+BlipSC3aE=
Subject: Re: [PATCH v3 2/4] xen/arm: Handle cases when hardware_domain is NULL
To: Luca Fancellu <luca.fancellu@arm.com>
Cc: bertrand.marquis@arm.com, wei.chen@arm.com,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Wei Liu <wl@xen.org>, Rahul Singh <rahul.singh@arm.com>,
 xen-devel@lists.xenproject.org
References: <20210412105243.23354-1-luca.fancellu@arm.com>
 <20210412105243.23354-3-luca.fancellu@arm.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <b1242714-e5f3-1e6b-f1bd-e9e53326fda7@suse.com>
Date: Mon, 12 Apr 2021 13:03:17 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.0
MIME-Version: 1.0
In-Reply-To: <20210412105243.23354-3-luca.fancellu@arm.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 12.04.2021 12:52, Luca Fancellu wrote:
> --- a/xen/include/xen/sched.h
> +++ b/xen/include/xen/sched.h
> @@ -1022,6 +1022,9 @@ static always_inline bool is_hardware_domain(const struct domain *d)
>      if ( IS_ENABLED(CONFIG_PV_SHIM_EXCLUSIVE) )
>          return false;
>  
> +    if ( !d )
> +        return false;
> +
>      return evaluate_nospec(d == hardware_domain);
>  }

On v2 I did say on the respective code that was here (and my
suggestion of this alternative adjustment): "Can you point out
code paths where d may actually be NULL, and where [...] would
not behave as intended (i.e. where bad speculation would
result)?"

Since you've taken the suggestion as-is, and since the commit
message says nothing in either direction here, did you actually
verify that there's no abuse of speculation possible with this
extra return path? And did you find any caller at all which may
pass NULL into here?

Jan

