Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D465A8A7CE3
	for <lists+xen-devel@lfdr.de>; Wed, 17 Apr 2024 09:15:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.707267.1105028 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rwzUi-0002Ih-Px; Wed, 17 Apr 2024 07:14:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 707267.1105028; Wed, 17 Apr 2024 07:14:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rwzUi-0002HB-NG; Wed, 17 Apr 2024 07:14:12 +0000
Received: by outflank-mailman (input) for mailman id 707267;
 Wed, 17 Apr 2024 07:14:10 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=SI9G=LW=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1rwzUg-0002H3-CQ
 for xen-devel@lists.xenproject.org; Wed, 17 Apr 2024 07:14:10 +0000
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com
 [2a00:1450:4864:20::12b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 14f4393e-fc8a-11ee-94a3-07e782e9044d;
 Wed, 17 Apr 2024 09:14:08 +0200 (CEST)
Received: by mail-lf1-x12b.google.com with SMTP id
 2adb3069b0e04-516d487659bso6315893e87.2
 for <xen-devel@lists.xenproject.org>; Wed, 17 Apr 2024 00:14:08 -0700 (PDT)
Received: from localhost ([85.31.135.62]) by smtp.gmail.com with ESMTPSA id
 c18-20020adffb12000000b003464150a642sm3651548wrr.108.2024.04.17.00.14.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 Apr 2024 00:14:07 -0700 (PDT)
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
X-Inumbo-ID: 14f4393e-fc8a-11ee-94a3-07e782e9044d
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1713338048; x=1713942848; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=73yJsMMcq0oF7n3BsPPEmp3Cwlx/EMjMEUi1HZ44BfI=;
        b=Rm8pNAnpjbIFnqKcaGRTbtyTs9H774H0U8QgDgjrT4fkr/tJ2ZOop0bSfS4NK1gauO
         vfzUs30Nt+Bnh8MddKKtdu+E9MWLy0szgJqBjM30jSmqfjJuP9HZIKMpE/E2Oobcu1ky
         uMzrqu2Gjgs58l8Gr7aOW6h5/IXKWSVhSQH0g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713338048; x=1713942848;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=73yJsMMcq0oF7n3BsPPEmp3Cwlx/EMjMEUi1HZ44BfI=;
        b=J7bK26pgBbYfe35GNian4ROAszByFQJ01cUxvrzjx3z0Gadhei7taXLCoXfKLyoPR3
         4C/GqxVddGUg+F6MSjOV0L3isMJSF7LMhIl3axnY4+2ETHSTgqdsI/NHlI9SPdrROox2
         p0Ib5vrsH3IxChUg9bKIM8rFrig/FFr37gfrKRDSXCXAzZQFLhWe2dq9gs+l4bFhFMRj
         89q8lNrGRGu1RMY9tv9iNTSuXuQCNVsFAMY7yN/h5qci1l99svwMxk/SR/K9zCyxY8Nv
         tIGCF5RM/6hHR11da63MJST+Cv/2s/Uz855KwL/kI76MXG31suTtsIC78Umb9UChVXuy
         HPHw==
X-Gm-Message-State: AOJu0Yzt5Sn9rb+oVqCMPbz6Oxvz0NOzyX/xjRXeJvRCr57DG44lBYC7
	18y4Vos5quyU1apSDW/YDvi4icssNbzAB34SLFCLF2OkBgk5aLvtcBU6t7FI5ds=
X-Google-Smtp-Source: AGHT+IGGG9P9gLBclRj00Y1Jr5iP1ouy6fg/KcLtNQBVoebMm/TvMq51+x0QOvjvfEirHH1zLJ0Flw==
X-Received: by 2002:a19:7710:0:b0:516:d86b:3d5a with SMTP id s16-20020a197710000000b00516d86b3d5amr9165639lfc.21.1713338047579;
        Wed, 17 Apr 2024 00:14:07 -0700 (PDT)
Date: Wed, 17 Apr 2024 09:14:06 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
	Jan Beulich <JBeulich@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	"consulting @ bugseng . com" <consulting@bugseng.com>,
	Roberto Bagnara <roberto.bagnara@bugseng.com>,
	Federico Serafini <federico.serafini@bugseng.com>,
	Nicola Vetrini <nicola.vetrini@bugseng.com>
Subject: Re: [PATCH] xen/efi: Rewrite DOS/PE magic checking without memcmp()
Message-ID: <Zh92vsPzuHjTIs21@macbook>
References: <20240416155251.2942504-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240416155251.2942504-1-andrew.cooper3@citrix.com>

On Tue, Apr 16, 2024 at 04:52:51PM +0100, Andrew Cooper wrote:
> Misra Rule 21.16 doesn't like the use of memcmp() between a string literal and
> a UINT8 array.  Rewrite using plain compares.

The commit message makes it look like it's a type mismatch issue
between the two elements being compared, but from my reading of the
rule the issue is with the usage of a char pointer with memcmp().
IOW: even if the two parameters are char pointers it would still be a
violation.

"Misra Rule 21.16 forbids the use of memcmp() against character
arrays.  Rewrite using plain compares since checking for "PE\0\0"
cannot be done using strncmp()."

> 
> No functional change.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

LGTM (possibly pending the adjustment of the commit message):

Acked-by: Roger Pau Monné <roger.pau@citrix.com>

One question below to ensure my understating is correct.

> ---
> CC: Jan Beulich <JBeulich@suse.com>
> CC: Roger Pau Monné <roger.pau@citrix.com>
> CC: Stefano Stabellini <sstabellini@kernel.org>
> CC: consulting@bugseng.com <consulting@bugseng.com>
> CC: Roberto Bagnara <roberto.bagnara@bugseng.com>
> CC: Federico Serafini <federico.serafini@bugseng.com>
> CC: Nicola Vetrini <nicola.vetrini@bugseng.com>
> ---
>  xen/common/efi/pe.c | 8 ++++++--
>  1 file changed, 6 insertions(+), 2 deletions(-)
> 
> diff --git a/xen/common/efi/pe.c b/xen/common/efi/pe.c
> index a84992df9afe..ef8a2543e0a1 100644
> --- a/xen/common/efi/pe.c
> +++ b/xen/common/efi/pe.c
> @@ -111,7 +111,8 @@ const void *__init pe_find_section(const void *image, const UINTN image_size,
>      UINTN offset, i;
>  
>      if ( image_size < sizeof(*dos) ||
> -         memcmp(dos->Magic, "MZ", 2) != 0 )
> +         dos->Magic[0] != 'M' ||
> +         dos->Magic[1] != 'Z' )

For this one you could likely use strncmp()?

>          return NULL;
>  
>      offset = dos->ExeHeader;
> @@ -119,7 +120,10 @@ const void *__init pe_find_section(const void *image, const UINTN image_size,
>  
>      offset += sizeof(*pe);
>      if ( image_size < offset ||
> -         memcmp(pe->Magic, "PE\0\0", 4) != 0 )
> +         pe->Magic[0] != 'P' ||
> +         pe->Magic[1] != 'E' ||
> +         pe->Magic[2] != '\0' ||
> +         pe->Magic[3] != '\0' )

This one with the double null terminator is indeed not suitable to be
checked using strncmp().

Thanks, Roger.

