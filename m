Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 767BD905559
	for <lists+xen-devel@lfdr.de>; Wed, 12 Jun 2024 16:39:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.739381.1146386 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sHP7u-0007UL-MI; Wed, 12 Jun 2024 14:39:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 739381.1146386; Wed, 12 Jun 2024 14:39:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sHP7u-0007SC-Jk; Wed, 12 Jun 2024 14:39:02 +0000
Received: by outflank-mailman (input) for mailman id 739381;
 Wed, 12 Jun 2024 14:39:01 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=kV4F=NO=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1sHP7t-0007Rq-R7
 for xen-devel@lists.xenproject.org; Wed, 12 Jun 2024 14:39:01 +0000
Received: from mail-qv1-xf35.google.com (mail-qv1-xf35.google.com
 [2607:f8b0:4864:20::f35])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 80a4524a-28c9-11ef-90a3-e314d9c70b13;
 Wed, 12 Jun 2024 16:39:00 +0200 (CEST)
Received: by mail-qv1-xf35.google.com with SMTP id
 6a1803df08f44-6b07937b84fso11908836d6.1
 for <xen-devel@lists.xenproject.org>; Wed, 12 Jun 2024 07:38:58 -0700 (PDT)
Received: from localhost ([213.195.124.163]) by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-6b04f6c3a68sm68200066d6.52.2024.06.12.07.38.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 12 Jun 2024 07:38:57 -0700 (PDT)
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
X-Inumbo-ID: 80a4524a-28c9-11ef-90a3-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1718203138; x=1718807938; darn=lists.xenproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=YsQmLlGiAdIAtpleQKN3iUqLiU1T3f22WnBDLc4QB8w=;
        b=IBCFEl/W3PZ1/gdR08av3+is1Zdk1uviWN/G8oXdZph5O0ZxgSJRkPciHXfckTva32
         zMdFwLcylGpnrBVIUFEqHUi50sgF336QVQqVscgHrmOBlvEysfr6Jv9x+DfE6f9g1Fwv
         jIfXMbTByudG1ldFvUqchygVVo4ZZ6Jw/H5Mk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718203138; x=1718807938;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YsQmLlGiAdIAtpleQKN3iUqLiU1T3f22WnBDLc4QB8w=;
        b=qA3MHI7xmFK4jhrBejRk+1oFQ/TjLu5mIUNx4MM530BfEWICUFrA9ltPNwLL2lpOfa
         felKZUV25f+OQXgjhmAGvfanGtdcmhLbq7vq08z30rFdT+zU2xRU+QDhMiDzPnRDKqYl
         g8uOz5ZpF/9la4jAO12pSsAezFUSgOyJ3K+VQYlpCzEDrHCfr0HJJLkFWC2zsWro1IOG
         cGg/g2/d7eW33ozmyOH4srKP6RLYk9d2oMd9YazwlrUAObJjbf5LEjE7+ZwASNqljnaJ
         nXdW5zqMCIoiRizW/9MvpFQlV02nAy7kyZ26cR/coG8Vf/SHZ11mtmFBwjsNMq4s+K0J
         UZjw==
X-Gm-Message-State: AOJu0YxMUpe8m3xFKa6hCUgnR/Y0lHSHMUbgpJji/wrmaR8V+KUTAMkD
	veygBqCSYPfBJWlm4rn4i1E/UF61VnjWpGET+MAqePIaJ5VfZT8BH5ASBUFp97c=
X-Google-Smtp-Source: AGHT+IEGEEKCole9RnH2jsFIyRYxxPxtF2PWIksbsDpwL38sX2ypPFN6XSRLcotoqFfyxcqsnFJOzw==
X-Received: by 2002:a05:6214:3109:b0:6b0:7ceb:3076 with SMTP id 6a1803df08f44-6b191684731mr19629566d6.12.1718203137666;
        Wed, 12 Jun 2024 07:38:57 -0700 (PDT)
Date: Wed, 12 Jun 2024 16:38:55 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>
Subject: Re: [PATCH v2 for-4.19 2/3] x86/EPT: avoid marking non-present
 entries for re-configuring
