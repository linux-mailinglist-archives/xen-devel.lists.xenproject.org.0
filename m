Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A029A66D9D1
	for <lists+xen-devel@lfdr.de>; Tue, 17 Jan 2023 10:27:13 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.479238.742953 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pHiEK-0001Zw-5K; Tue, 17 Jan 2023 09:26:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 479238.742953; Tue, 17 Jan 2023 09:26:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pHiEK-0001XO-1r; Tue, 17 Jan 2023 09:26:08 +0000
Received: by outflank-mailman (input) for mailman id 479238;
 Tue, 17 Jan 2023 09:26:06 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Is34=5O=gmail.com=mingo.kernel.org@srs-se1.protection.inumbo.net>)
 id 1pHiEH-0001XI-W6
 for xen-devel@lists.xenproject.org; Tue, 17 Jan 2023 09:26:06 +0000
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [2a00:1450:4864:20::635])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f5c53ed5-9648-11ed-91b6-6bf2151ebd3b;
 Tue, 17 Jan 2023 10:26:02 +0100 (CET)
Received: by mail-ej1-x635.google.com with SMTP id qx13so15506870ejb.13
 for <xen-devel@lists.xenproject.org>; Tue, 17 Jan 2023 01:26:02 -0800 (PST)
Received: from gmail.com (1F2EF7EB.nat.pool.telekom.hu. [31.46.247.235])
 by smtp.gmail.com with ESMTPSA id
 vo16-20020a170907a81000b0086dc174caf2sm3692018ejc.220.2023.01.17.01.26.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Jan 2023 01:26:01 -0800 (PST)
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
X-Inumbo-ID: f5c53ed5-9648-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=exVmUOS71oVOAqiELfUuXDuaGik6dNbe+Gp7QyuOUb8=;
        b=GpMinRaS96fMLTxeHgP6Jtmqj9EhhkeoXQsvfQH8lrHGiCaqLd72g0fB9soxTwRier
         JlE3/pwdPSu/kOk7S9xJQ83vcthyeqA4CqwB1zRMHvcUCngcYebAClrC2HO3RFGGvhrR
         Q6vQDWVqaVhEwUDFyqWuM8hpLBdfP1YPrglsx0ubhV8Bz02IpG0sEsI8iBYTQawXD12c
         7sqIT9NzVYEvMokLZVa0GEqrYIuo8kGf54k9JY0VfSZdUN+r5j0snoaBNGmJ8RjxbRNa
         ZI2x7Rj2WV3xzIfLu0PYIPsoqr9c97+xP/RgFiiseQpzwH8EB+aF/x9HpAm/hTbpvbxd
         H1bA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=exVmUOS71oVOAqiELfUuXDuaGik6dNbe+Gp7QyuOUb8=;
        b=rnsW2n20LrKtEU4/JLHk9FDK26B+7kuKqW1HQcaCw4w3AfX5EoEsVnktPi0dqbBUII
         y7LMvWis9pokcSAe5c4XeEmKDAkmMsKqlYzMEW1dzfVQs/GLxoBpd1/A8qHB8wAbzHj4
         X1wHXJpSUVBB5S0hMgCe5l/QouCQvJtMuYLy/bBzGaild3wTUxoYp9T0cd+IoTQlddfG
         rnl0rmEbv4u7KEuHIRFMPx99MBwq7UiNVIWd0JrTvEif/rhDVXsZ24nRr7jXMAusql4p
         1yJYmlefjvP7MN4Bz8lD8PyZkPYoHd3vjpKuANkUvVGOj3rybhG6Awxlge02bUrzAPEu
         miYQ==
X-Gm-Message-State: AFqh2koiMDjM55UeeO0UEkM8mLp+PhZ3KBhnhAOuJFcJKqGyQN8CxBy0
	g+UkKGiTFAQRVC9NItbbX20=
X-Google-Smtp-Source: AMrXdXuKr4bAS6tqS2mchJrJpKXUGMsa3MmPkAdloFDHqv0zcLBeA4MsdPSn6XcLDgEVV1Q6TB3V8Q==
X-Received: by 2002:a17:907:c618:b0:868:b2b6:ee71 with SMTP id ud24-20020a170907c61800b00868b2b6ee71mr2275817ejc.6.1673947561671;
        Tue, 17 Jan 2023 01:26:01 -0800 (PST)
Sender: Ingo Molnar <mingo.kernel.org@gmail.com>
Date: Tue, 17 Jan 2023 10:25:58 +0100
From: Ingo Molnar <mingo@kernel.org>
To: Peter Zijlstra <peterz@infradead.org>
Cc: x86@kernel.org, Joan Bruguera <joanbrugueram@gmail.com>,
	linux-kernel@vger.kernel.org, Juergen Gross <jgross@suse.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	xen-devel <xen-devel@lists.xenproject.org>,
	Jan Beulich <jbeulich@suse.com>,
	Roger Pau Monne <roger.pau@citrix.com>,
	Kees Cook <keescook@chromium.org>, mark.rutland@arm.com,
	Andrew Cooper <Andrew.Cooper3@citrix.com>,
	=?iso-8859-1?Q?J=F6rg_R=F6del?= <joro@8bytes.org>,
	"H. Peter Anvin" <hpa@zytor.com>, jroedel@suse.de
Subject: Re: [PATCH v2 1/7] x86/boot: Remove verify_cpu() from
 secondary_startup_64()
Message-ID: <Y8ZppgQ3RyzcR8eJ@gmail.com>
References: <20230116142533.905102512@infradead.org>
 <20230116143645.589522290@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230116143645.589522290@infradead.org>


* Peter Zijlstra <peterz@infradead.org> wrote:

> The boot trampolines from trampoline_64.S have code flow like:
> 
>   16bit BIOS			SEV-ES				64bit EFI
> 
>   trampoline_start()		sev_es_trampoline_start()	trampoline_start_64()
>     verify_cpu()			  |				|
>   switch_to_protected:    <---------------'				v
>        |							pa_trampoline_compat()
>        v								|
>   startup_32()		<-----------------------------------------------'
>        |
>        v
>   startup_64()
>        |
>        v
>   tr_start() := head_64.S:secondary_startup_64()

oh ... this nice flow chart should move into a prominent C comment I think, 
it's far too good to be forgotten in an Git commit changelog.

> Since AP bringup always goes through the 16bit BIOS path (EFI doesn't
> touch the APs), there is already a verify_cpu() invocation.
> 
> Removing the verify_cpu() invocation from secondary_startup_64()
> renders the whole secondary_startup_64_no_verify() thing moot, so
> remove that too.
> 
> Cc: jroedel@suse.de
> Cc: hpa@zytor.com
> Fixes: e81dc127ef69 ("x86/callthunks: Add call patching for call depth tracking")
> Reported-by: Joan Bruguera <joanbrugueram@gmail.com>
> Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>

Reviewed-by: Ingo Molnar <mingo@kernel.org>

Thanks,

	Ingo

