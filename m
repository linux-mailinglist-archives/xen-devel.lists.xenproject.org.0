Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 28B919EE3F3
	for <lists+xen-devel@lfdr.de>; Thu, 12 Dec 2024 11:19:01 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.855639.1268489 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tLgHK-0008UQ-8e; Thu, 12 Dec 2024 10:18:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 855639.1268489; Thu, 12 Dec 2024 10:18:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tLgHK-0008Sm-4w; Thu, 12 Dec 2024 10:18:42 +0000
Received: by outflank-mailman (input) for mailman id 855639;
 Thu, 12 Dec 2024 10:18:41 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=kKfJ=TF=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1tLgHJ-0008Sg-02
 for xen-devel@lists.xenproject.org; Thu, 12 Dec 2024 10:18:41 +0000
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com
 [2a00:1450:4864:20::529])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 741d4906-b872-11ef-a0d5-8be0dac302b0;
 Thu, 12 Dec 2024 11:18:40 +0100 (CET)
Received: by mail-ed1-x529.google.com with SMTP id
 4fb4d7f45d1cf-5d3f65844deso655558a12.0
 for <xen-devel@lists.xenproject.org>; Thu, 12 Dec 2024 02:18:38 -0800 (PST)
Received: from localhost ([213.195.123.63]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5d3eb109bc9sm6830953a12.42.2024.12.12.02.18.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 Dec 2024 02:18:37 -0800 (PST)
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
X-Inumbo-ID: 741d4906-b872-11ef-a0d5-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1733998718; x=1734603518; darn=lists.xenproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=PAjh9EwANrCRydhu1/QCA56w6BsZUlaXVNGvSsLPj3w=;
        b=uOFPw9OxVvRPp5mapEv8dgcTQ3ATCeT1oXpiSOBhNyAhE5niTD7/ZZt9hssPv3z64Y
         luh2/a5386gFrg1ij7UWBQ4VnyMSoDjHMdBFoYavpY/6It972sbZpoKUXIp28WIz+nP7
         HxuoXVWPG5JrDy//f6GGX6DNE+mRMTWqNhwGo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733998718; x=1734603518;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PAjh9EwANrCRydhu1/QCA56w6BsZUlaXVNGvSsLPj3w=;
        b=MLqMqukxSflvWYAY1PIXJpJ2Izs2IdPIWqhYylUEknYP4EGG56t/Zmf+CkFk31otgw
         OVhS8uX7PCoVHma4RhQQReSXuIAoD0sdZuJimB+gAtF3i+J9hSM6CAvovpxBeUkGoLWl
         VZZ5LtMYq3T/pf2rltH8F02qmN8kRusx93kBJUHddnIDrT5cquEABWm70KeYS6/ESRpc
         54lQHM9elcYJ/FfoolrQpZfTkog6rFIs54L+Log8TpOM1XjuN7884cKpxsrVoLfOWMQY
         gneCx6bKq6sPse1iFwwGvKrR0N1x3SdIqKnH27a5ePnPHrpKGXRgFg6g0NXZtMzSFKmb
         uIpw==
X-Gm-Message-State: AOJu0YyXOpV1vhQbnItqAZOX9XBiiPiZlOdOxoctZucSuqNgmj2bgYae
	wonye+gvCIIRzRxFJzpS/iiw+i/4/QBhAC1LOKAVcGY8nrfHkASfPtyjPyv8vCo=
X-Gm-Gg: ASbGncuZPmR+IZW5x+DZw0XEQigSYrthcAdf9etXiugyZTH5rQy1bUvam5KbOitcB9n
	LIa7RmG8cUmqZLBmtXUSTezkmrmwzcCzMBUq1yQAdcVrC/bnKRnGvcrAbDeMbiErlIWwItX3V+O
	ZnYbcD+hso9bfpM0eq3o72fAHVfnJB0WXSpYFVUKols0EcPEhwrhtFbJyZWBgUmnJDacJepEFFz
	Fd/kBW5Pmd0hyyLOdCO/FIQ+rr/m8byeXUW6yOLKjW98eByyDC5+vM6DjxeM3pTqQ==
X-Google-Smtp-Source: AGHT+IHRSJEAqOwCFT01xSX3OoG1DDL8YdjrQ8mQzgjpArHOTq4oRaDHvUdUSTGgHo1pplDVb0brTg==
X-Received: by 2002:a05:6402:34cb:b0:5d0:e826:f0da with SMTP id 4fb4d7f45d1cf-5d54765c5e4mr270935a12.16.1733998718089;
        Thu, 12 Dec 2024 02:18:38 -0800 (PST)
Date: Thu, 12 Dec 2024 11:18:36 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: dmukhin@ford.com
Cc: xen-devel@lists.xenproject.org,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH v2 20/35] xen/console: introduce console_owner_domid()
Message-ID: <Z1q4fPHY_0BzvGT6@macbook.local>
References: <20241205-vuart-ns8250-v1-0-e9aa923127eb@ford.com>
 <20241205-vuart-ns8250-v1-20-e9aa923127eb@ford.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241205-vuart-ns8250-v1-20-e9aa923127eb@ford.com>

On Thu, Dec 05, 2024 at 08:41:50PM -0800, Denis Mukhin via B4 Relay wrote:
> From: Denis Mukhin <dmukhin@ford.com>
> 
> console_owner_domid() is introduced to obtain the "console owner" domain ID.
> 
> The call is used in NS8250 emulator to identify the case when physical xen
> console focus is owned by the domain w/ NS8250 emulator, in which case,
> messages from guest OS are formatted w/o '(XEN)' prefix.

Nit: it would be better to not use abbreviations such as w/ or w/o in
commit messages.

> 
> Signed-off-by: Denis Mukhin <dmukhin@ford.com>
> ---
>  xen/drivers/char/console.c | 5 +++++
>  xen/include/xen/console.h  | 1 +
>  2 files changed, 6 insertions(+)
> 
> diff --git a/xen/drivers/char/console.c b/xen/drivers/char/console.c
> index 52cf64dbf6fd18d599cb88835d03501a23b3e3c4..a8ab5c2bcb98e4cadf9ad2c9ad28d297977d0557 100644
> --- a/xen/drivers/char/console.c
> +++ b/xen/drivers/char/console.c
> @@ -498,6 +498,11 @@ struct domain *rcu_lock_domain_console_owner(void)
>      return rcu_lock_domain_console_by_id(console_owner);
>  }
>  
> +domid_t console_owner_domid(void)
> +{
> +    return console_owner;
> +}
> +
>  static bool console_owner_possible(domid_t domid)
>  {
>      struct domain *d;
> diff --git a/xen/include/xen/console.h b/xen/include/xen/console.h
> index 57c482cfbf2da15b011e64841ea086e779f4588d..83be5794aff6630beaad46f910fcc0fc6d833808 100644
> --- a/xen/include/xen/console.h
> +++ b/xen/include/xen/console.h
> @@ -33,6 +33,7 @@ void console_end_log_everything(void);
>  
>  struct domain *rcu_lock_domain_console_owner(void);
>  int console_set_owner(domid_t);
> +domid_t console_owner_domid(void);

I would expect that either the caller already has a domain locked, or
uses rcu_lock_domain_console_owner() to obtain the domain and then get
the domid?  (d->domain_id?)

It's hard to tell why you need such way to get the console input
target domid in such a way without seeing a caller to the function.

Thanks, Roger.

