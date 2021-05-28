Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E371393D63
	for <lists+xen-devel@lfdr.de>; Fri, 28 May 2021 09:00:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.133797.249248 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lmWTa-0002nE-8Q; Fri, 28 May 2021 07:00:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 133797.249248; Fri, 28 May 2021 07:00:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lmWTa-0002lK-4p; Fri, 28 May 2021 07:00:10 +0000
Received: by outflank-mailman (input) for mailman id 133797;
 Fri, 28 May 2021 07:00:08 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=wdiM=KX=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lmWTY-0002lC-7e
 for xen-devel@lists.xenproject.org; Fri, 28 May 2021 07:00:08 +0000
Received: from smtp-out2.suse.de (unknown [195.135.220.29])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id c908a0cd-0051-431d-afaa-8a717acad818;
 Fri, 28 May 2021 07:00:07 +0000 (UTC)
Received: from imap.suse.de (imap-alt.suse-dmz.suse.de [192.168.254.47])
 (using TLSv1.2 with cipher ECDHE-ECDSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 6A19F1FD2E;
 Fri, 28 May 2021 07:00:06 +0000 (UTC)
Received: from director2.suse.de (director2.suse-dmz.suse.de [192.168.254.72])
 by imap.suse.de (Postfix) with ESMTPSA id 350D211A98;
 Fri, 28 May 2021 07:00:06 +0000 (UTC)
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
X-Inumbo-ID: c908a0cd-0051-431d-afaa-8a717acad818
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1622185206; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=yZzaowl1OEBJ94ow4jIwZaUa26psa43EJrZpg+OiR3Q=;
	b=VfQgA14M09eM7yFKaAa/nhGLsd7GhHVNtLUgtT59g1opTwjBYyZFhSPi3F1JqhRZylHy8S
	yiWbvpymjrjkupBVOoZgPW77G0H4LstXfp/zyHjXG7l28eWZi/AsUIx3FAqhGLp6tIKLwJ
	+n7pOaOk9sA0boecrsy78kPjj3rhXDo=
Subject: Ping: [PATCH] x86/tboot: include all valid frame table entries in S3
 integrity check
From: Jan Beulich <jbeulich@suse.com>
To: Lukasz Hawrylko <lukasz.hawrylko@linux.intel.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <e878fd86-2d82-ce3c-1dc4-d3a07025f1d4@suse.com>
Message-ID: <a2899b2c-dafb-08c2-e5cd-ba92cd0b6032@suse.com>
Date: Fri, 28 May 2021 09:00:02 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.2
MIME-Version: 1.0
In-Reply-To: <e878fd86-2d82-ce3c-1dc4-d3a07025f1d4@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 19.05.2021 17:48, Jan Beulich wrote:
> The difference of two pdx_to_page() return values is a number of pages,
> not the number of bytes covered by the corresponding frame table entries.
> 
> Fixes: 3cb68d2b59ab ("tboot: fix S3 issue for Intel Trusted Execution Technology.")
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> 
> --- a/xen/arch/x86/tboot.c
> +++ b/xen/arch/x86/tboot.c
> @@ -323,12 +323,12 @@ static void tboot_gen_frametable_integri
>          if ( nidx >= max_idx )
>              break;
>          vmac_update((uint8_t *)pdx_to_page(sidx * PDX_GROUP_COUNT),
> -                       pdx_to_page(eidx * PDX_GROUP_COUNT)
> -                       - pdx_to_page(sidx * PDX_GROUP_COUNT), &ctx);
> +                    (eidx - sidx) * PDX_GROUP_COUNT * sizeof(*frame_table),
> +                    &ctx);
>      }
>      vmac_update((uint8_t *)pdx_to_page(sidx * PDX_GROUP_COUNT),
> -                   pdx_to_page(max_pdx - 1) + 1
> -                   - pdx_to_page(sidx * PDX_GROUP_COUNT), &ctx);
> +                (max_pdx - sidx * PDX_GROUP_COUNT) * sizeof(*frame_table),
> +                &ctx);
>  
>      *mac = vmac(NULL, 0, nonce, NULL, &ctx);
>  
> 


