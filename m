Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 46AD8B37CD6
	for <lists+xen-devel@lfdr.de>; Wed, 27 Aug 2025 10:05:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1095674.1450591 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1urB9d-0002hx-1K; Wed, 27 Aug 2025 08:05:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1095674.1450591; Wed, 27 Aug 2025 08:05:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1urB9c-0002fv-SQ; Wed, 27 Aug 2025 08:05:12 +0000
Received: by outflank-mailman (input) for mailman id 1095674;
 Wed, 27 Aug 2025 08:05:12 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=E4uQ=3H=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1urB9b-0002eL-Rv
 for xen-devel@lists.xenproject.org; Wed, 27 Aug 2025 08:05:11 +0000
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [2a00:1450:4864:20::332])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8b5b7d06-831c-11f0-b898-0df219b8e170;
 Wed, 27 Aug 2025 10:05:07 +0200 (CEST)
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-45a1ac7c066so3521725e9.1
 for <xen-devel@lists.xenproject.org>; Wed, 27 Aug 2025 01:05:07 -0700 (PDT)
Received: from localhost (112.pool92-178-7.dynamic.orange.es. [92.178.7.112])
 by smtp.gmail.com with UTF8SMTPSA id
 5b1f17b1804b1-45b6f2f3383sm18987575e9.26.2025.08.27.01.05.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 27 Aug 2025 01:05:05 -0700 (PDT)
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
X-Inumbo-ID: 8b5b7d06-831c-11f0-b898-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1756281906; x=1756886706; darn=lists.xenproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=wafuybJDebB07gu6JwFrpSZX+c1NHwIRXVLshVeZQLQ=;
        b=N/ym58aMtxjZDmXtxNZPT/eSvRlVNxbBaA99Eo3sF0hlTfsNFLPj9Kwx9CX6d/Vqkm
         akuUWRlpjxOF30AEDdz61/aypBS1fqWQI25ytQTNNhRRsaoGpmCJJPaWhVbKzl925Rjw
         wpZWtkKpIStNl2GEtk525NPF9wAp/zLxUF4ok=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756281906; x=1756886706;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wafuybJDebB07gu6JwFrpSZX+c1NHwIRXVLshVeZQLQ=;
        b=WL/7YQ9dMjAwVKAzJlM4twW248FazCLIVJghB8c7wFrsgX5DxT1SQBCS26kqA1zykc
         JncFWiu9J90hXQvOihR26J6xjJEyffdVdHJ+bX2UDGJ6K8FplIY5tyjudVI5gfRHILni
         sKKBtqd1yIbQxWteXAGFhm5o8rG8/4aq+Vh7goW8d30jxlmsggIyFuF9J2PYvApHXpvh
         +0fZYhJNvzbx9v+6UmyVIK6NPgBxCRNBM4V5vV+YAOkSrTIE9FKQB7ruDFZDxSgrj7rL
         mffnRCl0hxgpACd9+zItpQRevFm1hIerLejd5PfXTxxoi12J9vKAajb2Z/pfIEv0ZXPU
         XwSw==
X-Gm-Message-State: AOJu0YyPrC6GgN+TU9IuYmaaNIk9qxkNwnKUDktGLBJhtbddz+sErBcA
	l27YMauicvWxDAaMybnrEfP/LBgEl39zhSKRiyzKy3wbi5cMunawv9WaN1dRhpaOYAE=
X-Gm-Gg: ASbGncuNXTF3cZhxdJOzfwIqxlJtLrIRaEHEKPyyd9QmDK1m7aXa2PsQ+62//btdDnY
	PrVPpZFmZEuBWqX4KatctW/gL1YL7jnbLMFTaCL5ClFysNfBP9dLcxdqQEJ9H/K31vRKT7EXZKN
	G1J3qQdYZziAtDSqEz+Jz6pi2egircvv9JepHd9p50GzH93bQboezj8mTASts0aQ1J3gWCqdENQ
	9RuSMuoKm3i7NdRhthfbXRZ59jwo5gmUmKnlITtiaW6RGxmkS8ocLeVxHAOZq3dZ/vl208urAub
	yLI9Sh1iEK5DCxs0wnd6SVUttREiYd3Bp3+lYSSCFPeE+OYZfP6VgRAq8Dw0Et6K+Tqkg8zAOfb
	b095muw4SSLQG9OyzEJz0M8faZTeVRJSaIHHxPGuibFrWTBYNGd6ETgASHdBCr9pPWZyI7G09YF
	4m
