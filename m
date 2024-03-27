Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AB60488EC44
	for <lists+xen-devel@lfdr.de>; Wed, 27 Mar 2024 18:14:22 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.698672.1090660 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rpWqe-0003Hm-Ba; Wed, 27 Mar 2024 17:14:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 698672.1090660; Wed, 27 Mar 2024 17:14:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rpWqe-0003Fb-8s; Wed, 27 Mar 2024 17:14:00 +0000
Received: by outflank-mailman (input) for mailman id 698672;
 Wed, 27 Mar 2024 17:13:58 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=lksO=LB=cloud.com=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1rpWqc-0003FV-C4
 for xen-devel@lists.xenproject.org; Wed, 27 Mar 2024 17:13:58 +0000
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [2a00:1450:4864:20::32e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 656e8333-ec5d-11ee-afe3-a90da7624cb6;
 Wed, 27 Mar 2024 18:13:57 +0100 (CET)
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-4149783d9b0so187365e9.2
 for <xen-devel@lists.xenproject.org>; Wed, 27 Mar 2024 10:13:57 -0700 (PDT)
Received: from perard.uk.xensource.com (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 w17-20020adfcd11000000b0033e786abf84sm15317168wrm.54.2024.03.27.10.13.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 27 Mar 2024 10:13:56 -0700 (PDT)
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
X-Inumbo-ID: 656e8333-ec5d-11ee-afe3-a90da7624cb6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1711559637; x=1712164437; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=vu7suNCUX1YMKGA4SET/IwU/8+fAPUob1HodKRWXOiw=;
        b=chLgupd1nl8e4CXFvhPxgVMUJ3Y72Gj2U8DQAxY6u/OA4l47+GuU9bYc7n8MQZpp+H
         k1fajfyPDHHRtsUuX7u4C3K2/W0F9tKpC73msqld3Kg0nMFmKc+Cv8MBkcmz/6axotJw
         beIDeiNwwKke4MFoZXiPeqFqYn1OLLIE2woHw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711559637; x=1712164437;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vu7suNCUX1YMKGA4SET/IwU/8+fAPUob1HodKRWXOiw=;
        b=TafJZwg+FjnvAu3VreE11VymXcFz0jK0MNTZqFgFWdgTWuee2A2YpaWX+fS1Eij+so
         KtSWTjEzji0b7CmG2g93mNpuzb0R/kzyGI5Fn5UmAyR2NlqguxTn2GysO4YDYJQsvy0Y
         VB/NizjteVW0SpgCLlqeBkFXhmnu6mLBQQ5QB1mwRPSFujr7ETRa43bKc45WkguWV/Id
         JSggg3MFqPCJWAQSK+JJZ4YN4p0knbIWt1rHTvzsuF6jPjra8y1IY+3Zb23NqOrPrjuE
         8Zd9OXk90twxcjyhHaXNmOIw6ecUJ+i0C754VzDSk0M5PRi+gTEaCDz9wZBDNt8w+r+/
         1lyA==
X-Forwarded-Encrypted: i=1; AJvYcCUlXue41w1+v8J9cBt3KG8eoCO3LFMFFpLaZchbbpWMeh2umyEYQW5/fa+sPRatsujMTqfmm7aKUa69XC0aN7hpT7RONc9RJoh301XRwuk=
X-Gm-Message-State: AOJu0YxjLqAqxWeGLzhwrKLFhZY4MKkW71dzeQw8AJe8tWgZx3+K3ftI
	j1wfVGdE8ivHq5zIVMT+jl/93X7G+gypL6dTScDYSTpkhdnKSEJmWo3nLQuZ9Co=
X-Google-Smtp-Source: AGHT+IHuzwyfCe0U7WV3L9+qNX5m7LH+o76ieKYIT56YXzVsC6yBJ1zoRlezauX/mZrHEMHFIXhO1A==
X-Received: by 2002:a05:6000:ac3:b0:33e:64f3:65a5 with SMTP id di3-20020a0560000ac300b0033e64f365a5mr433896wrb.52.1711559636869;
        Wed, 27 Mar 2024 10:13:56 -0700 (PDT)
Date: Wed, 27 Mar 2024 17:13:55 +0000
From: Anthony PERARD <anthony.perard@cloud.com>
To: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@linaro.org>
Cc: David Woodhouse <dwmw@amazon.co.uk>, qemu-devel@nongnu.org,
	Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>,
	Paul Durrant <paul@xen.org>, qemu-arm@nongnu.org,
	Paolo Bonzini <pbonzini@redhat.com>,
	David Woodhouse <dwmw2@infradead.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Richard Henderson <richard.henderson@linaro.org>,
	xen-devel@lists.xenproject.org, qemu-block@nongnu.org,
	kvm@vger.kernel.org, Thomas Huth <thuth@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Eduardo Habkost <eduardo@habkost.net>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
Subject: Re: [PATCH-for-9.0 v2 15/19] hw/xen: Reduce inclusion of 'cpu.h' to
 target-specific sources
Message-ID: <5cac8283-2e26-44dd-b113-d8499a0ef618@perard>
References: <20231114143816.71079-1-philmd@linaro.org>
 <20231114143816.71079-16-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20231114143816.71079-16-philmd@linaro.org>

On Tue, Nov 14, 2023 at 03:38:11PM +0100, Philippe Mathieu-Daudé wrote:
> We rarely need to include "cpu.h" in headers. Including it
> 'taint' headers to be target-specific. Here only the i386/arm
> implementations requires "cpu.h", so include it there and
> remove from the "hw/xen/xen-hvm-common.h" *common* header.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> Reviewed-by: David Woodhouse <dwmw@amazon.co.uk>

Acked-by: Anthony PERARD <anthony.perard@citrix.com>

Thanks,

-- 
Anthony PERARD

