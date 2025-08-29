Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E7B6BB3B83C
	for <lists+xen-devel@lfdr.de>; Fri, 29 Aug 2025 12:09:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1101060.1454271 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1urw32-0001Rb-Vg; Fri, 29 Aug 2025 10:09:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1101060.1454271; Fri, 29 Aug 2025 10:09:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1urw32-0001Os-Sr; Fri, 29 Aug 2025 10:09:32 +0000
Received: by outflank-mailman (input) for mailman id 1101060;
 Fri, 29 Aug 2025 10:09:31 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=oFyT=3J=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1urw31-0001Og-SW
 for xen-devel@lists.xenproject.org; Fri, 29 Aug 2025 10:09:31 +0000
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [2a00:1450:4864:20::431])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 40a66c44-84c0-11f0-8dd7-1b34d833f44b;
 Fri, 29 Aug 2025 12:09:30 +0200 (CEST)
Received: by mail-wr1-x431.google.com with SMTP id
 ffacd0b85a97d-3c68ac7e18aso1198057f8f.2
 for <xen-devel@lists.xenproject.org>; Fri, 29 Aug 2025 03:09:30 -0700 (PDT)
Received: from localhost (112.pool92-178-7.dynamic.orange.es. [92.178.7.112])
 by smtp.gmail.com with UTF8SMTPSA id
 ffacd0b85a97d-3d0b9402299sm1675451f8f.18.2025.08.29.03.09.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 Aug 2025 03:09:29 -0700 (PDT)
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
X-Inumbo-ID: 40a66c44-84c0-11f0-8dd7-1b34d833f44b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1756462170; x=1757066970; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=LwM4gLRQqRlvnrRiP0ICr/Ie7LNUENwfgn9WneYRaSQ=;
        b=TXm/Ap7cJzmaHSJAA1D91xLwq9gd9uOu9ah8NhPbTw/eg+i2ydGtfWBZLADBBBc8pD
         O5iD8UhRHC9IyGWO4LEwppiZ0OwCPfQ/YrGm//0gv97Cqpkf9H9Wi7xXTfaoM2hsqyrX
         /ShwNt511pnvOPzFxZ3cTzI4pne8B4br5Hna8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756462170; x=1757066970;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=LwM4gLRQqRlvnrRiP0ICr/Ie7LNUENwfgn9WneYRaSQ=;
        b=ZTmO3Z3lGyEOai+SZ5/OQi5x5/yMeP82D9eKHP1eR3lJQns1uFAbBr+1fgGnViAs6f
         odp7v6gSZtNdX5edI/Qs04M7faG2+YykReISmjovq017mY0gNNvCqIQXHjGe49meIYg5
         jjN0fnBBVwvaPHxbyxTCe6rrd6CQ4U1JbnqfzxYvyOOM1Ndh5jME02UAarZSi6SOkJXy
         oMJxj1LiTzuKDzyn28VmbXGClDJ0WXRGbq+qKE5QhXVEfj3ZVSQeZDjjOUwXpkLMaV8W
         jMM3FxXbV3S7cGJL24VM8vvS8D7U0sBu1lnX5H4xJRk+KNfO+RjCiLSVG9cn9FuDT8Uz
         XC/Q==
X-Gm-Message-State: AOJu0YwrvZC8n5uojcZQHVA7z4eKkAWWHUNuLahdYloNioir3Ow5VJk/
	FqAzaoV5GDIa6U8hI1fSLiOLxMJjX4P3L42o90P33CTr6e6JnQ0HaFyKiedOI4ceicw/4SiRu51
	fOeUZ
X-Gm-Gg: ASbGncu9by2qlcTwXK7s0aPxYHRLT+xwOR7q4eyipGpnzqhv4FpEOUx9EAL6PwvGuu9
	emwHyfOfnune9rVh4yk6NtuqqCXLO1g7AFHZy+JGUhP/22ogTUEQ3fbm/O21U6fj7/+eZYmP0pE
	4pD+lLE8C6bLdlgp5MIizlgGb3U5A9VKxXMjKfUJtNOvU+GC4t71YoaVhO6MOYehCvBbBgTBq9K
	wgjre349oDuop/bJ/33cj7zOcvyj+GDHWcijV9hufYUbJAgFItAINceL+8Dk0YcmvQXzilJ8N+t
	7RSZy6NC1qm1cUfZwKEcrAMwfWmJnrwGJNBMCjSgbIgVXT5f0hNKKyX9pJEHWTsXbeTwg2Qi67S
	sXzKQCjVwQC2xiVbC5Mt/97UsAGsUqFp8HM8MhNUOxJKHIyA3KQuSaihR5+eREKVI2Q==
X-Google-Smtp-Source: AGHT+IGbBBysamLt5enc7nyS9KLHQADFj3UlrBnt97yaefTQtA8NiBE+nYSkuisYSVW1zJpiqUisBA==
X-Received: by 2002:a05:6000:2382:b0:3c6:e311:e33b with SMTP id ffacd0b85a97d-3c6e32128a0mr17579231f8f.33.1756462169635;
        Fri, 29 Aug 2025 03:09:29 -0700 (PDT)
Date: Fri, 29 Aug 2025 12:09:28 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jiqian Chen <Jiqian.Chen@amd.com>
Cc: xen-devel@lists.xenproject.org, Huang Rui <ray.huang@amd.com>,
	Anthony PERARD <anthony.perard@vates.tech>
Subject: Re: [PATCH v11 2/5] vpci: Refactor vpci_remove_register to remove
 matched registers
Message-ID: <aLF8WGj45bFZloBz@Mac.lan>
References: <20250808080337.28609-1-Jiqian.Chen@amd.com>
 <20250808080337.28609-3-Jiqian.Chen@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250808080337.28609-3-Jiqian.Chen@amd.com>

On Fri, Aug 08, 2025 at 04:03:34PM +0800, Jiqian Chen wrote:
> vpci_remove_register() only supports removing a register in a time,
> but the follow-on changes need to remove all registers within a range.
> So, refactor it to support removing all registers in a given region.
> 
> And it is no issue to remove a non exist register, so remove the
> __must_check prefix.
> 
> Note: two test cases don't math the new logic of
> vpci_remove_registers(), then modify them.
> 
> Signed-off-by: Jiqian Chen <Jiqian.Chen@amd.com>

Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>

Thanks, Roger.

