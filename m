Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 827D38BE5C6
	for <lists+xen-devel@lfdr.de>; Tue,  7 May 2024 16:24:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.718212.1120776 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s4Lju-000654-Ol; Tue, 07 May 2024 14:24:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 718212.1120776; Tue, 07 May 2024 14:24:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s4Lju-00062S-K8; Tue, 07 May 2024 14:24:18 +0000
Received: by outflank-mailman (input) for mailman id 718212;
 Tue, 07 May 2024 14:24:17 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=J4VX=MK=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1s4Ljt-00061o-68
 for xen-devel@lists.xenproject.org; Tue, 07 May 2024 14:24:17 +0000
Received: from mail-oi1-x235.google.com (mail-oi1-x235.google.com
 [2607:f8b0:4864:20::235])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7acf9374-0c7d-11ef-b4bb-af5377834399;
 Tue, 07 May 2024 16:24:15 +0200 (CEST)
Received: by mail-oi1-x235.google.com with SMTP id
 5614622812f47-3c86f066256so1799189b6e.2
 for <xen-devel@lists.xenproject.org>; Tue, 07 May 2024 07:24:15 -0700 (PDT)
Received: from localhost ([213.195.114.223]) by smtp.gmail.com with ESMTPSA id
 r9-20020a0cf809000000b006a0ecb2333esm4735874qvn.99.2024.05.07.07.24.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 May 2024 07:24:13 -0700 (PDT)
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
X-Inumbo-ID: 7acf9374-0c7d-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1715091854; x=1715696654; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=+HzMSaFTxW/BpNWP9DdNLYLF5hdPWgxP7OVUISaXBrU=;
        b=WvSCr0/7ECf+wpT3bR/xmPXb4K30C4pceJnMydLESpmoOgvW3a02j5YcogBmIO/kMy
         k4aUGotmFj+Weugygg8mXbzr7B/iLn130LX8imyIUYmca86v60i5urZRp+C94AWBbJMl
         83yE7AhqMcoYxofVinmPxMP5cbwnd8FpudSnk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715091854; x=1715696654;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+HzMSaFTxW/BpNWP9DdNLYLF5hdPWgxP7OVUISaXBrU=;
        b=pn2I2Cbk1JYjOZJoOK6weRhJUjdYihEwOPk395BRRUkn0tH4vpZw2H2Jn+I1tH8Kak
         pX1b83pPdZMhQNkXOS4tnaz8ttndh+G7bx4pIp3IQtD9suiR8DN7Pm32HqT82I4Q35ED
         +YfUI5HTjGas4Y4XUc+yvL9B2cl/mSaMSRNjVGNhDUZad0SE0Yz7E0PRYME5YxAu7gU/
         2V4BGGsw8icOuOtfXAviria+/RYT6zFk3uGG7wj9nm/Tqg+wjiK5uOuYgbKAM4LALCB2
         cd6sgm1fcom9kmkDdKvuR2zBcP+qGYXDEriJnpmh5+frPwgS1W1HW8AtMsKs34pjIO7t
         6Dfg==
X-Gm-Message-State: AOJu0Yx3R3PmpzerxeuL4XQIVR/VyS5REai5pUFpmQxJlxy9hPh4kir4
	hEUYLryFpXZVGHlIUs4qHclNBdsavX7WL9sss+GzG4zanDbhvxDrdEadgZkoPjQ=
X-Google-Smtp-Source: AGHT+IHdu0GbLBLq8xrWB7P1x0kX0CqfibMyyb+mstpbF5UTNoLMg64Yh3Dd9ZTvP4qbCrEBQNRZCA==
X-Received: by 2002:aca:90a:0:b0:3c9:7003:af7e with SMTP id 10-20020aca090a000000b003c97003af7emr5226265oij.18.1715091853672;
        Tue, 07 May 2024 07:24:13 -0700 (PDT)
Date: Tue, 7 May 2024 16:24:11 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
	Jan Beulich <JBeulich@suse.com>
Subject: Re: [PATCH v2] x86/cpu-policy: Fix migration from Ice Lake to
 Cascade Lake
Message-ID: <Zjo5iwmEvD3RWtsx@macbook>
References: <20240507112957.1701824-1-andrew.cooper3@citrix.com>
 <20240507134540.1714274-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240507134540.1714274-1-andrew.cooper3@citrix.com>

On Tue, May 07, 2024 at 02:45:40PM +0100, Andrew Cooper wrote:
> Ever since Xen 4.14, there has been a latent bug with migration.
> 
> While some toolstacks can level the features properly, they don't shink
> feat.max_subleaf when all features have been dropped.  This is because
> we *still* have not completed the toolstack side work for full CPU Policy
> objects.
> 
> As a consequence, even when properly feature levelled, VMs can't migrate
> "backwards" across hardware which reduces feat.max_subleaf.  One such example
> is Ice Lake (max_subleaf=2 for INTEL_PSFD) to Cascade Lake (max_subleaf=0).
> 
> Extend the max policies feat.max_subleaf to the hightest number Xen knows
> about, but leave the default policies matching the host.  This will allow VMs
> with a higher feat.max_subleaf than strictly necessary to migrate in.
> 
> Eventually we'll manage to teach the toolstack how to avoid creating such VMs
> in the first place, but there's still more work to do there.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Acked-by: Roger Pau Monné <roger.pau@citrix.com>

Even if we have just found one glitch with PSFD and Ice Lake vs
Cascade Lack, wouldn't it be safer to always extend the max policies
max leafs and subleafs to match the known array sizes?

Thanks, Roger.

