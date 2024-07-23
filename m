Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 58EEC939DF6
	for <lists+xen-devel@lfdr.de>; Tue, 23 Jul 2024 11:33:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.762900.1173133 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sWBtg-0006ZL-IP; Tue, 23 Jul 2024 09:33:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 762900.1173133; Tue, 23 Jul 2024 09:33:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sWBtg-0006Wh-Dc; Tue, 23 Jul 2024 09:33:28 +0000
Received: by outflank-mailman (input) for mailman id 762900;
 Tue, 23 Jul 2024 09:33:26 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=BZ+O=OX=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1sWBte-0006WU-BU
 for xen-devel@lists.xenproject.org; Tue, 23 Jul 2024 09:33:26 +0000
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com
 [2a00:1450:4864:20::22c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9bb2a758-48d6-11ef-8776-851b0ebba9a2;
 Tue, 23 Jul 2024 11:33:24 +0200 (CEST)
Received: by mail-lj1-x22c.google.com with SMTP id
 38308e7fff4ca-2eeec60a324so68204971fa.2
 for <xen-devel@lists.xenproject.org>; Tue, 23 Jul 2024 02:33:24 -0700 (PDT)
Received: from ?IPV6:2003:e5:8729:4000:29eb:6d9d:3214:39d2?
 (p200300e58729400029eb6d9d321439d2.dip0.t-ipconnect.de.
 [2003:e5:8729:4000:29eb:6d9d:3214:39d2])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a7aa309243esm13867066b.151.2024.07.23.02.33.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 23 Jul 2024 02:33:23 -0700 (PDT)
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
X-Inumbo-ID: 9bb2a758-48d6-11ef-8776-851b0ebba9a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1721727204; x=1722332004; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=R+zEoWWeWJvbrJUrkEFc8Z4N5GueeVB4Q31zrWykAPY=;
        b=ZnESTzd7f5pGBxlIanOFRTUTkETeMA27i4CA9oFOY1Q5FoTcDrZ7wm4Si+hdffmA/T
         cewxh23egPGyMe1y3r3UOdGOxnA/XFSe9PkOSggowcPXNrcihvNXTtIbKU5kl9keeGgv
         pdkAVUkA4Qr91TstHS9v2BR/5i5KVL+9D/LyzPJqMilpaHX1RMnQ/DYiivmmTrVRb0s7
         BvD5YNeLrZX9YNuxQ6t5hPeW8VP8du/bAejVO3KdO8I/vWKueddhpAEu61rNaelqecqb
         YLO3uhvI0KmrYLgVkSGDDtYKkgQRtM0uIObewQz2Xd9fqNl5FSL490P36rY9oiJ2aJAY
         Wkbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721727204; x=1722332004;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=R+zEoWWeWJvbrJUrkEFc8Z4N5GueeVB4Q31zrWykAPY=;
        b=kkVtCq3/5dX7uw6xglGlIoQ9BLtuKtqEpXSA5LRR2FyzUbm+4qIavmjlh65Sy2wG8/
         /TFkL/R6BHjKyesOsvlHZuD716PjzjvJUo99hTxcuzK8vy2IJACixKp9+08l5nPp0AyS
         3+AZ1iqGtc/iPcngqZ/PT2vA3RtSNBB1tMaEF5BvZ08A+m3h/ry28jPulHehoBDeUWMz
         01J36QV/tGOs3RqpE8n7yNTJcjFAxxrSvO1Q9Jk+W310Nk99i2wL0y6eHawfSIAcLDhh
         AXvsU9Psv7ZPzVpXOxySRIN5liad0bmhZnNSRbd0/1ndubYVRRayXNgbJ8nKV0xL1LEu
         S09Q==
X-Forwarded-Encrypted: i=1; AJvYcCWnz1cHh1iL4Ka3ZMKYqFWHsvLR6XMb3VZEAIi6v11cGkRgK1X6rtILlWhxcHmRBUEkOSgOfy6hVxkdhAvwZpOZcRaTcvDz38KVNSZb5LA=
X-Gm-Message-State: AOJu0YzyEW0ffJzvOMOyDz2DEReWTGESsdIf2UkfjS06lfc8hbdz9Ioo
	E0jygunNuH4vtq6laeJWFbTaAn/epAGEDQzIeeKHEGw3+jCVvoVt3+RTowkbR1w=
X-Google-Smtp-Source: AGHT+IGFy1qp2Pyl/L+9SOzj92owp98C73nk/p9nx6uOqCkYna3b6X03t6g83XoH7IEOqCMvhM7fSw==
X-Received: by 2002:a2e:9e01:0:b0:2ef:2d3a:e700 with SMTP id 38308e7fff4ca-2ef2d3ae865mr51998561fa.18.1721727203872;
        Tue, 23 Jul 2024 02:33:23 -0700 (PDT)
Message-ID: <8cbe6c8c-1401-4661-9319-e174ffce7461@suse.com>
Date: Tue, 23 Jul 2024 11:33:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/6] tools/libxs: Track whether we're using a socket or
 file
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
Cc: Anthony PERARD <anthony.perard@vates.tech>
References: <20240718164842.3650702-1-andrew.cooper3@citrix.com>
 <20240718164842.3650702-5-andrew.cooper3@citrix.com>
Content-Language: en-US
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
In-Reply-To: <20240718164842.3650702-5-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 18.07.24 18:48, Andrew Cooper wrote:
> It will determine whether to use writev() or sendmsg().
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> ---
> CC: Anthony PERARD <anthony.perard@vates.tech>
> CC: Juergen Gross <jgross@suse.com>
> ---
>   tools/libs/store/xs.c | 5 +++++
>   1 file changed, 5 insertions(+)
> 
> diff --git a/tools/libs/store/xs.c b/tools/libs/store/xs.c
> index 96ea2b192924..f4edeb05f03b 100644
> --- a/tools/libs/store/xs.c
> +++ b/tools/libs/store/xs.c
> @@ -65,6 +65,9 @@ struct xs_stored_msg {
>   struct xs_handle {
>   	/* Communications channel to xenstore daemon. */
>   	int fd;
> +
> +	bool is_socket; /* is @fd a file or socket? */
> +
>   	Xentoolcore__Active_Handle tc_ah; /* for restrict */
>   
>   	/*
> @@ -305,6 +308,8 @@ static struct xs_handle *get_handle(const char *connect_to)
>   	if (h->fd == -1)
>   		goto err;
>   
> +	h->is_socket = S_ISSOCK(buf.st_mode);
> +
>   	XEN_TAILQ_INIT(&h->reply_list);
>   	XEN_TAILQ_INIT(&h->watch_list);
>   

I'd prefer to set h->is_socket above the current

     if (S_ISSOCK(buf.st_mode))

and then use h->is_socket in this if instead.

With that:

Reviewed-by: Juergen Gross <jgross@suse.com>


Juergen

