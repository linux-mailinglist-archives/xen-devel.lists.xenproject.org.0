Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E5109AFFC7
	for <lists+xen-devel@lfdr.de>; Fri, 25 Oct 2024 12:13:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.825898.1240323 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t4HJq-0003WB-8G; Fri, 25 Oct 2024 10:13:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 825898.1240323; Fri, 25 Oct 2024 10:13:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t4HJq-0003TQ-5K; Fri, 25 Oct 2024 10:13:22 +0000
Received: by outflank-mailman (input) for mailman id 825898;
 Fri, 25 Oct 2024 10:13:20 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Y8QR=RV=cloud.com=alejandro.vallejo@srs-se1.protection.inumbo.net>)
 id 1t4HJo-0003Rh-Ar
 for xen-devel@lists.xenproject.org; Fri, 25 Oct 2024 10:13:20 +0000
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com
 [2a00:1450:4864:20::62b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c204acd4-92b9-11ef-a0bf-8be0dac302b0;
 Fri, 25 Oct 2024 12:13:19 +0200 (CEST)
Received: by mail-ej1-x62b.google.com with SMTP id
 a640c23a62f3a-a99f3a5a44cso210312966b.3
 for <xen-devel@lists.xenproject.org>; Fri, 25 Oct 2024 03:13:19 -0700 (PDT)
Received: from localhost (0545937c.skybroadband.com. [5.69.147.124])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a9b3a085504sm52026566b.202.2024.10.25.03.13.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 25 Oct 2024 03:13:18 -0700 (PDT)
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
X-Inumbo-ID: c204acd4-92b9-11ef-a0bf-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1729851199; x=1730455999; darn=lists.xenproject.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KeVTMQsHMEwhgjJxC66PEy7GBuNP7yDgTFYVXaPQAWU=;
        b=VnuHh4PA/92J+gWyrPWvEveD0+L7XofylW8Pko4Oqt0Dj9bGfbFDgyykRgwplabxnx
         CLafSSKKPnvGqFGqT1ntjViCyVJ0V0J3NiEeypTlVXX2MBU2HUiGmUvFOtIW0ISeRhMJ
         bfqB1Ezcer1ZvredNIOrxnBVT9MJ6hCQmkQQQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729851199; x=1730455999;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=KeVTMQsHMEwhgjJxC66PEy7GBuNP7yDgTFYVXaPQAWU=;
        b=vdFayvMifJAfyPl5maVaNljYL1ykeeypSwp60S5GXUikhJtneljtxm9MWuRuW0WRIA
         UPkWllc7NEItFzu78vSznKvV/Tg5jmczcVVkBBys6htiCKz+TCv5f53Z8geJCsFl6lPw
         JJ73Bh1IOBi3tQNsDfGP6bwVUPywRdal02vleMRw2nJ0IM+8kXe80YSX+kybN5XhYhSJ
         uDYukVoZ3X727e1YNvgKZ0TaMn9tpYQFP05y4mLMr+h6xgUOCpuTGB9cx3yzPsS35yYi
         xIYEuEOHOCWrXFOeNesEWXH9anSdwfidx/9Qo/qx36qMItBsv32DsES+ZXmsomU77glb
         +r9g==
X-Forwarded-Encrypted: i=1; AJvYcCUq89LXNO/3QWY0RkoTwrhkfVTs6m2mgQLNlaAAQnzXWYAV8H3FQd9sLwd0Ty9UXk9rJE5h607Govg=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxrJ5eKbkMFEYNh4WUDTFEUZDKY34zt7P04BEH9ZukRNte0TGls
	cFQFg6hyXB/O1zfYKdUV5/UxP0LskSte34904jwtnMbjf5jSFCnngL4gsOQadcg=
X-Google-Smtp-Source: AGHT+IEw1plwCaPHDa2NG+j0GOFWn7wHxfcJqj6KaGebr/J7vAAkHBzp0mM1vBoYA0PbWaV76EqRyA==
X-Received: by 2002:a17:907:6e8f:b0:a99:e67a:d12d with SMTP id a640c23a62f3a-a9ad2814c0cmr458055666b.48.1729851198643;
        Fri, 25 Oct 2024 03:13:18 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 25 Oct 2024 11:13:16 +0100
Message-Id: <D54T2KXTWQ2O.9S4HEKD2X948@cloud.com>
Cc: "Jan Beulich" <JBeulich@suse.com>, =?utf-8?q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>
Subject: Re: [PATCH 0/5] x86/ucode: Minor cleanup
From: "Alejandro Vallejo" <alejandro.vallejo@cloud.com>
To: "Andrew Cooper" <andrew.cooper3@citrix.com>, "Xen-devel"
 <xen-devel@lists.xenproject.org>
X-Mailer: aerc 0.18.2
References: <20241024132205.987042-1-andrew.cooper3@citrix.com>
In-Reply-To: <20241024132205.987042-1-andrew.cooper3@citrix.com>

On Thu Oct 24, 2024 at 2:22 PM BST, Andrew Cooper wrote:
> Misc cleanup without functional change.  Mostly to improve clarity.
>
> Andrew Cooper (5):
>   x86/ucode: Rename hypercall-context functions
>   x86/ucode: Drop the parse_blob() wrapper
>   x86/ucode: Rename the cpu_request_microcode() hook to parse()
>   x86/ucode: Rename the apply_microcode() hook to load()
>   x86/ucode: Drop the match_reg[] field from AMD's microcode_patch
>
>  xen/arch/x86/cpu/microcode/amd.c     | 11 ++---
>  xen/arch/x86/cpu/microcode/core.c    | 72 +++++++++++++++-------------
>  xen/arch/x86/cpu/microcode/intel.c   | 12 ++---
>  xen/arch/x86/cpu/microcode/private.h |  9 ++--
>  xen/arch/x86/include/asm/microcode.h |  4 +-
>  xen/arch/x86/platform_hypercall.c    |  6 +--
>  6 files changed, 59 insertions(+), 55 deletions(-)
>
>
> base-commit: a974725a87a1afc8056b41c56dfe7fe272a7169c

IMO, this change warrants renaming the parent directory to ucode and
microcode.h to ucode.h.

Cheers,
Alejandro

