Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 364B7A060EF
	for <lists+xen-devel@lfdr.de>; Wed,  8 Jan 2025 17:00:01 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.867650.1279217 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tVYT1-0004gH-J0; Wed, 08 Jan 2025 15:59:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 867650.1279217; Wed, 08 Jan 2025 15:59:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tVYT1-0004e9-Fh; Wed, 08 Jan 2025 15:59:35 +0000
Received: by outflank-mailman (input) for mailman id 867650;
 Wed, 08 Jan 2025 15:59:34 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=HyFE=UA=cloud.com=alejandro.vallejo@srs-se1.protection.inumbo.net>)
 id 1tVYT0-0004dj-1I
 for xen-devel@lists.xenproject.org; Wed, 08 Jan 2025 15:59:34 +0000
Received: from mail-ed1-x541.google.com (mail-ed1-x541.google.com
 [2a00:1450:4864:20::541])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8be97032-cdd9-11ef-99a4-01e77a169b0f;
 Wed, 08 Jan 2025 16:59:31 +0100 (CET)
Received: by mail-ed1-x541.google.com with SMTP id
 4fb4d7f45d1cf-5d3f65844deso28680436a12.0
 for <xen-devel@lists.xenproject.org>; Wed, 08 Jan 2025 07:59:31 -0800 (PST)
