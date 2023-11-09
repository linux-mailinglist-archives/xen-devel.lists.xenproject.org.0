Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 042437E70C8
	for <lists+xen-devel@lfdr.de>; Thu,  9 Nov 2023 18:50:45 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.629763.982186 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r19Aq-0000T3-4z; Thu, 09 Nov 2023 17:50:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 629763.982186; Thu, 09 Nov 2023 17:50:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r19Aq-0000RR-1t; Thu, 09 Nov 2023 17:50:36 +0000
Received: by outflank-mailman (input) for mailman id 629763;
 Thu, 09 Nov 2023 17:50:34 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=r4x0=GW=cloud.com=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1r19Ao-0000RL-Ke
 for xen-devel@lists.xenproject.org; Thu, 09 Nov 2023 17:50:34 +0000
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com
 [2a00:1450:4864:20::22f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7a7164b6-7f28-11ee-9b0e-b553b5be7939;
 Thu, 09 Nov 2023 18:50:32 +0100 (CET)
Received: by mail-lj1-x22f.google.com with SMTP id
 38308e7fff4ca-2c509f2c46cso15205551fa.1
 for <xen-devel@lists.xenproject.org>; Thu, 09 Nov 2023 09:50:32 -0800 (PST)
Received: from perard.uk.xensource.com (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 e20-20020a05600c219400b004083996dad8sm2731182wme.18.2023.11.09.09.50.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Nov 2023 09:50:31 -0800 (PST)
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
X-Inumbo-ID: 7a7164b6-7f28-11ee-9b0e-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1699552232; x=1700157032; darn=lists.xenproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=dQOK3BUYzTGekaveJMFcd8fidkA3As4DifUKi0HGdc0=;
        b=NdTkyY33Gt6tAbBUpWr8es6bipXIDohKUKCYL/zZ/A5hfRBFzhhgiau6hxyoIL3m20
         qaPLd+7qNnfwljp4YhRPX07VSAs7DlaiCdBsaAM7Xzr3V/McxsYh9jsPSg6rykrq8LW9
         4njhhBfNqFK/o7vktnSMmS8RjExsnW2LHeisk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699552232; x=1700157032;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dQOK3BUYzTGekaveJMFcd8fidkA3As4DifUKi0HGdc0=;
        b=On5oc4hKcY9eHNLFmWYEZV39nLPUEDX2O+35+PPACvvt3apeANkKfPtGcaT6KrICAb
         qlVgoxwdt8G1yUAwFWLWFuTTwYGA6CGhjWWnTN915sAsxb12ikC4ai02NMwi/RfRYnsD
         624G7w4CfyvDySte7aBxLu5HfQqYbgax7sZOsn59Xer8x+2EAkNcZum9Ccj91tt1MQNY
         IVUIbvG6BCSEc0j67LOxKuh4gjUin+5ks9HqgPgKdOZvozNjdjl1+EZZcAIFDudCKO2M
         bfMPQorI8TNa2U+b8e4CeyohajhLitUMKJm3r2oL5Ih3x/qmt5Bz+q7QYNvKhq+F85od
         +eng==
X-Gm-Message-State: AOJu0YxdR0SnMFgtq1A/SBMdH/BTklCmhRyeO0g8T5LZmYnn+UsXja1u
	csCljHGjyFa7JMf+3x70HTkLDw==
X-Google-Smtp-Source: AGHT+IEE/DivrloBkZjYdO4KQLnytHsztMimcfv0QPmYVnbvkYtPPdIoVJIzaXuE8ckVcFqBA62OPw==
X-Received: by 2002:a2e:4601:0:b0:2c5:1f70:a266 with SMTP id t1-20020a2e4601000000b002c51f70a266mr4481051lja.50.1699552232012;
        Thu, 09 Nov 2023 09:50:32 -0800 (PST)
Date: Thu, 9 Nov 2023 17:50:31 +0000
From: Anthony PERARD <anthony.perard@citrix.com>
To: Alejandro Vallejo <alejandro.vallejo@cloud.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>, xen-devel@dornerworks.com,
	Nathan Studer <nathan.studer@dornerworks.com>,
	Stewart Hildebrand <stewart@stew.dk>, Wei Liu <wl@xen.org>,
	Juergen Gross <jgross@suse.com>,
	"Daniel P. Smith" <dpsmith@apertussolutions.com>
Subject: Re: [PATCH v2] tools: Remove all DECLARE_* op macros in xc
Message-ID: <13bd7fda-4939-4edc-b1ab-0c86ea559032@perard>
References: <20231106132529.21248-1-alejandro.vallejo@cloud.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231106132529.21248-1-alejandro.vallejo@cloud.com>

On Mon, Nov 06, 2023 at 01:25:29PM +0000, Alejandro Vallejo wrote:
> These macros were hiding that the ops are not zero-initialized by the
> toolstack. This is needlessly opaque for something so simple, so this patch
> removes them and replaces them with explicit zero-initialising versions.
> 
> The patch also removes PHYSDEV_OP from there, as that seems to be an old
> dead macro.
> 
> Signed-off-by: Alejandro Vallejo <alejandro.vallejo@cloud.com>

Reviewed-by: Anthony PERARD <anthony.perard@citrix.com>

Thanks.

Next step, reword some of those to read something like:
    struct xen_sysctl sysctl = {
         .cmd = XEN_SYSCTL_cpupool_op,
         ....
    };
which would look nicer :-)

But that manual or for something like "coccinelle", so maybe one day.

Cheers,

-- 
Anthony PERARD

