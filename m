Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C7AE1943A2
	for <lists+xen-devel@lfdr.de>; Thu, 26 Mar 2020 16:54:49 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jHUnQ-0001gS-Do; Thu, 26 Mar 2020 15:51:52 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=ColY=5L=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jHUnP-0001gN-4W
 for xen-devel@lists.xenproject.org; Thu, 26 Mar 2020 15:51:51 +0000
X-Inumbo-ID: b47ad1b6-6f79-11ea-8817-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id b47ad1b6-6f79-11ea-8817-12813bfff9fa;
 Thu, 26 Mar 2020 15:51:50 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 8000AABF6;
 Thu, 26 Mar 2020 15:51:49 +0000 (UTC)
To: julien@xen.org
References: <20200322161418.31606-1-julien@xen.org>
 <20200322161418.31606-7-julien@xen.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <4f6d47dd-997d-977e-690d-7f21be2617a0@suse.com>
Date: Thu, 26 Mar 2020 16:51:43 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <20200322161418.31606-7-julien@xen.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Subject: Re: [Xen-devel] [PATCH 06/17] xen/x86: mm: Fix the comment on top
 put_page_from_l2e() to use 'mfn'
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: xen-devel@lists.xenproject.org, Julien Grall <jgrall@amazon.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 22.03.2020 17:14, julien@xen.org wrote:
> From: Julien Grall <jgrall@amazon.com>
> 
> We are using the 'mfn' to refer to machine frame. As this function deal
> with 'mfn', replace 'pfn' with 'mfn'.
> 
> Signed-off-by: Julien Grall <jgrall@amazon.com>
> 
> ---
> 
> I am not entirely sure to understand the comment on top of the
> function, so this change may be wrong.

Looking at the history of the function, ...

> --- a/xen/arch/x86/mm.c
> +++ b/xen/arch/x86/mm.c
> @@ -1321,7 +1321,7 @@ static int put_data_pages(struct page_info *page, bool writeable, int pt_shift)
>  }
>  
>  /*
> - * NB. Virtual address 'l2e' maps to a machine address within frame 'pfn'.
> + * NB. Virtual address 'l2e' maps to a machine address within frame 'mfn'.
>   * Note also that this automatically deals correctly with linear p.t.'s.
>   */
>  static int put_page_from_l2e(l2_pgentry_t l2e, mfn_t l2mfn, unsigned int flags)

... it used to be

static int put_page_from_l2e(l2_pgentry_t l2e, unsigned long pfn)

When the rename occurred (in the context of or as a follow-up to an
XSA iirc), the comment adjustment was apparently missed. With the
referenced name matching that of the function argument (l2mfn)
Acked-by: Jan Beulich <jbeulich@suse.com>

Jan

