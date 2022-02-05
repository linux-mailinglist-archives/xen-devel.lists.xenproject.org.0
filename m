Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 53B134AAAC1
	for <lists+xen-devel@lfdr.de>; Sat,  5 Feb 2022 19:00:12 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.266067.459741 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nGPKs-0008P9-6E; Sat, 05 Feb 2022 17:58:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 266067.459741; Sat, 05 Feb 2022 17:58:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nGPKs-0008ML-38; Sat, 05 Feb 2022 17:58:58 +0000
Received: by outflank-mailman (input) for mailman id 266067;
 Sat, 05 Feb 2022 17:58:57 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=B8c5=SU=linuxfoundation.org=torvalds@srs-se1.protection.inumbo.net>)
 id 1nGPKr-0008MF-7y
 for xen-devel@lists.xenproject.org; Sat, 05 Feb 2022 17:58:57 +0000
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [2a00:1450:4864:20::62f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 38b43ebf-86ad-11ec-8eb8-a37418f5ba1a;
 Sat, 05 Feb 2022 18:58:30 +0100 (CET)
Received: by mail-ej1-x62f.google.com with SMTP id st12so4461476ejc.4
 for <xen-devel@lists.xenproject.org>; Sat, 05 Feb 2022 09:58:28 -0800 (PST)
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com.
 [209.85.221.49])
 by smtp.gmail.com with ESMTPSA id p5sm212254ejr.105.2022.02.05.09.58.26
 for <xen-devel@lists.xenproject.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 05 Feb 2022 09:58:26 -0800 (PST)
Received: by mail-wr1-f49.google.com with SMTP id f17so17327047wrx.1
 for <xen-devel@lists.xenproject.org>; Sat, 05 Feb 2022 09:58:26 -0800 (PST)
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
X-Inumbo-ID: 38b43ebf-86ad-11ec-8eb8-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=WXQN/i75UpM9/xOZNnsDaFN+ADwpyirVq8QEFHiKvd0=;
        b=PegbMigLRlHjM3CKIz16Ycv/mUvmdJBAgkBr/+/h71H9yIQ6RZwnx+IWeyI1/NTm4M
         /5lz8h/5g1V7wYcwxakyZ4E+oaHWUKSOgTQ9YQscYwglYW6V3XUOJPlUjOmt6Z1RcQtm
         jzvZ7KpvdoX49rGUYwPTVXdujyDcjBUJ8A2lY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=WXQN/i75UpM9/xOZNnsDaFN+ADwpyirVq8QEFHiKvd0=;
        b=fvwMxWzmFOcaA/pYtR2MRbWqbmAzfeoJg9Xp26xcJDDRvBMzKsw4fBHwrZfSffMt23
         nrLjj3iX3lJQxW42Lp192hYDCNqUSX1pxGJ34XWPZ2h8zpmYSgb7PxNF9FIcgNowvtVt
         2fkyKa3DyncDb0RKHXiVF38QBYofvvHjmLFOAB7WenPXJMXgzH+KYdkYPCSqM0PTD+QS
         5kPqHR7gDKlfOF5JSb3A4NOFJQEcWJsEH9FAhzA291QBoas54Lg5XD+0w4+8FvwWvHPf
         FDRFcWhghva18Q6PJN93jgf6o1gDZUJ+BbrDnncu//f2F5LI8XTxsVw7oiziggcKx8FR
         UemA==
X-Gm-Message-State: AOAM531wiUSh8LkdqJShr6lYPrqli8fl9ly9SKEd56kcVCvjzjTGwFtl
	OPSAMWHDfCCkuKdTO9nwcjcuunzh/SRkylhe
X-Google-Smtp-Source: ABdhPJwsNssjiTrjIiZhjT3slrlbr1RfyrsRKxXLpoRr6I2BK5ESIrZp7j02tVapTzVL0qyoL/PKKA==
X-Received: by 2002:a17:907:1b16:: with SMTP id mp22mr3967224ejc.537.1644083907622;
        Sat, 05 Feb 2022 09:58:27 -0800 (PST)
X-Received: by 2002:a5d:500c:: with SMTP id e12mr3760593wrt.193.1644083904052;
 Sat, 05 Feb 2022 09:58:24 -0800 (PST)
MIME-Version: 1.0
References: <20220205110717.16946-1-jgross@suse.com>
In-Reply-To: <20220205110717.16946-1-jgross@suse.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Sat, 5 Feb 2022 09:58:08 -0800
X-Gmail-Original-Message-ID: <CAHk-=wjp-h4bFWsWSPQ+5o6iuiPwiFNRNxfDSaDjURzVU6Af7A@mail.gmail.com>
Message-ID: <CAHk-=wjp-h4bFWsWSPQ+5o6iuiPwiFNRNxfDSaDjURzVU6Af7A@mail.gmail.com>
Subject: Re: [GIT PULL] xen: branch for v5.17-rc3
To: Juergen Gross <jgross@suse.com>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, xen-devel@lists.xenproject.org, 
	Boris Ostrovsky <boris.ostrovsky@oracle.com>
Content-Type: text/plain; charset="UTF-8"

On Sat, Feb 5, 2022 at 3:07 AM Juergen Gross <jgross@suse.com> wrote:
>
> Please git pull the following tag:
>
>  git://git.kernel.org/pub/scm/linux/kernel/git/xen/tip.git for-linus-5.17a-rc3-tag

Diffstat? Shortlog?

This is not a valid pull request.

           Linus

