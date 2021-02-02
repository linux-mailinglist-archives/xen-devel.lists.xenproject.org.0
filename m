Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1642D30BA8E
	for <lists+xen-devel@lfdr.de>; Tue,  2 Feb 2021 10:05:08 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.80414.147132 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l6rbw-0004ho-SL; Tue, 02 Feb 2021 09:04:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 80414.147132; Tue, 02 Feb 2021 09:04:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l6rbw-0004hP-Op; Tue, 02 Feb 2021 09:04:36 +0000
Received: by outflank-mailman (input) for mailman id 80414;
 Tue, 02 Feb 2021 09:04:35 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=licP=HE=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1l6rbv-0004hK-Ck
 for xen-devel@lists.xenproject.org; Tue, 02 Feb 2021 09:04:35 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id aeaa9761-b23c-41d0-95e9-7ff2e60737b7;
 Tue, 02 Feb 2021 09:04:33 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 428EDAF9C;
 Tue,  2 Feb 2021 09:04:32 +0000 (UTC)
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
X-Inumbo-ID: aeaa9761-b23c-41d0-95e9-7ff2e60737b7
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1612256672; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=jJY700A6YPRFHrbaR6No2EjJvsrjURGXNXHYWtWql7E=;
	b=kgbt52l5RlwpofZ4EjIdreBytQyo5HyV4zleGUaXnuALofh3ta84nI0oZTKI7mR3LacADZ
	Vl3Ap+NxLTCUK6jJRN8SEaoYoRJm9upL+hEn1lHuJ7u5fmuAqBDwbFwb7UDzJIv4xXGUsR
	kw/UO1hv5v/9iTIyBzXnkTmMYaJWINo=
Subject: Re: [PATCH v9 02/11] xen/domain: Add vmtrace_size domain creation
 parameter
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Micha=c5=82_Leszczy=c5=84ski?= <michal.leszczynski@cert.pl>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>,
 Tamas K Lengyel <tamas@tklengyel.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20210201232703.29275-1-andrew.cooper3@citrix.com>
 <20210201232703.29275-3-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <7a27c313-2c7c-8394-3749-e2f4d671fdab@suse.com>
Date: Tue, 2 Feb 2021 10:04:32 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210201232703.29275-3-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 02.02.2021 00:26, Andrew Cooper wrote:
> --- a/xen/common/domain.c
> +++ b/xen/common/domain.c
> @@ -132,6 +132,56 @@ static void vcpu_info_reset(struct vcpu *v)
>      v->vcpu_info_mfn = INVALID_MFN;
>  }
>  
> +static void vmtrace_free_buffer(struct vcpu *v)
> +{
> +    const struct domain *d = v->domain;
> +    struct page_info *pg = v->vmtrace.pg;
> +    unsigned int i;
> +
> +    if ( !pg )
> +        return;
> +
> +    v->vmtrace.pg = NULL;
> +
> +    for ( i = 0; i < (d->vmtrace_size >> PAGE_SHIFT); i++ )
> +    {
> +        put_page_alloc_ref(&pg[i]);
> +        put_page_and_type(&pg[i]);
> +    }
> +}
> +
> +static int vmtrace_alloc_buffer(struct vcpu *v)
> +{
> +    struct domain *d = v->domain;
> +    struct page_info *pg;
> +    unsigned int i;
> +
> +    if ( !d->vmtrace_size )
> +        return 0;
> +
> +    pg = alloc_domheap_pages(d, get_order_from_bytes(d->vmtrace_size),
> +                             MEMF_no_refcount);
> +    if ( !pg )
> +        return -ENOMEM;
> +
> +    for ( i = 0; i < (d->vmtrace_size >> PAGE_SHIFT); i++ )
> +        if ( unlikely(!get_page_and_type(&pg[i], d, PGT_writable_page)) )
> +            goto refcnt_err;
> +
> +    /*
> +     * We must only let vmtrace_free_buffer() take any action in the success
> +     * case when we've taken all the refs it intends to drop.
> +     */
> +    v->vmtrace.pg = pg;
> +    return 0;
> +
> + refcnt_err:
> +    while ( i-- )
> +        put_page_and_type(&pg[i]);
> +
> +    return -ENODATA;

Would you mind at least logging how many pages may be leaked
here? I also don't understand why you don't call
put_page_alloc_ref() in the loop - that's fine to do prior to
the put_page_and_type(), and will at least limit the leak.
The buffer size here typically isn't insignificant, and it
may be helpful to not unnecessarily defer the freeing to
relinquish_resources() (assuming we will make that one also
traverse the list of "extra" pages, but I understand that's
not going to happen for 4.15 anymore anyway).

Additionally, while I understand you're not in favor of the
comments we have on all three similar code paths, I think
replicating their comments here would help easily spotting
(by grep-ing e.g. for "fishy") all instances that will need
adjusting once we have figured a better overall solution.

Jan

