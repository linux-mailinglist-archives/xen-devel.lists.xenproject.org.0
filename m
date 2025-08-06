Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A06AB1C487
	for <lists+xen-devel@lfdr.de>; Wed,  6 Aug 2025 12:48:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1071606.1435032 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ujbge-0004kT-Ia; Wed, 06 Aug 2025 10:48:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1071606.1435032; Wed, 06 Aug 2025 10:48:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ujbge-0004iN-Fa; Wed, 06 Aug 2025 10:48:00 +0000
Received: by outflank-mailman (input) for mailman id 1071606;
 Wed, 06 Aug 2025 10:47:59 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=kasG=2S=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1ujbgc-0004iF-VI
 for xen-devel@lists.xenproject.org; Wed, 06 Aug 2025 10:47:58 +0000
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [2a00:1450:4864:20::330])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d07636c4-72b2-11f0-a322-13f23c93f187;
 Wed, 06 Aug 2025 12:47:57 +0200 (CEST)
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-458b49c98a7so31729745e9.1
 for <xen-devel@lists.xenproject.org>; Wed, 06 Aug 2025 03:47:58 -0700 (PDT)
Received: from localhost (112.pool92-178-7.dynamic.orange.es. [92.178.7.112])
 by smtp.gmail.com with UTF8SMTPSA id
 5b1f17b1804b1-459e5887b7fsm42153925e9.30.2025.08.06.03.47.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Aug 2025 03:47:56 -0700 (PDT)
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
X-Inumbo-ID: d07636c4-72b2-11f0-a322-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1754477277; x=1755082077; darn=lists.xenproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=kf5pgCVN5jPLE1G0eb2TRa3nZG3xWz4Hz3vRLpntyGM=;
        b=D70owyZ8c0OEm+VqV5vhLygFi9D3p/TanN0EAz3tBSJls7heHCAZ7EWKBBSLlUseK0
         MnTLJcykajM6ElzMuBmts+dWQAkv5iW2oozd3ay+BZ5mhgyZT2CJC32vUsFcPR57OOs+
         PUg8ZJXfl/c8R+U7CxRwpnovoJUURg32K3PQ0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754477277; x=1755082077;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kf5pgCVN5jPLE1G0eb2TRa3nZG3xWz4Hz3vRLpntyGM=;
        b=KJW3mGhjLQOPUIvOgn7yl9s1H1fTsfgutkYAjnqoaSyad/WfF0c5QX4Sq/STQqfJhw
         q3fDMtKA/fp6GhOjMgO8s3INUlSY4SSZ/2Q4fgbo2pjhyw07StoumIgqn4V4ZfFKPOFq
         aiACin0tyP4co2AGmaIyNT0/btKWaDD67Mn6K7BPAbKf/2clTqvmtdqzLUEzvMRdF4Dz
         KKSO/6gSuP2fA6mMC1AvcrYKY6CbHKLybUMF1j27RmwwCtcoaaDIyj/cqx3NCMxalrX+
         r0i7qUuUd7HTJKANwovYUxIt1VrH8thsUzObTUFXdrbhXY1BLP0QpUzbfOsx919BGYe/
         ULXQ==
X-Gm-Message-State: AOJu0YxYya7ETKORgT9wrdq53d/mT2Rpg1gtBFhPo6RJDUu/973ar8y8
	OuwJYkj9zGLxqOgZ7PP2ps9TG04jBMd5VOFAv+AQ1yxhY2Ze5Zw9QrYpTs2YoLYKGog=
X-Gm-Gg: ASbGncvo5XIR0cP3enU5oItEeZKFNK2beY6g3M77+27YOKJrxrNG1gDmppOEy2UMxgP
	TrVq/iI2xPVvKQrFTjCveyjhd5DQ5MM9G/zib4F/1qXdTdDHv3hmjyvB834h9Ywu7gSJvGmz5Lt
	Rw6mwwkL/4n4YPP6C4IPiHOfLqOxplZmxYrj+jSRegFUQ66u4QngusVcyTf01sSuiynulj/FjBo
	moFLcEnSPoRe3lUQtGxXRWSbXd9v6myEb6wCiVj0GD7MKdXEaS5bIoKtzP8B7Fp38XyIHi/3Q/n
	j+52/nATSMn4u7Stu9OPjYphvwHg1+6fL8uDSzkA4sHXEQk/tZEFNsSjhD5cxW34hWLp6YRDGrH
	egsldQJmshB/CK0eojKd7CanSgLE5gPEG/hHp0hDV3tCGI70DXikw0SW8I/QcyymAWg==
X-Google-Smtp-Source: AGHT+IFQ6/THYXInIDZ4Tr0/VubQJxNWCOvWahc34YnbYIL9nxi7nTWvwIczqpueaNWXp32DEEwrlw==
X-Received: by 2002:a05:6000:2204:b0:3b7:9d83:50ef with SMTP id ffacd0b85a97d-3b8f420f03bmr2082001f8f.55.1754477277242;
        Wed, 06 Aug 2025 03:47:57 -0700 (PDT)
Date: Wed, 6 Aug 2025 12:47:56 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: dmkhn@proton.me
Cc: xen-devel@lists.xenproject.org, andrew.cooper3@citrix.com,
	anthony.perard@vates.tech, jbeulich@suse.com, julien@xen.org,
	michal.orzel@amd.com, sstabellini@kernel.org, dmukhin@ford.com
Subject: Re: [PATCH] ns16550: ensure polling timer is disarmed
Message-ID: <aJMy3KBPy7tjjYj3@macbook.local>
References: <20250730031249.1613142-1-dmukhin@ford.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250730031249.1613142-1-dmukhin@ford.com>

On Wed, Jul 30, 2025 at 03:13:31AM +0000, dmkhn@proton.me wrote:
> From: Denis Mukhin <dmukhin@ford.com> 
> 
> As it stands, polling timer is kept in the list of timers even after the
> interrupts have been enabled / polling disabled on ns16550-compatible UART.
> 
> Ensure polling timer is removed from the timer list once UART interrupts are
> enabled.
> 
> Signed-off-by: Denis Mukhin <dmukhin@ford.com>
> ---
>  xen/drivers/char/ns16550.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/xen/drivers/char/ns16550.c b/xen/drivers/char/ns16550.c
> index df7fff7f81df..299773d80065 100644
> --- a/xen/drivers/char/ns16550.c
> +++ b/xen/drivers/char/ns16550.c
> @@ -191,6 +191,10 @@ static void cf_check ns16550_interrupt(int irq, void *dev_id)
>      struct serial_port *port = dev_id;
>      struct ns16550 *uart = port->uart;
>  
> +    /* Ensure polling timer is disarmed and removed from the timer list. */
> +    if ( !uart->intr_works )
> +        kill_timer(&uart->timer);

I think if anything you should issue a stop_timer() call, but not a
kill_timer() one, otherwise the uart code will hit an ASSERT when
calling set_timer() from ns16550_setup_postirq()? (that's from
_ns16550_resume()).

Thanks, Roger.

