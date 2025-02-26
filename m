Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B80E4A45875
	for <lists+xen-devel@lfdr.de>; Wed, 26 Feb 2025 09:35:39 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.896237.1304921 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tnCt6-0008Js-Tx; Wed, 26 Feb 2025 08:35:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 896237.1304921; Wed, 26 Feb 2025 08:35:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tnCt6-0008Gk-R3; Wed, 26 Feb 2025 08:35:28 +0000
Received: by outflank-mailman (input) for mailman id 896237;
 Wed, 26 Feb 2025 08:35:27 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=y9YQ=VR=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1tnCt5-0008Ge-A9
 for xen-devel@lists.xenproject.org; Wed, 26 Feb 2025 08:35:27 +0000
Received: from mail-pl1-x633.google.com (mail-pl1-x633.google.com
 [2607:f8b0:4864:20::633])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9dcaa283-f41c-11ef-9897-31a8f345e629;
 Wed, 26 Feb 2025 09:35:22 +0100 (CET)
Received: by mail-pl1-x633.google.com with SMTP id
 d9443c01a7336-221050f3f00so147185155ad.2
 for <xen-devel@lists.xenproject.org>; Wed, 26 Feb 2025 00:35:22 -0800 (PST)
Received: from localhost ([84.78.159.3]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-7347a6ad9c9sm2876322b3a.28.2025.02.26.00.35.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Feb 2025 00:35:20 -0800 (PST)
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
X-Inumbo-ID: 9dcaa283-f41c-11ef-9897-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1740558921; x=1741163721; darn=lists.xenproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=1NBgfF6iJVx28wGxR/0i0wVWIf8sfd6o3ncXKIn3Urw=;
        b=RzniQ2HFG3KGPgQAJrO444ZsTHukMxKkrxJyt5M4XshNp6ZJmsWKc6J7yQsOFLboRZ
         5w54mZzk2KJMD3ckl6hElr5pp5LFdY80L7l1ylXRUjwTyISMHwT6/8zTvrPKDVkGO7FC
         VRumbvjThjWhZyJ52hZUM6tsaBqhfSU6H4wKM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740558921; x=1741163721;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1NBgfF6iJVx28wGxR/0i0wVWIf8sfd6o3ncXKIn3Urw=;
        b=HXcHkHlACxCxRz08Vh3dpAvnwzGWQXaureUCsRr4ZK4VvZxPCzboIWGe/MIA1RVaWP
         HFQrPXZj7FRdT4a4G9BFGmT/j4pPdAVCkRieIJqQwApPsXOHYHpWTaerZVciKTqd0+Qn
         iEK0Qw7FwT4XljSHx7ZkLjHgoN/8+zBdR5anfv08HoPkd4uRa7oj3apzgILb+PJMyuql
         iI+fgjVXBmpXdZ8l5WE8KGcQHYQ6BTp+02ALmwFD6ZAJivis2sCSH6B0TH5gZtcrYaXm
         HHgbnjsgzsUI6LgeIJHGeVGKku2pswuxUTOk2KfGUX/XjVEHy0vGZmely1L1Dyz2xDjH
         pj6g==
X-Gm-Message-State: AOJu0YxpTKWDWTYdxVRGLpt62JZKHGAxgESLKRsEmT+af65NLM5NfF1h
	eUf2Mieqg8vrg2RrmRYZpDGe2FCBIj6r6vhMvkgcmr/wc5+TVHKbOeooKoQsa+g=
X-Gm-Gg: ASbGnct5nJj+1H/uR5o7pi/5QA6nynkXrrTt5zTsfIbQx13mqj1BXz44WzBqbsV3x37
	m1GYSGt/eoAJtgWs/tCe+czNL3dZLXQQNgg8wXfgVAMIQ/7p36AFATBbOXHh9dT4opYBLdusZ7B
	YnT4dOIlwlw3uzzoI9vBmSwLwIW3C+SABhl/tDjkYvGFWRDwVneDlkkE4lY3LDgja4YsUJRR++/
	fBU4UacbQbqmM1REhOmLKwuPX/mz4gz6NAl7RC+q3ECaniuGZO9MIFTpqwVCN6OPyM4OLhP/SFQ
	kTlM+Z68bDGgntq4zLdXT3PHTtYpdsg=
X-Google-Smtp-Source: AGHT+IFPwrpB0rjxA8pwqip86/R6T4lzTq6lQUFlW3KA9W2OkgnHyjvqUT8Ys3+axadlgj1/8OHyfA==
X-Received: by 2002:a05:6a20:a103:b0:1ee:de1d:5abc with SMTP id adf61e73a8af0-1f0fc78bfe1mr9266843637.33.1740558920845;
        Wed, 26 Feb 2025 00:35:20 -0800 (PST)
Date: Wed, 26 Feb 2025 09:35:15 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: xen-devel@lists.xenproject.org, committers@xenproject.org,
	Community Manager <community.manager@xenproject.org>
Subject: Re: [PATCH] CHANGELOG.md: Finalize changes in 4.20 release cycle
Message-ID: <Z77SQ1MRKXzVqJ_z@macbook.local>
References: <20250224182548.10812-1-oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250224182548.10812-1-oleksii.kurochko@gmail.com>

On Mon, Feb 24, 2025 at 07:25:48PM +0100, Oleksii Kurochko wrote:
> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
> ---
>  CHANGELOG.md | 10 ++++++++++
>  1 file changed, 10 insertions(+)
> 
> diff --git a/CHANGELOG.md b/CHANGELOG.md
> index 1979166820..e6c6144ef1 100644
> --- a/CHANGELOG.md
> +++ b/CHANGELOG.md
> @@ -18,6 +18,11 @@ The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/)
>   - Fixed blkif protocol specification for sector sizes different than 512b.
>   - The dombuilder in libxenguest no longer un-gzips secondary modules, instead
>     leaving this to the guest kernel to do in guest context.
> + - Reduce xenstore library dependencies.
> + - On Arm:
> +   - Several FF-A support improvements: add indirect messages support, transmit
> +     RXTX buffer to the SPMC, fix version negotication and partition information
> +     retrieval.
>   - On x86:
>     - Prefer ACPI reboot over UEFI ResetSystem() run time service call.
>     - Prefer CMOS over EFI_GET_TIME as time source.
> @@ -25,6 +30,8 @@ The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/)
>       interrupts instead of logical destination mode.
>  
>  ### Added
> + - Support device passthrough when dom0 is PVH on Xen.

I've spoken with Jiqian from AMD and the QEMU side is still pending to
be merged, so I'm not sure I would list it here yet.  Also AFAICT the
current work just enables passthrough from a PVH dom0 to an HVM domU,
but not to PV domUs.  This would need to be clarified.

Thanks, Roger.

