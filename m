Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E278489DE67
	for <lists+xen-devel@lfdr.de>; Tue,  9 Apr 2024 17:15:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.702495.1097560 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ruDAu-0000ke-SN; Tue, 09 Apr 2024 15:14:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 702495.1097560; Tue, 09 Apr 2024 15:14:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ruDAu-0000ij-Pf; Tue, 09 Apr 2024 15:14:16 +0000
Received: by outflank-mailman (input) for mailman id 702495;
 Tue, 09 Apr 2024 15:14:16 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=mUTu=LO=cloud.com=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1ruDAt-0000hs-UR
 for xen-devel@lists.xenproject.org; Tue, 09 Apr 2024 15:14:15 +0000
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [2a00:1450:4864:20::32a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d3a51097-f683-11ee-b907-491648fe20b8;
 Tue, 09 Apr 2024 17:14:14 +0200 (CEST)
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-4169ebcc924so7954415e9.0
 for <xen-devel@lists.xenproject.org>; Tue, 09 Apr 2024 08:14:14 -0700 (PDT)
Received: from perard.uk.xensource.com (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 u12-20020a05600c19cc00b0041469869d11sm21105360wmq.47.2024.04.09.08.14.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Apr 2024 08:14:13 -0700 (PDT)
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
X-Inumbo-ID: d3a51097-f683-11ee-b907-491648fe20b8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1712675654; x=1713280454; darn=lists.xenproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=5d+8phuU62rSILC7GcY2dmqF0ruh/s7CXWR432xzIOs=;
        b=XQ+ZkXxjzts8QQtuDGhNufhltLOqXy8hg9bJv7l7tngV+RjgkAYPLez/JPlfHgJVSf
         G32cKdwdacCypmw1md19dPWFts7M0LHNJSKJ4hI64326Ld4fSB4zSJxKw0IcJvjX6zfP
         xaaXIr34yR7XUV3+4lsKnaBB2gYIo97ppZlHw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712675654; x=1713280454;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5d+8phuU62rSILC7GcY2dmqF0ruh/s7CXWR432xzIOs=;
        b=Bkk4nKBWja3p5JFlfUpnIMMRCLmRNMSRLHKxSp3nWqHfEh3LI//66wcqtmYYprTHqt
         evmlB3TK7NMzMgfaXy58cacxcQVgqu0H0ntC/LSU/pmLsvlkE2OaDFv/1ZAmarfqGvTI
         F+6t3dhk7Ssq0AMKb2nF5jpc2fNfzr3lXXFRw+TSETkYkKS4pgxav1w/XSgNbUHq1gGf
         8YGsjBr0VJM015BZEz/U+YNoc8zaDO0rn9YyN6wMAmzJ9JD3S5MAPSn+cbZoYhIT0b7U
         foA0lLvLErp3MXgeidEiG13IJZWWUcINSRyHc6q8kXALRn+NpVFGPnqHjlnAE69PhlKG
         wR9g==
X-Gm-Message-State: AOJu0YxLllmwH4Dpd9JF+R+aFVB17AlLDnr6JX0v9B2yNWK22K+EHM/M
	3kKu9cCkSGhE6aEqJdR25jIYbfCAvl1sJwnMREtw1PkCnMaiDwA0ZMrcfjIb6Y8=
X-Google-Smtp-Source: AGHT+IEFDsSF3CwrXTOTPwxVSOjHo5dstCQG8F8UckQtxdryWfCT1RlkJaUAVKC/9U+MtEt2G5CwQQ==
X-Received: by 2002:a05:600c:3504:b0:416:bc6d:e8bb with SMTP id h4-20020a05600c350400b00416bc6de8bbmr45151wmq.0.1712675654118;
        Tue, 09 Apr 2024 08:14:14 -0700 (PDT)
Date: Tue, 9 Apr 2024 16:14:12 +0100
From: Anthony PERARD <anthony.perard@cloud.com>
To: leigh@solinno.co.uk
Cc: xen-devel@lists.xenproject.org, andrew.cooper3@citrix.com,
	slack@rabbit.lu
Subject: Re: [PATCH v2 4/6] tools/misc: xenwatchdogd: add parse_secs()
Message-ID: <3af3ed44-575c-47b7-9ef7-76be6e9889c0@perard>
References: <20240329111056.6118-1-leigh@solinno.co.uk>
 <20240329111056.6118-5-leigh@solinno.co.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240329111056.6118-5-leigh@solinno.co.uk>

On Fri, Mar 29, 2024 at 11:10:54AM +0000, leigh@solinno.co.uk wrote:
> diff --git a/tools/misc/xenwatchdogd.c b/tools/misc/xenwatchdogd.c
> index 2e7f9f51c5..19ec4c5359 100644
> --- a/tools/misc/xenwatchdogd.c
> +++ b/tools/misc/xenwatchdogd.c
> @@ -49,6 +49,18 @@ static void catch_usr1(int sig)
>      done = true;
>  }
>  
> +static int parse_secs(const char *arg, const char *what)
> +{
> +    char *endptr;
> +    unsigned long val;
> +
> +    val = strtoul(arg, &endptr, 0);
> +    if (val > INT_MAX || *endptr != 0)

nit: '\0' would be more accurate       ^ here.
Otherwise, just `*endptr` without "!= 0" would work too.
But comparing a char to a digit feels wrong.

> +	errx(EXIT_FAILURE, "invalid %s: '%s'", what, arg);
> +
> +    return val;
> +}
> +
>  int main(int argc, char **argv)
>  {
>      int id;
> @@ -64,16 +76,11 @@ int main(int argc, char **argv)
>      if (h == NULL)
>  	err(EXIT_FAILURE, "xc_interface_open");
>  
> -    t = strtoul(argv[1], NULL, 0);
> -    if (t == ULONG_MAX)
> -	err(EXIT_FAILURE, "strtoul");
> +    t = parse_secs(argv[optind], "timeout");
>  
>      s = t / 2;
> -    if (argc == 3) {
> -	s = strtoul(argv[2], NULL, 0);
> -	if (s == ULONG_MAX)
> -	    err(EXIT_FAILURE, "strtoul");
> -    }
> +    if (argc == 3)
> +	s = parse_secs(argv[optind], "sleep");

This is parsing the wrong value here, should it be +1 to parse the sleep
argument instead of the timeout argument a second time.

Also, are you sure you want to start using "optind" here? It's a
variable used by getopt(), but we don't use it yet. It almost feel like
"optind" happen to be set to 1 by luck.


Thanks,

-- 
Anthony PERARD

