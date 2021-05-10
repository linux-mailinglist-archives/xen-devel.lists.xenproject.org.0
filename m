Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BEBAE378B70
	for <lists+xen-devel@lfdr.de>; Mon, 10 May 2021 14:12:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.125175.235645 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lg4mH-0005uw-Hb; Mon, 10 May 2021 12:12:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 125175.235645; Mon, 10 May 2021 12:12:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lg4mH-0005t1-E0; Mon, 10 May 2021 12:12:49 +0000
Received: by outflank-mailman (input) for mailman id 125175;
 Mon, 10 May 2021 12:12:47 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/Mbt=KF=apertussolutions.com=dpsmith@srs-us1.protection.inumbo.net>)
 id 1lg4mF-0005ow-Co
 for xen-devel@lists.xenproject.org; Mon, 10 May 2021 12:12:47 +0000
Received: from sender4-of-o51.zoho.com (unknown [136.143.188.51])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 20eee47e-e995-4984-b29f-f0c588867edf;
 Mon, 10 May 2021 12:12:46 +0000 (UTC)
Received: from [10.10.1.24] (static-72-81-132-2.bltmmd.fios.verizon.net
 [72.81.132.2]) by mx.zohomail.com
 with SMTPS id 162064875843729.611131871728276;
 Mon, 10 May 2021 05:12:38 -0700 (PDT)
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
X-Inumbo-ID: 20eee47e-e995-4984-b29f-f0c588867edf
ARC-Seal: i=1; a=rsa-sha256; t=1620648763; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=SBsdWi0leMcf0Qga1YOkNHaFwLzDkW7d9HKwGMsg437YT6NjczdH2i4osaj4Lvgb8t5aor/9ZV2gOfPQNgBR0suB4R101yJ8Wl5ZKYpI90ElqTywhh9bA97hguBbzfXz/rJNzIVu53TYA3roeW+isizi3vYrksQqkSrsShUJF/o=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1620648763; h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To; 
	bh=IUuO+4CPENSAnYQ5OZVeksgThItfvhkq3+AKtI7uo5g=; 
	b=DIqidl2VM1t7tsRhFewz5uNtfn5fT+fezdiSLIG8H2NwVJhhnK+q8EopDKoBmeNw5HwFJMcOvUR7KkERJ1kpbUWK1g88tqaWhdewgc4pHR+jLpisyTvubvQ4sWg4nT+PNooz85Eez9Icd3k0a/QuoEjW9hBDpIRUsTdv9gW30Go=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com> header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1620648763;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=Subject:To:Cc:References:From:Message-ID:Date:MIME-Version:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=IUuO+4CPENSAnYQ5OZVeksgThItfvhkq3+AKtI7uo5g=;
	b=ZecZkM8UeZUPpwWTKdddWLB/WnbwqBCokZW44inDGnBmQQbKemdfJLU9YRo8LKFs
	xT7GWki8LPMo5txa3Cklvy3T2gTT7W6NPIPOCU8W9GX+Ome8ibqDKRwlYn3+cz6lqXq
	xwmZyqCLzkElI94Nfy3AwGeYnDn8yCYgMeCc8K40=
Subject: Re: [PATCH v2 06/13] vtpmmgr: Flush transient keys on shutdown
To: Jason Andryuk <jandryuk@gmail.com>, xen-devel@lists.xenproject.org
Cc: Daniel De Graaf <dgdegra@tycho.nsa.gov>, Quan Xu <quan.xu0@gmail.com>,
 Samuel Thibault <samuel.thibault@ens-lyon.org>
References: <20210506135923.161427-1-jandryuk@gmail.com>
 <20210506135923.161427-7-jandryuk@gmail.com>
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
Message-ID: <0f5dfb40-90d2-1866-a570-2cb3eefcb6d3@apertussolutions.com>
Date: Mon, 10 May 2021 08:12:36 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <20210506135923.161427-7-jandryuk@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ZohoMailClient: External

On 5/6/21 9:59 AM, Jason Andryuk wrote:
> Remove our key so it isn't left in the TPM for someone to come along
> after vtpmmgr shutsdown.
> 
> Signed-off-by: Jason Andryuk <jandryuk@gmail.com>
> Reviewed-by: Samuel Thibault <samuel.thibault@ens-lyon.org>
> ---

Reviewed-by: Daniel P. Smith <dpsmith@apertussolutions.com>

>  stubdom/vtpmmgr/init.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/stubdom/vtpmmgr/init.c b/stubdom/vtpmmgr/init.c
> index decf8e8b4d..56b4be85b3 100644
> --- a/stubdom/vtpmmgr/init.c
> +++ b/stubdom/vtpmmgr/init.c
> @@ -792,6 +792,14 @@ void vtpmmgr_shutdown(void)
>     /* Close tpmback */
>     shutdown_tpmback();
>  
> +    if (hw_is_tpm2()) {
> +        /* Blow away all stale handles left in the tpm*/
> +        if (flush_tpm2() != TPM_SUCCESS) {
> +            vtpmlogerror(VTPM_LOG_TPM,
> +                         "TPM2_FlushResources failed, continuing shutdown..\n");
> +        }
> +    }
> +
>     /* Close tpmfront/tpm_tis */
>     close(vtpm_globals.tpm_fd);
>  
> 


