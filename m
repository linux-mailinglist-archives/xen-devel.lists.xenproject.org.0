Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B418FA0BF4B
	for <lists+xen-devel@lfdr.de>; Mon, 13 Jan 2025 18:53:35 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.870821.1281895 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tXOcV-0007lk-Iz; Mon, 13 Jan 2025 17:52:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 870821.1281895; Mon, 13 Jan 2025 17:52:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tXOcV-0007k4-GF; Mon, 13 Jan 2025 17:52:59 +0000
Received: by outflank-mailman (input) for mailman id 870821;
 Mon, 13 Jan 2025 17:52:58 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=3HK6=UF=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1tXOcU-0007jy-Dm
 for xen-devel@lists.xenproject.org; Mon, 13 Jan 2025 17:52:58 +0000
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com
 [2a00:1450:4864:20::52f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3840d789-d1d7-11ef-99a4-01e77a169b0f;
 Mon, 13 Jan 2025 18:52:56 +0100 (CET)
Received: by mail-ed1-x52f.google.com with SMTP id
 4fb4d7f45d1cf-5d7e527becaso7592931a12.3
 for <xen-devel@lists.xenproject.org>; Mon, 13 Jan 2025 09:52:56 -0800 (PST)
Received: from localhost ([84.78.159.3]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5d9904a411csm5170354a12.72.2025.01.13.09.52.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Jan 2025 09:52:51 -0800 (PST)
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
X-Inumbo-ID: 3840d789-d1d7-11ef-99a4-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1736790776; x=1737395576; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=KWILQ3PPbyXMIG8wb7+GZY3ItNUYUX85+QnBIKw7Ryk=;
        b=vNHtgSo3qiCSD9O+76gi7RNaoEE6/aLv4Anm1/+hC6XVOneSFHtVhYDklmro5peWwl
         YvE3P83YQ2ZxGPG2cwZQ2b/rv52vRWsfz07g84MHWsezkK5az4UBUef9DYOxduvggYlB
         h56/PXEwKLZVcBDk9D71MpLY2DizjfXHhFZ1k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736790776; x=1737395576;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KWILQ3PPbyXMIG8wb7+GZY3ItNUYUX85+QnBIKw7Ryk=;
        b=s7qJSEBxroFYsqzRyI8vCUAs2p981IIibndBcRhW5hdIZlXqqcHzDo+PMks4Ori4lZ
         6txWXgfYkzcOAWHZwJpHIZlEYza28bSx4S2r4dHGfre/vOdMT5Ok3ZzcYp+fRhOjBWuZ
         +G7NpSK5EGIAjoTF21QEtsys4buKQIO7LRLeF4L8wbqRJ4wkikSoIupo+FU1DMsPucpm
         ZAZ0lReVIboAmSEm7VWhk604wPdTjLm08qOr/8SzjSyu04Y5lTvxWtn3/pUmo+dbspsF
         F6hlSxTB6FRfw3USoWXGzUdLaRH+P6Xm5dcJVyHkVgDBPkVv3bzsrsGUn7lzmQkICDpM
         EWrA==
X-Gm-Message-State: AOJu0YxF1gYyUL/9E9WQSYFYcBFY4fIumFdQxrWIIQR/OB8BNQO54LqM
	CwuFz2wpYyQQZR3yitaeCeNsXUHbqtLA1mWjlm9S5J3+nAEr4rL9H2ISk+wA6vi45IMRKvVrRjt
	v
X-Gm-Gg: ASbGncvUtQsBDvVXyQsfejd/ADR5fCKBpCRJQ0zijE763u4WOTeGMq5kzLHgqOsIciU
	DMr4r0p7+f+1u1vc4zEGQ0IBKiuAEmANL1GtBTHSnlw3YScMHiLBFs/DYt0TPeWbK+PTGPt08oL
	MDWdXDaCVaziPLDtMNccxRBQ7IETwIftGdRk1N7TSE+/nIBq8no7GGfI8PtQU8q8YTqe0olflSH
	4zxibkdN3GX3YwWx2DrX0QQu1uz3DgtwGPPFyoTGhkp9fzwTV/KKTY+Tcbahw==
X-Google-Smtp-Source: AGHT+IGIXGgV6jRY+pFOx/xUR9nXrfE6XAM5tV6xrL3yUzmJSHVt5euk/9PhZORjzIJOuVir4w3Rcg==
X-Received: by 2002:a05:6402:26cf:b0:5d4:55e:f99e with SMTP id 4fb4d7f45d1cf-5d972e1d7dfmr53660568a12.18.1736790772567;
        Mon, 13 Jan 2025 09:52:52 -0800 (PST)
Date: Mon, 13 Jan 2025 18:52:51 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: xen-devel@lists.xenproject.org,
	"Daniel P. Smith" <dpsmith@apertussolutions.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH v7 1/2] x86/time: introduce command line option to select
 wallclock
Message-ID: <Z4VS88REbzn5uasy@macbook.local>
References: <20240913075907.34460-1-roger.pau@citrix.com>
 <20240913075907.34460-2-roger.pau@citrix.com>
 <Z4U6WxtmaqGkqOqe@mail-itl>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Z4U6WxtmaqGkqOqe@mail-itl>

On Mon, Jan 13, 2025 at 05:07:55PM +0100, Marek Marczykowski-Górecki wrote:
> On Fri, Sep 13, 2024 at 09:59:06AM +0200, Roger Pau Monne wrote:
> > Allow setting the used wallclock from the command line.  When the option is set
> > to a value different than `auto` the probing is bypassed and the selected
> > implementation is used (as long as it's available).
> > 
> > The `xen` and `efi` options require being booted as a Xen guest (with Xen guest
> > supported built-in) or from UEFI firmware respectively.
> > 
> > Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> 
> Reviewed-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>

Thanks for the review.

Oleksii, can I get your opinion as Release Manager about whether this
(and the following patch) would be suitable for committing to staging
given the current release state?

It's a workaround for broken EFI implementations that many downstreams
carry on their patch queue.

Thanks, Roger.

