Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B49B4C1B59
	for <lists+xen-devel@lfdr.de>; Wed, 23 Feb 2022 20:04:33 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.277741.474554 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nMwvl-0002ou-IJ; Wed, 23 Feb 2022 19:04:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 277741.474554; Wed, 23 Feb 2022 19:04:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nMwvl-0002m0-FL; Wed, 23 Feb 2022 19:04:05 +0000
Received: by outflank-mailman (input) for mailman id 277741;
 Wed, 23 Feb 2022 19:04:04 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=eMz3=TG=srcf.net=amc96@srs-se1.protection.inumbo.net>)
 id 1nMwvk-0002ls-GV
 for xen-devel@lists.xenproject.org; Wed, 23 Feb 2022 19:04:04 +0000
Received: from ppsw-31.csi.cam.ac.uk (ppsw-31.csi.cam.ac.uk [131.111.8.131])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5c31f363-94db-11ec-8eb8-a37418f5ba1a;
 Wed, 23 Feb 2022 20:04:02 +0100 (CET)
Received: from hades.srcf.societies.cam.ac.uk ([131.111.179.67]:58280)
 by ppsw-31.csi.cam.ac.uk (ppsw.cam.ac.uk [131.111.8.137]:25)
 with esmtps (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256)
 id 1nMwvX-000Jqc-LQ (Exim 4.95) (return-path <amc96@srcf.net>);
 Wed, 23 Feb 2022 19:03:51 +0000
Received: from [192.168.1.10] (host-92-12-45-187.as13285.net [92.12.45.187])
 (Authenticated sender: amc96)
 by hades.srcf.societies.cam.ac.uk (Postfix) with ESMTPSA id 1DF8E1FAE7;
 Wed, 23 Feb 2022 19:03:51 +0000 (GMT)
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
X-Inumbo-ID: 5c31f363-94db-11ec-8eb8-a37418f5ba1a
X-Cam-AntiVirus: no malware found
X-Cam-ScannerInfo: https://help.uis.cam.ac.uk/email-scanner-virus
Message-ID: <2978f831-5bed-d2d1-afc4-965a6c9770fb@srcf.net>
Date: Wed, 23 Feb 2022 19:03:50 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
Subject: Re: [PATCH] xen/mm: pg_offlined can be defined as bool in
 free_heap_pages()
Content-Language: en-GB
To: Julien Grall <julien@xen.org>, xen-devel@lists.xenproject.org
Cc: Julien Grall <jgrall@amazon.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
References: <20220223184110.7941-1-julien@xen.org>
From: Andrew Cooper <amc96@srcf.net>
In-Reply-To: <20220223184110.7941-1-julien@xen.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 23/02/2022 18:41, Julien Grall wrote:
> From: Julien Grall <jgrall@amazon.com>
>
> The local variable pg_offlined in free_heap_pages() can only take two
> values. So switch it to a bool.
>
> Signed-off-by: Julien Grall <jgrall@amazon.com>
> ---
>  xen/common/page_alloc.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
>
> diff --git a/xen/common/page_alloc.c b/xen/common/page_alloc.c
> index e971bf91e0be..72e6cac2365d 100644
> --- a/xen/common/page_alloc.c
> +++ b/xen/common/page_alloc.c
> @@ -1437,8 +1437,9 @@ static void free_heap_pages(
>  {
>      unsigned long mask;
>      mfn_t mfn = page_to_mfn(pg);
> -    unsigned int i, node = phys_to_nid(mfn_to_maddr(mfn)), pg_offlined = 0;
> +    unsigned int i, node = phys_to_nid(mfn_to_maddr(mfn));
>      unsigned int zone = page_to_zone(pg);
> +    bool pg_offlined = true;

= false ?

~Andrew

>  
>      ASSERT(order <= MAX_ORDER);
>  
> @@ -1447,7 +1448,7 @@ static void free_heap_pages(
>      for ( i = 0; i < (1 << order); i++ )
>      {
>          if ( mark_page_free(&pg[i], mfn_add(mfn, i)) )
> -            pg_offlined = 1;
> +            pg_offlined = true;
>  
>          if ( need_scrub )
>          {


