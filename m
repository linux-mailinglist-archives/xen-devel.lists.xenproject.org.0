Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E9F97A8260A
	for <lists+xen-devel@lfdr.de>; Wed,  9 Apr 2025 15:20:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.944005.1342584 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u2VLI-0006PS-26; Wed, 09 Apr 2025 13:19:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 944005.1342584; Wed, 09 Apr 2025 13:19:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u2VLH-0006Nz-VK; Wed, 09 Apr 2025 13:19:47 +0000
Received: by outflank-mailman (input) for mailman id 944005;
 Wed, 09 Apr 2025 13:19:46 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=fbf/=W3=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1u2VLG-0006Nt-Rm
 for xen-devel@lists.xenproject.org; Wed, 09 Apr 2025 13:19:46 +0000
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [2a00:1450:4864:20::32c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 47efb017-1545-11f0-9ffb-bf95429c2676;
 Wed, 09 Apr 2025 15:19:35 +0200 (CEST)
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-43ce71582e9so47888345e9.1
 for <xen-devel@lists.xenproject.org>; Wed, 09 Apr 2025 06:19:35 -0700 (PDT)
Received: from [192.168.1.183] (host-92-26-98-202.as13285.net. [92.26.98.202])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43f2338d7cdsm17012575e9.8.2025.04.09.06.19.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 09 Apr 2025 06:19:34 -0700 (PDT)
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
X-Inumbo-ID: 47efb017-1545-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1744204775; x=1744809575; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=r/+sZrj1KdCUadGFwPgUnXTRtaajTn0zeMTwx+awGZ0=;
        b=jzSCWhbuEfkt6M0jepGEVtk957vPmHGlShN56hrFzGrlwLWqzdlDIdWxkUg2QrE31f
         O5I1ngK/RlGAewewrnGqmj8uksdPML8caW9doTB+Si+DLEvN72NbY2WV12Gbr3RGxUny
         i5ZSFmZ8jFtuujeN9vlEwAGXeH6dnNEmz+w7Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744204775; x=1744809575;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=r/+sZrj1KdCUadGFwPgUnXTRtaajTn0zeMTwx+awGZ0=;
        b=EFBqGco37tR7iQ5pI0M/izrEE+F3i6zZk/I1Qlug5RwhpnuxhbI8NF87JazqLGhtMy
         ZZ3VMdYyLSXpYny3naLdG390gkePOMRWgzVkZdZw7z9Qx5EO2CUm0SlOoRYOempyhtK4
         aw3q/6NkhBBCPeEUHYKjA053OIX1Ct/Aqd+Clqki6FJO4uId71TXEGtE8/jiS0EcpT4J
         csbS+T5/LjL7xtvtepzpbX05MC2vNfr/wEYVwnMdAd695GwwU6Mix8fEGyn1DAROk+kE
         2pu2azxy/Y73sVyDuA70Ep0JGjLoJ69d01GIkU5XuhVtt3d0ck6e3mhz63UGJ7smhSRn
         pqxw==
X-Forwarded-Encrypted: i=1; AJvYcCU8Rg6bljNKG3bS0CAyKgJ9sevQLf53LUSir8oroVAvfMHveg8/0VuYOqrtIh33vyivBaH+3arJRYU=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwcK+ieQqWm8FKg4wjYFDvHm2o6DYR9jsuz7c4ex7VfSXaVdo3J
	AztjEp27M652KlGdG9TO3ZB8Zp9zNhaYDn3RKdBLDHjNe2Xx/EDmbxpXylMcTJc=
X-Gm-Gg: ASbGncs1inW4D15YFeLvMQUts0oYQuyKmBFY5RHUcNyeHetGwpygtf+PbxuyWLyxNz+
	kMsDUM4KJxbuLRzdqh2D5yWHASO67J4/ao3YAg31uhBvRNS1RUyKpRhLXnY71CHq6BHkOQfPI1w
	zG1pOQG/tLhuniMpKNScH30X9lu7GXSCG2PSXp04koVXkwfyBVzWiuKNcYMLZVqc5cBxMycoQfg
	WSiGxFmv2jJ4oWto74BBcBZ70YRofbGH4hrk6Ex1Rx6djDwhp8I36ftCNW39H5QebFpGorEPC1+
	SpbNIoIb7OakC8X98o707uwKc/6izTaptUoQhB4EdXQqASooUDLRThsRAb+lZtM3+y5kcgTRZat
	Murws6w==
X-Google-Smtp-Source: AGHT+IGLv4WAHDTQw1BklSY4O6iYeEMiNhPkhoAaj3jf6QwvMOjyIDHbgvK/Cuxh+nOZ/iAd7+sKRQ==
X-Received: by 2002:a05:600c:34d1:b0:43d:8ea:8d7a with SMTP id 5b1f17b1804b1-43f1ed67220mr25966955e9.28.1744204774882;
        Wed, 09 Apr 2025 06:19:34 -0700 (PDT)
Message-ID: <87fa3abd-8b1d-4a92-ab96-3f35e6e8299f@citrix.com>
Date: Wed, 9 Apr 2025 14:19:33 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] include: sort $(wildcard ...) results
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Julien Grall <julien@xen.org>, Stefano Stabellini
 <sstabellini@kernel.org>, Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>
References: <41aa7f80-7d27-4b37-83a6-239e2380168f@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <41aa7f80-7d27-4b37-83a6-239e2380168f@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 09/04/2025 2:15 pm, Jan Beulich wrote:
> The order of items is stored in .*.chk.cmd, and hence variations between
> how items are ordered would result in re-invocation of the checking rule
> during "make install-xen" despite that already having successfully run
> earlier on. The difference can become noticable when building (as non-
> root) and installing (as root) use different GNU make versions: In 3.82
> the sorting was deliberately undone, just for it to be restored in 4.3.
>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>

