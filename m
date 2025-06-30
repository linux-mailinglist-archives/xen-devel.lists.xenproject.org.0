Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 03CA4AEDA43
	for <lists+xen-devel@lfdr.de>; Mon, 30 Jun 2025 12:50:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1029025.1402774 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uWC5W-0002yX-6r; Mon, 30 Jun 2025 10:50:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1029025.1402774; Mon, 30 Jun 2025 10:50:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uWC5W-0002wE-3Z; Mon, 30 Jun 2025 10:50:14 +0000
Received: by outflank-mailman (input) for mailman id 1029025;
 Mon, 30 Jun 2025 10:50:12 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gInu=ZN=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1uWC5U-0002w8-Jn
 for xen-devel@lists.xenproject.org; Mon, 30 Jun 2025 10:50:12 +0000
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [2a00:1450:4864:20::42a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id fdf08616-559f-11f0-b894-0df219b8e170;
 Mon, 30 Jun 2025 12:50:09 +0200 (CEST)
Received: by mail-wr1-x42a.google.com with SMTP id
 ffacd0b85a97d-3a522224582so2193595f8f.3
 for <xen-devel@lists.xenproject.org>; Mon, 30 Jun 2025 03:50:09 -0700 (PDT)
Received: from localhost (112.pool92-178-7.dynamic.orange.es. [92.178.7.112])
 by smtp.gmail.com with UTF8SMTPSA id
 ffacd0b85a97d-3a892e598d2sm10012305f8f.76.2025.06.30.03.50.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 Jun 2025 03:50:08 -0700 (PDT)
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
X-Inumbo-ID: fdf08616-559f-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1751280609; x=1751885409; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=bkLwNmYLuKyQcclKDsE/w8VukAwLC8KPQfw31AtdgXc=;
        b=ZEqU3YNjUJ0DLL3mQ1f52hvywu74K1BIrR1EIQH7XHrm5NaZOzuRboJru6uAJBUPjG
         HRHAC8vGfkET+3412URXeu7XK2duvKqLhfMMOjDF3jr24MCh38m/nR9+wdfMaAMvHO0G
         WxVJ5WwGrlPQC0q4uJdli42ZVOU+0mDDzqAXk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751280609; x=1751885409;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=bkLwNmYLuKyQcclKDsE/w8VukAwLC8KPQfw31AtdgXc=;
        b=jTX1nHsELpMlE5vLpEh0/0fayYdKNqqeGoHQPZCEiJmvnIpfvh7xFHDb4MuFpIUVC8
         8KsTntkdsBietgGTd0uvmvHcxJTSeWFRMvVpXjEnQEwndLes0UNK5yShWjMAesQvmTwO
         7EauVtO2Iy8CXB6SEPGVDitE4ZPlitWm0ApbZoNaLUxIiqYPVm0yFC4MUpDoftmp7s5G
         UXIYyZGQ0XCjH/yMIIJhwN7Rk7c0JWs6Cx+OCaegn6txZUdVysUoKlNHfwU46sP+O0IL
         iaAu3Clh1LaoXpuEGglAfZFc3Z4m7Qq5qTdNV2zcIF5bzqk/19OA1fMY00XDzW94utBU
         GJIA==
X-Gm-Message-State: AOJu0YxTHahnnt/VlbJ4S2GLHBLoBv/1MRW85pXGZbBSp/Q1tbqNsDXr
	3kRjAJgg7tJ/53c6fZzzzgYzmGOvRL+UZA9dzNEgUB+rwSEUW4bDAclhm/6Rex9Sims=
X-Gm-Gg: ASbGnct/kYzf2bAtRfFud3tOO6uq0aTPRFYTkub0YcpS905bR9taPLeH0J0NxWZEwGK
	bR9B0td1GTPA+mTaw+3wg59aaGw/+zGZlempJr5dqdJBphnf88dhXoBqvqVxAWVs7fUhaQ7WVYt
	lxLdtXKw9WrNg0Uh95+DqE1qECst1ycgd+FlOBHKQBUn8eb3U0bhY0Na1h7s8LJ8x4hk/vDYwef
	oNtQOW1cVYF3Jh3sYqU7G0EvAaZbpUORJJXdcXPj8+Efd1tP0gBHYUZHjjl5/Am9goeQ+/wM8Sv
	6vq+1BeHl6t9rLicqsnrDhvcGSd5lG/u0G+Xbbjm1gq7Ikpa/2CF5dsn+88fzAlwVbztICMcBDN
	n7qXzrbCqZtLFCNFqfhgqaY13yUKZvw==
X-Google-Smtp-Source: AGHT+IEIY3Lr+Z/f+DlD7L6QGBJTAydGU9BalpBaz8gtwJIWtLVX2jHzIZ6Iux/cqCwC0tBHcjLOBw==
X-Received: by 2002:a05:6000:4408:b0:3a4:eecf:b8cb with SMTP id ffacd0b85a97d-3a8ffccac65mr8908416f8f.28.1751280609142;
        Mon, 30 Jun 2025 03:50:09 -0700 (PDT)
Date: Mon, 30 Jun 2025 12:50:07 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
	Ross Lagerwall <ross.lagerwall@citrix.com>,
	Jan Beulich <JBeulich@suse.com>,
	Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	"Daniel P . Smith" <dpsmith@apertussolutions.com>
Subject: Re: [PATCH 1/3] x86/EFI: Fix detection of buildid
Message-ID: <aGJr30sBRgJbqWSe@macbook.local>
References: <20250605111638.2869914-1-andrew.cooper3@citrix.com>
 <20250605111638.2869914-2-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250605111638.2869914-2-andrew.cooper3@citrix.com>

On Thu, Jun 05, 2025 at 12:16:36PM +0100, Andrew Cooper wrote:
> The format of the buildid is a property of the binary, not a property of how
> it was loaded.  This fixes buildid recognition when starting xen.efi from it's
> MB2 entrypoint.
> 
> Suggested-by: Ross Lagerwall <ross.lagerwall@citrix.com>
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>

Some possibly useless rants below.

> ---
> CC: Jan Beulich <JBeulich@suse.com>
> CC: Roger Pau Monné <roger.pau@citrix.com>
> CC: Ross Lagerwall <ross.lagerwall@citrix.com>
> CC: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
> CC: Daniel P. Smith <dpsmith@apertussolutions.com>
> 
> I don't like this patch and tried hard to do it in a better way, but the EFI
> aspects of the build system are too intractable.
> 
> While on x86 I can in principle pull the same common-stubs.o trick, split on
> XEN_BUILD_PE rather than XEN_BUILD_EFI, that doesn't work on ARM which
> hand-codes it's PE-ness.  Also, it's really not EFI related, other than as a
> consequence of that being the only reason we use PE32+ binaries.

Since this is already gated on CONFIG_X86 you could pass XEN_BUILD_PE
as a define in CFLAGS, and use it together with the CONFIG_X86 check?

That however would still put the code in the .gz binary, as the object
file would be the same for both builds.  Otherwise we would need to
compile this twice and use the different object files for the PE vs
ELF images, which seems extremely cumbersome for a little benefit, as
this is init-only code that would be gone once booted.

Thanks, Roger.

