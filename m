Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C8325A83D9B
	for <lists+xen-devel@lfdr.de>; Thu, 10 Apr 2025 10:56:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.945024.1343296 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u2nhS-0005rB-RR; Thu, 10 Apr 2025 08:55:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 945024.1343296; Thu, 10 Apr 2025 08:55:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u2nhS-0005og-Ok; Thu, 10 Apr 2025 08:55:54 +0000
Received: by outflank-mailman (input) for mailman id 945024;
 Thu, 10 Apr 2025 08:55:53 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=lSg0=W4=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1u2nhR-0005oa-Ga
 for xen-devel@lists.xenproject.org; Thu, 10 Apr 2025 08:55:53 +0000
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [2a00:1450:4864:20::42d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9afa6ef7-15e9-11f0-9eac-5ba50f476ded;
 Thu, 10 Apr 2025 10:55:52 +0200 (CEST)
Received: by mail-wr1-x42d.google.com with SMTP id
 ffacd0b85a97d-39c0e0bc733so429419f8f.1
 for <xen-devel@lists.xenproject.org>; Thu, 10 Apr 2025 01:55:52 -0700 (PDT)
Received: from localhost ([84.78.159.3]) by smtp.gmail.com with UTF8SMTPSA id
 5b1f17b1804b1-43f235a5d31sm43637115e9.35.2025.04.10.01.55.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Apr 2025 01:55:51 -0700 (PDT)
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
X-Inumbo-ID: 9afa6ef7-15e9-11f0-9eac-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1744275351; x=1744880151; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=kwDEF5MhYDu7HWPnI5/tLs937tzbYElVH+AbgRc+mm0=;
        b=uOcSHkM1oXN42fG/ya9dy0GBQCJ7q4FdcNF8sW4K2qjvn5IMVcBPwE5BewDIsjyUeA
         Dy89UrgFPshjqLhj5/SgbFAIb/S/+aArz46M1do9C3YxSfuvzbk8viTQ5C/W1FfT4ohT
         lkMgGJfMis1/Ve6A6AtX9kwEDVzXe+9c5w7Ds=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744275351; x=1744880151;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=kwDEF5MhYDu7HWPnI5/tLs937tzbYElVH+AbgRc+mm0=;
        b=Ugkcef+kK4KcGHdlV0p14XsSKpEa1hXhsFdOH86v9Tbu3Z8+BbMaAkQcv1CiHa6E7M
         YzbL3gwSWxNk/xNa+yVUPz+zlwB8xFf3X6li7bHVJrKFCrS7/PE6NCb/beU3GpP7b5vg
         T3f5MZtWYwnS9+ZaoBXsfGXwPcHcM20pNyjueQPURaAxA7zeG7cXkhm2MVV4mw/Zh/zd
         oVD5fZFWdGrVqAF2hL9xqE/4Fcro7OWPqJSTqHOi8pe0kUDu0YM7fTmi44mM/wqda98r
         6rUjHEsxyr2kxDlTiVKe2gOxpwyo46aA0kEtm1GwMYzqd1cnbz46Qlabo6/t97MBw8bW
         s7Hg==
X-Gm-Message-State: AOJu0YwqKLavRzVQCPZHk5l+DIf6g+zqCeOiITJgz7dEhXf/vOn47CKU
	cKspTO1nQy+ANGTkJMIwEqdhqfUa2DpPsfctdsliF/JrDWwoJrkvRv2w8UjnvRc=
X-Gm-Gg: ASbGncsTjEFUwkvnqwOdiWhsjMWS/xf/o6IanMmS5FZyiHBcionVaz7E3y95eL4Rfjf
	3AnQhsUhfECW9z53V5juVsm5ZdorV69Oh6Xo4PZIwPEJ0ni4v6j03nk4gg3jHKf0czJKTaIpjE3
	JyjQcgs+lJtpicP3O5g2DsTuwSElMCAEJuevQbNbN/ALgvTC8rMej+YgjYLE603G89MXG+DT9z3
	1uoUiXzwHkm43yFAseEzwE9Q3GH9yoHMwD3USMM+BuqOryQuDAz0FoDeotmMMTunKCGmdvHKKJQ
	5Jnkb2pGJyhJoawXtXDhF5kIXOulCR0vcMyNPRnyETSXUA==
X-Google-Smtp-Source: AGHT+IGxkizmzjEt3l53HtPdEtEgsA5Jb788Bs8YEvPUo2NuXsMc7D9XRkIuFF1RrDWnSXvO3gYFaw==
X-Received: by 2002:a05:6000:1866:b0:391:a43:8bbd with SMTP id ffacd0b85a97d-39d8f4695bamr1518765f8f.21.1744275351568;
        Thu, 10 Apr 2025 01:55:51 -0700 (PDT)
Date: Thu, 10 Apr 2025 10:55:50 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Marek Marczykowski <marmarek@invisiblethingslab.com>,
	Daniel Smith <dpsmith@apertussolutions.com>
Subject: Re: [PATCH RESEND] x86/EFI: correct mkreloc header (field) reading
Message-ID: <Z_eHlgfeLxGh1Td3@macbook.lan>
References: <49b9d483-824d-4247-a642-f19f5c16fd5d@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <49b9d483-824d-4247-a642-f19f5c16fd5d@suse.com>

On Thu, Apr 10, 2025 at 09:45:15AM +0200, Jan Beulich wrote:
> With us now reading the full combined optional and NT headers, the
> subsequent reading of (and seeking to) NT header fields is wrong. Since
> PE32 and PE32+ NT headers are different anyway (beyond the image base
> oddity extending across both headers), switch to using a union. This
> allows to fetch the image base more directly then.
> 
> Additionally add checking to map_section(), which would have caught at
> least the wrong (zero) image size that we previously used.
> 
> Fixes: f7f42accbbbb ("x86/efi: Use generic PE/COFF structures")
> Reported-by: Roger Pau Monné <roger.pau@citrix.com>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>

Thanks, Roger.

