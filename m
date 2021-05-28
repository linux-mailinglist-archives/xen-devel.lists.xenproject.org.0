Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A436393D64
	for <lists+xen-devel@lfdr.de>; Fri, 28 May 2021 09:00:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.133799.249259 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lmWTp-0003As-HK; Fri, 28 May 2021 07:00:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 133799.249259; Fri, 28 May 2021 07:00:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lmWTp-00038m-D4; Fri, 28 May 2021 07:00:25 +0000
Received: by outflank-mailman (input) for mailman id 133799;
 Fri, 28 May 2021 07:00:23 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=wdiM=KX=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lmWTn-00035u-Sy
 for xen-devel@lists.xenproject.org; Fri, 28 May 2021 07:00:23 +0000
Received: from smtp-out2.suse.de (unknown [195.135.220.29])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 756355e4-969b-4804-b985-65f9b19098f5;
 Fri, 28 May 2021 07:00:23 +0000 (UTC)
Received: from imap.suse.de (imap-alt.suse-dmz.suse.de [192.168.254.47])
 (using TLSv1.2 with cipher ECDHE-ECDSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 6C49B1FD2E;
 Fri, 28 May 2021 07:00:22 +0000 (UTC)
Received: from director2.suse.de (director2.suse-dmz.suse.de [192.168.254.72])
 by imap.suse.de (Postfix) with ESMTPSA id 4955B11A98;
 Fri, 28 May 2021 07:00:22 +0000 (UTC)
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
X-Inumbo-ID: 756355e4-969b-4804-b985-65f9b19098f5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1622185222; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=keg0tAiXIrXO/9uFKfQsZx/6TkaJWl/wX7wIHwGo+RE=;
	b=jR48u4JAqP/N95Kewkw1jomm45BkJqV2bxMKFK/Oy3sckuzOw9Wa/W8PBwyBY8UBndGl+F
	fyF+61RIFwfJ6E2JqVDCLTkIm3ZGdlMiC6ngEj5MkZ3+LAKirwlDF79NN0ZEOe4x3RshU4
	7hzj7T42+vwVisiMXybOPKIKXEKyc+o=
Subject: Ping: [PATCH] x86/tboot: adjust UUID check
From: Jan Beulich <jbeulich@suse.com>
To: Lukasz Hawrylko <lukasz.hawrylko@linux.intel.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <422e39c9-0cba-0944-b813-dfe2578ad719@suse.com>
Message-ID: <1651edfd-4854-46ed-4701-6f82c2534e00@suse.com>
Date: Fri, 28 May 2021 09:00:22 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.2
MIME-Version: 1.0
In-Reply-To: <422e39c9-0cba-0944-b813-dfe2578ad719@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 19.05.2021 17:49, Jan Beulich wrote:
> Replace a bogus cast, move the static variable into the only function
> using it, and add __initconst. While there, also remove a pointless NULL
> check.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> 
> --- a/xen/arch/x86/tboot.c
> +++ b/xen/arch/x86/tboot.c
> @@ -27,8 +27,6 @@ static vmac_t domain_mac;     /* MAC for
>  static vmac_t xenheap_mac;    /* MAC for xen heap during S3 */
>  static vmac_t frametable_mac; /* MAC for frame table during S3 */
>  
> -static const uuid_t tboot_shared_uuid = TBOOT_SHARED_UUID;
> -
>  /* used by tboot_protect_mem_regions() and/or tboot_parse_dmar_table() */
>  static uint64_t __initdata txt_heap_base, __initdata txt_heap_size;
>  static uint64_t __initdata sinit_base, __initdata sinit_size;
> @@ -93,6 +91,7 @@ static void __init tboot_copy_memory(uns
>  void __init tboot_probe(void)
>  {
>      tboot_shared_t *tboot_shared;
> +    static const uuid_t __initconst tboot_shared_uuid = TBOOT_SHARED_UUID;
>  
>      /* Look for valid page-aligned address for shared page. */
>      if ( !opt_tboot_pa || (opt_tboot_pa & ~PAGE_MASK) )
> @@ -101,9 +100,7 @@ void __init tboot_probe(void)
>      /* Map and check for tboot UUID. */
>      set_fixmap(FIX_TBOOT_SHARED_BASE, opt_tboot_pa);
>      tboot_shared = fix_to_virt(FIX_TBOOT_SHARED_BASE);
> -    if ( tboot_shared == NULL )
> -        return;
> -    if ( memcmp(&tboot_shared_uuid, (uuid_t *)tboot_shared, sizeof(uuid_t)) )
> +    if ( memcmp(&tboot_shared_uuid, &tboot_shared->uuid, sizeof(uuid_t)) )
>          return;
>  
>      /* new tboot_shared (w/ GAS support, integrity, etc.) is not backwards
> 


