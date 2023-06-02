Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A4E81720317
	for <lists+xen-devel@lfdr.de>; Fri,  2 Jun 2023 15:20:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.543137.847830 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q54gQ-0006Wr-4q; Fri, 02 Jun 2023 13:19:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 543137.847830; Fri, 02 Jun 2023 13:19:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q54gQ-0006Ub-1t; Fri, 02 Jun 2023 13:19:10 +0000
Received: by outflank-mailman (input) for mailman id 543137;
 Fri, 02 Jun 2023 13:19:07 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=AB5B=BW=tibco.com=avallejo@srs-se1.protection.inumbo.net>)
 id 1q54gN-0006UN-LX
 for xen-devel@lists.xenproject.org; Fri, 02 Jun 2023 13:19:07 +0000
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com
 [2a00:1450:4864:20::134])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0cdfa65e-0148-11ee-b232-6b7b168915f2;
 Fri, 02 Jun 2023 15:19:06 +0200 (CEST)
Received: by mail-lf1-x134.google.com with SMTP id
 2adb3069b0e04-4f4f3ac389eso2771231e87.1
 for <xen-devel@lists.xenproject.org>; Fri, 02 Jun 2023 06:19:06 -0700 (PDT)
Received: from EMEAENGAAD19049. (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 y17-20020a1c4b11000000b003f7298a32ccsm501869wma.41.2023.06.02.06.19.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 02 Jun 2023 06:19:05 -0700 (PDT)
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
X-Inumbo-ID: 0cdfa65e-0148-11ee-b232-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1685711945; x=1688303945;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:subject:cc:to:from:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=/2bRwbmTKPwBoqSpZK/elFwIdSM0LPDQOqq59XCgB9A=;
        b=f6rMxUk/Hruu3MLTyAeH8DMqEo6wI3CUFkLm5qqs+tHEVFtpSyzuRMub8LNff8B/Ba
         bHVH2zysB0LZ1v8e9OKDFL0VbGyVZBu++Jr5Mg/Mz+bl8tjmK8nuZNLOp+O4OawrXGMS
         xOOaw/dvkgLMJEtNnzx7HzxUZ+QcdZdk21bXo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685711945; x=1688303945;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:subject:cc:to:from:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/2bRwbmTKPwBoqSpZK/elFwIdSM0LPDQOqq59XCgB9A=;
        b=HvTL56EqJrS36SkRj829nM7DbWIwhISVjpaPDramp+wL7FEIbKn9xWrcIoPuSRc9S4
         bOv5on87Ys+K3Zx53ndd7AvLArbYDO8urplvPr4CYp/KqpeIidvTkcwEqhCSuak4Vagg
         Xq/h1HU3f4zlC5NozbF0UbA+wjZqap7eFNNmfJ+rmdz6uEq5K8oHiBf9iztlZuRTRQ7V
         y3VOpqEVwIhTHhu8JhSJ2hF2eoPhQ4cja5uctWaXrXIgolWLL66WJrByLgGmWtB/Bm7j
         l6xlCZWlmjnfy8iC19zL1RTKzHyAi1jKW3MF+I8LEbVtWIC0Z13unWGNlwbv8TXouzVt
         T5mA==
X-Gm-Message-State: AC+VfDxdLV0wfzEcda299qCMqSRsFBCGeuxY0iZmSSsFnSbK+ndOprja
	O339Uns9KL5+xyP7J1dv8WbfUQ==
X-Google-Smtp-Source: ACHHUZ5f0pGnW2IzMNg36je6lgwdLP3CNeJwRYbYHKGf5UWRRKB/dMUbER3za+7MBhsQmMDRMRP84Q==
X-Received: by 2002:ac2:42c6:0:b0:4f6:16f9:a03a with SMTP id n6-20020ac242c6000000b004f616f9a03amr178853lfl.67.1685711945577;
        Fri, 02 Jun 2023 06:19:05 -0700 (PDT)
Message-ID: <6479ec49.1c0a0220.af185.1f3b@mx.google.com>
X-Google-Original-Message-ID: <ZHnsRyPVnMSx/gGP@EMEAENGAAD19049.>
Date: Fri, 2 Jun 2023 14:19:03 +0100
From: Alejandro Vallejo <alejandro.vallejo@cloud.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
	Jan Beulich <jbeulich@suse.com>,
	Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>
Subject: Re: [PATCH] x86/microcode: Prevent attempting updates known to fail
References: <20230531175119.10830-1-alejandro.vallejo@cloud.com>
 <83324533-38da-b5bc-875e-a161d7501eb5@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <83324533-38da-b5bc-875e-a161d7501eb5@citrix.com>

On Thu, Jun 01, 2023 at 11:54:31AM +0100, Andrew Cooper wrote:
> I had something else in mind here.  Right now, this will read
> MSR_MCU_CONTROL and emit a printk() on every microcode load, which will
> be every AP, and every time the user uses the xen-ucode tool.
Not every AP. The hypercall would return with an error before the APs are
brought in. It is true that the error on dmesg would appear on every
microcode load attempt though.

> 
> Instead, I recommend the following:
> 
> 1) One patch moving the early-cpuid/msr read from tsx_init() into
> early_microcode_init(), adjusting the comment as it goes.  No point
> duplicating that logic, and we need it earlier on boot now.
> 2) This patch, adjusting early_microcode_init() only.  Have a printk()
> saying "microcode loading disabled by firmware" and avoid filling in
> ucode_ops.  Every other part of ucode handling understands "loading not
> available".
Sure. Going on a tangent though, I do wonder why tsx_init() is preceding
identify_cpu(). It's reading cpuid leaf 7d0 simply because it hasn't been
read yet, but it's not obvious why this rush in invoking tsx_init(). I
can't see any obvious marker that affect the following identify_cpu() call,
and swapping them gets rid of the cpuid read.

> 
> In terms of the commit message, you should call out the usecase
> explicitly.  This feature is intended for baremetal clouds where the
> platform owner doesn't trust the tenant to choose the microcode version
> in use.
> 
Sure.

> Also, I'm really not sure what your 3rd paragraph is trying to say.
That the case where CPU_i.DIS_MCU_LOAD != CPU_j.DIS_MCU_LOAD where i != j
is not specifically handled on the grounds that sane firmware ensures that
condition doesn't happen, and we already notify when the system reached a
nonsensical state with different CPUs having different microcode versions.

I'll rewrite it better.

Alejandro

