Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A30BA4C46B
	for <lists+xen-devel@lfdr.de>; Mon,  3 Mar 2025 16:13:33 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.900466.1308357 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tp7Tr-0003aC-TI; Mon, 03 Mar 2025 15:13:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 900466.1308357; Mon, 03 Mar 2025 15:13:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tp7Tr-0003XQ-QU; Mon, 03 Mar 2025 15:13:19 +0000
Received: by outflank-mailman (input) for mailman id 900466;
 Mon, 03 Mar 2025 15:13:18 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=RjBI=VW=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1tp7Tq-0003XI-6m
 for xen-devel@lists.xenproject.org; Mon, 03 Mar 2025 15:13:18 +0000
Received: from mail-pl1-x634.google.com (mail-pl1-x634.google.com
 [2607:f8b0:4864:20::634])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 07f18ecf-f842-11ef-9ab2-95dc52dad729;
 Mon, 03 Mar 2025 16:13:16 +0100 (CET)
Received: by mail-pl1-x634.google.com with SMTP id
 d9443c01a7336-2237cf6a45dso36820595ad.2
 for <xen-devel@lists.xenproject.org>; Mon, 03 Mar 2025 07:13:16 -0800 (PST)
Received: from localhost ([84.78.159.3]) by smtp.gmail.com with UTF8SMTPSA id
 d2e1a72fcca58-73631435aebsm5239359b3a.82.2025.03.03.07.13.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 Mar 2025 07:13:13 -0800 (PST)
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
X-Inumbo-ID: 07f18ecf-f842-11ef-9ab2-95dc52dad729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1741014795; x=1741619595; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=nUh9ubw81EEspJjWHvDfrbcoNiqGGwOUOGCkcNRDtc8=;
        b=fUh+3U6ehe6Sm5aov3Id/y+tjM6kX2RvQYpvnRAdBriJNtwNCnscFIYubSeBGGcQWm
         TyZlTap4OopJuzGTK0Ql76ecgUBSFIjLdOArVCVw6fbdXCdrTxaujcXyCK5U24KX915a
         DyMEqs1YZoMzz3gyfSA5OTApid9qwOtNMQL7U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741014795; x=1741619595;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nUh9ubw81EEspJjWHvDfrbcoNiqGGwOUOGCkcNRDtc8=;
        b=HaIIo9Hxc1J63WyYiYMGJIt5Dvg4d0tV6h+Fd0Wkpvn3I/4SCMBzlIAwAqJu1xZOut
         T+4T9Ow0R4VzFYeA9uOoAD5kkklpWb8qvyRwYPFGaVpm8BrNIYgC+2qskion+DfOgTWy
         rnOl50zhSFTmt5FF1OEmYFdiHJzgalE6piI779z001IvlVq23dhYFMJ/wNm86ZRFm9tV
         pZxAmck/C5ZLeMYw5zUpAYeFElAoorQroowXQijqAWw73y57r70O+KA+2//SMtqtvRzA
         IKRMl3jL+2M6RDwbNPYT6AcW8O0XUoIzzvIbX4uvjK/0aUjcM0p9M+QUR1Jdm0CKfQt5
         BZQA==
X-Gm-Message-State: AOJu0YxddWoI9SRUKX04FvAMHQh4yeGTUXgVMC5XBQGTB9Y31i0r/4n1
	HFh9797VutAsd9n/KhXSOmCFbMYBJqMCDfT6BYd1j8BwmLwv9rR0SDlbYpZxaRM=
X-Gm-Gg: ASbGncvaZpIEtmLPQrCazaMNM8xREDpQiBu/ST0sptFm3SxPgL54mxEWA9JL1Kp+0gN
	7DH2E86vpdtPEuup/t1JHXD1a/lFlhHCJQv30kmaQea/tt4GEuIgmsyT8vUgIiahDoO1UbGsMRl
	2In8mW83mxkpwsyFQeNFjF5BUF0sGbvHbKC47BAHycRJ87Q3Q9WYOxCGuJP3Aq9wr0l/vWWHUNY
	uSJsnMWPBeBydDn9Kdi2J9C+5OSPV2OiMH80KSfd/aGkSuYDW/oZ5MTYF8Z/S88yKHz5olEBMnf
	9UEYSv2+HfD7r7gagnPx9bVqhwWbaR+LO4TjBD+HT0oBMoPt3Q==
X-Google-Smtp-Source: AGHT+IGpelKPP8I0pnybMXQwJ7eLI/TP6b47Qp2x31GXZCvP0QgWSSx9fmyqInyQZLvts7zOu8TiSw==
X-Received: by 2002:a17:903:2ca:b0:21f:55e:ed64 with SMTP id d9443c01a7336-22368f6a609mr203817525ad.3.1741014794616;
        Mon, 03 Mar 2025 07:13:14 -0800 (PST)
Date: Mon, 3 Mar 2025 16:13:08 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: xen-devel@lists.xenproject.org,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>
Subject: Re: [PATCH for-4.20 2/2] SUPPORT.md: Define support lifetime
Message-ID: <Z8XHBA7hL4uuU29w@macbook.local>
References: <20250303141754.26452-1-andrew.cooper3@citrix.com>
 <20250303141754.26452-3-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250303141754.26452-3-andrew.cooper3@citrix.com>

On Mon, Mar 03, 2025 at 02:17:54PM +0000, Andrew Cooper wrote:
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> ---
> CC: Anthony PERARD <anthony.perard@vates.tech>
> CC: Michal Orzel <michal.orzel@amd.com>
> CC: Jan Beulich <jbeulich@suse.com>
> CC: Julien Grall <julien@xen.org>
> CC: Roger Pau Monné <roger.pau@citrix.com>
> CC: Stefano Stabellini <sstabellini@kernel.org>
> CC: Oleksii Kurochko <oleksii.kurochko@gmail.com>
> 
> 4.20 only.
> ---
>  SUPPORT.md | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/SUPPORT.md b/SUPPORT.md
> index 2bc5bd81ee39..a72798aeeae4 100644
> --- a/SUPPORT.md
> +++ b/SUPPORT.md
> @@ -9,13 +9,13 @@ for the definitions of the support status levels etc.
>  
>  # Release Support
>  
> -    Xen-Version: 4.20-rc
> -    Initial-Release: n/a
> -    Supported-Until: TBD
> -    Security-Support-Until: Unreleased - not yet security-supported
> +    Xen-Version: 4.20
> +    Initial-Release: 2025-03-05
> +    Supported-Until: 2028-03-05
> +    Security-Support-Until: 2026-09-05

I  think there's a typo here, it should be:

Initial-Release: 2025-03-05
Supported-Until: 2026-09-05
Security-Support-Until: 2028-03-05

So 1.5 years of support, and 3 years of security support?

Thanks, Roger.