Received: from localhost ([66.81.170.107]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-aac0efe46d5sm2519767566b.103.2025.01.08.07.59.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 08 Jan 2025 07:59:30 -0800 (PST)
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
X-Inumbo-ID: 8be97032-cdd9-11ef-99a4-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1736351971; x=1736956771; darn=lists.xenproject.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JxTMDE2iuurkhnXzPe9WEOUJmCm8L9G7Q+PfJDEXAj0=;
        b=YpqtcZ0/nBZSjgJFAAPTCLmwregh2z0rMuH4dTD6C0i6TkpRmHk0ccSNfeTe0bzTa7
         /aSfGrkdkpXbmDs8fqGcYr1hgzLx7KvpMIVbjjUBZbfPZyhGa0eNiGbqAWuZditeSC7j
         TcIDi+GaFgT6RYKr0lp+8lhvhC5OPfLSlCgME=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736351971; x=1736956771;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=JxTMDE2iuurkhnXzPe9WEOUJmCm8L9G7Q+PfJDEXAj0=;
        b=vjXw6FwAws49k3FRMXvELlToyoasofkplUuLkmox6DeRvtFLEWgAnvldcDEXxyWT+8
         wku0ySJ/FbVYJpPrF+Ai0NAsmLcP+nVAWXRyHgrikyQur72+Dg9RU/PJssGtnHzlsMDv
         wTW9plSZ8d7OnMFKq7HAoHLvXRZzOITPt0QMJOMokRQAXq7Tujz1xBnYbt/6+LMYeMKY
         IOVJmbBTP7Ivgfq6HhWKfn8mQFHiYOrNAM8ihNnNZSlXQeevVAz4gB7IARL/XZCVyDmq
         5fOqe5X9YqggWfrsUXzfCFH/4BS0dh2Bojjbv0S87wQKfYMmLZLUyRa23/1KrIGvdsvm
         dDOA==
X-Forwarded-Encrypted: i=1; AJvYcCUUrwQom5RxvMaoNHL9navnaem5D2v4n4rB2TvvZLa/JAdRrUOq5nKO1JIVTgvrd6nLmS+jxqnY27Y=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyszDTCKa3Q0Yu8s2b+zpWIUArAtT/N/oaUk6dVAPAdYQTNggT6
	b3rkCcVA49k1ZwV9P8VGHggHvxh69bmTyYoYUSxCtooqvDT0PCrJvByaepBzjqQ=
X-Gm-Gg: ASbGnctxvUqwim53EUmkRo+PqDJdVH0+VMu1BAdjZKuLjDEByI+cxZ9xUtVWdQYoAZO
	CaSKXymJ9kumthLUkYGa9+v0mzOVHlG9ttYlgRFMctNSmIo8vVgLnF2FjTaR7vPLeDGND7YKGQY
	bXrfeIHRIdnhQ6j3qHsSaCEh22VPk3KoFZMi4FWFn3D48gU+4Ggm6TJIzsHs3TVtwzmIY5BWOUm
	61Pig4BbC9SoFUr33lR0Xoi+TiX+7iaXedWcUpH7aUO8BUn7tCVWsXW42NpfRA=
X-Google-Smtp-Source: AGHT+IGLkDcEPAuOqLHvkN97fiUuHAg0puRXEANIDnGvjvMGKaYaOoeoBZgWNPmXAs1eVgKVZrPd6w==
X-Received: by 2002:a17:906:6a1e:b0:aae:bac6:6659 with SMTP id a640c23a62f3a-ab2ab675c7bmr269997466b.7.1736351971123;
        Wed, 08 Jan 2025 07:59:31 -0800 (PST)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 08 Jan 2025 15:59:29 +0000
Message-Id: <D6WTEJ1ZSB1F.3SRMZ5WCOIQUH@cloud.com>
Cc: "Jan Beulich" <jbeulich@suse.com>, "Andrew Cooper"
 <andrew.cooper3@citrix.com>
Subject: Re: [PATCH v2 01/18] x86/mm: purge unneeded
 destroy_perdomain_mapping()
From: "Alejandro Vallejo" <alejandro.vallejo@cloud.com>
To: "Roger Pau Monne" <roger.pau@citrix.com>,
 <xen-devel@lists.xenproject.org>
X-Mailer: aerc 0.18.2
References: <20250108142659.99490-1-roger.pau@citrix.com>
 <20250108142659.99490-2-roger.pau@citrix.com>
In-Reply-To: <20250108142659.99490-2-roger.pau@citrix.com>

Hi,

I noticed the same duplication while moving mapcache initialization code, b=
ut
didn't want to touch it while doing that. Good to see these two lines gone.

On Wed Jan 8, 2025 at 2:26 PM GMT, Roger Pau Monne wrote:
> The destroy_perdomain_mapping() call in the hvm_domain_initialise() fail =
path
> is useless.  destroy_perdomain_mapping() called with nr =3D=3D 0 is effec=
tively a
> no op, as there are not entries torn down.  Remove the call, as
> arch_domain_create() already calls free_perdomain_mappings() on failure.
>
> There's also a call to destroy_perdomain_mapping() in pv_domain_destroy()=
 which
> is also not needed.  arch_domain_destroy() will already unconditionally c=
all
> free_perdomain_mappings(), which does the same as destroy_perdomain_mappi=
ng(),
> plus additionally frees the page table structures.
>
> Signed-off-by: Roger Pau Monn=C3=A9 <roger.pau@citrix.com>
> ---
>  xen/arch/x86/hvm/hvm.c   | 1 -
>  xen/arch/x86/pv/domain.c | 3 ---
>  2 files changed, 4 deletions(-)
>
> diff --git a/xen/arch/x86/hvm/hvm.c b/xen/arch/x86/hvm/hvm.c
> index 922c9b3af64d..70fdddae583d 100644
> --- a/xen/arch/x86/hvm/hvm.c
> +++ b/xen/arch/x86/hvm/hvm.c
> @@ -708,7 +708,6 @@ int hvm_domain_initialise(struct domain *d,
>      XFREE(d->arch.hvm.irq);
>   fail0:
>      hvm_destroy_cacheattr_region_list(d);
> -    destroy_perdomain_mapping(d, PERDOMAIN_VIRT_START, 0);
>   fail:
>      hvm_domain_relinquish_resources(d);
>      XFREE(d->arch.hvm.io_handler);
> diff --git a/xen/arch/x86/pv/domain.c b/xen/arch/x86/pv/domain.c
> index 7aef628f55be..bc7cd0c62f0e 100644
> --- a/xen/arch/x86/pv/domain.c
> +++ b/xen/arch/x86/pv/domain.c
> @@ -345,9 +345,6 @@ void pv_domain_destroy(struct domain *d)
>  {
>      pv_l1tf_domain_destroy(d);
> =20
> -    destroy_perdomain_mapping(d, GDT_LDT_VIRT_START,
> -                              GDT_LDT_MBYTES << (20 - PAGE_SHIFT));
> -
>      XFREE(d->arch.pv.cpuidmasks);
> =20
>      FREE_XENHEAP_PAGE(d->arch.pv.gdt_ldt_l1tab);

  Reviewed-by: Alejandro Vallejo <alejandro.vallejo@cloud.com>

Cheers,
Alejandro

