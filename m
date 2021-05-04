Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 96E65372A7C
	for <lists+xen-devel@lfdr.de>; Tue,  4 May 2021 14:56:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.122329.230698 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lduaz-0007cj-EQ; Tue, 04 May 2021 12:56:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 122329.230698; Tue, 04 May 2021 12:56:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lduaz-0007cK-B8; Tue, 04 May 2021 12:56:13 +0000
Received: by outflank-mailman (input) for mailman id 122329;
 Tue, 04 May 2021 12:56:12 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=1gXq=J7=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lduay-0007cF-7i
 for xen-devel@lists.xenproject.org; Tue, 04 May 2021 12:56:12 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 6e08573d-170b-41bd-bba4-1d686dc25568;
 Tue, 04 May 2021 12:56:11 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 56E4FAF21;
 Tue,  4 May 2021 12:56:10 +0000 (UTC)
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
X-Inumbo-ID: 6e08573d-170b-41bd-bba4-1d686dc25568
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1620132970; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=n6Xu8DcTkC1lSYhllsdu5KJARVtwMcv4p/dT5dLxCGQ=;
	b=Jph2VrmhCwElMbdsQ6V6olyyrPPqKtBke/5ptmPysff1gEgdReMSVok4brxvohUzYhsqaQ
	DcXp+vQi4G/BkvVELtnyWs87wh9xhEBADf+5OYCx869OQ3L9B1O32eK2dJOkN4ezQARh1t
	21p0vVY8Pq0hJbsZb+siO2Lk9cBhAPE=
Subject: Re: [PATCH 5/5] x86/cpuid: Fix handling of xsave dynamic leaves
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20210503153938.14109-1-andrew.cooper3@citrix.com>
 <20210503153938.14109-6-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <5e6511ca-83bd-8a43-202e-949b4d19b1ab@suse.com>
Date: Tue, 4 May 2021 14:56:09 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <20210503153938.14109-6-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 03.05.2021 17:39, Andrew Cooper wrote:
> If max leaf is greater than 0xd but xsave not available to the guest, then the
> current XSAVE size should not be filled in.  This is a latent bug for now as
> the guest max leaf is 0xd, but will become problematic in the future.
> 
> The comment concerning XSS state is wrong.  VT-x doesn't manage host/guest
> state automatically, but there is provision for "host only" bits to be set, so
> the implications are still accurate.
> 
> Introduce {xstate,hw}_compressed_size() helpers to mirror the uncompressed
> ones.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>
albeit with a remark:

> +unsigned int xstate_compressed_size(uint64_t xstates)
> +{
> +    unsigned int i, size = XSTATE_AREA_MIN_SIZE;
> +
> +    xstates &= ~XSTATE_FP_SSE;
> +    for_each_set_bit ( i, &xstates, 63 )
> +    {
> +        if ( test_bit(i, &xstate_align) )
> +            size = ROUNDUP(size, 64);
> +
> +        size += xstate_sizes[i];
> +    }
> +
> +    /* In debug builds, cross-check our calculation with hardware. */
> +    if ( IS_ENABLED(CONFIG_DEBUG) )
> +    {
> +        unsigned int hwsize;
> +
> +        xstates |= XSTATE_FP_SSE;
> +        hwsize = hw_compressed_size(xstates);
> +
> +        if ( size != hwsize )
> +            printk_once(XENLOG_ERR "%s(%#"PRIx64") size %#x != hwsize %#x\n",
> +                        __func__, xstates, size, hwsize);
> +        size = hwsize;

To be honest, already on the earlier patch I was wondering whether
it does any good to override size here: That'll lead to different
behavior on debug vs release builds. If the log message is not
paid attention to, we'd then end up with longer term breakage.

Jan

