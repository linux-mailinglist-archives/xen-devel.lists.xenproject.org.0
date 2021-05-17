Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D5DA383773
	for <lists+xen-devel@lfdr.de>; Mon, 17 May 2021 17:44:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.128387.241040 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lifP7-0003Gx-Is; Mon, 17 May 2021 15:43:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 128387.241040; Mon, 17 May 2021 15:43:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lifP7-0003E9-Fe; Mon, 17 May 2021 15:43:37 +0000
Received: by outflank-mailman (input) for mailman id 128387;
 Mon, 17 May 2021 15:43:35 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=FIJu=KM=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lifP5-0003E2-Lb
 for xen-devel@lists.xenproject.org; Mon, 17 May 2021 15:43:35 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 6bd78708-c571-46ba-a4c2-d6598dfb4e74;
 Mon, 17 May 2021 15:43:34 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id D663EB038;
 Mon, 17 May 2021 15:43:33 +0000 (UTC)
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
X-Inumbo-ID: 6bd78708-c571-46ba-a4c2-d6598dfb4e74
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1621266214; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=trpc5OXpqumYbEA+bx+DsO2tOUK31/Ah7ze3sn5dElo=;
	b=M6YZcIJyBPPHMXZ/1Xo18e4Hp+ADHXu8vFMR6oPayqEda/MV/MZS2YrJQ/24RqsVs92b/t
	DZqbKbStY5C2cRUXKk+kQp6MbRmnA9MbYjPSWSh/yqCaxMaRq2krTXNh8FYjcVktT053vk
	H/+Ep0N6JmdGZMgItbY1z049kbWg6lc=
Subject: Re: [PATCH v4 03/10] libx86: introduce helper to fetch msr entry
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 Ian Jackson <iwj@xenproject.org>, xen-devel@lists.xenproject.org
References: <20210507110422.24608-1-roger.pau@citrix.com>
 <20210507110422.24608-4-roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <035cc783-6083-f141-d4a3-db7a6adc36f5@suse.com>
Date: Mon, 17 May 2021 17:43:33 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210507110422.24608-4-roger.pau@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 07.05.2021 13:04, Roger Pau Monne wrote:
> @@ -91,6 +91,21 @@ int x86_msr_copy_from_buffer(struct msr_policy *policy,
>                               const msr_entry_buffer_t msrs, uint32_t nr_entries,
>                               uint32_t *err_msr);
>  
> +/**
> + * Get a MSR entry from a policy object.
> + *
> + * @param policy      The msr_policy object.
> + * @param idx         The index.
> + * @returns a pointer to the requested leaf or NULL in case of error.
> + *
> + * Do not call this function directly and instead use x86_msr_get_entry that
> + * will deal with both const and non-const policies returning a pointer with
> + * constness matching that of the input.
> + */
> +const uint64_t *_x86_msr_get_entry(const struct msr_policy *policy,
> +                                   uint32_t idx);
> +#define x86_msr_get_entry(p, i) \
> +    ((__typeof__(&(p)->platform_info.raw))_x86_msr_get_entry(p, i))
>  #endif /* !XEN_LIB_X86_MSR_H */

Just two nits: I think it would be nice to retain a blank line ahead of
the #endif. And here as well as in the CPUID counterpart you introduce,
strictly speaking, name space violations (via the leading underscore).
I realize I'm not really liked for pointing such out, but it may be
more relevant here than in pure hypervisor code, as this library code
is supposed to be usable also in userland.

Jan

