Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 929959ED336
	for <lists+xen-devel@lfdr.de>; Wed, 11 Dec 2024 18:18:28 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.855053.1268091 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tLQLL-0003ZP-LW; Wed, 11 Dec 2024 17:17:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 855053.1268091; Wed, 11 Dec 2024 17:17:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tLQLL-0003Xw-Io; Wed, 11 Dec 2024 17:17:47 +0000
Received: by outflank-mailman (input) for mailman id 855053;
 Wed, 11 Dec 2024 17:17:46 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=YTIw=TE=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1tLQLK-0003Xq-3W
 for xen-devel@lists.xenproject.org; Wed, 11 Dec 2024 17:17:46 +0000
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com
 [2a00:1450:4864:20::632])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d5b1f341-b7e3-11ef-99a3-01e77a169b0f;
 Wed, 11 Dec 2024 18:17:44 +0100 (CET)
Received: by mail-ej1-x632.google.com with SMTP id
 a640c23a62f3a-a9e8522445dso1394451566b.1
 for <xen-devel@lists.xenproject.org>; Wed, 11 Dec 2024 09:17:44 -0800 (PST)
Received: from localhost ([213.195.123.63]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-aa6810027c6sm544289766b.104.2024.12.11.09.17.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Dec 2024 09:17:43 -0800 (PST)
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
X-Inumbo-ID: d5b1f341-b7e3-11ef-99a3-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1733937464; x=1734542264; darn=lists.xenproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=+oA6uBMeNeBGYQGZMVyk7EeoK1zX0WhrNfAcgKqAqmE=;
        b=K6YG+Yu3iCGBoHmCm6DY9co5NefdXOFz824LHGBhAHAozEkRsD6eQjtY97j1Ah1SwM
         WrWo5k75CXFhX4Yv14cZSTNH8kx87cqCsEN/UUsSNX5WEnvWvmFn7vuIAL5qvQn1wvj2
         KvVKwS7tRFxvCQo0/r97nZhygwPagDDq4XhXY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733937464; x=1734542264;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+oA6uBMeNeBGYQGZMVyk7EeoK1zX0WhrNfAcgKqAqmE=;
        b=B38MiV+/u/9oguucpW/6fe3ODaAch2tFoF+Jx4crFt6AjsHnhaCtgSJSLYaIDYfVVZ
         PCWa+NXch5pvIzjK1YfdOUJxxX4+gY6Y62L896hYPvMTk0PyDQoRpEZsM6S8rgaeET37
         NHccMdTPCWsvPWt9QoCeYNxGNqA334H+C/2GSrBmDLPWERkzOKtY7CWchxjK5XqG5fFQ
         uLXDdpNmOUOKlb2IR6ZwpdLBJEbGbyZScvzwwJBFl/HQI1De3BanuesFcw4ruRQGelDT
         af5Yoi4mldrE0N/efp3TkrUfO8NzQUBUtoTxW+d8eFnpkz+477ZlyYaFHZHucvB4SU6Z
         p2Wg==
X-Gm-Message-State: AOJu0YzJp59z0DKdLt/TxCOrMsz6t2YAjhPbpilTyp6mljcFb09mMwjF
	NbCsgsDBvhqxeXRVcs3GMTqvcKZ0Ho/ppv64DU9sxGUgGBw+NF/yhSnNAod7aEM=
X-Gm-Gg: ASbGnctPs0DzieG7eXZsvOqzQ+s211wiqv4DSCz+cDDiLXJt7rIZOUxyPA+5rTpPYWv
	w0RIVReBj+P+LWH2NybRxDs2iyT+VFf0dY0/gVlwBW0CnXRQjDopjlb3iXSll1hOmuQ2z6bKmto
	L30vs9D+yJKj84Mh5c3KH2BAp7b0pij5dXNVRq71AFqBiqyYuHfK6WBrL/9MbeVbWfnDMqJ/sFW
	B9OfpQN+/fL6vyVD6djvdDfOZZronCSccWfe+pU6+DrT7Et0v4iBphe+aWsYak=
X-Google-Smtp-Source: AGHT+IHdzPanXR0vjr+2wSAdKn+jT972sOb9SSTC3pjHDGvkCpKT7IzX0bK711f5DKnKZ6MtapvtTQ==
X-Received: by 2002:a17:907:8690:b0:aa6:a844:8791 with SMTP id a640c23a62f3a-aa6b1395887mr457554566b.45.1733937463799;
        Wed, 11 Dec 2024 09:17:43 -0800 (PST)
Date: Wed, 11 Dec 2024 18:17:42 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: dmukhin@ford.com
Cc: xen-devel@lists.xenproject.org,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH v2 13/35] xen/console: rename console_input_domain
Message-ID: <Z1nJNqfqAgYd0pJ7@macbook.local>
References: <20241205-vuart-ns8250-v1-0-e9aa923127eb@ford.com>
 <20241205-vuart-ns8250-v1-13-e9aa923127eb@ford.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241205-vuart-ns8250-v1-13-e9aa923127eb@ford.com>

On Thu, Dec 05, 2024 at 08:41:43PM -0800, Denis Mukhin via B4 Relay wrote:
> From: Denis Mukhin <dmukhin@ford.com>
> 
> console_input_domain() takes an RCU lock to protect domain structure.
> That implies call to rcu_unlock_domain() after use.
> 
> Rename console_input_domain() to rcu_lock_domain_console_owner() to
> highlight the need of calling rcu_unlock_domain().
> 
> Signed-off-by: Denis Mukhin <dmukhin@ford.com>
> ---
>  xen/arch/arm/vpl011.c      | 2 +-
>  xen/drivers/char/console.c | 2 +-
>  xen/include/xen/console.h  | 2 +-
>  3 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/xen/arch/arm/vpl011.c b/xen/arch/arm/vpl011.c
> index fe36fe2bd1529a4114884580ded6d6fa55a22f0e..4d682e98553303b4a12f5cd7e5e67ab096cd7cc2 100644
> --- a/xen/arch/arm/vpl011.c
> +++ b/xen/arch/arm/vpl011.c
> @@ -78,7 +78,7 @@ static void vpl011_write_data_xen(struct domain *d, uint8_t data)
>      unsigned long flags;
>      struct vpl011 *vpl011 = &d->arch.vpl011;
>      struct vpl011_xen_backend *intf = vpl011->backend.xen;
> -    struct domain *input = console_input_domain();
> +    struct domain *input = rcu_lock_domain_console_owner();

May I suggest console_get_domain() and then introducing a
console_put_domain() which is just a wrapper around
rcu_unlock_domain()?

Thanks, Roger.