Message-ID: <Zmmy_-JqqWRuwvCj@macbook>
References: <2936ffad-5395-45fd-877f-7fb2ca8b9dc8@suse.com>
 <d31f0f8e-4eb7-4617-86f6-81f38b5c61aa@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <d31f0f8e-4eb7-4617-86f6-81f38b5c61aa@suse.com>

On Wed, Jun 12, 2024 at 03:16:59PM +0200, Jan Beulich wrote:
> For non-present entries EMT, like most other fields, is meaningless to
> hardware. Make the logic in ept_set_entry() setting the field (and iPAT)
> conditional upon dealing with a present entry, leaving the value at 0
> otherwise. This has two effects for epte_get_entry_emt() which we'll
> want to leverage subsequently:
> 1) The call moved here now won't be issued with INVALID_MFN anymore (a
>    respective BUG_ON() is being added).
> 2) Neither of the other two calls could now be issued with a truncated
>    form of INVALID_MFN anymore (as long as there's no bug anywhere
>    marking an entry present when that was populated using INVALID_MFN).
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> ---
> v2: New.
> 
> --- a/xen/arch/x86/mm/p2m-ept.c
> +++ b/xen/arch/x86/mm/p2m-ept.c
> @@ -650,6 +650,8 @@ static int cf_check resolve_misconfig(st
>              if ( e.emt != MTRR_NUM_TYPES )
>                  break;
>  
> +            ASSERT(is_epte_present(&e));

If this is added here, then there's a condition further below:

if ( !is_epte_valid(&e) || !is_epte_present(&e) )

That needs adjusting AFAICT.

However, in ept_set_entry() we seem to unconditionally call
resolve_misconfig() against the new entry to be populated, won't this
possibly cause resolve_misconfig() to be called against non-present
EPT entries?  I think this is fine because such non-present entries
will have emt == 0, and hence will take the break just ahead of the
added ASSERT().

> +
>              if ( level == 0 )
>              {
>                  for ( gfn -= i, i = 0; i < EPT_PAGETABLE_ENTRIES; ++i )
> @@ -915,17 +917,6 @@ ept_set_entry(struct p2m_domain *p2m, gf
>  
>      if ( mfn_valid(mfn) || p2m_allows_invalid_mfn(p2mt) )
>      {
> -        bool ipat;
> -        int emt = epte_get_entry_emt(p2m->domain, _gfn(gfn), mfn,
> -                                     i * EPT_TABLE_ORDER, &ipat,
> -                                     p2mt);
> -
> -        if ( emt >= 0 )
> -            new_entry.emt = emt;
> -        else /* ept_handle_misconfig() will need to take care of this. */
> -            new_entry.emt = MTRR_NUM_TYPES;
> -
> -        new_entry.ipat = ipat;
>          new_entry.sp = !!i;
>          new_entry.sa_p2mt = p2mt;
>          new_entry.access = p2ma;
> @@ -941,6 +932,22 @@ ept_set_entry(struct p2m_domain *p2m, gf
>              need_modify_vtd_table = 0;
>  
>          ept_p2m_type_to_flags(p2m, &new_entry);
> +
> +        if ( is_epte_present(&new_entry) )
> +        {
> +            bool ipat;
> +            int emt = epte_get_entry_emt(p2m->domain, _gfn(gfn), mfn,
> +                                         i * EPT_TABLE_ORDER, &ipat,
> +                                         p2mt);
> +
> +            BUG_ON(mfn_eq(mfn, INVALID_MFN));
> +
> +            if ( emt >= 0 )
> +                new_entry.emt = emt;
> +            else /* ept_handle_misconfig() will need to take care of this. */
> +                new_entry.emt = MTRR_NUM_TYPES;
> +            new_entry.ipat = ipat;
> +        }

Should we assert that if new_entry.emt == MTRR_NUM_TYPES the entry
must have the present bit set before the atomic_write_ept_entry()
call?

Thanks, Roger.

