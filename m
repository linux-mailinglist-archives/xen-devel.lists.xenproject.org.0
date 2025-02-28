Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0461EA49B32
	for <lists+xen-devel@lfdr.de>; Fri, 28 Feb 2025 15:02:33 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.898756.1307261 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1to0wO-0006qz-Rn; Fri, 28 Feb 2025 14:02:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 898756.1307261; Fri, 28 Feb 2025 14:02:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1to0wO-0006oz-O6; Fri, 28 Feb 2025 14:02:12 +0000
Received: by outflank-mailman (input) for mailman id 898756;
 Fri, 28 Feb 2025 14:02:11 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=zu1c=VT=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1to0wM-0006ot-Vm
 for xen-devel@lists.xenproject.org; Fri, 28 Feb 2025 14:02:10 +0000
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com
 [2a00:1450:4864:20::534])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9994943f-f5dc-11ef-9898-31a8f345e629;
 Fri, 28 Feb 2025 15:02:09 +0100 (CET)
Received: by mail-ed1-x534.google.com with SMTP id
 4fb4d7f45d1cf-5deb956aa5eso3235801a12.2
 for <xen-devel@lists.xenproject.org>; Fri, 28 Feb 2025 06:02:09 -0800 (PST)
Received: from localhost ([84.78.159.3]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5e4c3b6dac5sm2539801a12.19.2025.02.28.06.02.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Feb 2025 06:02:06 -0800 (PST)
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
X-Inumbo-ID: 9994943f-f5dc-11ef-9898-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1740751328; x=1741356128; darn=lists.xenproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=NcqCNL+1TebMms+1j8ZG3rVAN9DW2Io8OYmrAVOD4ZQ=;
        b=COav2awa8/0Lta5Bn5XJFg8AmFkkyQORkpBItaD8CCCFMMNoLjTpF1cXVpykt+CItM
         ZOnzfJQ5JOAMSt6YvBHL33CreH1W4YGfbPmEn9eIJq5X0BskyzPfE9L++WyO/Qlhk5Lm
         8rYceyD6lV+bwd0gz2t9zsc+vTRxn39ZezgTs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740751328; x=1741356128;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NcqCNL+1TebMms+1j8ZG3rVAN9DW2Io8OYmrAVOD4ZQ=;
        b=aLe7trL77/DDqN/jd3sTLHG67Is3vrdRP69eKnorwdFzInBVYA0bYww28Fd6AdeXl3
         Is2kbzvBgfiNTeXx0d7potKEhR6LE2EZXQBOzCcmBZTqVLfN5le1R5fwYb/IDUrJPu4u
         hr/tiWCUZM7YKoF+Hd8Vq5v0z4WqOGtyVX5ugbdhuFlay9R8Tk3coSJ5SMKbbVWv/ZjV
         tCqbc3d40/Wn9yWXwP2fw9gEZMfwU60shP3upOXr4vi4J3AJqj0Odge8TOxcmZsoygyx
         LGt+25KHWeb1FEX4lG9/ilnz1f7PY9JsU+Rmr5I6WVsVffA08kqlcC4F+ve+KbLY0ZfW
         7D+w==
X-Gm-Message-State: AOJu0Yy1QJI+FClCKTIQ9MaL+XMsfyDA/q+xbvifAyRUQiQEhTQH13Am
	0PvE3pieGKHn6fPs7aDqHhfDPAxBNYNxRPH2vzXkQuFshYsw4f4vlQAthmYl2HRUT1VLj4nReqI
	g
X-Gm-Gg: ASbGncv9YZJh4XIjHD8WOa2vABk6DdaleKHP2VRORcSzf36S4rYgHhQVwACSV5kjKKS
	KkhTDzb84ut29kZW7uKceaWoPY4OOmExaER2iNddp/U66mLsqKjWRi4UdJya6/IW5Y5OG8vYqSm
	XFpP1pYdkVxT9+KXLNhpe+uSCKNcMv6JjEcMJvMno/vGQ+XK0GY9lN3VCwKG5JZJNnjrEWwClDe
	MEXdT4ERnqxwqPdMRG/+NtLsY1WuWZLuSOM+57YPlZ/M5mlY5lnXgYtXXijW/BgVbJG9iYRwJy0
	G5FAki8EfJJzdTmtThmdyXuIecMC3HU=
X-Google-Smtp-Source: AGHT+IE5zRfv8HSymkcbSvlw+XDeSPW9q2zn1s1iBV9+q9LCaDc4QbWQc4DwypSQsHzonh7k2cPtfw==
X-Received: by 2002:a05:6402:1d4d:b0:5dc:796f:fc86 with SMTP id 4fb4d7f45d1cf-5e4d6af436amr7286024a12.16.1740751327413;
        Fri, 28 Feb 2025 06:02:07 -0800 (PST)
Date: Fri, 28 Feb 2025 15:02:05 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jason Andryuk <jason.andryuk@amd.com>
Cc: xen-devel@lists.xenproject.org, Jiqian Chen <Jiqian.Chen@amd.com>,
	Huang Rui <ray.huang@amd.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH 1/2] tools/ctrl: Silence missing GSI in
 xc_pcidev_get_gsi()
Message-ID: <Z8HB3bTQAhQrFhbp@macbook.local>
References: <20250226201022.42447-1-jason.andryuk@amd.com>
 <20250226201022.42447-2-jason.andryuk@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250226201022.42447-2-jason.andryuk@amd.com>

On Wed, Feb 26, 2025 at 03:10:21PM -0500, Jason Andryuk wrote:
> It is valid for a PCI device to not have a legacy IRQ.  In that case, do
> not print an error to keep the lgs clean.
> 
> This relies on pciback being updated to return -ENOENT for a missing
> GSI.
> 
> Fixes: b93e5981d258 ("tools: Add new function to get gsi from dev")
> Signed-off-by: Jason Andryuk <jason.andryuk@amd.com>
> ---
>  tools/libs/ctrl/xc_linux.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/tools/libs/ctrl/xc_linux.c b/tools/libs/ctrl/xc_linux.c
> index 92591e49a1..c18f09392f 100644
> --- a/tools/libs/ctrl/xc_linux.c
> +++ b/tools/libs/ctrl/xc_linux.c
> @@ -78,7 +78,8 @@ int xc_pcidev_get_gsi(xc_interface *xch, uint32_t sbdf)
>                  IOCTL_PRIVCMD_PCIDEV_GET_GSI, &dev_gsi);
>  
>      if (ret < 0) {
> -        PERROR("Failed to get gsi from dev");
> +        if (errno != ENOENT)
> +            PERROR("Failed to get gsi from dev");

While here, could you maybe print the S:B:D:F as part of the error
message? (seeing as it's a function parameter).

Thanks, Roger.

