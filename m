Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B900E7485A2
	for <lists+xen-devel@lfdr.de>; Wed,  5 Jul 2023 16:03:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.559211.873997 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qH36D-0008Nd-72; Wed, 05 Jul 2023 14:03:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 559211.873997; Wed, 05 Jul 2023 14:03:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qH36D-0008Lo-4E; Wed, 05 Jul 2023 14:03:17 +0000
Received: by outflank-mailman (input) for mailman id 559211;
 Wed, 05 Jul 2023 14:03:15 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Ax/R=CX=tibco.com=avallejo@srs-se1.protection.inumbo.net>)
 id 1qH36B-0008Lg-DC
 for xen-devel@lists.xenproject.org; Wed, 05 Jul 2023 14:03:15 +0000
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [2a00:1450:4864:20::629])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ae3572a6-1b3c-11ee-8611-37d641c3527e;
 Wed, 05 Jul 2023 16:03:13 +0200 (CEST)
Received: by mail-ej1-x629.google.com with SMTP id
 a640c23a62f3a-98e39784a85so148223966b.1
 for <xen-devel@lists.xenproject.org>; Wed, 05 Jul 2023 07:03:13 -0700 (PDT)
Received: from EMEAENGAAD19049. (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 v14-20020a1709060b4e00b0099251942e1esm9935798ejg.119.2023.07.05.07.03.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 Jul 2023 07:03:12 -0700 (PDT)
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
X-Inumbo-ID: ae3572a6-1b3c-11ee-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1688565792; x=1691157792;
        h=in-reply-to:content-disposition:mime-version:references:subject:cc
         :to:from:date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=DA7AHs1dJvA/14EguUz/rtIog8Dju2MFE10F3aRW5a8=;
        b=R7Zwn1cyOLR0TcnME0GGSk4oQXZ7S00LfiB9ZP8l0kHhwy5Hf9fLEaVlHNQOSsAapC
         QAMQhVgwjjeV0s+slZI0msN0JDkS1Q2yTr3DKwH0ZcAysOwkPZWmZ4/Y990tTWk6hw6G
         MUZTTAuNnfD8yC1LwGfiCHSZ9QF1fh6JFIYb8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688565792; x=1691157792;
        h=in-reply-to:content-disposition:mime-version:references:subject:cc
         :to:from:date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DA7AHs1dJvA/14EguUz/rtIog8Dju2MFE10F3aRW5a8=;
        b=BL5m3gZBH4fHV7FALUIhB04jT5xwy940ltOLSCOXWOGKnOSWbOIojXlpMYbOL7d5j+
         H3hOtCEwrTR/WsVOSk1oQ2pn9ysYeYkpjI/5JQ3tA9yjK7tPLQ2HRRrsvJjfC7oVou3/
         UGeJmmttEGr5gPcyXrOavfR2hSQrSKtH9wmShmAqFvB2SkFPjSYwrGzoAA0dU5C4aJ7L
         NFw6EM6xiaVEtpLHWg6kRMz+/QsGORqGKPeBXn33PQeI/vXU+x6NgoXPzkA3PsUoA4E9
         imxbzh3fqYIaz6kCDh99pd1qo6df5eQsc0WMA1Ckz5AeaucnqO1gewdLMN9irefby3Yh
         4yXg==
X-Gm-Message-State: ABy/qLbkCKjlKsmVKO43+wOZEwEy0H5w4NYqt9SzG9Wf1ENb8NbRXLV1
	QySsAN0l42sRT/uHj4M8DKb3Tg==
X-Google-Smtp-Source: APBJJlFSpjh75liyaGGvF+FrIgeusClIu6o8PMInTWkR8lvij3xq0E48oSB9AlFfW1HLxJ9BPuwOQA==
X-Received: by 2002:a17:906:72c9:b0:992:ef60:aadd with SMTP id m9-20020a17090672c900b00992ef60aaddmr2183752ejl.13.1688565792671;
        Wed, 05 Jul 2023 07:03:12 -0700 (PDT)
Message-ID: <64a57820.170a0220.9a035.9a30@mx.google.com>
X-Google-Original-Message-ID: <ZKV4H/kTz/txlzOT@EMEAENGAAD19049.>
Date: Wed, 5 Jul 2023 15:03:11 +0100
From: Alejandro Vallejo <alejandro.vallejo@cloud.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v5 4/4] x86/microcode: Disable microcode update handler
 if DIS_MCU_UPDATE is set
References: <20230629152656.12655-1-alejandro.vallejo@cloud.com>
 <20230629152656.12655-5-alejandro.vallejo@cloud.com>
 <1c9fe38e-d8aa-21fb-8dbe-4c54385b5a67@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1c9fe38e-d8aa-21fb-8dbe-4c54385b5a67@suse.com>

On Wed, Jul 05, 2023 at 12:51:47PM +0200, Jan Beulich wrote:
> > --- a/xen/arch/x86/cpu/microcode/intel.c
> > +++ b/xen/arch/x86/cpu/microcode/intel.c
> > @@ -385,6 +385,19 @@ static struct microcode_patch *cf_check cpu_request_microcode(
> >      return patch;
> >  }
> >  
> > +bool __init intel_can_load_microcode(void)
> > +{
> > +    uint64_t mcu_ctrl;
> > +
> > +    if ( !cpu_has_mcu_ctrl )
> > +        return true;
> > +
> > +    rdmsrl(MSR_MCU_CONTROL, mcu_ctrl);
> 
> While one would hope that feature bit and MSR access working come in
> matched pairs, I still wonder whether - just to be on the safe side -
> the caller wouldn't better avoid calling here when rev == ~0 (and
> hence we won't try to load ucode anyway). I would envision can_load's
> initializer to become this_cpu(cpu_sig).rev != ~0, with other logic
> adjusted as necessary in early_microcode_init().
> 
> Jan
We only know about the ucode revision after the collect_cpu_info() call,
and we can only make that call after the vendor-specific section that sets
the function pointers up (and calls intel_can_load_microcode()).

One could imagine turning can_load into a function pointer so that its
execution is deferred until after the revision check (and skipped
altogether if `rev==~0`).

Alejandro

