Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DA8D985E73
	for <lists+xen-devel@lfdr.de>; Wed, 25 Sep 2024 15:36:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.803977.1214828 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1stSB5-0000Xn-Sp; Wed, 25 Sep 2024 13:35:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 803977.1214828; Wed, 25 Sep 2024 13:35:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1stSB5-0000WF-Q7; Wed, 25 Sep 2024 13:35:35 +0000
Received: by outflank-mailman (input) for mailman id 803977;
 Wed, 25 Sep 2024 13:35:34 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=aBXn=QX=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1stSB4-0000W9-Io
 for xen-devel@lists.xenproject.org; Wed, 25 Sep 2024 13:35:34 +0000
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com
 [2a00:1450:4864:20::52d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0a0916fd-7b43-11ef-a0ba-8be0dac302b0;
 Wed, 25 Sep 2024 15:35:33 +0200 (CEST)
Received: by mail-ed1-x52d.google.com with SMTP id
 4fb4d7f45d1cf-5c25f01879fso8403880a12.1
 for <xen-devel@lists.xenproject.org>; Wed, 25 Sep 2024 06:35:33 -0700 (PDT)
Received: from localhost ([213.195.124.163]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5c5cf49728asm1864866a12.33.2024.09.25.06.35.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Sep 2024 06:35:32 -0700 (PDT)
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
X-Inumbo-ID: 0a0916fd-7b43-11ef-a0ba-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1727271333; x=1727876133; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Hx7qRcmPOnrsxFpxplPsGxVYBYyZd9jd2xRgX6u4k8M=;
        b=i+85+43fLUGiRaYSVCSopvOjUOeY1o6lWtH8Q1vfEiWDemyvwRgk8NWDilaV/NBr6L
         7Vx59serE9tyVW0V6FA6bot308em+r7aBwduCtN/tpxN3I8ZmQCkbDDkub3u5/DbU+br
         HpINTxN5nVHavtnHr8ugm86c9rHcoVXy+f4ZM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727271333; x=1727876133;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Hx7qRcmPOnrsxFpxplPsGxVYBYyZd9jd2xRgX6u4k8M=;
        b=UT3BbNwLA70sMS04on03TrJSL+yeU2JWSGFF4B2uu8LL56spmCE9Av4sXQg4LPSlMI
         0f1H+JW4XRcxLBCcq8YCLaVhxTaO5Nr1p/Jgh1HA+3F1FaaTSPwD8HUGyIfWv99MEpOx
         x+lt7f8p+J30YJ8EWx2B+CXLK1KpcCmExTXvDkPKeSMcTmo866X5holuXvAYmBKNmp7Y
         htAvFvRd2YRcs0NPPKkLT6lf7SymkuDRkzYxiNH/DepxD6n2WaWHM3rhSjoOdMP6V5JG
         Dm+v+gaBrqWlBtiN8ksT6nloJ1aB8OrAzyWOLJNbVsAqWoq8NToS49tVNTXRNmaD1cbf
         pjUg==
X-Gm-Message-State: AOJu0YyQofUW/JmQxH2MZhP09QbZP7AI1E/TAQnjdKHSGDpC0ZQU7Zg3
	sMAshvODRp+GHmenAltEk2iTjqLFtj9qPKSJqrV5+iVdfttyf5yPxkSRYwjRAi58cDaT7DrmxcA
	e
X-Google-Smtp-Source: AGHT+IF3VlnLlRsJ2nqx4d84LQ8B3wYfu0mtWWzVYA4J2vgY4HyAqfkcw0A1HiX9hwOGZ7Ug8v9vRw==
X-Received: by 2002:a05:6402:1e94:b0:59e:f6e7:5521 with SMTP id 4fb4d7f45d1cf-5c7206229d6mr2158011a12.19.1727271332779;
        Wed, 25 Sep 2024 06:35:32 -0700 (PDT)
Date: Wed, 25 Sep 2024 15:35:31 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: xen-devel@lists.xenproject.org,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Community Manager <community.manager@xenproject.org>
Subject: Re: [PATCH] changelog: add note about blkif protocol fixes
Message-ID: <ZvQRo5upeHjxKTbu@macbook.local>
References: <20240912132347.28756-1-roger.pau@citrix.com>
 <0246f345-76db-4633-bb8d-4c6bc735fe61@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <0246f345-76db-4633-bb8d-4c6bc735fe61@citrix.com>

On Wed, Sep 25, 2024 at 12:18:59PM +0100, Andrew Cooper wrote:
> On 12/09/2024 2:23 pm, Roger Pau Monne wrote:
> > Reported-by: Andrew Cooper <andrew.cooper3@citrix.com>
> > Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> > ---
> >  CHANGELOG.md | 1 +
> >  1 file changed, 1 insertion(+)
> >
> > diff --git a/CHANGELOG.md b/CHANGELOG.md
> > index 26e7d8dd2ac4..8864ea7eafad 100644
> > --- a/CHANGELOG.md
> > +++ b/CHANGELOG.md
> > @@ -9,6 +9,7 @@ The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/)
> >  ### Changed
> >   - On x86:
> >     - Prefer ACPI reboot over UEFI ResetSystem() run time service call.
> > + - Fixed blkif protocol specification for sector sizes different than 512b.
> 
> It's minor, but blkif is common, so should go ahead of the "On x86"
> subsection.

Oh, it's in common (indentation wise) it's just after the x86 section.
For other release notes we have the x86/ARM/... sections first, and
afterwards the common changes.

I don't mind putting the common changes first and the arch-specific
ones later, but it should likely be documented somewhere.

Thanks, Roger.