X-Google-Smtp-Source: AGHT+IHEw5nnmQo3t1mgTg2mCT2uafzIhpPuJfy4aLF9W9s8w6/oCF2WbO4efanJbNz6ekE1yqmSaQ==
X-Received: by 2002:a05:600c:3b95:b0:45b:62ea:c886 with SMTP id 5b1f17b1804b1-45b6d418c9dmr12700215e9.2.1756281906256;
        Wed, 27 Aug 2025 01:05:06 -0700 (PDT)
Date: Wed, 27 Aug 2025 10:05:04 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: xen-devel@lists.xenproject.org, andrew.cooper3@citrix.com,
	anthony.perard@vates.tech, michal.orzel@amd.com, jbeulich@suse.com,
	julien@xen.org
Subject: Re: [PATCH v2] docs/sending-patches: add GitLab pipeline link
Message-ID: <aK68MKAFh7q9M_uO@Mac.lan>
References: <alpine.DEB.2.22.394.2508181558550.923618@ubuntu-linux-20-04-desktop>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <alpine.DEB.2.22.394.2508181558550.923618@ubuntu-linux-20-04-desktop>

On Mon, Aug 18, 2025 at 04:00:11PM -0700, Stefano Stabellini wrote:
> When submitting patches to xen-devel, add a link to a successful
> pipeline run.
> 
> Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>
> ---
> Changes in v2:
> - address Julien's comments
> 
> diff --git a/docs/process/sending-patches.pandoc b/docs/process/sending-patches.pandoc
> index 1991932b68..13bb3bf47a 100644
> --- a/docs/process/sending-patches.pandoc
> +++ b/docs/process/sending-patches.pandoc
> @@ -314,3 +314,38 @@ A patch should always be sent **to** the xen-devel mailing list
>  of all touched code areas should get a copy of the mail via **Cc**. In case
>  some other recipients are known to be interested in the patch, they can be
>  added via **Cc**, too.
> +
> +## Testing

Should this be placed immediately after the "Patch version history
(change log), further comments" section, so that the order of the
document matches the order of the described elements in the patch
itself?

> +
> +Xen Project uses a GitLab-based CI infrastructure. You can request to
> +have your GitLab account added to the Xen Project organization on GitLab
> +(https://gitlab.com/xen-project) by reaching out to THE REST maintainers
> +via xen-devel or Matrix. Once your account is added to the Xen Project
> +organization on GitLab, also a personal Xen repository will be created
> +for you under https://gitlab.com/xen-project/people/<your-username>/xen.
> +You will be able to trigger a GitLab testing pipeline with a single git
> +push to your personal Xen repository.
> +
> +When submitting a patch or patch series, please include a link to the
> +successful GitLab pipeline run on your personal branch. The branch
> +should be based on a recent version of the "master" branch, ideally not
> +older than two days.
> +
> +This information can be added after the `---` line.  For example:
> +
> +    ---
> +    Test CI pipeline:
> +    https://gitlab.com/xen-project/people/your-username/xen/-/pipelines/1980129839

FTAOD, should this also mention that for patch series the link should
be added to the cover letter and without any dashes?

Also FTAOD, should the link to the pipeline results be placed before
or after the "Changes since vX:" entries?

I don't care much whether it's before or after TBH, but we should
likely clarify that it either doesn't matter, or provide a suggested
order.

> +While it is technically possible to implement an automated system that
> +picks up patches and patch series from xen-devel and runs the GitLab
> +pipeline on them automatically, doing so would consume a significant
> +amount of resources on the testing infrastructure. There is no reliable
> +way to automatically determine whether a patch is close to being
> +committed or still undergoing substantial review. By having users submit
> +the link to the pipeline manually, we can manage testing resources much
> +more efficiently.
> +
> +When submitting new features, please also consider whether you can add a
> +GitLab test for the feature to ensure it continues to work correctly in
> +the future.

Not sure whether it's worth explicitly mentioning here, but it's not
strictly needed to add a new GitLab test, just adding a test to
tools/tests/ that's properly hooked up (like all test that reside
there) will get it automatically executed by GitLab.

Thanks, Roger.

