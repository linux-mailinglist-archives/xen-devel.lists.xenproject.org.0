Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E73DF873CD7
	for <lists+xen-devel@lfdr.de>; Wed,  6 Mar 2024 18:03:07 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.689402.1074324 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rhuf4-0004CI-NZ; Wed, 06 Mar 2024 17:02:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 689402.1074324; Wed, 06 Mar 2024 17:02:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rhuf4-0004AI-L2; Wed, 06 Mar 2024 17:02:34 +0000
Received: by outflank-mailman (input) for mailman id 689402;
 Wed, 06 Mar 2024 17:02:33 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=WCvN=KM=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1rhuf3-0004AA-8D
 for xen-devel@lists.xenproject.org; Wed, 06 Mar 2024 17:02:33 +0000
Received: from mail-qk1-x733.google.com (mail-qk1-x733.google.com
 [2607:f8b0:4864:20::733])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 520c2721-dbdb-11ee-afda-a90da7624cb6;
 Wed, 06 Mar 2024 18:02:32 +0100 (CET)
Received: by mail-qk1-x733.google.com with SMTP id
 af79cd13be357-7882bcace1aso103346085a.1
 for <xen-devel@lists.xenproject.org>; Wed, 06 Mar 2024 09:02:32 -0800 (PST)
Received: from localhost ([213.195.118.74]) by smtp.gmail.com with ESMTPSA id
 q15-20020a05620a038f00b007883218feb7sm2384169qkm.97.2024.03.06.09.02.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Mar 2024 09:02:30 -0800 (PST)
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
X-Inumbo-ID: 520c2721-dbdb-11ee-afda-a90da7624cb6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1709744551; x=1710349351; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=aH3iAdE2KZA7E0mXRJz3+0UjEpDPnmp2g33ORB0Owz8=;
        b=QrKSnuKkB05p5NbncCrOrktAOcPcnO+/ge19YQYYt6C2bLddx6m3XjFUdS58JoeDtN
         CgS8pZwBvvHEdYOfFbYPRqlACA0SZmUgk480CnWWnhD3HkJH+ePv2mtRaMCfcChcTCet
         XGvLp2vnYfm3QMQllVVUqXI8CLfCa+kJJvIKo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709744551; x=1710349351;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=aH3iAdE2KZA7E0mXRJz3+0UjEpDPnmp2g33ORB0Owz8=;
        b=PIhZg8jI00Ot30Dkt1oJ/1Hryv/xtLjKr+fXJrc7DW44AcqPctLdRSSNlU2Inq5f8d
         NXS0OF8F7kuml35Ee04KxwVFuHFeQhk9NM9CxVeQa8z0bT5Ewclrk9SIfrGFY3QPeYja
         0DiNsKZP3qwU9mcJnStPb8v6jAaxA9dsOT0X3qCQm0/7mxycmrCZTu7BynLttzfUrhMU
         Rjkt9XwTNGVtND/x57Y5mz3i/Yig/TLJS3DAjb/qmLVYdDoHXFYkB8UIGGA5oB4U+WZZ
         +sCt1s8f5VaYjJbylAH07stnbsG5GgGH9/6pNPyLta+qPFf3L4iD4bZztQTmhRr6xlZL
         dFmg==
X-Gm-Message-State: AOJu0Yx0AAUpo5gZP+28pnAvX2Cet+iybfnIJndA1WaBCEra2flSzfYS
	GuVgSNozj1IHErw/nfyG/9k0cYVe4Dtbm3o/rce7qJqYDNGp9LYOf73wJYhJgrE=
X-Google-Smtp-Source: AGHT+IHCqX1okO3vJvA0qv5VfxtysxHq6675ByxjtPdlOl6kgFugRJL4f+p9CNauCTreLTsFqtHsBQ==
X-Received: by 2002:a05:620a:8511:b0:788:1837:4b52 with SMTP id pe17-20020a05620a851100b0078818374b52mr5354726qkn.72.1709744551121;
        Wed, 06 Mar 2024 09:02:31 -0800 (PST)
Date: Wed, 6 Mar 2024 18:02:28 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: zithro / Cyril =?utf-8?Q?R=C3=A9bert?= <slack@rabbit.lu>
Cc: xen-devel@lists.xenproject.org, Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>
Subject: Re: [PATCH] docs/man: add shutdown reasons to xl (list) man page
Message-ID: <ZeihpDEMsopciBUZ@macbook>
References: <019602d6da2ff78e6582b9b6aae6d76216e150c3.1709678713.git.slack@rabbit.lu>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <019602d6da2ff78e6582b9b6aae6d76216e150c3.1709678713.git.slack@rabbit.lu>

On Tue, Mar 05, 2024 at 11:45:13PM +0100, zithro / Cyril Rébert wrote:
> Add the shutdown reasons to the paragraph of "xl list" concerning the
> shutdown status.
> I have copy/pasted the explanations from the source code :
> 
>  - tools/xl/xl_info.c (L379)
>  - xen/include/public/sched.h (starting L158)
> 
> Suggested-by: Roger Pau Monné <roger.pau@citrix.com>
> Signed-off-by: Cyril Rébert / zithro <slack@rabbit.lu>

Thanks for doing this, Anthony already provided some feedback.

> ---
>  docs/man/xl.1.pod.in | 34 ++++++++++++++++++++++++++++++++++
>  1 file changed, 34 insertions(+)
> 
> diff --git a/docs/man/xl.1.pod.in b/docs/man/xl.1.pod.in
> index bed8393473..2b046f97f1 100644
> --- a/docs/man/xl.1.pod.in
> +++ b/docs/man/xl.1.pod.in
> @@ -370,6 +370,40 @@ scheduling by the Xen hypervisor.
>  The guest OS has shut down (SCHEDOP_shutdown has been called) but the
>  domain is not dying yet.
>  
> +There are six shutdown reasons, which will be displayed after the "s" : B<-rscwS>.
> +
> +=over 4
> +
> +=over 4
> +
> +=item s- : poweroff
> +
> +Domain exited normally. Clean up and kill.
> +
> +=item sr : reboot
> +
> +Clean up, kill, and then restart.
> +
> +=item ss : suspend
> +
> +The domain is suspended. Clean up, save suspend info, kill.
> +
> +=item sc : crash
> +
> +Tell controller we've crashed.
> +
> +=item sw : watchdog
> +
> +Restart because watchdog time expired.
> +
> +=item sS : soft_reset
> +
> +Domain asked to perform 'soft reset' for it. The expected behavior is to reset internal Xen state for the domain returning it to the point where it was created but leaving the domain's memory contents and vCPU contexts intact. This will allow the domain to start over and set up all Xen specific interfaces again.

The man page sources are kept at 80 columns, can you please wrap this
text so it doesn't exceed the 80 col limit?

Roger.

