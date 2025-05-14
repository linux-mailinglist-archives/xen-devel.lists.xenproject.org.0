Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A012AB6A3C
	for <lists+xen-devel@lfdr.de>; Wed, 14 May 2025 13:40:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.984234.1370412 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uFATA-0002Vb-70; Wed, 14 May 2025 11:40:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 984234.1370412; Wed, 14 May 2025 11:40:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uFATA-0002T1-3c; Wed, 14 May 2025 11:40:16 +0000
Received: by outflank-mailman (input) for mailman id 984234;
 Wed, 14 May 2025 11:40:14 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5Q1L=X6=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1uFAT8-0002Sv-4B
 for xen-devel@lists.xenproject.org; Wed, 14 May 2025 11:40:14 +0000
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com
 [2a00:1450:4864:20::530])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 31e8229d-30b8-11f0-9ffb-bf95429c2676;
 Wed, 14 May 2025 13:40:11 +0200 (CEST)
Received: by mail-ed1-x530.google.com with SMTP id
 4fb4d7f45d1cf-5fbed53b421so10773434a12.0
 for <xen-devel@lists.xenproject.org>; Wed, 14 May 2025 04:40:12 -0700 (PDT)
Received: from localhost ([84.78.159.3]) by smtp.gmail.com with UTF8SMTPSA id
 4fb4d7f45d1cf-5fc9cbe523bsm8609530a12.12.2025.05.14.04.40.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 May 2025 04:40:11 -0700 (PDT)
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
X-Inumbo-ID: 31e8229d-30b8-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1747222811; x=1747827611; darn=lists.xenproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=76/ZpruyteBOTo/HH+V7/R55KG/PtJdx07J+uWIDU5M=;
        b=GjgLPlCSB4IeaqvtWlbnNF6ZRqL/p9vv3Y7wbbO0rEQEIPKhSZzC+C3/ZAS9TwZ8EC
         u37jdwVDEnfQuY+vAtaWmiUOiA8rQy5b0t8eQIqAa+hBcU1bD1LGhmSPH36F/MVn8k9k
         6+5YF5qqf/8uGBq9aAGnaSALeT87PHjBEMwFU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747222811; x=1747827611;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=76/ZpruyteBOTo/HH+V7/R55KG/PtJdx07J+uWIDU5M=;
        b=mwTXI3Kr7cgHorECkfX3H+Y7LmPAkzjdsG8vld2T6juIQocMsoDisY01ft1dNCSsxR
         PDOFeQ0p35K1SjCykc5p/HhOE4SvkJ6sz5fRpnHK9mhPGYZHeX5s/WwWLH+ErR9Ej5HJ
         bRWB9YgRy9rKWBoozxavi90FxRVPOhy0lYOES/kPFvLg1bkW3VilyZKqiNCWNzsgpFeK
         ArqREficjEtgvgZ8T0kHli2gerd7ZD9NTd4U6n1BGduZ56jiDQc+wA5wTe7oT5WljWfQ
         d8rddZnALbM2BQYtfJqQ9dGE3ZeKNtZ5fToU7ySuzy1l/yX9fNyVl7pN3apoY+2cKcKy
         Fykg==
X-Gm-Message-State: AOJu0YwhkXtDqcPnbJufb295QUkNlUl4CxZDCgOT9tab54y6zw7e8VKH
	yGDJC+g0Squbow7ICP1CM5UvDr6uTYqzjSGCRjls6mGNd/eU/TEc1KEEayxQ8Uc=
X-Gm-Gg: ASbGnct4XTZaXng4qKTBvZ8EL4Ap+vE29GagTEL9v6ILngTpgZ74vjDF7I92sSMNxKS
	Vn4VQVLQlHLrdPAv3X78CYwqA1awDNW+ZCj22kY9MQwt9uovVaf9ANORJ6u4IKIU8Q/hWsrOiu2
	FPL3JCSq7NVpAk20L7N7zV9iTW3608PQ6qYFx4IYYh3IpClAA6sA2DA5LpHBgbl69VxrmaQ4Ii8
	403fYsTrkXH0S5BSCqYRaOxsahnwxrS+97EBPyklhgdqOmAicbPbzHL/P1UiyyeVttl3gu3Z6/R
	VdekGNuRm0M9NUQEOaiCa+/PRjWU+QPQu7SAR2ySDD3fooUVEnYQcHzz8kSulA==
X-Google-Smtp-Source: AGHT+IE86edRmkMFGLEcQIu2Q2fvgzwfLfaHKaZ1CS7RwoHmJ5OSIDOeMJ9eUuX0vsUZq2qCg4O2dA==
X-Received: by 2002:a05:6402:1d4c:b0:5fc:a51c:21a3 with SMTP id 4fb4d7f45d1cf-5ff986a68ddmr2170743a12.4.1747222811548;
        Wed, 14 May 2025 04:40:11 -0700 (PDT)
Date: Wed, 14 May 2025 13:40:10 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
	Kevin Tian <kevin.tian@intel.com>
Subject: Re: [PATCH v2 4/6] VT-d: restrict iommu_flush_all() to cache
 writeback
Message-ID: <aCSBGhD2DwS3K3C-@macbook.lan>
References: <c030bfde-c5bb-f205-edff-435278a435f4@suse.com>
 <bf99949c-0e09-13a5-3ad9-a6c26377bdbf@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <bf99949c-0e09-13a5-3ad9-a6c26377bdbf@suse.com>

On Wed, May 03, 2023 at 11:46:11AM +0200, Jan Beulich wrote:
> We don't need to invalidate caches here; all we're after is that earlier
> writes have made it to main memory (and aiui even that just in case).
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> ---
> This, aiui, being an analogue to uses of iommu_sync_cache() (just not
> range restricted), I wonder whether it shouldn't be conditional upon
> iommu_non_coherent. Then again I'm vaguely under the impression that
> we had been here before, possibly even as far as questioning the need
> for this call altogether.

I think yes, it would better be only done for iommu_non_coherent.  Yet
in that case I wonder why we need this wide flush.  In principle all
accesses should already have their own write-back calls if the IOMMU
is non-coherent?

There's maybe the call from vtd_crash_shutdown() which I guess could
trigger in the middle of some interaction with the IOMMU, but at that
point do we really care to flush anyway if Xen is going to crash?

Otherwise it seems fine to switch to write-back.

Thanks, Roger.

