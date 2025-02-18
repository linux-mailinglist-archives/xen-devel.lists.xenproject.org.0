Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 92ECAA3977C
	for <lists+xen-devel@lfdr.de>; Tue, 18 Feb 2025 10:51:05 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.891172.1300241 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tkKFf-0002WC-NM; Tue, 18 Feb 2025 09:50:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 891172.1300241; Tue, 18 Feb 2025 09:50:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tkKFf-0002U2-Kf; Tue, 18 Feb 2025 09:50:51 +0000
Received: by outflank-mailman (input) for mailman id 891172;
 Tue, 18 Feb 2025 09:50:50 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=v6LV=VJ=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1tkKFe-0002Tw-Hi
 for xen-devel@lists.xenproject.org; Tue, 18 Feb 2025 09:50:50 +0000
Received: from mail-pl1-x631.google.com (mail-pl1-x631.google.com
 [2607:f8b0:4864:20::631])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d44cad8f-eddd-11ef-9896-31a8f345e629;
 Tue, 18 Feb 2025 10:50:48 +0100 (CET)
Received: by mail-pl1-x631.google.com with SMTP id
 d9443c01a7336-220dc3831e3so75400995ad.0
 for <xen-devel@lists.xenproject.org>; Tue, 18 Feb 2025 01:50:48 -0800 (PST)
Received: from localhost ([84.78.159.3]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-7324277f28asm9635087b3a.163.2025.02.18.01.50.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Feb 2025 01:50:46 -0800 (PST)
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
X-Inumbo-ID: d44cad8f-eddd-11ef-9896-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1739872247; x=1740477047; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=6a1TEBHAyykpjKANg+UjAEerTM05GHTB05O19QuKmMc=;
        b=p61Ca+x1eTaL7e/qmdC76D1Rzd8ooP9dNAEUwz57dkJCrQqtaz9rODjjeKIqTwL9Tv
         XeByKSaPdxLGLWRUc/6MjaZOr3XM4ZxOWOrffjHIkoDwZaZ9bLDw6RV77Cj0ZcneyQGJ
         cpDEjYInEwhbt0zB1QlEPca9zcH9lmtGO6TrM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739872247; x=1740477047;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6a1TEBHAyykpjKANg+UjAEerTM05GHTB05O19QuKmMc=;
        b=PIdPtLYMk7AuyaRnToEkD1zolsMJLqiBXw7Cqt5A0yo4gwDHMGtNnv4a5Wx6QRnBzl
         hwoCfcgzoE9fsBa5cTAW2ka1CeX92IUQ93Cg+X/duFEONv2zKPJ/Jmb9fOqgXdEPBLfy
         A1+emgc0klyKy5gruK2lUaroXaGgIjmvudtrrj+sTGPW+8l4FcFhl6jhuBn7yMnYW4Ry
         jDbZsri0ZIuHlxJyfMm0aDaHsZbRapddz2RS20AONl/AAILoU4Uk9ZpVROK+s4L77Y6A
         lNWEGOc8jKy02RfgO1eF0W7pfoC+br3KyPiW7/63Gls89PTBM7CpwXpt9Mj4z9EVPfAj
         JOdw==
X-Gm-Message-State: AOJu0Yw5GEzL2EsFHbuCD4dMPIPQ6ovRNkyXSniIPzqQsUM/ArAJBY1+
	QCfGIVOGY4L+360Yqp/Rq0sujZNQiOwXoklq7nKig9BUQifrcX3j+Xf8dY25q1HIOIiIjlTa2TT
	X
X-Gm-Gg: ASbGnct4DHbMHBgdc3efXUEnIngiQ3cwPZh08XAsVBp7dT5OuPEHRaj4L/jSPtAe00J
	9czU8Dm8gzIQlApM9Aimh+xG548q5I8nDmmUssftZ3vxLmYCw3uB8bY996y1w0j4i4etQQOBXHS
	UtaHT+PodbigTswxPC+OOtlkDuBH1pVm/R4+aqGjk2xWg7wEkM1v5EPaCAZ/LMY/pr+EdYrsFTW
	2UVDhTwnrE++m3jqVqTl6rsJQeVdaiPIwgyMSueIuSC+9TlevsvWWYIOrj3pkpNiDxWKb6HjgL+
	y7qcLnxiwuxG1JZJUXW/KJY3pQ==
X-Google-Smtp-Source: AGHT+IEiL0xrx3tySLgs9dyOfT+9rGcQzL/XNF/cPe29J2NJ88YrbxFXB35T9fIckmNl4/zyDmcvqA==
X-Received: by 2002:a05:6a00:3392:b0:730:9637:b2ff with SMTP id d2e1a72fcca58-73262200aaamr16815623b3a.7.1739872247098;
        Tue, 18 Feb 2025 01:50:47 -0800 (PST)
Date: Tue, 18 Feb 2025 10:50:41 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Ross Lagerwall <ross.lagerwall@citrix.com>
Cc: xen-devel@lists.xenproject.org, Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH v2] x86/ucode: Add option to scan microcode by default
Message-ID: <Z7RX8b-lVytTU0oB@macbook.local>
References: <20250217175011.3175683-1-ross.lagerwall@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250217175011.3175683-1-ross.lagerwall@citrix.com>

On Mon, Feb 17, 2025 at 05:50:11PM +0000, Ross Lagerwall wrote:
> A lot of systems automatically add microcode to the initramfs so it can
> be useful as a vendor policy to always scan for microcode. Add a Kconfig
> option to allow setting the default behaviour.
> 
> The default behaviour is unchanged since the new option defaults to
> "no".
> 
> Signed-off-by: Ross Lagerwall <ross.lagerwall@citrix.com>

Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>

Thanks, Roger.

