Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D17A76038F7
	for <lists+xen-devel@lfdr.de>; Wed, 19 Oct 2022 06:54:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.425461.673290 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ol15J-0005Os-Hi; Wed, 19 Oct 2022 04:53:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 425461.673290; Wed, 19 Oct 2022 04:53:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ol15J-0005N3-Dw; Wed, 19 Oct 2022 04:53:41 +0000
Received: by outflank-mailman (input) for mailman id 425461;
 Wed, 19 Oct 2022 04:53:40 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=7E7d=2U=gmail.com=liu.denton@srs-se1.protection.inumbo.net>)
 id 1ol15I-0005Mx-0b
 for xen-devel@lists.xenproject.org; Wed, 19 Oct 2022 04:53:40 +0000
Received: from mail-pj1-x1033.google.com (mail-pj1-x1033.google.com
 [2607:f8b0:4864:20::1033])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id fdfd7d9e-4f69-11ed-8fd0-01056ac49cbb;
 Wed, 19 Oct 2022 06:53:38 +0200 (CEST)
Received: by mail-pj1-x1033.google.com with SMTP id cl1so15929896pjb.1
 for <xen-devel@lists.xenproject.org>; Tue, 18 Oct 2022 21:53:37 -0700 (PDT)
Received: from generichostname (136-25-1-99.cab.webpass.net. [136.25.1.99])
 by smtp.gmail.com with ESMTPSA id
 d7-20020a170902654700b0017c3776634dsm9639571pln.32.2022.10.18.21.53.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Oct 2022 21:53:35 -0700 (PDT)
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
X-Inumbo-ID: fdfd7d9e-4f69-11ed-8fd0-01056ac49cbb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ZbUQNylXhVXKh1s0EJHctv8BE/4Z6ehnPchOqGRN3vo=;
        b=laO575w29tLUZcgzXGqTPpyRHGqXcNcV1nDeKkDbx0zZT+FOua+erEdbJggPJcMUBE
         VfwaE54TEHl/FwseLPL/Wg21zaq8ILuTskT1ZXOrUydwdKh8muuVqAyIfH5KzqdQUvSi
         9zO3AVQ5MPaCk43ccL6XlM6fe87moJ3+RzCTAayEocd2PdBOWscwdxRUpMSuLswFrh/5
         YPfOw4xCZ4wl2I/AtFvz1HR+dKV32SfSaE3O+ogGT86rQxiPWnYHyOuG9tCBqDlRREBD
         9F7FRBtl7l3xtZru5/p13YOCPXOAPS1ZkKwhiLFWFOgqx5gBKrjCYsQsQwtmmUVauIH4
         IQbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZbUQNylXhVXKh1s0EJHctv8BE/4Z6ehnPchOqGRN3vo=;
        b=Mq6kLdm2BqdDKjgvXrhCvwuR4mJHgj2gUuzdMg0RhLKZlzOKSyje/99qs33Wfi955J
         CZ9xZ74F5PDYpsrHtmr33FV5gLI3hkh/OUbaQslg95Tq0y5zQFy+YW2oFCztGzJdFPGK
         HDey2eVD9kJvHC2192Dompp7LbkUwGakGVqPjiDuLbbEQT40HahOIf3X+dOPBzeo4PC3
         9wDffJyj4rDwNyxekCnNx2ucQ6TC7nRw9JWTDDd/npXxyMl1JJEKX8y9K3xjN+yGXbca
         89LDavPUvsH9F3sec6rLYzZRcvlQoJWPC3S70lRdTa/cCNt7VGx5DCOuBKq4o6dG6kdH
         yuHw==
X-Gm-Message-State: ACrzQf1J1+uQuKWsL4+uV5W73xwab2C9TXr6XI5Fg+bLfPeRKixRPION
	IYyCpW3lm1Hv3sNzustPSqA=
X-Google-Smtp-Source: AMsMyM5xG/9NQohjSp3JAsEV138F01V+6/sixxAwGiiyN6nAo2Sw/zQIyzJlQyQ9KBa33R7J9ImThQ==
X-Received: by 2002:a17:902:d2cc:b0:182:d901:5d28 with SMTP id n12-20020a170902d2cc00b00182d9015d28mr6814310plc.142.1666155216361;
        Tue, 18 Oct 2022 21:53:36 -0700 (PDT)
Date: Tue, 18 Oct 2022 21:53:32 -0700
From: Denton Liu <liu.denton@gmail.com>
To: Olaf Hering <olaf@aepfle.de>
Cc: grub-devel@gnu.org, Daniel Kiper <daniel.kiper@oracle.com>,
	Oskari Pirhonen <xxc3ncoredxx@gmail.com>,
	mathieu.desnoyers@efficios.com, rharwood@redhat.com,
	samuel.thibault@ens-lyon.org, debian-bsd@lists.debian.org,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH v4] templates: introduce GRUB_TOP_LEVEL_* vars
Message-ID: <Y0+CzFbQXxYiqgPC@generichostname>
References: <20221017103532.845293-1-liu.denton@gmail.com>
 <20221018131235.5e70f0bc.olaf@aepfle.de>
 <Y06w0Oda0sHTHPNW@generichostname>
 <20221018161821.149ee6fd.olaf@aepfle.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221018161821.149ee6fd.olaf@aepfle.de>

Hi Olaf,

On Tue, Oct 18, 2022 at 04:18:21PM +0200, Olaf Hering wrote:
> I think this can be done already today. At least YaST offers a way to select a specific item in a submenu and pass it to grub-set-default. This leads to an entry like this in grubenv:

Right, we currently offer the ability to navigate to a default _submenu_
but I think that it's bad UI to relegate the most oft-used entry to a
submenu entry instead of the top-level entry. I would like to be able to
specify the top-level entry, that is the first entry in the first menu.

> Maybe the patch description lacks a specific example how the proposed change is supposed to be used in your environment.

My patch description says:

	Introduce the GRUB_TOP_LEVEL, GRUB_TOP_LEVEL_XEN and
	GRUB_TOP_LEVEL_OS_PROBER variables to allow users to specify the
	top-level entry.

and I'm not quite sure how to make it more clear other than, perhaps,
explaining what the top-level entry means.

-Denton

