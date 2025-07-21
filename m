Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 32015B0C8AE
	for <lists+xen-devel@lfdr.de>; Mon, 21 Jul 2025 18:26:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1051670.1420046 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1udtLB-0005Xm-66; Mon, 21 Jul 2025 16:26:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1051670.1420046; Mon, 21 Jul 2025 16:26:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1udtLB-0005Vu-3a; Mon, 21 Jul 2025 16:26:13 +0000
Received: by outflank-mailman (input) for mailman id 1051670;
 Mon, 21 Jul 2025 16:26:11 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=YQHN=2C=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1udtL9-0005Vo-HF
 for xen-devel@lists.xenproject.org; Mon, 21 Jul 2025 16:26:11 +0000
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [2a00:1450:4864:20::330])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 69724184-664f-11f0-a31d-13f23c93f187;
 Mon, 21 Jul 2025 18:26:10 +0200 (CEST)
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-4563cfac2d2so31437595e9.3
 for <xen-devel@lists.xenproject.org>; Mon, 21 Jul 2025 09:26:10 -0700 (PDT)
Received: from localhost (112.pool92-178-7.dynamic.orange.es. [92.178.7.112])
 by smtp.gmail.com with UTF8SMTPSA id
 5b1f17b1804b1-4563b740c51sm104987295e9.19.2025.07.21.09.26.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Jul 2025 09:26:09 -0700 (PDT)
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
X-Inumbo-ID: 69724184-664f-11f0-a31d-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1753115170; x=1753719970; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=o7/3BRcJdxZo5nXxehCY657Fp2YgeS3RwMhKl6sHrDE=;
        b=jjoe5LKf2+aPfQcpXfRwnCCCkVk3qiMCKjSFlHMa9EFEgUiucC9/kKf1VGc+axpKn7
         ABXLy7shZzRXgYAg17Ddnc0sUetJta8SUeSOU9Fu+/T6Tk2MB20Vn2vUqY/3e337T4NQ
         YX/uAdLUf34jr7z2L3mTrCssjtcFcZ1TswRvA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753115170; x=1753719970;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=o7/3BRcJdxZo5nXxehCY657Fp2YgeS3RwMhKl6sHrDE=;
        b=ZtsPV8jUVPqu8xVjZG3AeeLbK2CZezJkFmNV4svfu2aFshxmWbOJcsEvgb/VpDrpGH
         doq3mtxWnnOehxtv/BhHPiERUMAjpXznSSBqdqJhgPNCuM0XBo7dsF/hWefCLwBe8ZDd
         Zq+arIAjswiItRf3lTVy74MYoSGcRjy55QPnSg9Uqlifee80Vwe3JZfogL1+l5Wob8LJ
         W6vhyPzCQBgnGQIbCurn3bAAdq2ei6MEKsehfy9nApKTpMpgia4MPAJwBPRiYsvtknnL
         MdoC8BHHs37CvhAvlg48HgGlEaKystgC8HNAT/3u3Amf8jbwlLVLan4QIKKHy/C6QjBD
         7/vw==
X-Gm-Message-State: AOJu0YzW2U7W/SvAk7k8hC8vieohRamWJvX8yQWZg6zHTxAqK56S7CG5
	LDiBwe1liQd6PrqPgTEuNOrrdJTtB2H2rqcXaLxLgQZytR/Ha9FB3cvBbpwF5mtzsho=
