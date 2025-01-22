Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 62D12A1901C
	for <lists+xen-devel@lfdr.de>; Wed, 22 Jan 2025 11:45:11 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.875875.1286287 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1taYE6-0003FT-U2; Wed, 22 Jan 2025 10:44:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 875875.1286287; Wed, 22 Jan 2025 10:44:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1taYE6-0003D0-RI; Wed, 22 Jan 2025 10:44:50 +0000
Received: by outflank-mailman (input) for mailman id 875875;
 Wed, 22 Jan 2025 10:44:49 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jYzQ=UO=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1taYE5-0003Cs-8B
 for xen-devel@lists.xenproject.org; Wed, 22 Jan 2025 10:44:49 +0000
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [2a00:1450:4864:20::432])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e5e147f6-d8ad-11ef-99a4-01e77a169b0f;
 Wed, 22 Jan 2025 11:44:47 +0100 (CET)
Received: by mail-wr1-x432.google.com with SMTP id
 ffacd0b85a97d-38a88ba968aso6226254f8f.3
 for <xen-devel@lists.xenproject.org>; Wed, 22 Jan 2025 02:44:47 -0800 (PST)
Received: from localhost ([84.78.159.3]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38bf327e024sm15580578f8f.88.2025.01.22.02.44.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Jan 2025 02:44:45 -0800 (PST)
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
X-Inumbo-ID: e5e147f6-d8ad-11ef-99a4-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1737542686; x=1738147486; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=nbKc52aZVFHWL/Kuo9uEPiusS6Q/xJ9mXewdDhI8Qxk=;
        b=p360OWuMgoYIeWZc8oe4589Qw3vvkTHsem4R1xbQk0ZETlUDWecPucImkL+iEaUecr
         R2Tfs1eTcXgX1cdmakApNe2N41xL2GIyiOCt1mxxigBBTHA/bWMaAfWGnvInM2KlL3Li
         Ax6WFmJSotDGtSBwIid7whqkgBNzg+dqMLqUo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737542686; x=1738147486;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nbKc52aZVFHWL/Kuo9uEPiusS6Q/xJ9mXewdDhI8Qxk=;
        b=FMloX376bjjmFycnEfn/m+SDLaoTIKem2FxvFuqwRSZZ57ZE/EQ2BfXTISmRSdWFYJ
         Nq/szhZGE5dreDtUOfN/UsPGIdvvMxszj4hUnjrE5tupcOed2PIpl1wZQ2YS3wGnQl5O
         sL5QK3/tf3YEh3ILK78CA5qN9OIPZaJ4J7wNdyVOly5gXaL3dzJ1gEv1tcxU4AEIYDA+
         V0STmZAM8qnq8T0QxcJk/o63EeCVtKGhN9pE+uXfqJuppxeYWyeVkwdG5QVgaDEsC5vE
         1nXXF7F8m0a6VrBQjtUlgKOUiJawHRpQgKPeKnxZYI5y1DcoAw19hCULv1lxoLANj8JP
         4PZw==
X-Gm-Message-State: AOJu0YzzxszhuOPRMrFUAD6IkdPCluXOh1H8TxVcJ709oan2w6gqKa3d
	OYsRb9Iwa9ae7A44KQnce6wet9bbvsLYei5qFILW8u2Ic+kwfXHOljAsKMHaWSA=
X-Gm-Gg: ASbGncuZ3w/ZVbE6R3G8DDd0qIFYYMazq2HDeGMKUjo2FwuvU9dNktUcM9nn0V9UsQR
	XGjmBlUZZlOSi+2wiLSKBg3+saSuMmmn96sJ6vTi1AZAICOCAsnLgNbgcgjOuj1T96FVp/mt/JI
	qKRopaf3m+RR2dUXhdAHMZtVK1cFlEuf/40Db7GPDpDsxxwo4szyFOHB5WPRBp/MpMt51210uvI
	N5RR5NmLiz0M59d44k6GhTKz6zibcekGpwShWLSztAq48ExSIbBfN7yX/Q4WNov2of/q6xlfcc=
X-Google-Smtp-Source: AGHT+IFznrjlRDSTQgDmVqiAo4b+8DH9NMOARZhgheKnUQ+cnUOFIhlLvsAjXfgTwDAT90D2OpOz4Q==
X-Received: by 2002:a5d:6d86:0:b0:385:fc00:f5e1 with SMTP id ffacd0b85a97d-38bf5649261mr19491309f8f.9.1737542686554;
        Wed, 22 Jan 2025 02:44:46 -0800 (PST)
Date: Wed, 22 Jan 2025 11:44:44 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH v2 1/5] x86/HVM: correct MMIO emulation cache bounds check
Message-ID: <Z5DMHJ0-W1xz4jz5@macbook.local>
References: <3294f629-f91f-4b5d-9eb0-40a34aa2ec3e@suse.com>
 <c7f78078-e0ab-40a7-8624-167512cbe1cf@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <c7f78078-e0ab-40a7-8624-167512cbe1cf@suse.com>

On Tue, Oct 01, 2024 at 10:48:20AM +0200, Jan Beulich wrote:
> To avoid overrunning the internal buffer we need to take the offset into
> the buffer into account.
> 
> Fixes: d95da91fb497 ("x86/HVM: grow MMIO cache data size to 64 bytes")
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>

Thanks, Roger.

