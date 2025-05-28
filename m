Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D6D2AC69AB
	for <lists+xen-devel@lfdr.de>; Wed, 28 May 2025 14:44:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.999393.1380093 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uKG8a-0008Ki-9A; Wed, 28 May 2025 12:44:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 999393.1380093; Wed, 28 May 2025 12:44:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uKG8a-0008I2-5r; Wed, 28 May 2025 12:44:04 +0000
Received: by outflank-mailman (input) for mailman id 999393;
 Wed, 28 May 2025 12:44:02 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=xyDt=YM=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1uKG8Y-0007rI-2W
 for xen-devel@lists.xenproject.org; Wed, 28 May 2025 12:44:02 +0000
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [2a00:1450:4864:20::434])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6dc4ddf2-3bc1-11f0-b894-0df219b8e170;
 Wed, 28 May 2025 14:44:00 +0200 (CEST)
Received: by mail-wr1-x434.google.com with SMTP id
 ffacd0b85a97d-3a36efcadb8so4216364f8f.0
 for <xen-devel@lists.xenproject.org>; Wed, 28 May 2025 05:44:00 -0700 (PDT)
Received: from localhost (112.pool92-178-7.dynamic.orange.es. [92.178.7.112])
 by smtp.gmail.com with UTF8SMTPSA id
 ffacd0b85a97d-3a4eac8a9aasm1415552f8f.51.2025.05.28.05.43.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 May 2025 05:43:59 -0700 (PDT)
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
X-Inumbo-ID: 6dc4ddf2-3bc1-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1748436240; x=1749041040; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=YCcVGjyu2hkgj2qT0Rfij8sRp8sN0oQaMCH5Sad8ZL4=;
        b=ijmBCbtPkR2JQK4umkGBkG25cHCfSFeHjCqkSXUh/n+52PgxbAufVaQxbcgqmmVCbx
         l2U9wkUBMVtZfmUn3YnO77ALlOy6SVsJ0cGVY3flFM2Z5F/Pm01zX1GNusxlyEencapM
         1updpHFCGhyUi+YQaoaOZaBubs7Y3zfHRQUKw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748436240; x=1749041040;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YCcVGjyu2hkgj2qT0Rfij8sRp8sN0oQaMCH5Sad8ZL4=;
        b=wAZ2nDAbVnKNGvMDqFTPWyc9hfrreDMFEGM4bZS/Q80yWFLtgtwF9WCHS8uBDaPUbT
         XC/9Om/+23Zlq2ihhTJIqY0UhuF7uVTCEqcaZzQ1Gd3vRIxJQp6gVct4d7NIc3B/JMQ3
         apdO6AbjCM1DoRrXCkjhFJ8x8xxQj9MT88+afLYv/iSG8ThXHltDfEO/Q0zVx5t7DHaO
         jSqrZYJElSY5z6DlkbcWLqCAxlnIddC2JSXL/4ltWqdhFh3VmvJfr+nYrWf0ezp/QKT/
         09IoAfHCqHqPwGXK5ObzVRd/LM483w9jWZc7OVIMqlJHUiSiawmKWgd3Xd7V5FQRUsi2
         imxw==
X-Gm-Message-State: AOJu0YxWNVVW2jbz/QHQSkGX1iTkwjugh2kpArXyxpJCZCqS+5kHq4ii
	67Xm79Cr/0Dr8QbqoKCVIkt4BP+cTgomv4fhw8ZPqs9je6lAR3ouMw9OXH89TP0BONgVIuFNQOQ
	MxtPw
X-Gm-Gg: ASbGncvq4zzFj9AdZEinaHfnSeeCx8m8jCM4b6Daz+mY6TABAMAXjgOZewOd46liD9F
	pxmE8gV75lsyxhmi9L9Vvx1ANmgadWwJPgbyqaTufIYeu+NAPmBr6LV2sKUFMx6dpNrXmyK9gAM
	eDJOZT7q8fo9tyu6GsxjYnz8CDKu2Hd1sSGTcEu10L9KsRVdlKdvm0IANvqXJBHHyaiDY3zXv9M
	9EktoPcHEczcWHaY7BnKn3duhjUrPtr1BcV36LjqcY7vRXkbfaPUtKm5CPUnd6Wfr+1RIe1N5c7
	rHxL9O+Mi2Fp3L0Rd2sScImn16IsY40746mRrabS1CmEoTQ8/tiATZQmWZM/MNRV4bAEP2ElRhR
	KuAn0i+CQZNwLjy2WP9stpbnSaYo1DA==
X-Google-Smtp-Source: AGHT+IF3p64LET0E4jjy8R/Zf7crxwxhF59fdEhskipX1i8Dh2+VwC0+vMeG/D3GogFIGIuY+jTlXw==
X-Received: by 2002:a05:6000:2288:b0:3a1:6e2b:85fa with SMTP id ffacd0b85a97d-3a4cb45e37amr14398161f8f.31.1748436240133;
        Wed, 28 May 2025 05:44:00 -0700 (PDT)
Date: Wed, 28 May 2025 14:43:58 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: xen-devel@lists.xenproject.org, Jan Beulich <JBeulich@suse.com>
Subject: Re: [PATCH] x86/setup: Trim includes
Message-ID: <aDcFDleHevlO54UR@macbook.local>
References: <20250527151302.63291-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250527151302.63291-1-andrew.cooper3@citrix.com>

On Tue, May 27, 2025 at 04:13:02PM +0100, Andrew Cooper wrote:
> None of these are used by setup.c today.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Acked-by: Roger Pau Monné <roger.pau@citrix.com>

Thanks, Roger.

