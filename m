Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8430434A2A7
	for <lists+xen-devel@lfdr.de>; Fri, 26 Mar 2021 08:44:37 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.101603.194464 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lPh81-0006dA-Lt; Fri, 26 Mar 2021 07:43:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 101603.194464; Fri, 26 Mar 2021 07:43:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lPh81-0006cl-In; Fri, 26 Mar 2021 07:43:33 +0000
Received: by outflank-mailman (input) for mailman id 101603;
 Fri, 26 Mar 2021 07:43:31 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=G2QT=IY=gmail.com=xadimgnik@srs-us1.protection.inumbo.net>)
 id 1lPh7z-0006cg-K2
 for xen-devel@lists.xenproject.org; Fri, 26 Mar 2021 07:43:31 +0000
Received: from mail-wr1-x433.google.com (unknown [2a00:1450:4864:20::433])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 051dd2b8-15b7-497b-802a-17b56823802d;
 Fri, 26 Mar 2021 07:43:30 +0000 (UTC)
Received: by mail-wr1-x433.google.com with SMTP id b9so4641181wrt.8
 for <xen-devel@lists.xenproject.org>; Fri, 26 Mar 2021 00:43:30 -0700 (PDT)
Received: from ?IPv6:2a00:23c5:5785:9a01:ad9a:ab78:5748:a7ec?
 ([2a00:23c5:5785:9a01:ad9a:ab78:5748:a7ec])
 by smtp.gmail.com with ESMTPSA id m132sm9557446wmf.45.2021.03.26.00.43.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 26 Mar 2021 00:43:29 -0700 (PDT)
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
X-Inumbo-ID: 051dd2b8-15b7-497b-802a-17b56823802d
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:reply-to:subject:to:cc:references:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=a17A+5+yJKiMuJiUq2dSyBoMg4TOq3jQE/Z9xINTJ5c=;
        b=Z9HbSvXlUmvTMwkRBUIEfiRT3Z+BtZ9AU9gcK3+P8yf3TIWRavmPdtkX7ms8kRTQt6
         EdJXAOIWuMCjB2Mt443pDKyzavdYhUvIUiUzQWtmLXLZfYL4GXxGJqJwlEOzlo5OdWiS
         LZSUsVqih8h97I/lc2ygcaTumxG44dOYTdSD05m4uL1XpL/TErnmlI5QovPeZBJ9sjUi
         qnbjGieW81X8T4pr1tr24jBCN57xGKs9pqXH1wL4w1gbc9cB5rWNzwiNum6xGKGBSW56
         ZulRGDgkDrzNmRrHJl+gksHQJMxyp/Z6A4nXN4F2Icv5JilShlUwbeIPWqomhnM5v3ea
         F39A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:reply-to:subject:to:cc:references
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=a17A+5+yJKiMuJiUq2dSyBoMg4TOq3jQE/Z9xINTJ5c=;
        b=oaEy4qGEaVCpm3J/HqaB4oK49iLYWzKJOfvHtSlMzMeQ5QGN6AOqc4ifLVlDfv+hpY
         G9jP1GjEQBQXta5rvj0S15pYE/qed0GC+KbV9NkmoP7OhGgq/7TqcwRPUR42CzhNyBgS
         VpNhiULAKqKn2FC0CRevGx1b5HV0OQ0Zwvag2fSS74ydpoBZC9R1Z9VhPSid4BDqVKL/
         SWYXI7OfQ2g1967qMQze+xxWp1pbI5APMXbV2APU80drIzCJplVWV4BvIQ374+ykCQMe
         SRb1FQfLBTV7VnWswITL+IutVE3OA2Zp3wHcUxu5433lcm6ftBOomcVONR/Jzq0mmddB
         nk3g==
X-Gm-Message-State: AOAM533x1mk34oR0F6x8kkBQsVV4ZA6VLKT4XFhYKHk2BO6xzYVmkljm
	AJ3bIjJpzgImcLGUKdEAzSM=
X-Google-Smtp-Source: ABdhPJynFxHqBTILtp3MqD9HFuI4ni+e6LRTD0zM+pdMLFUmDbKsC8epdf8vejqPYqLi6UiwUVwyVA==
X-Received: by 2002:adf:f150:: with SMTP id y16mr13054929wro.414.1616744609693;
        Fri, 26 Mar 2021 00:43:29 -0700 (PDT)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: Paul Durrant <paul@xen.org>
Reply-To: paul@xen.org
Subject: Re: [PATCH for-4.15?] docs/misc: xenstored: Re-instate and tweak the
 documentation for XS_RESUME
To: Julien Grall <julien@xen.org>, xen-devel@lists.xenproject.org
Cc: Julien Grall <jgrall@amazon.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Jan Beulich <jbeulich@suse.com>, Stefano Stabellini
 <sstabellini@kernel.org>, Wei Liu <wl@xen.org>, raphning@gmail.com,
 jgross@suse.com
References: <20210325180607.13158-1-julien@xen.org>
Message-ID: <bce11b46-bd54-9af7-81d0-b3c9038b8c19@xen.org>
Date: Fri, 26 Mar 2021 07:43:27 +0000
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210325180607.13158-1-julien@xen.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 25/03/2021 18:06, Julien Grall wrote:
> From: Julien Grall <jgrall@amazon.com>
> 
> Commit 13dd372834a4 removed the documentation for XS_RESUME, however
> this command is still implemented (at least in C Xenstored) and used by
> libxl when resuming a domain.
> 
> So re-instate the documentation for the XS_RESUME. Take the opportunity
> to update it as there is a user of the command.
> 
> Fixes: 13dd372834a4 ("docs/designs: re-work the xenstore migration document...")
> Signed-off-by: Julien Grall <jgrall@amazon.com>
> 
> ---
> 
> Cc: raphning@gmail.com
> Cc: jgross@suse.com
> Cc: paul@xen.org

Reviewed-by: Paul Durrant <paul@xen.org>

> 
> Ian, would you still consider documentation update for 4.15?
> 
> I looked at the implementation of domain_resume() in Xen, it doesn't
> look like we can get away with XS_RESUME because Xen will not send
> VIRQ_DOM_EXC on resume.
> ---
>   docs/misc/xenstore.txt | 16 ++++++++++++++++
>   1 file changed, 16 insertions(+)
> 
> diff --git a/docs/misc/xenstore.txt b/docs/misc/xenstore.txt
> index 148074233001..334dc8b6fdf5 100644
> --- a/docs/misc/xenstore.txt
> +++ b/docs/misc/xenstore.txt
> @@ -294,6 +294,22 @@ IS_DOMAIN_INTRODUCED	<domid>|		T| or F|
>   	ie, if INTRODUCE for the domain has not yet been followed by
>   	domain destruction or explicit RELEASE.
>   
> +RESUME			<domid>|
> +
> +	Arranges that @releaseDomain events will once more be
> +	generated when the domain becomes shut down.  This might have
> +	to be used if a domain were to be shut down (generating one
> +	@releaseDomain) and then subsequently restarted, since the
> +	state-sensitive algorithm in xenstored will not otherwise send
> +	further watch event notifications if the domain were to be
> +	shut down again.
> +
> +	This command will be issued in place such as resume because
> +	Xen will "shutdown" the domain on suspend.
> +
> +	xenstored prevents the use of RESUME other than by dom0.
> +
> +
>   SET_TARGET		<domid>|<tdomid>|
>   	Notifies xenstored that domain <domid> is targeting domain
>   	<tdomid>. This grants domain <domid> full access to paths
> 