X-Gm-Gg: ASbGnctbPa+X4pA2LS9M/Jn5rIGKTY/g609LUBiBBG27Dl6XBRELS8kenibQE4sIZQo
	7OBj4CTIZsnhzKR/ti3W5Ji94gNqiCx+ZUiTYgqVq3sCPpBFdr0GRd1nQEXR46n4PksYf7ty+Wp
	IFY1EhvHjx609g1btX2zRxivQm4XRRS+A9QxOKnLKW82sI7LuIA9ovRraKx+N0EcCSnqYSvoQa0
	/y/K6lpxjBZKxXmiNkLTiILB1h/aE7Chya5yULJzWrdA6dNs0wqgwDX7ovqqcmiMyp+sWiO96EQ
	RgLzxga/FPeWMqVKYVFLplRMf0MdhFrBYrqrFDACdxSe4jundsmY9WVZaSI2b2uANYG6VBIrCMT
	KKSdloaYCEgTfmHjpRgfy27uXkuWGTseUkKuJY5ulIdJyDitI3ovnrkTFMP3VII+NOg==
X-Google-Smtp-Source: AGHT+IEVBC18SAU7XhDK+QLa4rbEnzS9C3yEdv7AbfrLecfzyxb5BPV8LbLXf+AkpNw5zCoMEdRAVQ==
X-Received: by 2002:a05:600c:c0d2:10b0:456:1d93:4365 with SMTP id 5b1f17b1804b1-4562e32e2dbmr124263735e9.5.1753115170152;
        Mon, 21 Jul 2025 09:26:10 -0700 (PDT)
Date: Mon, 21 Jul 2025 18:26:09 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Chen Jiqian <Jiqian.Chen@amd.com>
Subject: Re: [PATCH] x86: don't have gcc over-align data
Message-ID: <aH5qIavKdat1ExyY@macbook.local>
References: <f68299c4-7aba-4bac-a50c-182f3cb5686e@suse.com>
 <aH5TWXWFJ1IOH220@macbook.local>
 <92e2cb52-87e7-416f-b9af-8e31b2b3dbe5@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <92e2cb52-87e7-416f-b9af-8e31b2b3dbe5@suse.com>

On Mon, Jul 21, 2025 at 06:05:22PM +0200, Jan Beulich wrote:
> On 21.07.2025 16:48, Roger Pau Monné wrote:
> > On Wed, Jun 25, 2025 at 11:04:14AM +0200, Jan Beulich wrote:
> >> For (aiui) backwards compatibility reasons, gcc defaults to a mode that
> >> was the exclusive one up to gcc4.8, establishing 32-byte alignment for
> >> aggregates larger than a certain size. We don't rely on such, and hence
> >> we can do with the psABI-compliant 16-byte alignment.
> >>
> >> Savings in the build I'm looking at:
> >> - .data.ro_after_init		 344 bytes
> >> - .rodata + .data.rel.ro	1904 bytes
> >> - .init.*data.cf_clobber	 232 bytes
> >> - .init (overall)		 688 bytes
> >> - .data.read_mostly		 864 bytes
> >> - .data				 600 bytes
> >> - .bss				1472 bytes
> >>
> >> Overall xen-syms' _end happens to move down there by 2 pages.
> >>
> >> Clang doesn't support the option, presumably because they never over-
> >> aligned data.
> >>
> >> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> >>
> >> --- a/xen/arch/x86/arch.mk
> >> +++ b/xen/arch/x86/arch.mk
> >> @@ -8,6 +8,9 @@ CFLAGS += -DXEN_IMG_OFFSET=$(XEN_IMG_OFF
> >>  # Prevent floating-point variables from creeping into Xen.
> >>  CFLAGS += -msoft-float
> >>  
> >> +# Don't needlessly over-align larger aggregates.
> >> +CFLAGS-$(CONFIG_CC_IS_GCC) += -malign-data=abi
> > 
> > Instead of using CONFIG_CC_IS_GCC should be just use cc-option-add to
> > check for the option begin present, regardless of the underlying
> > compiler?
> 
> We could do so, but why would we want to, when all gcc versions we support
> know of the option and Clang has never had a need for it? cc-option-add
> is more overhead, and I think we want to avoid such, even if each individual
> instance contributes only a tiny bit to overall build time.

IIRC we only evaluate those once now, so the overhead would be
minimal.

Regardless:

Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>

Thanks, Roger.

