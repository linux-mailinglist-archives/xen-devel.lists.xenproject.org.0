Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 515C9602DA8
	for <lists+xen-devel@lfdr.de>; Tue, 18 Oct 2022 15:58:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.425016.672754 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1okn6G-0001Dq-DH; Tue, 18 Oct 2022 13:57:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 425016.672754; Tue, 18 Oct 2022 13:57:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1okn6G-0001BG-AT; Tue, 18 Oct 2022 13:57:44 +0000
Received: by outflank-mailman (input) for mailman id 425016;
 Tue, 18 Oct 2022 13:57:42 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=xG/W=2T=gmail.com=liu.denton@srs-se1.protection.inumbo.net>)
 id 1okn6E-0001BA-FX
 for xen-devel@lists.xenproject.org; Tue, 18 Oct 2022 13:57:42 +0000
Received: from mail-pj1-x1032.google.com (mail-pj1-x1032.google.com
 [2607:f8b0:4864:20::1032])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d489b4df-4eec-11ed-91b4-6bf2151ebd3b;
 Tue, 18 Oct 2022 15:57:41 +0200 (CEST)
Received: by mail-pj1-x1032.google.com with SMTP id
 t10-20020a17090a4e4a00b0020af4bcae10so14053980pjl.3
 for <xen-devel@lists.xenproject.org>; Tue, 18 Oct 2022 06:57:41 -0700 (PDT)
Received: from generichostname (136-25-1-99.cab.webpass.net. [136.25.1.99])
 by smtp.gmail.com with ESMTPSA id
 p184-20020a625bc1000000b005618189b0ffsm9283724pfb.104.2022.10.18.06.57.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Oct 2022 06:57:39 -0700 (PDT)
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
X-Inumbo-ID: d489b4df-4eec-11ed-91b4-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=UB/TlnNYsdNPB64JcYN58oKOc/BijMwEPi/j10gC6mU=;
        b=DOfpZpkvwLL0QoaOZOMbcptHsCgdeop4zAPIoCfdcWrTtU4CCk0S01yi07lZCilLFw
         IH9N5p0ELman9A1Is4rG4iD97WR5e1pSvs+X0Zueky4feV4WLe53BQNs5bioVo5xFFOT
         Pmo9kB9gz/AXfeG4pmRqsgUN+73OJZV67mQNLyY3KvViTHxaqcEkTFqY+jzVMfolT32+
         av//szEDB24IgsvDviYyn58IWukUU6BvC6yFO9wfI75Dv6GLVjSfxE03CT0OiiVmsQ23
         FiEvlXy9IhPKfrw3lFgUnAFBbM8jS8i52AMwD3cVicH8WhsMnfpUlQ0krrWFQK2a7XH1
         seVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UB/TlnNYsdNPB64JcYN58oKOc/BijMwEPi/j10gC6mU=;
        b=Ucu/evu75WdYu1062EEjD1zPBZgon9belP4huq9Ztte4pj3AUN3uAjEhY7huao7fK7
         Nk7LqJhscNpujY+wtjEOnQql3xZUhe118dGEwS4yiSVQ7qHul/gusuvNUEOpVY1vWcDR
         jonsge/TOND6lWkhntHkCHy2ZApUbKBB7s48chSOonx1Bq1fW0E3Bk8l1BhM1UP9285l
         WVqMdE2K9XL8EQxsJMH4No6PwUuTF82ruZjBcMjq6FooKycxD95MdF1InLpdoaydfKOu
         SPcJFya74jYL54PoqBiyLTxwAxhxXn28ThPjseVoMdYyCCE2l/oSLnNHpqG9iUZVi8xW
         DHWA==
X-Gm-Message-State: ACrzQf1tWgsTlwatRHg+tCPZVGwOpTqxcNRQv347BuVIAXEcn3gd14PL
	j/J/n8VzmnBARm9qtBhivZo=
X-Google-Smtp-Source: AMsMyM5KE8Pew8snuRuW41KbHugJ5K70JaRVKTiStYdtAFtcpyET6zZR9tkLt42iwt82AQr2C9a17Q==
X-Received: by 2002:a17:902:7296:b0:180:1330:b3c0 with SMTP id d22-20020a170902729600b001801330b3c0mr3142346pll.170.1666101459718;
        Tue, 18 Oct 2022 06:57:39 -0700 (PDT)
Date: Tue, 18 Oct 2022 06:57:36 -0700
From: Denton Liu <liu.denton@gmail.com>
To: Olaf Hering <olaf@aepfle.de>
Cc: grub-devel@gnu.org, Daniel Kiper <daniel.kiper@oracle.com>,
	Oskari Pirhonen <xxc3ncoredxx@gmail.com>,
	mathieu.desnoyers@efficios.com, rharwood@redhat.com,
	samuel.thibault@ens-lyon.org, debian-bsd@lists.debian.org,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH v4] templates: introduce GRUB_TOP_LEVEL_* vars
Message-ID: <Y06w0Oda0sHTHPNW@generichostname>
References: <20221017103532.845293-1-liu.denton@gmail.com>
 <20221018131235.5e70f0bc.olaf@aepfle.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221018131235.5e70f0bc.olaf@aepfle.de>

Hi Olaf,

On Tue, Oct 18, 2022 at 01:12:35PM +0200, Olaf Hering wrote:
> Mon, 17 Oct 2022 03:35:32 -0700 Denton Liu <liu.denton@gmail.com>:
> 
> > A user may wish to use an image that is not sorted as the "latest"
> > version as the top-level entry. 
> 
> Correct.
> 
> What is really required is some form of file pattern matching and to use --id= in "menuentry title" commands.
> 
> That way one can have the "latest" of /boot/${short_pattern} as default entry, in case there are multiple variants of files matching ${short_pattern}. The pattern gets enabled with "grub-set-default pattern".

If I'm understanding correctly, what you're proposing is a mechanism for
setting the default entry. If I'm not mistaken, this seems like an
orthogonal discussion to me. My patch proposes a method of setting the
top-level menu entry while this method only sets the default entry,
which may be hidden behind a submenu.

In my case, I keep a LTS kernel as backup but primarily use the latest
kernel as my daily driver. I only ever boot into the LTS kernel in case
there are any breakages, which is quite rare. As such, while it is
possible for me to configure my default to point within a submenu to the
non-LTS kernel, it seems like a bad user experience for Grub to impose a
top-level entry on the user, even if that entry is almost never used.

Allowing users to configure the top-level entry to fit their needs would
certainly make for happier users.

Thanks,
Denton

