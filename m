Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 78B8E7DB934
	for <lists+xen-devel@lfdr.de>; Mon, 30 Oct 2023 12:43:24 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.625062.973932 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qxQfY-0000xA-I7; Mon, 30 Oct 2023 11:42:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 625062.973932; Mon, 30 Oct 2023 11:42:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qxQfY-0000vB-FU; Mon, 30 Oct 2023 11:42:56 +0000
Received: by outflank-mailman (input) for mailman id 625062;
 Mon, 30 Oct 2023 11:42:55 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=3VkP=GM=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1qxQfX-0000v5-1L
 for xen-devel@lists.xenproject.org; Mon, 30 Oct 2023 11:42:55 +0000
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com
 [2a00:1450:4864:20::62b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 76549aa5-7719-11ee-98d6-6d05b1d4d9a1;
 Mon, 30 Oct 2023 12:42:53 +0100 (CET)
Received: by mail-ej1-x62b.google.com with SMTP id
 a640c23a62f3a-9a58dbd5daeso666241666b.2
 for <xen-devel@lists.xenproject.org>; Mon, 30 Oct 2023 04:42:53 -0700 (PDT)
Received: from localhost ([213.195.118.109]) by smtp.gmail.com with ESMTPSA id
 n11-20020a170906b30b00b0099bcdfff7cbsm5767682ejz.160.2023.10.30.04.42.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 Oct 2023 04:42:53 -0700 (PDT)
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
X-Inumbo-ID: 76549aa5-7719-11ee-98d6-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1698666173; x=1699270973; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=5nMxB3pbQgBPe8juaICqu1T0NsV8DywdYSg4UfNXx0s=;
        b=EQ52sjImeDnpI33I/ot9Bo9f/1Nbgya25J2VBg/+QKB/CqN+AKagXAod943CLaZFK5
         2Lt0YN1I5zlTs1Fxo2BeAQM/Pe2pMUqa7OfejsFJXIMe9AtPFHG0SWgjgq1SJOb/BzDF
         i3WP+DxhvAqJz7OHtbuSQcHI1lXwX25OUiego=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698666173; x=1699270973;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5nMxB3pbQgBPe8juaICqu1T0NsV8DywdYSg4UfNXx0s=;
        b=djMO3P8DUKp1iUjK4uVq4suH0EK5AWT2rmMht25O6GIOAaueoygE6d6Ad/3BtIedgM
         y0Bcu9/9/DnnuWAb47EMO56AxKI74i4PzTJyG/Akh6KIwN+StoRBJj5S5mwMspcq4mIK
         Va01gmWv3wmEKK6T44nPo0uM6i0Cq8MFlftcdNIbau7htOiidXwmTGyyzp4YsBP0MdkF
         iQl4l8N/sjgqZ6LC9jHX7gbhNYVkNAFAZ25LrlDuXQPHFtWhYC2g0JI240pJrz1tnC+Z
         e86EFOvhSUCkBZ9+RmS+U/HFlHCtCrTmq8ZXDJ7LWrpWElGfsgkySy7UYdr9oCa8vdOM
         kSug==
X-Gm-Message-State: AOJu0Yyy0hTO4TSoFLClOs45Fqhp8KlRrh8eNOY9NxWly4KYwV7516TI
	hqFdb7alrupZoLDBP0fy5w5EJQ==
X-Google-Smtp-Source: AGHT+IGU6RyWHS4LYCT4Z1yUWWk2LPXTAQUepWVcaox7vvaz9bL41J4JTPL86zLpm75X/Zi8rW+tBQ==
X-Received: by 2002:a17:907:3fa2:b0:9c6:1143:b73 with SMTP id hr34-20020a1709073fa200b009c611430b73mr8156864ejc.51.1698666173506;
        Mon, 30 Oct 2023 04:42:53 -0700 (PDT)
Date: Mon, 30 Oct 2023 12:42:52 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
Cc: xen-devel@lists.xenproject.org, Doug Goldstein <cardoe@cardoe.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH] automation: fix race condition in adl-suspend test
Message-ID: <ZT-WvAye6OlWGLAx@macbook>
References: <20231028033404.262729-1-marmarek@invisiblethingslab.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20231028033404.262729-1-marmarek@invisiblethingslab.com>

On Sat, Oct 28, 2023 at 05:33:57AM +0200, Marek Marczykowski-Górecki wrote:
> If system suspends too quickly, the message for the test controller to
> wake up the system may be not sent to the console before suspending.
> This will cause the test to timeout.
> 
> Fix this by waiting a bit after printing the message. The test
> controller then resumes the system 30s after the message, so as long as
> the delay + suspending takes less time it is okay.
> 
> Signed-off-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
> ---
> This is consistent with the observation that sync_console "fixes" the
> issue.
> ---
>  automation/scripts/qubes-x86-64.sh | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/automation/scripts/qubes-x86-64.sh b/automation/scripts/qubes-x86-64.sh
> index 26131b082671..a34db96e4585 100755
> --- a/automation/scripts/qubes-x86-64.sh
> +++ b/automation/scripts/qubes-x86-64.sh
> @@ -54,11 +54,11 @@ until grep 'domU started' /var/log/xen/console/guest-domU.log; do
>      sleep 1
>  done
>  echo \"${wait_and_wakeup}\"
> +# let the above message flow to console, then suspend
> +sleep 5

Could you use `sync /dev/stdout`?  I guess that might not be enough,
since the sync won't be propagated to the hypervisor, and hence even
if flushed from Linux, we have no guarantee that the hypervisor has
also flushed it.

Xen should flush the buffer when a newline character is found, but I
have no idea whether context could return to guest while the buffer is
still in the process of being fully flushed.

Anyway, adding the extra sync might be good regardless, and keeping
the sleep.

Thanks, Roger.

