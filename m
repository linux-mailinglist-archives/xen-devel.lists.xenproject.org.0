Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BA113713B8
	for <lists+xen-devel@lfdr.de>; Mon,  3 May 2021 12:42:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.121499.229166 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ldW18-0007NN-To; Mon, 03 May 2021 10:41:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 121499.229166; Mon, 03 May 2021 10:41:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ldW18-0007My-QX; Mon, 03 May 2021 10:41:34 +0000
Received: by outflank-mailman (input) for mailman id 121499;
 Mon, 03 May 2021 10:41:32 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=TA2L=J6=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1ldW16-0007Mt-Kc
 for xen-devel@lists.xenproject.org; Mon, 03 May 2021 10:41:32 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 608c5261-efbc-4468-be7b-b71c26d838d7;
 Mon, 03 May 2021 10:41:31 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 61D3BB287;
 Mon,  3 May 2021 10:41:30 +0000 (UTC)
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
X-Inumbo-ID: 608c5261-efbc-4468-be7b-b71c26d838d7
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1620038490; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=fXqoZ+h4dh4kmM6CvMNc6hbkf6NUZCD7jM+SqjhA4w0=;
	b=SLg3BZ/WP8Um3wl1VJZwVpDqPSR2pB2vVNrIHwFvcZDlycCVzCLxzPsWCI70y2QB1cI3CE
	0/AoNTSqJTas6IkXkMl2SpvsF9J7+OG+QkR8CTog7I5LloSAdt0my7TzMGUoA3Fvs/bbMs
	2wi4Ig63MZTWmhU50/WmD3bwsM3auyo=
Subject: Re: [PATCH v3 03/13] libs/guest: allow fetching a specific MSR entry
 from a cpu policy
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <20210430155211.3709-1-roger.pau@citrix.com>
 <20210430155211.3709-4-roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <273ba6f9-dee9-00db-407b-10325d21afae@suse.com>
Date: Mon, 3 May 2021 12:41:29 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <20210430155211.3709-4-roger.pau@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 30.04.2021 17:52, Roger Pau Monne wrote:
> Introduce an interface that returns a specific MSR entry from a cpu
> policy in xen_msr_entry_t format. Provide a helper to perform a binary
> search against an array of MSR entries.
> 
> This is useful to callers can peek data from the opaque
> xc_cpu_policy_t type.
> 
> No caller of the interface introduced on this patch.
> 
> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> ---
> Changes since v1:
>  - Introduce a helper to perform a binary search of the MSR entries
>    array.
> ---
>  tools/include/xenctrl.h         |  2 ++
>  tools/libs/guest/xg_cpuid_x86.c | 42 +++++++++++++++++++++++++++++++++
>  2 files changed, 44 insertions(+)
> 
> diff --git a/tools/include/xenctrl.h b/tools/include/xenctrl.h
> index cbca7209e34..605c632cf30 100644
> --- a/tools/include/xenctrl.h
> +++ b/tools/include/xenctrl.h
> @@ -2611,6 +2611,8 @@ int xc_cpu_policy_serialise(xc_interface *xch, const xc_cpu_policy_t policy,
>  int xc_cpu_policy_get_cpuid(xc_interface *xch, const xc_cpu_policy_t policy,
>                              uint32_t leaf, uint32_t subleaf,
>                              xen_cpuid_leaf_t *out);
> +int xc_cpu_policy_get_msr(xc_interface *xch, const xc_cpu_policy_t policy,
> +                          uint32_t msr, xen_msr_entry_t *out);
>  
>  int xc_get_cpu_levelling_caps(xc_interface *xch, uint32_t *caps);
>  int xc_get_cpu_featureset(xc_interface *xch, uint32_t index,
> diff --git a/tools/libs/guest/xg_cpuid_x86.c b/tools/libs/guest/xg_cpuid_x86.c
> index de27826f415..9e83daca0e6 100644
> --- a/tools/libs/guest/xg_cpuid_x86.c
> +++ b/tools/libs/guest/xg_cpuid_x86.c
> @@ -850,3 +850,45 @@ int xc_cpu_policy_get_cpuid(xc_interface *xch, const xc_cpu_policy_t policy,
>      *out = *tmp;
>      return 0;
>  }
> +
> +static int compare_entries(const void *l, const void *r)
> +{
> +    const xen_msr_entry_t *lhs = l;
> +    const xen_msr_entry_t *rhs = r;
> +
> +    if ( lhs->idx == rhs->idx )
> +        return 0;
> +    return lhs->idx < rhs->idx ? -1 : 1;
> +}
> +
> +static xen_msr_entry_t *find_entry(xen_msr_entry_t *entries,
> +                                   unsigned int nr_entries, unsigned int index)
> +{
> +    const xen_msr_entry_t key = { index };
> +
> +    return bsearch(&key, entries, nr_entries, sizeof(*entries), compare_entries);
> +}

Isn't "entries" / "entry" a little too generic a name here, considering
the CPUID equivalents use "leaves" / "leaf"? (Noticed really while looking
at patch 7.)

Jan

