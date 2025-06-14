Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DC86AD9E89
	for <lists+xen-devel@lfdr.de>; Sat, 14 Jun 2025 19:35:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1015758.1393293 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uQUmP-0004rL-DM; Sat, 14 Jun 2025 17:34:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1015758.1393293; Sat, 14 Jun 2025 17:34:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uQUmP-0004oQ-Ak; Sat, 14 Jun 2025 17:34:57 +0000
Received: by outflank-mailman (input) for mailman id 1015758;
 Sat, 14 Jun 2025 17:34:56 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=duY6=Y5=gmail.com=jandryuk@srs-se1.protection.inumbo.net>)
 id 1uQUmO-0004oG-Bc
 for xen-devel@lists.xenproject.org; Sat, 14 Jun 2025 17:34:56 +0000
Received: from mail-yw1-x1131.google.com (mail-yw1-x1131.google.com
 [2607:f8b0:4864:20::1131])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e23c3f24-4945-11f0-a309-13f23c93f187;
 Sat, 14 Jun 2025 19:34:55 +0200 (CEST)
Received: by mail-yw1-x1131.google.com with SMTP id
 00721157ae682-70e767ce72eso27082487b3.1; 
 Sat, 14 Jun 2025 10:34:55 -0700 (PDT)
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
X-Inumbo-ID: e23c3f24-4945-11f0-a309-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749922494; x=1750527294; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cDhV6xmUYC3b1Y5V49nJvlogNBha3UkbJu2YNvncJsw=;
        b=RFmC8HIvk8/V+kLJEz8hDjyioroD2x7OU1kXGXoF2KeMaq2IgTNZpvqbA3ndBDgjuB
         ns4MCr3fdxAbzYbkmq5Ey4Nv+tYxZCgX6KILLlHeyJUKIRf31KRZY5vMdsw2Bmg9/6qV
         xKU/gnAEfEPVHKtCS22eXvxD4QJpmp/uKbaTpjrcAdSHuNuTM4dfmNnovKGQjOJJoCVN
         BCKzE0c402IogbdlkVUvw3kOQr3QGVSd+jaUAgInU2b/WqWIHoANqAPh80IOREqVvaNk
         1ewC+dKm06dalFMVs8cOaGuHAotm1yvwUODr7KvM6w3AdSZcx4FY9UBMgkb+qV/E4o27
         J0Gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749922494; x=1750527294;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cDhV6xmUYC3b1Y5V49nJvlogNBha3UkbJu2YNvncJsw=;
        b=dUFoyOAccziwrB2+e/epRmJ/9mVTLTYU3TQ4zxV/p76Pku2oVgsHjp6/L+lcknjGuA
         Gf6ws16D+mmhTWzuyqgemrpCrqwI/aAJBcKr4mp4NUZZaqemWsmCfsOSU3TVaWimNZx1
         74NDm/5jV4Q/CefjYRyD7J2v2bBrEA71w0T/qvx04tCl/tn0kI0zCd73Kk0lkCunSe3P
         FfLfEmPeoCyjgrLK13/5CywtQRglrQZIsXaA4mPjw2uW0Dq5YRc1kDBnUGB02LJObJuN
         SHnbgW87wMCDvum/psv52LtzrBWdneA5IyFpkvPiuSpQFz2NZd/fJKGuY5WlE9H9VoXP
         mCqQ==
X-Forwarded-Encrypted: i=1; AJvYcCW4oZNCAXioQBLxjJ2C7tT08dqzvNaCo7LHzk857zQ42zBP+SMlONTUOGUWz2VikAXNn8wUfGS6Io4=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzismVe3kuErZk5VETv0O97BH+pexeaJX+wdh1gf0fcPue4JokA
	VVpdZ0em0h1ZxlI7brFxFaEHAPbgYWq3kj+7UdSDSU3yU9fo/fMv3AYVCCljoTNjoZ613bOedrH
	dCvIK7VLjvMvM1auyXJeA0YdGYpgTV6FWUA==
X-Gm-Gg: ASbGncvDblIXN7+di1ypnfhdarPwnU5xcYvR7PKq4jVH85GxGNFh5jr9PNLrBQeuaEM
	EZpTlCjxv6qtofoi+h/H/++OEqIm+3kUA7TrPCVMnlbcjle4Ggh7iB9uaXKQpquHAAQlA2Dd8VO
	/oEvzBix6zeBg7AY0gHjxrf3mTdOieXTg7HI6vys3Z
X-Google-Smtp-Source: AGHT+IEnUXBHdZZan2t7hZNRwrxb/TNcAcSxV7uKg+6dvle3Ok1rtqBV4i+EiVk9yXrPN55zYZ/42AJ9ZjyntZ+/yn4=
X-Received: by 2002:a05:690c:c11:b0:702:d85:5347 with SMTP id
 00721157ae682-7117555004bmr51919337b3.36.1749922493964; Sat, 14 Jun 2025
 10:34:53 -0700 (PDT)
MIME-Version: 1.0
References: <20250321092451.17309-1-jgross@suse.com> <20250321092451.17309-12-jgross@suse.com>
In-Reply-To: <20250321092451.17309-12-jgross@suse.com>
From: Jason Andryuk <jandryuk@gmail.com>
Date: Sat, 14 Jun 2025 13:34:42 -0400
X-Gm-Features: AX0GCFsg2jB4J4zs2QFEH31Q5A472MF0rLBTdx-U_3wX75rW_56ooDO23PVenUU
Message-ID: <CAKf6xpsi++LOh-s3F7ZWUp-orBYg+WdmNEe+EMG_-T2=NVvRVw@mail.gmail.com>
Subject: Re: [MINI-OS PATCH 11/12] kexec: add kexec callback functionality
To: Juergen Gross <jgross@suse.com>
Cc: minios-devel@lists.xenproject.org, xen-devel@lists.xenproject.org, 
	samuel.thibault@ens-lyon.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 21, 2025 at 5:32=E2=80=AFAM Juergen Gross <jgross@suse.com> wro=
te:
>
> Add a kexec_call() macro which will provide the capability to register
> a function for being called when doing a kexec() call. The called
> functions will be called with a boolean parameter "undo" indicating
> whether a previous call needs to be undone due to a failure during
> kexec().
>
> The related loop to call all callbacks is added to kexec().
>
> Signed-off-by: Juergen Gross <jgross@suse.com>

> diff --git a/arch/x86/mm.c b/arch/x86/mm.c
> index f4419d95..26ede6f4 100644
> --- a/arch/x86/mm.c
> +++ b/arch/x86/mm.c
> @@ -529,7 +529,8 @@ void change_readonly(bool readonly)
>  #endif
>      }
>
> -    printk("setting %p-%p readonly\n", &_text, &_erodata);
> +    printk("setting %p-%p %s\n", &_text, &_erodata,
> +           readonly ? "readonly" : "writable");

Oh, I think this belongs in the earlier change.

With that moved, this one (and the earlier one still)

Code wise:
Reviewed-by: Jason Andryuk <jason.andryuk@amd.com>

But this kexec_call() macro isn't actually used?  xenstore needs this
to prepare for kexec?

Regards,
Jason

