Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BB0E4AD9E5F
	for <lists+xen-devel@lfdr.de>; Sat, 14 Jun 2025 19:03:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1015690.1393242 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uQUHO-0006t4-8Q; Sat, 14 Jun 2025 17:02:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1015690.1393242; Sat, 14 Jun 2025 17:02:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uQUHO-0006pG-5Q; Sat, 14 Jun 2025 17:02:54 +0000
Received: by outflank-mailman (input) for mailman id 1015690;
 Sat, 14 Jun 2025 17:02:53 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=duY6=Y5=gmail.com=jandryuk@srs-se1.protection.inumbo.net>)
 id 1uQUHN-0006oq-Bd
 for xen-devel@lists.xenproject.org; Sat, 14 Jun 2025 17:02:53 +0000
Received: from mail-yw1-x112b.google.com (mail-yw1-x112b.google.com
 [2607:f8b0:4864:20::112b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 67be73db-4941-11f0-a309-13f23c93f187;
 Sat, 14 Jun 2025 19:02:51 +0200 (CEST)
Received: by mail-yw1-x112b.google.com with SMTP id
 00721157ae682-70e447507a0so23014307b3.0; 
 Sat, 14 Jun 2025 10:02:51 -0700 (PDT)
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
X-Inumbo-ID: 67be73db-4941-11f0-a309-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749920570; x=1750525370; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=f1rUaCtNzV4B4nne9ETOS7IrnAJZb2wTVv5/DHGcfCA=;
        b=DpSONPjw/PM1C6jaJ6YLxdMUI1gPaVvSe2aog4b/KJ5mHu6L5Bq9YYUxWVo39PP1vK
         n+ytF6FJspKo/sJ0zh0WAvLDL0leTKynBd93Ib3cLVzUGw7tH8CmsAx/aYh6NXAlzy9G
         FuF4uGtDpbD8bhk5UkTT9h3KTPeOkksNp+zkYjCGbPbOnV9CsCNZlYF7+FVi/3R+lZzq
         cEssDbD+A8p5w/xJHVM7aWDXk28ruWHeF5/Rfq6N5DWG1j7hLhAgGGD2H89ytCCKxPB+
         KIOidEdCwmCNYlKRbJIhGYefDt2YwveGtkfzDvk2tN4S+ZH/BJkpE2zkAqtx5nWEsKxi
         CYLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749920570; x=1750525370;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=f1rUaCtNzV4B4nne9ETOS7IrnAJZb2wTVv5/DHGcfCA=;
        b=LeJ6PDxklsQlxWQ7RN76Pvqnn8TciWGwnRwb3U1dzzfWVdvyq9UsCF6c7lKoMThnkJ
         vVVu2W5kpDYiX/x54iLEdZGEatu26FX3Obg6um8a+j6N23M717tmaCcLXBtrsqGxK21H
         pPj4AJOKy/A40v+cIpb+Yc/Z2ogyoPHxx9jST2anGPolmgea3OaqZeb7w6T0Ip/YzwZ4
         vs45OOL5t+nZyT6lNCL2tltodtCSm1T1bi0n+jGl3CtD+jQbqtPCY1xtXwCD0sCvy2d2
         8PuifvclUtZfQl8fxOlGMlllBc7chIn1XjQmBhf3eQvondRcqpMvgqL0fknKrKZyYbZD
         P2nQ==
X-Forwarded-Encrypted: i=1; AJvYcCUYtAXQ4REa3umyQaLErgv9aSFwAcR/e8SRX1LQdA8IUehtU8MJZ8QPDdh150/X7UeRMRwSLp55fms=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwAq5RdF6zCfToccivAJ2aZZW4LSc9HensW4GMzrgfYg0PCL3eS
	klD/zgo2tK68ugD2k/mO2G0NV7iXlRup49wwdsvp9dD8JcGSJTy5RdzNx4nSHsr45nwgP5JhLg+
	7sMH8KoG69T8wg9K2FyV9r+uRahsL2yc=
X-Gm-Gg: ASbGncskI82lkueei8hOuOOJdVBQl4N+nbn7CFh3ZY/OeoPl7mwDmPxRKRvoW32I1QQ
	BQxRWy2Mk+bquoTsor3rIbjdvnS/8lEg/f2LACcJiKySs86oCVTpnSfEdT7sz5T0Q+NI91KtbdN
	stG7Dd+1x0fBFv3VWzv0eYexphWyrleK6wrn4jX7H8
X-Google-Smtp-Source: AGHT+IFj3p5xXle6Z4j9FTHjmTsWeQaVLjYfgGif2AY1z4ez+pJDkc5DEE/s5+LpbmfVu0bmuAmdZFeRpEEfGBVaoSo=
X-Received: by 2002:a05:690c:83:b0:710:e4c4:a938 with SMTP id
 00721157ae682-71175463265mr49057837b3.38.1749920570575; Sat, 14 Jun 2025
 10:02:50 -0700 (PDT)
MIME-Version: 1.0
References: <20250321092451.17309-1-jgross@suse.com> <20250321092451.17309-8-jgross@suse.com>
In-Reply-To: <20250321092451.17309-8-jgross@suse.com>
From: Jason Andryuk <jandryuk@gmail.com>
Date: Sat, 14 Jun 2025 13:02:38 -0400
X-Gm-Features: AX0GCFtDlZJm9XQly_TrFooP5JTbN470WRlmToOXULLBRj_Z9pmgjQuKr5u9nN8
Message-ID: <CAKf6xptFRWt7tnBnfMKmuHUcOkBV0iiCyjnhu4bxfT=+YdvRXQ@mail.gmail.com>
Subject: Re: [MINI-OS PATCH 07/12] kexec: build parameters for new kernel
To: Juergen Gross <jgross@suse.com>
Cc: minios-devel@lists.xenproject.org, xen-devel@lists.xenproject.org, 
	samuel.thibault@ens-lyon.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 21, 2025 at 5:30=E2=80=AFAM Juergen Gross <jgross@suse.com> wro=
te:
>
> Build the parameters for the new kernel, consisting of the
> hvm_start_info struct, the memory map and the command line.
>
> Signed-off-by: Juergen Gross <jgross@suse.com>

> @@ -212,4 +213,61 @@ void kexec_set_param_loc(const char *cmdline)

> +
> +    /* The call of the new kernel happens via the physical address! */
> +    if ( kexec_add_action(KEXEC_CALL, (void *)kernel_entry,

Maybe kernel_entry_pa, kernel_phys32_entry, or kernel_phys_entry would
be a better name to make the physical address clear?

Either way:
Reviewed-by: Jason Andryuk <jason.andryuk@amd.com>

Regards,
Jason

